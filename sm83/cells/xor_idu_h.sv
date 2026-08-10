`default_nettype none

package sm83_xor_idu_h_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 16*L_unit;
	parameter real W_gate_in2 = 16*L_unit;

endpackage

module sm83_xor_idu_h #(
		parameter real L_y      = 22 + sm83_xor_idu_h_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2,
		output logic y
	);

	import sm83_timing::*;

	assign y = in1 ^ in2;

	specify
		specparam T_rise_nand = tpd_elmore( 26,   R_pmos_ohm( 3*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_nand = tpd_elmore( 26, 2*R_nmos_ohm( 3*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_oai  = tpd_elmore( 29, 2*R_pmos_ohm( 5*L_unit), C_gate_F(21*L_unit));
		specparam T_fall_oai  = tpd_elmore( 29, 2*R_nmos_ohm( 5*L_unit), C_gate_F(21*L_unit));
		specparam T_rise_y    = tpd_elmore(L_y,   R_pmos_ohm(13*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y    = tpd_elmore(L_y,   R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_rise_nand + T_fall_oai + T_rise_y, T_fall_nand + T_rise_oai + T_fall_y);
	endspecify

endmodule

`default_nettype wire
