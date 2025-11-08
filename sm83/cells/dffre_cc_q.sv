`default_nettype none

module sm83_dffre_cc_q #(
		parameter real L_q = 19
	) (
		input  logic d, clk, clk_n, ena, r,
		output logic q
	);

	import sm83_timing::*;

	logic ff;

	initial ff = 0;
	initial q  = 0;

	always_latch if ((d && clk_n && ena) || (!d && !clk && ena) || r) ff <= d & !r;
	always_latch if ((ff && clk) || (!ff && !clk_n))                  q  <= ff;

	specify
		specparam T_rise_buf = tpd_elmore( 41, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_buf = tpd_elmore( 41, R_nmos_ohm(3*L_unit) * 2);
		specparam T_rise_q   = tpd_elmore(L_q, R_pmos_ohm(8*L_unit));
		specparam T_fall_q   = tpd_elmore(L_q, R_nmos_ohm(5*L_unit));

		(clk, clk_n *> q) = (T_fall_buf + T_rise_q, T_rise_buf + T_fall_q);
	endspecify

endmodule

`default_nettype wire
