`default_nettype none

package sm83_nand2_a_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 11.1;
	parameter real L_in2 = 11.2;
	parameter real L_y   = 14.7;

	parameter real W_gate_in1 = 6*L_unit;
	parameter real W_gate_in2 = 6*L_unit;

endpackage

module sm83_nand2_a #(
		parameter real L_y      = sm83_nand2_a_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(in1 & in2);

	specify
		specparam T_rise_y = tpd_elmore(L_y,   R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, 2*R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
