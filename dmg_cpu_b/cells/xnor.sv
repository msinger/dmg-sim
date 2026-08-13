`default_nettype none

package dmg_xnor_param;

	import dmg_timing::L_unit;

	parameter real L_in1 = 129.7;
	parameter real L_in2 = 118.6;
	parameter real L_y   =  43.6;

	parameter real W_gate_in1 = 140*L_unit;
	parameter real W_gate_in2 = 140*L_unit;

endpackage

module dmg_xnor #(
		parameter real L_y      = 54 + dmg_xnor_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic in1, in2,
		output logic y
	);

	import dmg_timing::*;

	assign y = in1 ~^ in2;

	specify
		specparam T_rise_nand = tpd_elmore(122,   R_pmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_fall_nand = tpd_elmore(122, 2*R_nmos_ohm(35*L_unit), C_gate_F(70*L_unit));
		specparam T_rise_y    = tpd_elmore(L_y, 2*R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y    = tpd_elmore(L_y, 2*R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_fall_nand + T_rise_y, T_rise_nand + T_fall_y);
	endspecify

endmodule

`default_nettype wire
