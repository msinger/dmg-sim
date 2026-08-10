`default_nettype none

package sm83_dff_cc_q_param;

	import sm83_timing::L_unit;

	parameter real L_d     = 0.0;
	parameter real L_clk   = 0.0;
	parameter real L_clk_n = 0.0;
	parameter real L_q     = 0.0;

	parameter real W_gate_d     =  6*L_unit;
	parameter real W_gate_clk   = 12*L_unit;
	parameter real W_gate_clk_n = 12*L_unit;

endpackage

module sm83_dff_cc_q #(
		parameter real L_q      = 17 + sm83_dff_cc_q_param::L_q,
		parameter real W_gate_q = 0
	) (
		input  logic d, clk, clk_n,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n) || (!d && !clk))   ff <= !d;
	always_latch if ((ff && clk) || (!ff && !clk_n)) q  <= !ff;

	specify
		specparam T_rise_buf = tpd_elmore( 57, 2*R_pmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_fall_buf = tpd_elmore( 57, 2*R_nmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_rise_not = tpd_elmore( 60,   R_pmos_ohm( 3*L_unit), C_gate_F(16*L_unit));
		specparam T_fall_not = tpd_elmore( 60,   R_nmos_ohm( 3*L_unit), C_gate_F(16*L_unit));
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(11*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_q));

		(clk, clk_n *> q) = (T_rise_buf + T_fall_not + T_rise_q, T_fall_buf + T_rise_not + T_fall_q);
	endspecify

endmodule

`default_nettype wire
