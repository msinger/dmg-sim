`default_nettype none

package dmg_pad_out_diff_param;

	import dmg_timing::L_unit;

	parameter real L_ndrv   = 266.0;
	parameter real L_pdrv_n = 288.0;
	parameter real L_pad    =   0.0;

	parameter real W_gate_ndrv   = 140*L_unit;
	parameter real W_gate_pdrv_n = 140*L_unit;
	parameter real W_gate_pad    = 0;

endpackage

module dmg_pad_out_diff #(
		parameter real L_pad      = dmg_pad_out_diff_param::L_pad,
		parameter real W_gate_pad = 0
	) (
		input      logic ndrv, pdrv_n,
		output tri logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140), C_gate_F(W_gate_pad));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140), C_gate_F(W_gate_pad));
	bufif1 (highz1, strong0) #(T_rise_pad, T_fall_pad) (pad, '0, ndrv);
	bufif0 (strong1, highz0) #(T_rise_pad, T_fall_pad) (pad, '1, pdrv_n);

endmodule

`default_nettype wire
