`default_nettype none

module dmg_not_if1 #(
		parameter real L_y = 54
	) (
		input  logic in, ena,
		output logic y
	);

	import dmg_timing::*;

	assign y = ena ? !in : 'z;

	specify
		specparam T_rise_not1 = tpd_elmore(153, R_pmos_ohm(35*L_unit));
		specparam T_fall_not1 = tpd_elmore(153, R_nmos_ohm(35*L_unit));
		specparam T_rise_not2 = tpd_elmore( 90, R_pmos_ohm(35*L_unit));
		specparam T_fall_not2 = tpd_elmore( 90, R_nmos_ohm(35*L_unit));
		specparam T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(35*L_unit) * 2);
		specparam T_fall_y    = tpd_elmore(L_y, R_nmos_ohm(35*L_unit) * 2);
		specparam T_Z_y       = tpd_z(tpd_elmore(L_y, R_pmos_ohm(35*L_unit) * 2),
		                              tpd_elmore(L_y, R_nmos_ohm(35*L_unit) * 2));

		(in  *> y) = (T_rise_y, T_fall_y);
		(ena *> y) = (T_fall_not1 + T_rise_y,
		              T_fall_not1 + T_rise_not2 + T_fall_y,
		              T_rise_not1 + T_fall_not2 + T_Z_y);
	endspecify

endmodule

`default_nettype wire
