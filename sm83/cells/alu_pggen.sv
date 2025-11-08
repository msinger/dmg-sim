`default_nettype none

module sm83_alu_pggen #(
		parameter real L_ao221_in5_n = 74,
		parameter real L_tap_xor     = 54,
		parameter real L_tap_nand    = 84,
		parameter real L_tap_and     = 58,
		parameter real L_tap_or      = 83,
		parameter real L_y           = 23
	) (
		input      logic xor_in1, xor_in2, and_or_in2, ao221_in2, ao221_in3, pch_n,
		inout  tri logic ao221_in5_n,
		output     logic tap_xor, tap_nand, tap_and, tap_or, y
	);

	import sm83_timing::*;

	assign tap_xor  = xor_in1 ^ xor_in2;
	assign tap_nand = !(tap_xor & and_or_in2);
	assign tap_and  = !tap_nand;
	assign tap_or   = tap_xor | and_or_in2;
	assign y        = (tap_and & ao221_in2) | (ao221_in3 & tap_or) | !ao221_in5_n;

	localparam realtime T_rise_buf = tpd_elmore(L_ao221_in5_n, R_pmos_ohm(5*L_unit));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, 0, T_Z_buf) (ao221_in5_n, '1, pch_n);

	specify
		specparam T_rise_xornand  = tpd_elmore(        31, R_pmos_ohm( 5*L_unit));
		specparam T_fall_xornand  = tpd_elmore(        31, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_oai      = tpd_elmore(        28, R_pmos_ohm( 5*L_unit) * 2);
		specparam T_fall_oai      = tpd_elmore(        28, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_tap_xor  = tpd_elmore( L_tap_xor, R_pmos_ohm(15*L_unit));
		specparam T_fall_tap_xor  = tpd_elmore( L_tap_xor, R_nmos_ohm( 8*L_unit));
		specparam T_rise_tap_nand = tpd_elmore(L_tap_nand, R_pmos_ohm( 5*L_unit));
		specparam T_fall_tap_nand = tpd_elmore(L_tap_nand, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_tap_and  = tpd_elmore( L_tap_and, R_pmos_ohm(15*L_unit));
		specparam T_fall_tap_and  = tpd_elmore( L_tap_and, R_nmos_ohm( 8*L_unit));
		specparam T_rise_nor      = tpd_elmore(        29, R_pmos_ohm( 5*L_unit) * 2);
		specparam T_fall_nor      = tpd_elmore(        29, R_nmos_ohm( 5*L_unit));
		specparam T_rise_tap_or   = tpd_elmore(  L_tap_or, R_pmos_ohm(15*L_unit));
		specparam T_fall_tap_or   = tpd_elmore(  L_tap_or, R_nmos_ohm( 8*L_unit));
		specparam T_rise_nand     = tpd_elmore(        32, R_pmos_ohm( 5*L_unit));
		specparam T_fall_nand     = tpd_elmore(        32, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_y        = tpd_elmore(       L_y, R_pmos_ohm( 5*L_unit));
		specparam T_fall_y        = tpd_elmore(       L_y, R_nmos_ohm( 5*L_unit) * 3);

		(xor_in1, xor_in2 *> tap_xor) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor,
		                                 T_fall_xornand + T_rise_oai + T_fall_tap_xor);

		(and_or_in2       *> tap_nand) = (T_rise_tap_nand, T_fall_tap_nand);
		(xor_in1, xor_in2 *> tap_nand) = (T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_tap_nand,
		                                  T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand);

		(and_or_in2       *> tap_and) = (T_fall_tap_nand + T_rise_tap_and, T_rise_tap_nand + T_fall_tap_and);
		(xor_in1, xor_in2 *> tap_and) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand + T_rise_tap_and,
		                                 T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_tap_nand + T_fall_tap_and);

		(and_or_in2       *> tap_or) = (T_fall_nor + T_rise_tap_or, T_rise_nor + T_fall_tap_or);
		(xor_in1, xor_in2 *> tap_or) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_nor + T_rise_tap_or,
		                                T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_nor + T_fall_tap_or);

		(ao221_in5_n          *> y) = (T_rise_y, T_fall_y);
		(ao221_in2, ao221_in3 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
		(and_or_in2           *> y) = (T_fall_tap_nand + T_rise_tap_and + T_fall_nand + T_rise_y,
		                               T_rise_nor      + T_fall_tap_or  + T_rise_nand + T_fall_y);
		(xor_in1, xor_in2     *> y) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand + T_rise_tap_and + T_fall_nand + T_rise_y,
		                               T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_nor      + T_fall_tap_or  + T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
