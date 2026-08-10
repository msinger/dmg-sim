`default_nettype none

package dmg_and4_param;

	import dmg_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_in3 = 0.0;
	parameter real L_in4 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 70*L_unit;
	parameter real W_gate_in2 = 70*L_unit;
	parameter real W_gate_in3 = 70*L_unit;
	parameter real W_gate_in4 = 70*L_unit;

endpackage

module dmg_and4 #(
		parameter real L_y      = 54 + dmg_and4_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3, in4,
		output logic y
	);

	import dmg_timing::*;

	assign y = in1 & in2 & in3 & in4;

	specify
		specparam T_rise_nand = tpd_elmore(140,   R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_fall_nand = tpd_elmore(140, 4*R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_rise_y    = tpd_elmore(L_y,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y    = tpd_elmore(L_y,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in3, in4 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
