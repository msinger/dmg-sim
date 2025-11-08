`default_nettype none

module sm83_not_pch_x1_alu #(
		parameter real L_in = 46,
		parameter real L_y  = 45
	) (
		input      logic pch_n,
		inout  tri logic in,
		output     logic y
	);

	import sm83_timing::*;

	assign y = !in;

	localparam realtime T_rise_buf = tpd_elmore(L_in, R_pmos_ohm(3*L_unit));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, 0, T_Z_buf) (in, '1, pch_n);

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(15*L_unit));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm( 5*L_unit));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
