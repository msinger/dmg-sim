`default_nettype none

package sm83_ao33_s3_tap_in1_n_param;

	import sm83_timing::L_unit;

	parameter real L_in1       = 0.0;
	parameter real L_in2       = 0.0;
	parameter real L_in3       = 0.0;
	parameter real L_in4       = 0.0;
	parameter real L_in5       = 0.0;
	parameter real L_y         = 0.0;
	parameter real L_tap_in1_n = 0.0;

	parameter real W_gate_in1 = 14*L_unit;
	parameter real W_gate_in2 =  6*L_unit;
	parameter real W_gate_in3 =  6*L_unit;
	parameter real W_gate_in4 =  6*L_unit;
	parameter real W_gate_in5 =  6*L_unit;

endpackage

module sm83_ao33_s3_tap_in1_n #(
		parameter real L_y              = 30 + sm83_ao33_s3_tap_in1_n_param::L_y,
		parameter real L_tap_in1_n      = 14 + sm83_ao33_s3_tap_in1_n_param::L_tap_in1_n,
		parameter real W_gate_y         = 0,
		parameter real W_gate_tap_in1_n = 0
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y, tap_in1_n
	);

	import sm83_timing::*;

	assign y         = (in1 & in2 & in3) | (in4 & in5 & in3);
	assign tap_in1_n = !in1;

	specify
		specparam T_rise_aoi     = tpd_elmore(         14, 2*R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_rise_aoi_in3 = tpd_elmore(         14,   R_pmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_fall_aoi     = tpd_elmore(         14, 3*R_nmos_ohm(3*L_unit), C_gate_F(6*L_unit));
		specparam T_rise_y       = tpd_elmore(        L_y,   R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y       = tpd_elmore(        L_y,   R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_rise_in1_n   = tpd_elmore(L_tap_in1_n,   R_pmos_ohm(4*L_unit), C_gate_F(W_gate_tap_in1_n));
		specparam T_fall_in1_n   = tpd_elmore(L_tap_in1_n,   R_nmos_ohm(4*L_unit), C_gate_F(W_gate_tap_in1_n));

		(in1, in2, in4, in5 *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
		(in3                *> y) = (T_fall_aoi + T_rise_y, T_rise_aoi_in3 + T_fall_y);

		(in1 *> tap_in1_n) = (T_rise_in1_n, T_fall_in1_n);
	endspecify

endmodule

`default_nettype wire
