`default_nettype none

module sm83_mux_idu_l #(
		parameter real L_y = 37
	) (
		input  logic d0, d1, sel,
		output logic y
	);

	import sm83_timing::*;

	assign y = sel ? d1 : d0;

	specify
		specparam T_rise_sel = tpd_elmore( 31, R_pmos_ohm( 3*L_unit));
		specparam T_fall_sel = tpd_elmore( 31, R_nmos_ohm( 3*L_unit));
		specparam T_rise_buf = tpd_elmore( 36, R_pmos_ohm( 3*L_unit) * 2);
		specparam T_fall_buf = tpd_elmore( 36, R_nmos_ohm( 3*L_unit) * 2);
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(10*L_unit));
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm( 5*L_unit));

		(d0, d1 *> y) = (T_fall_buf + T_rise_y, T_rise_buf + T_fall_y);
		(sel    *> y) = (T_rise_sel + T_fall_buf + T_rise_y, T_fall_sel + T_rise_buf + T_fall_y);
	endspecify

endmodule

`default_nettype wire
