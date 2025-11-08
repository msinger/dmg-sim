`default_nettype none

module sm83_alu_decoder #(
		parameter real L_y1  = 0,
		parameter real L_y2  = 0,
		parameter real L_y3  = 0,
		parameter real L_y4  = 0,
		parameter real L_y5  = 0,
		parameter real L_y6  = 0,
		parameter real L_y7  = 0,
		parameter real L_y8  = 0,
		parameter real L_y9  = 0,
		parameter real L_y10 = 0,
		parameter real L_y11 = 0,
		parameter real L_y12 = 0,
		parameter real L_y13 = 0,
		parameter real L_y14 = 0
	) (
		input      logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		input      logic in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		input      logic in21, in22, in23, in24, in25, in26, in27, in28, in29, in30,
		input      logic in31, in32, in33, in34, in35, in36, in37, in38, in39, in40,
		input      logic in41, in42, in43, in44, in45, in46, in47, in48, in49, in50,
		input      logic in51, in52, in53, in54, in55, in56, in57, in58, in59, in60,
		input      logic in61, in62, in63, in64, in65, in66, in67, in68, in69,
		output tri logic y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14
	);

	import sm83_timing::*;

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_min   = 5ps;
	localparam realtime T_Z_y1    = (0.2 * T_fall_y1) > T_Z_min ? (0.2 * T_fall_y1) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y1, T_Z_y1)
		(y1, '0, in35 & (in1 | (in49 & in48 & in46 & in44) | (in51 & (in47 | in45 | in43))));

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y2    = (0.2 * T_fall_y2) > T_Z_min ? (0.2 * T_fall_y2) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y2, T_Z_y2)
		(y2, '0, in36 & (in69 | in34 | in67 | (in68 & in33) | (in30 & in56) | (in28 & (in38 | (in40 & in39)))));

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y3    = (0.2 * T_fall_y3) > T_Z_min ? (0.2 * T_fall_y3) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y3, T_Z_y3)
		(y3, '0, in36 & ((in27 & in21) | (in26 & in25) | (in68 & in32) | (in50 & in29) | (in4 & in67) | (in48 & in55) |
		                 (in38 & in37) | (in55 & in47 & in5) | (in57 & (in4 | (in11 & in37)))));

	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_y4    = (0.2 * T_fall_y4) > T_Z_min ? (0.2 * T_fall_y4) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y4, T_Z_y4)
		(y4, '0, in35 & (in6 | (in49 & in47 & in46 & in44) | (in51 & (in48 | in45 | in43)) |
		                 (in57 & (in2 | (in60 & in11)))));

	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_y5    = (0.2 * T_fall_y5) > T_Z_min ? (0.2 * T_fall_y5) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y5, T_Z_y5)
		(y5, '0, in35 & (in7 | (in49 & in48 & in45 & in44) | (in51 & (in47 | in46 | in43)) |
		                 (in57 & in11 & (in2 | in60))));

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_y6    = (0.2 * T_fall_y6) > T_Z_min ? (0.2 * T_fall_y6) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y6, T_Z_y6)
		(y6, '0, in35 & (in8 | (in49 & in47 & in45 & in44) | (in51 & (in48 | in46 | in43)) |
		                 (in57 & in2 & in10)));

	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_y7    = (0.2 * T_fall_y7) > T_Z_min ? (0.2 * T_fall_y7) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y7, T_Z_y7)
		(y7, '0, in35 & (in9 | (in49 & in48 & in46 & in43) | (in51 & (in47 | in45 | in44)) |
		                 (in57 & in2 & in10)));

	localparam realtime T_fall_y8 = tpd_elmore(L_y8, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y8    = (0.2 * T_fall_y8) > T_Z_min ? (0.2 * T_fall_y8) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y8, T_Z_y8)
		(y8, '0, in36 & (in67 | in56 | (in68 & in31) | (in10 & in57)));

	localparam realtime T_fall_y9 = tpd_elmore(L_y9, R_nmos_ohm(11*L_unit) * 4 + R_nmos_ohm(6*L_unit));
	localparam realtime T_Z_y9    = (0.2 * T_fall_y9) > T_Z_min ? (0.2 * T_fall_y9) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y9, T_Z_y9)
		(y9, '0, in35 & (in12 | (in49 & in47 & in46 & in43) | (in51 & (in48 | in45 | in44)) |
		                 (in57 & ((in10 & ((in3 & in4) | (in2 & in5))) |
		                          (in11 & (in64 | in4 | (in66 & in60)))))));

	localparam realtime T_fall_y10 = tpd_elmore(L_y10, R_nmos_ohm(11*L_unit) * 4 + R_nmos_ohm(6*L_unit));
	localparam realtime T_Z_y10    = (0.2 * T_fall_y10) > T_Z_min ? (0.2 * T_fall_y10) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y10, T_Z_y10)
		(y10, '0, in35 & (in13 | (in49 & in48 & in45 & in43) | (in51 & (in47 | in46 | in44)) |
		                  (in57 & ((in2 & in5 & in10) | (in11 & (in64 | in4 | (in66 & in60)))))));

	localparam realtime T_fall_y11 = tpd_elmore(L_y11, R_nmos_ohm(11*L_unit) * 5);
	localparam realtime T_Z_y11    = (0.2 * T_fall_y11) > T_Z_min ? (0.2 * T_fall_y11) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y11, T_Z_y11)
		(y11, '0, in35 & (in14 | (in49 & in47 & in45 & in43) | (in51 & (in48 | in46 | in44)) |
		                  (in57 & in10 & (in2 | in4))));

	localparam realtime T_fall_y12 = tpd_elmore(L_y12, R_nmos_ohm(6*L_unit) * 4 + R_nmos_ohm(5*L_unit));
	localparam realtime T_Z_y12    = (0.2 * T_fall_y12) > T_Z_min ? (0.2 * T_fall_y12) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y12, T_Z_y12)
		(y12, '0, in36 & in41 & ((in48 & in45 & in4) | (in47 & in45 & in5) |
		                         (in15 & in47 & in46) | (in48 & in46 & in16)));

	localparam realtime T_fall_y13 = tpd_elmore(L_y13, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y13    = (0.2 * T_fall_y13) > T_Z_min ? (0.2 * T_fall_y13) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y13, T_Z_y13)
		(y13, '0, in36 & ((in17 & in34 & in48 & in46 & in44) | (in18 & in34 & in47 & in46 & in44) |
		                  (in19 & in34 & in48 & in45 & in44) | (in20 & in34 & in47 & in45 & in44) |
		                  (in22 & in34 & in48 & in46 & in43) | (in23 & in34 & in47 & in46 & in43) |
		                  (in24 & in34 & in48 & in45 & in43) | (in25 & in34 & in47 & in45 & in43) | (in68 & in59) |
		                  (in53 & (in65 | in62 | in39 | in57)) | (in16 & (in67 | in63 | in55 | in54))));

	localparam realtime T_fall_y14 = tpd_elmore(L_y14, R_nmos_ohm(11*L_unit) * 4);
	localparam realtime T_Z_y14    = (0.2 * T_fall_y14) > T_Z_min ? (0.2 * T_fall_y14) : T_Z_min;
	bufif1 (highz1, strong0) #(0, T_fall_y14, T_Z_y14)
		(y14, '0, in35 & (in42 | (in40 & in39) | (in52 & in4) | (in58 & (in5 | in48)) |
		                  (in4 & (in54 | (in61 & in47)))));

endmodule

`default_nettype wire
