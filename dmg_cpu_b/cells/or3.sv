`default_nettype none

package dmg_or3_param;

	import dmg_timing::L_unit;

	parameter real L_in1 = 57.5;
	parameter real L_in2 = 57.5;
	parameter real L_in3 = 57.5;
	parameter real L_y   = 36.7;

	parameter real W_gate_in1 = 70*L_unit;
	parameter real W_gate_in2 = 70*L_unit;
	parameter real W_gate_in3 = 70*L_unit;

endpackage

module dmg_or3 #(
		parameter real L_y      = 54 + dmg_or3_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import dmg_timing::*;

	assign y = in1 | in2 | in3;

	specify
		specparam T_rise_nor = tpd_elmore(135, 3*R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_fall_nor = tpd_elmore(135,   R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y   = tpd_elmore(L_y,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in3 *> y) = (T_fall_nor + T_rise_y, T_rise_nor + T_fall_y);
	endspecify

endmodule

`default_nettype wire
