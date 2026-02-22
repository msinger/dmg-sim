`default_nettype none

module dmg_dlatch_ee_q #(
		parameter real L_q = 54
	) (
		input  logic d, ena, ena_n,
		output logic q
	);

	import dmg_timing::*;

	initial q = 0;

	always_latch if ((!d && ena) || (d && !ena_n)) q = d;

	specify
		specparam T_rise_buf = tpd_elmore( 61, R_pmos_ohm(10*L_unit));
		specparam T_fall_buf = tpd_elmore( 61, R_nmos_ohm(10*L_unit));
		specparam T_rise_not = tpd_elmore(101, R_pmos_ohm(10*L_unit));
		specparam T_fall_not = tpd_elmore(101, R_nmos_ohm(10*L_unit));
		specparam T_rise_q   = tpd_elmore(L_q, R_pmos_ohm(35*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q, R_nmos_ohm(35*L_unit));

		(d, ena, ena_n *> q) = (T_rise_buf + T_fall_not + T_rise_q, T_fall_buf + T_rise_not + T_fall_q);
	endspecify

endmodule

`default_nettype wire
