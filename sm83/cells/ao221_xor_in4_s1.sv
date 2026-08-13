`default_nettype none

package sm83_ao221_xor_in4_s1_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 78.2;
	parameter real L_in2 =  0.0;
	parameter real L_in3 =  0.0;
	parameter real L_in4 =  0.0;
	parameter real L_in5 =  0.0;
	parameter real L_y   =  0.0;

	parameter real W_gate_in1 = 20*L_unit;
	parameter real W_gate_in2 = 10*L_unit;
	parameter real W_gate_in3 = 10*L_unit;
	parameter real W_gate_in4 = 10*L_unit;
	parameter real W_gate_in5 = 10*L_unit;

endpackage

module sm83_ao221_xor_in4_s1 #(
		parameter real L_y      = 34 + sm83_ao221_xor_in4_s1_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y
	);

	import sm83_timing::*;

	assign y = (in1 & in2) | (in3 & (in1 ^ in4)) | in5;

	specify
		specparam T_rise_nand    = tpd_elmore( 34,   R_pmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_nand    = tpd_elmore( 34, 2*R_nmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_oai     = tpd_elmore( 28, 2*R_pmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_oai     = tpd_elmore( 28, 2*R_nmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_xor     = tpd_elmore( 38,   R_pmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_xor     = tpd_elmore( 38,   R_nmos_ohm( 5*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_aoi     = tpd_elmore( 45, 3*R_pmos_ohm( 5*L_unit), C_gate_F(33*L_unit));
		specparam T_fall_aoi     = tpd_elmore( 45, 2*R_nmos_ohm( 5*L_unit), C_gate_F(33*L_unit));
		specparam T_fall_aoi_in5 = tpd_elmore( 45,   R_nmos_ohm( 5*L_unit), C_gate_F(33*L_unit));
		specparam T_rise_y       = tpd_elmore(L_y,   R_pmos_ohm(22*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y       = tpd_elmore(L_y,   R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y));

		(in2, in3 *> y) = (T_fall_aoi     + T_rise_y, T_rise_aoi + T_fall_y);
		(in5      *> y) = (T_fall_aoi_in5 + T_rise_y, T_rise_aoi + T_fall_y);
		(in1, in4 *> y) = (T_rise_nand + T_fall_oai + T_rise_xor + T_fall_aoi + T_rise_y,
		                   T_fall_nand + T_rise_oai + T_fall_xor + T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
