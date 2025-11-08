`default_nettype none

module sm83_ao221_xor_in4_s1 #(
		parameter real L_y = 34
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y
	);

	import sm83_timing::*;

	assign y = (in1 & in2) | (in3 & (in1 ^ in4)) | in5;

	specify
		specparam T_rise_nand    = tpd_elmore( 34, R_pmos_ohm( 5*L_unit));
		specparam T_fall_nand    = tpd_elmore( 34, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_oai     = tpd_elmore( 28, R_pmos_ohm( 5*L_unit) * 2);
		specparam T_fall_oai     = tpd_elmore( 28, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_xor     = tpd_elmore( 38, R_pmos_ohm( 5*L_unit));
		specparam T_fall_xor     = tpd_elmore( 38, R_nmos_ohm( 5*L_unit));
		specparam T_rise_aoi     = tpd_elmore( 45, R_pmos_ohm( 5*L_unit) * 3);
		specparam T_fall_aoi     = tpd_elmore( 45, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_fall_aoi_in5 = tpd_elmore( 45, R_nmos_ohm( 5*L_unit));
		specparam T_rise_y       = tpd_elmore(L_y, R_pmos_ohm(22*L_unit));
		specparam T_fall_y       = tpd_elmore(L_y, R_nmos_ohm(11*L_unit));

		(in2, in3 *> y) = (T_fall_aoi     + T_rise_y, T_rise_aoi + T_fall_y);
		(in5      *> y) = (T_fall_aoi_in5 + T_rise_y, T_rise_aoi + T_fall_y);
		(in1, in4 *> y) = (T_rise_nand + T_fall_oai + T_rise_xor + T_fall_aoi + T_rise_y,
		                   T_fall_nand + T_rise_oai + T_fall_xor + T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
