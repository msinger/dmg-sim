`default_nettype none

module dmg_pad_bidir_pu #(
		parameter real L_i_n = 160,
		parameter real L_pad = 0
	) (
		input      logic ndrv, pdrv_n, ena_n_pu,
		output     logic i_n,
		inout  tri logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140));
	localparam realtime T_pu_pad   = T_rise_pad * 10;
	bufif1 (highz1, strong0) #(T_rise_pad, T_fall_pad) (pad, '0, ndrv);
	bufif0 (strong1, highz0) #(T_rise_pad, T_fall_pad) (pad, '1, pdrv_n);
	bufif0 (pull1, highz0)   #(T_pu_pad, T_fall_pad)   (pad, '1, ena_n_pu);

	localparam realtime T_rise_i_n = tpd_elmore(L_i_n, R_pmos_ohm(15*L_unit));
	localparam realtime T_fall_i_n = tpd_elmore(L_i_n, R_nmos_ohm( 7*L_unit));
	assign #(T_rise_i_n, T_fall_i_n) i_n = !pad;

endmodule

`default_nettype wire
