`default_nettype none

module sm83_reg_hl_out #(
		parameter real L_h_y1 = 42,
		parameter real L_l_y1 = 90,
		parameter real L_y2   = 85,
		parameter real L_y3   = 90
	) (
		input      logic ena1, h_ena2, h_ena3, l_ena2, l_ena3, h_in, l_in,
		output tri logic h_y1, l_y1, y2, y3
	);

	import sm83_timing::*;

	localparam realtime T_fall_h_y1 = tpd_elmore(L_h_y1, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_h_y1    = tpd_z(, T_fall_h_y1);
	assign (highz1, strong0) #(0, T_fall_h_y1, T_Z_h_y1) h_y1 = (ena1 & h_in) ? 0 : 'z;

	localparam realtime T_fall_l_y1 = tpd_elmore(L_l_y1, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_l_y1    = tpd_z(, T_fall_l_y1);
	assign (highz1, strong0) #(0, T_fall_l_y1, T_Z_l_y1) l_y1 = (ena1 & l_in) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(0, T_fall_y2, T_Z_y2) y2 = ((h_ena2 & h_in) | (l_ena2 & l_in)) ? 0 : 'z;

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	assign (highz1, strong0) #(0, T_fall_y3, T_Z_y3) y3 = ((h_ena3 & h_in) | (l_ena3 & l_in)) ? 0 : 'z;

endmodule

`default_nettype wire
