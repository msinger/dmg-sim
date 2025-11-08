`default_nettype none

module sm83_dff_cc_ee_pch_d_reg_sp_bit #(
		parameter real L_d   = 45,
		parameter real L_q   = 42,
		parameter real L_q_n = 57
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

	localparam realtime T_rise_d = tpd_elmore(L_d, R_pmos_ohm(5*L_unit));
	localparam realtime T_Z_d    = tpd_z(T_rise_d);
	bufif0 (strong1, highz0) #(T_rise_d, 0, T_Z_d) (d, '1, pch_n);

	specify
		specparam T_rise_buf1 = tpd_elmore(   49, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_buf1 = tpd_elmore(   49, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_buf2 = tpd_elmore(   19, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_buf2 = tpd_elmore(   19, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_q_n  = tpd_elmore(L_q_n, R_pmos_ohm(13*L_unit));
		specparam T_fall_q_n  = tpd_elmore(L_q_n, R_nmos_ohm( 6*L_unit));
		specparam T_rise_q    = tpd_elmore(  L_q, R_pmos_ohm(13*L_unit));
		specparam T_fall_q    = tpd_elmore(  L_q, R_nmos_ohm( 6*L_unit));

		(clk, clk_n *> q)   = (T_fall_buf1 + T_rise_buf2 + T_fall_q_n + T_rise_q,
		                       T_rise_buf1 + T_fall_buf2 + T_rise_q_n + T_fall_q);
		(clk, clk_n *> q_n) = (T_rise_buf1 + T_fall_buf2 + T_rise_q_n,
		                       T_fall_buf1 + T_rise_buf2 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
