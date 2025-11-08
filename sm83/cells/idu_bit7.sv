`default_nettype none

module sm83_idu_bit7 #(
		parameter real L_buf_a_y  = 30,
		parameter real L_buf_b_y  = 30,
		parameter real L_not_a_in = 68,
		parameter real L_not_a_y  = 83,
		parameter real L_not_b_in = 68,
		parameter real L_not_b_y  = 40
	) (
		input      logic pch_n, buf_a_in, buf_b_in, buf_ena, buf_ena_n,
		inout  tri logic not_a_in, not_b_in,
		output tri logic buf_a_y, buf_b_y,
		output     logic not_a_y, not_b_y
	);

	import sm83_timing::*;

	localparam realtime T_rise_not_a_in = tpd_elmore(L_not_a_in, R_pmos_ohm( 6*L_unit));
	localparam realtime T_rise_not_a_y  = tpd_elmore( L_not_a_y, R_pmos_ohm( 6*L_unit));
	localparam realtime T_fall_not_a_y  = tpd_elmore( L_not_a_y, R_nmos_ohm( 7*L_unit));
	localparam realtime T_Z_not_a_in    = tpd_z(T_rise_not_a_in);
	bufif0 (strong1, highz0) #(T_rise_not_a_in, 0, T_Z_not_a_in) (not_a_in, '1, pch_n);
	assign #(T_rise_not_a_y, T_fall_not_a_y) not_a_y = !not_a_in;

	localparam realtime T_rise_not_b_in = tpd_elmore(L_not_b_in, R_pmos_ohm( 6*L_unit));
	localparam realtime T_rise_not_b_y  = tpd_elmore( L_not_b_y, R_pmos_ohm( 7*L_unit));
	localparam realtime T_fall_not_b_y  = tpd_elmore( L_not_b_y, R_nmos_ohm( 7*L_unit));
	localparam realtime T_Z_not_b_in    = tpd_z(T_rise_not_b_in);
	bufif0 (strong1, highz0) #(T_rise_not_b_in, 0, T_Z_not_b_in) (not_b_in, '1, pch_n);
	assign #(T_rise_not_b_y, T_fall_not_b_y) not_b_y = !not_b_in;

	localparam realtime T_rise_buf_a_y_n = tpd_elmore(       21, R_pmos_ohm( 3*L_unit) + R_pmos_ohm(7*L_unit));
	localparam realtime T_fall_buf_a_y_n = tpd_elmore(       28, R_nmos_ohm( 3*L_unit) + R_nmos_ohm(9*L_unit));
	localparam realtime T_rise_buf_a_y   = tpd_elmore(L_buf_a_y, R_pmos_ohm(28*L_unit));
	localparam realtime T_fall_buf_a_y   = tpd_elmore(L_buf_a_y, R_nmos_ohm(13*L_unit));
	localparam realtime T_Z_buf_a_y      = tpd_z(T_rise_buf_a_y, T_fall_buf_a_y);
	bufif1 (strong1, highz0) #(T_fall_buf_a_y_n + T_rise_buf_a_y, 0, T_Z_buf_a_y) (buf_a_y, '1, buf_ena & buf_a_in);
	bufif1 (highz1, strong0) #(0, T_rise_buf_a_y_n + T_fall_buf_a_y, T_Z_buf_a_y) (buf_a_y, '0, !buf_ena_n & !buf_a_in);

	localparam realtime T_rise_buf_b_y_n = tpd_elmore(       37, R_pmos_ohm( 3*L_unit) + R_pmos_ohm(7*L_unit));
	localparam realtime T_fall_buf_b_y_n = tpd_elmore(       21, R_nmos_ohm( 3*L_unit) + R_nmos_ohm(9*L_unit));
	localparam realtime T_rise_buf_b_y   = tpd_elmore(L_buf_b_y, R_pmos_ohm(28*L_unit));
	localparam realtime T_fall_buf_b_y   = tpd_elmore(L_buf_b_y, R_nmos_ohm(14*L_unit));
	localparam realtime T_Z_buf_b_y      = tpd_z(T_rise_buf_b_y, T_fall_buf_b_y);
	bufif1 (strong1, highz0) #(T_fall_buf_b_y_n + T_rise_buf_b_y, 0, T_Z_buf_b_y) (buf_b_y, '1, buf_ena & buf_b_in);
	bufif1 (highz1, strong0) #(0, T_rise_buf_b_y_n + T_fall_buf_b_y, T_Z_buf_b_y) (buf_b_y, '0, !buf_ena_n & !buf_b_in);

endmodule

`default_nettype wire
