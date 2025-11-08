`default_nettype none

module sm83_aoi21_a #(
		parameter real L_y = 22
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import sm83_timing::*;

	assign y = !((in1 & in2) | in3);

	specify
		specparam T_rise_y     = tpd_elmore(L_y, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_y     = tpd_elmore(L_y, R_nmos_ohm(3*L_unit) * 2);
		specparam T_fall_y_in3 = tpd_elmore(L_y, R_nmos_ohm(3*L_unit));

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
		(in3      *> y) = (T_rise_y, T_fall_y_in3);
	endspecify

endmodule

`default_nettype wire
