`default_nettype none

module dmg_generic_sram #(
		parameter int  N,
		parameter int  W = 8,
		parameter int  A = $clog2(N)
	) (
		input  logic [W-1:0] din,
		output logic [W-1:0] dout,
		input  logic [3:0]   col,
		input  logic [A-1:2] a, a_n,
		input  logic         wr, bl_pch_n, wldrv_pch_n, wldrv_ena
	);

	logic     [W-1:0]   mem[4][N/4];
	logic     [W-1:0]   bl[4];
	tri logic [W-1:0]   com;
	bit       [W-1:0]   last_good_com;
	logic     [N/4-1:0] wl;

	initial foreach (mem[i,j]) mem[i][j] = '0;
	initial foreach (bl[i])    bl[i]     = 'z;
	initial                    wl        = '0;

	/* Calculate which word lines are enabled.
	 * Normally this is only one, but when address changes without precharging,
	 * then multiple will stick enabled, short-circuiting selected bits within
	 * each column. */
	generate for (genvar i = 0; i < N/4; i++)
		always @* if (!wldrv_pch_n)
			wl[i] = 0;
		else begin
			logic tmp;
			tmp = wldrv_ena;
			for (int j = 2; (j < A) && (tmp !== 0); j++)
				if (i & (1 << (j - 2)))
					tmp &= a[j];
				else
					tmp &= a_n[j];
			wl[i] |= tmp;
		end
	endgenerate

	always_latch begin
		/* Precharge bit lines if requested. */
		if (!bl_pch_n)
			foreach (bl[i])
				bl[i] = 'z;

		/* If write signal is enabled, set all selected bit lines to data input.
		 * This should usually only be a single bit line, but during address line
		 * state transitions multiple ones could temporarily be selected at once. */
		if (wr)
			foreach (bl[i])
				if (col[i]) bl[i] = din;

		/* Drive bits with enabled word lines onto their respective bit lines, but in a first come
		 * first serve manner. In other words: The first bit that gets enabled after the bit line
		 * was precharged defines its state. All bits that get enabled later will loose and
		 * will eventually be overwritten down below. */
		foreach (bl[i,k])
			if (bl[i][k] === 'z)
				foreach (wl[j])
					if (wl[j])
						bl[i][k] = mem[i][j][k];

		/* If multiple bit lines are merged onto the common bit line and cause an undefined state,
		 * resolve that by setting the last good state of the common bit line to all selected bit lines. */
		foreach (com[k])
			if ($isunknown(com[k]))
				foreach (bl[i])
					if (col[i] && bl[i][k] ==! 'z)
						bl[i][k] = last_good_com[k];

		/* Update any bits in memory for which word line is enabled and bit line is not undefined. */
		foreach (bl[i])
			foreach (wl[j])
				if (wl[j])
					for (int k = 0; k < W; k++)
						if (!$isunknown(bl[i][k])) mem[i][j][k] = bl[i][k];
	end

	generate for (genvar i = 0; i < 4; i++)
		assign com = col[i] ? bl[i] : 'z;
	endgenerate

	keeper #(W) com_keeper(com);

	generate for (genvar i = 0; i < W; i++)
		always @* if (!$isunknown(com[i])) last_good_com[i] = com[i];
	endgenerate

	assign dout = last_good_com;

	// Just for debugging:
	logic [W-1:0] bl0, bl1, bl2, bl3;
	assign bl0 = bl[0];
	assign bl1 = bl[1];
	assign bl2 = bl[2];
	assign bl3 = bl[3];

endmodule

`default_nettype wire
