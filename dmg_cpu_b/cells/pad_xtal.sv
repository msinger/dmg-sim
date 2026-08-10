`default_nettype none

package dmg_pad_xtal_param;

	import dmg_timing::L_unit;

	parameter real L_ena     = 0.0;
	parameter real L_clk_n   = 0.0;
	parameter real L_in_pad  = 0.0;
	parameter real L_out_pad = 0.0;

	parameter real W_gate_ena    = 83*L_unit;
	parameter real W_gate_in_pad = 0;

endpackage

module dmg_pad_xtal #(
		parameter real L_clk_n        = 200 + dmg_pad_xtal_param::L_clk_n,
		parameter real L_out_pad      = dmg_pad_xtal_param::L_out_pad,
		parameter real W_gate_clk_n   = 0,
		parameter real W_gate_out_pad = 0
	) (
		input  logic ena, in_pad,
		output logic clk_n, out_pad
	);

	import dmg_timing::*;

	logic     ena_n;
	tri logic clk;

	localparam realtime T_rise_not = tpd_elmore(130, R_pmos_ohm(7*L_unit), C_gate_F(72*L_unit));
	localparam realtime T_fall_not = tpd_elmore(130, R_nmos_ohm(7*L_unit), C_gate_F(72*L_unit));
	assign #(T_rise_not, T_fall_not) ena_n = !ena;

	localparam realtime T_rise_mux_d0 = tpd_elmore(130, R_pmos_ohm( 7*L_unit), C_gate_F(245*L_unit));
	localparam realtime T_rise_mux_d1 = tpd_elmore(130, R_pmos_ohm(33*L_unit), C_gate_F(245*L_unit));
	localparam realtime T_fall_mux_d1 = tpd_elmore(130, R_nmos_ohm(28*L_unit), C_gate_F(245*L_unit));
	bufif0 (strong1, highz0) #(T_rise_mux_d0, T_fall_mux_d1) (clk, '1, ena);
	bufif0 (strong1, highz0) #(T_rise_mux_d1, T_fall_mux_d1) (clk, in_pad, ena_n);
	bufif1 (highz1, strong0) #(T_rise_mux_d1, T_fall_mux_d1) (clk, in_pad, ena);
	keeper clk_keeper(clk);

	localparam realtime T_rise_out_pad = tpd_elmore(L_out_pad, R_pmos_ohm(62*L_unit), C_gate_F(W_gate_out_pad));
	localparam realtime T_fall_out_pad = tpd_elmore(L_out_pad, R_nmos_ohm(25*L_unit), C_gate_F(W_gate_out_pad));
	assign #(T_rise_out_pad, T_fall_out_pad) out_pad = !clk;

	localparam realtime T_rise_clk_n = tpd_elmore(L_clk_n, R_pmos_ohm(13.5*L_unit), C_gate_F(W_gate_clk_n));
	localparam realtime T_fall_clk_n = tpd_elmore(L_clk_n, R_nmos_ohm(10.8*L_unit), C_gate_F(W_gate_clk_n));
	assign #(T_rise_clk_n, T_fall_clk_n) clk_n = !clk;

endmodule

`default_nettype wire
