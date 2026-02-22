`default_nettype none

module dmg_pad_bidir #(
		parameter real L_i_n = 160,
		parameter real L_pad = 0
	) (
		input      logic ndrv, pdrv_n,
		output     logic i_n,
		inout  tri logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140));
	bufif1 (highz1, strong0) #(0, T_fall_pad) (pad, '0, ndrv);
	bufif0 (strong1, highz0) #(T_rise_pad, 0) (pad, '1, pdrv_n);

	localparam realtime T_rise_i_n = tpd_elmore(L_i_n, R_pmos_ohm(15*L_unit));
	localparam realtime T_fall_i_n = tpd_elmore(L_i_n, R_nmos_ohm( 7*L_unit));
	assign #(T_rise_i_n, T_fall_i_n) i_n = !pad;

endmodule

`default_nettype wire
