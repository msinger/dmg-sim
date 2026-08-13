`default_nettype none

package dmg_pad_bidir_pu_param;

	import dmg_timing::L_unit;

	parameter real L_ndrv     = 258.0;
	parameter real L_pdrv_n   = 288.0;
	parameter real L_ena_n_pu =  47.0;
	parameter real L_i_n      = 207.0;
	parameter real L_pad      =   0.0;

	parameter real W_gate_ndrv     = 140*L_unit;
	parameter real W_gate_pdrv_n   = 140*L_unit;
	parameter real W_gate_ena_n_pu =  15*L_unit;
	parameter real W_gate_pad      =  22*L_unit;

endpackage

module dmg_pad_bidir_pu #(
		parameter real L_i_n      = dmg_pad_bidir_pu_param::L_i_n,
		parameter real L_pad      = dmg_pad_bidir_pu_param::L_pad,
		parameter real W_gate_i_n = 0,
		parameter real W_gate_pad = 0
	) (
		input      logic ndrv, pdrv_n, ena_n_pu,
		output     logic i_n,
		inout  tri logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140), C_gate_F(W_gate_pad));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140), C_gate_F(W_gate_pad));
	localparam realtime T_pu_pad   = T_rise_pad * 10;
	bufif1 (highz1, strong0) #(T_rise_pad, T_fall_pad) (pad, '0, ndrv);
	bufif0 (strong1, highz0) #(T_rise_pad, T_fall_pad) (pad, '1, pdrv_n);
	bufif0 (pull1, highz0)   #(T_pu_pad, T_fall_pad)   (pad, '1, ena_n_pu);

	localparam realtime T_rise_i_n = tpd_elmore(L_i_n, R_pmos_ohm(15*L_unit), C_gate_F(W_gate_i_n));
	localparam realtime T_fall_i_n = tpd_elmore(L_i_n, R_nmos_ohm( 7*L_unit), C_gate_F(W_gate_i_n));
	assign #(T_rise_i_n, T_fall_i_n) i_n = !pad;

endmodule

`default_nettype wire
