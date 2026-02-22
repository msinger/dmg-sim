`default_nettype none

module dmg_ao222 #(
		parameter real L_y = 54
	) (
		input  logic in1, in2, in3, in4, in5, in6,
		output logic y
	);

	import dmg_timing::*;

	assign y = (in1 & in2) | (in3 & in4) | (in5 & in6);

	specify
		specparam T_rise_aoi = tpd_elmore(185, R_pmos_ohm(35*L_unit) * 3);
		specparam T_fall_aoi = tpd_elmore(185, R_nmos_ohm(35*L_unit) * 2);
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(35*L_unit));
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm(35*L_unit));

		(in1, in2, in3, in4, in5, in6 *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
