`default_nettype none

package dmg_dffr_param;

	import dmg_timing::L_unit;

	parameter real L_d   = 0.0;
	parameter real L_clk = 0.0;
	parameter real L_r_n = 0.0;
	parameter real L_q   = 0.0;
	parameter real L_q_n = 0.0;

	parameter real W_gate_d   = 0;
	parameter real W_gate_clk = 70*L_unit;
	parameter real W_gate_r_n = 32*L_unit;

endpackage

module dmg_dffr #(
		parameter real L_q         = 54 + dmg_dffr_param::L_q,
		parameter real L_q_n       = 54 + dmg_dffr_param::L_q_n,
		parameter real L_clk_out   = 180,
		parameter real L_clk_n_out = 200,
		parameter real W_gate_q    = 0,
		parameter real W_gate_q_n  = 0
	) (
		input  logic d, clk, r_n,
		output logic q, q_n
	);

	import dmg_timing::*;

	logic clk_buf, r_n_buf;

	initial q = 0;

	generate
		if (nodelay) begin
			always @* clk_buf <= clk;
			always @* r_n_buf <= r_n;
		end else begin
			assign clk_buf = clk;
			assign r_n_buf = r_n;
		end
	endgenerate

	always_ff @(posedge clk_buf, negedge r_n_buf) q   <= d & r_n_buf;
	assign                                        q_n  = !q;

	specify
		specparam T_rise_not1 = tpd_elmore(L_clk_n_out,   R_pmos_ohm(35*L_unit), C_gate_F(102*L_unit));
		specparam T_fall_not1 = tpd_elmore(L_clk_n_out,   R_nmos_ohm(35*L_unit), C_gate_F(102*L_unit));
		specparam T_rise_not2 = tpd_elmore(  L_clk_out,   R_pmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_fall_not2 = tpd_elmore(  L_clk_out,   R_nmos_ohm(35*L_unit), C_gate_F( 32*L_unit));
		specparam T_rise_mux  = tpd_elmore(         59,   R_pmos_ohm( 8*L_unit), C_gate_F( 16*L_unit));
		specparam T_fall_mux  = tpd_elmore(         59,   R_nmos_ohm( 8*L_unit), C_gate_F( 16*L_unit));
		specparam T_rise_nand = tpd_elmore(        122,   R_pmos_ohm( 8*L_unit), C_gate_F( 86*L_unit));
		specparam T_fall_nand = tpd_elmore(        122, 2*R_nmos_ohm( 8*L_unit), C_gate_F( 86*L_unit));
		specparam T_rise_not3 = tpd_elmore(        130,   R_pmos_ohm( 8*L_unit), C_gate_F( 70*L_unit));
		specparam T_fall_not3 = tpd_elmore(        130,   R_nmos_ohm( 8*L_unit), C_gate_F( 70*L_unit));
		specparam T_rise_q    = tpd_elmore(        L_q,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_fall_q    = tpd_elmore(        L_q,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q));
		specparam T_rise_q_n  = tpd_elmore(      L_q_n,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));
		specparam T_fall_q_n  = tpd_elmore(      L_q_n,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_q_n));

		(clk *> q)   = (T_fall_not1 + T_rise_mux + T_fall_nand + T_rise_q,
		                T_fall_not1 + T_rise_not2 + T_fall_mux + T_rise_nand + T_fall_q);
		(r_n *> q)   = (T_fall_nand + T_rise_q, T_rise_nand + T_fall_q);
		(clk *> q_n) = (T_fall_not1 + T_rise_not2 + T_fall_mux + T_rise_nand + T_fall_not3 + T_rise_q_n,
		                T_fall_not1 + T_rise_mux + T_fall_nand + T_rise_not3 + T_fall_q_n);
		(r_n *> q_n) = (T_rise_nand + T_fall_not3 + T_rise_q_n, T_fall_nand + T_rise_not3 + T_fall_q_n);
	endspecify

endmodule

`default_nettype wire
