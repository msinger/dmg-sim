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

	logic     [W-1:0] mem[4][N/4];
	logic     [W-1:0] last_bl_data[4];
	tri logic [W-1:0] common_bl_data;
	int               last_wl_adr, wl_adr;
	bit               wl_adr_valid;

	initial foreach (mem[i,j])        mem[i][j] = '0;
	initial foreach (last_bl_data[i]) last_bl_data[i] = 'z;
	initial last_wl_adr     = -1;
	initial wl_adr_valid    = 0;

	assign wl_adr = ((a == ~a_n) && wl_adr_valid) ? a[A-1:2] : -1;

	always_latch begin
		if (!wldrv_pch_n) begin
			last_wl_adr  = -1;
			wl_adr_valid = 1;
		end else if (wldrv_ena) begin
			if (last_wl_adr == -1 && wl_adr != -1)
				last_wl_adr = wl_adr;
			else if (wl_adr == -1 || last_wl_adr != wl_adr)
				wl_adr_valid = 0;
		end
	end

	always_latch begin
		if (!bl_pch_n)
			foreach (last_bl_data[i])
				last_bl_data[i] = 'z;

		if (wr && bl_pch_n)
			foreach (last_bl_data[i])
				if (col[i]) last_bl_data[i] = din;

		if (wl_adr != -1 && wl_adr < N/4 && wldrv_ena)
			foreach (last_bl_data[i])
				if (!$isunknown(last_bl_data[i])) mem[i][wl_adr] = last_bl_data[i];

		if (bl_pch_n && wldrv_ena)
			foreach (last_bl_data[i])
				last_bl_data[i] = (wl_adr != -1 && wl_adr < N/4) ? mem[i][wl_adr] : 'z;
	end

	generate
		for (genvar i = 0; i < 4; i++)
			assign common_bl_data = col[i] ? last_bl_data[i] : 'z;
	endgenerate

	keeper #(W) common_bl_data_keeper(common_bl_data);

	assign dout = ~(~common_bl_data); /* double complement to convert 'z -> 'x */

/*
	// Just for debugging:
	logic [W-1:0] a_bl0, a_bl1, a_bl2, a_bl3, b_bl0, b_bl1, b_bl2, b_bl3, a_com, b_com;
	// OAM A has data lines complemented and bit order reversed
	assign a_bl0 = ~{last_bl_data[0][0], last_bl_data[0][1], last_bl_data[0][2], last_bl_data[0][3], last_bl_data[0][4], last_bl_data[0][5], last_bl_data[0][6], last_bl_data[0][7]};
	assign a_bl1 = ~{last_bl_data[1][0], last_bl_data[1][1], last_bl_data[1][2], last_bl_data[1][3], last_bl_data[1][4], last_bl_data[1][5], last_bl_data[1][6], last_bl_data[1][7]};
	assign a_bl2 = ~{last_bl_data[2][0], last_bl_data[2][1], last_bl_data[2][2], last_bl_data[2][3], last_bl_data[2][4], last_bl_data[2][5], last_bl_data[2][6], last_bl_data[2][7]};
	assign a_bl3 = ~{last_bl_data[3][0], last_bl_data[3][1], last_bl_data[3][2], last_bl_data[3][3], last_bl_data[3][4], last_bl_data[3][5], last_bl_data[3][6], last_bl_data[3][7]};
	assign a_com = ~{common_bl_data[0], common_bl_data[1], common_bl_data[2], common_bl_data[3], common_bl_data[4], common_bl_data[5], common_bl_data[6], common_bl_data[7]};
	// OAM B has data lines complemented but not reversed
	assign b_bl0 = ~last_bl_data[0];
	assign b_bl1 = ~last_bl_data[1];
	assign b_bl2 = ~last_bl_data[2];
	assign b_bl3 = ~last_bl_data[3];
	assign b_com = ~common_bl_data;
*/

endmodule

`default_nettype wire
