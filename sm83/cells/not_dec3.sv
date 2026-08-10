`default_nettype none

package sm83_not_dec3_param;

	import sm83_timing::L_unit;

	parameter real L_in = 0.0;
	parameter real L_y  = 0.0;

	parameter real W_gate_in = 29*L_unit;

endpackage

module sm83_not_dec3 #(
		parameter real L_y      = 19 + sm83_not_dec3_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in,
		output logic y
	);

	import sm83_timing::*;

	assign y = !in;

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(17*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm(12*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
