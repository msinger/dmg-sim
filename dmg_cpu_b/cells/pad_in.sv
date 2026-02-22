`default_nettype none

module dmg_pad_in #(
		parameter real L_i_n = 160
	) (
		output logic i_n,
		input  logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_i_n = tpd_elmore(L_i_n, R_pmos_ohm(15*L_unit));
	localparam realtime T_fall_i_n = tpd_elmore(L_i_n, R_nmos_ohm( 7*L_unit));
	assign #(T_rise_i_n, T_fall_i_n) i_n = !pad;

endmodule

`default_nettype wire
