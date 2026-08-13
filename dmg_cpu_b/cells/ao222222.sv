`default_nettype none

package dmg_ao222222_param;

	import dmg_timing::L_unit;

	parameter real L_in1  = 57.5;
	parameter real L_in2  = 57.5;
	parameter real L_in3  = 57.5;
	parameter real L_in4  = 57.5;
	parameter real L_in5  = 57.5;
	parameter real L_in6  = 57.5;
	parameter real L_in7  = 57.5;
	parameter real L_in8  = 57.5;
	parameter real L_in9  = 57.5;
	parameter real L_in10 = 57.5;
	parameter real L_in11 = 57.5;
	parameter real L_in12 = 57.5;
	parameter real L_y    = 36.7;

	parameter real W_gate_in1  = 70*L_unit;
	parameter real W_gate_in2  = 70*L_unit;
	parameter real W_gate_in3  = 70*L_unit;
	parameter real W_gate_in4  = 70*L_unit;
	parameter real W_gate_in5  = 70*L_unit;
	parameter real W_gate_in6  = 70*L_unit;
	parameter real W_gate_in7  = 70*L_unit;
	parameter real W_gate_in8  = 70*L_unit;
	parameter real W_gate_in9  = 70*L_unit;
	parameter real W_gate_in10 = 70*L_unit;
	parameter real W_gate_in11 = 70*L_unit;
	parameter real W_gate_in12 = 70*L_unit;

endpackage

module dmg_ao222222 #(
		parameter real L_y      = 54 + dmg_ao222222_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12,
		output logic y
	);

	import dmg_timing::*;

	assign y = (in1 & in2) | (in3 & in4) | (in5 & in6) | (in7 & in8) | (in9 & in10) | (in11 & in12);

	specify
		specparam T_rise_aoi = tpd_elmore(284, 6*R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_fall_aoi = tpd_elmore(284, 2*R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y,   R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y   = tpd_elmore(L_y,   R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12 *> y) =
			(T_fall_aoi + T_rise_y, T_rise_aoi + T_fall_y);
	endspecify

endmodule

`default_nettype wire
