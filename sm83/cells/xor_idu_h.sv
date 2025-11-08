`default_nettype none

module sm83_xor_idu_h #(
		parameter real L_y = 22
	) (
		input  logic in1, in2,
		output logic y
	);

	import sm83_timing::*;

	assign y = in1 ^ in2;

	specify
		specparam T_rise_nand = tpd_elmore( 26, R_pmos_ohm( 3*L_unit));
		specparam T_fall_nand = tpd_elmore( 26, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_oai  = tpd_elmore( 29, R_pmos_ohm( 5*L_unit) * 2);
		specparam T_fall_oai  = tpd_elmore( 29, R_nmos_ohm( 5*L_unit) * 2);
		specparam T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(13*L_unit));
		specparam T_fall_y    = tpd_elmore(L_y, R_nmos_ohm( 8*L_unit));

		(in1, in2 *> y) = (T_rise_nand + T_fall_oai + T_rise_y, T_fall_nand + T_rise_oai + T_fall_y);
	endspecify

endmodule

`default_nettype wire
