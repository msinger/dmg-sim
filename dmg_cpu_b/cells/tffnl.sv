`default_nettype none

module dmg_tffnl #(
		parameter real L_q          = 54,
		parameter real L_q_n        = 54,
		parameter real L_tclk_out   = 190,
		parameter real L_tclk_n_out = 200
	) (
		input  logic d, l, tclk_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	logic ff, l_buf, tclk_n_buf;

	initial ff = 0;
	initial q  = 0;

	generate
		if (nodelay) begin
			always @* l_buf      <= l;
			always @* tclk_n_buf <= tclk_n;
		end else begin
			assign l_buf      = l;
			assign tclk_n_buf = tclk_n;
		end
	endgenerate

	always_latch if (!tclk_n_buf || l_buf) q   <= l_buf ? d : ff;
	always_latch if (tclk_n_buf || l_buf)  ff  <= l_buf ? d : !q;
	assign                                 q_n  = !q;

	specify
		specparam T_rise_not1 = tpd_elmore(  L_tclk_out, R_pmos_ohm(35*L_unit));
		specparam T_fall_not1 = tpd_elmore(  L_tclk_out, R_nmos_ohm(35*L_unit));
		specparam T_rise_not2 = tpd_elmore(L_tclk_n_out, R_pmos_ohm(35*L_unit));
		specparam T_fall_not2 = tpd_elmore(L_tclk_n_out, R_nmos_ohm(35*L_unit));
		specparam T_rise_nor  = tpd_elmore(          36, R_pmos_ohm( 8*L_unit) * 2);
		specparam T_fall_nor  = tpd_elmore(          36, R_nmos_ohm( 8*L_unit));
		specparam T_rise_aoi  = tpd_elmore(         143, R_pmos_ohm( 8*L_unit) * 2);
		specparam T_fall_aoi  = tpd_elmore(         143, R_nmos_ohm( 8*L_unit) * 2);
		specparam T_rise_mux  = tpd_elmore(          78, R_pmos_ohm( 8*L_unit));
		specparam T_fall_mux  = tpd_elmore(          78, R_nmos_ohm( 8*L_unit));
		specparam T_rise_not3 = tpd_elmore(         110, R_pmos_ohm( 8*L_unit));
		specparam T_fall_not3 = tpd_elmore(         110, R_nmos_ohm( 8*L_unit));
		specparam T_rise_q    = tpd_elmore(         L_q, R_pmos_ohm(35*L_unit));
		specparam T_fall_q    = tpd_elmore(         L_q, R_nmos_ohm(35*L_unit));
		specparam T_rise_q_n  = tpd_elmore(       L_q_n, R_pmos_ohm(35*L_unit));
		specparam T_fall_q_n  = tpd_elmore(       L_q_n, R_nmos_ohm(35*L_unit));

		(tclk_n *> q)   = (T_rise_not1 + T_fall_mux + T_rise_nor + T_fall_aoi + T_rise_q,
		                   T_rise_not1 + T_fall_not2 + T_rise_mux + T_fall_nor + T_rise_aoi + T_fall_q);
		(d      *> q)   = (T_fall_aoi + T_rise_q, T_rise_aoi + T_fall_q);
		(l      *> q)   = (T_rise_nor + T_fall_aoi + T_rise_q, T_fall_nor + T_rise_aoi + T_fall_q);
		(tclk_n *> q_n) = (T_fall_not1 + T_rise_mux + T_fall_not3 + T_rise_q_n,
		                   T_fall_not1 + T_rise_not2 + T_fall_mux + T_rise_not3 + T_fall_q_n);
		(d      *> q_n) = (T_rise_aoi + T_rise_mux + T_fall_not3 + T_rise_q_n,
		                   T_fall_aoi + T_fall_mux + T_rise_not3 + T_fall_q_n);
		(l      *> q_n) = (T_fall_nor + T_rise_aoi + T_rise_mux + T_fall_not3 + T_rise_q_n,
		                   T_rise_nor + T_fall_aoi + T_fall_mux + T_rise_not3 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
