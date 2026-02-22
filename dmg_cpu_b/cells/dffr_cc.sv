`default_nettype none

module dmg_dffr_cc #(
		parameter real L_q   = 54,
		parameter real L_q_n = 54
	) (
		input  logic d, clk, clk_n, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && !clk) || (!d && clk_n) || !r_n)   ff  <= d & r_n;
	always_latch if ((ff && !clk_n) || (!ff && clk) || !r_n) q   <= ff & r_n;
	assign                                                   q_n  = !q;

	specify
		specparam T_rise_buf  = tpd_elmore(   59, R_pmos_ohm( 8*L_unit));
		specparam T_fall_buf  = tpd_elmore(   59, R_nmos_ohm( 8*L_unit));
		specparam T_rise_nand = tpd_elmore(  122, R_pmos_ohm( 8*L_unit));
		specparam T_fall_nand = tpd_elmore(  122, R_nmos_ohm( 8*L_unit) * 2);
		specparam T_rise_not  = tpd_elmore(  130, R_pmos_ohm( 8*L_unit));
		specparam T_fall_not  = tpd_elmore(  130, R_nmos_ohm( 8*L_unit));
		specparam T_rise_q    = tpd_elmore(  L_q, R_pmos_ohm(35*L_unit));
		specparam T_fall_q    = tpd_elmore(  L_q, R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n  = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n  = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit));

		(clk, clk_n *> q)   = (T_rise_buf + T_fall_nand + T_rise_q, T_fall_buf + T_rise_nand + T_fall_q);
		(r_n        *> q)   = (T_fall_nand + T_rise_q, T_rise_nand + T_fall_q);
		(clk, clk_n *> q_n) = (T_fall_buf + T_rise_nand + T_fall_not + T_rise_q_n,
		                       T_rise_buf + T_fall_nand + T_rise_not + T_fall_q_n);
		(r_n        *> q_n) = (T_rise_nand + T_fall_not + T_rise_q_n, T_fall_nand + T_rise_not + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
