`default_nettype none

module sm83_decoder1 #(
		parameter real L_y1   = 0,
		parameter real L_y2   = 0,
		parameter real L_y3   = 0,
		parameter real L_y4   = 0,
		parameter real L_y5   = 0,
		parameter real L_y6   = 0,
		parameter real L_y7   = 0,
		parameter real L_y8   = 0,
		parameter real L_y9   = 0,
		parameter real L_y10  = 0,
		parameter real L_y11  = 0,
		parameter real L_y12  = 0,
		parameter real L_y13  = 0,
		parameter real L_y14  = 0,
		parameter real L_y15  = 0,
		parameter real L_y16  = 0,
		parameter real L_y17  = 0,
		parameter real L_y18  = 0,
		parameter real L_y19  = 0,
		parameter real L_y20  = 0,
		parameter real L_y21  = 0,
		parameter real L_y22  = 0,
		parameter real L_y23  = 0,
		parameter real L_y24  = 0,
		parameter real L_y25  = 0,
		parameter real L_y26  = 0,
		parameter real L_y27  = 0,
		parameter real L_y28  = 0,
		parameter real L_y29  = 0,
		parameter real L_y30  = 0,
		parameter real L_y31  = 0,
		parameter real L_y32  = 0,
		parameter real L_y33  = 0,
		parameter real L_y34  = 0,
		parameter real L_y35  = 0,
		parameter real L_y36  = 0,
		parameter real L_y37  = 0,
		parameter real L_y38  = 0,
		parameter real L_y39  = 0,
		parameter real L_y40  = 0,
		parameter real L_y41  = 0,
		parameter real L_y42  = 0,
		parameter real L_y43  = 0,
		parameter real L_y44  = 0,
		parameter real L_y45  = 0,
		parameter real L_y46  = 0,
		parameter real L_y47  = 0,
		parameter real L_y48  = 0,
		parameter real L_y49  = 0,
		parameter real L_y50  = 0,
		parameter real L_y51  = 0,
		parameter real L_y52  = 0,
		parameter real L_y53  = 0,
		parameter real L_y54  = 0,
		parameter real L_y55  = 0,
		parameter real L_y56  = 0,
		parameter real L_y57  = 0,
		parameter real L_y58  = 0,
		parameter real L_y59  = 0,
		parameter real L_y60  = 0,
		parameter real L_y61  = 0,
		parameter real L_y62  = 0,
		parameter real L_y63  = 0,
		parameter real L_y64  = 0,
		parameter real L_y65  = 0,
		parameter real L_y66  = 0,
		parameter real L_y67  = 0,
		parameter real L_y68  = 0,
		parameter real L_y69  = 0,
		parameter real L_y70  = 0,
		parameter real L_y71  = 0,
		parameter real L_y72  = 0,
		parameter real L_y73  = 0,
		parameter real L_y74  = 0,
		parameter real L_y75  = 0,
		parameter real L_y76  = 0,
		parameter real L_y77  = 0,
		parameter real L_y78  = 0,
		parameter real L_y79  = 0,
		parameter real L_y80  = 0,
		parameter real L_y81  = 0,
		parameter real L_y82  = 0,
		parameter real L_y83  = 0,
		parameter real L_y84  = 0,
		parameter real L_y85  = 0,
		parameter real L_y86  = 0,
		parameter real L_y87  = 0,
		parameter real L_y88  = 0,
		parameter real L_y89  = 0,
		parameter real L_y90  = 0,
		parameter real L_y91  = 0,
		parameter real L_y92  = 0,
		parameter real L_y93  = 0,
		parameter real L_y94  = 0,
		parameter real L_y95  = 0,
		parameter real L_y96  = 0,
		parameter real L_y97  = 0,
		parameter real L_y98  = 0,
		parameter real L_y99  = 0,
		parameter real L_y100 = 0,
		parameter real L_y101 = 0,
		parameter real L_y102 = 0,
		parameter real L_y103 = 0,
		parameter real L_y104 = 0,
		parameter real L_y105 = 0,
		parameter real L_y106 = 0,
		parameter real L_y107 = 0
	) (
		input      logic in1, in2, in3, in4, in5, in6, in7, in8, in9, in10,
		input      logic in11, in12, in13, in14, in15, in16, in17, in18, in19, in20,
		input      logic in21, in22, in23, in24, in25, in26, in27,
		output tri logic y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
		output tri logic y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30,
		output tri logic y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y44, y45,
		output tri logic y46, y47, y48, y49, y50, y51, y52, y53, y54, y55, y56, y57, y58, y59, y60,
		output tri logic y61, y62, y63, y64, y65, y66, y67, y68, y69, y70, y71, y72, y73, y74, y75,
		output tri logic y76, y77, y78, y79, y80, y81, y82, y83, y84, y85, y86, y87, y88, y89, y90,
		output tri logic y91, y92, y93, y94, y95, y96, y97, y98, y99, y100, y101, y102, y103, y104,
		output tri logic y105, y106, y107
	);

	import sm83_timing::*;

	localparam realtime T_fall_y1 = tpd_elmore(L_y1, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y1    = tpd_z(, T_fall_y1);
	bufif1 (highz1, strong0) #(0, T_fall_y1, T_Z_y1)
		(y1, '0, in2 & in3 & in6 & in8 & in9 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	bufif1 (highz1, strong0) #(0, T_fall_y2, T_Z_y2)
		(y2, '0, in2 & in3 & in6 & in8 & in9 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	bufif1 (highz1, strong0) #(0, T_fall_y3, T_Z_y3)
		(y3, '0, in1 & in3 & in6 & in8 & in9 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y4 = tpd_elmore(L_y4, R_nmos_ohm(8*L_unit) * 8);
	localparam realtime T_Z_y4    = tpd_z(, T_fall_y4);
	bufif1 (highz1, strong0) #(0, T_fall_y4, T_Z_y4)
		(y4, '0, in21 & in24 & in26 & in27 & (in20 | (in8 & in9 & in11 & in19)));

	localparam realtime T_fall_y5 = tpd_elmore(L_y5, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y5    = tpd_z(, T_fall_y5);
	bufif1 (highz1, strong0) #(0, T_fall_y5, T_Z_y5)
		(y5, '0, in1 & in4 & in8 & in9 & in12 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y6 = tpd_elmore(L_y6, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y6    = tpd_z(, T_fall_y6);
	bufif1 (highz1, strong0) #(0, T_fall_y6, T_Z_y6)
		(y6, '0, in1 & in4 & in8 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y7 = tpd_elmore(L_y7, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y7    = tpd_z(, T_fall_y7);
	bufif1 (highz1, strong0) #(0, T_fall_y7, T_Z_y7)
		(y7, '0, in2 & in4 & in8 & in10 & in12 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y8 = tpd_elmore(L_y8, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y8    = tpd_z(, T_fall_y8);
	bufif1 (highz1, strong0) #(0, T_fall_y8, T_Z_y8)
		(y8, '0, in2 & in4 & in8 & in10 & in12 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y9 = tpd_elmore(L_y9, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y9    = tpd_z(, T_fall_y9);
	bufif1 (highz1, strong0) #(0, T_fall_y9, T_Z_y9)
		(y9, '0, in8 & in12 & in14 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y10 = tpd_elmore(L_y10, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y10    = tpd_z(, T_fall_y10);
	bufif1 (highz1, strong0) #(0, T_fall_y10, T_Z_y10)
		(y10, '0, in2 & in4 & in6 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in13 & in16)));

	localparam realtime T_fall_y11 = tpd_elmore(L_y11, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y11    = tpd_z(, T_fall_y11);
	bufif1 (highz1, strong0) #(0, T_fall_y11, T_Z_y11)
		(y11, '0, in1 & in4 & in6 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in13 & in16)));

	localparam realtime T_fall_y12 = tpd_elmore(L_y12, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y12    = tpd_z(, T_fall_y12);
	bufif1 (highz1, strong0) #(0, T_fall_y12, T_Z_y12)
		(y12, '0, in2 & in3 & in6 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in13 & in16)));

	localparam realtime T_fall_y13 = tpd_elmore(L_y13, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y13    = tpd_z(, T_fall_y13);
	bufif1 (highz1, strong0) #(0, T_fall_y13, T_Z_y13)
		(y13, '0, in1 & in3 & in6 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in13 & in16)));

	localparam realtime T_fall_y14 = tpd_elmore(L_y14, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y14    = tpd_z(, T_fall_y14);
	bufif1 (highz1, strong0) #(0, T_fall_y14, T_Z_y14)
		(y14, '0, in2 & in4 & in5 & in10 & in11 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in13 & in16)));

	localparam realtime T_fall_y15 = tpd_elmore(L_y15, R_nmos_ohm(8*L_unit) * 8);
	localparam realtime T_Z_y15    = tpd_z(, T_fall_y15);
	bufif1 (highz1, strong0) #(0, T_fall_y15, T_Z_y15)
		(y15, '0, in8 & in9 & in11 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y16 = tpd_elmore(L_y16, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y16    = tpd_z(, T_fall_y16);
	bufif1 (highz1, strong0) #(0, T_fall_y16, T_Z_y16)
		(y16, '0, in2 & in4 & in8 & in9 & in11 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y17 = tpd_elmore(L_y17, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit));
	localparam realtime T_Z_y17    = tpd_z(, T_fall_y17);
	bufif1 (highz1, strong0) #(0, T_fall_y17, T_Z_y17)
		(y17, '0, in1 & in4 & in8 & in9 & in11 & in20 & in22 & in24 & in26 & in27 & (in13 | in16 | in18));

	localparam realtime T_fall_y18 = tpd_elmore(L_y18, R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_y18    = tpd_z(, T_fall_y18);
	bufif1 (highz1, strong0) #(0, T_fall_y18, T_Z_y18)
		(y18, '0, in2 & in3 & in5 & in24 & in26 & in27);

	localparam realtime T_fall_y19 = tpd_elmore(L_y19, R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y19    = tpd_z(, T_fall_y19);
	bufif1 (highz1, strong0) #(0, T_fall_y19, T_Z_y19)
		(y19, '0, in1 & in3 & in5 & in24 & in27);

	localparam realtime T_fall_y20 = tpd_elmore(L_y20, R_nmos_ohm(8*L_unit) * 7 + R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_y20    = tpd_z(, T_fall_y20);
	bufif1 (highz1, strong0) #(0, T_fall_y20, T_Z_y20)
		(y20, '0, in1 & in4 & in8 & in10 & in12 & in20 & in22 & in24 & in26 & in27 & (in17 | (in13 & in15 & in18)));

	localparam realtime T_fall_y21 = tpd_elmore(L_y21, R_nmos_ohm(8*L_unit) * 5 + R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y21    = tpd_z(, T_fall_y21);
	bufif1 (highz1, strong0) #(0, T_fall_y21, T_Z_y21)
		(y21, '0, in2 & in4 & in8 & in10 & in12 & in20 & in22 & in24 & in26 & in27 & (in17 | (in13 & in15 & in18)));

	localparam realtime T_fall_y22 = tpd_elmore(L_y22, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y22    = tpd_z(, T_fall_y22);
	bufif1 (highz1, strong0) #(0, T_fall_y22, T_Z_y22)
		(y22, '0, in2 & in3 & in6 & in8 & in10 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y23 = tpd_elmore(L_y23, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 4);
	localparam realtime T_Z_y23    = tpd_z(, T_fall_y23);
	bufif1 (highz1, strong0) #(0, T_fall_y23, T_Z_y23)
		(y23, '0, in2 & in3 & in8 & in10 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y24 = tpd_elmore(L_y24, R_nmos_ohm(8*L_unit) * 8);
	localparam realtime T_Z_y24    = tpd_z(, T_fall_y24);
	bufif1 (highz1, strong0) #(0, T_fall_y24, T_Z_y24)
		(y24, '0, in2 & in4 & in20 & in21 & in23 & in26 & in27 & (in7 | in10 | in12));

	localparam realtime T_fall_y25 = tpd_elmore(L_y25, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y25    = tpd_z(, T_fall_y25);
	bufif1 (highz1, strong0) #(0, T_fall_y25, T_Z_y25)
		(y25, '0, in1 & in4 & in8 & in9 & in11 & in20 & in21 & in23 & in26 & in27);

	localparam realtime T_fall_y26 = tpd_elmore(L_y26, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y26    = tpd_z(, T_fall_y26);
	bufif1 (highz1, strong0) #(0, T_fall_y26, T_Z_y26)
		(y26, '0, in7 & in9 & in11 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y27 = tpd_elmore(L_y27, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y27    = tpd_z(, T_fall_y27);
	bufif1 (highz1, strong0) #(0, T_fall_y27, T_Z_y27)
		(y27, '0, in1 & in4 & in8 & in9 & in12 & in13 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y28 = tpd_elmore(L_y28, R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y28    = tpd_z(, T_fall_y28);
	bufif1 (highz1, strong0) #(0, T_fall_y28, T_Z_y28)
		(y28, '0, in19 & in22 & in23 & in26 & in27);

	localparam realtime T_fall_y29 = tpd_elmore(L_y29, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y29    = tpd_z(, T_fall_y29);
	bufif1 (highz1, strong0) #(0, T_fall_y29, T_Z_y29)
		(y29, '0, in2 & in4 & in8 & in9 & in12 & in14 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y30 = tpd_elmore(L_y30, R_nmos_ohm(8*L_unit) * 5 + R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_y30    = tpd_z(, T_fall_y30);
	bufif1 (highz1, strong0) #(0, T_fall_y30, T_Z_y30)
		(y30, '0, in2 & in4 & in8 & in9 & in12 & in13 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y31 = tpd_elmore(L_y31, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 4);
	localparam realtime T_Z_y31    = tpd_z(, T_fall_y31);
	bufif1 (highz1, strong0) #(0, T_fall_y31, T_Z_y31)
		(y31, '0, in2 & in4 & in8 & in9 & in12 & in14 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y32 = tpd_elmore(L_y32, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 4);
	localparam realtime T_Z_y32    = tpd_z(, T_fall_y32);
	bufif1 (highz1, strong0) #(0, T_fall_y32, T_Z_y32)
		(y32, '0, in2 & in4 & in8 & in10 & in12 & in14 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y33 = tpd_elmore(L_y33, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 4);
	localparam realtime T_Z_y33    = tpd_z(, T_fall_y33);
	bufif1 (highz1, strong0) #(0, T_fall_y33, T_Z_y33)
		(y33, '0, in1 & in4 & in8 & in10 & in12 & in14 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y34 = tpd_elmore(L_y34, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y34    = tpd_z(, T_fall_y34);
	bufif1 (highz1, strong0) #(0, T_fall_y34, T_Z_y34)
		(y34, '0, in2 & in4 & in8 & in9 & in11 & in19 & in22 & in24 & in26 & in27 & (in13 | in16 | in18));

	localparam realtime T_fall_y35 = tpd_elmore(L_y35, R_nmos_ohm(8*L_unit) * 9);
	localparam realtime T_Z_y35    = tpd_z(, T_fall_y35);
	bufif1 (highz1, strong0) #(0, T_fall_y35, T_Z_y35)
		(y35, '0, in6 & in7 & in9 & in11 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y36 = tpd_elmore(L_y36, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y36    = tpd_z(, T_fall_y36);
	bufif1 (highz1, strong0) #(0, T_fall_y36, T_Z_y36)
		(y36, '0, in2 & in7 & in10 & in12 & in13 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y37 = tpd_elmore(L_y37, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y37    = tpd_z(, T_fall_y37);
	bufif1 (highz1, strong0) #(0, T_fall_y37, T_Z_y37)
		(y37, '0, in2 & in4 & in7 & in9 & in12 & in13 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y38 = tpd_elmore(L_y38, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y38    = tpd_z(, T_fall_y38);
	bufif1 (highz1, strong0) #(0, T_fall_y38, T_Z_y38)
		(y38, '0, in2 & in4 & in7 & in9 & in12 & in14 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y39 = tpd_elmore(L_y39, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y39    = tpd_z(, T_fall_y39);
	bufif1 (highz1, strong0) #(0, T_fall_y39, T_Z_y39)
		(y39, '0, in1 & in4 & in7 & in10 & in11 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y40 = tpd_elmore(L_y40, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y40    = tpd_z(, T_fall_y40);
	bufif1 (highz1, strong0) #(0, T_fall_y40, T_Z_y40)
		(y40, '0, in2 & in4 & in7 & in10 & in11 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y41 = tpd_elmore(L_y41, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y41    = tpd_z(, T_fall_y41);
	bufif1 (highz1, strong0) #(0, T_fall_y41, T_Z_y41)
		(y41, '0, in6 & in19 & in22 & in24 & in26 & in27 & (in7 | in10 | in12) & (in13 | in16 | in18));

	localparam realtime T_fall_y42 = tpd_elmore(L_y42, R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y42    = tpd_z(, T_fall_y42);
	bufif1 (highz1, strong0) #(0, T_fall_y42, T_Z_y42)
		(y42, '0, in19 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y43 = tpd_elmore(L_y43, R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y43    = tpd_z(, T_fall_y43);
	bufif1 (highz1, strong0) #(0, T_fall_y43, T_Z_y43)
		(y43, '0, in20 & in22 & in23 & in26 & in27);

	localparam realtime T_fall_y44 = tpd_elmore(L_y44, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y44    = tpd_z(, T_fall_y44);
	bufif1 (highz1, strong0) #(0, T_fall_y44, T_Z_y44)
		(y44, '0, in2 & in4 & in9 & in12 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in14 & in16)));

	localparam realtime T_fall_y45 = tpd_elmore(L_y45, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y45    = tpd_z(, T_fall_y45);
	bufif1 (highz1, strong0) #(0, T_fall_y45, T_Z_y45)
		(y45, '0, in1 & in4 & in9 & in12 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in14 & in16)));

	localparam realtime T_fall_y46 = tpd_elmore(L_y46, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y46    = tpd_z(, T_fall_y46);
	bufif1 (highz1, strong0) #(0, T_fall_y46, T_Z_y46)
		(y46, '0, in2 & in3 & in9 & in12 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | (in14 & in16)));

	localparam realtime T_fall_y47 = tpd_elmore(L_y47, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y47    = tpd_z(, T_fall_y47);
	bufif1 (highz1, strong0) #(0, T_fall_y47, T_Z_y47)
		(y47, '0, in1 & in4 & in7 & in10 & in12 & in13 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y48 = tpd_elmore(L_y48, R_nmos_ohm(8*L_unit) * 5 + R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y48    = tpd_z(, T_fall_y48);
	bufif1 (highz1, strong0) #(0, T_fall_y48, T_Z_y48)
		(y48, '0, in1 & in4 & in8 & in9 & in11 & in14 & in15 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y49 = tpd_elmore(L_y49, R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y49    = tpd_z(, T_fall_y49);
	bufif1 (highz1, strong0) #(0, T_fall_y49, T_Z_y49)
		(y49, '0, in1 & in2 & in27);

	localparam realtime T_fall_y50 = tpd_elmore(L_y50, R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y50    = tpd_z(, T_fall_y50);
	bufif1 (highz1, strong0) #(0, T_fall_y50, T_Z_y50)
		(y50, '0, in1 & in2 & in27);

	localparam realtime T_fall_y51 = tpd_elmore(L_y51, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y51    = tpd_z(, T_fall_y51);
	bufif1 (highz1, strong0) #(0, T_fall_y51, T_Z_y51)
		(y51, '0, in2 & in3 & in7 & in10 & in11 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y52 = tpd_elmore(L_y52, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y52    = tpd_z(, T_fall_y52);
	bufif1 (highz1, strong0) #(0, T_fall_y52, T_Z_y52)
		(y52, '0, in2 & in4 & in7 & in10 & in12 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y53 = tpd_elmore(L_y53, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y53    = tpd_z(, T_fall_y53);
	bufif1 (highz1, strong0) #(0, T_fall_y53, T_Z_y53)
		(y53, '0, in1 & in4 & in7 & in10 & in12 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y54 = tpd_elmore(L_y54, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y54    = tpd_z(, T_fall_y54);
	bufif1 (highz1, strong0) #(0, T_fall_y54, T_Z_y54)
		(y54, '0, in1 & in4 & in6 & in8 & in10 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y55 = tpd_elmore(L_y55, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y55    = tpd_z(, T_fall_y55);
	bufif1 (highz1, strong0) #(0, T_fall_y55, T_Z_y55)
		(y55, '0, in1 & in4 & in8 & in10 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y56 = tpd_elmore(L_y56, R_nmos_ohm(14*L_unit) * 5 +
	                                                   R_nmos_ohm( 8*L_unit) * 2 +
	                                                   R_nmos_ohm( 6*L_unit));
	localparam realtime T_Z_y56    = tpd_z(, T_fall_y56);
	bufif1 (highz1, strong0) #(0, T_fall_y56, T_Z_y56)
		(y56, '0, in2 & in4 & in19 & in21 & in23 & in26 & in27 & (in7 | in10 | in12));

	localparam realtime T_fall_y57 = tpd_elmore(L_y57, R_nmos_ohm(14*L_unit) * 5 + R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y57    = tpd_z(, T_fall_y57);
	bufif1 (highz1, strong0) #(0, T_fall_y57, T_Z_y57)
		(y57, '0, in1 & in4 & in8 & in9 & in11 & in19 & in21 & in23 & in26 & in27);

	localparam realtime T_fall_y58 = tpd_elmore(L_y58, R_nmos_ohm(14*L_unit) * 4 + R_nmos_ohm(8*L_unit) * 5);
	localparam realtime T_Z_y58    = tpd_z(, T_fall_y58);
	bufif1 (highz1, strong0) #(0, T_fall_y58, T_Z_y58)
		(y58, '0, in2 & in4 & in8 & in9 & in11 & in21 & in23 & in26 & in27);

	localparam realtime T_fall_y59 = tpd_elmore(L_y59, R_nmos_ohm(8*L_unit) * 11);
	localparam realtime T_Z_y59    = tpd_z(, T_fall_y59);
	bufif1 (highz1, strong0) #(0, T_fall_y59, T_Z_y59)
		(y59, '0, in2 & in3 & in7 & in10 & in12 & in14 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y60 = tpd_elmore(L_y60, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y60    = tpd_z(, T_fall_y60);
	bufif1 (highz1, strong0) #(0, T_fall_y60, T_Z_y60)
		(y60, '0, in1 & in4 & in8 & in10 & in12 & in14 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y61 = tpd_elmore(L_y61, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y61    = tpd_z(, T_fall_y61);
	bufif1 (highz1, strong0) #(0, T_fall_y61, T_Z_y61)
		(y61, '0, in2 & in3 & in6 & in8 & in10 & in12 & in13 & in16 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y62 = tpd_elmore(L_y62, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y62    = tpd_z(, T_fall_y62);
	bufif1 (highz1, strong0) #(0, T_fall_y62, T_Z_y62)
		(y62, '0, in2 & in4 & in6 & in8 & in10 & in12 & in13 & in16 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y63 = tpd_elmore(L_y63, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y63    = tpd_z(, T_fall_y63);
	bufif1 (highz1, strong0) #(0, T_fall_y63, T_Z_y63)
		(y63, '0, in2 & in4 & in7 & in10 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y64 = tpd_elmore(L_y64, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y64    = tpd_z(, T_fall_y64);
	bufif1 (highz1, strong0) #(0, T_fall_y64, T_Z_y64)
		(y64, '0, in2 & in4 & in6 & in8 & in10 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y65 = tpd_elmore(L_y65, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y65    = tpd_z(, T_fall_y65);
	bufif1 (highz1, strong0) #(0, T_fall_y65, T_Z_y65)
		(y65, '0, in1 & in3 & in6 & in8 & in10 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y66 = tpd_elmore(L_y66, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y66    = tpd_z(, T_fall_y66);
	bufif1 (highz1, strong0) #(0, T_fall_y66, T_Z_y66)
		(y66, '0, in2 & in4 & in8 & in10 & in12 & in13 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y67 = tpd_elmore(L_y67, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y67    = tpd_z(, T_fall_y67);
	bufif1 (highz1, strong0) #(0, T_fall_y67, T_Z_y67)
		(y67, '0, in1 & in3 & in6 & in8 & in10 & in12 & in13 & in16 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y68 = tpd_elmore(L_y68, R_nmos_ohm(8*L_unit) * 14);
	localparam realtime T_Z_y68    = tpd_z(, T_fall_y68);
	bufif1 (highz1, strong0) #(0, T_fall_y68, T_Z_y68)
		(y68, '0, in1 & in4 & in6 & in8 & in10 & in12 & in13 & in16 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y69 = tpd_elmore(L_y69, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit));
	localparam realtime T_Z_y69    = tpd_z(, T_fall_y69);
	bufif1 (highz1, strong0) #(0, T_fall_y69, T_Z_y69)
		(y69, '0, in2 & in4 & in14 & in15 & in17 & in19 & in22 & in24 & in26 & in27 & (in7 | in10 | in12));

	localparam realtime T_fall_y70 = tpd_elmore(L_y70, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y70    = tpd_z(, T_fall_y70);
	bufif1 (highz1, strong0) #(0, T_fall_y70, T_Z_y70)
		(y70, '0, in2 & in4 & in10 & in11 & in14 & in15 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y71 = tpd_elmore(L_y71, R_nmos_ohm(8*L_unit) * 10 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y71    = tpd_z(, T_fall_y71);
	bufif1 (highz1, strong0) #(0, T_fall_y71, T_Z_y71)
		(y71, '0, in1 & in4 & in10 & in11 & in14 & in15 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y72 = tpd_elmore(L_y72, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y72    = tpd_z(, T_fall_y72);
	bufif1 (highz1, strong0) #(0, T_fall_y72, T_Z_y72)
		(y72, '0, in2 & in4 & in8 & in9 & in12 & in14 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y73 = tpd_elmore(L_y73, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y73    = tpd_z(, T_fall_y73);
	bufif1 (highz1, strong0) #(0, T_fall_y73, T_Z_y73)
		(y73, '0, in2 & in4 & in8 & in10 & in12 & in14 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y74 = tpd_elmore(L_y74, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y74    = tpd_z(, T_fall_y74);
	bufif1 (highz1, strong0) #(0, T_fall_y74, T_Z_y74)
		(y74, '0, in1 & in4 & in7 & in9 & in11 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y75 = tpd_elmore(L_y75, R_nmos_ohm(8*L_unit) * 10);
	localparam realtime T_Z_y75    = tpd_z(, T_fall_y75);
	bufif1 (highz1, strong0) #(0, T_fall_y75, T_Z_y75)
		(y75, '0, in2 & in4 & in7 & in9 & in11 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y76 = tpd_elmore(L_y76, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y76    = tpd_z(, T_fall_y76);
	bufif1 (highz1, strong0) #(0, T_fall_y76, T_Z_y76)
		(y76, '0, in1 & in4 & in5 & in24 & in25 & in27);

	localparam realtime T_fall_y77 = tpd_elmore(L_y77, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y77    = tpd_z(, T_fall_y77);
	bufif1 (highz1, strong0) #(0, T_fall_y77, T_Z_y77)
		(y77, '0, in2 & in4 & in5 & in24 & in25 & in27);

	localparam realtime T_fall_y78 = tpd_elmore(L_y78, R_nmos_ohm(8*L_unit) * 6);
	localparam realtime T_Z_y78    = tpd_z(, T_fall_y78);
	bufif1 (highz1, strong0) #(0, T_fall_y78, T_Z_y78)
		(y78, '0, in2 & in4 & in6 & in24 & in25 & in27);

	localparam realtime T_fall_y79 = tpd_elmore(L_y79, R_nmos_ohm(8*L_unit) * 7);
	localparam realtime T_Z_y79    = tpd_z(, T_fall_y79);
	bufif1 (highz1, strong0) #(0, T_fall_y79, T_Z_y79)
		(y79, '0, in6 & in20 & in21 & in24 & in26 & in27 & (in7 | in10 | in12));

	localparam realtime T_fall_y80 = tpd_elmore(L_y80, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_y80    = tpd_z(, T_fall_y80);
	bufif1 (highz1, strong0) #(0, T_fall_y80, T_Z_y80)
		(y80, '0, in2 & in4 & in7 & in10 & in12 & in13 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y81 = tpd_elmore(L_y81, R_nmos_ohm(8*L_unit) * 6 + R_nmos_ohm(6*L_unit) * 5);
	localparam realtime T_Z_y81    = tpd_z(, T_fall_y81);
	bufif1 (highz1, strong0) #(0, T_fall_y81, T_Z_y81)
		(y81, '0, in1 & in4 & in8 & in10 & in12 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y82 = tpd_elmore(L_y82, R_nmos_ohm(8*L_unit) * 12);
	localparam realtime T_Z_y82    = tpd_z(, T_fall_y82);
	bufif1 (highz1, strong0) #(0, T_fall_y82, T_Z_y82)
		(y82, '0, in6 & in7 & in10 & in12 & in13 & in16 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y83 = tpd_elmore(L_y83, R_nmos_ohm(8*L_unit) * 12);
	localparam realtime T_Z_y83    = tpd_z(, T_fall_y83);
	bufif1 (highz1, strong0) #(0, T_fall_y83, T_Z_y83)
		(y83, '0, in2 & in3 & in6 & in10 & in12 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | in13));

	localparam realtime T_fall_y84 = tpd_elmore(L_y84, R_nmos_ohm(8*L_unit) * 12);
	localparam realtime T_Z_y84    = tpd_z(, T_fall_y84);
	bufif1 (highz1, strong0) #(0, T_fall_y84, T_Z_y84)
		(y84, '0, in1 & in3 & in6 & in10 & in12 & in18 & in19 & in21 & in24 & in26 & in27 & (in8 | in13));

	localparam realtime T_fall_y85 = tpd_elmore(L_y85, R_nmos_ohm(8*L_unit) * 12);
	localparam realtime T_Z_y85    = tpd_z(, T_fall_y85);
	bufif1 (highz1, strong0) #(0, T_fall_y85, T_Z_y85)
		(y85, '0, in2 & in4 & in8 & in9 & in12 & in16 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y86 = tpd_elmore(L_y86, R_nmos_ohm(8*L_unit) * 12);
	localparam realtime T_Z_y86    = tpd_z(, T_fall_y86);
	bufif1 (highz1, strong0) #(0, T_fall_y86, T_Z_y86)
		(y86, '0, in2 & in4 & in8 & in9 & in12 & in15 & in17 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y87 = tpd_elmore(L_y87, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y87    = tpd_z(, T_fall_y87);
	bufif1 (highz1, strong0) #(0, T_fall_y87, T_Z_y87)
		(y87, '0, in2 & in4 & in7 & in10 & in12 & in14 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y88 = tpd_elmore(L_y88, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y88    = tpd_z(, T_fall_y88);
	bufif1 (highz1, strong0) #(0, T_fall_y88, T_Z_y88)
		(y88, '0, in1 & in4 & in7 & in10 & in12 & in14 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y89 = tpd_elmore(L_y89, R_nmos_ohm(8*L_unit) * 9 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y89    = tpd_z(, T_fall_y89);
	bufif1 (highz1, strong0) #(0, T_fall_y89, T_Z_y89)
		(y89, '0, in2 & in3 & in7 & in10 & in12 & in14 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y90 = tpd_elmore(L_y90, R_nmos_ohm(8*L_unit) * 9);
	localparam realtime T_Z_y90    = tpd_z(, T_fall_y90);
	bufif1 (highz1, strong0) #(0, T_fall_y90, T_Z_y90)
		(y90, '0, in6 & in10 & in11 & in20 & in22 & in24 & in26 & in27 & (in13 | in16 | in18));

	localparam realtime T_fall_y91 = tpd_elmore(L_y91, R_nmos_ohm(6*L_unit) * 10);
	localparam realtime T_Z_y91    = tpd_z(, T_fall_y91);
	bufif1 (highz1, strong0) #(0, T_fall_y91, T_Z_y91)
		(y91, '0, in2 & in4 & in8 & in9 & in11 & in20 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y92 = tpd_elmore(L_y92, R_nmos_ohm(6*L_unit) * 10);
	localparam realtime T_Z_y92    = tpd_z(, T_fall_y92);
	bufif1 (highz1, strong0) #(0, T_fall_y92, T_Z_y92)
		(y92, '0, in2 & in4 & in8 & in9 & in11 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y93 = tpd_elmore(L_y93, R_nmos_ohm(6*L_unit) * 10);
	localparam realtime T_Z_y93    = tpd_z(, T_fall_y93);
	bufif1 (highz1, strong0) #(0, T_fall_y93, T_Z_y93)
		(y93, '0, in2 & in3 & in7 & in9 & in11 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y94 = tpd_elmore(L_y94, R_nmos_ohm(6*L_unit) * 6);
	localparam realtime T_Z_y94    = tpd_z(, T_fall_y94);
	bufif1 (highz1, strong0) #(0, T_fall_y94, T_Z_y94)
		(y94, '0, in2 & in3 & in5 & in24 & in25 & in27);

	localparam realtime T_fall_y95 = tpd_elmore(L_y95, R_nmos_ohm(8*L_unit) * 4 + R_nmos_ohm(6*L_unit));
	localparam realtime T_Z_y95    = tpd_z(, T_fall_y95);
	bufif1 (highz1, strong0) #(0, T_fall_y95, T_Z_y95)
		(y95, '0, in6 & in23 & in26 & in27 & (in7 | in10 | in12));

	localparam realtime T_fall_y96 = tpd_elmore(L_y96, R_nmos_ohm(6*L_unit) * 8);
	localparam realtime T_Z_y96    = tpd_z(, T_fall_y96);
	bufif1 (highz1, strong0) #(0, T_fall_y96, T_Z_y96)
		(y96, '0, in2 & in4 & in8 & in9 & in11 & in23 & in26 & in27);

	localparam realtime T_fall_y97 = tpd_elmore(L_y97, R_nmos_ohm(6*L_unit) * 10);
	localparam realtime T_Z_y97    = tpd_z(, T_fall_y97);
	bufif1 (highz1, strong0) #(0, T_fall_y97, T_Z_y97)
		(y97, '0, in1 & in4 & in8 & in9 & in11 & in19 & in22 & in23 & in26 & in27);

	localparam realtime T_fall_y98 = tpd_elmore(L_y98, R_nmos_ohm(6*L_unit) * 9);
	localparam realtime T_Z_y98    = tpd_z(, T_fall_y98);
	bufif1 (highz1, strong0) #(0, T_fall_y98, T_Z_y98)
		(y98, '0, in1 & in4 & in8 & in9 & in11 & in20 & in23 & in26 & in27);

	localparam realtime T_fall_y99 = tpd_elmore(L_y99, R_nmos_ohm(8*L_unit) * 7);
	localparam realtime T_Z_y99    = tpd_z(, T_fall_y99);
	bufif1 (highz1, strong0) #(0, T_fall_y99, T_Z_y99)
		(y99, '0, in10 & in11 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y100 = tpd_elmore(L_y100, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y100    = tpd_z(, T_fall_y100);
	bufif1 (highz1, strong0) #(0, T_fall_y100, T_Z_y100)
		(y100, '0, in6 & in7 & in9 & in12 & in15 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y101 = tpd_elmore(L_y101, R_nmos_ohm(6*L_unit) * 12);
	localparam realtime T_Z_y101    = tpd_z(, T_fall_y101);
	bufif1 (highz1, strong0) #(0, T_fall_y101, T_Z_y101)
		(y101, '0, in6 & in8 & in9 & in11 & in14 & in15 & in17 & in19 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y102 = tpd_elmore(L_y102, R_nmos_ohm(6*L_unit) * 11);
	localparam realtime T_Z_y102    = tpd_z(, T_fall_y102);
	bufif1 (highz1, strong0) #(0, T_fall_y102, T_Z_y102)
		(y102, '0, in6 & in8 & in10 & in12 & in14 & in18 & in20 & in22 & in24 & in26 & in27);

	localparam realtime T_fall_y103 = tpd_elmore(L_y103, R_nmos_ohm(6*L_unit) * 12);
	localparam realtime T_Z_y103    = tpd_z(, T_fall_y103);
	bufif1 (highz1, strong0) #(0, T_fall_y103, T_Z_y103)
		(y103, '0, in6 & in7 & in9 & in12 & in13 & in16 & in18 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y104 = tpd_elmore(L_y104, R_nmos_ohm(8*L_unit) * 13);
	localparam realtime T_Z_y104    = tpd_z(, T_fall_y104);
	bufif1 (highz1, strong0) #(0, T_fall_y104, T_Z_y104)
		(y104, '0, in2 & in3 & in8 & in10 & in12 & in20 & in22 & in24 & in26 & in27 & (in17 | (in13 & in15 & in18)));

	localparam realtime T_fall_y105 = tpd_elmore(L_y105, R_nmos_ohm(8*L_unit) * 11 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y105    = tpd_z(, T_fall_y105);
	bufif1 (highz1, strong0) #(0, T_fall_y105, T_Z_y105)
		(y105, '0, in2 & in4 & in6 & in8 & in9 & in12 & in13 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y106 = tpd_elmore(L_y106, R_nmos_ohm(8*L_unit) * 11 + R_nmos_ohm(6*L_unit) * 2);
	localparam realtime T_Z_y106    = tpd_z(, T_fall_y106);
	bufif1 (highz1, strong0) #(0, T_fall_y106, T_Z_y106)
		(y106, '0, in1 & in4 & in6 & in8 & in9 & in12 & in13 & in17 & in19 & in21 & in24 & in26 & in27);

	localparam realtime T_fall_y107 = tpd_elmore(L_y107, R_nmos_ohm(6*L_unit) * 3);
	localparam realtime T_Z_y107    = tpd_z(, T_fall_y107);
	bufif1 (highz1, strong0) #(0, T_fall_y107, T_Z_y107)
		(y107, '0, in1 & in2 & in27);

endmodule

`default_nettype wire
