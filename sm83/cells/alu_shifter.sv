`default_nettype none

package sm83_alu_shifter_param;

	import sm83_timing::L_unit;

	parameter real L_ena  = 132.1;
	parameter real L_l    =  76.3;
	parameter real L_r    =  45.7;
	parameter real L_rl   =   0.0;
	parameter real L_rr   =  23.9;
	parameter real L_rlc  =   0.0;
	parameter real L_rrc  =   0.0;
	parameter real L_sra  =  31.0;
	parameter real L_swap =  39.2;
	parameter real L_c    =   0.0;
	parameter real L_d0   =  62.3;
	parameter real L_d1   =  47.6;
	parameter real L_d2   =   0.0;
	parameter real L_d3   =   9.9;
	parameter real L_d4   =  29.7;
	parameter real L_d5   =  13.3;
	parameter real L_d6   =  31.2;
	parameter real L_d7   =  83.9;
	parameter real L_y0   =   0.0;
	parameter real L_y1   =   0.0;
	parameter real L_y2   =   0.0;
	parameter real L_y3   =  17.5;
	parameter real L_y4   =  17.0;
	parameter real L_y5   =  18.0;
	parameter real L_y6   =  18.6;
	parameter real L_y7   =  46.0;

	parameter real W_gate_ena  = 50*L_unit;
	parameter real W_gate_l    = 77*L_unit;
	parameter real W_gate_r    = 77*L_unit;
	parameter real W_gate_rl   = 11*L_unit;
	parameter real W_gate_rr   = 11*L_unit;
	parameter real W_gate_rlc  = 11*L_unit;
	parameter real W_gate_rrc  = 11*L_unit;
	parameter real W_gate_sra  = 11*L_unit;
	parameter real W_gate_swap = 88*L_unit;
	parameter real W_gate_c    = 22*L_unit;
	parameter real W_gate_d0   = 33*L_unit;
	parameter real W_gate_d1   = 33*L_unit;
	parameter real W_gate_d2   = 33*L_unit;
	parameter real W_gate_d3   = 33*L_unit;
	parameter real W_gate_d4   = 33*L_unit;
	parameter real W_gate_d5   = 33*L_unit;
	parameter real W_gate_d6   = 33*L_unit;
	parameter real W_gate_d7   = 44*L_unit;

endpackage

module sm83_alu_shifter #(
		parameter real L_y0      = 50 + sm83_alu_shifter_param::L_y0,
		parameter real L_y1      = 77 + sm83_alu_shifter_param::L_y1,
		parameter real L_y2      = 97 + sm83_alu_shifter_param::L_y2,
		parameter real L_y3      = 77 + sm83_alu_shifter_param::L_y3,
		parameter real L_y4      = 85 + sm83_alu_shifter_param::L_y4,
		parameter real L_y5      = 88 + sm83_alu_shifter_param::L_y5,
		parameter real L_y6      = 50 + sm83_alu_shifter_param::L_y6,
		parameter real L_y7      = 92 + sm83_alu_shifter_param::L_y7,
		parameter real W_gate_y0 = 0,
		parameter real W_gate_y1 = 0,
		parameter real W_gate_y2 = 0,
		parameter real W_gate_y3 = 0,
		parameter real W_gate_y4 = 0,
		parameter real W_gate_y5 = 0,
		parameter real W_gate_y6 = 0,
		parameter real W_gate_y7 = 0
	) (
		input      logic ena, l, r, rl, rr, rlc, rrc, sra, swap, c, d0, d1, d2, d3, d4, d5, d6, d7,
		output tri logic y0, y1, y2, y3, y4, y5, y6, y7
	);

	import sm83_timing::*;

	localparam realtime T_fall_y0 = tpd_elmore(L_y0, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y0));
	localparam realtime T_Z_y0    = tpd_z(, T_fall_y0);
	bufif1 (highz1, strong0) #(T_Z_y0, T_fall_y0, T_Z_y0) (y0, '0, ena & ((c & rl) | (d4 & swap) | (d1 & r) | (d7 & rlc)));

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y1));
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	bufif1 (highz1, strong0) #(T_Z_y1, T_fall_y1, T_Z_y1) (y1, '0, ena & ((d5 & swap) | (d2 & r) | (d0 & l)));

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y2));
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	bufif1 (highz1, strong0) #(T_Z_y2, T_fall_y2, T_Z_y2) (y2, '0, ena & ((d6 & swap) | (d3 & r) | (d1 & l)));

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y3));
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	bufif1 (highz1, strong0) #(T_Z_y3, T_fall_y3, T_Z_y3) (y3, '0, ena & ((d7 & swap) | (d4 & r) | (d2 & l)));

	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y4));
	localparam realtime T_Z_y4    = tpd_z(, T_fall_y4);
	bufif1 (highz1, strong0) #(T_Z_y4, T_fall_y4, T_Z_y4) (y4, '0, ena & ((d5 & r) | (d0 & swap) | (d3 & l)));

	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y5));
	localparam realtime T_Z_y5    = tpd_z(, T_fall_y5);
	bufif1 (highz1, strong0) #(T_Z_y5, T_fall_y5, T_Z_y5) (y5, '0, ena & ((d1 & swap) | (d6 & r) | (d4 & l)));

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y6));
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	bufif1 (highz1, strong0) #(T_Z_y6, T_fall_y6, T_Z_y6) (y6, '0, ena & ((d2 & swap) | (d5 & l) | (d7 & r)));

	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(6*L_unit) + 2*R_nmos_ohm(11*L_unit), C_gate_F(W_gate_y7));
	localparam realtime T_Z_y7    = tpd_z(, T_fall_y7);
	bufif1 (highz1, strong0) #(T_Z_y7, T_fall_y7, T_Z_y7)
		(y7, '0, ena & ((c & rr) | (d7 & sra) | (d0 & rrc) | (d3 & swap) | (d6 & l)));

endmodule

`default_nettype wire
