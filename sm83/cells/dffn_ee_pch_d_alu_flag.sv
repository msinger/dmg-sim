`default_nettype none

package sm83_dffn_ee_pch_d_alu_flag_param;

	import sm83_timing::L_unit;

	parameter real L_d     = 0.0;
	parameter real L_clk_n = 0.0;
	parameter real L_ena   = 0.0;
	parameter real L_ena_n = 0.0;
	parameter real L_pch_n = 0.0;
	parameter real L_q     = 0.0;
	parameter real L_q_n   = 0.0;

	parameter real W_gate_d     =  6.0*L_unit;
	parameter real W_gate_clk_n = 29.0*L_unit;
	parameter real W_gate_ena   =  3.0*L_unit;
	parameter real W_gate_ena_n =  3.0*L_unit;
	parameter real W_gate_pch_n = 12.5*L_unit;

endpackage

module sm83_dffn_ee_pch_d_alu_flag #(
		parameter real L_d        = 69 + sm83_dffn_ee_pch_d_alu_flag_param::L_d,
		parameter real L_q        = 52 + sm83_dffn_ee_pch_d_alu_flag_param::L_q,
		parameter real L_q_n      = 95 + sm83_dffn_ee_pch_d_alu_flag_param::L_q_n,
		parameter real W_gate_d   = sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d,
		parameter real W_gate_q   = 0,
		parameter real W_gate_q_n = 0
	) (
		input  logic     clk_n, ena, ena_n, pch_n,
		inout  tri logic d,
		output logic     q, q_n
	);

	import sm83_timing::*;

	logic ff1, ff2;

	initial ff1 = 0;
	initial ff2 = 0;
	initial q_n = 0;

	always_latch if ((d && clk_n && ena) || (!d && clk_n && !ena_n)) ff1 <= d;
	always_latch if ((ff1 && !clk_n) || (!ff1 && !clk_n))            ff2  = !ff1;
	always_latch if ((ff2 && !clk_n) || (!ff2 && !clk_n))            q_n <= ff2;
	assign                                                           q    = !q_n;

	localparam realtime T_rise_d = tpd_elmore(L_d, R_pmos_ohm(12.5*L_unit), C_gate_F(W_gate_d));
	localparam realtime T_Z_d    = tpd_z(T_rise_d);
	bufif0 (strong1, highz0) #(T_rise_d, T_Z_d, T_Z_d) (d, '1, pch_n);

	specify
		specparam T_rise_not  = tpd_elmore(   71,   R_pmos_ohm(15*L_unit), C_gate_F( 9*L_unit));
		specparam T_fall_not  = tpd_elmore(   71,   R_nmos_ohm( 5*L_unit), C_gate_F( 9*L_unit));
		specparam T_rise_buf1 = tpd_elmore(  114, 2*R_pmos_ohm( 3*L_unit), C_gate_F(12*L_unit));
		specparam T_fall_buf1 = tpd_elmore(  114, 2*R_nmos_ohm( 3*L_unit), C_gate_F(12*L_unit));
		specparam T_rise_buf2 = tpd_elmore(   73, 2*R_pmos_ohm( 3*L_unit), C_gate_F(15*L_unit));
		specparam T_fall_buf2 = tpd_elmore(   73, 2*R_nmos_ohm( 3*L_unit), C_gate_F(15*L_unit));
		specparam T_rise_q_n  = tpd_elmore(L_q_n,   R_pmos_ohm(10*L_unit), C_gate_F(15*L_unit+W_gate_q_n));
		specparam T_fall_q_n  = tpd_elmore(L_q_n,   R_nmos_ohm( 5*L_unit), C_gate_F(15*L_unit+W_gate_q_n));
		specparam T_rise_q    = tpd_elmore(  L_q,   R_pmos_ohm(10*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q    = tpd_elmore(  L_q,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_q));

		(clk_n *> q)   = (T_rise_not + T_fall_buf1 + T_rise_buf2 + T_fall_q_n + T_rise_q,
		                  T_fall_not + T_rise_buf1 + T_fall_buf2 + T_rise_q_n + T_fall_q);
		(clk_n *> q_n) = (T_fall_not + T_rise_buf1 + T_fall_buf2 + T_rise_q_n,
		                  T_rise_not + T_fall_buf1 + T_rise_buf2 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
