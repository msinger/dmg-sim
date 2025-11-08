`default_nettype none

module sm83_not2_reg_pc_wr #(
		parameter real L_a_y = 27,
		parameter real L_b_y = 56
	) (
		input  logic a_in, b_in,
		output logic a_y, b_y
	);

	import sm83_timing::*;

	assign a_y = !a_in;
	assign b_y = !b_in;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(15.0*L_unit));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm( 9.0*L_unit));
		specparam T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm( 4.5*L_unit));
		specparam T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm( 4.5*L_unit));

		(a_in *> a_y) = (T_rise_a_y, T_fall_a_y);
		(b_in *> b_y) = (T_rise_b_y, T_fall_b_y);
	endspecify

endmodule

`default_nettype wire
