`default_nettype none

package sm83_ao31_in3_n_param;

	import sm83_timing::L_unit;

	parameter real L_in1   = 0.0;
	parameter real L_in2   = 0.0;
	parameter real L_in3_n = 0.0;
	parameter real L_in4   = 0.0;
	parameter real L_y     = 0.0;

	parameter real W_gate_in1   = 6*L_unit;
	parameter real W_gate_in2   = 6*L_unit;
	parameter real W_gate_in3_n = 6*L_unit;
	parameter real W_gate_in4   = 6*L_unit;

endpackage

module sm83_ao31_in3_n #(
		parameter real L_y      = 24 + sm83_ao31_in3_n_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3_n, in4,
		output logic y
	);

	import sm83_timing::*;

	assign y = (in1 & in2 & !in3_n) | in4;

	specify
		specparam T_rise_in3     = tpd_elmore( 47,   R_pmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_fall_in3     = tpd_elmore( 47,   R_nmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_rise_aoi     = tpd_elmore( 31, 2*R_pmos_ohm( 3*L_unit), C_gate_F(17*L_unit));
		specparam T_fall_aoi     = tpd_elmore( 31, 3*R_nmos_ohm( 3*L_unit), C_gate_F(17*L_unit));
		specparam T_fall_aoi_in4 = tpd_elmore( 31,   R_nmos_ohm( 3*L_unit), C_gate_F(17*L_unit));
		specparam T_rise_y       = tpd_elmore(L_y,   R_pmos_ohm(12*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y       = tpd_elmore(L_y,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
		(in4      *> y) = (T_fall_aoi_in4 + T_rise_y, T_rise_aoi + T_fall_y);
		(in3_n    *> y) = (T_rise_in3 + T_fall_aoi + T_rise_y, T_fall_in3 + T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
