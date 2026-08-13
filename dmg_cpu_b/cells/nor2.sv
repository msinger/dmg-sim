`default_nettype none

package dmg_nor2_param;

	import dmg_timing::L_unit;

	parameter real L_in1 = 57.5;
	parameter real L_in2 = 57.5;
	parameter real L_y   = 40.0;

	parameter real W_gate_in1 = 70*L_unit;
	parameter real W_gate_in2 = 70*L_unit;

endpackage

module dmg_nor2 #(
		parameter real L_y      = 54 + dmg_nor2_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2,
		output logic y
	);

	import dmg_timing::*;

	assign y = !(in1 | in2);

	specify
		specparam T_rise_y = tpd_elmore(L_y, 2*R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
