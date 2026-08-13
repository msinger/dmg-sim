`default_nettype none

package dmg_dlatch_ee_q_param;

	import dmg_timing::L_unit;

	parameter real L_d     = 39.6;
	parameter real L_ena   = 54.9;
	parameter real L_ena_n = 42.6;
	parameter real L_q     = 35.0;

	parameter real W_gate_d     = 0;
	parameter real W_gate_ena   = 20*L_unit;
	parameter real W_gate_ena_n = 20*L_unit;

endpackage

module dmg_dlatch_ee_q #(
		parameter real L_q      = 54 + dmg_dlatch_ee_q_param::L_q,
		parameter real W_gate_q = 0
	) (
		input  logic d, ena, ena_n,
		output logic q
	);

	import dmg_timing::*;

	initial q = 0;

	always_latch if ((!d && ena) || (d && !ena_n)) q = d;

	specify
		specparam T_rise_buf = tpd_elmore( 61, R_pmos_ohm(10*L_unit), C_gate_F(20*L_unit));
		specparam T_fall_buf = tpd_elmore( 61, R_nmos_ohm(10*L_unit), C_gate_F(20*L_unit));
		specparam T_rise_not = tpd_elmore(101, R_pmos_ohm(10*L_unit), C_gate_F(90*L_unit));
		specparam T_fall_not = tpd_elmore(101, R_nmos_ohm(10*L_unit), C_gate_F(90*L_unit));
		specparam T_rise_q   = tpd_elmore(L_q, R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q, R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q));

		(d, ena, ena_n *> q) = (T_rise_buf + T_fall_not + T_rise_q, T_fall_buf + T_rise_not + T_fall_q);
	endspecify

endmodule

`default_nettype wire
