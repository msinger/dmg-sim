`default_nettype none

package sm83_irq_prio_bit7_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n                = 0.0;
	parameter real L_and_in1              = 0.0;
	parameter real L_and_a_in2_nand_a_in2 = 0.0;
	parameter real L_nand_b_in2           = 0.0;
	parameter real L_nand_b_in3           = 0.0;
	parameter real L_nand_b_in4           = 0.0;
	parameter real L_nand_b_in5           = 0.0;
	parameter real L_nand_b_in6           = 0.0;
	parameter real L_nand_b_in7           = 0.0;
	parameter real L_nand_b_in8           = 0.0;
	parameter real L_nand_b_in9           = 0.0;
	parameter real L_dist_nand_a_in       = 0.0;
	parameter real L_dist_nand_b_in       = 0.0;
	parameter real L_dist_nor_in2         = 0.0;
	parameter real L_and_a_y              = 0.0;
	parameter real L_and_b_y              = 0.0;
	parameter real L_nand_a_y             = 0.0;
	parameter real L_nand_b_y             = 0.0;
	parameter real L_nand_c_y             = 0.0;
	parameter real L_nand_d_y             = 0.0;
	parameter real L_nand_e_y             = 0.0;
	parameter real L_dist_nand_a_y_n      = 0.0;
	parameter real L_dist_nand_a_y_p      = 0.0;
	parameter real L_dist_nand_b_y_n      = 0.0;
	parameter real L_dist_nand_b_y_p      = 0.0;
	parameter real L_dist_nor_y_n         = 0.0;
	parameter real L_dist_nor_y_p         = 0.0;

	parameter real W_gate_pch_n                = 30*L_unit;
	parameter real W_gate_and_in1              = 12*L_unit;
	parameter real W_gate_and_a_in2_nand_a_in2 = 12*L_unit;
	parameter real W_gate_nand_b_in2           = 12*L_unit;
	parameter real W_gate_nand_b_in3           =  6*L_unit;
	parameter real W_gate_nand_b_in4           =  6*L_unit;
	parameter real W_gate_nand_b_in5           =  6*L_unit;
	parameter real W_gate_nand_b_in6           =  6*L_unit;
	parameter real W_gate_nand_b_in7           =  6*L_unit;
	parameter real W_gate_nand_b_in8           =  6*L_unit;
	parameter real W_gate_nand_b_in9           =  6*L_unit;
	parameter real W_gate_dist_nand_a_in       =  6*L_unit;
	parameter real W_gate_dist_nand_b_in       =  6*L_unit;
	parameter real W_gate_dist_nor_in2         =  8*L_unit;

endpackage

module sm83_irq_prio_bit7 #(
		parameter real L_and_a_y              = 78 + sm83_irq_prio_bit7_param::L_and_a_y,
		parameter real L_and_b_y              = 88 + sm83_irq_prio_bit7_param::L_and_b_y,
		parameter real L_nand_a_y             = 12 + sm83_irq_prio_bit7_param::L_nand_a_y,
		parameter real L_nand_b_y             =  0 + sm83_irq_prio_bit7_param::L_nand_b_y,
		parameter real L_nand_c_y             = 31 + sm83_irq_prio_bit7_param::L_nand_c_y,
		parameter real L_nand_d_y             = 37 + sm83_irq_prio_bit7_param::L_nand_d_y,
		parameter real L_nand_e_y             = 43 + sm83_irq_prio_bit7_param::L_nand_e_y,
		parameter real L_dist_nand_a_y_n      =  0 + sm83_irq_prio_bit7_param::L_dist_nand_a_y_n,
		parameter real L_dist_nand_a_y_p      =  3 + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p,
		parameter real L_dist_nand_b_y_n      = 58 + sm83_irq_prio_bit7_param::L_dist_nand_b_y_n,
		parameter real L_dist_nand_b_y_p      = 59 + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p,
		parameter real L_dist_nor_y_n         = 51 + sm83_irq_prio_bit7_param::L_dist_nor_y_n,
		parameter real L_dist_nor_y_p         = 31 + sm83_irq_prio_bit7_param::L_dist_nor_y_p,
		parameter real W_gate_and_a_y         = 0,
		parameter real W_gate_and_b_y         = 0,
		parameter real W_gate_nand_a_y        = 0,
		parameter real W_gate_nand_b_y        = 0,
		parameter real W_gate_nand_c_y        = 0,
		parameter real W_gate_nand_d_y        = 0,
		parameter real W_gate_nand_e_y        = 0,
		parameter real W_gate_dist_nand_a_y_n = 0,
		parameter real W_gate_dist_nand_a_y_p = 0,
		parameter real W_gate_dist_nand_b_y_n = 0,
		parameter real W_gate_dist_nand_b_y_p = 0,
		parameter real W_gate_dist_nor_y_n    = 0,
		parameter real W_gate_dist_nor_y_p    = 0
	) (
		input      logic pch_n, and_in1, and_a_in2_nand_a_in2,
		                 nand_b_in2, nand_b_in3, nand_b_in4, nand_b_in5, nand_b_in6, nand_b_in7, nand_b_in8, nand_b_in9,
		                 dist_nand_a_in, dist_nand_b_in, dist_nor_in2,
		output tri logic nand_a_y, nand_b_y, nand_c_y, nand_d_y, nand_e_y, dist_nand_a_y_n, dist_nand_a_y_p,
		                 dist_nand_b_y_n, dist_nand_b_y_p, dist_nor_y_n, dist_nor_y_p,
		output     logic and_a_y, and_b_y
	);

	import sm83_timing::*;

	logic nand_b_in2_n;

	localparam realtime T_rise_nand_aa = tpd_elmore(       24,   R_pmos_ohm( 3.0*L_unit), C_gate_F(22.5*L_unit));
	localparam realtime T_fall_nand_aa = tpd_elmore(       24, 2*R_nmos_ohm( 3.0*L_unit), C_gate_F(22.5*L_unit));
	localparam realtime T_rise_and_a_y = tpd_elmore(L_and_a_y,   R_pmos_ohm(14.5*L_unit), C_gate_F(W_gate_and_a_y));
	localparam realtime T_fall_and_a_y = tpd_elmore(L_and_a_y,   R_nmos_ohm( 8.0*L_unit), C_gate_F(W_gate_and_a_y));
	assign #(T_fall_nand_aa + T_rise_and_a_y, T_rise_nand_aa + T_fall_and_a_y) and_a_y = and_in1 & and_a_in2_nand_a_in2;

	localparam realtime T_rise_nand_b_in2_n = tpd_elmore(72, R_pmos_ohm(3*L_unit), C_gate_F(15*L_unit));
	localparam realtime T_fall_nand_b_in2_n = tpd_elmore(72, R_nmos_ohm(3*L_unit), C_gate_F(15*L_unit));
	assign #(T_rise_nand_b_in2_n, T_fall_nand_b_in2_n) nand_b_in2_n = !nand_b_in2;

	localparam realtime T_rise_nand_ab = tpd_elmore(       33,   R_pmos_ohm(3*L_unit), C_gate_F(12*L_unit));
	localparam realtime T_fall_nand_ab = tpd_elmore(       33, 2*R_nmos_ohm(3*L_unit), C_gate_F(12*L_unit));
	localparam realtime T_rise_and_b_y = tpd_elmore(L_and_b_y,   R_pmos_ohm(6*L_unit), C_gate_F(W_gate_and_b_y));
	localparam realtime T_fall_and_b_y = tpd_elmore(L_and_b_y,   R_nmos_ohm(6*L_unit), C_gate_F(W_gate_and_b_y));
	assign #(T_fall_nand_ab + T_rise_and_b_y, T_rise_nand_ab + T_fall_and_b_y) and_b_y = and_in1 & nand_b_in2_n;

	localparam realtime T_fall_nand_a_y = tpd_elmore(L_nand_a_y, 2*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_a_y));
	localparam realtime T_Z_nand_a_y    = tpd_z(, T_fall_nand_a_y);
	bufif1 (highz1, strong0) #(T_Z_nand_a_y, T_fall_nand_a_y, T_Z_nand_a_y) (nand_a_y, '0, pch_n & and_a_in2_nand_a_in2);

	localparam realtime T_fall_nand_b_y = tpd_elmore(L_nand_b_y, 9*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_b_y));
	localparam realtime T_Z_nand_b_y    = tpd_z(, T_fall_nand_b_y);
	bufif1 (highz1, strong0) #(T_Z_nand_b_y, T_fall_nand_b_y, T_Z_nand_b_y)
		(nand_b_y, '0, pch_n & nand_b_in2 & nand_b_in3 & nand_b_in4 & nand_b_in5 &
		                       nand_b_in6 & nand_b_in7 & nand_b_in8 & nand_b_in9);

	localparam realtime T_fall_nand_c_y = tpd_elmore(L_nand_c_y, 2*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_c_y));
	localparam realtime T_Z_nand_c_y    = tpd_z(, T_fall_nand_c_y);
	bufif1 (highz1, strong0) #(T_Z_nand_c_y, T_fall_nand_c_y, T_Z_nand_c_y) (nand_c_y, '0, pch_n & and_a_y);

	localparam realtime T_fall_nand_d_y = tpd_elmore(L_nand_d_y, 2*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_d_y));
	localparam realtime T_Z_nand_d_y    = tpd_z(, T_fall_nand_d_y);
	bufif1 (highz1, strong0) #(T_Z_nand_d_y, T_fall_nand_d_y, T_Z_nand_d_y) (nand_d_y, '0, pch_n & and_a_y);

	localparam realtime T_fall_nand_e_y = tpd_elmore(L_nand_e_y, 2*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_e_y));
	localparam realtime T_Z_nand_e_y    = tpd_z(, T_fall_nand_e_y);
	bufif1 (highz1, strong0) #(T_Z_nand_e_y, T_fall_nand_e_y, T_Z_nand_e_y) (nand_e_y, '0, pch_n & and_a_y);

	localparam realtime T_rise_dist_nand_a_y_p = tpd_elmore(L_dist_nand_a_y_p, R_pmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_a_y_p));
	localparam realtime T_Z_dist_nand_a_y_p    = tpd_z(T_rise_dist_nand_a_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_a_y_p, T_Z_dist_nand_a_y_p, T_Z_dist_nand_a_y_p)
		(dist_nand_a_y_p, '1, dist_nand_a_in);

	localparam realtime T_fall_dist_nand_a_y_n = tpd_elmore(L_dist_nand_a_y_n, R_nmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_a_y_n));
	localparam realtime T_Z_dist_nand_a_y_n    = tpd_z(, T_fall_dist_nand_a_y_n);
	bufif1 (highz1, strong0) #(T_Z_dist_nand_a_y_n, T_fall_dist_nand_a_y_n, T_Z_dist_nand_a_y_n)
		(dist_nand_a_y_n, '0, dist_nand_a_in);

	localparam realtime T_rise_dist_nand_b_y_p = tpd_elmore(L_dist_nand_b_y_p, R_pmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_b_y_p));
	localparam realtime T_Z_dist_nand_b_y_p    = tpd_z(T_rise_dist_nand_b_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_b_y_p, T_Z_dist_nand_b_y_p, T_Z_dist_nand_b_y_p)
		(dist_nand_b_y_p, '1, dist_nand_b_in);

	localparam realtime T_fall_dist_nand_b_y_n = tpd_elmore(L_dist_nand_b_y_n, R_nmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_b_y_n));
	localparam realtime T_Z_dist_nand_b_y_n    = tpd_z(, T_fall_dist_nand_b_y_n);
	bufif1 (highz1, strong0) #(T_Z_dist_nand_b_y_n, T_fall_dist_nand_b_y_n, T_Z_dist_nand_b_y_n)
		(dist_nand_b_y_n, '0, dist_nand_b_in);

	localparam realtime T_rise_dist_nor_y_p = tpd_elmore(L_dist_nor_y_p, R_pmos_ohm(5*L_unit) + R_pmos_ohm(6*L_unit),
	                                                     C_gate_F(W_gate_dist_nor_y_p));
	localparam realtime T_Z_dist_nor_y_p    = tpd_z(T_rise_dist_nor_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nor_y_p, T_Z_dist_nor_y_p, T_Z_dist_nor_y_p)
		(dist_nor_y_p, '1, nand_b_in2_n | dist_nor_in2);

	localparam realtime T_fall_dist_nor_y_n = tpd_elmore(L_dist_nor_y_n, R_nmos_ohm(3*L_unit),
	                                                     C_gate_F(W_gate_dist_nor_y_n));
	localparam realtime T_Z_dist_nor_y_n    = tpd_z(, T_fall_dist_nor_y_n);
	bufif1 (highz1, strong0) #(T_Z_dist_nor_y_n, T_fall_dist_nor_y_n, T_Z_dist_nor_y_n)
		(dist_nor_y_n, '0, nand_b_in2_n | dist_nor_in2);

endmodule

`default_nettype wire
