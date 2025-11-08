`default_nettype none

module sm83_idu_bit0 #(
		parameter real L_aoi_buf_y =  7,
		parameter real L_aoi_y_n   = 40,
		parameter real L_zero_y    = 59,
		parameter real L_or_y      = 51,
		parameter real L_buf_a_y   = 30,
		parameter real L_buf_b_y   = 30,
		parameter real L_buf_ena   = 90
	) (
		input      logic pch_n, aoi_buf_ena, aoi_in1, aoi_in2, aoi_in3, zero_ena,
		                 or_in1, or_in2, buf_a_in, buf_b_in, buf_ena_n,
		output tri logic aoi_buf_y, zero_y, buf_a_y, buf_b_y,
		output     logic aoi_y_n, or_y, buf_ena
	);

	import sm83_timing::*;

	assign or_y = or_in1 | or_in2;

	tri logic aoi_y;

	localparam realtime T_rise_aoi_y     = tpd_elmore(        118, R_pmos_ohm( 6*L_unit));
	localparam realtime T_fall_aoi_y     = tpd_elmore(        118, R_nmos_ohm(18*L_unit) * 2 + R_nmos_ohm(17*L_unit));
	localparam realtime T_fall_aoi_y_in3 = tpd_elmore(        118, R_nmos_ohm(18*L_unit) + R_nmos_ohm(17*L_unit));
	localparam realtime T_fall_aoi_buf_y = tpd_elmore(L_aoi_buf_y, R_nmos_ohm(17*L_unit));
	localparam realtime T_rise_aoi_y_n   = tpd_elmore(  L_aoi_y_n, R_pmos_ohm( 7*L_unit));
	localparam realtime T_fall_aoi_y_n   = tpd_elmore(  L_aoi_y_n, R_nmos_ohm( 7*L_unit));
	localparam realtime T_Z_aoi_y        = tpd_z(T_rise_aoi_y, T_fall_aoi_y);
	localparam realtime T_Z_aoi_buf_y    = tpd_z(, T_fall_aoi_buf_y);
	bufif0 (strong1, highz0) #(T_rise_aoi_y, 0, T_Z_aoi_y)         (aoi_y, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_aoi_y, T_Z_aoi_y)         (aoi_y, '0, pch_n & aoi_in1 & aoi_in2);
	bufif1 (highz1, strong0) #(0, T_fall_aoi_y_in3, T_Z_aoi_y)     (aoi_y, '0, pch_n & aoi_in3);
	keeper aoi_y_keeper(aoi_y);
	// We use nmos, because we need to propagate input strength.
	nmos #(0, T_fall_aoi_buf_y, T_Z_aoi_buf_y) (aoi_buf_y, aoi_y, aoi_buf_ena & (aoi_y !== 1));
	assign #(T_rise_aoi_y_n, T_fall_aoi_y_n) aoi_y_n = !aoi_y;

	localparam realtime T_fall_zero_y = tpd_elmore(L_zero_y, R_nmos_ohm(18*L_unit) + R_nmos_ohm(17*L_unit));
	localparam realtime T_Z_zero_y    = tpd_z(, T_fall_zero_y);
	bufif1 (highz1, strong0) #(0, T_fall_zero_y, T_Z_zero_y) (zero_y, '0, pch_n & zero_ena);

	localparam realtime T_rise_buf_ena = tpd_elmore(L_buf_ena, R_pmos_ohm(3*L_unit));
	localparam realtime T_fall_buf_ena = tpd_elmore(L_buf_ena, R_nmos_ohm(3*L_unit));
	assign #(T_rise_buf_ena, T_fall_buf_ena) buf_ena = !buf_ena_n;

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

	specify
		specparam T_rise_nor  = tpd_elmore(   124, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_nor  = tpd_elmore(   124, R_nmos_ohm(3*L_unit));
		specparam T_rise_or_y = tpd_elmore(L_or_y, R_pmos_ohm(6*L_unit));
		specparam T_fall_or_y = tpd_elmore(L_or_y, R_nmos_ohm(7*L_unit));

		(or_in1, or_in2 *> or_y) = (T_fall_nor + T_rise_or_y, T_rise_nor + T_fall_or_y);
	endspecify

endmodule

`default_nettype wire
