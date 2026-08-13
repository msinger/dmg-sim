`default_nettype none

package sm83_dff_cc_ee_q_n_reg_wz_bit_param;

	import sm83_timing::L_unit;

	parameter real L_d     =  0.0;
	parameter real L_clk   = 19.4;
	parameter real L_clk_n = 26.5;
	parameter real L_ena   =  0.0;
	parameter real L_ena_n =  0.0;
	parameter real L_q_n   =  0.0;

	parameter real W_gate_d     = 6*L_unit;
	parameter real W_gate_clk   = 9*L_unit;
	parameter real W_gate_clk_n = 9*L_unit;
	parameter real W_gate_ena   = 3*L_unit;
	parameter real W_gate_ena_n = 3*L_unit;

endpackage

module sm83_dff_cc_ee_q_n_reg_wz_bit #(
		parameter real L_q_n      = 27 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n,
		parameter real W_gate_q_n = 0
	) (
		input  logic d, clk, clk_n, ena, ena_n,
		output logic q_n
	);

	import sm83_timing::*;

	logic ff;

	initial ff  = 0;
	initial q_n = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && !ena_n)) ff  <= d;
	always_latch if ((ff && clk) || (!ff && !clk_n))                q_n <= !ff;

	specify
		specparam T_rise_buf = tpd_elmore(   23, 2*R_pmos_ohm(3*L_unit), C_gate_F( 8*L_unit));
		specparam T_fall_buf = tpd_elmore(   23, 2*R_nmos_ohm(3*L_unit), C_gate_F( 8*L_unit));
		specparam T_rise_not = tpd_elmore(   35,   R_pmos_ohm(4*L_unit), C_gate_F(14*L_unit));
		specparam T_fall_not = tpd_elmore(   35,   R_nmos_ohm(4*L_unit), C_gate_F(14*L_unit));
		specparam T_rise_q_n = tpd_elmore(L_q_n,   R_pmos_ohm(8*L_unit), C_gate_F(W_gate_q_n));
		specparam T_fall_q_n = tpd_elmore(L_q_n,   R_nmos_ohm(6*L_unit), C_gate_F(W_gate_q_n));

		(clk, clk_n *> q_n) = (T_rise_buf + T_fall_not + T_rise_q_n, T_fall_buf + T_rise_not + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
