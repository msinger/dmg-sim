`default_nettype none

module dmg_not_x6 #(
		parameter real L_y = 54
	) (
		input  logic in,
		output logic y
	);

	import dmg_timing::*;

	assign y = !in;

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(210*L_unit));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(210*L_unit));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
