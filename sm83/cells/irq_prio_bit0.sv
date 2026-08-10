`default_nettype none

package sm83_irq_prio_bit0_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n              = 0.0;
	parameter real L_and_in1            = 0.0;
	parameter real L_and_in2_nand_a_in2 = 0.0;
	parameter real L_nand_b_in2         = 0.0;
	parameter real L_dist_nand_a_in1    = 0.0;
	parameter real L_dist_nand_a_in2    = 0.0;
	parameter real L_dist_nand_b_in     = 0.0;
	parameter real L_dist_nor_in        = 0.0;
	parameter real L_dist_nand_a_in_n   = 0.0;
	parameter real L_dist_nand_b_in_n   = 0.0;
	parameter real L_dist_nor_in_p      = 0.0;
	parameter real L_and_y              = 0.0;
	parameter real L_nand_a_y           = 0.0;
	parameter real L_nand_b_y           = 0.0;
	parameter real L_dist_nand_a_y_n    = 0.0;
	parameter real L_dist_nand_a_y_p    = 0.0;
	parameter real L_dist_nand_b_y_n    = 0.0;
	parameter real L_dist_nand_b_y_p    = 0.0;
	parameter real L_dist_nor_y_n       = 0.0;
	parameter real L_dist_nor_y_p       = 0.0;

	parameter real W_gate_pch_n              = 25*L_unit;
	parameter real W_gate_and_in1            =  6*L_unit;
	parameter real W_gate_and_in2_nand_a_in2 = 12*L_unit;
	parameter real W_gate_nand_b_in2         =  6*L_unit;
	parameter real W_gate_dist_nand_a_in1    =  6*L_unit;
	parameter real W_gate_dist_nand_a_in2    =  6*L_unit;
	parameter real W_gate_dist_nand_b_in     =  6*L_unit;
	parameter real W_gate_dist_nor_in        =  8*L_unit;
	parameter real W_gate_dist_nand_a_in_n   =  0;
	parameter real W_gate_dist_nand_b_in_n   =  0;
	parameter real W_gate_dist_nor_in_p      =  0;

endpackage

module sm83_irq_prio_bit0 #(
		parameter real L_and_y                =  62 + sm83_irq_prio_bit0_param::L_and_y,
		parameter real L_nand_a_y             = 138 + sm83_irq_prio_bit0_param::L_nand_a_y,
		parameter real L_nand_b_y             =  28 + sm83_irq_prio_bit0_param::L_nand_b_y,
		parameter real L_dist_nand_a_y_n      =   0 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n,
		parameter real L_dist_nand_a_y_p      =  74 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p,
		parameter real L_dist_nand_b_y_n      =  56 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n,
		parameter real L_dist_nand_b_y_p      =  74 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p,
		parameter real L_dist_nor_y_n         =  74 + sm83_irq_prio_bit0_param::L_dist_nor_y_n,
		parameter real L_dist_nor_y_p         =  31 + sm83_irq_prio_bit0_param::L_dist_nor_y_p,
		parameter real W_gate_and_y           = 0,
		parameter real W_gate_nand_a_y        = 0,
		parameter real W_gate_nand_b_y        = 0,
		parameter real W_gate_dist_nand_a_y_n = 0,
		parameter real W_gate_dist_nand_a_y_p = 0,
		parameter real W_gate_dist_nand_b_y_n = 0,
		parameter real W_gate_dist_nand_b_y_p = 0,
		parameter real W_gate_dist_nor_y_n    = 0,
		parameter real W_gate_dist_nor_y_p    = 0
	) (
		input      logic pch_n, and_in1, and_in2_nand_a_in2, nand_b_in2,
		                 dist_nand_a_in1, dist_nand_a_in2, dist_nand_b_in, dist_nor_in,
		input  tri logic dist_nand_a_in_n, dist_nand_b_in_n, dist_nor_in_p,
		output tri logic nand_a_y, nand_b_y, dist_nand_a_y_n, dist_nand_a_y_p,
		                 dist_nand_b_y_n, dist_nand_b_y_p, dist_nor_y_n, dist_nor_y_p,
		output     logic and_y
	);

	import sm83_timing::*;

	assign and_y = and_in1 & and_in2_nand_a_in2;

	localparam realtime T_rise_nand_a_y = tpd_elmore(L_nand_a_y,   R_pmos_ohm(13*L_unit), C_gate_F(W_gate_nand_a_y));
	localparam realtime T_fall_nand_a_y = tpd_elmore(L_nand_a_y, 2*R_nmos_ohm( 6*L_unit), C_gate_F(W_gate_nand_a_y));
	localparam realtime T_Z_nand_a_y    = tpd_z(T_rise_nand_a_y, T_fall_nand_a_y);
	bufif0 (strong1, highz0) #(T_rise_nand_a_y, T_fall_nand_a_y, T_Z_nand_a_y) (nand_a_y, '1, pch_n);
	bufif1 (highz1, strong0) #(T_rise_nand_a_y, T_fall_nand_a_y, T_Z_nand_a_y) (nand_a_y, '0, pch_n & and_in2_nand_a_in2);

	localparam realtime T_fall_nand_b_y = tpd_elmore(L_nand_b_y, 2*R_nmos_ohm(6*L_unit), C_gate_F(W_gate_nand_b_y));
	localparam realtime T_Z_nand_b_y    = tpd_z(, T_fall_nand_b_y);
	bufif1 (highz1, strong0) #(T_Z_nand_b_y, T_fall_nand_b_y, T_Z_nand_b_y) (nand_b_y, '0, pch_n & nand_b_in2);

	localparam realtime T_rise_dist_nand_a_y_p = tpd_elmore(L_dist_nand_a_y_p, R_pmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_a_y_p));
	localparam realtime T_Z_dist_nand_a_y_p    = tpd_z(T_rise_dist_nand_a_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_a_y_p, T_Z_dist_nand_a_y_p, T_Z_dist_nand_a_y_p)
		(dist_nand_a_y_p, '1, dist_nand_a_in1 & dist_nand_a_in2);

	localparam realtime T_fall_dist_nand_a_y_n = tpd_elmore(L_dist_nand_a_y_n, 2*R_nmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_a_y_n));
	localparam realtime T_Z_dist_nand_a_y_n    = tpd_z(, T_fall_dist_nand_a_y_n);
	// We use nmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	nmos #(T_Z_dist_nand_a_y_n, T_fall_dist_nand_a_y_n, T_Z_dist_nand_a_y_n)
		(dist_nand_a_y_n, dist_nand_a_in_n, dist_nand_a_in1 & dist_nand_a_in2 & (dist_nand_a_in_n !== 1));

	localparam realtime T_rise_dist_nand_b_y_p = tpd_elmore(L_dist_nand_b_y_p, R_pmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_b_y_p));
	localparam realtime T_Z_dist_nand_b_y_p    = tpd_z(T_rise_dist_nand_b_y_p);
	bufif0 (strong1, highz0) #(T_rise_dist_nand_b_y_p, T_Z_dist_nand_b_y_p, T_Z_dist_nand_b_y_p)
		(dist_nand_b_y_p, '1, dist_nand_b_in);

	localparam realtime T_fall_dist_nand_b_y_n = tpd_elmore(L_dist_nand_b_y_n, R_nmos_ohm(3*L_unit),
	                                                        C_gate_F(W_gate_dist_nand_b_y_n));
	localparam realtime T_Z_dist_nand_b_y_n    = tpd_z(, T_fall_dist_nand_b_y_n);
	// We use nmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	nmos #(T_Z_dist_nand_b_y_n, T_fall_dist_nand_b_y_n, T_Z_dist_nand_b_y_n)
		(dist_nand_b_y_n, dist_nand_b_in_n, dist_nand_b_in & (dist_nand_b_in_n !== 1));

	localparam realtime T_rise_dist_nor_y_p = tpd_elmore(L_dist_nor_y_p, R_pmos_ohm(5*L_unit),
	                                                     C_gate_F(W_gate_dist_nor_y_p));
	localparam realtime T_Z_dist_nor_y_p    = tpd_z(T_rise_dist_nor_y_p);
	// We use pmos, because we need to propagate input strength, because of the automatically generated keepers upstairs.
	pmos #(T_rise_dist_nor_y_p, T_Z_dist_nor_y_p, T_Z_dist_nor_y_p)
		(dist_nor_y_p, dist_nor_in_p, dist_nor_in | (dist_nor_in_p === 0));

	localparam realtime T_fall_dist_nor_y_n = tpd_elmore(L_dist_nor_y_n, R_nmos_ohm(3*L_unit),
	                                                     C_gate_F(W_gate_dist_nor_y_n));
	localparam realtime T_Z_dist_nor_y_n    = tpd_z(, T_fall_dist_nor_y_n);
	bufif1 (highz1, strong0) #(T_Z_dist_nor_y_n, T_fall_dist_nor_y_n, T_Z_dist_nor_y_n)
		(dist_nor_y_n, '0, dist_nor_in);

	specify
		specparam T_rise_nand  = tpd_elmore(     24,   R_pmos_ohm( 3.0*L_unit), C_gate_F(22.5*L_unit));
		specparam T_fall_nand  = tpd_elmore(     24, 2*R_nmos_ohm( 3.0*L_unit), C_gate_F(22.5*L_unit));
		specparam T_rise_and_y = tpd_elmore(L_and_y,   R_pmos_ohm(14.5*L_unit), C_gate_F(W_gate_and_y));
		specparam T_fall_and_y = tpd_elmore(L_and_y,   R_nmos_ohm( 8.0*L_unit), C_gate_F(W_gate_and_y));

		(and_in1, and_in2_nand_a_in2 *> and_y) = (T_fall_nand + T_rise_and_y, T_rise_nand + T_fall_and_y);
	endspecify

endmodule

`default_nettype wire
