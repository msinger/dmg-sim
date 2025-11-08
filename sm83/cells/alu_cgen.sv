`default_nettype none

module sm83_alu_cgen #(
		parameter real L_cout0 = 15,
		parameter real L_cout1 = 13,
		parameter real L_cout2 = 20,
		parameter real L_cout3 = 24
	) (
		input  logic p0, g0, p1, g1, p2, g2, p3, g3, cin,
		output logic cout0, cout1, cout2, cout3
	);

	import sm83_timing::*;

	logic cout0_n_p, cout0_n_n;
	logic cout1_n_p, cout1_n_n;
	logic cout2_n_p, cout2_n_n;
	logic cout3_n_p, cout3_n_n;

	assign cout0_n_p = !((cin | g0) & p0);
	assign cout0_n_n = !((cin & p0) | g0);

	assign cout1_n_p = !((((cin | g0) & p0) | g1) & p1);
	assign cout1_n_n = !((((cin & p0) | g0) & p1) | g1);

	assign cout2_n_p = !((((((cin | g0) & p0) | g1) & p1) | g2) & p2);
	assign cout2_n_n = !((((((cin & p0) | g0) & p1) | g1) & p2) | g2);

	assign cout3_n_p = !((((((((cin | g0) & p0) | g1) & p1) | g2) & p2) | g3) & p3);
	assign cout3_n_n = !((((((((cin & p0) | g0) & p1) | g1) & p2) | g2) & p3) | g3);

	assign cout0 = (cout0_n_p === cout0_n_n) ? !cout0_n_p : 'x;
	assign cout1 = (cout1_n_p === cout1_n_n) ? !cout1_n_p : 'x;
	assign cout2 = (cout2_n_p === cout2_n_n) ? !cout2_n_p : 'x;
	assign cout3 = (cout3_n_p === cout3_n_n) ? !cout3_n_p : 'x;

	specify
		specparam T_rise_g0_cin    = tpd_elmore(     70, R_pmos_ohm(11*L_unit) * 2); // PMOS g0-cin path
		specparam T_fall_p0_cin    = tpd_elmore(     70, R_nmos_ohm(11*L_unit) * 2); // NMOS p0-cin path
		specparam T_rise_g10_cin   = tpd_elmore(     94, R_pmos_ohm(11*L_unit) * 3); // PMOS g1-g0-cin path
		specparam T_fall_p10_cin   = tpd_elmore(     94, R_nmos_ohm(11*L_unit) * 3); // NMOS p1-p0-cin path
		specparam T_rise_g210_cin  = tpd_elmore(    122, R_pmos_ohm(11*L_unit) * 4); // PMOS g2-g1-g0-cin path
		specparam T_fall_p210_cin  = tpd_elmore(    122, R_nmos_ohm(11*L_unit) * 4); // NMOS p2-p1-p0-cin path
		specparam T_rise_g3210_cin = tpd_elmore(    152, R_pmos_ohm(11*L_unit) * 5); // PMOS g3-g2-g1-g0-cin path
		specparam T_fall_p3210_cin = tpd_elmore(    152, R_nmos_ohm(11*L_unit) * 5); // NMOS p3-p2-p1-p0-cin path
		specparam T_rise_cout0     = tpd_elmore(L_cout0, R_pmos_ohm(11*L_unit));
		specparam T_fall_cout0     = tpd_elmore(L_cout0, R_nmos_ohm( 5*L_unit));
		specparam T_rise_cout1     = tpd_elmore(L_cout1, R_pmos_ohm(11*L_unit));
		specparam T_fall_cout1     = tpd_elmore(L_cout1, R_nmos_ohm( 5*L_unit));
		specparam T_rise_cout2     = tpd_elmore(L_cout2, R_pmos_ohm(11*L_unit));
		specparam T_fall_cout2     = tpd_elmore(L_cout2, R_nmos_ohm( 5*L_unit));
		specparam T_rise_cout3     = tpd_elmore(L_cout3, R_pmos_ohm(23*L_unit));
		specparam T_fall_cout3     = tpd_elmore(L_cout3, R_nmos_ohm(12*L_unit));

		(cin, p0, g0                         *> cout0) = (T_fall_p0_cin    + T_rise_cout0, T_rise_g0_cin    + T_fall_cout0);
		(cin, p0, g0, p1, g1                 *> cout1) = (T_fall_p10_cin   + T_rise_cout1, T_rise_g10_cin   + T_fall_cout1);
		(cin, p0, g0, p1, g1, p2, g2         *> cout2) = (T_fall_p210_cin  + T_rise_cout2, T_rise_g210_cin  + T_fall_cout2);
		(cin, p0, g0, p1, g1, p2, g2, p3, g3 *> cout3) = (T_fall_p3210_cin + T_rise_cout3, T_rise_g3210_cin + T_fall_cout3);
	endspecify

endmodule

`default_nettype wire
