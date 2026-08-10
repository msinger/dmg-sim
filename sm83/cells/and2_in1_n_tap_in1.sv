`default_nettype none

package sm83_and2_in1_n_tap_in1_param;

	import sm83_timing::L_unit;

	parameter real L_in1_n   = 0.0;
	parameter real L_in2     = 0.0;
	parameter real L_y       = 0.0;
	parameter real L_tap_in1 = 0.0;

	parameter real W_gate_in1_n = 6*L_unit;
	parameter real W_gate_in2   = 6*L_unit;

endpackage

module sm83_and2_in1_n_tap_in1 #(
		parameter real L_y            = 10 + sm83_and2_in1_n_tap_in1_param::L_y,
		parameter real L_tap_in1      = 32 + sm83_and2_in1_n_tap_in1_param::L_tap_in1,
		parameter real W_gate_y       = 0,
		parameter real W_gate_tap_in1 = 0
	) (
		input  logic in1_n, in2,
		output logic y, tap_in1
	);

	import sm83_timing::*;

	assign tap_in1 = !in1_n;
	assign y       = tap_in1 & in2;

	specify
		specparam T_rise_in1  = tpd_elmore(L_tap_in1,   R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit+W_gate_tap_in1));
		specparam T_fall_in1  = tpd_elmore(L_tap_in1,   R_nmos_ohm(3*L_unit), C_gate_F(6*L_unit+W_gate_tap_in1));
		specparam T_rise_nand = tpd_elmore(       40,   R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_fall_nand = tpd_elmore(       40, 2*R_nmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_rise_y    = tpd_elmore(      L_y,   R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y    = tpd_elmore(      L_y,   R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1_n *> y)       = (T_rise_in1 + T_fall_nand + T_rise_y, T_fall_in1 + T_rise_nand + T_fall_y);
		(in2   *> y)       = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
		(in1_n *> tap_in1) = (T_rise_in1, T_fall_in1);
	endspecify

endmodule

`default_nettype wire
