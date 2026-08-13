`default_nettype none

package sm83_dff_cc_ee_pch_d_reg_sp_bit_param;

	import sm83_timing::L_unit;

	parameter real L_d     =  0.0;
	parameter real L_clk   = 20.2;
	parameter real L_clk_n = 25.1;
	parameter real L_ena   =  0.0;
	parameter real L_ena_n =  0.0;
	parameter real L_pch_n =  0.0;
	parameter real L_q     =  0.0;
	parameter real L_q_n   =  0.0;

	parameter real W_gate_d     = 6*L_unit;
	parameter real W_gate_clk   = 9*L_unit;
	parameter real W_gate_clk_n = 9*L_unit;
	parameter real W_gate_ena   = 3*L_unit;
	parameter real W_gate_ena_n = 3*L_unit;
	parameter real W_gate_pch_n = 5*L_unit;

endpackage

module sm83_dff_cc_ee_pch_d_reg_sp_bit #(
		parameter real L_d        = 45 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d,
		parameter real L_q        = 42 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q,
		parameter real L_q_n      = 57 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n,
		parameter real W_gate_d   = sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d,
		parameter real W_gate_q   = 0,
		parameter real W_gate_q_n = 0
	) (
		input  logic     clk, clk_n, ena, ena_n, pch_n,
		inout  tri logic d,
		output logic     q, q_n
	);

	import sm83_timing::*;

	logic ff1, ff2;

	initial ff1 = 0;
	initial ff2 = 0;
	initial q_n = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && !ena_n)) ff1 <= d;
	always_latch if ((ff1 && clk) || (!ff1 && !clk_n))              ff2  = !ff1;
	always_latch if ((ff2 && clk) || (!ff2 && !clk_n))              q_n <= ff2;
	assign                                                          q    = !q_n;

	localparam realtime T_rise_d = tpd_elmore(L_d, R_pmos_ohm(5*L_unit), C_gate_F(W_gate_d));
	localparam realtime T_Z_d    = tpd_z(T_rise_d);
	bufif0 (strong1, highz0) #(T_rise_d, T_Z_d, T_Z_d) (d, '1, pch_n);

	specify
		specparam T_rise_buf1 = tpd_elmore(   49, 2*R_pmos_ohm( 3*L_unit), C_gate_F(12*L_unit));
		specparam T_fall_buf1 = tpd_elmore(   49, 2*R_nmos_ohm( 3*L_unit), C_gate_F(12*L_unit));
		specparam T_rise_buf2 = tpd_elmore(   19, 2*R_pmos_ohm( 3*L_unit), C_gate_F(19*L_unit));
		specparam T_fall_buf2 = tpd_elmore(   19, 2*R_nmos_ohm( 3*L_unit), C_gate_F(19*L_unit));
		specparam T_rise_q_n  = tpd_elmore(L_q_n,   R_pmos_ohm(13*L_unit), C_gate_F(19*L_unit+W_gate_q_n));
		specparam T_fall_q_n  = tpd_elmore(L_q_n,   R_nmos_ohm( 6*L_unit), C_gate_F(19*L_unit+W_gate_q_n));
		specparam T_rise_q    = tpd_elmore(  L_q,   R_pmos_ohm(13*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q    = tpd_elmore(  L_q,   R_nmos_ohm( 6*L_unit), C_gate_F(W_gate_q));

		(clk, clk_n *> q)   = (T_fall_buf1 + T_rise_buf2 + T_fall_q_n + T_rise_q,
		                       T_rise_buf1 + T_fall_buf2 + T_rise_q_n + T_fall_q);
		(clk, clk_n *> q_n) = (T_rise_buf1 + T_fall_buf2 + T_rise_q_n,
		                       T_fall_buf1 + T_rise_buf2 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
