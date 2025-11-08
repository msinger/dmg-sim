`default_nettype none

module sm83_oa211_in1_n_in3_n #(
		parameter real L_y = 33
	) (
		input  logic in1_n, in2, in3_n, in4,
		output logic y
	);

	import sm83_timing::*;

	assign y = (!in1_n | in2) & !in3_n & in4;

	specify
		specparam T_rise_aoai       = tpd_elmore( 15, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_rise_aoai_in4   = tpd_elmore( 15, R_pmos_ohm( 3*L_unit));
		specparam T_fall_aoai       = tpd_elmore( 15, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_fall_aoai_in1_n = tpd_elmore( 15, R_nmos_ohm( 3*L_unit));
		specparam T_rise_nor        = tpd_elmore( 42, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_nor        = tpd_elmore( 42, R_nmos_ohm( 3*L_unit));
		specparam T_rise_y          = tpd_elmore(L_y, R_pmos_ohm(16*L_unit));
		specparam T_fall_y          = tpd_elmore(L_y, R_nmos_ohm( 8*L_unit));

		(in2, in4 *> y) = (T_fall_aoai + T_rise_y, T_rise_aoai + T_fall_y);
		(in3_n    *> y) = (T_rise_nor + T_fall_aoai + T_rise_y, T_fall_nor + T_rise_aoai + T_fall_y);
		(in1_n    *> y) = (T_rise_nor + T_fall_aoai_in1_n + T_rise_y, T_fall_nor + T_rise_aoai + T_fall_y);
	endspecify

endmodule

`default_nettype wire
