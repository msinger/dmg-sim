`default_nettype none

package sm83_not5_irq_param;

	import sm83_timing::L_unit;

	parameter real L_a_in = 0.0;
	parameter real L_b_in = 0.0;
	parameter real L_c_in = 0.0;
	parameter real L_d_in = 0.0;
	parameter real L_e_in = 0.0;
	parameter real L_a_y  = 0.0;
	parameter real L_b_y  = 0.0;
	parameter real L_c_y  = 0.0;
	parameter real L_d_y  = 0.0;
	parameter real L_e_y  = 0.0;

	parameter real W_gate_a_in = 10*L_unit;
	parameter real W_gate_b_in = 10*L_unit;
	parameter real W_gate_c_in = 10*L_unit;
	parameter real W_gate_d_in = 22*L_unit;
	parameter real W_gate_e_in = 22*L_unit;

endpackage

module sm83_not5_irq #(
		parameter real L_a_y      = 59 + sm83_not5_irq_param::L_a_y,
		parameter real L_b_y      = 58 + sm83_not5_irq_param::L_b_y,
		parameter real L_c_y      = 17 + sm83_not5_irq_param::L_c_y,
		parameter real L_d_y      = 34 + sm83_not5_irq_param::L_d_y,
		parameter real L_e_y      = 12 + sm83_not5_irq_param::L_e_y,
		parameter real W_gate_a_y = 0,
		parameter real W_gate_b_y = 0,
		parameter real W_gate_c_y = 0,
		parameter real W_gate_d_y = 0,
		parameter real W_gate_e_y = 0
	) (
		input  logic a_in, b_in, c_in, d_in, e_in,
		output logic a_y, b_y, c_y, d_y, e_y
	);

	import sm83_timing::*;

	assign a_y = !a_in;
	assign b_y = !b_in;
	assign c_y = !c_in;
	assign d_y = !d_in;
	assign e_y = !e_in;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm( 5*L_unit), C_gate_F(W_gate_a_y));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_a_y));
		specparam T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm( 5*L_unit), C_gate_F(W_gate_b_y));
		specparam T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_b_y));
		specparam T_rise_c_y = tpd_elmore(L_c_y, R_pmos_ohm( 5*L_unit), C_gate_F(W_gate_c_y));
		specparam T_fall_c_y = tpd_elmore(L_c_y, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_c_y));
		specparam T_rise_d_y = tpd_elmore(L_d_y, R_pmos_ohm(14*L_unit), C_gate_F(W_gate_d_y));
		specparam T_fall_d_y = tpd_elmore(L_d_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_d_y));
		specparam T_rise_e_y = tpd_elmore(L_e_y, R_pmos_ohm(14*L_unit), C_gate_F(W_gate_e_y));
		specparam T_fall_e_y = tpd_elmore(L_e_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_e_y));

		(a_in *> a_y) = (T_rise_a_y, T_fall_a_y);
		(b_in *> b_y) = (T_rise_b_y, T_fall_b_y);
		(c_in *> c_y) = (T_rise_c_y, T_fall_c_y);
		(d_in *> d_y) = (T_rise_d_y, T_fall_d_y);
		(e_in *> e_y) = (T_rise_e_y, T_fall_e_y);
	endspecify

endmodule

`default_nettype wire
