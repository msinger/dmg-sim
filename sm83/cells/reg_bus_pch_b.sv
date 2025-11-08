`default_nettype none

module sm83_reg_bus_pch_b #(
		parameter real L_a_y = 82,
		parameter real L_b_y = 78
	) (
		input      logic pch_n,
		output tri logic a_y, b_y
	);

	import sm83_timing::*;

	localparam realtime T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(6*L_unit));
	localparam realtime T_Z_a_y    = tpd_z(T_rise_a_y);
	bufif0 (strong1, highz0) #(T_rise_a_y, 0, T_Z_a_y) (a_y, '1, pch_n);

	localparam realtime T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm(6*L_unit));
	localparam realtime T_Z_b_y    = tpd_z(T_rise_b_y);
	bufif0 (strong1, highz0) #(T_rise_b_y, 0, T_Z_b_y) (b_y, '1, pch_n);

endmodule

`default_nettype wire
