`default_nettype none

module sm83_ao31_in3_n #(
		parameter real L_y = 24
	) (
		input  logic in1, in2, in3_n, in4,
		output logic y
	);

	import sm83_timing::*;

	assign y = (in1 & in2 & !in3_n) | in4;

	specify
		specparam T_rise_in3     = tpd_elmore( 47, R_pmos_ohm( 3*L_unit));
		specparam T_fall_in3     = tpd_elmore( 47, R_nmos_ohm( 3*L_unit));
		specparam T_rise_aoi     = tpd_elmore( 31, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_aoi     = tpd_elmore( 31, R_nmos_ohm( 3*L_unit) * 3);
		specparam T_fall_aoi_in4 = tpd_elmore( 31, R_nmos_ohm( 3*L_unit));
		specparam T_rise_y       = tpd_elmore(L_y, R_pmos_ohm(12*L_unit));
		specparam T_fall_y       = tpd_elmore(L_y, R_nmos_ohm( 5*L_unit));

		(in1, in2 *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
		(in4      *> y) = (T_fall_aoi_in4 + T_rise_y, T_rise_aoi + T_fall_y);
		(in3_n    *> y) = (T_rise_in3 + T_fall_aoi + T_rise_y, T_fall_in3 + T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
