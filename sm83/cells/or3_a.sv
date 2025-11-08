`default_nettype none

module sm83_or3_a #(
		parameter real L_y = 9
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import sm83_timing::*;

	assign y = in1 | in2 | in3;

	specify
		specparam T_rise_nor = tpd_elmore( 63, R_pmos_ohm(3*L_unit) * 3);
		specparam T_fall_nor = tpd_elmore( 63, R_nmos_ohm(3*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(3*L_unit));
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm(3*L_unit));

		(in1, in2, in3 *> y) = (T_fall_nor + T_rise_y, T_rise_nor + T_fall_y);
	endspecify

endmodule

`default_nettype wire
