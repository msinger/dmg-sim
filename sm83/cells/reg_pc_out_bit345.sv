`default_nettype none

module sm83_reg_pc_out_bit345 #(
		parameter real L_y1 = 229,
		parameter real L_y2 = 128,
		parameter real L_y3 = 124,
		parameter real L_y4 =  54,
		parameter real L_y5 =  79,
		parameter real L_y6 =  24
	) (
		input      logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		                 in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		output tri logic y1, y2, y3, y4, y5, y6
	);

	import sm83_timing::*;

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	assign (highz1, strong0) #(0, T_fall_y1, T_Z_y1) y1 = ((in1 & in2) | (in3 & in4)) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(0, T_fall_y2, T_Z_y2) y2 = ((in5 & in6) | (in7 & in6)) ? 0 : 'z;

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	assign (highz1, strong0) #(0, T_fall_y3, T_Z_y3) y3 = (in5 & in8) ? 0 : 'z;

	localparam realtime T_fall_y4  = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_fall_y41 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y4     = tpd_z(, T_fall_y4);
	assign (highz1, strong0) #(0, T_fall_y4, T_Z_y4)  y4 = (in7 & in8) ? 0 : 'z;
	assign (highz1, strong0) #(0, T_fall_y41, T_Z_y4) y4 = in9 ? 0 : 'z;

	localparam realtime T_fall_y5  = tpd_elmore(L_y5, R_nmos_ohm(5*L_unit) * 3);
	localparam realtime T_fall_y52 = tpd_elmore(L_y5, R_nmos_ohm(5*L_unit) * 2);
	localparam realtime T_Z_y5     = tpd_z(, T_fall_y5);
	assign (highz1, strong0) #(0, T_fall_y5, T_Z_y5)  y5 = (in10 & ((in11 & in12) | (in13 & in14) | (in19 & in20))) ? 0 : 'z;
	assign (highz1, strong0) #(0, T_fall_y52, T_Z_y5) y5 = (in10 & in18) ? 0 : 'z;

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(5*L_unit) * 3);
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	assign (highz1, strong0) #(0, T_fall_y6, T_Z_y6) y6 = ((in10 & in15 & in16) | (in10 & in13 & in17)) ? 0 : 'z;

endmodule

`default_nettype wire
