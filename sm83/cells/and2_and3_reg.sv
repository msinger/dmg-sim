`default_nettype none

module sm83_and2_and3_reg #(
		parameter real L_a_y = 40,
		parameter real L_b_y = 34
	) (
		input  logic a_in1, a_in2, b_in1, b_in2, b_in3,
		output logic a_y, b_y
	);

	import sm83_timing::*;

	assign a_y = a_in1 & a_in2;
	assign b_y = b_in1 & b_in2 & b_in3;

	specify
		specparam T_rise_nand2 = tpd_elmore(   29, R_pmos_ohm( 3*L_unit));
		specparam T_fall_nand2 = tpd_elmore(   29, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_a_y   = tpd_elmore(L_a_y, R_pmos_ohm( 8*L_unit));
		specparam T_fall_a_y   = tpd_elmore(L_a_y, R_nmos_ohm( 5*L_unit));
		specparam T_rise_nand3 = tpd_elmore(   35, R_pmos_ohm( 3*L_unit));
		specparam T_fall_nand3 = tpd_elmore(   35, R_nmos_ohm( 3*L_unit) * 3);
		specparam T_rise_b_y   = tpd_elmore(L_b_y, R_pmos_ohm(10*L_unit));
		specparam T_fall_b_y   = tpd_elmore(L_b_y, R_nmos_ohm( 8*L_unit));

		(a_in1, a_in2        *> a_y) = (T_fall_nand2 + T_rise_a_y, T_rise_nand2 + T_fall_a_y);
		(b_in1, b_in2, b_in3 *> b_y) = (T_fall_nand3 + T_rise_b_y, T_rise_nand3 + T_fall_b_y);
	endspecify

endmodule

`default_nettype wire
