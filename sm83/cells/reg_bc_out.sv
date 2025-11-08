`default_nettype none

module sm83_reg_bc_out #(
		parameter real L_c_y1 = 81,
		parameter real L_b_y1 = 48,
		parameter real L_y2   = 83
	) (
		input      logic ena1, b_ena2, c_ena2, b_in, c_in,
		output tri logic b_y1, c_y1, y2
	);

	import sm83_timing::*;

	localparam realtime T_fall_b_y1 = tpd_elmore(L_b_y1, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_b_y1    = tpd_z(, T_fall_b_y1);
	assign (highz1, strong0) #(0, T_fall_b_y1, T_Z_b_y1) b_y1 = (ena1 & b_in) ? 0 : 'z;

	localparam realtime T_fall_c_y1 = tpd_elmore(L_c_y1, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_c_y1    = tpd_z(, T_fall_c_y1);
	assign (highz1, strong0) #(0, T_fall_c_y1, T_Z_c_y1) c_y1 = (ena1 & c_in) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(0, T_fall_y2, T_Z_y2) y2 = ((b_ena2 & b_in) | (c_ena2 & c_in)) ? 0 : 'z;

endmodule

`default_nettype wire
