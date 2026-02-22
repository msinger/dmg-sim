`default_nettype none

module dmg_dlatch #(
		parameter real L_q   = 54,
		parameter real L_q_n = 54
	) (
		input  logic d, ena,
		output logic q, q_n
	);

	import dmg_timing::*;

	initial q = 0;

	always_latch if (ena) q = d;
	assign q_n = !q;

	specify
		specparam T_rise_buf  = tpd_elmore(   73, R_pmos_ohm(10*L_unit));
		specparam T_fall_buf  = tpd_elmore(   73, R_nmos_ohm(10*L_unit));
		specparam T_rise_not1 = tpd_elmore(  102, R_pmos_ohm(12*L_unit));
		specparam T_fall_not1 = tpd_elmore(  102, R_nmos_ohm(12*L_unit));
		specparam T_rise_not2 = tpd_elmore(   58, R_pmos_ohm(12*L_unit));
		specparam T_fall_not2 = tpd_elmore(   58, R_nmos_ohm(12*L_unit));
		specparam T_rise_not3 = tpd_elmore(  101, R_pmos_ohm(10*L_unit));
		specparam T_fall_not3 = tpd_elmore(  101, R_nmos_ohm(10*L_unit));
		specparam T_rise_not4 = tpd_elmore(  127, R_pmos_ohm(10*L_unit));
		specparam T_fall_not4 = tpd_elmore(  127, R_nmos_ohm(10*L_unit));
		specparam T_rise_q    = tpd_elmore(  L_q, R_pmos_ohm(35*L_unit));
		specparam T_fall_q    = tpd_elmore(  L_q, R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n  = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n  = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit));

		(d   *> q)   = (T_rise_buf + T_fall_not3 + T_rise_q, T_fall_buf + T_rise_not3 + T_fall_q);
		(ena *> q)   = (T_fall_not1 + T_rise_buf + T_fall_not3 + T_rise_q,
		                T_fall_not1 + T_rise_not2 + T_fall_buf + T_rise_not3 + T_fall_q);
		(d   *> q_n) = (T_fall_buf + T_rise_not3 + T_fall_not4 + T_rise_q_n,
		                T_rise_buf + T_fall_not3 + T_rise_not4 + T_fall_q_n);
		(ena *> q_n) = (T_fall_not1 + T_rise_not2 + T_fall_buf + T_rise_not3 + T_fall_not4 + T_rise_q_n,
		                T_fall_not1 + T_rise_buf + T_fall_not3 + T_rise_not4 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
