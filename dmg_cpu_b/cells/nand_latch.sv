`default_nettype none

module dmg_nand_latch #(
		parameter real L_q   = 54,
		parameter real L_q_n = 54
	) (
		input  logic s_n, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	always_latch if (!s_n || !r_n) begin
		q   = !s_n;
		q_n = !r_n;
	end

	specify
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(35*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit));

		(s_n *> q)   = (T_rise_q, T_fall_q);
		(r_n *> q)   = (T_fall_q_n + T_rise_q, T_rise_q_n + T_fall_q);
		(s_n *> q_n) = (T_fall_q + T_rise_q_n, T_rise_q + T_fall_q_n);
		(r_n *> q_n) = (T_rise_q_n, T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
