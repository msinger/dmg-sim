`default_nettype none

module dmg_buf_if0 #(
		parameter real L_y = 54
	) (
		input  logic in, ena_n,
		output logic y
	);

	import dmg_timing::*;

	assign y = ena_n ? 'z : !(!in);

	specify
		specparam T_rise_not  = tpd_elmore(116, R_pmos_ohm(35*L_unit));
		specparam T_fall_not  = tpd_elmore(116, R_nmos_ohm(35*L_unit));
		specparam T_rise_nand = tpd_elmore(152, R_pmos_ohm(35*L_unit));
		specparam T_fall_nand = tpd_elmore(152, R_nmos_ohm(35*L_unit) * 2);
		specparam T_rise_nor  = tpd_elmore(125, R_pmos_ohm(35*L_unit) * 2);
		specparam T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(70*L_unit));
		specparam T_fall_y    = tpd_elmore(L_y, R_nmos_ohm(70*L_unit));
		specparam T_Z_y       = tpd_z(tpd_elmore(L_y, R_pmos_ohm(70*L_unit)),
		                              tpd_elmore(L_y, R_nmos_ohm(70*L_unit)));

		(in    *> y) = (T_fall_nand + T_rise_y, T_rise_nor + T_fall_y);
		(ena_n *> y) = (T_rise_not + T_fall_nand + T_rise_y,
		                T_rise_nor + T_fall_y,
		                T_fall_not + T_rise_nand + T_Z_y);
	endspecify

endmodule

`default_nettype wire
