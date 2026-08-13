`default_nettype none

package sm83_aoi331_s3_param;

	import sm83_timing::L_unit;

	parameter real L_in1 =  0.0;
	parameter real L_in2 =  0.0;
	parameter real L_in3 =  0.0;
	parameter real L_in4 =  0.0;
	parameter real L_in5 =  0.0;
	parameter real L_in6 =  0.0;
	parameter real L_y   = 29.0;

	parameter real W_gate_in1 = 6*L_unit;
	parameter real W_gate_in2 = 6*L_unit;
	parameter real W_gate_in3 = 6*L_unit;
	parameter real W_gate_in4 = 6*L_unit;
	parameter real W_gate_in5 = 6*L_unit;
	parameter real W_gate_in6 = 6*L_unit;

endpackage

module sm83_aoi331_s3 #(
		parameter real L_y      = sm83_aoi331_s3_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3, in4, in5, in6,
		output logic y
	);

	import sm83_timing::*;

	assign y = !((in1 & in2 & in3) | (in4 & in5 & in3) | in6);

	specify
		specparam T_rise_y     = tpd_elmore(L_y, 3*R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_rise_y_in3 = tpd_elmore(L_y, 2*R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y     = tpd_elmore(L_y, 3*R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y_in6 = tpd_elmore(L_y,   R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in4, in5 *> y) = (T_rise_y, T_fall_y);
		(in3                *> y) = (T_rise_y_in3, T_fall_y);
		(in6                *> y) = (T_rise_y, T_fall_y_in6);
	endspecify

endmodule

`default_nettype wire
