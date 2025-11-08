`default_nettype none

module sm83_decoder3 #(
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
		parameter real L_y30 = 0,
		parameter real L_y31 = 0,
		parameter real L_y32 = 0,
		parameter real L_y33 = 0,
		parameter real L_y34 = 0,
		parameter real L_y35 = 0,
		parameter real L_y36 = 0,
		parameter real L_y37 = 0,
		parameter real L_y38 = 0,
		parameter real L_y39 = 0,
		parameter real L_y40 = 0,
		parameter real L_y41 = 0,
		parameter real L_y42 = 0,
		parameter real L_y43 = 0,
		parameter real L_y44 = 0,
		parameter real L_y45 = 0,
		parameter real L_y46 = 0,
		parameter real L_y47 = 0,
		parameter real L_y48 = 0,
		parameter real L_y49 = 0,
		parameter real L_y50 = 0,
		parameter real L_y51 = 0,
		parameter real L_y52 = 0,
		parameter real L_y53 = 0,
		parameter real L_y54 = 0,
		parameter real L_y55 = 0,
		parameter real L_y56 = 0,
		parameter real L_y57 = 0,
		parameter real L_y58 = 0,
		parameter real L_y59 = 0,
		parameter real L_y60 = 0,
		parameter real L_y61 = 0,
		parameter real L_y62 = 0,
		parameter real L_y63 = 0,
		parameter real L_y64 = 0,
		parameter real L_y65 = 0,
		parameter real L_y66 = 0,
		parameter real L_y67 = 0,
		parameter real L_y68 = 0,
		parameter real L_y69 = 0
	) (
		input      logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		input      logic in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		input      logic in21, in22, in23, in24, in25, in26, in27, in28, in29, in30,
		input      logic in31, in32, in33, in34, in35, in36, in37, in38, in39, in40,
		input      logic in41, in42, in43, in44, in45, in46, in47, in48, in49, in50,
		input      logic in51, in52, in53, in54, in55, in56, in57, in58, in59, in60,
		input      logic in61, in62, in63, in64, in65, in66, in67, in68, in69, in70,
		input      logic in71, in72, in73, in74, in75, in76, in77, in78, in79, in80,
		input      logic in81, in82, in83, in84, in85, in86, in87, in88, in89, in90,
		output tri logic y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
		output tri logic y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30,
		output tri logic y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y44, y45,
		output tri logic y46, y47, y48, y49, y50, y51, y52, y53, y54, y55, y56, y57, y58, y59, y60,
		output tri logic y61, y62, y63, y64, y65, y66, y67, y68, y69
	);

	import sm83_timing::*;

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	bufif1 (highz1, strong0) #(0, T_fall_y1, T_Z_y1)
		(y1, '0, in85 & in80 & (in9 | (in78 & in8)));

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	bufif1 (highz1, strong0) #(0, T_fall_y2, T_Z_y2)
		(y2, '0, in85 & in79 & (in9 | in8));

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	bufif1 (highz1, strong0) #(0, T_fall_y3, T_Z_y3)
		(y3, '0, in85 & (in55 | (in75 & in77 & in80 & in19)));

	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y4    = tpd_z(, T_fall_y4);
	bufif1 (highz1, strong0) #(0, T_fall_y4, T_Z_y4)
		(y4, '0, in85 & (in2 | in68 | in3 | in25 | in6 | in10 | in32));

	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y5    = tpd_z(, T_fall_y5);
	bufif1 (highz1, strong0) #(0, T_fall_y5, T_Z_y5)
		(y5, '0, in85 & (in13 | in38 | in1 | in48 | in37 | in42));

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	bufif1 (highz1, strong0) #(0, T_fall_y6, T_Z_y6)
		(y6, '0, in85 & in78 & in80 & in9);

	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y7    = tpd_z(, T_fall_y7);
	bufif1 (highz1, strong0) #(0, T_fall_y7, T_Z_y7)
		(y7, '0, in85 & in77 & in80 & in9);

	localparam realtime T_fall_y8 = tpd_elmore(L_y8, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y8    = tpd_z(, T_fall_y8);
	bufif1 (highz1, strong0) #(0, T_fall_y8, T_Z_y8)
		(y8, '0, in85 & in78 & in79 & in9);

	localparam realtime T_fall_y9 = tpd_elmore(L_y9, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y9    = tpd_z(, T_fall_y9);
	bufif1 (highz1, strong0) #(0, T_fall_y9, T_Z_y9)
		(y9, '0, in85 & in77 & in79 & in9);

	localparam realtime T_fall_y10 = tpd_elmore(L_y10, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y10    = tpd_z(, T_fall_y10);
	bufif1 (highz1, strong0) #(0, T_fall_y10, T_Z_y10)
		(y10, '0, in85 & in78 & in79 & in8);

	localparam realtime T_fall_y11 = tpd_elmore(L_y11, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y11    = tpd_z(, T_fall_y11);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y11, T_Z_y11)
		(y11, '0, ((in85 & in14 & in12) | in74) & (in11 | in23 | in29 | in32));

	localparam realtime T_fall_y12 = tpd_elmore(L_y12, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y12    = tpd_z(, T_fall_y12);
	bufif1 (highz1, strong0) #(0, T_fall_y12, T_Z_y12)
		(y12, '0, (in85 & in12) | (in74 & in14));

	localparam realtime T_fall_y13 = tpd_elmore(L_y13, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y13    = tpd_z(, T_fall_y13);
	bufif1 (highz1, strong0) #(0, T_fall_y13, T_Z_y13)
		(y13, '0, in85 & (in14 | in12 | (in68 & in83)));

	localparam realtime T_fall_y14 = tpd_elmore(L_y14, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y14    = tpd_z(, T_fall_y14);
	bufif1 (highz1, strong0) #(0, T_fall_y14, T_Z_y14)
		(y14, '0, in85 & (in61 | in51 | in46));

	localparam realtime T_fall_y15 = tpd_elmore(L_y15, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y15    = tpd_z(, T_fall_y15);
	bufif1 (highz1, strong0) #(0, T_fall_y15, T_Z_y15)
		(y15, '0, (in85 & (in38 | in48)) | (in74 & in68));

	localparam realtime T_fall_y16 = tpd_elmore(L_y16, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y16    = tpd_z(, T_fall_y16);
	bufif1 (highz1, strong0) #(0, T_fall_y16, T_Z_y16)
		(y16, '0, in41 & in56 & (in7 | in40 | in49 | in38 | in39 | in48));

	localparam realtime T_fall_y17 = tpd_elmore(L_y17, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y17    = tpd_z(, T_fall_y17);
	bufif1 (highz1, strong0) #(0, T_fall_y17, T_Z_y17)
		(y17, '0, in85 & in77 & in80 & in8);

	localparam realtime T_fall_y18 = tpd_elmore(L_y18, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y18    = tpd_z(, T_fall_y18);
	bufif1 (highz1, strong0) #(0, T_fall_y18, T_Z_y18)
		(y18, '0, in85 & in75 & in52);

	localparam realtime T_fall_y19 = tpd_elmore(L_y19, R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y19    = tpd_z(, T_fall_y19);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y19, T_Z_y19)
		(y19, '0, (in85 | (in74 & in19 & in75 & in78 & in80 & in43)) & in75 & in78 & in79 & in19);

	localparam realtime T_fall_y20 = tpd_elmore(L_y20, R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y20    = tpd_z(, T_fall_y20);
	bufif1 (highz1, strong0) #(0, T_fall_y20, T_Z_y20)
		(y20, '0, (in74 & in19 & in75 & in78 & in80) | (in85 & in43));

	localparam realtime T_fall_y21 = tpd_elmore(L_y21, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y21    = tpd_z(, T_fall_y21);
	bufif1 (highz1, strong0) #(0, T_fall_y21, T_Z_y21)
		(y21, '0, in85 & (in44 | (in76 & in52)));

	localparam realtime T_fall_y22 = tpd_elmore(L_y22, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y22    = tpd_z(, T_fall_y22);
	bufif1 (highz1, strong0) #(0, T_fall_y22, T_Z_y22)
		(y22, '0, in85 & in75 & in77 & in45);

	localparam realtime T_fall_y23 = tpd_elmore(L_y23, R_nmos_ohm(12*L_unit) * 4 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y23    = tpd_z(, T_fall_y23);
	bufif1 (highz1, strong0) #(0, T_fall_y23, T_Z_y23)
		(y23, '0, in85 & in75 & in78 & in80 & in45);

	localparam realtime T_fall_y24 = tpd_elmore(L_y24, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y24    = tpd_z(, T_fall_y24);
	bufif1 (highz1, strong0) #(0, T_fall_y24, T_Z_y24)
		(y24, '0, in85 & in76 & in78 & in19);

	localparam realtime T_fall_y25 = tpd_elmore(L_y25, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y25    = tpd_z(, T_fall_y25);
	bufif1 (highz1, strong0) #(0, T_fall_y25, T_Z_y25)
		(y25, '0, in85 & in76 & in77 & in19);

	localparam realtime T_fall_y26 = tpd_elmore(L_y26, R_nmos_ohm(16*L_unit) + R_nmos_ohm(12*L_unit));
	localparam realtime T_Z_y26    = tpd_z(, T_fall_y26);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y26, T_Z_y26)
		(y26, '0, (in85 | in74) & (in14 | in13 | in12 | in47));

	localparam realtime T_fall_y27 = tpd_elmore(L_y27, R_nmos_ohm(12*L_unit) * 4 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y27    = tpd_z(, T_fall_y27);
	bufif1 (highz1, strong0) #(0, T_fall_y27, T_Z_y27)
		(y27, '0, in85 & in75 & in78 & in79 & in45);

	localparam realtime T_fall_y28 = tpd_elmore(L_y28, R_nmos_ohm(12*L_unit) * 4 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y28    = tpd_z(, T_fall_y28);
	bufif1 (highz1, strong0) #(0, T_fall_y28, T_Z_y28)
		(y28, '0, in85 & in75 & in77 & in79 & in19);

	localparam realtime T_fall_y29 = tpd_elmore(L_y29, R_nmos_ohm(12*L_unit) * 2 + R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y29    = tpd_z(, T_fall_y29);
	bufif1 (highz1, strong0) #(0, T_fall_y29, T_Z_y29)
		(y29, '0, in22 & in71 & (in2 | in19 | in52 | in45 | (in61 & in75 & in77)));

	localparam realtime T_fall_y30 = tpd_elmore(L_y30, R_nmos_ohm(12*L_unit) * 2 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y30    = tpd_z(, T_fall_y30);
	bufif1 (highz1, strong0) #(0, T_fall_y30, T_Z_y30)
		(y30, '0, in22 & in71 & (in68 | in15 | in47));

	localparam realtime T_fall_y31 = tpd_elmore(L_y31, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y31    = tpd_z(, T_fall_y31);
	bufif1 (highz1, strong0) #(0, T_fall_y31, T_Z_y31)
		(y31, '0, in85 & in78 & in6);

	localparam realtime T_fall_y32 = tpd_elmore(L_y32, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y32    = tpd_z(, T_fall_y32);
	bufif1 (highz1, strong0) #(0, T_fall_y32, T_Z_y32)
		(y32, '0, in85 & in78 & in32);

	localparam realtime T_fall_y33 = tpd_elmore(L_y33, R_nmos_ohm(12*L_unit) + R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y33    = tpd_z(, T_fall_y33);
	bufif1 (highz1, strong0) #(0, T_fall_y33, T_Z_y33)
		(y33, '0, in85 & in45 & (in76 | in78));

	localparam realtime T_fall_y34 = tpd_elmore(L_y34, R_nmos_ohm(12*L_unit) * 2 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y34    = tpd_z(, T_fall_y34);
	bufif1 (highz1, strong0) #(0, T_fall_y34, T_Z_y34)
		(y34, '0, in74 & in68 & in83);

	localparam realtime T_fall_y35 = tpd_elmore(L_y35, R_nmos_ohm(12*L_unit) + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y35    = tpd_z(, T_fall_y35);
	bufif1 (highz1, strong0) #(0, T_fall_y35, T_Z_y35)
		(y35, '0, in74 & (in19 | in48 | in53));

	localparam realtime T_fall_y36 = tpd_elmore(L_y36, R_nmos_ohm(12*L_unit) * 4 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y36    = tpd_z(, T_fall_y36);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y36, T_Z_y36)
		(y36, '0, (in74 & in18) | (((in74 & in49) | (in85 & in68 & in79)) & in75 & in77) |
		           (in85 & (in39 | in40 | (in81 & in82 & in83 & in20))));

	localparam realtime T_fall_y37 = tpd_elmore(L_y37, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y37    = tpd_z(, T_fall_y37);
	bufif1 (highz1, strong0) #(0, T_fall_y37, T_Z_y37)
		(y37, '0, in74 & (in55 | in43 | in52));

	localparam realtime T_fall_y38 = tpd_elmore(L_y38, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y38    = tpd_z(, T_fall_y38);
	// in57 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y38, T_Z_y38)
		(y38, '0, (in22 & in25) | (in57 & (in17 | in16 | (in56 & (in55 | in68 | in43 | in52)))));

	localparam realtime T_fall_y39 = tpd_elmore(L_y39, R_nmos_ohm(8*L_unit) * 7);
	localparam realtime T_Z_y39    = tpd_z(, T_fall_y39);
	// in58 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y39, T_Z_y39)
		(y39, '0, (in22 & in71 & (in18 | (in19 & (in76 | in78 | in80)))) |
		          (in58 & in60 & (in42 | in37 | ((in61 | (in5 & in79)) & in77 & in75) |
		                          (in81 & in82 & in83 & in21))));

	localparam realtime T_fall_y40 = tpd_elmore(L_y40, R_nmos_ohm(8*L_unit) * 7);
	localparam realtime T_Z_y40    = tpd_z(, T_fall_y40);
	// in58 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y40, T_Z_y40)
		(y40, '0, (in22 & in71 & in59 & in75) | (in58 & in60 & (in30 | in23 | ((in4 | (in5 & in80)) & in78 & in75) |
		                                                        (in81 & in89 & in84 & in21))));

	localparam realtime T_fall_y41 = tpd_elmore(L_y41, R_nmos_ohm(8*L_unit) * 7);
	localparam realtime T_Z_y41    = tpd_z(, T_fall_y41);
	// in58 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y41, T_Z_y41)
		(y41, '0, (in22 & in71 & in59 & in75) | (in58 & in60 & (in29 | in33 | ((in4 | (in5 & in79)) & in78 & in75) |
		                                                        (in81 & in89 & in83 & in21))));

	localparam realtime T_fall_y42 = tpd_elmore(L_y42, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y42    = tpd_z(, T_fall_y42);
	bufif1 (highz1, strong0) #(0, T_fall_y42, T_Z_y42)
		(y42, '0, in85 & in77 & in83 & in63);

	localparam realtime T_fall_y43 = tpd_elmore(L_y43, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y43    = tpd_z(, T_fall_y43);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y43, T_Z_y43)
		(y43, '0, (in74 & ((in59 & in75) | (in46 & in78 & in75))) | (in85 & in54));

	localparam realtime T_fall_y44 = tpd_elmore(L_y44, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y44    = tpd_z(, T_fall_y44);
	bufif1 (highz1, strong0) #(0, T_fall_y44, T_Z_y44)
		(y44, '0, in85 & ((in81 & in89 & in84 & in20) | (in75 & in78 & (in23 | in49 | (in68 & in80)))));

	localparam realtime T_fall_y45 = tpd_elmore(L_y45, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y45    = tpd_z(, T_fall_y45);
	bufif1 (highz1, strong0) #(0, T_fall_y45, T_Z_y45)
		(y45, '0, in85 & ((in81 & in89 & in83 & in20) | (in75 & in78 & (in29 | in7 | (in68 & in79)))));

	localparam realtime T_fall_y46 = tpd_elmore(L_y46, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y46    = tpd_z(, T_fall_y46);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y46, T_Z_y46)
		(y46, '0, ((in74 & in59) | (in85 & in46)) & in76 & in77);

	localparam realtime T_fall_y47 = tpd_elmore(L_y47, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y47    = tpd_z(, T_fall_y47);
	bufif1 (highz1, strong0) #(0, T_fall_y47, T_Z_y47)
		(y47, '0, in85 & ((in88 & in82 & in84 & in20) | (in76 & in77 & (in23 | in49 | (in68 & in80)))));

	localparam realtime T_fall_y48 = tpd_elmore(L_y48, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y48    = tpd_z(, T_fall_y48);
	bufif1 (highz1, strong0) #(0, T_fall_y48, T_Z_y48)
		(y48, '0, in85 & ((in88 & in82 & in83 & in20) | (in76 & in77 & (in29 | in7 | (in68 & in79)))));

	localparam realtime T_fall_y49 = tpd_elmore(L_y49, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y49    = tpd_z(, T_fall_y49);
	// in62 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y49, T_Z_y49)
		(y49, '0, (in62 & in60 & in88 & in82 & in84 & in21) |
		          (((in62 & in60 & in5 & in80) | (in22 & in71 & in4)) & in76 & in77));

	localparam realtime T_fall_y50 = tpd_elmore(L_y50, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y50    = tpd_z(, T_fall_y50);
	// in62 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y50, T_Z_y50)
		(y50, '0, (in62 & in60 & in88 & in89 & in84 & in21) |
		          (((in62 & in60 & in5 & in80) | (in22 & in71 & in4)) & in76 & in78));

	localparam realtime T_fall_y51 = tpd_elmore(L_y51, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y51    = tpd_z(, T_fall_y51);
	// in65 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y51, T_Z_y51)
		(y51, '0, (in65 & in60 & in88 & in82 & in83 & in21) |
		          (((in65 & in60 & in5 & in79) | (in22 & in71 & in4)) & in76 & in77));

	localparam realtime T_fall_y52 = tpd_elmore(L_y52, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y52    = tpd_z(, T_fall_y52);
	// in65 and in22 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y52, T_Z_y52)
		(y52, '0, (in65 & in60 & in88 & in89 & in83 & in21) |
		          (((in65 & in60 & in5 & in79) | (in22 & in71 & in4)) & in76 & in78));

	localparam realtime T_fall_y53 = tpd_elmore(L_y53, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y53    = tpd_z(, T_fall_y53);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y53, T_Z_y53)
		(y53, '0, (in74 & in31) | (((in74 & in59) | (in85 & in46)) & in78 & in76));

	localparam realtime T_fall_y54 = tpd_elmore(L_y54, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y54    = tpd_z(, T_fall_y54);
	bufif1 (highz1, strong0) #(0, T_fall_y54, T_Z_y54)
		(y54, '0, in85 & ((in88 & in89 & in84 & in20) | (in76 & in78 & (in23 | in49 | (in68 & in80)))));

	localparam realtime T_fall_y55 = tpd_elmore(L_y55, R_nmos_ohm(8*L_unit) * 3 + R_nmos_ohm(3*L_unit) * 2);
	localparam realtime T_Z_y55    = tpd_z(, T_fall_y55);
	bufif1 (highz1, strong0) #(0, T_fall_y55, T_Z_y55)
		(y55, '0, in85 & ((in88 & in89 & in83 & in20) | (in76 & in78 & (in29 | in7 | (in68 & in79)))));

	localparam realtime T_fall_y56 = tpd_elmore(L_y56, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y56    = tpd_z(, T_fall_y56);
	bufif1 (highz1, strong0) #(0, T_fall_y56, T_Z_y56)
		(y56, '0, in74 & (in59 | in46));

	localparam realtime T_fall_y57 = tpd_elmore(L_y57, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y57    = tpd_z(, T_fall_y57);
	bufif1 (highz1, strong0) #(0, T_fall_y57, T_Z_y57)
		(y57, '0, in22 & (in61 | in66));

	localparam realtime T_fall_y58 = tpd_elmore(L_y58, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y58    = tpd_z(, T_fall_y58);
	bufif1 (highz1, strong0) #(0, T_fall_y58, T_Z_y58)
		(y58, '0, in74 & (in19 | in18 | in55 | in43 | in5 | in23 | in29 | in37 | in42 | in33 | in30 | in52));

	localparam realtime T_fall_y59 = tpd_elmore(L_y59, R_nmos_ohm(11*L_unit) * 4 + R_nmos_ohm(8*L_unit));
	localparam realtime T_Z_y59    = tpd_z(, T_fall_y59);
	// in85 and in74 are connected outside of cell, so this could be simplified
	bufif1 (highz1, strong0) #(0, T_fall_y59, T_Z_y59)
		(y59, '0, (in85 & (in38 | in42 | in37 | in32 | (in81 & in82 & in84 & in20))) |
		          (in74 & (in25 | (in68 & in75 & in77 & in80))));

	localparam realtime T_fall_y60 = tpd_elmore(L_y60, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y60    = tpd_z(, T_fall_y60);
	bufif1 (highz1, strong0) #(0, T_fall_y60, T_Z_y60)
		(y60, '0, in74 & (in25 | in26 | in16 | (in50 & in72)));

	localparam realtime T_fall_y61 = tpd_elmore(L_y61, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y61    = tpd_z(, T_fall_y61);
	bufif1 (highz1, strong0) #(0, T_fall_y61, T_Z_y61)
		(y61, '0, in74 & (in25 | in24 | in26 | in17 | (in50 & in73)));

	localparam realtime T_fall_y62 = tpd_elmore(L_y62, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y62    = tpd_z(, T_fall_y62);
	bufif1 (highz1, strong0) #(0, T_fall_y62, T_Z_y62)
		(y62, '0, in74 & (in27 | in28));

	localparam realtime T_fall_y63 = tpd_elmore(L_y63, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y63    = tpd_z(, T_fall_y63);
	bufif1 (highz1, strong0) #(0, T_fall_y63, T_Z_y63)
		(y63, '0, in85 & (in67 | in69 | (in75 & in77 & in46)));

	localparam realtime T_fall_y64 = tpd_elmore(L_y64, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y64    = tpd_z(, T_fall_y64);
	bufif1 (highz1, strong0) #(0, T_fall_y64, T_Z_y64)
		(y64, '0, in85 & (in70 | (in75 & in77 & in66)));

	localparam realtime T_fall_y65 = tpd_elmore(L_y65, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y65    = tpd_z(, T_fall_y65);
	bufif1 (highz1, strong0) #(0, T_fall_y65, T_Z_y65)
		(y65, '0, in85 & in77 & in6);

	localparam realtime T_fall_y66 = tpd_elmore(L_y66, R_nmos_ohm(8*L_unit) * 4);
	localparam realtime T_Z_y66    = tpd_z(, T_fall_y66);
	bufif1 (highz1, strong0) #(0, T_fall_y66, T_Z_y66)
		(y66, '0, in85 & (in69 | (in75 & in77 & in46)));

	localparam realtime T_fall_y67 = tpd_elmore(L_y67, R_nmos_ohm(8*L_unit) * 3);
	localparam realtime T_Z_y67    = tpd_z(, T_fall_y67);
	bufif1 (highz1, strong0) #(0, T_fall_y67, T_Z_y67)
		(y67, '0, in85 & in77 & in32);

	localparam realtime T_fall_y68 = tpd_elmore(L_y68, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y68    = tpd_z(, T_fall_y68);
	bufif1 (highz1, strong0) #(0, T_fall_y68, T_Z_y68)
		(y68, '0, in74 & (in86 | in34 | in64));

	localparam realtime T_fall_y69 = tpd_elmore(L_y69, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_y69    = tpd_z(, T_fall_y69);
	bufif1 (highz1, strong0) #(0, T_fall_y69, T_Z_y69)
		(y69, '0, in74 & (in35 | in36 | in90 | in87));

endmodule

`default_nettype wire
