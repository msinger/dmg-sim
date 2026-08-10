`default_nettype none

package sm83_srlatch_r_n_param;

	import sm83_timing::L_unit;

	parameter real L_s   = 0.0;
	parameter real L_r_n = 0.0;
	parameter real L_q   = 0.0;

	parameter real W_gate_s   = 16.5*L_unit;
	parameter real W_gate_r_n = 33.0*L_unit;

endpackage

module sm83_srlatch_r_n #(
		parameter real L_q      = 19 + sm83_srlatch_r_n_param::L_q,
		parameter real W_gate_q = 0
	) (
		input  logic s, r_n,
		output logic q
	);

	import sm83_timing::*;

	always_latch if (!r_n || s) q = s & r_n;

	specify
		specparam T_rise_sr = tpd_elmore( 51,   R_pmos_ohm(16.5*L_unit), C_gate_F(16*L_unit));
		specparam T_fall_sr = tpd_elmore( 51, 2*R_nmos_ohm(16.5*L_unit), C_gate_F(16*L_unit));
		specparam T_rise_q  = tpd_elmore(L_q,   R_pmos_ohm(11.0*L_unit), C_gate_F(42*L_unit+W_gate_q));
		specparam T_fall_q  = tpd_elmore(L_q,   R_nmos_ohm( 5.0*L_unit), C_gate_F(42*L_unit+W_gate_q));

		(s, r_n *> q) = (T_fall_sr + T_rise_q, T_rise_sr + T_fall_q);
	endspecify

endmodule

`default_nettype wire
