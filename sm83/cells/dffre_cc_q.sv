`default_nettype none

package sm83_dffre_cc_q_param;

	import sm83_timing::L_unit;

	parameter real L_d     = 0.0;
	parameter real L_clk   = 0.0;
	parameter real L_clk_n = 0.0;
	parameter real L_ena   = 0.0;
	parameter real L_r     = 0.0;
	parameter real L_q     = 0.0;

	parameter real W_gate_d     = 6*L_unit;
	parameter real W_gate_clk   = 9*L_unit;
	parameter real W_gate_clk_n = 9*L_unit;
	parameter real W_gate_ena   = 9*L_unit;
	parameter real W_gate_r     = 6*L_unit;

endpackage

module sm83_dffre_cc_q #(
		parameter real L_q      = 19 + sm83_dffre_cc_q_param::L_q,
		parameter real W_gate_q = 0
	) (
		input  logic d, clk, clk_n, ena, r,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && ena) || r) ff <= d & !r;
	always_latch if ((ff && clk) || (!ff && !clk_n))                  q  <= ff;

	specify
		specparam T_rise_buf = tpd_elmore( 41, 2*R_pmos_ohm(3*L_unit), C_gate_F(13*L_unit));
		specparam T_fall_buf = tpd_elmore( 41, 2*R_nmos_ohm(3*L_unit), C_gate_F(13*L_unit));
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(8*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(5*L_unit), C_gate_F(W_gate_q));

		(clk, clk_n *> q) = (T_fall_buf + T_rise_q, T_rise_buf + T_fall_q);
	endspecify

endmodule

`default_nettype wire
