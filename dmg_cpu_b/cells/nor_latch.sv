`default_nettype none

module dmg_nor_latch #(
		parameter real L_q   = 54,
		parameter real L_q_n = 54
	) (
		input  logic s, r,
		output logic q, q_n
	);

	import dmg_timing::*;

	always_latch if (s || r) begin
		q   = !r;
		q_n = !s;
	end

	specify
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(35*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit));

		(s *> q)   = (T_fall_q_n + T_rise_q, T_rise_q_n + T_fall_q);
		(r *> q)   = (T_rise_q, T_fall_q);
		(s *> q_n) = (T_rise_q_n, T_fall_q_n);
		(r *> q_n) = (T_fall_q + T_rise_q_n, T_rise_q + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
