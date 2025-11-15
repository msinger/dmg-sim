`default_nettype none

module sm83_dlatch_ee_irq #(
		parameter real L_q         = 26,
		parameter real L_q_n       = 25,
		parameter real L_gated_q_n = 37
	) (
		input      logic d, ena, ena_n, pch_n,
		inout  tri logic ena_q_n, // Needs to propagate strength, therefore inout
		output     logic q, q_n, gated_q_n
	);

	import sm83_timing::*;

	tri logic gated_q;

	initial q_n = 0;

	always_latch if ((d && ena) || (!d && !ena_n)) q_n = !d;
	assign q = !q_n;

	bufif0 (strong1, highz0) (gated_q, '1, pch_n);
	rnmos (gated_q, ena_q_n, q_n & (ena_q_n !== 1));
	keeper gated_q_keeper(gated_q);
	assign gated_q_n = !gated_q;

	specify
		specparam T_rise_buf       = tpd_elmore(         34, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_buf       = tpd_elmore(         34, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_not       = tpd_elmore(         34, R_pmos_ohm( 3*L_unit));
		specparam T_fall_not       = tpd_elmore(         34, R_nmos_ohm( 3*L_unit));
		specparam T_rise_q_n       = tpd_elmore(      L_q_n, R_pmos_ohm(13*L_unit));
		specparam T_fall_q_n       = tpd_elmore(      L_q_n, R_nmos_ohm( 6*L_unit));
		specparam T_rise_q         = tpd_elmore(        L_q, R_pmos_ohm( 6*L_unit));
		specparam T_fall_q         = tpd_elmore(        L_q, R_nmos_ohm( 6*L_unit));
		specparam T_rise_gated_q   = tpd_elmore(         19, R_pmos_ohm( 6*L_unit));
		specparam T_fall_gated_q   = tpd_elmore(         19, R_nmos_ohm( 6*L_unit));
		specparam T_rise_gated_q_n = tpd_elmore(L_gated_q_n, R_pmos_ohm( 6*L_unit));
		specparam T_fall_gated_q_n = tpd_elmore(L_gated_q_n, R_nmos_ohm( 6*L_unit));

		(d, ena, ena_n *> q_n) = (T_rise_buf + T_fall_not + T_rise_q_n, T_fall_buf + T_rise_not + T_fall_q_n);
		(d, ena, ena_n *> q)   = (T_fall_buf + T_rise_not + T_fall_q_n + T_rise_q,
		                          T_rise_buf + T_fall_not + T_rise_q_n + T_fall_q);

		(pch_n, ena_q_n *> gated_q_n) = (T_fall_gated_q + T_rise_gated_q_n, T_rise_gated_q + T_fall_gated_q_n);
		(d, ena, ena_n  *> gated_q_n) = (T_rise_buf + T_fall_not + T_rise_q_n + T_fall_gated_q + T_rise_gated_q_n,
		                                 T_fall_buf + T_rise_not + T_fall_q_n + T_rise_gated_q + T_fall_gated_q_n);
	endspecify

endmodule

`default_nettype wire
