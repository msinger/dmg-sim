`default_nettype none

package dmg_nand_latch_param;

	import dmg_timing::L_unit;

	parameter real L_s_n = 57.5;
	parameter real L_r_n = 57.5;
	parameter real L_q   = 97.8;
	parameter real L_q_n = 97.8;

	parameter real W_gate_s_n = 70*L_unit;
	parameter real W_gate_r_n = 70*L_unit;

endpackage

module dmg_nand_latch #(
		parameter real L_q        = 54 + dmg_nand_latch_param::L_q,
		parameter real L_q_n      = 54 + dmg_nand_latch_param::L_q_n,
		parameter real W_gate_q   = 0,
		parameter real W_gate_q_n = 0
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
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q));
		specparam T_rise_q_n = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q_n));
		specparam T_fall_q_n = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit + W_gate_q_n));

		(s_n *> q)   = (T_rise_q, T_fall_q);
		(r_n *> q)   = (T_fall_q_n + T_rise_q, T_rise_q_n + T_fall_q);
		(s_n *> q_n) = (T_fall_q + T_rise_q_n, T_rise_q + T_fall_q_n);
		(r_n *> q_n) = (T_rise_q_n, T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
