`default_nettype none

module sm83_not5_irq #(
		parameter real L_a_y = 59,
		parameter real L_b_y = 58,
		parameter real L_c_y = 17,
		parameter real L_d_y = 34,
		parameter real L_e_y = 12
	) (
		input  logic a_in, b_in, c_in, d_in, e_in,
		output logic a_y, b_y, c_y, d_y, e_y
	);

	import sm83_timing::*;

	assign a_y = !a_in;
	assign b_y = !b_in;
	assign c_y = !c_in;
	assign d_y = !d_in;
	assign e_y = !e_in;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm( 5*L_unit));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm( 5*L_unit));
		specparam T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm( 5*L_unit));
		specparam T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm( 5*L_unit));
		specparam T_rise_c_y = tpd_elmore(L_c_y, R_pmos_ohm( 5*L_unit));
		specparam T_fall_c_y = tpd_elmore(L_c_y, R_nmos_ohm( 5*L_unit));
		specparam T_rise_d_y = tpd_elmore(L_d_y, R_pmos_ohm(14*L_unit));
		specparam T_fall_d_y = tpd_elmore(L_d_y, R_nmos_ohm( 8*L_unit));
		specparam T_rise_e_y = tpd_elmore(L_e_y, R_pmos_ohm(14*L_unit));
		specparam T_fall_e_y = tpd_elmore(L_e_y, R_nmos_ohm( 8*L_unit));

		(a_in *> a_y) = (T_rise_a_y, T_fall_a_y);
		(b_in *> b_y) = (T_rise_b_y, T_fall_b_y);
		(c_in *> c_y) = (T_rise_c_y, T_fall_c_y);
		(d_in *> d_y) = (T_rise_d_y, T_fall_d_y);
		(e_in *> e_y) = (T_rise_e_y, T_fall_e_y);
	endspecify

endmodule

`default_nettype wire
