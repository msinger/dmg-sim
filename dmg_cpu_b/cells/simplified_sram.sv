`default_nettype none

module dmg_simplified_sram #(
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

	logic [W-1:0] mem[N];
	logic [W-1:0] last_bl_data;
	int           last_wl_adr, wl_adr, col_adr, adr;
	bit           wl_adr_valid;

	initial foreach (mem[i]) mem[i] = '0;
	initial last_bl_data  = 'x;
	initial last_wl_adr   = -1;
	initial wl_adr_valid  = 0;

	assign wl_adr = ((a == ~a_n) && wl_adr_valid) ? { a[A-1:2], 2'b00 } : -1;

	always_comb case (col)
		'b0001:  col_adr = 0;
		'b0010:  col_adr = 1;
		'b0100:  col_adr = 2;
		'b1000:  col_adr = 3;
		default: col_adr = -1;
	endcase

	assign adr = (wl_adr < N) ? (wl_adr | col_adr) : -1;

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
			last_bl_data = 'x;

		if (wr) begin
			if (bl_pch_n)
				last_bl_data = din;

			if (adr != -1 && wldrv_ena && !$isunknown(last_bl_data))
				mem[adr] = last_bl_data;
		end

		if (bl_pch_n && wldrv_ena)
			last_bl_data = (adr != -1) ? mem[adr] : 'x;
	end

	assign dout = $isunknown(last_bl_data) ? '1 : last_bl_data;

endmodule

`default_nettype wire
