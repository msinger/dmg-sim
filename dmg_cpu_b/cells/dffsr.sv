`default_nettype none

module dmg_dffsr #(
		parameter real L_q         = 54,
		parameter real L_q_n       = 54,
		parameter real L_clk_out   = 220,
		parameter real L_clk_n_out = 230,
		parameter real L_r_out     = 330
	) (
		input  logic d, clk, s_n, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	logic clk_buf;
	logic ff;

	initial ff = 0;
	initial q  = 0;

	generate
		if (nodelay)
			/* Only use clk after it has settled, otherwise this can prematurely set
			 * interrupt flags in FF0F register. Mooneye acceptance/ppu/hblank\_ly\_scx\_timing-GS
			 * test fails with no delays if we'd use clk directly here. */
			always @* clk_buf <= clk;
		else
			assign clk_buf = clk;
	endgenerate

	always_latch if (!clk_buf || !s_n || !r_n) ff  <= (d | !s_n) & r_n;
	always_latch if (clk_buf || !s_n || !r_n)  q   <= (ff | !s_n) & r_n;
	assign                                     q_n  = !q;

	specify
		specparam T_rise_not1 = tpd_elmore(    L_r_out, R_pmos_ohm(35*L_unit));
		specparam T_fall_not1 = tpd_elmore(    L_r_out, R_nmos_ohm(35*L_unit));
		specparam T_rise_not2 = tpd_elmore(L_clk_n_out, R_pmos_ohm(35*L_unit));
		specparam T_fall_not2 = tpd_elmore(L_clk_n_out, R_nmos_ohm(35*L_unit));
		specparam T_rise_not3 = tpd_elmore(  L_clk_out, R_pmos_ohm(35*L_unit));
		specparam T_fall_not3 = tpd_elmore(  L_clk_out, R_nmos_ohm(35*L_unit));
		specparam T_rise_buf  = tpd_elmore(        101, R_pmos_ohm( 8*L_unit));
		specparam T_fall_buf  = tpd_elmore(        101, R_nmos_ohm( 8*L_unit));
		specparam T_rise_not4 = tpd_elmore(        104, R_pmos_ohm( 8*L_unit));
		specparam T_fall_not4 = tpd_elmore(        104, R_nmos_ohm( 8*L_unit));
		specparam T_rise_aoi  = tpd_elmore(        146, R_pmos_ohm( 8*L_unit) * 2);
		specparam T_fall_aoi  = tpd_elmore(        146, R_nmos_ohm( 8*L_unit) * 2);
		specparam T_rise_q    = tpd_elmore(        L_q, R_pmos_ohm(35*L_unit));
		specparam T_fall_q    = tpd_elmore(        L_q, R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n  = tpd_elmore(      L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n  = tpd_elmore(      L_q_n, R_nmos_ohm(35*L_unit));

		(clk *> q)   = (T_fall_not2 + T_rise_buf + T_fall_not4 + T_rise_q,
		                T_fall_not2 + T_rise_not3 + T_fall_buf + T_rise_not4 + T_fall_q);
		(s_n *> q)   = (T_rise_aoi + T_rise_buf + T_fall_not4 + T_rise_q,
		                T_fall_aoi + T_fall_buf + T_rise_not4 + T_fall_q);
		(r_n *> q)   = (T_fall_not1 + T_rise_aoi + T_rise_buf + T_fall_not4 + T_rise_q,
		                T_rise_not1 + T_fall_aoi + T_fall_buf + T_rise_not4 + T_fall_q);
		(clk *> q_n) = (T_fall_not2 + T_rise_not3 + T_fall_buf + T_rise_not4 + T_fall_aoi + T_rise_q_n,
		                T_fall_not2 + T_rise_buf + T_fall_not4 + T_rise_aoi + T_fall_q_n);
		(s_n *> q_n) = (T_fall_aoi + T_rise_q_n, T_rise_aoi + T_fall_q_n);
		(r_n *> q_n) = (T_fall_not1 + T_fall_aoi + T_rise_q_n, T_rise_not1 + T_rise_aoi + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
