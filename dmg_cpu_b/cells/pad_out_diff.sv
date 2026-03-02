`default_nettype none

module dmg_pad_out_diff #(
		parameter real L_pad = 0
	) (
		input      logic ndrv, pdrv_n,
		output tri logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140));
	bufif1 (highz1, strong0) #(T_rise_pad, T_fall_pad) (pad, '0, ndrv);
	bufif0 (strong1, highz0) #(T_rise_pad, T_fall_pad) (pad, '1, pdrv_n);

endmodule

`default_nettype wire
