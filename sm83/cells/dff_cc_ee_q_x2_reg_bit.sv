`default_nettype none

module sm83_dff_cc_ee_q_x2_reg_bit #(
		parameter real L_q = 33
	) (
		input  logic d, clk, clk_n, ena, ena_n,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && !ena_n)) ff <= d;
	always_latch if ((ff && clk) || (!ff && !clk_n))                q  <= ff;

	specify
		specparam T_rise_buf = tpd_elmore( 21, R_pmos_ohm( 3.0*L_unit) * 2);
		specparam T_fall_buf = tpd_elmore( 21, R_nmos_ohm( 3.0*L_unit) * 2);
		specparam T_rise_q   = tpd_elmore(L_q, R_pmos_ohm(27.0*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q, R_nmos_ohm(13.5*L_unit));

		(clk, clk_n *> q) = (T_fall_buf + T_rise_q, T_rise_buf + T_fall_q);
	endspecify

endmodule

`default_nettype wire
