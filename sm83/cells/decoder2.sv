`default_nettype none

module sm83_decoder2 #(
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
		parameter real L_y14 = 0,
		parameter real L_y15 = 0,
		parameter real L_y16 = 0,
		parameter real L_y17 = 0,
		parameter real L_y18 = 0,
		parameter real L_y19 = 0,
		parameter real L_y20 = 0,
		parameter real L_y21 = 0,
		parameter real L_y22 = 0,
		parameter real L_y23 = 0,
		parameter real L_y24 = 0,
		parameter real L_y25 = 0,
		parameter real L_y26 = 0,
		parameter real L_y27 = 0,
		parameter real L_y28 = 0,
		parameter real L_y29 = 0,
		parameter real L_y30 = 0
	) (
		input      logic pch_n, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		input      logic in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		input      logic in21, in22, in23, in24, in25, in26, in27, in28, in29, in30,
		input      logic in31, in32, in33, in34, in35, in36, in37, in38, in39, in40,
		input      logic in41, in42, in43, in44, in45, in46, in47, in48, in49, in50,
		input      logic in51, in52, in53, in54, in55, in56, in57, in58, in59, in60,
		input      logic in61, in62, in63, in64, in65, in66, in67, in68, in69, in70,
		input      logic in71, in72, in73, in74, in75, in76, in77, in78, in79, in80,
		input      logic in81, in82, in83, in84, in85, in86, in87, in88, in89, in90,
		input      logic in91, in92, in93, in94, in95, in96, in97,
		output tri logic y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
		output tri logic y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30
	);

	import sm83_timing::*;

	localparam realtime T_rise_y1 = tpd_elmore(L_y1, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y1    = tpd_z(T_rise_y1, T_fall_y1);
	bufif0 (strong1, highz0) #(T_rise_y1, 0, T_Z_y1) (y1, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y1, T_Z_y1) (y1, '0, pch_n & (in27 | in28 | in29 | in30));

	localparam realtime T_rise_y2 = tpd_elmore(L_y2, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y2    = tpd_z(T_rise_y2, T_fall_y2);
	bufif0 (strong1, highz0) #(T_rise_y2, 0, T_Z_y2) (y2, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y2, T_Z_y2) (y2, '0, pch_n & (in1 | in24 | in25));

	localparam realtime T_rise_y3 = tpd_elmore(L_y3, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y3    = tpd_z(T_rise_y3, T_fall_y3);
	bufif0 (strong1, highz0) #(T_rise_y3, 0, T_Z_y3) (y3, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y3, T_Z_y3) (y3, '0, pch_n & (in24 | in45));

	localparam realtime T_rise_y4 = tpd_elmore(L_y4, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y4    = tpd_z(T_rise_y4, T_fall_y4);
	bufif0 (strong1, highz0) #(T_rise_y4, 0, T_Z_y4) (y4, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y4, T_Z_y4) (y4, '0, pch_n & (in4 | in26));

	localparam realtime T_rise_y5 = tpd_elmore(L_y5, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y5    = tpd_z(T_rise_y5, T_fall_y5);
	bufif0 (strong1, highz0) #(T_rise_y5, 0, T_Z_y5) (y5, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y5, T_Z_y5)
		(y5, '0, pch_n & (in7 | in9 | in11 | in14 | in18 | in19 | in24 | in34 | in35 | in44 | in45 | in47 |
		                  in49 | in58 | in64 | in71 | in73 | in76 | in78 | in95));

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	bufif1 (highz1, strong0) #(0, T_fall_y6, T_Z_y6) (y6, '0, pch_n & (in43 | in44));

	localparam realtime T_rise_y7 = tpd_elmore(L_y7, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y7    = tpd_z(T_rise_y7, T_fall_y7);
	bufif0 (strong1, highz0) #(T_rise_y7, 0, T_Z_y7) (y7, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y7, T_Z_y7) (y7, '0, pch_n & (in41 | in42));

	localparam realtime T_rise_y8 = tpd_elmore(L_y8, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y8 = tpd_elmore(L_y8, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y8    = tpd_z(T_rise_y8, T_fall_y8);
	bufif0 (strong1, highz0) #(T_rise_y8, 0, T_Z_y8) (y8, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y8, T_Z_y8)
		(y8, '0, pch_n & (in2 | in4 | in5 | in7 | in8 | in9 | in10 | in11 | in13 | in14 | in15 | in17 | in18 |
		                  in19 | in20 | in21 | in22 | in23 | in24 | in25 | in26 | in31 | in32 | in34 | in35 |
		                  in36 | in37 | in38 | in39 | in40 | in42 | in43 | in44 | in45 | in46 | in47 | in48 |
		                  in49 | in50 | in54 | in55 | in56 | in58 | in59 | in60 | in63 | in64 | in65 | in66 |
		                  in67 | in68 | in69 | in70 | in71 | in72 | in73 | in74 | in75 | in76 | in78 | in81 |
		                  in82 | in83 | in84 | in87 | in88 | in89 | in90 | in91 | in92 | in93 | in94 | in95 |
		                  in96 | in97));

	localparam realtime T_rise_y9 = tpd_elmore(L_y9, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y9 = tpd_elmore(L_y9, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y9    = tpd_z(T_rise_y9, T_fall_y9);
	bufif0 (strong1, highz0) #(T_rise_y9, 0, T_Z_y9) (y9, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y9, T_Z_y9) (y9, '0, pch_n & (in45 | in46));

	localparam realtime T_fall_y10 = tpd_elmore(L_y10, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y10    = tpd_z(, T_fall_y10);
	bufif1 (highz1, strong0) #(0, T_fall_y10, T_Z_y10) (y10, '0, pch_n & (in47 | in49));

	localparam realtime T_fall_y11 = tpd_elmore(L_y11, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y11    = tpd_z(, T_fall_y11);
	bufif1 (highz1, strong0) #(0, T_fall_y11, T_Z_y11) (y11, '0, pch_n & (in51 | in52));

	localparam realtime T_rise_y12 = tpd_elmore(L_y12, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y12 = tpd_elmore(L_y12, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y12    = tpd_z(T_rise_y12, T_fall_y12);
	bufif0 (strong1, highz0) #(T_rise_y12, 0, T_Z_y12) (y12, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y12, T_Z_y12) (y12, '0, pch_n & (in49 | in66));

	localparam realtime T_rise_y13 = tpd_elmore(L_y13, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y13 = tpd_elmore(L_y13, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y13    = tpd_z(T_rise_y13, T_fall_y13);
	bufif0 (strong1, highz0) #(T_rise_y13, 0, T_Z_y13) (y13, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y13, T_Z_y13)
		(y13, '0, pch_n & (in25 | in31 | in32 | in36 | in40 | in46 | in48 | in50 | in55 | in56 | in59 | in60 |
		                   in65 | in66 | in67 | in68 | in69 | in70 | in72 | in74 | in75 | in82 | in83 | in84 |
		                   in87 | in88 | in90 | in91 | in93 | in96 | in97));

	localparam realtime T_rise_y14 = tpd_elmore(L_y14, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y14 = tpd_elmore(L_y14, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y14    = tpd_z(T_rise_y14, T_fall_y14);
	bufif0 (strong1, highz0) #(T_rise_y14, 0, T_Z_y14) (y14, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y14, T_Z_y14)
		(y14, '0, pch_n & (in6 | in9 | in11 | in12 | in14 | in16 | in18 | in19 | in24 | in25 | in29 | in31 |
		                   in33 | in35 | in36 | in40 | in41 | in44 | in45 | in46 | in47 | in48 | in49 | in51 |
		                   in52 | in53 | in55 | in57 | in58 | in59 | in64 | in65 | in67 | in68 | in69 | in71 |
		                   in72 | in73 | in75 | in77 | in79 | in84 | in87 | in93 | in95 | in96));

	localparam realtime T_rise_y15 = tpd_elmore(L_y15, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y15 = tpd_elmore(L_y15, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y15    = tpd_z(T_rise_y15, T_fall_y15);
	bufif0 (strong1, highz0) #(T_rise_y15, 0, T_Z_y15) (y15, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y15, T_Z_y15)
		(y15, '0, pch_n & (in12 | in15 | in44 | in50 | in58 | in64 | in65 | in71 | in72 | in73 | in90 | in93 |
		                   in95));

	localparam realtime T_rise_y16 = tpd_elmore(L_y16, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y16 = tpd_elmore(L_y16, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y16    = tpd_z(T_rise_y16, T_fall_y16);
	bufif0 (strong1, highz0) #(T_rise_y16, 0, T_Z_y16) (y16, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y16, T_Z_y16) (y16, '0, pch_n & (in61 | in62));

	localparam realtime T_fall_y17 = tpd_elmore(L_y17, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y17    = tpd_z(, T_fall_y17);
	bufif1 (highz1, strong0) #(0, T_fall_y17, T_Z_y17) (y17, '0, pch_n & (in63 | in64));

	localparam realtime T_rise_y18 = tpd_elmore(L_y18, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y18 = tpd_elmore(L_y18, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y18    = tpd_z(T_rise_y18, T_fall_y18);
	bufif0 (strong1, highz0) #(T_rise_y18, 0, T_Z_y18) (y18, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y18, T_Z_y18)
		(y18, '0, pch_n & (in4 | in5 | in8 | in10 | in13 | in17 | in20 | in21 | in22 | in23 | in26 | in31 |
		                   in32 | in36 | in37 | in38 | in39 | in40 | in42 | in43 | in48 | in54 | in55 | in56 |
		                   in63 | in67 | in68 | in69 | in70 | in75 | in80 | in81 | in87 | in88 | in89 | in91 |
		                   in92 | in94 | in96 | in97));

	localparam realtime T_rise_y19 = tpd_elmore(L_y19, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y19 = tpd_elmore(L_y19, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y19    = tpd_z(T_rise_y19, T_fall_y19);
	bufif0 (strong1, highz0) #(T_rise_y19, 0, T_Z_y19) (y19, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y19, T_Z_y19)
		(y19, '0, pch_n & (in2 | in4 | in5 | in8 | in10 | in13 | in15 | in17 | in20 | in21 | in22 | in23 |
		                   in26 | in37 | in38 | in39 | in42 | in43 | in54 | in63 | in81 | in89 | in92 | in94));

	localparam realtime T_fall_y20 = tpd_elmore(L_y20, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y20    = tpd_z(, T_fall_y20);
	bufif1 (highz1, strong0) #(0, T_fall_y20, T_Z_y20) (y20, '0, pch_n & (in11 | in14));

	localparam realtime T_rise_y21 = tpd_elmore(L_y21, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y21 = tpd_elmore(L_y21, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y21    = tpd_z(T_rise_y21, T_fall_y21);
	bufif0 (strong1, highz0) #(T_rise_y21, 0, T_Z_y21) (y21, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y21, T_Z_y21) (y21, '0, pch_n & (in34 | in76 | in78));

	localparam realtime T_rise_y22 = tpd_elmore(L_y22, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y22 = tpd_elmore(L_y22, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y22    = tpd_z(T_rise_y22, T_fall_y22);
	bufif0 (strong1, highz0) #(T_rise_y22, 0, T_Z_y22) (y22, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y22, T_Z_y22) (y22, '0, pch_n & (in47 | in74));

	localparam realtime T_rise_y23 = tpd_elmore(L_y23, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y23 = tpd_elmore(L_y23, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y23    = tpd_z(T_rise_y23, T_fall_y23);
	bufif0 (strong1, highz0) #(T_rise_y23, 0, T_Z_y23) (y23, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y23, T_Z_y23)
		(y23, '0, pch_n & (in7 | in9 | in18 | in19 | in33 | in34 | in35 | in53 | in59 | in60 | in76 | in77 |
		                   in78 | in79 | in82 | in83 | in84));

	localparam realtime T_rise_y24 = tpd_elmore(L_y24, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y24 = tpd_elmore(L_y24, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y24    = tpd_z(T_rise_y24, T_fall_y24);
	bufif0 (strong1, highz0) #(T_rise_y24, 0, T_Z_y24) (y24, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y24, T_Z_y24)
		(y24, '0, pch_n & (in2 | in4 | in5 | in8 | in10 | in11 | in13 | in15 | in17 | in20 | in22 | in23 |
		                   in26 | in31 | in32 | in36 | in37 | in38 | in39 | in40 | in42 | in43 | in48 | in52 |
		                   in54 | in55 | in56 | in59 | in60 | in63 | in67 | in68 | in69 | in70 | in75 | in81 |
		                   in82 | in83 | in84 | in85 | in87 | in88 | in89 | in91 | in92 | in94 | in96 | in97));

	localparam realtime T_rise_y25 = tpd_elmore(L_y25, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y25 = tpd_elmore(L_y25, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y25    = tpd_z(T_rise_y25, T_fall_y25);
	bufif0 (strong1, highz0) #(T_rise_y25, 0, T_Z_y25) (y25, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y25, T_Z_y25)
		(y25, '0, pch_n & (in9 | in12 | in14 | in16 | in18 | in19 | in24 | in34 | in35 | in44 | in45 | in47 |
		                   in49 | in50 | in51 | in52 | in57 | in58 | in64 | in66 | in71 | in73 | in74 | in78 |
		                   in79 | in80 | in90 | in91 | in95));

	localparam realtime T_rise_y26 = tpd_elmore(L_y26, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y26 = tpd_elmore(L_y26, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y26    = tpd_z(T_rise_y26, T_fall_y26);
	bufif0 (strong1, highz0) #(T_rise_y26, 0, T_Z_y26) (y26, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y26, T_Z_y26)
		(y26, '0, pch_n & (in3 | in7 | in9 | in11 | in12 | in14 | in16 | in18 | in19 | in24 | in25 | in32 |
		                   in33 | in35 | in41 | in44 | in45 | in47 | in49 | in50 | in51 | in52 | in56 | in57 |
		                   in58 | in60 | in61 | in62 | in64 | in66 | in70 | in71 | in73 | in74 | in76 | in78 |
		                   in82 | in83 | in84 | in88 | in90 | in91 | in95 | in97));

	localparam realtime T_rise_y27 = tpd_elmore(L_y27, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y27 = tpd_elmore(L_y27, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y27    = tpd_z(T_rise_y27, T_fall_y27);
	bufif0 (strong1, highz0) #(T_rise_y27, 0, T_Z_y27) (y27, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y27, T_Z_y27) (y27, '0, pch_n & (in18 | in19 | in35));

	localparam realtime T_rise_y28 = tpd_elmore(L_y28, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y28 = tpd_elmore(L_y28, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y28    = tpd_z(T_rise_y28, T_fall_y28);
	bufif0 (strong1, highz0) #(T_rise_y28, 0, T_Z_y28) (y28, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y28, T_Z_y28)
		(y28, '0, pch_n & (in7 | in33 | in34 | in51 | in53 | in76 | in77 | in78 | in79 | in80 | in86));

	localparam realtime T_rise_y29 = tpd_elmore(L_y29, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y29 = tpd_elmore(L_y29, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y29    = tpd_z(T_rise_y29, T_fall_y29);
	bufif0 (strong1, highz0) #(T_rise_y29, 0, T_Z_y29) (y29, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y29, T_Z_y29) (y29, '0, pch_n & (in16 | in35 | in57));

	localparam realtime T_rise_y30 = tpd_elmore(L_y30, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_y30 = tpd_elmore(L_y30, R_nmos_ohm(8*L_unit) + R_nmos_ohm(11*L_unit));
	localparam realtime T_Z_y30    = tpd_z(T_rise_y30, T_fall_y30);
	bufif0 (strong1, highz0) #(T_rise_y30, 0, T_Z_y30) (y30, '1, pch_n);
	bufif1 (highz1, strong0) #(0, T_fall_y30, T_Z_y30)
		(y30, '0, pch_n & (in4 | in5 | in6 | in7 | in8 | in9 | in10 | in12 | in15 | in17 | in18 | in19 | in20 |
		                   in21 | in22 | in26 | in35 | in37 | in38 | in42 | in43 | in45 | in46 | in51 | in52 |
		                   in54 | in57 | in61 | in62 | in63 | in71 | in73 | in81 | in89 | in92 | in94 | in95));

endmodule

`default_nettype wire
