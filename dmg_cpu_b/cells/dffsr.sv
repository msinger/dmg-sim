`default_nettype none

package dmg_dffsr_param;

	import dmg_timing::L_unit;

	parameter real L_d   = 0.0;
	parameter real L_clk = 0.0;
	parameter real L_s_n = 0.0;
	parameter real L_r_n = 0.0;
	parameter real L_q   = 0.0;
	parameter real L_q_n = 0.0;

	parameter real W_gate_d   = 0;
	parameter real W_gate_clk = 70*L_unit;
	parameter real W_gate_s_n = 32*L_unit;
	parameter real W_gate_r_n = 70*L_unit;

endpackage

module dmg_dffsr #(
		parameter real L_q         = 54 + dmg_dffsr_param::L_q,
		parameter real L_q_n       = 54 + dmg_dffsr_param::L_q_n,
		parameter real L_clk_out   = 220,
		parameter real L_clk_n_out = 230,
		parameter real L_r_out     = 330,
		parameter real W_gate_q    = 0,
		parameter real W_gate_q_n  = 0
	) (
		input  logic d, clk, s_n, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	logic ff, clk_buf, s_n_buf, r_n_buf;

	initial ff = 0;
	initial q  = 0;

	generate
		if (nodelay) begin
			/* Only use clk after it has settled, otherwise this can prematurely set
			 * interrupt flags in FF0F register. Mooneye acceptance/ppu/hblank_ly_scx_timing-GS
			 * test fails with no delays if we'd use clk directly here. */
			always @* clk_buf <= clk;
			always @* s_n_buf <= s_n;
			always @* r_n_buf <= r_n;
		end else begin
			assign clk_buf = clk;
			assign s_n_buf = s_n;
			assign r_n_buf = r_n;
		end
	endgenerate

	always_latch if (!clk_buf || !s_n_buf || !r_n_buf) ff  <= (d | !s_n_buf) & r_n_buf;
	always_latch if (clk_buf || !s_n_buf || !r_n_buf)  q   <= (ff | !s_n_buf) & r_n_buf;
	assign                                             q_n  = !q;

	specify
		specparam T_rise_not1 = tpd_elmore(    L_r_out+125,   R_pmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_fall_not1 = tpd_elmore(    L_r_out+125,   R_nmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_rise_not2 = tpd_elmore(L_clk_n_out+104,   R_pmos_ohm(35*L_unit), C_gate_F(102*L_unit));
		specparam T_fall_not2 = tpd_elmore(L_clk_n_out+104,   R_nmos_ohm(35*L_unit), C_gate_F(102*L_unit));
		specparam T_rise_not3 = tpd_elmore(   L_clk_out+89,   R_pmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_fall_not3 = tpd_elmore(   L_clk_out+89,   R_nmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_rise_mux  = tpd_elmore(            101,   R_pmos_ohm( 8*L_unit), C_gate_F( 16*L_unit));
		specparam T_fall_mux  = tpd_elmore(            101,   R_nmos_ohm( 8*L_unit), C_gate_F( 16*L_unit));
		specparam T_rise_not4 = tpd_elmore(            104,   R_pmos_ohm( 8*L_unit), C_gate_F( 86*L_unit));
		specparam T_fall_not4 = tpd_elmore(            104,   R_nmos_ohm( 8*L_unit), C_gate_F( 86*L_unit));
		specparam T_rise_aoi  = tpd_elmore(            146, 2*R_pmos_ohm( 8*L_unit), C_gate_F( 70*L_unit));
		specparam T_fall_aoi  = tpd_elmore(            146, 2*R_nmos_ohm( 8*L_unit), C_gate_F( 70*L_unit));
		specparam T_rise_q    = tpd_elmore(            L_q,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q    = tpd_elmore(            L_q,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_rise_q_n  = tpd_elmore(          L_q_n,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));
		specparam T_fall_q_n  = tpd_elmore(          L_q_n,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));

		(clk *> q)   = (T_fall_not2 + T_rise_mux + T_fall_not4 + T_rise_q,
		                T_fall_not2 + T_rise_not3 + T_fall_mux + T_rise_not4 + T_fall_q);
		(s_n *> q)   = (T_rise_aoi + T_rise_mux + T_fall_not4 + T_rise_q,
		                T_fall_aoi + T_fall_mux + T_rise_not4 + T_fall_q);
		(r_n *> q)   = (T_fall_not1 + T_rise_aoi + T_rise_mux + T_fall_not4 + T_rise_q,
		                T_rise_not1 + T_fall_aoi + T_fall_mux + T_rise_not4 + T_fall_q);
		(clk *> q_n) = (T_fall_not2 + T_rise_not3 + T_fall_mux + T_rise_not4 + T_fall_aoi + T_rise_q_n,
		                T_fall_not2 + T_rise_mux + T_fall_not4 + T_rise_aoi + T_fall_q_n);
		(s_n *> q_n) = (T_fall_aoi + T_rise_q_n, T_rise_aoi + T_fall_q_n);
		(r_n *> q_n) = (T_fall_not1 + T_fall_aoi + T_rise_q_n, T_rise_not1 + T_rise_aoi + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
