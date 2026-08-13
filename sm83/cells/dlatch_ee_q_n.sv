`default_nettype none

package sm83_dlatch_ee_q_n_param;

	import sm83_timing::L_unit;

	parameter real L_d     =  0.0;
	parameter real L_ena   =  0.0;
	parameter real L_ena_n =  0.0;
	parameter real L_q_n   = 18.8;

	parameter real W_gate_d     = 6*L_unit;
	parameter real W_gate_ena   = 6*L_unit;
	parameter real W_gate_ena_n = 6*L_unit;

endpackage

module sm83_dlatch_ee_q_n #(
		parameter real L_q_n      = 36 + sm83_dlatch_ee_q_n_param::L_q_n,
		parameter real W_gate_q_n = 0
	) (
		input  logic d, ena, ena_n,
		output logic q_n
	);

	import sm83_timing::*;

	initial q_n = 0;

	always_latch if ((d && ena) || (!d && !ena_n)) q_n = !d;

	specify
		specparam T_rise_q_n = tpd_elmore(L_q_n, 2*R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit+W_gate_q_n));
		specparam T_fall_q_n = tpd_elmore(L_q_n, 2*R_nmos_ohm(3*L_unit), C_gate_F(6*L_unit+W_gate_q_n));

		(d, ena, ena_n *> q_n) = (T_rise_q_n, T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
