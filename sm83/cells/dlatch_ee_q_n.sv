`default_nettype none

module sm83_dlatch_ee_q_n #(
		parameter real L_q_n = 45
	) (
		input  logic d, ena, ena_n,
		output logic q_n
	);

	import sm83_timing::*;

	initial q_n = 0;

	always_latch if ((d && ena) || (!d && !ena_n)) q_n = !d;

	specify
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(3*L_unit) * 2);

		(d, ena, ena_n *> q_n) = (T_rise_q_n, T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
