`default_nettype none

package dmg_oam_param;

	import dmg_timing::L_unit;

	parameter real L_d0          = 0.0;
	parameter real L_d1          = 0.0;
	parameter real L_d2          = 0.0;
	parameter real L_d3          = 0.0;
	parameter real L_d4          = 0.0;
	parameter real L_d5          = 0.0;
	parameter real L_d6          = 0.0;
	parameter real L_d7          = 0.0;
	parameter real L_col0        = 0.0;
	parameter real L_col1        = 0.0;
	parameter real L_col2        = 0.0;
	parameter real L_col3        = 0.0;
	parameter real L_a2          = 0.0;
	parameter real L_a3          = 0.0;
	parameter real L_a4          = 0.0;
	parameter real L_a5          = 0.0;
	parameter real L_a6          = 0.0;
	parameter real L_a2_n        = 0.0;
	parameter real L_a3_n        = 0.0;
	parameter real L_a4_n        = 0.0;
	parameter real L_a5_n        = 0.0;
	parameter real L_a6_n        = 0.0;
	parameter real L_oe          = 0.0;
	parameter real L_oe_n        = 0.0;
	parameter real L_wr          = 0.0;
	parameter real L_bl_pch_n    = 0.0;
	parameter real L_wldrv_pch_n = 0.0;

	parameter real W_gate_d0          =   24*L_unit;
	parameter real W_gate_d1          =   24*L_unit;
	parameter real W_gate_d2          =   24*L_unit;
	parameter real W_gate_d3          =   24*L_unit;
	parameter real W_gate_d4          =   24*L_unit;
	parameter real W_gate_d5          =   24*L_unit;
	parameter real W_gate_d6          =   24*L_unit;
	parameter real W_gate_d7          =   24*L_unit;
	parameter real W_gate_col0        = 1184*L_unit;
	parameter real W_gate_col1        = 1184*L_unit;
	parameter real W_gate_col2        = 1184*L_unit;
	parameter real W_gate_col3        = 1184*L_unit;
	parameter real W_gate_a2          =   80*L_unit;
	parameter real W_gate_a3          =   80*L_unit;
	parameter real W_gate_a4          =   80*L_unit;
	parameter real W_gate_a5          =   64*L_unit;
	parameter real W_gate_a6          =   32*L_unit;
	parameter real W_gate_a2_n        =   80*L_unit;
	parameter real W_gate_a3_n        =   80*L_unit;
	parameter real W_gate_a4_n        =   80*L_unit;
	parameter real W_gate_a5_n        =   96*L_unit;
	parameter real W_gate_a6_n        =  128*L_unit;
	parameter real W_gate_oe          =  640*L_unit;
	parameter real W_gate_oe_n        =  960*L_unit;
	parameter real W_gate_wr          =  192*L_unit;
	parameter real W_gate_bl_pch_n    = 1632*L_unit;
	parameter real W_gate_wldrv_pch_n =  660*L_unit;

endpackage

module dmg_oam #(
		parameter real L_d0      = dmg_oam_param::L_d0,
		parameter real L_d1      = dmg_oam_param::L_d1,
		parameter real L_d2      = dmg_oam_param::L_d2,
		parameter real L_d3      = dmg_oam_param::L_d3,
		parameter real L_d4      = dmg_oam_param::L_d4,
		parameter real L_d5      = dmg_oam_param::L_d5,
		parameter real L_d6      = dmg_oam_param::L_d6,
		parameter real L_d7      = dmg_oam_param::L_d7,
		parameter real W_gate_d0 = dmg_oam_param::W_gate_d0,
		parameter real W_gate_d1 = dmg_oam_param::W_gate_d1,
		parameter real W_gate_d2 = dmg_oam_param::W_gate_d2,
		parameter real W_gate_d3 = dmg_oam_param::W_gate_d3,
		parameter real W_gate_d4 = dmg_oam_param::W_gate_d4,
		parameter real W_gate_d5 = dmg_oam_param::W_gate_d5,
		parameter real W_gate_d6 = dmg_oam_param::W_gate_d6,
		parameter real W_gate_d7 = dmg_oam_param::W_gate_d7
	) (
		inout tri logic d0, d1, d2, d3, d4, d5, d6, d7,
		input     logic col0, col1, col2, col3,
		input     logic a2, a3, a4, a5, a6, a2_n, a3_n, a4_n, a5_n, a6_n,
		input     logic oe, oe_n, wr, bl_pch_n, wldrv_pch_n
	);

	import dmg_timing::*;

	logic [7:0] dout;

`ifdef SIMPLIFIED_OAM
	dmg_simplified_sram
