`default_nettype none

package dmg_nor_latch_param;

	import dmg_timing::L_unit;

	parameter real L_s   = 57.5;
	parameter real L_r   = 57.5;
	parameter real L_q   = 97.8;
	parameter real L_q_n = 97.8;

	parameter real W_gate_s = 70*L_unit;
	parameter real W_gate_r = 70*L_unit;

endpackage

module dmg_nor_latch #(
		parameter real L_q        = 54 + dmg_nor_latch_param::L_q,
		parameter real L_q_n      = 54 + dmg_nor_latch_param::L_q,
		parameter real W_gate_q   = 0,
		parameter real W_gate_q_n = 0
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
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q));
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q_n));
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q_n));

		(s *> q)   = (T_fall_q_n + T_rise_q, T_rise_q_n + T_fall_q);
		(r *> q)   = (T_rise_q, T_fall_q);
		(s *> q_n) = (T_rise_q_n, T_fall_q_n);
		(r *> q_n) = (T_fall_q + T_rise_q_n, T_rise_q + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
