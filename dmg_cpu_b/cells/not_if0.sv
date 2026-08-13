`default_nettype none

package dmg_not_if0_param;

	import dmg_timing::L_unit;

	parameter real L_in    = 57.5;
	parameter real L_ena_n = 57.5;
	parameter real L_y     = 36.7;

	parameter real W_gate_in    = 70*L_unit;
	parameter real W_gate_ena_n = 70*L_unit;

endpackage

module dmg_not_if0 #(
		parameter real L_y      = 54 + dmg_not_if0_param::L_y,
		parameter real W_y_p    = 35,
		parameter real W_gate_y = 0
	) (
		input  logic in, ena_n,
		output logic y
	);

	import dmg_timing::*;

	assign y = ena_n ? 'z : !in;

	specify
		specparam T_rise_not1 = tpd_elmore(153,   R_pmos_ohm(35*L_unit),    C_gate_F(105*L_unit));
		specparam T_fall_not1 = tpd_elmore(153,   R_nmos_ohm(35*L_unit),    C_gate_F(105*L_unit));
		specparam T_rise_not2 = tpd_elmore( 90,   R_pmos_ohm(35*L_unit),    C_gate_F(35*L_unit));
		specparam T_fall_not2 = tpd_elmore( 90,   R_nmos_ohm(35*L_unit),    C_gate_F(35*L_unit));
		specparam T_rise_y    = tpd_elmore(L_y, 2*R_pmos_ohm(W_y_p*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y    = tpd_elmore(L_y, 2*R_nmos_ohm(35*L_unit),    C_gate_F(W_gate_y));
		specparam T_Z_y       = tpd_z(tpd_elmore(L_y, 2*R_pmos_ohm(35*L_unit), C_gate_F(W_gate_y)),
		                              tpd_elmore(L_y, 2*R_nmos_ohm(35*L_unit), C_gate_F(W_gate_y)));

		(in    *> y) = (T_rise_y, T_fall_y);
		(ena_n *> y) = (T_rise_not1 + T_fall_not2 + T_rise_y,
		                T_rise_not1 + T_fall_y,
		                T_fall_not1 + T_rise_not2 + T_Z_y);
	endspecify

endmodule

`default_nettype wire
