`default_nettype none

package dmg_pad_in_pu_param;

	import dmg_timing::L_unit;

	parameter real L_i_n = 252.0;
	parameter real L_pad =   0.0;

	parameter real W_gate_pad = 22*L_unit;

endpackage

module dmg_pad_in_pu #(
		parameter real L_i_n      = dmg_pad_in_pu_param::L_i_n,
		parameter real L_pad      = dmg_pad_in_pu_param::L_pad,
		parameter real W_gate_i_n = 0,
		parameter real W_gate_pad = 0
	) (
		output     logic i_n,
		inout  tri logic pad
	);

	import dmg_timing::*;

	assign (pull1, highz0) pad = '1;

	localparam realtime T_rise_i_n = tpd_elmore(L_i_n, R_pmos_ohm(15*L_unit), C_gate_F(W_gate_i_n));
	localparam realtime T_fall_i_n = tpd_elmore(L_i_n, R_nmos_ohm( 7*L_unit), C_gate_F(W_gate_i_n));
	assign #(T_rise_i_n, T_fall_i_n) i_n = !pad;

endmodule

`default_nettype wire
