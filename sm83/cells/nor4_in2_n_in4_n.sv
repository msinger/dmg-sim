`default_nettype none

module sm83_nor4_in2_n_in4_n #(
		parameter real L_y = 23
	) (
		input  logic in1, in2_n, in3, in4_n,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(in1 | !in2_n | in3 | !in4_n);

	specify
		specparam T_rise_in2 = tpd_elmore( 47, R_pmos_ohm(3*L_unit));
		specparam T_fall_in2 = tpd_elmore( 47, R_nmos_ohm(3*L_unit));
		specparam T_rise_in4 = tpd_elmore( 35, R_pmos_ohm(3*L_unit));
		specparam T_fall_in4 = tpd_elmore( 35, R_nmos_ohm(3*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm(3*L_unit));

		(in1, in3 *> y) = (T_rise_y, T_fall_y);
		(in2_n    *> y) = (T_fall_in2 + T_rise_y, T_rise_in2 + T_fall_y);
		(in4_n    *> y) = (T_fall_in4 + T_rise_y, T_rise_in4 + T_fall_y);
	endspecify

endmodule

`default_nettype wire
