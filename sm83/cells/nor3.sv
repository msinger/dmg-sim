`default_nettype none

module sm83_nor3 #(
		parameter real L_y = 21
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import sm83_timing::*;

	assign y = !(in1 | in2 | in3);

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(5*L_unit) * 3);
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(5*L_unit));

		(in1, in2, in3 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
