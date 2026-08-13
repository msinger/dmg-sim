`default_nettype none

package sm83_reg_pc_out_bit345_param;

	import sm83_timing::L_unit;

	parameter real L_in1  = 18.8;
	parameter real L_in2  =  0.0;
	parameter real L_in3  =  0.0;
	parameter real L_in4  =  0.0;
	parameter real L_in5  = 54.2;
	parameter real L_in6  =  0.0;
	parameter real L_in7  = 51.9;
	parameter real L_in8  =  0.0;
	parameter real L_in9  =  0.0;
	parameter real L_in10 = 43.4;
	parameter real L_in11 =  0.0;
	parameter real L_in12 =  0.0;
	parameter real L_in13 = 30.0;
	parameter real L_in14 =  0.0;
	parameter real L_in15 =  0.0;
	parameter real L_in16 =  0.0;
	parameter real L_in17 =  0.0;
	parameter real L_in18 =  0.0;
	parameter real L_in19 =  0.0;
	parameter real L_in20 =  0.0;
	parameter real L_y1   =  0.0;
	parameter real L_y2   =  0.0;
	parameter real L_y3   =  0.0;
	parameter real L_y4   =  0.0;
	parameter real L_y5   = 58.5;
	parameter real L_y6   =  0.0;

	parameter real W_gate_in1  =  8*L_unit;
	parameter real W_gate_in2  =  8*L_unit;
	parameter real W_gate_in3  =  8*L_unit;
	parameter real W_gate_in4  =  8*L_unit;
	parameter real W_gate_in5  = 16*L_unit;
	parameter real W_gate_in6  = 16*L_unit;
	parameter real W_gate_in7  = 16*L_unit;
	parameter real W_gate_in8  = 16*L_unit;
	parameter real W_gate_in9  =  8*L_unit;
	parameter real W_gate_in10 = 20*L_unit;
	parameter real W_gate_in11 =  5*L_unit;
	parameter real W_gate_in12 =  5*L_unit;
	parameter real W_gate_in13 =  5*L_unit;
	parameter real W_gate_in14 =  5*L_unit;
	parameter real W_gate_in15 =  5*L_unit;
	parameter real W_gate_in16 =  5*L_unit;
	parameter real W_gate_in17 =  5*L_unit;
	parameter real W_gate_in18 =  5*L_unit;
	parameter real W_gate_in19 =  5*L_unit;
	parameter real W_gate_in20 =  5*L_unit;

endpackage

module sm83_reg_pc_out_bit345 #(
		parameter real L_y1      = 229 + sm83_reg_pc_out_bit345_param::L_y1,
		parameter real L_y2      = 128 + sm83_reg_pc_out_bit345_param::L_y2,
		parameter real L_y3      = 124 + sm83_reg_pc_out_bit345_param::L_y3,
		parameter real L_y4      =  54 + sm83_reg_pc_out_bit345_param::L_y4,
		parameter real L_y5      =  24 + sm83_reg_pc_out_bit345_param::L_y5,
		parameter real L_y6      =  24 + sm83_reg_pc_out_bit345_param::L_y6,
		parameter real W_gate_y1 = 0,
		parameter real W_gate_y2 = 0,
		parameter real W_gate_y3 = 0,
		parameter real W_gate_y4 = 0,
		parameter real W_gate_y5 = 0,
		parameter real W_gate_y6 = 0
	) (
		input      logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		                 in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		output tri logic y1, y2, y3, y4, y5, y6
	);

	import sm83_timing::*;

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y1));
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	assign (highz1, strong0) #(T_Z_y1, T_fall_y1, T_Z_y1) y1 = ((in1 & in2) | (in3 & in4)) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y2));
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(T_Z_y2, T_fall_y2, T_Z_y2) y2 = ((in5 & in6) | (in7 & in6)) ? 0 : 'z;

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y3));
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	assign (highz1, strong0) #(T_Z_y3, T_fall_y3, T_Z_y3) y3 = (in5 & in8) ? 0 : 'z;

	localparam realtime T_fall_y4  = tpd_elmore(L_y4, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y4));
	localparam realtime T_fall_y41 = tpd_elmore(L_y4,   R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y4));
	localparam realtime T_Z_y4     = tpd_z(, T_fall_y4);
	assign (highz1, strong0) #(T_Z_y4, T_fall_y4, T_Z_y4)  y4 = (in7 & in8) ? 0 : 'z;
	assign (highz1, strong0) #(T_Z_y4, T_fall_y41, T_Z_y4) y4 = in9 ? 0 : 'z;

	localparam realtime T_fall_y5  = tpd_elmore(L_y5, 3*R_nmos_ohm(5*L_unit), C_gate_F(W_gate_y5));
	localparam realtime T_fall_y52 = tpd_elmore(L_y5, 2*R_nmos_ohm(5*L_unit), C_gate_F(W_gate_y5));
	localparam realtime T_Z_y5     = tpd_z(, T_fall_y5);
	assign (highz1, strong0) #(T_Z_y5, T_fall_y5, T_Z_y5)  y5 = (in10 & ((in11 & in12) | (in13 & in14) | (in19 & in20))) ? 0 : 'z;
	assign (highz1, strong0) #(T_Z_y5, T_fall_y52, T_Z_y5) y5 = (in10 & in18) ? 0 : 'z;

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, 3*R_nmos_ohm(5*L_unit), C_gate_F(W_gate_y6));
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	assign (highz1, strong0) #(T_Z_y6, T_fall_y6, T_Z_y6) y6 = ((in10 & in15 & in16) | (in10 & in13 & in17)) ? 0 : 'z;

endmodule

`default_nettype wire
