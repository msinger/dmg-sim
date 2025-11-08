`default_nettype none

module sm83_dffn_ee_q_alu_tmp #(
		parameter real L_q = 84
	) (
		input  logic d, clk_n, ena, ena_n,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n && ena) || (!d && clk_n && !ena_n)) ff <= d;
	always_latch if ((ff && !clk_n) || (!ff && !clk_n))              q  <= ff;

	specify
		specparam T_rise_not = tpd_elmore( 66, R_pmos_ohm(15.0*L_unit));
		specparam T_fall_not = tpd_elmore( 66, R_nmos_ohm( 5.0*L_unit));
		specparam T_rise_buf = tpd_elmore( 58, R_pmos_ohm( 3.0*L_unit) * 2);
		specparam T_fall_buf = tpd_elmore( 58, R_nmos_ohm( 3.0*L_unit) * 2);
		specparam T_rise_q   = tpd_elmore(L_q, R_pmos_ohm(10.5*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q, R_nmos_ohm( 5.0*L_unit));

		(clk_n *> q) = (T_rise_not + T_fall_buf + T_rise_q, T_fall_not + T_rise_buf + T_fall_q);
	endspecify

endmodule

`default_nettype wire
