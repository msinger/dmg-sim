`default_nettype none

module dmg_nand2 #(
		parameter real L_y = 54
	) (
		input  logic in1, in2,
		output logic y
	);

	import dmg_timing::*;

	assign y = !(in1 & in2);

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(35*L_unit));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(35*L_unit) * 2);

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
