`default_nettype none

module dmg_dffr_cc #(
		parameter real L_q   = 54,
		parameter real L_q_n = 54
	) (
		input  logic d, clk, clk_n, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	generate
		if (nodelay) begin

			logic ff, clk_buf, clk_n_buf, r_n_buf;

			initial ff = 0;
			initial q  = 0;

			always @* clk_buf   <= clk;
			always @* clk_n_buf <= clk_n;
			always @* r_n_buf   <= r_n;

			always_latch if ((d && !clk_buf) || (!d && clk_n_buf) || !r_n_buf)   ff  <= d & r_n_buf;
			always_latch if ((ff && !clk_n_buf) || (!ff && clk_buf) || !r_n_buf) q   <= ff & r_n_buf;
			assign                                                               q_n  = !q;

		end else begin

			localparam realtime T_rise_mux1  = tpd_elmore(   44, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_mux1  = tpd_elmore(   44, R_nmos_ohm( 8*L_unit));
			localparam realtime T_rise_nand1 = tpd_elmore(   42, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_nand1 = tpd_elmore(   42, R_nmos_ohm( 8*L_unit) * 2);
			localparam realtime T_rise_not1  = tpd_elmore(   63, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_not1  = tpd_elmore(   63, R_nmos_ohm( 8*L_unit));
			localparam realtime T_rise_mux2  = tpd_elmore(   59, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_mux2  = tpd_elmore(   59, R_nmos_ohm( 8*L_unit));
			localparam realtime T_rise_nand2 = tpd_elmore(  122, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_nand2 = tpd_elmore(  122, R_nmos_ohm( 8*L_unit) * 2);
			localparam realtime T_rise_not2  = tpd_elmore(  130, R_pmos_ohm( 8*L_unit));
			localparam realtime T_fall_not2  = tpd_elmore(  130, R_nmos_ohm( 8*L_unit));
			localparam realtime T_rise_q     = tpd_elmore(  L_q, R_pmos_ohm(35*L_unit));
			localparam realtime T_fall_q     = tpd_elmore(  L_q, R_nmos_ohm(35*L_unit));
			localparam realtime T_rise_q_n   = tpd_elmore(L_q_n, R_pmos_ohm(35*L_unit));
			localparam realtime T_fall_q_n   = tpd_elmore(L_q_n, R_nmos_ohm(35*L_unit));

			logic and1, nand2, mux1, mux2, mux1_buf, mux2_buf;

			initial mux1 = 0;
			initial mux2 = 0;

			always_latch if ((d && !clk) || (!d && clk_n) || !r_n)           mux1     <= d & r_n;
			always_latch if ((and1 && !clk_n) || (!and1 && clk) || !r_n)     mux2     <= and1 & r_n;
			assign #(T_rise_mux1, T_fall_mux1)                               mux1_buf  = mux1;
			assign #(T_rise_mux2, T_fall_mux2)                               mux2_buf  = mux2;
			assign #(T_fall_nand1 + T_rise_not1, T_rise_nand1 + T_fall_not1) and1      = r_n & mux1_buf;
			assign #(T_rise_nand2, T_fall_nand2)                             nand2     = !(r_n & mux2_buf);
			assign #(T_rise_q, T_fall_q)                                     q         = !nand2;
			assign #(T_fall_not2 + T_rise_q_n, T_rise_not2 + T_fall_q_n)     q_n       = nand2;

		end
	endgenerate

endmodule

`default_nettype wire
