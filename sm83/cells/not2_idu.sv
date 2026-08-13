`default_nettype none

package sm83_not2_idu_param;

	import sm83_timing::L_unit;

	parameter real L_a_in =  0.0;
	parameter real L_b_in =  0.0;
	parameter real L_a_y  = 40.0;
	parameter real L_b_y  = 20.0;

	parameter real W_gate_a_in = 17*L_unit;
	parameter real W_gate_b_in = 17*L_unit;

endpackage

module sm83_not2_idu #(
		parameter real L_a_y      = 41 + sm83_not2_idu_param::L_a_y,
		parameter real L_b_y      = 54 + sm83_not2_idu_param::L_b_y,
		parameter real W_gate_a_y = 0,
		parameter real W_gate_b_y = 0
	) (
		input  logic a_in, b_in,
		output logic a_y, b_y
	);

	import sm83_timing::*;

	assign a_y = !a_in;
	assign b_y = !b_in;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(12*L_unit), C_gate_F(W_gate_a_y));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_a_y));
		specparam T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm(12*L_unit), C_gate_F(W_gate_b_y));
		specparam T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_b_y));

		(a_in *> a_y) = (T_rise_a_y, T_fall_a_y);
		(b_in *> b_y) = (T_rise_b_y, T_fall_b_y);
	endspecify

endmodule

`default_nettype wire
