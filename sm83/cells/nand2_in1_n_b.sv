`default_nettype none

package sm83_nand2_in1_n_b_param;

	import sm83_timing::L_unit;

	parameter real L_in1_n = 0.0;
	parameter real L_in2   = 0.0;
	parameter real L_y     = 0.0;

	parameter real W_gate_in1_n = 6*L_unit;
	parameter real W_gate_in2   = 6*L_unit;

endpackage

module sm83_nand2_in1_n_b #(
		parameter real L_y      = 14 + sm83_nand2_in1_n_b_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1_n, in2,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(!in1_n & in2);

	specify
		specparam T_rise_in1 = tpd_elmore( 19,   R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_fall_in1 = tpd_elmore( 19,   R_nmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y,   R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y   = tpd_elmore(L_y, 2*R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1_n *> y) = (T_fall_in1 + T_rise_y, T_rise_in1 + T_fall_y);
		(in2   *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
