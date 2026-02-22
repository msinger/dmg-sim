`default_nettype none

module dmg_and4 #(
		parameter real L_y = 54
	) (
		input  logic in1, in2, in3, in4,
		output logic y
	);

	import dmg_timing::*;

	assign y = in1 & in2 & in3 & in4;

	specify
		specparam T_rise_nand = tpd_elmore(140, R_pmos_ohm(35*L_unit));
		specparam T_fall_nand = tpd_elmore(140, R_nmos_ohm(35*L_unit) * 4);
		specparam T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(35*L_unit));
		specparam T_fall_y    = tpd_elmore(L_y, R_nmos_ohm(35*L_unit));

		(in1, in2, in3, in4 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
