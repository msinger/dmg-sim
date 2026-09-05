`default_nettype none

package sm83_not_x1_dec2_param;

	import sm83_timing::L_unit;

	parameter real L_in = 0.0;
	parameter real L_y  = 0.0;

	parameter real W_gate_in = 25*L_unit;

endpackage

module sm83_not_x1_dec2 #(
		parameter real L_y      = 16 + sm83_not_x1_dec2_param::L_y,
		parameter real W_gate_y = 0,

		parameter real L_y_in_sm83 = L_y
	) (
		input  logic in,
		output logic y
	);

	import sm83_timing::*;

	assign y = !in;

	localparam real Rw_y = R_wire_ohm(L_y_in_sm83) + dmg_timing::R_wire_ohm(L_y - L_y_in_sm83);
	localparam real Cw_y = C_wire_F(L_y_in_sm83) + dmg_timing::C_wire_F(L_y - L_y_in_sm83);

	specify
		specparam T_rise_y = tpd_elmore_rc(Rw_y, Cw_y, R_pmos_ohm(17*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore_rc(Rw_y, Cw_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
