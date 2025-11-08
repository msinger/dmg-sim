`default_nettype none

module sm83_nor8_alu #(
		parameter real L_y = 50
	) (
		input  logic in1, in2, in3, in4, in5, in6, in7, in8,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(in1 | in2 | in3 | in4 | in5 | in6 | in7 | in8);

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(3*L_unit) * 8);
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(3*L_unit));

		(in1, in2, in3, in4, in5, in6, in7, in8 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
