`default_nettype none

module sm83_srlatch_r_n_alt #(
		parameter real L_q = 19
	) (
		input  logic s, r_n,
		output logic q
	);

	import sm83_timing::*;

	always_latch if (!r_n || s) q = s & r_n;

	specify
		specparam T_rise_sr = tpd_elmore( 42, R_pmos_ohm(16.5*L_unit));
		specparam T_fall_sr = tpd_elmore( 42, R_nmos_ohm(16.5*L_unit) * 2);
		specparam T_rise_q  = tpd_elmore(L_q, R_pmos_ohm(11.0*L_unit));
		specparam T_fall_q  = tpd_elmore(L_q, R_nmos_ohm( 5.0*L_unit));

		(s, r_n *> q) = (T_fall_sr + T_rise_q, T_rise_sr + T_fall_q);
	endspecify

endmodule

`default_nettype wire
