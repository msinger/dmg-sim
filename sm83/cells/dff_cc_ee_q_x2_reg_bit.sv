`default_nettype none

package sm83_dff_cc_ee_q_x2_reg_bit_param;

	import sm83_timing::L_unit;

	parameter real L_d     =  0.0;
	parameter real L_clk   = 18.6;
	parameter real L_clk_n = 26.5;
	parameter real L_ena   =  0.0;
	parameter real L_ena_n =  0.0;
	parameter real L_q     =  0.0;

	parameter real W_gate_d     = 6*L_unit;
	parameter real W_gate_clk   = 9*L_unit;
	parameter real W_gate_clk_n = 9*L_unit;
	parameter real W_gate_ena   = 3*L_unit;
	parameter real W_gate_ena_n = 3*L_unit;

endpackage

module sm83_dff_cc_ee_q_x2_reg_bit #(
		parameter real L_q      = 33 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q,
		parameter real W_gate_q = 0
	) (
		input  logic d, clk, clk_n, ena, ena_n,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && !ena_n)) ff <= d;
	always_latch if ((ff && clk) || (!ff && !clk_n))                q  <= ff;

	specify
		specparam T_rise_buf = tpd_elmore( 21, 2*R_pmos_ohm( 3.0*L_unit), C_gate_F(40.5*L_unit));
		specparam T_fall_buf = tpd_elmore( 21, 2*R_nmos_ohm( 3.0*L_unit), C_gate_F(40.5*L_unit));
		specparam T_rise_q   = tpd_elmore(L_q,   R_pmos_ohm(27.0*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q   = tpd_elmore(L_q,   R_nmos_ohm(13.5*L_unit), C_gate_F(W_gate_q));

		(clk, clk_n *> q) = (T_fall_buf + T_rise_q, T_rise_buf + T_fall_q);
	endspecify

endmodule

`default_nettype wire
