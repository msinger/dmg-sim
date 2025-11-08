`default_nettype none

module sm83_or2_tap_nor_tap_in1_n_reg #(
		parameter real L_y         = 44,
		parameter real L_tap_nor   = 49,
		parameter real L_tap_in1_n = 28
	) (
		input  logic in1, in2,
		output logic y, tap_nor, tap_in1_n
	);

	import sm83_timing::*;

	assign tap_nor   = !(in1 | in2);
	assign tap_in1_n = !in1;
	assign y         = !tap_nor;

	specify
		specparam T_rise_in1_n   = tpd_elmore(L_tap_in1_n, R_pmos_ohm(12*L_unit));
		specparam T_fall_in1_n   = tpd_elmore(L_tap_in1_n, R_nmos_ohm( 9*L_unit));
		specparam T_rise_nor     = tpd_elmore(  L_tap_nor, R_pmos_ohm( 8*L_unit) * 2);
		specparam T_fall_nor_in1 = tpd_elmore(  L_tap_nor, R_nmos_ohm( 9*L_unit));
		specparam T_fall_nor_in2 = tpd_elmore(  L_tap_nor, R_nmos_ohm( 6*L_unit));
		specparam T_rise_y       = tpd_elmore(        L_y, R_pmos_ohm(12*L_unit));
		specparam T_fall_y       = tpd_elmore(        L_y, R_nmos_ohm( 7*L_unit));

		(in1 *> tap_in1_n) = (T_rise_in1_n, T_fall_in1_n);
		(in1 *> tap_nor)   = (T_rise_nor, T_fall_nor_in1);
		(in2 *> tap_nor)   = (T_rise_nor, T_fall_nor_in2);
		(in1 *> y)         = (T_fall_nor_in1 + T_rise_y, T_rise_nor + T_fall_y);
		(in2 *> y)         = (T_fall_nor_in2 + T_rise_y, T_rise_nor + T_fall_y);
	endspecify

endmodule

`default_nettype wire
