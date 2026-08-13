`default_nettype none

package dmg_not_x3_param;

	import dmg_timing::L_unit;

	parameter real L_in = 66.5;
	parameter real L_y  = 66.0;

	parameter real W_gate_in = 210*L_unit;

endpackage

module dmg_not_x3 #(
		parameter real L_y      = 54 + dmg_not_x3_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in,
		output logic y
	);

	import dmg_timing::*;

	assign y = !in;

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(105*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(105*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
