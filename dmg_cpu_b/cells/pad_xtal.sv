`default_nettype none

module dmg_pad_xtal #(
		parameter real L_clk_n = 200,
		parameter real L_out_pad = 0
	) (
		input  logic ena, in_pad,
		output logic clk_n, out_pad
	);

	import dmg_timing::*;

	logic     ena_n;
	tri logic clk;

	localparam realtime T_rise_not = tpd_elmore(130, R_pmos_ohm(7*L_unit));
	localparam realtime T_fall_not = tpd_elmore(130, R_nmos_ohm(7*L_unit));
	assign #(T_rise_not, T_fall_not) ena_n = !ena;

	localparam realtime T_rise_mux_d0 = tpd_elmore(130, R_pmos_ohm(7*L_unit));
	localparam realtime T_rise_mux_d1 = tpd_elmore(130, R_pmos_ohm(33));
	localparam realtime T_fall_mux_d1 = tpd_elmore(130, R_nmos_ohm(28));
	bufif0 (strong1, highz0) #(T_rise_mux_d0, 0) (clk, '1, ena);
	bufif0 (strong1, highz0) #(T_rise_mux_d1, 0) (clk, in_pad, ena_n);
	bufif1 (highz1, strong0) #(0, T_fall_mux_d1) (clk, in_pad, ena);
	keeper clk_keeper(clk);

	localparam realtime T_rise_out_pad = tpd_elmore(L_out_pad, R_pmos_ohm(62));
	localparam realtime T_fall_out_pad = tpd_elmore(L_out_pad, R_nmos_ohm(25));
	assign #(T_rise_out_pad, T_fall_out_pad) out_pad = !clk;

	localparam realtime T_rise_clk_n = tpd_elmore(L_clk_n, R_pmos_ohm(13.5));
	localparam realtime T_fall_clk_n = tpd_elmore(L_clk_n, R_nmos_ohm(10.8));
	assign #(T_rise_clk_n, T_fall_clk_n) clk_n = !clk;

endmodule

`default_nettype wire
