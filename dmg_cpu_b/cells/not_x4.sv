`default_nettype none

package dmg_not_x4_param;

	import dmg_timing::L_unit;

	parameter real L_in = 71.4;
	parameter real L_y  = 76.1;

	parameter real W_gate_in = 280*L_unit;

endpackage

module dmg_not_x4 #(
		parameter real L_y      = 54 + dmg_not_x4_param::L_y,
		parameter real W_y      = 140,
		parameter real W_gate_y = 0
	) (
		input  logic in,
		output logic y
	);

	import dmg_timing::*;

	assign y = !in;

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(W_y*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(W_y*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
