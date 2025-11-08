`default_nettype none

module sm83_buf_dec2 #(
		parameter real L_y = 27
	) (
		input  logic in,
		output logic y
	);

	import sm83_timing::*;

	assign y = in;

	specify
		specparam T_rise_not = tpd_elmore( 25, R_pmos_ohm( 6*L_unit));
		specparam T_fall_not = tpd_elmore( 25, R_nmos_ohm( 8*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(34*L_unit));
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm( 8*L_unit));

		(in *> y) = (T_fall_not + T_rise_y, T_rise_not + T_fall_y);
	endspecify

endmodule

`default_nettype wire
