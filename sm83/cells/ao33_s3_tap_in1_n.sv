`default_nettype none

module sm83_ao33_s3_tap_in1_n #(
		parameter real L_y         = 30,
		parameter real L_tap_in1_n = 14
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y, tap_in1_n
	);

	import sm83_timing::*;

	assign y         = (in1 & in2 & in3) | (in4 & in5 & in3);
	assign tap_in1_n = !in1;

	specify
		specparam T_rise_aoi     = tpd_elmore(         14, R_pmos_ohm(3*L_unit) * 2);
		specparam T_rise_aoi_in3 = tpd_elmore(         14, R_pmos_ohm(3*L_unit));
		specparam T_fall_aoi     = tpd_elmore(         14, R_nmos_ohm(3*L_unit) * 3);
		specparam T_rise_y       = tpd_elmore(        L_y, R_pmos_ohm(3*L_unit));
		specparam T_fall_y       = tpd_elmore(        L_y, R_nmos_ohm(3*L_unit));
		specparam T_rise_in1_n   = tpd_elmore(L_tap_in1_n, R_pmos_ohm(4*L_unit));
		specparam T_fall_in1_n   = tpd_elmore(L_tap_in1_n, R_nmos_ohm(4*L_unit));

		(in1, in2, in4, in5 *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
		(in3                *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi_in3 + T_fall_y);

		(in1 *> tap_in1_n) = (T_rise_in1_n, T_fall_in1_n);
	endspecify

endmodule

`default_nettype wire
