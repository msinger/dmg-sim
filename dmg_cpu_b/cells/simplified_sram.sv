`default_nettype none

module dmg_simplified_sram #(
		parameter int      N,
		parameter int      W = 8,
		parameter int      A = $clog2(N),
		parameter realtime T_rise_wl = 0.0,
		parameter realtime T_fall_wl = 0.0
	) (
		input  logic [W-1:0] din,
		output logic [W-1:0] dout,
		input  logic [3:0]   col,
		input  logic [A-1:2] a, a_n,
		input  logic         wr, bl_pch_n, wldrv_pch_n, wldrv_ena
	);

	logic [W-1:0] mem[N];
	logic [W-1:0] last_bl_data;
	int           wl_adr, col_adr, adr;

	initial foreach (mem[i]) mem[i] = '0;
	initial last_bl_data  = 'x;

	assign wl_adr = (a == ~a_n) ? { a[A-1:2], 2'b00 } : -1;

	always_comb case (col)
		'b0001:  col_adr = 0;
		'b0010:  col_adr = 1;
		'b0100:  col_adr = 2;
		'b1000:  col_adr = 3;
		default: col_adr = -1;
	endcase

	assign adr = (wl_adr < N) ? (wl_adr | col_adr) : -1;

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
