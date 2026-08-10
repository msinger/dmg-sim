`default_nettype none

package sm83_alu_cgen_param;

	import sm83_timing::L_unit;

	parameter real L_p0    = 0.0;
	parameter real L_g0    = 0.0;
	parameter real L_p1    = 0.0;
	parameter real L_g1    = 0.0;
	parameter real L_p2    = 0.0;
	parameter real L_g2    = 0.0;
	parameter real L_p3    = 0.0;
	parameter real L_g3    = 0.0;
	parameter real L_cin   = 0.0;
	parameter real L_cout0 = 0.0;
	parameter real L_cout1 = 0.0;
	parameter real L_cout2 = 0.0;
	parameter real L_cout3 = 0.0;

	parameter real W_gate_p0  = 88*L_unit;
	parameter real W_gate_g0  = 88*L_unit;
	parameter real W_gate_p1  = 66*L_unit;
	parameter real W_gate_g1  = 66*L_unit;
	parameter real W_gate_p2  = 44*L_unit;
	parameter real W_gate_g2  = 44*L_unit;
	parameter real W_gate_p3  = 22*L_unit;
	parameter real W_gate_g3  = 22*L_unit;
	parameter real W_gate_cin = 88*L_unit;

endpackage

module sm83_alu_cgen #(
		parameter real L_cout0      = 15 + sm83_alu_cgen_param::L_cout0,
		parameter real L_cout1      = 13 + sm83_alu_cgen_param::L_cout1,
		parameter real L_cout2      = 20 + sm83_alu_cgen_param::L_cout2,
		parameter real L_cout3      = 24 + sm83_alu_cgen_param::L_cout3,
		parameter real W_gate_cout0 = 0,
		parameter real W_gate_cout1 = 0,
		parameter real W_gate_cout2 = 0,
		parameter real W_gate_cout3 = 0
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
		specparam T_rise_g0_cin    = tpd_elmore(     70, 2*R_pmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // PMOS g0-cin path
		specparam T_fall_p0_cin    = tpd_elmore(     70, 2*R_nmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // NMOS p0-cin path
		specparam T_rise_g10_cin   = tpd_elmore(     94, 3*R_pmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // PMOS g1-g0-cin path
		specparam T_fall_p10_cin   = tpd_elmore(     94, 3*R_nmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // NMOS p1-p0-cin path
		specparam T_rise_g210_cin  = tpd_elmore(    122, 4*R_pmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // PMOS g2-g1-g0-cin path
		specparam T_fall_p210_cin  = tpd_elmore(    122, 4*R_nmos_ohm(11*L_unit), C_gate_F(16*L_unit)); // NMOS p2-p1-p0-cin path
		specparam T_rise_g3210_cin = tpd_elmore(    152, 5*R_pmos_ohm(11*L_unit), C_gate_F(35*L_unit)); // PMOS g3-g2-g1-g0-cin path
		specparam T_fall_p3210_cin = tpd_elmore(    152, 5*R_nmos_ohm(11*L_unit), C_gate_F(35*L_unit)); // NMOS p3-p2-p1-p0-cin path
		specparam T_rise_cout0     = tpd_elmore(L_cout0,   R_pmos_ohm(11*L_unit), C_gate_F(W_gate_cout0));
		specparam T_fall_cout0     = tpd_elmore(L_cout0,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_cout0));
		specparam T_rise_cout1     = tpd_elmore(L_cout1,   R_pmos_ohm(11*L_unit), C_gate_F(W_gate_cout1));
		specparam T_fall_cout1     = tpd_elmore(L_cout1,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_cout1));
		specparam T_rise_cout2     = tpd_elmore(L_cout2,   R_pmos_ohm(11*L_unit), C_gate_F(W_gate_cout2));
		specparam T_fall_cout2     = tpd_elmore(L_cout2,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_cout2));
		specparam T_rise_cout3     = tpd_elmore(L_cout3,   R_pmos_ohm(23*L_unit), C_gate_F(W_gate_cout3));
		specparam T_fall_cout3     = tpd_elmore(L_cout3,   R_nmos_ohm(12*L_unit), C_gate_F(W_gate_cout3));

		(cin, p0, g0                         *> cout0) = (T_fall_p0_cin    + T_rise_cout0, T_rise_g0_cin    + T_fall_cout0);
		(cin, p0, g0, p1, g1                 *> cout1) = (T_fall_p10_cin   + T_rise_cout1, T_rise_g10_cin   + T_fall_cout1);
		(cin, p0, g0, p1, g1, p2, g2         *> cout2) = (T_fall_p210_cin  + T_rise_cout2, T_rise_g210_cin  + T_fall_cout2);
		(cin, p0, g0, p1, g1, p2, g2, p3, g3 *> cout3) = (T_fall_p3210_cin + T_rise_cout3, T_rise_g3210_cin + T_fall_cout3);
	endspecify

endmodule

`default_nettype wire
