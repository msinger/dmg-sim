`default_nettype none

package sm83_reg_bus_pch_b_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n = 0.0;
	parameter real L_a_y   = 0.0;
	parameter real L_b_y   = 8.1;

	parameter real W_gate_pch_n = 12*L_unit;

endpackage

module sm83_reg_bus_pch_b #(
		parameter real L_a_y      = 84 + sm83_reg_bus_pch_b_param::L_a_y,
		parameter real L_b_y      = 72 + sm83_reg_bus_pch_b_param::L_b_y,
		parameter real W_gate_a_y = 0,
		parameter real W_gate_b_y = 0
	) (
		input      logic pch_n,
		output tri logic a_y, b_y
	);

	import sm83_timing::*;

	localparam realtime T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(6*L_unit), C_gate_F(W_gate_a_y));
	localparam realtime T_Z_a_y    = tpd_z(T_rise_a_y);
	bufif0 (strong1, highz0) #(T_rise_a_y, T_Z_a_y, T_Z_a_y) (a_y, '1, pch_n);

	localparam realtime T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm(6*L_unit), C_gate_F(W_gate_b_y));
	localparam realtime T_Z_b_y    = tpd_z(T_rise_b_y);
	bufif0 (strong1, highz0) #(T_rise_b_y, T_Z_b_y, T_Z_b_y) (b_y, '1, pch_n);

endmodule

`default_nettype wire