`else
	dmg_generic_sram
`endif
		#(.N(80))
		sram_inst
	(
		.din({ d7, d6, d5, d4, d3, d2, d1, d0 }),
		.dout(dout),
		.col({ col3, col2, col1, col0 }),
		.a({ a6, a5, a4, a3, a2 }),
		.a_n({ a6_n, a5_n, a4_n, a3_n, a2_n }),
		.wr(wr),
		.bl_pch_n(bl_pch_n),
		.wldrv_pch_n(wldrv_pch_n),
		.wldrv_ena(wldrv_pch_n)
	);

	localparam realtime T_rise_d0 = tpd_elmore(L_d0, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d0));
	localparam realtime T_fall_d0 = tpd_elmore(L_d0, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d0));
	localparam realtime T_rise_d1 = tpd_elmore(L_d1, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d1));
	localparam realtime T_fall_d1 = tpd_elmore(L_d1, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d1));
	localparam realtime T_rise_d2 = tpd_elmore(L_d2, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d2));
	localparam realtime T_fall_d2 = tpd_elmore(L_d2, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d2));
	localparam realtime T_rise_d3 = tpd_elmore(L_d3, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d3));
	localparam realtime T_fall_d3 = tpd_elmore(L_d3, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d3));
	localparam realtime T_rise_d4 = tpd_elmore(L_d4, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d4));
	localparam realtime T_fall_d4 = tpd_elmore(L_d4, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d4));
	localparam realtime T_rise_d5 = tpd_elmore(L_d5, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d5));
	localparam realtime T_fall_d5 = tpd_elmore(L_d5, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d5));
	localparam realtime T_rise_d6 = tpd_elmore(L_d6, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d6));
	localparam realtime T_fall_d6 = tpd_elmore(L_d6, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d6));
	localparam realtime T_rise_d7 = tpd_elmore(L_d7, 2*R_pmos_ohm(120*L_unit), C_gate_F(W_gate_d7));
	localparam realtime T_fall_d7 = tpd_elmore(L_d7, 2*R_nmos_ohm( 80*L_unit), C_gate_F(W_gate_d7));
	bufif0 (strong1, highz0) #(T_rise_d0, T_fall_d0) (d0, dout[0], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d0, T_fall_d0) (d0, dout[0], oe);
	bufif0 (strong1, highz0) #(T_rise_d1, T_fall_d1) (d1, dout[1], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d1, T_fall_d1) (d1, dout[1], oe);
	bufif0 (strong1, highz0) #(T_rise_d2, T_fall_d2) (d2, dout[2], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d2, T_fall_d2) (d2, dout[2], oe);
	bufif0 (strong1, highz0) #(T_rise_d3, T_fall_d3) (d3, dout[3], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d3, T_fall_d3) (d3, dout[3], oe);
	bufif0 (strong1, highz0) #(T_rise_d4, T_fall_d4) (d4, dout[4], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d4, T_fall_d4) (d4, dout[4], oe);
	bufif0 (strong1, highz0) #(T_rise_d5, T_fall_d5) (d5, dout[5], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d5, T_fall_d5) (d5, dout[5], oe);
	bufif0 (strong1, highz0) #(T_rise_d6, T_fall_d6) (d6, dout[6], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d6, T_fall_d6) (d6, dout[6], oe);
	bufif0 (strong1, highz0) #(T_rise_d7, T_fall_d7) (d7, dout[7], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d7, T_fall_d7) (d7, dout[7], oe);

endmodule

`default_nettype wire
