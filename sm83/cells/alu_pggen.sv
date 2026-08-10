`default_nettype none

package sm83_alu_pggen_param;

	import sm83_timing::L_unit;

	parameter real L_xor_in1     = 0.0;
	parameter real L_xor_in2     = 0.0;
	parameter real L_and_or_in2  = 0.0;
	parameter real L_ao221_in2   = 0.0;
	parameter real L_ao221_in3   = 0.0;
	parameter real L_pch_n       = 0.0;
	parameter real L_ao221_in5_n = 0.0;
	parameter real L_tap_xor     = 0.0;
	parameter real L_tap_nand    = 0.0;
	parameter real L_tap_and     = 0.0;
	parameter real L_tap_or      = 0.0;
	parameter real L_y           = 0.0;

	parameter real W_gate_xor_in1     = 20*L_unit;
	parameter real W_gate_xor_in2     = 20*L_unit;
	parameter real W_gate_and_or_in2  = 20*L_unit;
	parameter real W_gate_ao221_in2   = 10*L_unit;
	parameter real W_gate_ao221_in3   = 10*L_unit;
	parameter real W_gate_pch_n       =  5*L_unit;
	parameter real W_gate_ao221_in5_n = 10*L_unit;

endpackage

module sm83_alu_pggen #(
		parameter real L_ao221_in5_n      = 74 + sm83_alu_pggen_param::L_ao221_in5_n,
		parameter real L_tap_xor          = 54 + sm83_alu_pggen_param::L_tap_xor,
		parameter real L_tap_nand         = 84 + sm83_alu_pggen_param::L_tap_nand,
		parameter real L_tap_and          = 58 + sm83_alu_pggen_param::L_tap_and,
		parameter real L_tap_or           = 83 + sm83_alu_pggen_param::L_tap_or,
		parameter real L_y                = 23 + sm83_alu_pggen_param::L_y,
		parameter real W_gate_ao221_in5_n = sm83_alu_pggen_param::W_gate_ao221_in5_n,
		parameter real W_gate_tap_xor     = 0,
		parameter real W_gate_tap_nand    = 0,
		parameter real W_gate_tap_and     = 0,
		parameter real W_gate_tap_or      = 0,
		parameter real W_gate_y           = 0
	) (
		input      logic xor_in1, xor_in2, and_or_in2, ao221_in2, ao221_in3, pch_n,
		inout  tri logic ao221_in5_n,
		output     logic tap_xor, tap_nand, tap_and, tap_or, y
	);

	import sm83_timing::*;

	assign tap_xor  = xor_in1 ^ xor_in2;
	assign tap_nand = !(tap_xor & and_or_in2);
	assign tap_and  = !tap_nand;
	assign tap_or   = tap_xor | and_or_in2;
	assign y        = (tap_and & ao221_in2) | (ao221_in3 & tap_or) | !ao221_in5_n;

	localparam realtime T_rise_buf = tpd_elmore(L_ao221_in5_n, R_pmos_ohm(5*L_unit), C_gate_F(W_gate_ao221_in5_n));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, T_Z_buf, T_Z_buf) (ao221_in5_n, '1, pch_n);

	specify
		specparam T_rise_xornand  = tpd_elmore(        31,   R_pmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_xornand  = tpd_elmore(        31, 2*R_nmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_oai      = tpd_elmore(        28, 2*R_pmos_ohm( 5*L_unit), C_gate_F(23*L_unit));
		specparam T_fall_oai      = tpd_elmore(        28, 2*R_nmos_ohm( 5*L_unit), C_gate_F(23*L_unit));
		specparam T_rise_tap_xor  = tpd_elmore( L_tap_xor,   R_pmos_ohm(15*L_unit), C_gate_F(20*L_unit+W_gate_tap_xor));
		specparam T_fall_tap_xor  = tpd_elmore( L_tap_xor,   R_nmos_ohm( 8*L_unit), C_gate_F(20*L_unit+W_gate_tap_xor));
		specparam T_rise_tap_nand = tpd_elmore(L_tap_nand,   R_pmos_ohm( 5*L_unit), C_gate_F(23*L_unit+W_gate_tap_nand));
		specparam T_fall_tap_nand = tpd_elmore(L_tap_nand, 2*R_nmos_ohm( 5*L_unit), C_gate_F(23*L_unit+W_gate_tap_nand));
		specparam T_rise_tap_and  = tpd_elmore( L_tap_and,   R_pmos_ohm(15*L_unit), C_gate_F(10*L_unit+W_gate_tap_and));
		specparam T_fall_tap_and  = tpd_elmore( L_tap_and,   R_nmos_ohm( 8*L_unit), C_gate_F(10*L_unit+W_gate_tap_and));
		specparam T_rise_nor      = tpd_elmore(        29, 2*R_pmos_ohm( 5*L_unit), C_gate_F(23*L_unit));
		specparam T_fall_nor      = tpd_elmore(        29,   R_nmos_ohm( 5*L_unit), C_gate_F(23*L_unit));
		specparam T_rise_tap_or   = tpd_elmore(  L_tap_or,   R_pmos_ohm(15*L_unit), C_gate_F(10*L_unit+W_gate_tap_or));
		specparam T_fall_tap_or   = tpd_elmore(  L_tap_or,   R_nmos_ohm( 8*L_unit), C_gate_F(10*L_unit+W_gate_tap_or));
		specparam T_rise_nand     = tpd_elmore(        32,   R_pmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_nand     = tpd_elmore(        32, 2*R_nmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_y        = tpd_elmore(       L_y,   R_pmos_ohm( 5*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y        = tpd_elmore(       L_y, 3*R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_y));

		(xor_in1, xor_in2 *> tap_xor) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor,
		                                 T_fall_xornand + T_rise_oai + T_fall_tap_xor);

		(and_or_in2       *> tap_nand) = (T_rise_tap_nand, T_fall_tap_nand);
		(xor_in1, xor_in2 *> tap_nand) = (T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_tap_nand,
		                                  T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand);

		(and_or_in2       *> tap_and) = (T_fall_tap_nand + T_rise_tap_and, T_rise_tap_nand + T_fall_tap_and);
		(xor_in1, xor_in2 *> tap_and) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand + T_rise_tap_and,
		                                 T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_tap_nand + T_fall_tap_and);

		(and_or_in2       *> tap_or) = (T_fall_nor + T_rise_tap_or, T_rise_nor + T_fall_tap_or);
		(xor_in1, xor_in2 *> tap_or) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_nor + T_rise_tap_or,
		                                T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_nor + T_fall_tap_or);

		(ao221_in5_n          *> y) = (T_rise_y, T_fall_y);
		(ao221_in2, ao221_in3 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
		(and_or_in2           *> y) = (T_fall_tap_nand + T_rise_tap_and + T_fall_nand + T_rise_y,
		                               T_rise_nor      + T_fall_tap_or  + T_rise_nand + T_fall_y);
		(xor_in1, xor_in2     *> y) = (T_rise_xornand + T_fall_oai + T_rise_tap_xor + T_fall_tap_nand + T_rise_tap_and + T_fall_nand + T_rise_y,
		                               T_fall_xornand + T_rise_oai + T_fall_tap_xor + T_rise_nor      + T_fall_tap_or  + T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
