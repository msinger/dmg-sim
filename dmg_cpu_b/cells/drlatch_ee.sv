`default_nettype none

package dmg_drlatch_ee_param;

	import dmg_timing::L_unit;

	parameter real L_d     = 0.0;
	parameter real L_r_n   = 0.0;
	parameter real L_ena   = 0.0;
	parameter real L_ena_n = 0.0;
	parameter real L_q     = 0.0;
	parameter real L_q_n   = 0.0;

	parameter real W_gate_d     = 0;
	parameter real W_gate_r_n   = 20*L_unit;
	parameter real W_gate_ena   = 20*L_unit;
	parameter real W_gate_ena_n = 20*L_unit;

endpackage

module dmg_drlatch_ee #(
		parameter real L_q        = 54 + dmg_drlatch_ee_param::L_q,
		parameter real L_q_n      = 54 + dmg_drlatch_ee_param::L_q_n,
		parameter real W_gate_q   = 0,
		parameter real W_gate_q_n = 0
	) (
		input  logic d, r_n, ena, ena_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	initial q = 0;

	always_latch if ((!d && ena) || (d && !ena_n) || !r_n) q = d & r_n;
	assign q_n = !q;

	specify
		specparam T_rise_buf  = tpd_elmore(   66,   R_pmos_ohm(10*L_unit), C_gate_F(20*L_unit));
		specparam T_fall_buf  = tpd_elmore(   66,   R_nmos_ohm(10*L_unit), C_gate_F(20*L_unit));
		specparam T_rise_nand = tpd_elmore(  110,   R_pmos_ohm(10*L_unit), C_gate_F(90*L_unit));
		specparam T_fall_nand = tpd_elmore(  110, 2*R_nmos_ohm(10*L_unit), C_gate_F(90*L_unit));
		specparam T_rise_not  = tpd_elmore(  129,   R_pmos_ohm(10*L_unit), C_gate_F(70*L_unit));
		specparam T_fall_not  = tpd_elmore(  129,   R_nmos_ohm(10*L_unit), C_gate_F(70*L_unit));
		specparam T_rise_q    = tpd_elmore(  L_q,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q    = tpd_elmore(  L_q,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_rise_q_n  = tpd_elmore(L_q_n,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));
		specparam T_fall_q_n  = tpd_elmore(L_q_n,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));

		(d, ena, ena_n *> q)   = (T_rise_buf + T_fall_nand + T_rise_q, T_fall_buf + T_rise_nand + T_fall_q);
		(r_n           *> q)   = (T_fall_nand + T_rise_q, T_rise_nand + T_fall_q);
		(d, ena, ena_n *> q_n) = (T_fall_buf + T_rise_nand + T_fall_not + T_rise_q_n,
		                          T_rise_buf + T_fall_nand + T_rise_not + T_fall_q_n);
		(r_n           *> q_n) = (T_rise_nand + T_fall_not + T_rise_q_n, T_fall_nand + T_rise_not + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
