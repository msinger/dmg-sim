`default_nettype none

module sm83_and2_reg #(
		parameter real L_y = 24
	) (
		input  logic in1, in2,
		output logic y
	);

	import sm83_timing::*;

	assign y = in1 & in2;

	specify
		specparam T_rise_nand = tpd_elmore( 27, R_pmos_ohm(3*L_unit));
		specparam T_fall_nand = tpd_elmore( 27, R_nmos_ohm(3*L_unit) * 2);
		specparam T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(9*L_unit));
		specparam T_fall_y    = tpd_elmore(L_y, R_nmos_ohm(5*L_unit));

		(in1, in2 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
