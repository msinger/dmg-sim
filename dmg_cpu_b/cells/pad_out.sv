`default_nettype none

module dmg_pad_out #(
		parameter real L_pad = 0
	) (
		input  logic o_n,
		output logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140));
	assign #(T_rise_pad, T_fall_pad) pad = !o_n;

endmodule

`default_nettype wire
