`default_nettype none

module sm83_reg_a_out #(
		parameter real L_a_y = 44,
		parameter real L_b_y = 33
	) (
		input      logic a_ena, b_ena, in,
		output tri logic a_y, b_y
	);

	import sm83_timing::*;

	localparam realtime T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_a_y    = tpd_z(, T_fall_a_y);
	assign (highz1, strong0) #(0, T_fall_a_y, T_Z_a_y) a_y = (a_ena & in) ? 0 : 'z;

	localparam realtime T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_b_y    = tpd_z(, T_fall_b_y);
	assign (highz1, strong0) #(0, T_fall_b_y, T_Z_b_y) b_y = (b_ena & in) ? 0 : 'z;

endmodule

`default_nettype wire
