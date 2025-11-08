`default_nettype none

module sm83_dff_cc_ee_q_n_reg_wz_bit #(
		parameter real L_q_n = 27
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
		specparam T_rise_buf = tpd_elmore(   23, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_buf = tpd_elmore(   23, R_nmos_ohm(3*L_unit) * 2);
		specparam T_rise_not = tpd_elmore(   35, R_pmos_ohm(4*L_unit));
		specparam T_fall_not = tpd_elmore(   35, R_nmos_ohm(4*L_unit));
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(8*L_unit));
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(6*L_unit));

		(clk, clk_n *> q_n) = (T_rise_buf + T_fall_not + T_rise_q_n, T_fall_buf + T_rise_not + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
