`default_nettype none

module sm83_not_reg_sp_we #(
		parameter real L_y = 32
	) (
		input  logic in,
		output logic y
	);

	import sm83_timing::*;

	assign y = !in;

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(14*L_unit));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm( 9*L_unit));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
