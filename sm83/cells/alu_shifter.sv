`default_nettype none

module sm83_alu_shifter #(
		parameter real L_y0 = 56,
		parameter real L_y1 = 81,
		parameter real L_y2 = 99,
		parameter real L_y3 = 78,
		parameter real L_y4 = 88,
		parameter real L_y5 = 91,
		parameter real L_y6 = 58,
		parameter real L_y7 = 97
	) (
		input      logic ena, l, r, rl, rr, rlc, rrc, sra, swap, c, d0, d1, d2, d3, d4, d5, d6, d7,
		output tri logic y0, y1, y2, y3, y4, y5, y6, y7
	);

	import sm83_timing::*;

	localparam realtime T_fall_y0 = tpd_elmore(L_y0, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y0    = tpd_z(, T_fall_y0);
	bufif1 (highz1, strong0) #(0, T_fall_y0, T_Z_y0) (y0, '0, ena & ((c & rl) | (d4 & swap) | (d1 & r) | (d7 & rlc)));

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	bufif1 (highz1, strong0) #(0, T_fall_y1, T_Z_y1) (y1, '0, ena & ((d5 & swap) | (d2 & r) | (d0 & l)));

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	bufif1 (highz1, strong0) #(0, T_fall_y2, T_Z_y2) (y2, '0, ena & ((d6 & swap) | (d3 & r) | (d1 & l)));

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	bufif1 (highz1, strong0) #(0, T_fall_y3, T_Z_y3) (y3, '0, ena & ((d7 & swap) | (d4 & r) | (d2 & l)));

	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y4    = tpd_z(, T_fall_y4);
	bufif1 (highz1, strong0) #(0, T_fall_y4, T_Z_y4) (y4, '0, ena & ((d5 & r) | (d0 & swap) | (d3 & l)));

	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y5    = tpd_z(, T_fall_y5);
	bufif1 (highz1, strong0) #(0, T_fall_y5, T_Z_y5) (y5, '0, ena & ((d1 & swap) | (d6 & r) | (d4 & l)));

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	bufif1 (highz1, strong0) #(0, T_fall_y6, T_Z_y6) (y6, '0, ena & ((d2 & swap) | (d5 & l) | (d7 & r)));

	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(6*L_unit) + R_nmos_ohm(11*L_unit) * 2);
	localparam realtime T_Z_y7    = tpd_z(, T_fall_y7);
	bufif1 (highz1, strong0) #(0, T_fall_y7, T_Z_y7)
		(y7, '0, ena & ((c & rr) | (d7 & sra) | (d0 & rrc) | (d3 & swap) | (d6 & l)));

endmodule

`default_nettype wire
