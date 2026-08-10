`default_nettype none

package sm83_aoi21_b_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_in3 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 11*L_unit;
	parameter real W_gate_in2 = 11*L_unit;
	parameter real W_gate_in3 = 11*L_unit;

endpackage

module sm83_aoi21_b #(
		parameter real L_y      = 23 + sm83_aoi21_b_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3,
		output logic y
	);

	import sm83_timing::*;

	assign y = !((in1 & in2) | in3);

	specify
		specparam T_rise_y     = tpd_elmore(L_y, 2*R_pmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y     = tpd_elmore(L_y, 2*R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y_in3 = tpd_elmore(L_y,   R_nmos_ohm(3*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
		(in3      *> y) = (T_rise_y, T_fall_y_in3);
	endspecify

endmodule

`default_nettype wire
