`default_nettype none

module dmg_high_ram #(
		parameter real L_d0 = 0,
		parameter real L_d1 = 0,
		parameter real L_d2 = 0,
		parameter real L_d3 = 0,
		parameter real L_d4 = 0,
		parameter real L_d5 = 0,
		parameter real L_d6 = 0,
		parameter real L_d7 = 0
	) (
		inout tri logic d0, d1, d2, d3, d4, d5, d6, d7,
		input     logic col0, col1, col2, col3,
		input     logic a2, a3, a4, a5, a6, a2_n, a3_n, a4_n, a5_n, a6_n,
		input     logic oe, oe_n, wr, bl_pch_n, wldrv_pch_n, wldrv_ena
	);

	import dmg_timing::*;

	logic [7:0] dout;

	dmg_generic_sram #(.N(128)) sram_inst (
		.din({ d7, d6, d5, d4, d3, d2, d1, d0 }),
		.dout(dout),
		.col({ col3, col2, col1, col0 }),
		.a({ a6, a5, a4, a3, a2 }),
		.a_n({ a6_n, a5_n, a4_n, a3_n, a2_n }),
		.wr(wr),
		.bl_pch_n(bl_pch_n),
		.wldrv_pch_n(wldrv_pch_n),
		.wldrv_ena(wldrv_ena)
	);

	localparam realtime T_rise_d0 = tpd_elmore(L_d0, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d0 = tpd_elmore(L_d0, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d1 = tpd_elmore(L_d1, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d1 = tpd_elmore(L_d1, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d2 = tpd_elmore(L_d2, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d2 = tpd_elmore(L_d2, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d3 = tpd_elmore(L_d3, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d3 = tpd_elmore(L_d3, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d4 = tpd_elmore(L_d4, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d4 = tpd_elmore(L_d4, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d5 = tpd_elmore(L_d5, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d5 = tpd_elmore(L_d5, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d6 = tpd_elmore(L_d6, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d6 = tpd_elmore(L_d6, R_nmos_ohm( 80*L_unit) * 2);
	localparam realtime T_rise_d7 = tpd_elmore(L_d7, R_pmos_ohm(120*L_unit) * 2);
	localparam realtime T_fall_d7 = tpd_elmore(L_d7, R_nmos_ohm( 80*L_unit) * 2);
	bufif0 (strong1, highz0) #(T_rise_d0, 0) (d0, dout[0], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d0) (d0, dout[0], oe);
	bufif0 (strong1, highz0) #(T_rise_d1, 0) (d1, dout[1], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d1) (d1, dout[1], oe);
	bufif0 (strong1, highz0) #(T_rise_d2, 0) (d2, dout[2], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d2) (d2, dout[2], oe);
	bufif0 (strong1, highz0) #(T_rise_d3, 0) (d3, dout[3], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d3) (d3, dout[3], oe);
	bufif0 (strong1, highz0) #(T_rise_d4, 0) (d4, dout[4], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d4) (d4, dout[4], oe);
	bufif0 (strong1, highz0) #(T_rise_d5, 0) (d5, dout[5], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d5) (d5, dout[5], oe);
	bufif0 (strong1, highz0) #(T_rise_d6, 0) (d6, dout[6], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d6) (d6, dout[6], oe);
	bufif0 (strong1, highz0) #(T_rise_d7, 0) (d7, dout[7], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d7) (d7, dout[7], oe);

endmodule

`default_nettype wire
