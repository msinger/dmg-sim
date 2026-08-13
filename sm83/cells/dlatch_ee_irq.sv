`default_nettype none

package sm83_dlatch_ee_irq_param;

	import sm83_timing::L_unit;

	parameter real L_d         =  0.0;
	parameter real L_ena       = 22.9;
	parameter real L_ena_n     = 19.5;
	parameter real L_pch_n     =  0.0;
	parameter real L_ena_q_n   =  0.0;
	parameter real L_q         =  0.0;
	parameter real L_q_n       =  0.0;
	parameter real L_gated_q_n =  0.0;

	parameter real W_gate_d       = 6*L_unit;
	parameter real W_gate_ena     = 6*L_unit;
	parameter real W_gate_ena_n   = 6*L_unit;
	parameter real W_gate_pch_n   = 6*L_unit;
	parameter real W_gate_ena_q_n = 0;

endpackage

module sm83_dlatch_ee_irq #(
		parameter real L_q              = 26 + sm83_dlatch_ee_irq_param::L_q,
		parameter real L_q_n            = 25 + sm83_dlatch_ee_irq_param::L_q_n,
		parameter real L_gated_q_n      = 37 + sm83_dlatch_ee_irq_param::L_gated_q_n,
		parameter real W_gate_q         = 0,
		parameter real W_gate_q_n       = 0,
		parameter real W_gate_gated_q_n = 0
	) (
		input      logic d, ena, ena_n, pch_n,
		inout  tri logic ena_q_n, // Needs to propagate strength, therefore inout
		output     logic q, q_n, gated_q_n
	);

	import sm83_timing::*;

	tri logic gated_q;

	initial q_n = 0;

	always_latch if ((d && ena) || (!d && !ena_n)) q_n = !d;
	assign q = !q_n;

	bufif0 (strong1, highz0) (gated_q, '1, pch_n);
	rnmos (gated_q, ena_q_n, q_n & (ena_q_n !== 1));
	keeper gated_q_keeper(gated_q);
	assign gated_q_n = !gated_q;

	specify
		specparam T_rise_buf       = tpd_elmore(         34, 2*R_pmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_fall_buf       = tpd_elmore(         34, 2*R_nmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_rise_not       = tpd_elmore(         34,   R_pmos_ohm( 3*L_unit), C_gate_F(25*L_unit));
		specparam T_fall_not       = tpd_elmore(         34,   R_nmos_ohm( 3*L_unit), C_gate_F(25*L_unit));
		specparam T_rise_q_n       = tpd_elmore(      L_q_n,   R_pmos_ohm(13*L_unit), C_gate_F(18*L_unit+W_gate_q_n));
		specparam T_fall_q_n       = tpd_elmore(      L_q_n,   R_nmos_ohm( 6*L_unit), C_gate_F(18*L_unit+W_gate_q_n));
		specparam T_rise_q         = tpd_elmore(        L_q,   R_pmos_ohm( 6*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q         = tpd_elmore(        L_q,   R_nmos_ohm( 6*L_unit), C_gate_F(W_gate_q));
		specparam T_rise_gated_q   = tpd_elmore(         19,   R_pmos_ohm( 6*L_unit), C_gate_F(12*L_unit));
		specparam T_fall_gated_q   = tpd_elmore(         19,   R_nmos_ohm( 6*L_unit), C_gate_F(12*L_unit));
		specparam T_rise_gated_q_n = tpd_elmore(L_gated_q_n,   R_pmos_ohm( 6*L_unit), C_gate_F(W_gate_gated_q_n));
		specparam T_fall_gated_q_n = tpd_elmore(L_gated_q_n,   R_nmos_ohm( 6*L_unit), C_gate_F(W_gate_gated_q_n));

		(d, ena, ena_n *> q_n) = (T_rise_buf + T_fall_not + T_rise_q_n, T_fall_buf + T_rise_not + T_fall_q_n);
		(d, ena, ena_n *> q)   = (T_fall_buf + T_rise_not + T_fall_q_n + T_rise_q,
		                          T_rise_buf + T_fall_not + T_rise_q_n + T_fall_q);

		(pch_n, ena_q_n *> gated_q_n) = (T_fall_gated_q + T_rise_gated_q_n, T_rise_gated_q + T_fall_gated_q_n);
		(d, ena, ena_n  *> gated_q_n) = (T_rise_buf + T_fall_not + T_rise_q_n + T_fall_gated_q + T_rise_gated_q_n,
		                                 T_fall_buf + T_rise_not + T_fall_q_n + T_rise_gated_q + T_fall_gated_q_n);
	endspecify

endmodule

`default_nettype wire
