`default_nettype none

package sm83_nor8_alu_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_in3 = 0.0;
	parameter real L_in4 = 0.0;
	parameter real L_in5 = 0.0;
	parameter real L_in6 = 0.0;
	parameter real L_in7 = 0.0;
	parameter real L_in8 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 6*L_unit;
	parameter real W_gate_in2 = 6*L_unit;
	parameter real W_gate_in3 = 6*L_unit;
	parameter real W_gate_in4 = 6*L_unit;
	parameter real W_gate_in5 = 6*L_unit;
	parameter real W_gate_in6 = 6*L_unit;
	parameter real W_gate_in7 = 6*L_unit;
	parameter real W_gate_in8 = 6*L_unit;

endpackage

module sm83_nor8_alu #(
		parameter real L_y      = 50 + sm83_nor8_alu_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3, in4, in5, in6, in7, in8,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(in1 | in2 | in3 | in4 | in5 | in6 | in7 | in8);

	specify
		specparam T_rise_y = tpd_elmore(L_y, 8*R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y,   R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in3, in4, in5, in6, in7, in8 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
