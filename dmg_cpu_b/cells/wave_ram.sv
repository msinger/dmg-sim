`default_nettype none

module dmg_wave_ram #(
		parameter real L_dout0 = 0,
		parameter real L_dout1 = 0,
		parameter real L_dout2 = 0,
		parameter real L_dout3 = 0,
		parameter real L_dout4 = 0,
		parameter real L_dout5 = 0,
		parameter real L_dout6 = 0,
		parameter real L_dout7 = 0
	) (
		input      logic din0, din1, din2, din3, din4, din5, din6, din7,
		output tri logic dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7,
		input      logic col0, col1, col2, col3,
		input      logic a2, a3, a2_n, a3_n,
		input      logic wr, bl_pch_n, wldrv_pch_n
	);

	import dmg_timing::*;

	logic [7:0] dout;

	dmg_simplified_sram #(.N(16)) sram_inst (
		.din({ din7, din6, din5, din4, din3, din2, din1, din0 }),
		.dout(dout),
		.col({ col3, col2, col1, col0 }),
		.a({ a3, a2 }),
		.a_n({ a3_n, a2_n }),
		.wr(wr),
		.bl_pch_n(bl_pch_n),
		.wldrv_pch_n(wldrv_pch_n),
		.wldrv_ena(wldrv_pch_n)
	);

	localparam realtime T_rise_dout0 = tpd_elmore(L_dout0, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout0 = tpd_elmore(L_dout0, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout1 = tpd_elmore(L_dout1, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout1 = tpd_elmore(L_dout1, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout2 = tpd_elmore(L_dout2, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout2 = tpd_elmore(L_dout2, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout3 = tpd_elmore(L_dout3, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout3 = tpd_elmore(L_dout3, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout4 = tpd_elmore(L_dout4, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout4 = tpd_elmore(L_dout4, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout5 = tpd_elmore(L_dout5, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout5 = tpd_elmore(L_dout5, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout6 = tpd_elmore(L_dout6, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout6 = tpd_elmore(L_dout6, R_nmos_ohm( 80*L_unit));
	localparam realtime T_rise_dout7 = tpd_elmore(L_dout7, R_pmos_ohm(120*L_unit));
	localparam realtime T_fall_dout7 = tpd_elmore(L_dout7, R_nmos_ohm( 80*L_unit));
	assign #(T_rise_dout0, T_fall_dout0) dout0 = dout[0];
	assign #(T_rise_dout1, T_fall_dout1) dout1 = dout[1];
	assign #(T_rise_dout2, T_fall_dout2) dout2 = dout[2];
	assign #(T_rise_dout3, T_fall_dout3) dout3 = dout[3];
	assign #(T_rise_dout4, T_fall_dout4) dout4 = dout[4];
	assign #(T_rise_dout5, T_fall_dout5) dout5 = dout[5];
	assign #(T_rise_dout6, T_fall_dout6) dout6 = dout[6];
	assign #(T_rise_dout7, T_fall_dout7) dout7 = dout[7];

endmodule

`default_nettype wire
