`default_nettype none

module sm83_pch_dec2_b #(
		parameter real L_y = 0
	) (
		input      logic pch_n,
		output tri logic y
	);

	import sm83_timing::*;

	localparam realtime T_rise_buf = tpd_elmore(L_y, R_pmos_ohm(7*L_unit));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, 0, T_Z_buf) (y, '1, pch_n);

endmodule

`default_nettype wire
