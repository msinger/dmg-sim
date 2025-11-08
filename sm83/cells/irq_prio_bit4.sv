`default_nettype none

module sm83_irq_prio_bit4 #(
		parameter real L_and_y           =  73,
		parameter real L_nand_a_y        =  81,
		parameter real L_nand_b_y        =   0,
		parameter real L_nand_c_y        =  45,
		parameter real L_not_in          = 101,
		parameter real L_not_y           =  88,
		parameter real L_dist_nand_a_y_n =   0,
		parameter real L_dist_nand_a_y_p =  77,
		parameter real L_dist_nand_b_y_n =  55,
		parameter real L_dist_nand_b_y_p =  77,
		parameter real L_dist_nor_y_n    =  77,
		parameter real L_dist_nor_y_p    =  31
	) (
		input      logic pch_n, and_in1, and_in2_nand_a_in2, nand_b_in2, nand_b_in3, nand_b_in4, nand_b_in5, nand_b_in6,
		                 dist_nand_a_in, dist_nand_b_in, dist_nor_in,
		input  tri logic dist_nand_a_in_n, dist_nand_b_in_n, dist_nor_in_p,
		inout  tri logic not_in,
		output tri logic nand_a_y, nand_b_y, nand_c_y, dist_nand_a_y_n, dist_nand_a_y_p,
		                 dist_nand_b_y_n, dist_nand_b_y_p, dist_nor_y_n, dist_nor_y_p,
		output     logic and_y, not_y
	);

	import sm83_timing::*;

	assign not_y = !not_in;

	localparam realtime T_rise_nand  = tpd_elmore(     24, R_pmos_ohm( 3.0*L_unit));
	localparam realtime T_fall_nand  = tpd_elmore(     24, R_nmos_ohm( 3.0*L_unit) * 2);
	localparam realtime T_rise_and_y = tpd_elmore(L_and_y, R_pmos_ohm(14.5*L_unit));
	localparam realtime T_fall_and_y = tpd_elmore(L_and_y, R_nmos_ohm( 8.0*L_unit));
	assign #(T_fall_nand + T_rise_and_y, T_rise_nand + T_fall_and_y) and_y = and_in1 & and_in2_nand_a_in2;

	localparam realtime T_fall_nand_a_y = tpd_elmore(L_nand_a_y, R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_nand_a_y    = tpd_z(, T_fall_nand_a_y);
	bufif1 (highz1, strong0) #(0, T_fall_nand_a_y, T_Z_nand_a_y) (nand_a_y, '0, pch_n & and_in2_nand_a_in2);

	localparam realtime T_fall_nand_b_y = tpd_elmore(L_nand_b_y, R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_nand_b_y    = tpd_z(, T_fall_nand_b_y);
	bufif1 (highz1, strong0) #(0, T_fall_nand_b_y, T_Z_nand_b_y)
		(nand_b_y, '0, pch_n & nand_b_in2 & nand_b_in3 & nand_b_in4 & nand_b_in5 & nand_b_in6);

	localparam realtime T_fall_nand_c_y = tpd_elmore(L_nand_c_y, R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_nand_c_y    = tpd_z(, T_fall_nand_c_y);
	bufif1 (highz1, strong0) #(0, T_fall_nand_c_y, T_Z_nand_c_y) (nand_c_y, '0, pch_n & and_y);

	localparam realtime T_rise_not_in = tpd_elmore(L_not_in, R_pmos_ohm(6*L_unit));
	localparam realtime T_Z_not_in    = tpd_z(T_rise_not_in);
	bufif0 (strong1, highz0) #(T_rise_not_in, 0, T_Z_not_in) (not_in, '1, pch_n);

	localparam realtime T_rise_dist_nand_a_y_p = tpd_elmore(L_dist_nand_a_y_p, R_pmos_ohm(3*L_unit));
	localparam realtime T_Z_dist_nand_a_y_p    = tpd_z(T_rise_dist_nand_a_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_a_y_p, 0, T_Z_dist_nand_a_y_p)
		(dist_nand_a_y_p, '1, dist_nand_a_in);

	localparam realtime T_fall_dist_nand_a_y_n = tpd_elmore(L_dist_nand_a_y_n, R_nmos_ohm(3*L_unit));
	localparam realtime T_Z_dist_nand_a_y_n    = tpd_z(, T_fall_dist_nand_a_y_n);
	// We use nmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	nmos #(T_Z_dist_nand_a_y_n, T_fall_dist_nand_a_y_n, T_Z_dist_nand_a_y_n)
		(dist_nand_a_y_n, dist_nand_a_in_n, dist_nand_a_in & (dist_nand_a_in_n !== 1));

	localparam realtime T_rise_dist_nand_b_y_p = tpd_elmore(L_dist_nand_b_y_p, R_pmos_ohm(3*L_unit));
	localparam realtime T_Z_dist_nand_b_y_p    = tpd_z(T_rise_dist_nand_b_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_b_y_p, 0, T_Z_dist_nand_b_y_p)
		(dist_nand_b_y_p, '1, dist_nand_b_in);

	localparam realtime T_fall_dist_nand_b_y_n = tpd_elmore(L_dist_nand_b_y_n, R_nmos_ohm(3*L_unit));
	localparam realtime T_Z_dist_nand_b_y_n    = tpd_z(, T_fall_dist_nand_b_y_n);
	// We use nmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	nmos #(T_Z_dist_nand_b_y_n, T_fall_dist_nand_b_y_n, T_Z_dist_nand_b_y_n)
		(dist_nand_b_y_n, dist_nand_b_in_n, dist_nand_b_in & (dist_nand_b_in_n !== 1));

	localparam realtime T_rise_dist_nor_y_p = tpd_elmore(L_dist_nor_y_p, R_pmos_ohm(5*L_unit));
	localparam realtime T_Z_dist_nor_y_p    = tpd_z(T_rise_dist_nor_y_p);
	// We use pmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	pmos #(T_rise_dist_nor_y_p, T_Z_dist_nor_y_p, T_Z_dist_nor_y_p)
		(dist_nor_y_p, dist_nor_in_p, dist_nor_in | (dist_nor_in_p === 0));

	localparam realtime T_fall_dist_nor_y_n = tpd_elmore(L_dist_nor_y_n, R_nmos_ohm(3*L_unit));
	localparam realtime T_Z_dist_nor_y_n    = tpd_z(, T_fall_dist_nor_y_n);
	bufif1 (highz1, strong0) #(T_Z_dist_nor_y_n, T_fall_dist_nor_y_n, T_Z_dist_nor_y_n)
		(dist_nor_y_n, '0, dist_nor_in);

	specify
		specparam T_rise_not_y = tpd_elmore(L_not_y, R_pmos_ohm(6*L_unit));
		specparam T_fall_not_y = tpd_elmore(L_not_y, R_nmos_ohm(6*L_unit));

		(not_in *> not_y) = (T_rise_not_y, T_fall_not_y);
	endspecify

endmodule

`default_nettype wire
