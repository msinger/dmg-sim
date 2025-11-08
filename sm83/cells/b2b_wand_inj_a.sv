`default_nettype none

module sm83_b2b_wand_inj_a #(
		parameter real L_a = 49,
		parameter real L_b = 80
	) (
		input     logic oe_n, pch_n, inj_d, inj_en,
		inout tri logic a, b
	);

	import sm83_timing::*;

	localparam realtime T_rise_inj_d_n = tpd_elmore( 17, R_pmos_ohm( 5*L_unit));
	localparam realtime T_fall_inj_d_n = tpd_elmore( 17, R_nmos_ohm( 5*L_unit));
	localparam realtime T_rise_nor_pp  = tpd_elmore( 16, R_pmos_ohm( 9*L_unit) * 2);
	localparam realtime T_fall_nor_pp  = tpd_elmore( 16, R_nmos_ohm( 5*L_unit));
	localparam realtime T_rise_nor_pch = tpd_elmore( 24, R_pmos_ohm( 5*L_unit) * 2);
	localparam realtime T_fall_nor_pch = tpd_elmore( 24, R_nmos_ohm( 5*L_unit));
	localparam realtime T_rise_or_pch  = tpd_elmore( 36, R_pmos_ohm( 5*L_unit));
	localparam realtime T_fall_or_pch  = tpd_elmore( 36, R_nmos_ohm(12*L_unit));
	localparam realtime T_rise_nor_ab  = tpd_elmore( 55, R_pmos_ohm(14*L_unit) * 2);
	localparam realtime T_fall_nor_ab  = tpd_elmore( 55, R_nmos_ohm( 5*L_unit));
	localparam realtime T_rise_a       = tpd_elmore(L_a, R_pmos_ohm(27*L_unit));
	localparam realtime T_fall_a       = tpd_elmore(L_a, R_nmos_ohm(29*L_unit) * 2);
	localparam realtime T_fall_a_inj   = tpd_elmore(L_a, R_nmos_ohm(24*L_unit) * 2);
	localparam realtime T_rise_b       = tpd_elmore(L_b, R_pmos_ohm(50*L_unit));
	localparam realtime T_fall_b       = tpd_elmore(L_b, R_nmos_ohm(84*L_unit));
	localparam realtime T_Z_a          = tpd_z(T_rise_a, T_fall_a);
	localparam realtime T_Z_b          = tpd_z(T_rise_b, T_fall_b);

	logic inj_d_n, nor_pp;

	assign #(T_rise_inj_d_n, T_fall_inj_d_n) inj_d_n = !inj_d;
	assign #(T_rise_nor_pp , T_fall_nor_pp ) nor_pp  = !(b | oe_n);

	bufif0 (strong1, highz0) #(T_rise_a, 0, T_Z_a)     (a, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_a, T_Z_a)     (a, '0, pch_n & nor_pp);
	bufif1 (highz1, strong0) #(0, T_fall_a_inj, T_Z_a) (a, '0, inj_en & inj_d_n);

	logic or_pch, nor_ab;

	assign #(T_fall_nor_pch + T_rise_or_pch, T_rise_nor_pch + T_fall_or_pch) or_pch = pch_n | oe_n;
	assign #(T_rise_nor_ab, T_fall_nor_ab)                                   nor_ab = !(oe_n | a);

	bufif0 (strong1, highz0) #(T_rise_b, 0, T_Z_b) (b, '1, or_pch);
	bufif1 (highz1, strong0) #(0, T_fall_b, T_Z_b) (b, '0, nor_ab);

endmodule

`default_nettype wire
