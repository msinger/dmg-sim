`default_nettype none

package sm83_buf_dec2_param;

	import sm83_timing::L_unit;

	parameter real L_in = 0.0;
	parameter real L_y  = 0.0;

	parameter real W_gate_in = 14*L_unit;

endpackage

module sm83_buf_dec2 #(
		parameter real L_y      = 27 + sm83_buf_dec2_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in,
		output logic y
	);

	import sm83_timing::*;

	assign y = in;

	specify
		specparam T_rise_not = tpd_elmore( 25, R_pmos_ohm( 6*L_unit), C_gate_F(42*L_unit));
		specparam T_fall_not = tpd_elmore( 25, R_nmos_ohm( 8*L_unit), C_gate_F(42*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y, R_pmos_ohm(34*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y   = tpd_elmore(L_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_fall_not + T_rise_y, T_rise_not + T_fall_y);
	endspecify

endmodule

`default_nettype wire
