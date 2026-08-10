`default_nettype none

package dmg_nand3_param;

	import dmg_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_in3 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 70*L_unit;
	parameter real W_gate_in2 = 70*L_unit;
	parameter real W_gate_in3 = 70*L_unit;

endpackage

module dmg_nand3 #(
		parameter real L_y      = 54 + dmg_nand3_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import dmg_timing::*;

	assign y = !(in1 & in2 & in3);

	specify
		specparam T_rise_y = tpd_elmore(L_y,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, 3*R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in3 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
