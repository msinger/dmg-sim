`default_nettype none

module sm83(
		output     logic halt_n,
		output     logic stop_n,
		inout  tri logic a0,
		inout  tri logic a1,
		inout  tri logic a10,
		inout  tri logic a11,
		inout  tri logic a12,
		inout  tri logic a13,
		inout  tri logic a14,
		inout  tri logic a15,
		inout  tri logic a2,
		inout  tri logic a3,
		inout  tri logic a4,
		inout  tri logic a5,
		inout  tri logic a6,
		inout  tri logic a7,
		inout  tri logic a8,
		inout  tri logic a9,
		input      logic adr_clk_n,
		input      logic adr_clk_p,
		input      logic async_reset,
		input      logic buke,
		output     logic wr,
		inout  tri logic d0,
		inout  tri logic d1,
		inout  tri logic d2,
		inout  tri logic d3,
		inout  tri logic d4,
		inout  tri logic d5,
		inout  tri logic d6,
		inout  tri logic d7,
		output tri logic db0,
		output tri logic db1,
		output tri logic db2,
		output tri logic db3,
		output tri logic db4,
		output tri logic db5,
		output tri logic db6,
		output tri logic db7,
		output     logic dec1_y103,
		output     logic dec1_y28_buf,
		input      logic int0,
		input      logic int1,
		input      logic int2,
		input      logic int3,
		input      logic int4,
		input      logic int5,
		input      logic int6,
		input      logic int7,
		output     logic inta0,
		output     logic inta1,
		output     logic inta2,
		output     logic inta3,
		output     logic inta4,
		output     logic inta5,
		output     logic inta6,
		output     logic inta7,
		output     logic irq_head_d_y,
		output     logic m1,
		input      logic main_clk_n,
		input      logic main_clk_p,
		output     logic mreq,
		input      logic nmi,
		input      logic osc_stable,
		input      logic phi_clk_n,
		input      logic phi_clk_p,
		output     logic rd,
		input      logic sync_reset,
		input      logic syro,
		input      logic t4_clk_n,
		input      logic t4_clk_p,
		input      logic tutu,
		input      logic umut,
		input      logic unor,
		input      logic wake,
		output     logic zacw_q);

	tri logic carry_in_n;
	tri logic ctl_mwrite_n;
	tri logic dec1_y1_n;
	tri logic dec1_y10_n;
	tri logic dec1_y100_n;
	tri logic dec1_y101_n;
	tri logic dec1_y102_n;
	tri logic dec1_y103_n;
	tri logic dec1_y104_n;
	tri logic dec1_y105_n;
	tri logic dec1_y106_n;
	tri logic dec1_y107_n;
	tri logic dec1_y11_n;
	tri logic dec1_y12_n;
	tri logic dec1_y13_n;
	tri logic dec1_y14_n;
	tri logic dec1_y15_n;
	tri logic dec1_y16_n;
	tri logic dec1_y17_n;
	tri logic dec1_y18_n;
	tri logic dec1_y19_n;
	tri logic dec1_y2_n;
	tri logic dec1_y20_n;
	tri logic dec1_y21_n;
	tri logic dec1_y22_n;
	tri logic dec1_y23_n;
	tri logic dec1_y24_n;
	tri logic dec1_y25_n;
	tri logic dec1_y26_n;
	tri logic dec1_y27_n;
	tri logic dec1_y28_n;
	tri logic dec1_y29_n;
	tri logic dec1_y3_n;
	tri logic dec1_y30_n;
	tri logic dec1_y31_n;
	tri logic dec1_y32_n;
	tri logic dec1_y33_n;
	tri logic dec1_y34_n;
	tri logic dec1_y35_n;
	tri logic dec1_y36_n;
	tri logic dec1_y37_n;
	tri logic dec1_y38_n;
	tri logic dec1_y39_n;
	tri logic dec1_y4_n;
	tri logic dec1_y40_n;
	tri logic dec1_y41_n;
	tri logic dec1_y42_n;
	tri logic dec1_y43_n;
	tri logic dec1_y44_n;
	tri logic dec1_y45_n;
	tri logic dec1_y46_n;
	tri logic dec1_y47_n;
	tri logic dec1_y48_n;
	tri logic dec1_y49_n;
	tri logic dec1_y5_n;
	tri logic dec1_y50_n;
	tri logic dec1_y51_n;
	tri logic dec1_y52_n;
	tri logic dec1_y53_n;
	tri logic dec1_y54_n;
	tri logic dec1_y55_n;
	tri logic dec1_y56_n;
	tri logic dec1_y57_n;
	tri logic dec1_y58_n;
	tri logic dec1_y59_n;
	tri logic dec1_y6_n;
	tri logic dec1_y60_n;
	tri logic dec1_y61_n;
	tri logic dec1_y62_n;
	tri logic dec1_y63_n;
	tri logic dec1_y64_n;
	tri logic dec1_y65_n;
	tri logic dec1_y66_n;
	tri logic dec1_y67_n;
	tri logic dec1_y68_n;
	tri logic dec1_y69_n;
	tri logic dec1_y7_n;
	tri logic dec1_y70_n;
	tri logic dec1_y71_n;
	tri logic dec1_y72_n;
	tri logic dec1_y73_n;
	tri logic dec1_y74_n;
	tri logic dec1_y75_n;
	tri logic dec1_y76_n;
	tri logic dec1_y77_n;
	tri logic dec1_y78_n;
	tri logic dec1_y79_n;
	tri logic dec1_y8_n;
	tri logic dec1_y80_n;
	tri logic dec1_y81_n;
	tri logic dec1_y82_n;
	tri logic dec1_y83_n;
	tri logic dec1_y84_n;
	tri logic dec1_y85_n;
	tri logic dec1_y86_n;
	tri logic dec1_y87_n;
	tri logic dec1_y88_n;
	tri logic dec1_y89_n;
	tri logic dec1_y9_n;
	tri logic dec1_y90_n;
	tri logic dec1_y91_n;
	tri logic dec1_y92_n;
	tri logic dec1_y93_n;
	tri logic dec1_y94_n;
	tri logic dec1_y95_n;
	tri logic dec1_y96_n;
	tri logic dec1_y97_n;
	tri logic dec1_y98_n;
	tri logic dec1_y99_n;
	tri logic dec2_y1_n;
	tri logic dec2_y10_n;
	tri logic dec2_y11_n;
	tri logic dec2_y12_n;
	tri logic dec2_y13_n;
	tri logic dec2_y14_n;
	tri logic dec2_y15_n;
	tri logic dec2_y16_n;
	tri logic dec2_y17_n;
	tri logic dec2_y18_n;
	tri logic dec2_y19_n;
	tri logic dec2_y2_n;
	tri logic dec2_y20_n;
	tri logic dec2_y21_n;
	tri logic dec2_y22_n;
	tri logic dec2_y23_n;
	tri logic dec2_y24_n;
	tri logic dec2_y25_n;
	tri logic dec2_y26_n;
	tri logic dec2_y27_n;
	tri logic dec2_y28_n;
	tri logic dec2_y29_n;
	tri logic dec2_y3_n;
	tri logic dec2_y30_n;
	tri logic dec2_y4_n;
	tri logic dec2_y6_n;
	tri logic dec2_y7_n;
	tri logic dec2_y8_n;
	tri logic dec2_y9_n;
	logic     dec3_ir0_n;
	logic     dec3_ir1_n;
	logic     dec3_ir2_n;
	logic     dec3_ir3_n;
	logic     dec3_ir4_n;
	logic     dec3_ir5_n;
	tri logic dec3_y1_n;
	tri logic dec3_y10_n;
	tri logic dec3_y11_n;
	tri logic dec3_y12_n;
	tri logic dec3_y13_n;
	tri logic dec3_y14_n;
	tri logic dec3_y15_n;
	tri logic dec3_y16_n;
	tri logic dec3_y17_n;
	tri logic dec3_y18_n;
	tri logic dec3_y19_n;
	tri logic dec3_y2_n;
	tri logic dec3_y20_n;
	tri logic dec3_y21_n;
	tri logic dec3_y22_n;
	tri logic dec3_y23_n;
	tri logic dec3_y24_n;
	tri logic dec3_y25_n;
	tri logic dec3_y26_n;
	tri logic dec3_y27_n;
	tri logic dec3_y28_n;
	tri logic dec3_y29_n;
	tri logic dec3_y3_n;
	tri logic dec3_y30_n;
	tri logic dec3_y31_n;
	tri logic dec3_y32_n;
	tri logic dec3_y33_n;
	tri logic dec3_y34_n;
	tri logic dec3_y35_n;
	tri logic dec3_y36_n;
	tri logic dec3_y37_n;
	tri logic dec3_y38_n;
	tri logic dec3_y39_n;
	tri logic dec3_y4_n;
	tri logic dec3_y40_n;
	tri logic dec3_y41_n;
	tri logic dec3_y42_n;
	tri logic dec3_y43_n;
	tri logic dec3_y44_n;
	tri logic dec3_y45_n;
	tri logic dec3_y46_n;
	tri logic dec3_y47_n;
	tri logic dec3_y48_n;
	tri logic dec3_y49_n;
	tri logic dec3_y5_n;
	tri logic dec3_y50_n;
	tri logic dec3_y51_n;
	tri logic dec3_y52_n;
	tri logic dec3_y53_n;
	tri logic dec3_y54_n;
	tri logic dec3_y55_n;
	tri logic dec3_y56_n;
	tri logic dec3_y57_n;
	tri logic dec3_y58_n;
	tri logic dec3_y59_n;
	tri logic dec3_y6_n;
	tri logic dec3_y60_n;
	tri logic dec3_y61_n;
	tri logic dec3_y62_n;
	tri logic dec3_y63_n;
	tri logic dec3_y64_n;
	tri logic dec3_y65_n;
	tri logic dec3_y66_n;
	tri logic dec3_y67_n;
	tri logic dec3_y68_n;
	tri logic dec3_y69_n;
	tri logic dec3_y7_n;
	tri logic dec3_y8_n;
	tri logic dec3_y9_n;
	logic     flag_c_n;
	logic     flag_h_n;
	logic     flag_n_n;
	logic     flag_z_n;
	tri logic hi_bus0_n;
	tri logic hi_bus1_n;
	tri logic hi_bus2_n;
	tri logic hi_bus3_n;
	tri logic hi_bus4_n;
	tri logic hi_bus5_n;
	tri logic hi_bus6_n;
	tri logic hi_bus7_n;
	tri logic int_vector3_n;
	tri logic int_vector4_n;
	tri logic int_vector5_n;
	logic     irq_latch0_n;
	logic     irq_latch1_n;
	logic     irq_latch2_n;
	logic     irq_latch3_n;
	logic     irq_latch4_n;
	logic     irq_latch5_n;
	logic     irq_latch6_n;
	logic     irq_latch7_n;
	tri logic lo_bus0_n;
	tri logic lo_bus1_n;
	tri logic lo_bus2_n;
	tri logic lo_bus3_n;
	tri logic lo_bus4_n;
	tri logic lo_bus5_n;
	tri logic lo_bus6_n;
	tri logic lo_bus7_n;
	tri logic new_flag_c_n;
	tri logic new_flag_h_n;
	tri logic new_flag_n_n;
	tri logic new_flag_z_n;
	tri logic new_reg_hi0_n;
	tri logic new_reg_hi1_n;
	tri logic new_reg_hi2_n;
	tri logic new_reg_hi3_n;
	tri logic new_reg_hi4_n;
	tri logic new_reg_hi5_n;
	tri logic new_reg_hi6_n;
	tri logic new_reg_hi7_n;
	tri logic new_reg_pch0_n;
	tri logic new_reg_pch1_n;
	tri logic new_reg_pch2_n;
	tri logic new_reg_pch3_n;
	tri logic new_reg_pch4_n;
	tri logic new_reg_pch5_n;
	tri logic new_reg_pch6_n;
	tri logic new_reg_pch7_n;
	tri logic new_reg_pcl0_n;
	tri logic new_reg_pcl1_n;
	tri logic new_reg_pcl2_n;
	tri logic new_reg_pcl3_n;
	tri logic new_reg_pcl4_n;
	tri logic new_reg_pcl5_n;
	tri logic new_reg_pcl6_n;
	tri logic new_reg_pcl7_n;
	tri logic new_reg_sph0_n;
	tri logic new_reg_sph1_n;
	tri logic new_reg_sph2_n;
	tri logic new_reg_sph3_n;
	tri logic new_reg_sph4_n;
	tri logic new_reg_sph5_n;
	tri logic new_reg_sph6_n;
	tri logic new_reg_sph7_n;
	tri logic new_reg_spl0_n;
	tri logic new_reg_spl1_n;
	tri logic new_reg_spl2_n;
	tri logic new_reg_spl3_n;
	tri logic new_reg_spl4_n;
	tri logic new_reg_spl5_n;
	tri logic new_reg_spl6_n;
	tri logic new_reg_spl7_n;
	logic     new_reg_w0_n;
	logic     new_reg_w1_n;
	logic     new_reg_w2_n;
	logic     new_reg_w3_n;
	logic     new_reg_w4_n;
	logic     new_reg_w5_n;
	logic     new_reg_w6_n;
	logic     new_reg_w7_n;
	logic     new_reg_z0_n;
	logic     new_reg_z1_n;
	logic     new_reg_z2_n;
	logic     new_reg_z3_n;
	logic     new_reg_z4_n;
	logic     new_reg_z5_n;
	logic     new_reg_z6_n;
	logic     new_reg_z7_n;
	logic     nmi_n;
	tri logic op1bus0_n;
	tri logic op1bus1_n;
	tri logic op1bus2_n;
	tri logic op1bus3_n;
	tri logic op1bus4_n;
	tri logic op1bus5_n;
	tri logic op1bus6_n;
	tri logic op1bus7_n;
	tri logic op1dec0_n;
	tri logic op1dec1_n;
	tri logic op1dec2_n;
	tri logic op1dec3_n;
	tri logic op1dec4_n;
	tri logic op1dec5_n;
	tri logic op1dec6_n;
	tri logic op1dec7_n;
	tri logic op2bus0_n;
	tri logic op2bus1_n;
	tri logic op2bus2_n;
	tri logic op2bus3_n;
	tri logic op2bus4_n;
	tri logic op2bus5_n;
	tri logic op2bus6_n;
	tri logic op2bus7_n;
	logic     op2val0_n;
	logic     op2val1_n;
	logic     op2val2_n;
	logic     op2val3_n;
	logic     op2val4_n;
	logic     op2val5_n;
	logic     op2val6_n;
	logic     op2val7_n;
	logic     reg_ie0_n;
	logic     reg_ie1_n;
	logic     reg_ie2_n;
	logic     reg_ie3_n;
	logic     reg_ie4_n;
	logic     reg_ie5_n;
	logic     reg_ie6_n;
	logic     reg_ie7_n;
	logic     reg_pch0_n;
	logic     reg_pch1_n;
	logic     reg_pch2_n;
	logic     reg_pch3_n;
	logic     reg_pch4_n;
	logic     reg_pch5_n;
	logic     reg_pch6_n;
	logic     reg_pch7_n;
	logic     reg_pcl0_n;
	logic     reg_pcl1_n;
	logic     reg_pcl2_n;
	logic     reg_pcl3_n;
	logic     reg_pcl4_n;
	logic     reg_pcl5_n;
	logic     reg_pcl6_n;
	logic     reg_pcl7_n;
	logic     reg_sph0_n;
	logic     reg_sph1_n;
	logic     reg_sph2_n;
	logic     reg_sph3_n;
	logic     reg_sph4_n;
	logic     reg_sph5_n;
	logic     reg_sph6_n;
	logic     reg_sph7_n;
	logic     reg_spl0_n;
	logic     reg_spl1_n;
	logic     reg_spl2_n;
	logic     reg_spl3_n;
	logic     reg_spl4_n;
	logic     reg_spl5_n;
	logic     reg_spl6_n;
	logic     reg_spl7_n;
	logic     res_carry_n;
	logic     res_hcarry_n;
	logic     xaym_n;
	logic     xirf_n;
	logic     xtip_n;
	logic     xufu_n;
	logic     xygb_n;
	logic     a_wr_n;
	logic     alu_and0;
	logic     alu_and1;
	logic     alu_and2;
	logic     alu_and3;
	logic     alu_and4;
	logic     alu_and5;
	logic     alu_and6;
	logic     alu_and7;
	tri logic alu_decoder_y12;
	logic     alu_dff;
	logic     alu_not9;
	logic     alu_pggen_tap_nand0;
	logic     alu_pggen_tap_nand1;
	logic     alu_pggen_tap_nand2;
	logic     alu_pggen_tap_nand3;
	logic     alu_pggen_tap_nand4;
	logic     alu_pggen_tap_nand5;
	logic     alu_pggen_tap_nand6;
	logic     alu_pggen_tap_nand7;
	logic     alu_pggen_tap_xor0;
	logic     alu_pggen_tap_xor1;
	logic     alu_pggen_tap_xor2;
	logic     alu_pggen_tap_xor3;
	logic     alu_pggen_tap_xor4;
	logic     alu_pggen_tap_xor5;
	logic     alu_pggen_tap_xor6;
	logic     alu_pggen_tap_xor7;
	logic     alu_pggen_y0;
	logic     alu_pggen_y1;
	logic     alu_pggen_y2;
	logic     alu_pggen_y3;
	logic     alu_pggen_y4;
	logic     alu_pggen_y5;
	logic     alu_pggen_y6;
	logic     alu_pggen_y7;
	logic     b_wr_n;
	logic     c_wr_n;
	logic     carry_in;
	logic     ctl_mwrite;
	logic     d_wr_n;
	logic     dec1_ir0_n;
	logic     dec1_ir1_n;
	logic     dec1_ir2_n;
	logic     dec1_ir3_n;
	logic     dec1_ir4_n;
	logic     dec1_ir5_n;
	logic     dec1_ir6_n;
	logic     dec1_ir7_n;
	logic     dec1_y1;
	logic     dec1_y10;
	logic     dec1_y100;
	logic     dec1_y101;
	logic     dec1_y102;
	logic     dec1_y104;
	logic     dec1_y104_buf;
	logic     dec1_y105;
	logic     dec1_y106;
	logic     dec1_y107;
	logic     dec1_y11;
	logic     dec1_y12;
	logic     dec1_y13;
	logic     dec1_y14;
	logic     dec1_y15;
	logic     dec1_y16;
	logic     dec1_y17;
	logic     dec1_y18;
	logic     dec1_y19;
	logic     dec1_y2;
	logic     dec1_y20;
	logic     dec1_y20_buf;
	logic     dec1_y21;
	logic     dec1_y22;
	logic     dec1_y23;
	logic     dec1_y24;
	logic     dec1_y25;
	logic     dec1_y26;
	logic     dec1_y27;
	logic     dec1_y28;
	logic     dec1_y29;
	logic     dec1_y3;
	logic     dec1_y30;
	logic     dec1_y31;
	logic     dec1_y32;
	logic     dec1_y33;
	logic     dec1_y34;
	logic     dec1_y35;
	logic     dec1_y36;
	logic     dec1_y36_buf;
	logic     dec1_y37;
	logic     dec1_y38;
	logic     dec1_y39;
	logic     dec1_y4;
	logic     dec1_y4_buf;
	logic     dec1_y40;
	logic     dec1_y41;
	logic     dec1_y42;
	logic     dec1_y43;
	logic     dec1_y44;
	logic     dec1_y45;
	logic     dec1_y46;
	logic     dec1_y47;
	logic     dec1_y47_buf;
	logic     dec1_y48;
	logic     dec1_y49;
	logic     dec1_y5;
	logic     dec1_y50;
	logic     dec1_y51;
	logic     dec1_y51_buf;
	logic     dec1_y52;
	logic     dec1_y53;
	logic     dec1_y54;
	logic     dec1_y55;
	logic     dec1_y56;
	logic     dec1_y57;
	logic     dec1_y58;
	logic     dec1_y59;
	logic     dec1_y6;
	logic     dec1_y60;
	logic     dec1_y61;
	logic     dec1_y62;
	logic     dec1_y63;
	logic     dec1_y64;
	logic     dec1_y65;
	logic     dec1_y66;
	logic     dec1_y67;
	logic     dec1_y68;
	logic     dec1_y69;
	logic     dec1_y7;
	logic     dec1_y70;
	logic     dec1_y71;
	logic     dec1_y72;
	logic     dec1_y73;
	logic     dec1_y74;
	logic     dec1_y75;
	logic     dec1_y76;
	logic     dec1_y77;
	logic     dec1_y78;
	logic     dec1_y79;
	logic     dec1_y8;
	logic     dec1_y80;
	logic     dec1_y81;
	logic     dec1_y82;
	logic     dec1_y83;
	logic     dec1_y84;
	logic     dec1_y85;
	logic     dec1_y86;
	logic     dec1_y87;
	logic     dec1_y88;
	logic     dec1_y89;
	logic     dec1_y9;
	logic     dec1_y90;
	logic     dec1_y91;
	logic     dec1_y92;
	logic     dec1_y93;
	logic     dec1_y94;
	logic     dec1_y95;
	logic     dec1_y96;
	logic     dec1_y97;
	logic     dec1_y98;
	logic     dec1_y99;
	logic     dec1_y99_buf;
	logic     dec2_y1;
	logic     dec2_y10;
	logic     dec2_y11;
	logic     dec2_y12;
	logic     dec2_y13;
	logic     dec2_y14;
	logic     dec2_y15;
	logic     dec2_y16;
	logic     dec2_y17;
	logic     dec2_y18;
	logic     dec2_y2;
	logic     dec2_y20;
	logic     dec2_y21;
	logic     dec2_y22;
	logic     dec2_y23;
	logic     dec2_y24;
	logic     dec2_y25;
	logic     dec2_y26;
	logic     dec2_y27;
	logic     dec2_y28;
	logic     dec2_y29;
	logic     dec2_y3;
	logic     dec2_y30;
	logic     dec2_y4;
	logic     dec2_y6;
	logic     dec2_y7;
	logic     dec2_y8;
	logic     dec2_y9;
	logic     dec3_nor1;
	logic     dec3_nor2;
	logic     dec3_not68;
	logic     dec3_y1;
	logic     dec3_y10;
	logic     dec3_y11;
	logic     dec3_y12;
	logic     dec3_y13;
	logic     dec3_y14;
	logic     dec3_y15;
	logic     dec3_y16;
	logic     dec3_y17;
	logic     dec3_y18;
	logic     dec3_y19;
	logic     dec3_y2;
	logic     dec3_y20;
	logic     dec3_y21;
	logic     dec3_y22;
	logic     dec3_y23;
	logic     dec3_y24;
	logic     dec3_y25;
	logic     dec3_y26;
	logic     dec3_y27;
	logic     dec3_y28;
	logic     dec3_y29;
	logic     dec3_y3;
	logic     dec3_y30;
	logic     dec3_y31;
	logic     dec3_y32;
	logic     dec3_y33;
	logic     dec3_y34;
	logic     dec3_y35;
	logic     dec3_y36;
	logic     dec3_y37;
	logic     dec3_y38;
	logic     dec3_y39;
	logic     dec3_y4;
	logic     dec3_y40;
	logic     dec3_y41;
	logic     dec3_y42;
	logic     dec3_y43;
	logic     dec3_y44;
	logic     dec3_y45;
	logic     dec3_y46;
	logic     dec3_y47;
	logic     dec3_y48;
	logic     dec3_y49;
	logic     dec3_y5;
	logic     dec3_y50;
	logic     dec3_y51;
	logic     dec3_y52;
	logic     dec3_y53;
	logic     dec3_y54;
	logic     dec3_y55;
	logic     dec3_y57;
	logic     dec3_y59;
	logic     dec3_y6;
	logic     dec3_y60;
	logic     dec3_y61;
	logic     dec3_y62;
	logic     dec3_y63;
	logic     dec3_y64;
	logic     dec3_y65;
	logic     dec3_y66;
	logic     dec3_y67;
	logic     dec3_y68;
	logic     dec3_y69;
	logic     dec3_y7;
	logic     dec3_y8;
	logic     dec3_y9;
	logic     e_wr_n;
	logic     flag_c;
	logic     flag_h;
	logic     flag_n;
	logic     flag_z;
	logic     gen0;
	logic     gen1;
	logic     gen2;
	logic     gen3;
	logic     gen4;
	logic     gen5;
	logic     gen6;
	logic     gen7;
	logic     gnd;
	logic     h_wr_n;
	logic     idu_chain_a_y_n0;
	logic     idu_chain_a_y_n1;
	logic     idu_chain_a_y_n2;
	logic     idu_chain_a_y_n3;
	logic     idu_chain_a_y_n4;
	logic     idu_chain_a_y_n5;
	logic     idu_chain_a_y_n6;
	logic     idu_chain_a_y_n7;
	tri logic idu_chain_a_y0;
	tri logic idu_chain_a_y1;
	tri logic idu_chain_a_y2;
	tri logic idu_chain_a_y3;
	tri logic idu_chain_a_y4;
	tri logic idu_chain_a_y5;
	tri logic idu_chain_a_y6;
	logic     idu_chain_b_y_n0;
	logic     idu_chain_b_y_n1;
	logic     idu_chain_b_y_n2;
	logic     idu_chain_b_y_n3;
	logic     idu_chain_b_y_n4;
	logic     idu_chain_b_y_n5;
	logic     idu_chain_b_y_n6;
	logic     idu_chain_b_y_n7;
	tri logic idu_chain_b_y0;
	tri logic idu_chain_b_y1;
	tri logic idu_chain_b_y2;
	tri logic idu_chain_b_y3;
	tri logic idu_chain_b_y4;
	tri logic idu_chain_b_y5;
	tri logic idu_chain_b_y6;
	logic     idu_ctl_y1;
	logic     idu_ctl_y2;
	logic     idu_ctl_y3;
	logic     idu_hi_in0;
	logic     idu_hi_in1;
	logic     idu_hi_in2;
	logic     idu_hi_in3;
	logic     idu_hi_in4;
	logic     idu_hi_in5;
	logic     idu_hi_in6;
	logic     idu_hi_in7;
	logic     idu_lo_in0;
	logic     idu_lo_in1;
	logic     idu_lo_in2;
	logic     idu_lo_in3;
	logic     idu_lo_in4;
	logic     idu_lo_in5;
	logic     idu_lo_in6;
	logic     idu_lo_in7;
	logic     idu_mux_h0;
	logic     idu_mux_h1;
	logic     idu_mux_h2;
	logic     idu_mux_h3;
	logic     idu_mux_h4;
	logic     idu_mux_h5;
	logic     idu_mux_h6;
	logic     idu_mux_l0;
	logic     idu_mux_l1;
	logic     idu_mux_l2;
	logic     idu_mux_l3;
	logic     idu_mux_l4;
	logic     idu_mux_l5;
	logic     idu_mux_l6;
	logic     idu_mux_l7;
	logic     idu_xor_h0;
	logic     idu_xor_h1;
	logic     idu_xor_h2;
	logic     idu_xor_h3;
	logic     idu_xor_h4;
	logic     idu_xor_h5;
	logic     idu_xor_h6;
	logic     idu_xor_h7;
	logic     idu_xor_l0;
	logic     idu_xor_l1;
	logic     idu_xor_l2;
	logic     idu_xor_l3;
	logic     idu_xor_l4;
	logic     idu_xor_l5;
	logic     idu_xor_l6;
	logic     idu_xor_l7;
	logic     ie_wr_n;
	logic     ie_wr;
	logic     int_vector3;
	logic     int_vector4;
	logic     int_vector5;
	logic     int_vector6;
	logic     int_vector7;
	logic     ir0;
	logic     ir1;
	logic     ir2;
	logic     ir3;
	logic     ir4;
	logic     ir5;
	logic     ir6;
	logic     ir7;
	logic     ir_wr_n;
	logic     irq_head_a_y;
	logic     irq_head_b_y;
	logic     irq_head_c_y;
	logic     irq_head_e_y;
	logic     irq_latch0;
	logic     irq_latch1;
	logic     irq_latch2;
	logic     irq_latch3;
	logic     irq_latch4;
	logic     irq_latch5;
	logic     irq_latch6;
	logic     irq_latch_gated_q_n0;
	logic     irq_latch_gated_q_n1;
	logic     irq_latch_gated_q_n2;
	logic     irq_latch_gated_q_n3;
	logic     irq_latch_gated_q_n4;
	logic     irq_latch_gated_q_n5;
	logic     irq_latch_gated_q_n6;
	logic     irq_latch_gated_q_n7;
	logic     irq_nand2_nand30;
	logic     irq_nand2_nand31;
	logic     irq_nand2_nand32;
	logic     irq_nand2_nand33;
	logic     irq_nand2_nand34;
	logic     irq_nand2_nand35;
	logic     irq_nand2_nand36;
	logic     irq_nand2_nand37;
	tri logic irq_prio_dist_nand_a_y;
	tri logic irq_prio_dist_nand_a_y_n1;
	tri logic irq_prio_dist_nand_a_y_n2;
	tri logic irq_prio_dist_nand_a_y_n3;
	tri logic irq_prio_dist_nand_a_y_n4;
	tri logic irq_prio_dist_nand_a_y_n5;
	tri logic irq_prio_dist_nand_a_y_n6;
	tri logic irq_prio_dist_nand_a_y_n7;
	tri logic irq_prio_dist_nand_b_y;
	tri logic irq_prio_dist_nand_b_y_n1;
	tri logic irq_prio_dist_nand_b_y_n2;
	tri logic irq_prio_dist_nand_b_y_n3;
	tri logic irq_prio_dist_nand_b_y_n4;
	tri logic irq_prio_dist_nand_b_y_n5;
	tri logic irq_prio_dist_nand_b_y_n6;
	tri logic irq_prio_dist_nand_b_y_n7;
	tri logic irq_prio_dist_nor_y;
	tri logic irq_prio_dist_nor_y_p1;
	tri logic irq_prio_dist_nor_y_p2;
	tri logic irq_prio_dist_nor_y_p3;
	tri logic irq_prio_dist_nor_y_p4;
	tri logic irq_prio_dist_nor_y_p5;
	tri logic irq_prio_dist_nor_y_p6;
	tri logic irq_prio_dist_nor_y_p7;
	tri logic irq_prio_nand_a_y;
	tri logic irq_prio_nand_b_y0;
	tri logic irq_prio_nand_b_y1;
	tri logic irq_prio_nand_b_y2;
	tri logic irq_prio_nand_b_y3;
	tri logic irq_prio_nand_b_y4;
	tri logic irq_prio_nand_b_y5;
	tri logic irq_prio_nand_b_y6;
	tri logic irq_prio_nand_b_y7;
	logic     l_wr_n;
	logic     new_reg_hi0;
	logic     new_reg_hi1;
	logic     new_reg_hi2;
	logic     new_reg_hi3;
	logic     new_reg_hi4;
	logic     new_reg_hi5;
	logic     new_reg_hi6;
	logic     new_reg_hi7;
	logic     new_reg_lo0;
	logic     new_reg_lo1;
	logic     new_reg_lo2;
	logic     new_reg_lo3;
	logic     new_reg_lo4;
	logic     new_reg_lo5;
	logic     new_reg_lo6;
	logic     new_reg_lo7;
	logic     oe;
	logic     op1dec0;
	logic     op1dec1;
	logic     op1dec2;
	logic     op1dec3;
	logic     op1dec4;
	logic     op1dec5;
	logic     op1dec6;
	logic     op1dec7;
	logic     op1val0;
	logic     op1val1;
	logic     op1val2;
	logic     op1val3;
	logic     op1val4;
	logic     op1val5;
	logic     op1val6;
	logic     op1val7;
	logic     op2val0;
	logic     op2val1;
	logic     op2val2;
	logic     op2val3;
	logic     op2val4;
	logic     op2val5;
	logic     op2val6;
	logic     op2val7;
	logic     pch_reset_n;
	logic     pch_wr_n;
	logic     pcl_reset_n;
	logic     pcl_wr_n;
	logic     prop0;
	logic     prop1;
	logic     prop2;
	logic     prop3;
	logic     prop4;
	logic     prop5;
	logic     prop6;
	logic     prop7;
	logic     reg_a0;
	logic     reg_a1;
	logic     reg_a2;
	logic     reg_a3;
	logic     reg_a4;
	logic     reg_a5;
	logic     reg_a6;
	logic     reg_a7;
	logic     reg_and;
	logic     reg_and2_and3_a;
	logic     reg_and2_and3_b;
	logic     reg_b0;
	logic     reg_b1;
	logic     reg_b2;
	logic     reg_b3;
	logic     reg_b4;
	logic     reg_b5;
	logic     reg_b6;
	logic     reg_b7;
	logic     reg_c0;
	logic     reg_c1;
	logic     reg_c2;
	logic     reg_c3;
	logic     reg_c4;
	logic     reg_c5;
	logic     reg_c6;
	logic     reg_c7;
	logic     reg_d0;
	logic     reg_d1;
	logic     reg_d2;
	logic     reg_d3;
	logic     reg_d4;
	logic     reg_d5;
	logic     reg_d6;
	logic     reg_d7;
	logic     reg_e0;
	logic     reg_e1;
	logic     reg_e2;
	logic     reg_e3;
	logic     reg_e4;
	logic     reg_e5;
	logic     reg_e6;
	logic     reg_e7;
	logic     reg_h0;
	logic     reg_h1;
	logic     reg_h2;
	logic     reg_h3;
	logic     reg_h4;
	logic     reg_h5;
	logic     reg_h6;
	logic     reg_h7;
	logic     reg_ie0;
	logic     reg_ie1;
	logic     reg_ie2;
	logic     reg_ie3;
	logic     reg_ie4;
	logic     reg_ie5;
	logic     reg_ie6;
	logic     reg_ie7;
	logic     reg_l0;
	logic     reg_l1;
	logic     reg_l2;
	logic     reg_l3;
	logic     reg_l4;
	logic     reg_l5;
	logic     reg_l6;
	logic     reg_l7;
	logic     reg_oa1;
	logic     reg_oa2;
	logic     reg_or;
	logic     reg_or_tap_in1_n;
	logic     reg_or_tap_nor;
	logic     reg_pch0;
	logic     reg_pch1;
	logic     reg_pch2;
	logic     reg_pch3;
	logic     reg_pch4;
	logic     reg_pch5;
	logic     reg_pch6;
	logic     reg_pch7;
	logic     reg_pcl0;
	logic     reg_pcl1;
	logic     reg_pcl2;
	logic     reg_pcl3;
	logic     reg_pcl4;
	logic     reg_pcl5;
	logic     reg_pcl6;
	logic     reg_pcl7;
	logic     reg_sph0;
	logic     reg_sph1;
	logic     reg_sph2;
	logic     reg_sph3;
	logic     reg_sph4;
	logic     reg_sph5;
	logic     reg_sph6;
	logic     reg_sph7;
	logic     reg_spl0;
	logic     reg_spl1;
	logic     reg_spl2;
	logic     reg_spl3;
	logic     reg_spl4;
	logic     reg_spl5;
	logic     reg_spl6;
	logic     reg_spl7;
	logic     reg_w0;
	logic     reg_w1;
	logic     reg_w2;
	logic     reg_w3;
	logic     reg_w4;
	logic     reg_w5;
	logic     reg_w6;
	logic     reg_w7;
	logic     reg_z0;
	logic     reg_z1;
	logic     reg_z2;
	logic     reg_z3;
	logic     reg_z4;
	logic     reg_z5;
	logic     reg_z6;
	logic     reg_z7;
	logic     res0;
	logic     res1;
	logic     res2;
	logic     res3;
	logic     res4;
	logic     res5;
	logic     res6;
	logic     res7;
	logic     res_carry0;
	logic     res_carry1;
	logic     res_carry2;
	logic     res_carry3;
	logic     res_carry4;
	logic     res_carry5;
	logic     res_carry6;
	logic     res_carry7;
	logic     res_zero;
	tri logic shift0;
	tri logic shift1;
	tri logic shift2;
	tri logic shift3;
	tri logic shift4;
	tri logic shift5;
	tri logic shift6;
	tri logic shift7;
	logic     spare_ir7_n;
	tri logic spare_y;
	logic     sph_wr_n;
	logic     spl_wr_n;
	logic     vdd;
	logic     vequ;
	logic     vequ_tap_in1;
	logic     w_wr_n;
	logic     wafr;
	logic     wagr;
	logic     ween;
	logic     werf;
	logic     wudz;
	logic     xaym;
	logic     xaym_buf;
	logic     xdqf;
	logic     xirf;
	logic     xirf_buf;
	logic     xogs;
	logic     xtip;
	logic     xtip_buf;
	logic     xudo;
	logic     xufu;
	logic     xufu_buf;
	logic     xurg;
	logic     xuri;
	logic     xygb;
	logic     xygb_buf;
	logic     ycnf;
	logic     ydxa;
	logic     ykua;
	logic     yneu;
	logic     yniu;
	logic     ynkw;
	logic     ynoz;
	logic     yodp;
	logic     yoii;
	logic     yolu;
	logic     ysbt;
	logic     z_wr_n;
	logic     zacw;
	logic     zaij;
	logic     zaoc;
	logic     zaza;
	logic     zbpp;
	logic     zbpp_tap_in1_n;
	logic     zfex;
	logic     zgna;
	logic     zhzo;
	logic     ziks;
	logic     ziul;
	logic     zivv;
	logic     zjje;
	logic     zkai;
	logic     zkdu;
	logic     zkog;
	logic     zkon;
	logic     zloz;
	logic     znda;
	logic     zojz;
	logic     zorp;
	logic     zowa;
	logic     zoxc;
	logic     zrby;
	logic     zrsy;
	logic     zudn;
	logic     zumn;
	logic     zwlm;
	logic     zwuu;
	logic     zyoc;
	logic     zzom;

	assign wr               = ctl_mwrite;
	assign zacw_q           = zacw;

	sm83_and2_alu #(
			.L_y(90.6039)
		) alu_and0_inst (
			.in1(prop0),
			.in2(alu_pggen_tap_nand0),
			.y(alu_and0)
		);

	sm83_and2_alu #(
			.L_y(95.10242)
		) alu_and1_inst (
			.in1(alu_pggen_tap_nand1),
			.in2(prop1),
			.y(alu_and1)
		);

	sm83_and2_alu #(
			.L_y(116.4545)
		) alu_and2_inst (
			.in1(alu_pggen_tap_nand2),
			.in2(prop2),
			.y(alu_and2)
		);

	sm83_and2_alu #(
			.L_y(112.4629)
		) alu_and3_inst (
			.in1(alu_pggen_tap_nand3),
			.in2(prop3),
			.y(alu_and3)
		);

	sm83_and2_alu #(
			.L_y(98.65055)
		) alu_and4_inst (
			.in1(prop4),
			.in2(alu_pggen_tap_nand4),
			.y(alu_and4)
		);

	sm83_and2_alu #(
			.L_y(102.8322)
		) alu_and5_inst (
			.in1(alu_pggen_tap_nand5),
			.in2(prop5),
			.y(alu_and5)
		);

	sm83_and2_alu #(
			.L_y(110.3721)
		) alu_and6_inst (
			.in1(alu_pggen_tap_nand6),
			.in2(prop6),
			.y(alu_and6)
		);

	sm83_and2_alu #(
			.L_y(104.9865)
		) alu_and7_inst (
			.in1(prop7),
			.in2(alu_pggen_tap_nand7),
			.y(alu_and7)
		);

	sm83_alu_cgen #(
			.L_cout0(94.21536),
			.L_cout1(147.0571),
			.L_cout2(163.9741),
			.L_cout3(2732.501)
		) alu_cgen_h_inst (
			.p0(prop4),
			.g0(gen4),
			.p1(prop5),
			.g1(gen5),
			.p2(prop6),
			.g2(gen6),
			.p3(prop7),
			.g3(gen7),
			.cin(res_carry3),
			.cout0(res_carry4),
			.cout1(res_carry5),
			.cout2(res_carry6),
			.cout3(res_carry7)
		);

	sm83_alu_cgen #(
			.L_cout0(160.1725),
			.L_cout1(70.01212),
			.L_cout2(84.0779),
			.L_cout3(1034.117)
		) alu_cgen_l_inst (
			.p0(prop0),
			.g0(gen0),
			.p1(prop1),
			.g1(gen1),
			.p2(prop2),
			.g2(gen2),
			.p3(prop3),
			.g3(gen3),
			.cin(carry_in),
			.cout0(res_carry0),
			.cout1(res_carry1),
			.cout2(res_carry2),
			.cout3(res_carry3)
		);

	sm83_alu_decoder #(
			.L_y1(103.5926),
			.L_y2(204.2707),
			.L_y3(343.9147),
			.L_y4(131.3439),
			.L_y5(109.0415),
			.L_y6(120.3195),
			.L_y7(108.2812),
			.L_y8(173.0344),
			.L_y9(108.3445),
			.L_y10(98.96736),
			.L_y11(145.0929),
			.L_y12(37.19193),
			.L_y13(465.8182),
			.L_y14(142.9388)
		) alu_decoder_inst (
			.in1(op1val0),
			.in2(flag_h),
			.in3(flag_h_n),
			.in4(flag_c),
			.in5(flag_c_n),
			.in6(op1val1),
			.in7(op1val2),
			.in8(op1val3),
			.in9(op1val4),
			.in10(flag_n),
			.in11(flag_n_n),
			.in12(op1val5),
			.in13(op1val6),
			.in14(op1val7),
			.in15(flag_z_n),
			.in16(flag_z),
			.in17(alu_pggen_tap_xor0),
			.in18(alu_pggen_tap_xor1),
			.in19(alu_pggen_tap_xor2),
			.in20(alu_pggen_tap_xor3),
			.in21(alu_pggen_tap_xor0),
			.in22(alu_pggen_tap_xor4),
			.in23(alu_pggen_tap_xor5),
			.in24(alu_pggen_tap_xor6),
			.in25(alu_pggen_tap_xor7),
			.in26(dec3_y1),
			.in27(dec3_y2),
			.in28(res_carry3),
			.in29(res_carry_n),
			.in30(res_hcarry_n),
			.in31(reg_z6),
			.in32(reg_z4),
			.in33(reg_z5),
			.in34(dec1_y28_buf),
			.in35(adr_clk_p),
			.in36(t4_clk_p),
			.in37(res_carry7),
			.in38(dec3_y11),
			.in39(dec1_y99_buf),
			.in40(dec3_ir0_n),
			.in41(dec2_y1),
			.in42(dec3_y28),
			.in43(ir5),
			.in44(dec3_ir5_n),
			.in45(ir4),
			.in46(dec3_ir4_n),
			.in47(ir3),
			.in48(dec3_ir3_n),
			.in49(dec2_y17),
			.in50(dec3_y12),
			.in51(dec2_y6),
			.in52(dec2_y7),
			.in53(res_zero),
			.in54(dec1_y47_buf),
			.in55(dec3_y22),
			.in56(dec3_y13),
			.in57(dec3_y23),
			.in58(dec3_y25),
			.in59(reg_z7),
			.in60(reg_oa1),
			.in61(dec3_y24),
			.in62(dec1_y4_buf),
			.in63(dec1_y36_buf),
			.in64(reg_oa2),
			.in65(dec1_y43),
			.in66(reg_and),
			.in67(dec3_y27),
			.in68(dec1_y59),
			.in69(dec3_y20),
			.y1(op1dec0_n),
			.y2(new_flag_h_n),
			.y3(new_flag_c_n),
			.y4(op1dec1_n),
			.y5(op1dec2_n),
			.y6(op1dec3_n),
			.y7(op1dec4_n),
			.y8(new_flag_n_n),
			.y9(op1dec5_n),
			.y10(op1dec6_n),
			.y11(op1dec7_n),
			.y12(alu_decoder_y12),
			.y13(new_flag_z_n),
			.y14(carry_in_n)
		);

	sm83_dffn_ee_q_alu_tmp #(
			.L_q(517.2026)
		) alu_dff_inst (
			.d(reg_z7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk_n(phi_clk_n),
			.q(alu_dff)
		);

	sm83_not_pch_x2_alu #(
			.L_in(103.5926),
			.L_y(336.5017)
		) alu_not1_inst (
			.pch_n(adr_clk_p),
			.in(op1dec0_n),
			.y(op1dec0)
		);

	sm83_not_pch_x2_alu #(
			.L_in(142.9388),
			.L_y(1063.551)
		) alu_not10_inst (
			.pch_n(adr_clk_p),
			.in(carry_in_n),
			.y(carry_in)
		);

	sm83_not_alu_a #(
			.L_y(372.2594)
		) alu_not11_inst (
			.in(res_carry3),
			.y(res_hcarry_n)
		);

	sm83_not_alu_b #(
			.L_y(527.9272)
		) alu_not12_inst (
			.in(res_carry7),
			.y(res_carry_n)
		);

	sm83_not_pch_x2_alu #(
			.L_in(131.3439),
			.L_y(363.9996)
		) alu_not2_inst (
			.pch_n(adr_clk_p),
			.in(op1dec1_n),
			.y(op1dec1)
		);

	sm83_not_pch_x2_alu #(
			.L_in(109.0415),
			.L_y(302.0342)
		) alu_not3_inst (
			.pch_n(adr_clk_p),
			.in(op1dec2_n),
			.y(op1dec2)
		);

	sm83_not_pch_x2_alu #(
			.L_in(120.3195),
			.L_y(319.268)
		) alu_not4_inst (
			.pch_n(adr_clk_p),
			.in(op1dec3_n),
			.y(op1dec3)
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.2812),
			.L_y(368.3715)
		) alu_not5_inst (
			.pch_n(adr_clk_p),
			.in(op1dec4_n),
			.y(op1dec4)
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.3445),
			.L_y(318.4442)
		) alu_not6_inst (
			.pch_n(adr_clk_p),
			.in(op1dec5_n),
			.y(op1dec5)
		);

	sm83_not_pch_x2_alu #(
			.L_in(98.96736),
			.L_y(370.2721)
		) alu_not7_inst (
			.pch_n(adr_clk_p),
			.in(op1dec6_n),
			.y(op1dec6)
		);

	sm83_not_pch_x2_alu #(
			.L_in(145.0929),
			.L_y(392.3214)
		) alu_not8_inst (
			.pch_n(adr_clk_p),
			.in(op1dec7_n),
			.y(op1dec7)
		);

	sm83_not_pch_x1_alu #(
			.L_in(37.19193),
			.L_y(1332.448)
		) alu_not9_inst (
			.pch_n(buke),
			.in(alu_decoder_y12),
			.y(alu_not9)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(101.1216),
			.L_tap_xor(169.3596),
			.L_tap_nand(89.59021),
			.L_tap_and(243.2367),
			.L_tap_or(244.2504),
			.L_y(186.1498)
		) alu_pggen0_inst (
			.xor_in1(op2val0),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec0),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift0),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor0),
			.tap_nand(alu_pggen_tap_nand0),
			.tap_and(gen0),
			.tap_or(prop0),
			.y(alu_pggen_y0)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(127.9859),
			.L_tap_xor(131.8509),
			.L_tap_nand(77.3618),
			.L_tap_and(198.2515),
			.L_tap_or(274.1561),
			.L_y(237.2808)
		) alu_pggen1_inst (
			.xor_in1(op2val1),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec1),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift1),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor1),
			.tap_nand(alu_pggen_tap_nand1),
			.tap_and(gen1),
			.tap_or(prop1),
			.y(alu_pggen_y1)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(149.9083),
			.L_tap_xor(183.0452),
			.L_tap_nand(118.6721),
			.L_tap_and(163.3405),
			.L_tap_or(225.2426),
			.L_y(296.5219)
		) alu_pggen2_inst (
			.xor_in1(op2val2),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec2),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift2),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor2),
			.tap_nand(alu_pggen_tap_nand2),
			.tap_and(gen2),
			.tap_or(prop2),
			.y(alu_pggen_y2)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(126.2119),
			.L_tap_xor(229.4243),
			.L_tap_nand(117.9118),
			.L_tap_and(187.8606),
			.L_tap_or(246.6581),
			.L_y(185.643)
		) alu_pggen3_inst (
			.xor_in1(op2val3),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec3),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift3),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor3),
			.tap_nand(alu_pggen_tap_nand3),
			.tap_and(gen3),
			.tap_or(prop3),
			.y(alu_pggen_y3)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(130.0134),
			.L_tap_xor(240.6388),
			.L_tap_nand(102.3887),
			.L_tap_and(200.0255),
			.L_tap_or(249.7626),
			.L_y(167.0153)
		) alu_pggen4_inst (
			.xor_in1(op2val4),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec4),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift4),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor4),
			.tap_nand(alu_pggen_tap_nand4),
			.tap_and(gen4),
			.tap_or(prop4),
			.y(alu_pggen_y4)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(140.9746),
			.L_tap_xor(165.4313),
			.L_tap_nand(90.47716),
			.L_tap_and(216.0555),
			.L_tap_or(264.4621),
			.L_y(266.8697)
		) alu_pggen5_inst (
			.xor_in1(op2val5),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec5),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift5),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor5),
			.tap_nand(alu_pggen_tap_nand5),
			.tap_and(gen5),
			.tap_or(prop5),
			.y(alu_pggen_y5)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(100.9315),
			.L_tap_xor(219.9204),
			.L_tap_nand(104.733),
			.L_tap_and(164.1641),
			.L_tap_or(232.4655),
			.L_y(278.0209)
		) alu_pggen6_inst (
			.xor_in1(op2val6),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec6),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift6),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor6),
			.tap_nand(alu_pggen_tap_nand6),
			.tap_and(gen6),
			.tap_or(prop6),
			.y(alu_pggen_y6)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(143.3189),
			.L_tap_xor(419.3757),
			.L_tap_nand(113.6033),
			.L_tap_and(181.5246),
			.L_tap_or(240.829),
			.L_y(164.4588)
		) alu_pggen7_inst (
			.xor_in1(op2val7),
			.xor_in2(dec3_y26),
			.and_or_in2(op1dec7),
			.ao221_in2(dec3_y20),
			.ao221_in3(dec3_y5),
			.ao221_in5_n(shift7),
			.pch_n(adr_clk_p),
			.tap_xor(alu_pggen_tap_xor7),
			.tap_nand(alu_pggen_tap_nand7),
			.tap_and(gen7),
			.tap_or(prop7),
			.y(alu_pggen_y7)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1448.148)
		) alu_result0_inst (
			.in1(alu_and0),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(carry_in),
			.in5(alu_pggen_y0),
			.y(res0)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1980.822)
		) alu_result1_inst (
			.in1(alu_and1),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry0),
			.in5(alu_pggen_y1),
			.y(res1)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1926.701)
		) alu_result2_inst (
			.in1(alu_and2),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry1),
			.in5(alu_pggen_y2),
			.y(res2)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1864.478)
		) alu_result3_inst (
			.in1(alu_and3),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry2),
			.in5(alu_pggen_y3),
			.y(res3)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1825.224)
		) alu_result4_inst (
			.in1(alu_and4),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry3),
			.in5(alu_pggen_y4),
			.y(res4)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1756.737)
		) alu_result5_inst (
			.in1(alu_and5),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry4),
			.in5(alu_pggen_y5),
			.y(res5)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1733.387)
		) alu_result6_inst (
			.in1(alu_and6),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry5),
			.in5(alu_pggen_y6),
			.y(res6)
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1700.332)
		) alu_result7_inst (
			.in1(alu_and7),
			.in2(dec3_y19),
			.in3(dec3_y4),
			.in4(res_carry6),
			.in5(alu_pggen_y7),
			.y(res7)
		);

	sm83_alu_shifter #(
			.L_y0(101.1216),
			.L_y1(127.9859),
			.L_y2(149.9083),
			.L_y3(126.2119),
			.L_y4(130.0134),
			.L_y5(140.9746),
			.L_y6(100.9315),
			.L_y7(143.3189)
		) alu_shifter_inst (
			.ena(adr_clk_p),
			.l(dec3_y1),
			.r(dec3_y2),
			.rl(dec3_y7),
			.rr(dec3_y9),
			.rlc(dec3_y6),
			.rrc(dec3_y8),
			.sra(dec3_y10),
			.swap(dec3_y17),
			.c(flag_c),
			.d0(op2val0),
			.d1(op2val1),
			.d2(op2val2),
			.d3(op2val3),
			.d4(op2val4),
			.d5(op2val5),
			.d6(op2val6),
			.d7(op2val7),
			.y0(shift0),
			.y1(shift1),
			.y2(shift2),
			.y3(shift3),
			.y4(shift4),
			.y5(shift5),
			.y6(shift6),
			.y7(shift7)
		);

	sm83_nor8_alu #(
			.L_y(662.8661)
		) alu_zgen_inst (
			.in1(res7),
			.in2(res6),
			.in3(res5),
			.in4(res4),
			.in5(res3),
			.in6(res2),
			.in7(res1),
			.in8(res0),
			.y(res_zero)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(2837.112),
			.L_b(1679.525)
		) dbus_bridge0_inst (
			.a(db0),
			.b(d0),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res0),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(2962.755),
			.L_b(1731.002)
		) dbus_bridge1_inst (
			.a(db1),
			.b(d1),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res1),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3090.547),
			.L_b(1782.006)
		) dbus_bridge2_inst (
			.a(db2),
			.b(d2),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res2),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3215.205),
			.L_b(1832.241)
		) dbus_bridge3_inst (
			.a(db3),
			.b(d3),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res3),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3346.099),
			.L_b(1883.835)
		) dbus_bridge4_inst (
			.a(db4),
			.b(d4),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res4),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3460.447),
			.L_b(1935.394)
		) dbus_bridge5_inst (
			.a(db5),
			.b(d5),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res5),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3577.412),
			.L_b(1986.58)
		) dbus_bridge6_inst (
			.a(db6),
			.b(d6),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res6),
			.inj_en(dec3_y38)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(3700.271),
			.L_b(2042.786)
		) dbus_bridge7_inst (
			.a(db7),
			.b(d7),
			.oe_n(unor),
			.pch_n(adr_clk_p),
			.inj_d(res7),
			.inj_en(dec3_y38)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(2837.112)
		) dbus_nand0_inst (
			.in1(dec3_y16),
			.in2(op2val0_n),
			.y(db0)
		);

	sm83_nand2_od_b_dbus #(
			.L_y(2962.755)
		) dbus_nand1_inst (
			.in1(dec3_y16),
			.in2(op2val1_n),
			.y(db1)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(3090.547)
		) dbus_nand2_inst (
			.in1(dec3_y16),
			.in2(op2val2_n),
			.y(db2)
		);

	sm83_nand2_od_b_dbus #(
			.L_y(3215.205)
		) dbus_nand3_inst (
			.in1(dec3_y16),
			.in2(op2val3_n),
			.y(db3)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(3346.099)
		) dbus_nand4_inst (
			.in1(dec3_y16),
			.in2(op2val4_n),
			.y(db4)
		);

	sm83_nand2_od_b_dbus #(
			.L_y(3460.447)
		) dbus_nand5_inst (
			.in1(dec3_y16),
			.in2(op2val5_n),
			.y(db5)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(3577.412)
		) dbus_nand6_inst (
			.in1(dec3_y16),
			.in2(op2val6_n),
			.y(db6)
		);

	sm83_nand2_od_b_dbus #(
			.L_y(3700.271)
		) dbus_nand7_inst (
			.in1(dec3_y16),
			.in2(op2val7_n),
			.y(db7)
		);

	sm83_not_dbus #(
			.L_y(91.74437)
		) dbus_not0_inst (
			.in(op2val0),
			.y(op2val0_n)
		);

	sm83_not_dbus #(
			.L_y(88.38638)
		) dbus_not1_inst (
			.in(op2val1),
			.y(op2val1_n)
		);

	sm83_not_dbus #(
			.L_y(84.58473)
		) dbus_not2_inst (
			.in(op2val2),
			.y(op2val2_n)
		);

	sm83_not_dbus #(
			.L_y(80.71982)
		) dbus_not3_inst (
			.in(op2val3),
			.y(op2val3_n)
		);

	sm83_not_dbus #(
			.L_y(77.36179)
		) dbus_not4_inst (
			.in(op2val4),
			.y(op2val4_n)
		);

	sm83_not_dbus #(
			.L_y(74.06711)
		) dbus_not5_inst (
			.in(op2val5),
			.y(op2val5_n)
		);

	sm83_not_dbus #(
			.L_y(71.08923)
		) dbus_not6_inst (
			.in(op2val6),
			.y(op2val6_n)
		);

	sm83_not_dbus #(
			.L_y(66.654)
		) dbus_not7_inst (
			.in(op2val7),
			.y(op2val7_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(25.15366),
			.L_a_y(133.6882),
			.L_b_in(24.01319),
			.L_b_y(139.6459)
		) dec1_not1_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y1_n),
			.a_y(dec1_y1),
			.b_in(dec1_y2_n),
			.b_y(dec1_y2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.5201),
			.L_a_y(143.1289),
			.L_b_in(24.39338),
			.L_b_y(118.9889)
		) dec1_not10_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y20_n),
			.a_y(dec1_y20),
			.b_in(dec1_y19_n),
			.b_y(dec1_y19)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77352),
			.L_a_y(112.9697),
			.L_b_in(24.4567),
			.L_b_y(73.81369)
		) dec1_not11_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y21_n),
			.a_y(dec1_y21),
			.b_in(dec1_y22_n),
			.b_y(dec1_y22)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333),
			.L_a_y(108.5346),
			.L_b_in(24.64675),
			.L_b_y(119.3057)
		) dec1_not12_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y24_n),
			.a_y(dec1_y24),
			.b_in(dec1_y23_n),
			.b_y(dec1_y23)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94989),
			.L_a_y(100.3612),
			.L_b_in(23.82309),
			.L_b_y(371.0325)
		) dec1_not13_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y25_n),
			.a_y(dec1_y25),
			.b_in(dec1_y26_n),
			.b_y(dec1_y26)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333),
			.L_a_y(149.2746),
			.L_b_in(24.13991),
			.L_b_y(281.3156)
		) dec1_not14_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y28_n),
			.a_y(dec1_y28),
			.b_in(dec1_y27_n),
			.b_y(dec1_y27)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658),
			.L_a_y(232.0854),
			.L_b_in(24.20326),
			.L_b_y(117.3415)
		) dec1_not15_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y29_n),
			.a_y(dec1_y29),
			.b_in(dec1_y30_n),
			.b_y(dec1_y30)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52005),
			.L_a_y(108.9781),
			.L_b_in(24.45675),
			.L_b_y(110.7522)
		) dec1_not16_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y32_n),
			.a_y(dec1_y32),
			.b_in(dec1_y31_n),
			.b_y(dec1_y31)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71014),
			.L_a_y(82.11371),
			.L_b_in(23.82312),
			.L_b_y(115.3141)
		) dec1_not17_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y33_n),
			.a_y(dec1_y33),
			.b_in(dec1_y34_n),
			.b_y(dec1_y34)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88649),
			.L_a_y(144.4594),
			.L_b_in(24.01316),
			.L_b_y(409.7453)
		) dec1_not18_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y36_n),
			.a_y(dec1_y36),
			.b_in(dec1_y35_n),
			.b_y(dec1_y35)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993),
			.L_a_y(115.5042),
			.L_b_in(24.07649),
			.L_b_y(118.482)
		) dec1_not19_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y37_n),
			.a_y(dec1_y37),
			.b_in(dec1_y38_n),
			.b_y(dec1_y38)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45675),
			.L_a_y(150.594),
			.L_b_in(26.16745),
			.L_b_y(60.19141)
		) dec1_not2_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y4_n),
			.a_y(dec1_y4),
			.b_in(dec1_y3_n),
			.b_y(dec1_y3)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993),
			.L_a_y(115.2507),
			.L_b_in(24.07658),
			.L_b_y(783.8822)
		) dec1_not20_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y40_n),
			.a_y(dec1_y40),
			.b_in(dec1_y39_n),
			.b_y(dec1_y39)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01321),
			.L_a_y(108.5979),
			.L_b_in(24.4567),
			.L_b_y(584.1736)
		) dec1_not21_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y41_n),
			.a_y(dec1_y41),
			.b_in(dec1_y42_n),
			.b_y(dec1_y42)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.2667),
			.L_a_y(107.9644),
			.L_b_in(23.75979),
			.L_b_y(1275.108)
		) dec1_not22_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y44_n),
			.a_y(dec1_y44),
			.b_in(dec1_y43_n),
			.b_y(dec1_y43)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64684),
			.L_a_y(108.3445),
			.L_b_in(23.82312),
			.L_b_y(108.9781)
		) dec1_not23_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y45_n),
			.a_y(dec1_y45),
			.b_in(dec1_y46_n),
			.b_y(dec1_y46)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52015),
			.L_a_y(101.2483),
			.L_b_in(24.71022),
			.L_b_y(156.3076)
		) dec1_not24_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y48_n),
			.a_y(dec1_y48),
			.b_in(dec1_y47_n),
			.b_y(dec1_y47)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64675),
			.L_a_y(591.2065),
			.L_b_in(24.07658),
			.L_b_y(659.9194)
		) dec1_not25_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y49_n),
			.a_y(dec1_y49),
			.b_in(dec1_y50_n),
			.b_y(dec1_y50)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39328),
			.L_a_y(108.788),
			.L_b_in(24.39333),
			.L_b_y(153.9634)
		) dec1_not26_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y52_n),
			.a_y(dec1_y52),
			.b_in(dec1_y51_n),
			.b_y(dec1_y51)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019),
			.L_a_y(108.7247),
			.L_b_in(23.56972),
			.L_b_y(101.5651)
		) dec1_not27_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y53_n),
			.a_y(dec1_y53),
			.b_in(dec1_y54_n),
			.b_y(dec1_y54)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.0911),
			.L_b_in(24.33),
			.L_b_y(101.4383)
		) dec1_not28_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y56_n),
			.a_y(dec1_y56),
			.b_in(dec1_y55_n),
			.b_y(dec1_y55)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71022),
			.L_a_y(106.7761),
			.L_b_in(24.45677),
			.L_b_y(107.3308)
		) dec1_not29_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y57_n),
			.a_y(dec1_y57),
			.b_in(dec1_y58_n),
			.b_y(dec1_y58)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.20333),
			.L_a_y(65.45065),
			.L_b_in(24.5201),
			.L_b_y(77.36177)
		) dec1_not3_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y5_n),
			.a_y(dec1_y5),
			.b_in(dec1_y6_n),
			.b_y(dec1_y6)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33007),
			.L_a_y(94.78561),
			.L_b_in(24.77357),
			.L_b_y(1735.794)
		) dec1_not30_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y60_n),
			.a_y(dec1_y60),
			.b_in(dec1_y59_n),
			.b_y(dec1_y59)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.4567),
			.L_a_y(3036.742),
			.L_b_in(23.63305),
			.L_b_y(122.2203)
		) dec1_not31_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y61_n),
			.a_y(dec1_y61),
			.b_in(dec1_y62_n),
			.b_y(dec1_y62)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.69642),
			.L_a_y(108.9782),
			.L_b_in(24.7101),
			.L_b_y(572.7054)
		) dec1_not32_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y64_n),
			.a_y(dec1_y64),
			.b_in(dec1_y63_n),
			.b_y(dec1_y63)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01324),
			.L_a_y(539.9492),
			.L_b_in(23.94979),
			.L_b_y(119.1156)
		) dec1_not33_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y65_n),
			.a_y(dec1_y65),
			.b_in(dec1_y66_n),
			.b_y(dec1_y66)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996),
			.L_a_y(112.3995),
			.L_b_in(23.6964),
			.L_b_y(2022.321)
		) dec1_not34_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y68_n),
			.a_y(dec1_y68),
			.b_in(dec1_y67_n),
			.b_y(dec1_y67)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33),
			.L_a_y(102.8956),
			.L_b_in(23.94984),
			.L_b_y(113.2866)
		) dec1_not35_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y69_n),
			.a_y(dec1_y69),
			.b_in(dec1_y70_n),
			.b_y(dec1_y70)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.82312),
			.L_a_y(88.0062),
			.L_b_in(24.39335),
			.L_b_y(113.7935)
		) dec1_not36_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y72_n),
			.a_y(dec1_y72),
			.b_in(dec1_y71_n),
			.b_y(dec1_y71)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64682),
			.L_a_y(111.2591),
			.L_b_in(23.75979),
			.L_b_y(127.6691)
		) dec1_not37_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y73_n),
			.a_y(dec1_y73),
			.b_in(dec1_y74_n),
			.b_y(dec1_y74)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63307),
			.L_a_y(115.8209),
			.L_b_in(24.52012),
			.L_b_y(125.5149)
		) dec1_not38_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y76_n),
			.a_y(dec1_y76),
			.b_in(dec1_y75_n),
			.b_y(dec1_y75)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13988),
			.L_a_y(115.3141),
			.L_b_in(23.69642),
			.L_b_y(125.4516)
		) dec1_not39_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y77_n),
			.a_y(dec1_y77),
			.b_in(dec1_y78_n),
			.b_y(dec1_y78)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.96356),
			.L_a_y(74.58278),
			.L_b_in(24.3934),
			.L_b_y(75.71906)
		) dec1_not4_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y8_n),
			.a_y(dec1_y8),
			.b_in(dec1_y7_n),
			.b_y(dec1_y7)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.14001),
			.L_a_y(108.4713),
			.L_b_in(24.64677),
			.L_b_y(115.2507)
		) dec1_not40_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y80_n),
			.a_y(dec1_y80),
			.b_in(dec1_y79_n),
			.b_y(dec1_y79)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.1545),
			.L_b_in(24.2033),
			.L_b_y(617.0791)
		) dec1_not41_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y81_n),
			.a_y(dec1_y81),
			.b_in(dec1_y82_n),
			.b_y(dec1_y82)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88644),
			.L_a_y(356.7767),
			.L_b_in(24.64684),
			.L_b_y(119.4325)
		) dec1_not42_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y84_n),
			.a_y(dec1_y84),
			.b_in(dec1_y83_n),
			.b_y(dec1_y83)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26668),
			.L_a_y(113.4768),
			.L_b_in(23.94979),
			.L_b_y(125.8951)
		) dec1_not43_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y85_n),
			.a_y(dec1_y85),
			.b_in(dec1_y86_n),
			.b_y(dec1_y86)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.5346),
			.L_b_in(23.94991),
			.L_b_y(115.7575)
		) dec1_not44_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y88_n),
			.a_y(dec1_y88),
			.b_in(dec1_y87_n),
			.b_y(dec1_y87)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.58345),
			.L_a_y(962.1758),
			.L_b_in(23.94981),
			.L_b_y(119.8126)
		) dec1_not45_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y89_n),
			.a_y(dec1_y89),
			.b_in(dec1_y90_n),
			.b_y(dec1_y90)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658),
			.L_a_y(108.8514),
			.L_b_in(24.26665),
			.L_b_y(112.2095)
		) dec1_not46_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y92_n),
			.a_y(dec1_y92),
			.b_in(dec1_y91_n),
			.b_y(dec1_y91)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45668),
			.L_a_y(1867.543),
			.L_b_in(23.633),
			.L_b_y(2068.43)
		) dec1_not47_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y93_n),
			.a_y(dec1_y93),
			.b_in(dec1_y94_n),
			.b_y(dec1_y94)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63312),
			.L_a_y(101.8819),
			.L_b_in(24.01319),
			.L_b_y(118.4187)
		) dec1_not48_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y96_n),
			.a_y(dec1_y96),
			.b_in(dec1_y95_n),
			.b_y(dec1_y95)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77349),
			.L_a_y(108.4713),
			.L_b_in(24.20335),
			.L_b_y(112.4629)
		) dec1_not49_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y97_n),
			.a_y(dec1_y97),
			.b_in(dec1_y98_n),
			.b_y(dec1_y98)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019),
			.L_a_y(993.0952),
			.L_b_in(24.07656),
			.L_b_y(118.6721)
		) dec1_not5_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y9_n),
			.a_y(dec1_y9),
			.b_in(dec1_y10_n),
			.b_y(dec1_y10)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996),
			.L_a_y(891.7831),
			.L_b_in(24.83691),
			.L_b_y(160.5532)
		) dec1_not50_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y100_n),
			.a_y(dec1_y100),
			.b_in(dec1_y99_n),
			.b_y(dec1_y99)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13986),
			.L_a_y(688.7168),
			.L_b_in(24.01316),
			.L_b_y(582.8429)
		) dec1_not51_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y101_n),
			.a_y(dec1_y101),
			.b_in(dec1_y102_n),
			.b_y(dec1_y102)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.75977),
			.L_a_y(844.9982),
			.L_b_in(25.15368),
			.L_b_y(999.8112)
		) dec1_not52_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y104_n),
			.a_y(dec1_y104),
			.b_in(dec1_y103_n),
			.b_y(dec1_y103)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71021),
			.L_a_y(106.5705),
			.L_b_in(23.94986),
			.L_b_y(117.6584)
		) dec1_not53_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y105_n),
			.a_y(dec1_y105),
			.b_in(dec1_y106_n),
			.b_y(dec1_y106)
		);

	sm83_not_pch_dec1 #(
			.L_in(24.77352),
			.L_y(120.8264)
		) dec1_not54_inst (
			.pch_n(adr_clk_p),
			.in(dec1_y107_n),
			.y(dec1_y107)
		);

	sm83_not_dec1 #(
			.L_y(733.8287)
		) dec1_not55_inst (
			.in(xygb_n),
			.y(xygb_buf)
		);

	sm83_not_dec1 #(
			.L_y(775.2661)
		) dec1_not56_inst (
			.in(xygb),
			.y(xygb_n)
		);

	sm83_not_dec1 #(
			.L_y(733.8287)
		) dec1_not57_inst (
			.in(ir7),
			.y(dec1_ir7_n)
		);

	sm83_not_dec1 #(
			.L_y(735.9197)
		) dec1_not58_inst (
			.in(ir6),
			.y(dec1_ir6_n)
		);

	sm83_not_dec1 #(
			.L_y(733.7653)
		) dec1_not59_inst (
			.in(ir5),
			.y(dec1_ir5_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689),
			.L_a_y(115.1874),
			.L_b_in(24.83689),
			.L_b_y(118.2286)
		) dec1_not6_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y12_n),
			.a_y(dec1_y12),
			.b_in(dec1_y11_n),
			.b_y(dec1_y11)
		);

	sm83_not_dec1 #(
			.L_y(736.1731)
		) dec1_not60_inst (
			.in(ir4),
			.y(dec1_ir4_n)
		);

	sm83_not_dec1 #(
			.L_y(733.7656)
		) dec1_not61_inst (
			.in(ir3),
			.y(dec1_ir3_n)
		);

	sm83_not_dec1 #(
			.L_y(736.0464)
		) dec1_not62_inst (
			.in(ir2),
			.y(dec1_ir2_n)
		);

	sm83_not_dec1 #(
			.L_y(733.5754)
		) dec1_not63_inst (
			.in(ir1),
			.y(dec1_ir1_n)
		);

	sm83_not_dec1 #(
			.L_y(736.1732)
		) dec1_not64_inst (
			.in(ir0),
			.y(dec1_ir0_n)
		);

	sm83_not_dec1 #(
			.L_y(1682.992)
		) dec1_not65_inst (
			.in(xtip),
			.y(xtip_n)
		);

	sm83_not_dec1 #(
			.L_y(807.4094)
		) dec1_not66_inst (
			.in(xtip_n),
			.y(xtip_buf)
		);

	sm83_not_dec1 #(
			.L_y(783.7559)
		) dec1_not67_inst (
			.in(xufu),
			.y(xufu_n)
		);

	sm83_not_dec1 #(
			.L_y(898.4247)
		) dec1_not68_inst (
			.in(xufu_n),
			.y(xufu_buf)
		);

	sm83_not_dec1 #(
			.L_y(790.6622)
		) dec1_not69_inst (
			.in(xirf),
			.y(xirf_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689),
			.L_a_y(115.8209),
			.L_b_in(23.82316),
			.L_b_y(122.7271)
		) dec1_not7_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y13_n),
			.a_y(dec1_y13),
			.b_in(dec1_y14_n),
			.b_y(dec1_y14)
		);

	sm83_not_dec1 #(
			.L_y(760.7565)
		) dec1_not70_inst (
			.in(xirf_n),
			.y(xirf_buf)
		);

	sm83_not_dec1 #(
			.L_y(797.5051)
		) dec1_not71_inst (
			.in(xaym),
			.y(xaym_n)
		);

	sm83_not_dec1 #(
			.L_y(767.8528)
		) dec1_not72_inst (
			.in(xaym_n),
			.y(xaym_buf)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39335),
			.L_a_y(110.7522),
			.L_b_in(24.71017),
			.L_b_y(910.1583)
		) dec1_not8_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y16_n),
			.a_y(dec1_y16),
			.b_in(dec1_y15_n),
			.b_y(dec1_y15)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26658),
			.L_a_y(110.1186),
			.L_b_in(24.26668),
			.L_b_y(118.482)
		) dec1_not9_inst (
			.pch_n(adr_clk_p),
			.a_in(dec1_y17_n),
			.a_y(dec1_y17),
			.b_in(dec1_y18_n),
			.b_y(dec1_y18)
		);

	sm83_buf_dec2 #(
			.L_y(2194.763)
		) dec2_buf1_inst (
			.in(dec1_y104),
			.y(dec1_y104_buf)
		);

	sm83_buf_dec2 #(
			.L_y(2840.086)
		) dec2_buf2_inst (
			.in(dec1_y4),
			.y(dec1_y4_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3240.817)
		) dec2_buf3_inst (
			.in(dec1_y20),
			.y(dec1_y20_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1319.713)
		) dec2_buf4_inst (
			.in(dec1_y28),
			.y(dec1_y28_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3914.644)
		) dec2_buf5_inst (
			.in(dec1_y36),
			.y(dec1_y36_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3451.25)
		) dec2_buf6_inst (
			.in(dec1_y47),
			.y(dec1_y47_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1653.807)
		) dec2_buf7_inst (
			.in(dec1_y51),
			.y(dec1_y51_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1441.553)
		) dec2_buf8_inst (
			.in(dec1_y99),
			.y(dec1_y99_buf)
		);

	sm83_not_x1_dec2 #(
			.L_y(449.6616)
		) dec2_not1_inst (
			.in(dec2_y1_n),
			.y(dec2_y1)
		);

	sm83_not_x1_dec2 #(
			.L_y(724.4951)
		) dec2_not10_inst (
			.in(dec2_y9_n),
			.y(dec2_y9)
		);

	sm83_not_x1_dec2 #(
			.L_y(422.2905)
		) dec2_not11_inst (
			.in(dec2_y10_n),
			.y(dec2_y10)
		);

	sm83_not_x1_dec2 #(
			.L_y(790.9789)
		) dec2_not12_inst (
			.in(dec2_y11_n),
			.y(dec2_y11)
		);

	sm83_not_x1_dec2 #(
			.L_y(3157.203)
		) dec2_not13_inst (
			.in(dec2_y12_n),
			.y(dec2_y12)
		);

	sm83_not_x1_dec2 #(
			.L_y(1146.868)
		) dec2_not14_inst (
			.in(dec2_y13_n),
			.y(dec2_y13)
		);

	sm83_not_x1_dec2 #(
			.L_y(737.7572)
		) dec2_not15_inst (
			.in(dec2_y14_n),
			.y(dec2_y14)
		);

	sm83_not_x1_dec2 #(
			.L_y(261.9276)
		) dec2_not16_inst (
			.in(dec2_y15_n),
			.y(dec2_y15)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(2449.284)
		) dec2_not17_inst (
			.in(dec2_y16_n),
			.y(dec2_y16)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1463.207)
		) dec2_not18_inst (
			.in(dec2_y17_n),
			.y(dec2_y17)
		);

	sm83_not_x1_dec2 #(
			.L_y(1871.129)
		) dec2_not19_inst (
			.in(dec2_y18_n),
			.y(dec2_y18)
		);

	sm83_not_x1_dec2 #(
			.L_y(1286.548)
		) dec2_not2_inst (
			.in(dec2_y2_n),
			.y(dec2_y2)
		);

	sm83_not_x1_dec2 #(
			.L_y(3671.805)
		) dec2_not20_inst (
			.in(dec2_y19_n),
			.y(m1)
		);

	sm83_not_x1_pch_dec2 #(
			.L_in(117.9752),
			.L_y(628.6649)
		) dec2_not21_inst (
			.pch_n(adr_clk_p),
			.in(dec2_y20_n),
			.y(dec2_y20)
		);

	sm83_not_x1_dec2 #(
			.L_y(1763.355)
		) dec2_not22_inst (
			.in(dec2_y21_n),
			.y(dec2_y21)
		);

	sm83_not_x1_dec2 #(
			.L_y(2388.254)
		) dec2_not23_inst (
			.in(dec2_y22_n),
			.y(dec2_y22)
		);

	sm83_not_x1_dec2 #(
			.L_y(399.1641)
		) dec2_not24_inst (
			.in(dec2_y23_n),
			.y(dec2_y23)
		);

	sm83_not_x1_dec2 #(
			.L_y(821.8345)
		) dec2_not25_inst (
			.in(dec2_y24_n),
			.y(dec2_y24)
		);

	sm83_not_x1_dec2 #(
			.L_y(410.4431)
		) dec2_not26_inst (
			.in(dec2_y25_n),
			.y(dec2_y25)
		);

	sm83_not_x1_dec2 #(
			.L_y(385.5424)
		) dec2_not27_inst (
			.in(dec2_y26_n),
			.y(dec2_y26)
		);

	sm83_not_x1_dec2 #(
			.L_y(1697.145)
		) dec2_not28_inst (
			.in(dec2_y27_n),
			.y(dec2_y27)
		);

	sm83_not_x1_dec2 #(
			.L_y(805.9323)
		) dec2_not29_inst (
			.in(dec2_y28_n),
			.y(dec2_y28)
		);

	sm83_not_x1_dec2 #(
			.L_y(516.9491)
		) dec2_not3_inst (
			.in(dec2_y3_n),
			.y(dec2_y3)
		);

	sm83_not_x1_dec2 #(
			.L_y(2425.271)
		) dec2_not30_inst (
			.in(dec2_y29_n),
			.y(dec2_y29)
		);

	sm83_not_x1_dec2 #(
			.L_y(1099.159)
		) dec2_not31_inst (
			.in(dec2_y30_n),
			.y(dec2_y30)
		);

	sm83_not_x1_dec2 #(
			.L_y(866.6298)
		) dec2_not4_inst (
			.in(dec2_y4_n),
			.y(dec2_y4)
		);

	sm83_not_x1_dec2 #(
			.L_y(2644.494)
		) dec2_not5_inst (
			.in(ctl_mwrite_n),
			.y(ctl_mwrite)
		);

	sm83_not_x2_dec2 #(
			.L_y(312.1717)
		) dec2_not6_inst (
			.in(ir7),
			.y(spare_ir7_n)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(3106.067)
		) dec2_not7_inst (
			.in(dec2_y7_n),
			.y(dec2_y7)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1466.136)
		) dec2_not8_inst (
			.in(dec2_y6_n),
			.y(dec2_y6)
		);

	sm83_not_x1_dec2 #(
			.L_y(803.7144)
		) dec2_not9_inst (
			.in(dec2_y8_n),
			.y(dec2_y8)
		);

	sm83_pch_dec2_a #(
			.L_y(128.7463)
		) dec2_pch1_inst (
			.pch_n(adr_clk_p),
			.y(dec2_y6_n)
		);

	sm83_pch_dec2_c #(
			.L_y(87.11906)
		) dec2_pch2_inst (
			.pch_n(adr_clk_p),
			.y(dec2_y10_n)
		);

	sm83_pch_dec2_c #(
			.L_y(73.30678)
		) dec2_pch3_inst (
			.pch_n(adr_clk_p),
			.y(dec2_y11_n)
		);

	sm83_pch_dec2_b #(
			.L_y(135.9692)
		) dec2_pch4_inst (
			.pch_n(adr_clk_p),
			.y(dec2_y17_n)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(72.16634),
			.L_y(1356.144)
		) dec3_nor1_inst (
			.pch_n(adr_clk_p),
			.in1(dec3_y56_n),
			.in2(t4_clk_n),
			.y(dec3_nor1)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(183.4254),
			.L_y(1387.824)
		) dec3_nor2_inst (
			.pch_n(adr_clk_p),
			.in1(dec3_y58_n),
			.in2(dec3_not68),
			.y(dec3_nor2)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.93494),
			.L_y(1022.494)
		) dec3_not1_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y1_n),
			.y(dec3_y1)
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.20518),
			.L_y(568.7138)
		) dec3_not10_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y10_n),
			.y(dec3_y10)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.2998),
			.L_y(836.1541)
		) dec3_not11_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y11_n),
			.y(dec3_y11)
		);

	sm83_not_pch_dec3_a #(
			.L_in(119.4324),
			.L_y(641.3873)
		) dec3_not12_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y12_n),
			.y(dec3_y12)
		);

	sm83_not_pch_dec3_a #(
			.L_in(114.8705),
			.L_y(739.8479)
		) dec3_not13_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y13_n),
			.y(dec3_y13)
		);

	sm83_not_pch_dec3_a #(
			.L_in(198.9485),
			.L_y(529.8747)
		) dec3_not14_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y14_n),
			.y(dec3_y14)
		);

	sm83_not_pch_dec3_a #(
			.L_in(177.6597),
			.L_y(818.6035)
		) dec3_not15_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y15_n),
			.y(dec3_y15)
		);

	sm83_not_pch_dec3_b #(
			.L_in(185.5796),
			.L_y(1632.328)
		) dec3_not16_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y16_n),
			.y(dec3_y16)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.74487),
			.L_y(1024.712)
		) dec3_not17_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y17_n),
			.y(dec3_y17)
		);

	sm83_not_pch_dec3_a #(
			.L_in(53.72878),
			.L_y(352.591)
		) dec3_not18_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y18_n),
			.y(dec3_y18)
		);

	sm83_not_pch_dec3_a #(
			.L_in(65.64032),
			.L_y(1313.319)
		) dec3_not19_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y19_n),
			.y(dec3_y19)
		);

	sm83_not_pch_dec3_a #(
			.L_in(50.81425),
			.L_y(1098.715)
		) dec3_not2_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y2_n),
			.y(dec3_y2)
		);

	sm83_not_pch_dec3_a #(
			.L_in(171.007),
			.L_y(1668.44)
		) dec3_not20_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y20_n),
			.y(dec3_y20)
		);

	sm83_not_pch_dec3_a #(
			.L_in(143.8892),
			.L_y(346.0118)
		) dec3_not21_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y21_n),
			.y(dec3_y21)
		);

	sm83_not_pch_dec3_a #(
			.L_in(52.39824),
			.L_y(791.6124)
		) dec3_not22_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y22_n),
			.y(dec3_y22)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.15852),
			.L_y(1072.675)
		) dec3_not23_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y23_n),
			.y(dec3_y23)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(63.35942),
			.L_y(507.1284)
		) dec3_not24_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y24_n),
			.y(dec3_y24)
		);

	sm83_not_pch_dec3_a #(
			.L_in(75.01752),
			.L_y(572.8328)
		) dec3_not25_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y25_n),
			.y(dec3_y25)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.53),
			.L_y(1360.96)
		) dec3_not26_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y26_n),
			.y(dec3_y26)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.71207),
			.L_y(991.5748)
		) dec3_not27_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y27_n),
			.y(dec3_y27)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.58532),
			.L_y(488.3742)
		) dec3_not28_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y28_n),
			.y(dec3_y28)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(132.1676),
			.L_y(961.7956)
		) dec3_not29_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y29_n),
			.y(dec3_y29)
		);

	sm83_not_pch_dec3_a #(
			.L_in(74.63734),
			.L_y(203.7004)
		) dec3_not3_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y3_n),
			.y(dec3_y3)
		);

	sm83_not_pch_dec3_b #(
			.L_in(152.8862),
			.L_y(1111.134)
		) dec3_not30_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y30_n),
			.y(dec3_y30)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(90.54046),
			.L_y(515.8725)
		) dec3_not31_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y31_n),
			.y(dec3_y31)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.90703),
			.L_y(511.4374)
		) dec3_not32_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y32_n),
			.y(dec3_y32)
		);

	sm83_not_pch_dec3_a #(
			.L_in(88.06954),
			.L_y(358.6774)
		) dec3_not33_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y33_n),
			.y(dec3_y33)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.03177),
			.L_y(919.2179)
		) dec3_not34_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y34_n),
			.y(dec3_y34)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(190.9019),
			.L_y(480.8344)
		) dec3_not35_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y35_n),
			.y(dec3_y35)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(184.4392),
			.L_y(1651.907)
		) dec3_not36_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y36_n),
			.y(dec3_y36)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(112.9697),
			.L_y(389.0099)
		) dec3_not37_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y37_n),
			.y(dec3_y37)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(167.2054),
			.L_y(1567.005)
		) dec3_not38_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y38_n),
			.y(dec3_y38)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(279.7949),
			.L_y(1854.719)
		) dec3_not39_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y39_n),
			.y(dec3_y39)
		);

	sm83_not_pch_dec3_a #(
			.L_in(127.7959),
			.L_y(1194.895)
		) dec3_not4_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y4_n),
			.y(dec3_y4)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(170.6268),
			.L_y(1573.341)
		) dec3_not40_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y40_n),
			.y(dec3_y40)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(180.7643),
			.L_y(1821.899)
		) dec3_not41_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y41_n),
			.y(dec3_y41)
		);

	sm83_not_pch_dec3_a #(
			.L_in(78.37552),
			.L_y(1076.646)
		) dec3_not42_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y42_n),
			.y(dec3_y42)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.1959),
			.L_y(1684.031)
		) dec3_not43_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y43_n),
			.y(dec3_y43)
		);

	sm83_not_pch_dec3_a #(
			.L_in(184.4938),
			.L_y(1636.573)
		) dec3_not44_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y44_n),
			.y(dec3_y44)
		);

	sm83_not_pch_dec3_a #(
			.L_in(178.42),
			.L_y(1716.154)
		) dec3_not45_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y45_n),
			.y(dec3_y45)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.7169),
			.L_y(1570.806)
		) dec3_not46_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y46_n),
			.y(dec3_y46)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.0237),
			.L_y(1573.404)
		) dec3_not47_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y47_n),
			.y(dec3_y47)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(182.1582),
			.L_y(1599.255)
		) dec3_not48_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y48_n),
			.y(dec3_y48)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.8276),
			.L_y(1578.536)
		) dec3_not49_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y49_n),
			.y(dec3_y49)
		);

	sm83_not_pch_dec3_a #(
			.L_in(207.7554),
			.L_y(1009.76)
		) dec3_not5_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y5_n),
			.y(dec3_y5)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.0811),
			.L_y(1512.452)
		) dec3_not50_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y50_n),
			.y(dec3_y50)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.9047),
			.L_y(1648.549)
		) dec3_not51_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y51_n),
			.y(dec3_y51)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.5109),
			.L_y(1555.093)
		) dec3_not52_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y52_n),
			.y(dec3_y52)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.86031),
			.L_y(1531.65)
		) dec3_not53_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y53_n),
			.y(dec3_y53)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(181.2712),
			.L_y(1539.126)
		) dec3_not54_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y54_n),
			.y(dec3_y54)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(194.1331),
			.L_y(1562.76)
		) dec3_not55_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y55_n),
			.y(dec3_y55)
		);

	sm83_not_pch_dec3_b #(
			.L_in(81.16339),
			.L_y(1372.174)
		) dec3_not56_inst (
			.pch_n(phi_clk_n),
			.in(dec3_y57_n),
			.y(dec3_y57)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(179.4971),
			.L_y(1530.184)
		) dec3_not57_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y59_n),
			.y(dec3_y59)
		);

	sm83_not_pch_dec3_a #(
			.L_in(123.8042),
			.L_y(1390.549)
		) dec3_not58_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y60_n),
			.y(dec3_y60)
		);

	sm83_not_pch_dec3_a #(
			.L_in(116.898),
			.L_y(1565.547)
		) dec3_not59_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y61_n),
			.y(dec3_y61)
		);

	sm83_not_pch_dec3_a #(
			.L_in(60.50823),
			.L_y(873.5993)
		) dec3_not6_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y6_n),
			.y(dec3_y6)
		);

	sm83_not_pch_dec3_a #(
			.L_in(56.83332),
			.L_y(2053.921)
		) dec3_not60_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y62_n),
			.y(dec3_y62)
		);

	sm83_not_pch_dec3_a #(
			.L_in(100.9948),
			.L_y(1333.462)
		) dec3_not61_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y63_n),
			.y(dec3_y63)
		);

	sm83_not_pch_dec3_a #(
			.L_in(96.62305),
			.L_y(1364.381)
		) dec3_not62_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y64_n),
			.y(dec3_y64)
		);

	sm83_not_pch_dec3_a #(
			.L_in(48.27992),
			.L_y(476.2726)
		) dec3_not63_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y65_n),
			.y(dec3_y65)
		);

	sm83_not_pch_dec3_a #(
			.L_in(110.182),
			.L_y(1342.015)
		) dec3_not64_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y66_n),
			.y(dec3_y66)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.73366),
			.L_y(490.4019)
		) dec3_not65_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y67_n),
			.y(dec3_y67)
		);

	sm83_not_pch_dec3_a #(
			.L_in(86.48551),
			.L_y(1248.307)
		) dec3_not66_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y68_n),
			.y(dec3_y68)
		);

	sm83_not_pch_dec3_a #(
			.L_in(69.25186),
			.L_y(2074.956)
		) dec3_not67_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y69_n),
			.y(dec3_y69)
		);

	sm83_not_dec3 #(
			.L_y(970.2233)
		) dec3_not68_inst (
			.in(phi_clk_n),
			.y(dec3_not68)
		);

	sm83_not_p2_dec3_a #(
			.L_y(1495.029)
		) dec3_not69_inst (
			.in(ir0),
			.y(dec3_ir0_n)
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.13102),
			.L_y(885.004)
		) dec3_not7_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y7_n),
			.y(dec3_y7)
		);

	sm83_not_p2_dec3_a #(
			.L_y(409.1119)
		) dec3_not70_inst (
			.in(ir1),
			.y(dec3_ir1_n)
		);

	sm83_not_p2_dec3_b #(
			.L_y(332.6374)
		) dec3_not71_inst (
			.in(ir2),
			.y(dec3_ir2_n)
		);

	sm83_not_p2_dec3_b #(
			.L_y(1753.847)
		) dec3_not72_inst (
			.in(ir5),
			.y(dec3_ir5_n)
		);

	sm83_not_p2_dec3_a #(
			.L_y(1766.083)
		) dec3_not73_inst (
			.in(ir4),
			.y(dec3_ir4_n)
		);

	sm83_not_p2_dec3_a #(
			.L_y(1726.066)
		) dec3_not74_inst (
			.in(ir3),
			.y(dec3_ir3_n)
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.33183),
			.L_y(556.2954)
		) dec3_not8_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y8_n),
			.y(dec3_y8)
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.57453),
			.L_y(563.5817)
		) dec3_not9_inst (
			.pch_n(adr_clk_p),
			.in(dec3_y9_n),
			.y(dec3_y9)
		);

	sm83_decoder1 #(
			.L_y1(25.15366),
			.L_y2(24.01319),
			.L_y3(26.16745),
			.L_y4(24.45675),
			.L_y5(24.20333),
			.L_y6(24.5201),
			.L_y7(24.3934),
			.L_y8(24.96356),
			.L_y9(24.71019),
			.L_y10(24.07656),
			.L_y11(24.83689),
			.L_y12(24.83689),
			.L_y13(24.83689),
			.L_y14(23.82316),
			.L_y15(24.71017),
			.L_y16(24.39335),
			.L_y17(24.26658),
			.L_y18(24.26668),
			.L_y19(24.39338),
			.L_y20(24.5201),
			.L_y21(24.77352),
			.L_y22(24.4567),
			.L_y23(24.64675),
			.L_y24(24.39333),
			.L_y25(23.94989),
			.L_y26(23.82309),
			.L_y27(24.13991),
			.L_y28(24.39333),
			.L_y29(24.07658),
			.L_y30(24.20326),
			.L_y31(24.45675),
			.L_y32(24.52005),
			.L_y33(24.71014),
			.L_y34(23.82312),
			.L_y35(24.01316),
			.L_y36(23.88649),
			.L_y37(24.13993),
			.L_y38(24.07649),
			.L_y39(24.07658),
			.L_y40(24.13993),
			.L_y41(24.01321),
			.L_y42(24.4567),
			.L_y43(23.75979),
			.L_y44(24.2667),
			.L_y45(24.64684),
			.L_y46(23.82312),
			.L_y47(24.71022),
			.L_y48(24.52015),
			.L_y49(24.64675),
			.L_y50(24.07658),
			.L_y51(24.39333),
			.L_y52(24.39328),
			.L_y53(24.71019),
			.L_y54(23.56972),
			.L_y55(24.33),
			.L_y56(23.94984),
			.L_y57(24.71022),
			.L_y58(24.45677),
			.L_y59(24.77357),
			.L_y60(24.33007),
			.L_y61(24.4567),
			.L_y62(23.63305),
			.L_y63(24.7101),
			.L_y64(23.69642),
			.L_y65(24.01324),
			.L_y66(23.94979),
			.L_y67(23.6964),
			.L_y68(24.13996),
			.L_y69(24.33),
			.L_y70(23.94984),
			.L_y71(24.39335),
			.L_y72(23.82312),
			.L_y73(24.64682),
			.L_y74(23.75979),
			.L_y75(24.52012),
			.L_y76(23.63307),
			.L_y77(24.13988),
			.L_y78(23.69642),
			.L_y79(24.64677),
			.L_y80(24.14001),
			.L_y81(23.94984),
			.L_y82(24.2033),
			.L_y83(24.64684),
			.L_y84(23.88644),
			.L_y85(24.26668),
			.L_y86(23.94979),
			.L_y87(23.94991),
			.L_y88(23.94984),
			.L_y89(24.58345),
			.L_y90(23.94981),
			.L_y91(24.26665),
			.L_y92(24.07658),
			.L_y93(24.45668),
			.L_y94(23.633),
			.L_y95(24.01319),
			.L_y96(23.63312),
			.L_y97(24.77349),
			.L_y98(24.20335),
			.L_y99(24.83691),
			.L_y100(24.13996),
			.L_y101(24.13986),
			.L_y102(24.01316),
			.L_y103(25.15368),
			.L_y104(23.75977),
			.L_y105(24.71021),
			.L_y106(23.94986),
			.L_y107(24.77352)
		) decoder1_inst (
			.in1(xaym_buf),
			.in2(xaym_n),
			.in3(xirf_buf),
			.in4(xirf_n),
			.in5(xufu_buf),
			.in6(xufu_n),
			.in7(ir0),
			.in8(dec1_ir0_n),
			.in9(ir1),
			.in10(dec1_ir1_n),
			.in11(ir2),
			.in12(dec1_ir2_n),
			.in13(ir3),
			.in14(dec1_ir3_n),
			.in15(ir4),
			.in16(dec1_ir4_n),
			.in17(ir5),
			.in18(dec1_ir5_n),
			.in19(ir6),
			.in20(dec1_ir6_n),
			.in21(ir7),
			.in22(dec1_ir7_n),
			.in23(xtip_n),
			.in24(xtip_buf),
			.in25(xygb_n),
			.in26(xygb_buf),
			.in27(adr_clk_p),
			.y1(dec1_y1_n),
			.y2(dec1_y2_n),
			.y3(dec1_y3_n),
			.y4(dec1_y4_n),
			.y5(dec1_y5_n),
			.y6(dec1_y6_n),
			.y7(dec1_y7_n),
			.y8(dec1_y8_n),
			.y9(dec1_y9_n),
			.y10(dec1_y10_n),
			.y11(dec1_y11_n),
			.y12(dec1_y12_n),
			.y13(dec1_y13_n),
			.y14(dec1_y14_n),
			.y15(dec1_y15_n),
			.y16(dec1_y16_n),
			.y17(dec1_y17_n),
			.y18(dec1_y18_n),
			.y19(dec1_y19_n),
			.y20(dec1_y20_n),
			.y21(dec1_y21_n),
			.y22(dec1_y22_n),
			.y23(dec1_y23_n),
			.y24(dec1_y24_n),
			.y25(dec1_y25_n),
			.y26(dec1_y26_n),
			.y27(dec1_y27_n),
			.y28(dec1_y28_n),
			.y29(dec1_y29_n),
			.y30(dec1_y30_n),
			.y31(dec1_y31_n),
			.y32(dec1_y32_n),
			.y33(dec1_y33_n),
			.y34(dec1_y34_n),
			.y35(dec1_y35_n),
			.y36(dec1_y36_n),
			.y37(dec1_y37_n),
			.y38(dec1_y38_n),
			.y39(dec1_y39_n),
			.y40(dec1_y40_n),
			.y41(dec1_y41_n),
			.y42(dec1_y42_n),
			.y43(dec1_y43_n),
			.y44(dec1_y44_n),
			.y45(dec1_y45_n),
			.y46(dec1_y46_n),
			.y47(dec1_y47_n),
			.y48(dec1_y48_n),
			.y49(dec1_y49_n),
			.y50(dec1_y50_n),
			.y51(dec1_y51_n),
			.y52(dec1_y52_n),
			.y53(dec1_y53_n),
			.y54(dec1_y54_n),
			.y55(dec1_y55_n),
			.y56(dec1_y56_n),
			.y57(dec1_y57_n),
			.y58(dec1_y58_n),
			.y59(dec1_y59_n),
			.y60(dec1_y60_n),
			.y61(dec1_y61_n),
			.y62(dec1_y62_n),
			.y63(dec1_y63_n),
			.y64(dec1_y64_n),
			.y65(dec1_y65_n),
			.y66(dec1_y66_n),
			.y67(dec1_y67_n),
			.y68(dec1_y68_n),
			.y69(dec1_y69_n),
			.y70(dec1_y70_n),
			.y71(dec1_y71_n),
			.y72(dec1_y72_n),
			.y73(dec1_y73_n),
			.y74(dec1_y74_n),
			.y75(dec1_y75_n),
			.y76(dec1_y76_n),
			.y77(dec1_y77_n),
			.y78(dec1_y78_n),
			.y79(dec1_y79_n),
			.y80(dec1_y80_n),
			.y81(dec1_y81_n),
			.y82(dec1_y82_n),
			.y83(dec1_y83_n),
			.y84(dec1_y84_n),
			.y85(dec1_y85_n),
			.y86(dec1_y86_n),
			.y87(dec1_y87_n),
			.y88(dec1_y88_n),
			.y89(dec1_y89_n),
			.y90(dec1_y90_n),
			.y91(dec1_y91_n),
			.y92(dec1_y92_n),
			.y93(dec1_y93_n),
			.y94(dec1_y94_n),
			.y95(dec1_y95_n),
			.y96(dec1_y96_n),
			.y97(dec1_y97_n),
			.y98(dec1_y98_n),
			.y99(dec1_y99_n),
			.y100(dec1_y100_n),
			.y101(dec1_y101_n),
			.y102(dec1_y102_n),
			.y103(dec1_y103_n),
			.y104(dec1_y104_n),
			.y105(dec1_y105_n),
			.y106(dec1_y106_n),
			.y107(dec1_y107_n)
		);

	sm83_decoder2 #(
			.L_y1(146.4446),
			.L_y2(80.64444),
			.L_y3(123.3607),
			.L_y4(178.7919),
			.L_y5(810.7727),
			.L_y6(128.7463),
			.L_y7(253.6498),
			.L_y8(1004.437),
			.L_y9(263.6385),
			.L_y10(87.11906),
			.L_y11(73.30678),
			.L_y12(487.9358),
			.L_y13(735.7932),
			.L_y14(787.6213),
			.L_y15(821.4548),
			.L_y16(501.0464),
			.L_y17(135.9692),
			.L_y18(939.6211),
			.L_y19(757.3352),
			.L_y20(117.9752),
			.L_y21(537.0345),
			.L_y22(561.0481),
			.L_y23(661.9796),
			.L_y24(789.7766),
			.L_y25(750.8091),
			.L_y26(800.3059),
			.L_y27(668.5049),
			.L_y28(636.3187),
			.L_y29(712.4767),
			.L_y30(798.8004)
		) decoder2_inst (
			.pch_n(adr_clk_p),
			.in1(dec2_y20),
			.in2(dec1_y104),
			.in3(dec1_y20),
			.in4(dec1_y27),
			.in5(dec1_y35),
			.in6(dec1_y36),
			.in7(dec1_y39),
			.in8(dec1_y47),
			.in9(dec1_y51),
			.in10(dec1_y59),
			.in11(dec1_y61),
			.in12(dec1_y63),
			.in13(dec1_y65),
			.in14(dec1_y67),
			.in15(dec1_y82),
			.in16(dec1_y84),
			.in17(dec1_y89),
			.in18(dec1_y93),
			.in19(dec1_y94),
			.in20(dec1_y100),
			.in21(dec1_y101),
			.in22(dec1_y102),
			.in23(dec1_y103),
			.in24(dec1_y1),
			.in25(dec1_y2),
			.in26(dec1_y3),
			.in27(dec1_y5),
			.in28(dec1_y6),
			.in29(dec1_y7),
			.in30(dec1_y8),
			.in31(dec1_y10),
			.in32(dec1_y11),
			.in33(dec1_y12),
			.in34(dec1_y13),
			.in35(dec1_y14),
			.in36(dec1_y16),
			.in37(dec1_y17),
			.in38(dec1_y18),
			.in39(dec1_y19),
			.in40(dec1_y21),
			.in41(dec1_y22),
			.in42(dec1_y23),
			.in43(dec1_y24),
			.in44(dec1_y25),
			.in45(dec1_y29),
			.in46(dec1_y30),
			.in47(dec1_y31),
			.in48(dec1_y32),
			.in49(dec1_y33),
			.in50(dec1_y34),
			.in51(dec1_y37),
			.in52(dec1_y38),
			.in53(dec1_y40),
			.in54(dec1_y41),
			.in55(dec1_y44),
			.in56(dec1_y45),
			.in57(dec1_y46),
			.in58(dec1_y48),
			.in59(dec1_y52),
			.in60(dec1_y53),
			.in61(dec1_y54),
			.in62(dec1_y55),
			.in63(dec1_y56),
			.in64(dec1_y57),
			.in65(dec1_y58),
			.in66(dec1_y60),
			.in67(dec1_y62),
			.in68(dec1_y64),
			.in69(dec1_y66),
			.in70(dec1_y68),
			.in71(dec1_y69),
			.in72(dec1_y70),
			.in73(dec1_y71),
			.in74(dec1_y72),
			.in75(dec1_y73),
			.in76(dec1_y74),
			.in77(dec1_y75),
			.in78(dec1_y76),
			.in79(dec1_y77),
			.in80(dec1_y78),
			.in81(dec1_y79),
			.in82(dec1_y80),
			.in83(dec1_y81),
			.in84(dec1_y83),
			.in85(dec1_y85),
			.in86(dec1_y86),
			.in87(dec1_y87),
			.in88(dec1_y88),
			.in89(dec1_y90),
			.in90(dec1_y91),
			.in91(dec1_y92),
			.in92(dec1_y95),
			.in93(dec1_y96),
			.in94(dec1_y97),
			.in95(dec1_y98),
			.in96(dec1_y105),
			.in97(dec1_y106),
			.y1(dec2_y1_n),
			.y2(dec2_y2_n),
			.y3(dec2_y3_n),
			.y4(dec2_y4_n),
			.y5(ctl_mwrite_n),
			.y6(dec2_y6_n),
			.y7(dec2_y7_n),
			.y8(dec2_y8_n),
			.y9(dec2_y9_n),
			.y10(dec2_y10_n),
			.y11(dec2_y11_n),
			.y12(dec2_y12_n),
			.y13(dec2_y13_n),
			.y14(dec2_y14_n),
			.y15(dec2_y15_n),
			.y16(dec2_y16_n),
			.y17(dec2_y17_n),
			.y18(dec2_y18_n),
			.y19(dec2_y19_n),
			.y20(dec2_y20_n),
			.y21(dec2_y21_n),
			.y22(dec2_y22_n),
			.y23(dec2_y23_n),
			.y24(dec2_y24_n),
			.y25(dec2_y25_n),
			.y26(dec2_y26_n),
			.y27(dec2_y27_n),
			.y28(dec2_y28_n),
			.y29(dec2_y29_n),
			.y30(dec2_y30_n)
		);

	sm83_decoder3 #(
			.L_y1(68.93494),
			.L_y2(50.81425),
			.L_y3(74.63734),
			.L_y4(127.7959),
			.L_y5(207.7554),
			.L_y6(60.50823),
			.L_y7(51.13102),
			.L_y8(61.33183),
			.L_y9(51.57453),
			.L_y10(61.20518),
			.L_y11(137.2998),
			.L_y12(119.4324),
			.L_y13(114.8705),
			.L_y14(198.9485),
			.L_y15(177.6597),
			.L_y16(185.5796),
			.L_y17(68.74487),
			.L_y18(53.72878),
			.L_y19(65.64032),
			.L_y20(171.007),
			.L_y21(143.8892),
			.L_y22(52.39824),
			.L_y23(53.15852),
			.L_y24(63.35942),
			.L_y25(75.01752),
			.L_y26(186.53),
			.L_y27(61.71207),
			.L_y28(61.58532),
			.L_y29(132.1676),
			.L_y30(152.8862),
			.L_y31(90.54046),
			.L_y32(89.90703),
			.L_y33(88.06954),
			.L_y34(53.03177),
			.L_y35(190.9019),
			.L_y36(184.4392),
			.L_y37(112.9697),
			.L_y38(167.2054),
			.L_y39(279.7949),
			.L_y40(170.6268),
			.L_y41(180.7643),
			.L_y42(78.37552),
			.L_y43(137.1959),
			.L_y44(184.4938),
			.L_y45(178.42),
			.L_y46(89.7169),
			.L_y47(186.0237),
			.L_y48(182.1582),
			.L_y49(180.8276),
			.L_y50(181.0811),
			.L_y51(181.9047),
			.L_y52(180.5109),
			.L_y53(81.86031),
			.L_y54(181.2712),
			.L_y55(194.1331),
			.L_y56(72.16634),
			.L_y57(81.16339),
			.L_y58(183.4254),
			.L_y59(179.4971),
			.L_y60(123.8042),
			.L_y61(116.898),
			.L_y62(56.83332),
			.L_y63(100.9948),
			.L_y64(96.62305),
			.L_y65(48.27992),
			.L_y66(110.182),
			.L_y67(81.73366),
			.L_y68(86.48551),
			.L_y69(69.25186)
		) decoder3_inst (
			.in1(dec3_y3),
			.in2(dec3_y11),
			.in3(dec3_y12),
			.in4(dec3_y14),
			.in5(dec3_y15),
			.in6(dec2_y7),
			.in7(dec1_y51_buf),
			.in8(dec3_y18),
			.in9(dec3_y21),
			.in10(dec3_y23),
			.in11(dec3_y24),
			.in12(dec3_y25),
			.in13(dec3_y27),
			.in14(dec3_y28),
			.in15(dec3_y29),
			.in16(dec3_y31),
			.in17(dec3_y32),
			.in18(dec3_y33),
			.in19(dec1_y4_buf),
			.in20(dec3_y35),
			.in21(dec3_y37),
			.in22(phi_clk_n),
			.in23(dec1_y47_buf),
			.in24(dec2_y12),
			.in25(dec1_y20_buf),
			.in26(dec1_y61),
			.in27(dec3_y63),
			.in28(dec3_y64),
			.in29(dec1_y36_buf),
			.in30(dec3_y65),
			.in31(dec2_y22),
			.in32(dec2_y16),
			.in33(dec3_y67),
			.in34(dec2_y18),
			.in35(dec3_y68),
			.in36(dec2_y29),
			.in37(dec1_y9),
			.in38(dec1_y15),
			.in39(dec2_y3),
			.in40(dec2_y10),
			.in41(phi_clk_n),
			.in42(dec2_y4),
			.in43(dec2_y6),
			.in44(dec1_y26),
			.in45(dec1_y35),
			.in46(dec2_y11),
			.in47(dec1_y28_buf),
			.in48(dec1_y42),
			.in49(dec1_y39),
			.in50(dec2_y13),
			.in51(dec1_y89),
			.in52(dec1_y43),
			.in53(xtip_n),
			.in54(dec2_y15),
			.in55(dec2_y17),
			.in56(ctl_mwrite),
			.in57(phi_clk_n),
			.in58(phi_clk_n),
			.in59(dec2_y9),
			.in60(dec2_y30),
			.in61(dec1_y59),
			.in62(phi_clk_n),
			.in63(dec1_y84),
			.in64(dec1_y82),
			.in65(phi_clk_n),
			.in66(dec1_y89),
			.in67(dec1_y63),
			.in68(dec1_y99_buf),
			.in69(dec2_y23),
			.in70(dec1_y65),
			.in71(dec2_y30),
			.in72(xdqf),
			.in73(vequ_tap_in1),
			.in74(adr_clk_p),
			.in75(ir5),
			.in76(dec3_ir5_n),
			.in77(ir4),
			.in78(dec3_ir4_n),
			.in79(ir3),
			.in80(dec3_ir3_n),
			.in81(ir2),
			.in82(ir1),
			.in83(ir0),
			.in84(dec3_ir0_n),
			.in85(adr_clk_p),
			.in86(dec1_y104_buf),
			.in87(dec1_y94),
			.in88(dec3_ir2_n),
			.in89(dec3_ir1_n),
			.in90(dec1_y93),
			.y1(dec3_y1_n),
			.y2(dec3_y2_n),
			.y3(dec3_y3_n),
			.y4(dec3_y4_n),
			.y5(dec3_y5_n),
			.y6(dec3_y6_n),
			.y7(dec3_y7_n),
			.y8(dec3_y8_n),
			.y9(dec3_y9_n),
			.y10(dec3_y10_n),
			.y11(dec3_y11_n),
			.y12(dec3_y12_n),
			.y13(dec3_y13_n),
			.y14(dec3_y14_n),
			.y15(dec3_y15_n),
			.y16(dec3_y16_n),
			.y17(dec3_y17_n),
			.y18(dec3_y18_n),
			.y19(dec3_y19_n),
			.y20(dec3_y20_n),
			.y21(dec3_y21_n),
			.y22(dec3_y22_n),
			.y23(dec3_y23_n),
			.y24(dec3_y24_n),
			.y25(dec3_y25_n),
			.y26(dec3_y26_n),
			.y27(dec3_y27_n),
			.y28(dec3_y28_n),
			.y29(dec3_y29_n),
			.y30(dec3_y30_n),
			.y31(dec3_y31_n),
			.y32(dec3_y32_n),
			.y33(dec3_y33_n),
			.y34(dec3_y34_n),
			.y35(dec3_y35_n),
			.y36(dec3_y36_n),
			.y37(dec3_y37_n),
			.y38(dec3_y38_n),
			.y39(dec3_y39_n),
			.y40(dec3_y40_n),
			.y41(dec3_y41_n),
			.y42(dec3_y42_n),
			.y43(dec3_y43_n),
			.y44(dec3_y44_n),
			.y45(dec3_y45_n),
			.y46(dec3_y46_n),
			.y47(dec3_y47_n),
			.y48(dec3_y48_n),
			.y49(dec3_y49_n),
			.y50(dec3_y50_n),
			.y51(dec3_y51_n),
			.y52(dec3_y52_n),
			.y53(dec3_y53_n),
			.y54(dec3_y54_n),
			.y55(dec3_y55_n),
			.y56(dec3_y56_n),
			.y57(dec3_y57_n),
			.y58(dec3_y58_n),
			.y59(dec3_y59_n),
			.y60(dec3_y60_n),
			.y61(dec3_y61_n),
			.y62(dec3_y62_n),
			.y63(dec3_y63_n),
			.y64(dec3_y64_n),
			.y65(dec3_y65_n),
			.y66(dec3_y66_n),
			.y67(dec3_y67_n),
			.y68(dec3_y68_n),
			.y69(dec3_y69_n)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(343.9147),
			.L_q(694.989),
			.L_q_n(1991.006)
		) flag_c_inst (
			.d(new_flag_c_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk_n(dec3_y29),
			.q(flag_c_n),
			.q_n(flag_c)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(204.2707),
			.L_q(344.2949),
			.L_q_n(1505.42)
		) flag_h_inst (
			.d(new_flag_h_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk_n(dec3_y30),
			.q(flag_h_n),
			.q_n(flag_h)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(173.0344),
			.L_q(339.036),
			.L_q_n(1354.244)
		) flag_n_inst (
			.d(new_flag_n_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk_n(dec3_y30),
			.q(flag_n_n),
			.q_n(flag_n)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(465.8182),
			.L_q(111.6392),
			.L_q_n(1257.494)
		) flag_z_inst (
			.d(new_flag_z_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk_n(dec3_y30),
			.q(flag_z_n),
			.q_n(flag_z)
		);

	sm83_idu_bit0 #(
			.L_aoi_buf_y(70.96249),
			.L_aoi_y_n(87.2458),
			.L_zero_y(70.96249),
			.L_or_y(101.9452),
			.L_buf_a_y(260.5337),
			.L_buf_b_y(227.4602),
			.L_buf_ena(628.145)
		) idu0_inst (
			.pch_n(phi_clk_n),
			.aoi_buf_ena(idu_mux_h0),
			.aoi_buf_y(idu_chain_b_y0),
			.aoi_in1(idu_chain_a_y_n7),
			.aoi_in2(idu_mux_l7),
			.aoi_in3(idu_ctl_y1),
			.aoi_y_n(idu_chain_b_y_n0),
			.zero_ena(idu_mux_l0),
			.zero_y(idu_chain_a_y0),
			.or_in1(idu_ctl_y3),
			.or_in2(idu_ctl_y2),
			.or_y(idu_chain_a_y_n0),
			.buf_a_in(idu_lo_in0),
			.buf_a_y(a0),
			.buf_b_in(idu_hi_in0),
			.buf_b_y(a8),
			.buf_ena(oe),
			.buf_ena_n(unor)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(258.2528),
			.L_buf_b_y(230.6915),
			.L_chain_a_in(70.96249),
			.L_chain_a_y(70.70909),
			.L_chain_a_y_n(93.70848),
			.L_chain_b_in(70.96249),
			.L_chain_b_y(70.77242),
			.L_chain_b_y_n(85.59849)
		) idu1_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in1),
			.buf_a_y(a1),
			.buf_b_in(idu_hi_in1),
			.buf_b_y(a9),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y0),
			.chain_a_ena(idu_mux_l1),
			.chain_a_y(idu_chain_a_y1),
			.chain_a_y_n(idu_chain_a_y_n1),
			.chain_b_in(idu_chain_b_y0),
			.chain_b_ena(idu_mux_h1),
			.chain_b_y(idu_chain_b_y1),
			.chain_b_y_n(idu_chain_b_y_n1)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(258.443),
			.L_buf_b_y(229.7413),
			.L_chain_a_in(70.70909),
			.L_chain_a_y(71.08923),
			.L_chain_a_y_n(93.51851),
			.L_chain_b_in(70.77242),
			.L_chain_b_y(71.15256),
			.L_chain_b_y_n(85.97872)
		) idu2_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in2),
			.buf_a_y(a2),
			.buf_b_in(idu_hi_in2),
			.buf_b_y(a10),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y1),
			.chain_a_ena(idu_mux_l2),
			.chain_a_y(idu_chain_a_y2),
			.chain_a_y_n(idu_chain_a_y_n2),
			.chain_b_in(idu_chain_b_y1),
			.chain_b_ena(idu_mux_h2),
			.chain_b_y(idu_chain_b_y2),
			.chain_b_y_n(idu_chain_b_y_n2)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(258.5062),
			.L_buf_b_y(227.9038),
			.L_chain_a_in(71.08923),
			.L_chain_a_y(73.24343),
			.L_chain_a_y_n(93.58174),
			.L_chain_b_in(71.15256),
			.L_chain_b_y(73.24343),
			.L_chain_b_y_n(86.10538)
		) idu3_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in3),
			.buf_a_y(a3),
			.buf_b_in(idu_hi_in3),
			.buf_b_y(a11),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y2),
			.chain_a_ena(idu_mux_l3),
			.chain_a_y(idu_chain_a_y3),
			.chain_a_y_n(idu_chain_a_y_n3),
			.chain_b_in(idu_chain_b_y2),
			.chain_b_ena(idu_mux_h3),
			.chain_b_y(idu_chain_b_y3),
			.chain_b_y_n(idu_chain_b_y_n3)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(258.9496),
			.L_buf_b_y(229.8679),
			.L_chain_a_in(73.24343),
			.L_chain_a_y(73.24343),
			.L_chain_a_y_n(94.15195),
			.L_chain_b_in(73.24343),
			.L_chain_b_y(73.49692),
			.L_chain_b_y_n(86.48551)
		) idu4_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in4),
			.buf_a_y(a4),
			.buf_b_in(idu_hi_in4),
			.buf_b_y(a12),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y3),
			.chain_a_ena(idu_mux_l4),
			.chain_a_y(idu_chain_a_y4),
			.chain_a_y_n(idu_chain_a_y_n4),
			.chain_b_in(idu_chain_b_y3),
			.chain_b_ena(idu_mux_h4),
			.chain_b_y(idu_chain_b_y4),
			.chain_b_y_n(idu_chain_b_y_n4)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(215.4219),
			.L_buf_b_y(218.3998),
			.L_chain_a_in(73.24343),
			.L_chain_a_y(73.43349),
			.L_chain_a_y_n(94.53218),
			.L_chain_b_in(73.49692),
			.L_chain_b_y(73.1801),
			.L_chain_b_y_n(86.73891)
		) idu5_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in5),
			.buf_a_y(a5),
			.buf_b_in(idu_hi_in5),
			.buf_b_y(a13),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y4),
			.chain_a_ena(idu_mux_l5),
			.chain_a_y(idu_chain_a_y5),
			.chain_a_y_n(idu_chain_a_y_n5),
			.chain_b_in(idu_chain_b_y4),
			.chain_b_ena(idu_mux_h5),
			.chain_b_y(idu_chain_b_y5),
			.chain_b_y_n(idu_chain_b_y_n5)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(216.3722),
			.L_buf_b_y(217.1959),
			.L_chain_a_in(73.43349),
			.L_chain_a_y(79.1359),
			.L_chain_a_y_n(93.13827),
			.L_chain_b_in(73.1801),
			.L_chain_b_y(45.74548),
			.L_chain_b_y_n(86.48561)
		) idu6_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in6),
			.buf_a_y(a6),
			.buf_b_in(idu_hi_in6),
			.buf_b_y(a14),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.chain_a_in(idu_chain_a_y5),
			.chain_a_ena(idu_mux_l6),
			.chain_a_y(idu_chain_a_y6),
			.chain_a_y_n(idu_chain_a_y_n6),
			.chain_b_in(idu_chain_b_y5),
			.chain_b_ena(idu_mux_h6),
			.chain_b_y(idu_chain_b_y6),
			.chain_b_y_n(idu_chain_b_y_n6)
		);

	sm83_idu_bit7 #(
			.L_buf_a_y(216.1189),
			.L_buf_b_y(232.4655),
			.L_not_a_in(79.1359),
			.L_not_a_y(665.9705),
			.L_not_b_in(45.74548),
			.L_not_b_y(86.42229)
		) idu7_inst (
			.pch_n(phi_clk_n),
			.buf_a_in(idu_lo_in7),
			.buf_a_y(a7),
			.buf_b_in(idu_hi_in7),
			.buf_b_y(a15),
			.buf_ena(oe),
			.buf_ena_n(unor),
			.not_a_in(idu_chain_a_y6),
			.not_a_y(idu_chain_a_y_n7),
			.not_b_in(idu_chain_b_y6),
			.not_b_y(idu_chain_b_y_n7)
		);

	sm83_idu_ctl #(
			.L_y1(167.4589),
			.L_y2(859.0264),
			.L_y3(892.8605)
		) idu_ctl_inst (
			.in1(dec2_y28),
			.in2(reg_z7),
			.in3(dec1_y20_buf),
			.in4(res_carry7),
			.in5(dec2_y24),
			.y1(idu_ctl_y1),
			.y2(idu_ctl_y2),
			.y3(idu_ctl_y3)
		);

	sm83_mux_idu_h #(
			.L_y(42.07062)
		) idu_mux_h0_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in0),
			.y(idu_mux_h0)
		);

	sm83_mux_idu_h #(
			.L_y(42.83091)
		) idu_mux_h1_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in1),
			.y(idu_mux_h1)
		);

	sm83_mux_idu_h #(
			.L_y(42.32402)
		) idu_mux_h2_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in2),
			.y(idu_mux_h2)
		);

	sm83_mux_idu_h #(
			.L_y(42.45077)
		) idu_mux_h3_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in3),
			.y(idu_mux_h3)
		);

	sm83_mux_idu_h #(
			.L_y(41.75391)
		) idu_mux_h4_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in4),
			.y(idu_mux_h4)
		);

	sm83_mux_idu_h #(
			.L_y(41.88065)
		) idu_mux_h5_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in5),
			.y(idu_mux_h5)
		);

	sm83_mux_idu_h #(
			.L_y(41.94397)
		) idu_mux_h6_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in6),
			.y(idu_mux_h6)
		);

	sm83_mux_idu_h #(
		) idu_mux_h7_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_hi_in7),
			.y()
		);

	sm83_mux_idu_l #(
			.L_y(47.45621)
		) idu_mux_l0_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in0),
			.y(idu_mux_l0)
		);

	sm83_mux_idu_l #(
			.L_y(47.32937)
		) idu_mux_l1_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in1),
			.y(idu_mux_l1)
		);

	sm83_mux_idu_l #(
			.L_y(47.1393)
		) idu_mux_l2_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in2),
			.y(idu_mux_l2)
		);

	sm83_mux_idu_l #(
			.L_y(47.58295)
		) idu_mux_l3_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in3),
			.y(idu_mux_l3)
		);

	sm83_mux_idu_l #(
			.L_y(46.94932)
		) idu_mux_l4_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in4),
			.y(idu_mux_l4)
		);

	sm83_mux_idu_l #(
			.L_y(47.01265)
		) idu_mux_l5_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in5),
			.y(idu_mux_l5)
		);

	sm83_mux_idu_l #(
			.L_y(47.70961)
		) idu_mux_l6_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in6),
			.y(idu_mux_l6)
		);

	sm83_mux_idu_l #(
			.L_y(601.5339)
		) idu_mux_l7_inst (
			.d0(idu_ctl_y2),
			.d1(idu_ctl_y3),
			.sel(idu_lo_in7),
			.y(idu_mux_l7)
		);

	sm83_not2_idu #(
			.L_a_y(130.2036),
			.L_b_y(187.9238)
		) idu_not0_inst (
			.a_in(lo_bus0_n),
			.a_y(idu_lo_in0),
			.b_in(hi_bus0_n),
			.b_y(idu_hi_in0)
		);

	sm83_not2_idu #(
			.L_a_y(129.7599),
			.L_b_y(189.1277)
		) idu_not1_inst (
			.a_in(lo_bus1_n),
			.a_y(idu_lo_in1),
			.b_in(hi_bus1_n),
			.b_y(idu_hi_in1)
		);

	sm83_not2_idu #(
			.L_a_y(129.9501),
			.L_b_y(187.0369)
		) idu_not2_inst (
			.a_in(lo_bus2_n),
			.a_y(idu_lo_in2),
			.b_in(hi_bus2_n),
			.b_y(idu_hi_in2)
		);

	sm83_not2_idu #(
			.L_a_y(130.7739),
			.L_b_y(187.6071)
		) idu_not3_inst (
			.a_in(lo_bus3_n),
			.a_y(idu_lo_in3),
			.b_in(hi_bus3_n),
			.b_y(idu_hi_in3)
		);

	sm83_not2_idu #(
			.L_a_y(130.3936),
			.L_b_y(188.9376)
		) idu_not4_inst (
			.a_in(lo_bus4_n),
			.a_y(idu_lo_in4),
			.b_in(hi_bus4_n),
			.b_y(idu_hi_in4)
		);

	sm83_not2_idu #(
			.L_a_y(130.5837),
			.L_b_y(188.2408)
		) idu_not5_inst (
			.a_in(lo_bus5_n),
			.a_y(idu_lo_in5),
			.b_in(hi_bus5_n),
			.b_y(idu_hi_in5)
		);

	sm83_not2_idu #(
			.L_a_y(130.2036),
			.L_b_y(187.3537)
		) idu_not6_inst (
			.a_in(lo_bus6_n),
			.a_y(idu_lo_in6),
			.b_in(hi_bus6_n),
			.b_y(idu_hi_in6)
		);

	sm83_not2_idu #(
			.L_a_y(131.2174),
			.L_b_y(187.1001)
		) idu_not7_inst (
			.a_in(lo_bus7_n),
			.a_y(idu_lo_in7),
			.b_in(hi_bus7_n),
			.b_y(idu_hi_in7)
		);

	sm83_xor_idu_h #(
			.L_y(562.8847)
		) idu_xor_h0_inst (
			.in1(idu_hi_in0),
			.in2(idu_chain_b_y_n0),
			.y(idu_xor_h0)
		);

	sm83_xor_idu_h #(
			.L_y(562.8846)
		) idu_xor_h1_inst (
			.in1(idu_hi_in1),
			.in2(idu_chain_b_y_n1),
			.y(idu_xor_h1)
		);

	sm83_xor_idu_h #(
			.L_y(563.0115)
		) idu_xor_h2_inst (
			.in1(idu_hi_in2),
			.in2(idu_chain_b_y_n2),
			.y(idu_xor_h2)
		);

	sm83_xor_idu_h #(
			.L_y(564.0886)
		) idu_xor_h3_inst (
			.in1(idu_hi_in3),
			.in2(idu_chain_b_y_n3),
			.y(idu_xor_h3)
		);

	sm83_xor_idu_h #(
			.L_y(563.5818)
		) idu_xor_h4_inst (
			.in1(idu_hi_in4),
			.in2(idu_chain_b_y_n4),
			.y(idu_xor_h4)
		);

	sm83_xor_idu_h #(
			.L_y(563.9619)
		) idu_xor_h5_inst (
			.in1(idu_hi_in5),
			.in2(idu_chain_b_y_n5),
			.y(idu_xor_h5)
		);

	sm83_xor_idu_h #(
			.L_y(563.0748)
		) idu_xor_h6_inst (
			.in1(idu_hi_in6),
			.in2(idu_chain_b_y_n6),
			.y(idu_xor_h6)
		);

	sm83_xor_idu_h #(
			.L_y(563.5184)
		) idu_xor_h7_inst (
			.in1(idu_hi_in7),
			.in2(idu_chain_b_y_n7),
			.y(idu_xor_h7)
		);

	sm83_xor_idu_l #(
			.L_y(683.1409)
		) idu_xor_l0_inst (
			.in1(idu_lo_in0),
			.in2(idu_chain_a_y_n0),
			.y(idu_xor_l0)
		);

	sm83_xor_idu_l #(
			.L_y(683.0775)
		) idu_xor_l1_inst (
			.in1(idu_lo_in1),
			.in2(idu_chain_a_y_n1),
			.y(idu_xor_l1)
		);

	sm83_xor_idu_l #(
			.L_y(682.7608)
		) idu_xor_l2_inst (
			.in1(idu_lo_in2),
			.in2(idu_chain_a_y_n2),
			.y(idu_xor_l2)
		);

	sm83_xor_idu_l #(
			.L_y(684.6615)
		) idu_xor_l3_inst (
			.in1(idu_lo_in3),
			.in2(idu_chain_a_y_n3),
			.y(idu_xor_l3)
		);

	sm83_xor_idu_l #(
			.L_y(683.3942)
		) idu_xor_l4_inst (
			.in1(idu_lo_in4),
			.in2(idu_chain_a_y_n4),
			.y(idu_xor_l4)
		);

	sm83_xor_idu_l #(
			.L_y(684.6616)
		) idu_xor_l5_inst (
			.in1(idu_lo_in5),
			.in2(idu_chain_a_y_n5),
			.y(idu_xor_l5)
		);

	sm83_xor_idu_l #(
			.L_y(684.2812)
		) idu_xor_l6_inst (
			.in1(idu_lo_in6),
			.in2(idu_chain_a_y_n6),
			.y(idu_xor_l6)
		);

	sm83_xor_idu_l #(
			.L_y(684.218)
		) idu_xor_l7_inst (
			.in1(idu_lo_in7),
			.in2(idu_chain_a_y_n7),
			.y(idu_xor_l7)
		);

	sm83_and2_irq #(
			.L_y(863.3351)
		) irq_and_inst (
			.in1(irq_head_e_y),
			.in2(ctl_mwrite),
			.y(ie_wr)
		);

	sm83_not5_irq #(
			.L_a_y(669.772),
			.L_b_y(655.7697),
			.L_c_y(1019.579),
			.L_d_y(359.121),
			.L_e_y(858.076)
		) irq_head_inst (
			.a_in(irq_prio_nand_a_y),
			.a_y(irq_head_a_y),
			.b_in(zrby),
			.b_y(irq_head_b_y),
			.c_in(irq_prio_dist_nor_y),
			.c_y(irq_head_c_y),
			.d_in(irq_prio_dist_nand_b_y),
			.d_y(irq_head_d_y),
			.e_in(irq_prio_dist_nand_a_y),
			.e_y(irq_head_e_y)
		);

	sm83_dlatch_ee_irq #(
			.L_q(561.3008),
			.L_q_n(160.8694),
			.L_gated_q_n(111.069)
		) irq_latch0_inst (
			.d(irq_nand2_nand30),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch0),
			.q_n(irq_latch0_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y0),
			.gated_q_n(irq_latch_gated_q_n0)
		);

	sm83_dlatch_ee_irq #(
			.L_q(489.1978),
			.L_q_n(161.1864),
			.L_gated_q_n(110.942)
		) irq_latch1_inst (
			.d(irq_nand2_nand31),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch1),
			.q_n(irq_latch1_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y1),
			.gated_q_n(irq_latch_gated_q_n1)
		);

	sm83_dlatch_ee_irq #(
			.L_q(417.1582),
			.L_q_n(162.3268),
			.L_gated_q_n(111.7659)
		) irq_latch2_inst (
			.d(irq_nand2_nand32),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch2),
			.q_n(irq_latch2_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y2),
			.gated_q_n(irq_latch_gated_q_n2)
		);

	sm83_dlatch_ee_irq #(
			.L_q(345.3086),
			.L_q_n(161.0596),
			.L_gated_q_n(111.2591)
		) irq_latch3_inst (
			.d(irq_nand2_nand33),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch3),
			.q_n(irq_latch3_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y3),
			.gated_q_n(irq_latch_gated_q_n3)
		);

	sm83_dlatch_ee_irq #(
			.L_q(270.3546),
			.L_q_n(161.8834),
			.L_gated_q_n(111.1957)
		) irq_latch4_inst (
			.d(irq_nand2_nand34),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch4),
			.q_n(irq_latch4_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y4),
			.gated_q_n(irq_latch_gated_q_n4)
		);

	sm83_dlatch_ee_irq #(
			.L_q(196.9843),
			.L_q_n(161.2496),
			.L_gated_q_n(112.1461)
		) irq_latch5_inst (
			.d(irq_nand2_nand35),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch5),
			.q_n(irq_latch5_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y5),
			.gated_q_n(irq_latch_gated_q_n5)
		);

	sm83_dlatch_ee_irq #(
			.L_q(122.2202),
			.L_q_n(161.9467),
			.L_gated_q_n(117.8484)
		) irq_latch6_inst (
			.d(irq_nand2_nand36),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(irq_latch6),
			.q_n(irq_latch6_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y6),
			.gated_q_n(irq_latch_gated_q_n6)
		);

	sm83_dlatch_ee_irq #(
			.L_q_n(161.7565),
			.L_gated_q_n(114.7438)
		) irq_latch7_inst (
			.d(irq_nand2_nand37),
			.ena(phi_clk_p),
			.ena_n(phi_clk_n),
			.q(),
			.q_n(irq_latch7_n),
			.pch_n(t4_clk_p),
			.ena_q_n(irq_prio_nand_b_y7),
			.gated_q_n(irq_latch_gated_q_n7)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.19398),
			.L_b_y(2837.112)
		) irq_nand2_nand30_inst (
			.a_in1(reg_ie0),
			.a_in2(int0),
			.a_y(irq_nand2_nand30),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie0_n),
			.b_y(db0)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.76408),
			.L_b_y(2962.755)
		) irq_nand2_nand31_inst (
			.a_in1(reg_ie1),
			.a_in2(int1),
			.a_y(irq_nand2_nand31),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie1_n),
			.b_y(db1)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.44727),
			.L_b_y(3090.547)
		) irq_nand2_nand32_inst (
			.a_in1(reg_ie2),
			.a_in2(int2),
			.a_y(irq_nand2_nand32),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie2_n),
			.b_y(db2)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.89084),
			.L_b_y(3215.205)
		) irq_nand2_nand33_inst (
			.a_in1(reg_ie3),
			.a_in2(int3),
			.a_y(irq_nand2_nand33),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie3_n),
			.b_y(db3)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.13046),
			.L_b_y(3346.099)
		) irq_nand2_nand34_inst (
			.a_in1(reg_ie4),
			.a_in2(int4),
			.a_y(irq_nand2_nand34),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie4_n),
			.b_y(db4)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.19378),
			.L_b_y(3460.447)
		) irq_nand2_nand35_inst (
			.a_in1(reg_ie5),
			.a_in2(int5),
			.a_y(irq_nand2_nand35),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie5_n),
			.b_y(db5)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.5106),
			.L_b_y(3577.412)
		) irq_nand2_nand36_inst (
			.a_in1(reg_ie6),
			.a_in2(int6),
			.a_y(irq_nand2_nand36),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie6_n),
			.b_y(db6)
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.63734),
			.L_b_y(3700.271)
		) irq_nand2_nand37_inst (
			.a_in1(reg_ie7),
			.a_in2(int7),
			.a_y(irq_nand2_nand37),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie7_n),
			.b_y(db7)
		);

	sm83_irq_prio_bit0 #(
			.L_and_y(57.91037),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(28.00484),
			.L_dist_nand_a_y_n(638.7894),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(711.0825),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(764.9379)
		) irq_prio0_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta0),
			.and_in2_nand_a_in2(irq_latch_gated_q_n0),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_y(irq_prio_nand_b_y0),
			.dist_nand_a_in1(irq_head_d_y),
			.dist_nand_a_in2(a0),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n1),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a8),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n1),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch0_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p1),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y)
		);

	sm83_irq_prio_bit1 #(
			.L_and_y(72.03969),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.597758),
			.L_nand_c_y(502.3766),
			.L_dist_nand_a_y_n(25.15368),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.30141),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.70909)
		) irq_prio1_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta1),
			.and_in2_nand_a_in2(irq_latch_gated_q_n1),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y1),
			.nand_c_y(int_vector3_n),
			.dist_nand_a_in(a1),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n2),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n1),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a9),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n2),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n1),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch1_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p2),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p1)
		);

	sm83_irq_prio_bit2 #(
			.L_and_y(69.50525),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.407687),
			.L_nand_c_y(417.3482),
			.L_dist_nand_a_y_n(71.08923),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.11134),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.58234)
		) irq_prio2_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta2),
			.and_in2_nand_a_in2(irq_latch_gated_q_n2),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch1),
			.nand_b_in4(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y2),
			.nand_c_y(int_vector4_n),
			.dist_nand_a_in(a2),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n3),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n2),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a10),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n3),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n2),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch2_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p3),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p2)
		);

	sm83_irq_prio_bit3 #(
			.L_and_y(74.82741),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.090871),
			.L_nand_c_y(417.3482),
			.L_nand_d_y(502.3766),
			.L_nand_d_y_n(404.4863),
			.L_dist_nand_a_y_n(70.58234),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.30141),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.83584)
		) irq_prio3_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta3),
			.and_in2_nand_a_in2(irq_latch_gated_q_n3),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch2),
			.nand_b_in4(irq_latch1),
			.nand_b_in5(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y3),
			.nand_c_y(int_vector4_n),
			.nand_d_y(int_vector3_n),
			.nand_d_y_n(int_vector3),
			.dist_nand_a_in(a3),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n4),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n3),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a11),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n4),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n3),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch3_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p4),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p3)
		);

	sm83_irq_prio_bit4 #(
			.L_and_y(69.18843),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.661082),
			.L_nand_c_y(254.7048),
			.L_not_in(417.3482),
			.L_not_y(404.4228),
			.L_dist_nand_a_y_n(72.73654),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.58234),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(72.99004)
		) irq_prio4_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta4),
			.and_in2_nand_a_in2(irq_latch_gated_q_n4),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch3),
			.nand_b_in4(irq_latch2),
			.nand_b_in5(irq_latch1),
			.nand_b_in6(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y4),
			.nand_c_y(int_vector5_n),
			.not_in(int_vector4_n),
			.not_y(int_vector4),
			.dist_nand_a_in(a4),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n5),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n4),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a12),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n5),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n4),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch4_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p5),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p4)
		);

	sm83_irq_prio_bit5 #(
			.L_and_y(74.13046),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.471012),
			.L_nand_c_y(254.7048),
			.L_nand_c_y_n(404.5497),
			.L_nand_d_y(502.3766),
			.L_dist_nand_a_y_n(72.86329),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.77242),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(72.79996)
		) irq_prio5_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_y(inta5),
			.and_in2_nand_a_in2(irq_latch_gated_q_n5),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch4),
			.nand_b_in4(irq_latch3),
			.nand_b_in5(irq_latch2),
			.nand_b_in6(irq_latch1),
			.nand_b_in7(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y5),
			.nand_c_y(int_vector5_n),
			.nand_c_y_n(int_vector5),
			.nand_d_y(int_vector3_n),
			.dist_nand_a_in(a5),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n6),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n5),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a13),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n6),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n5),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch5_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p6),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p5)
		);

	sm83_irq_prio_bit6 #(
			.L_and_a_y(69.88539),
			.L_and_b_y(394.919),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.851153),
			.L_nand_c_y(254.7048),
			.L_nand_d_y(417.3482),
			.L_dist_nand_a_y_n(72.99004),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.51902),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(73.43349)
		) irq_prio6_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_a_y(inta6),
			.and_b_y(int_vector6),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n6),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch5),
			.nand_b_in4(irq_latch4),
			.nand_b_in5(irq_latch3),
			.nand_b_in6(irq_latch2),
			.nand_b_in7(irq_latch1),
			.nand_b_in8(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y6),
			.nand_c_y(int_vector5_n),
			.nand_d_y(int_vector4_n),
			.dist_nand_a_in(a6),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n7),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n6),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a14),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n7),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n6),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch6_n),
			.dist_nor_in_p(irq_prio_dist_nor_y_p7),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p6)
		);

	sm83_irq_prio_bit7 #(
			.L_and_a_y(75.20754),
			.L_and_b_y(394.7289),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(3.041223),
			.L_nand_c_y(254.7048),
			.L_nand_d_y(417.3482),
			.L_nand_e_y(502.3766),
			.L_dist_nand_a_y_n(72.73654),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(73.1801),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(73.49692)
		) irq_prio7_inst (
			.pch_n(t4_clk_p),
			.and_in1(dec1_y94),
			.and_a_y(inta7),
			.and_b_y(int_vector7),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n7),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch6),
			.nand_b_in4(irq_latch5),
			.nand_b_in5(irq_latch4),
			.nand_b_in6(irq_latch3),
			.nand_b_in7(irq_latch2),
			.nand_b_in8(irq_latch1),
			.nand_b_in9(irq_latch0),
			.nand_b_y(irq_prio_nand_b_y7),
			.nand_c_y(int_vector5_n),
			.nand_d_y(int_vector4_n),
			.nand_e_y(int_vector3_n),
			.dist_nand_a_in(a7),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n7),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a15),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n7),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in2(irq_latch7_n),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p7)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(184.6292)
		) reg_a0_inst (
			.d(new_reg_hi0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a0)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(539.1253)
		) reg_a1_inst (
			.d(new_reg_hi1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a1)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(460.8139)
		) reg_a2_inst (
			.d(new_reg_hi2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a2)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(387.5061)
		) reg_a3_inst (
			.d(new_reg_hi3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a3)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(538.6149)
		) reg_a4_inst (
			.d(new_reg_hi4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a4)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(201.2294)
		) reg_a5_inst (
			.d(new_reg_hi5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a5)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(390.6741)
		) reg_a6_inst (
			.d(new_reg_hi6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a6)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(486.4894)
		) reg_a7_inst (
			.d(new_reg_hi7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(a_wr_n),
			.clk_n(dec3_y39),
			.q(reg_a7)
		);

	sm83_not_reg_a_wr #(
			.L_y(638.3466)
		) reg_a_not_wr_inst (
			.in(dec3_y39),
			.y(a_wr_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1165.813),
			.L_b_y(1133.182)
		) reg_a_out0_inst (
			.in(reg_a0),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus0_n),
			.b_y(op2bus0_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1165.75),
			.L_b_y(1134.133)
		) reg_a_out1_inst (
			.in(reg_a1),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus1_n),
			.b_y(op2bus1_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1166.447),
			.L_b_y(1134.64)
		) reg_a_out2_inst (
			.in(reg_a2),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus2_n),
			.b_y(op2bus2_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1164.292),
			.L_b_y(1133.879)
		) reg_a_out3_inst (
			.in(reg_a3),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus3_n),
			.b_y(op2bus3_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1163.722),
			.L_b_y(1133.373)
		) reg_a_out4_inst (
			.in(reg_a4),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus4_n),
			.b_y(op2bus4_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1163.785),
			.L_b_y(1131.472)
		) reg_a_out5_inst (
			.in(reg_a5),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus5_n),
			.b_y(op2bus5_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1165.876),
			.L_b_y(1134.83)
		) reg_a_out6_inst (
			.in(reg_a6),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus6_n),
			.b_y(op2bus6_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1164.609),
			.L_b_y(1134.64)
		) reg_a_out7_inst (
			.in(reg_a7),
			.a_ena(dec1_y4_buf),
			.b_ena(dec3_y36),
			.a_y(op1bus7_n),
			.b_y(op2bus7_n)
		);

	sm83_and2_reg #(
			.L_y(1850.822)
		) reg_and_inst (
			.in1(reg_a7),
			.in2(reg_a4),
			.y(reg_and)
		);

	sm83_and2_and3_reg #(
			.L_a_y(652.0952),
			.L_b_y(644.8724)
		) reg_and2_and3_inst (
			.a_in1(alu_dff),
			.a_in2(dec2_y7),
			.a_y(reg_and2_and3_a),
			.b_in1(ir4),
			.b_in2(dec1_y51_buf),
			.b_in3(ir5),
			.b_y(reg_and2_and3_b)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.45262)
		) reg_b0_inst (
			.d(new_reg_hi0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(81.03665)
		) reg_b1_inst (
			.d(new_reg_hi1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.27632)
		) reg_b2_inst (
			.d(new_reg_hi2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.38934)
		) reg_b3_inst (
			.d(new_reg_hi3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.02293)
		) reg_b4_inst (
			.d(new_reg_hi4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.76939)
		) reg_b5_inst (
			.d(new_reg_hi5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.26254)
		) reg_b6_inst (
			.d(new_reg_hi6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.46649)
		) reg_b7_inst (
			.d(new_reg_hi7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(b_wr_n),
			.clk_n(dec3_y50),
			.q(reg_b7)
		);

	sm83_not_reg_b_wr #(
			.L_y(638.8528)
		) reg_b_not_wr_inst (
			.in(dec3_y50),
			.y(b_wr_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1104.417),
			.L_b_y1(991.511),
			.L_y2(1133.182)
		) reg_bc_out0_inst (
			.c_in(reg_c0),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus0_n),
			.b_in(reg_b0),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus0_n),
			.ena1(dec3_y53),
			.y2(op2bus0_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.96),
			.L_b_y1(992.5247),
			.L_y2(1134.133)
		) reg_bc_out1_inst (
			.c_in(reg_c1),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus1_n),
			.b_in(reg_b1),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus1_n),
			.ena1(dec3_y53),
			.y2(op2bus1_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.453),
			.L_b_y1(993.0314),
			.L_y2(1134.64)
		) reg_bc_out2_inst (
			.c_in(reg_c2),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus2_n),
			.b_in(reg_b2),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus2_n),
			.ena1(dec3_y53),
			.y2(op2bus2_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.643),
			.L_b_y1(991.3843),
			.L_y2(1133.879)
		) reg_bc_out3_inst (
			.c_in(reg_c3),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus3_n),
			.b_in(reg_b3),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus3_n),
			.ena1(dec3_y53),
			.y2(op2bus3_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.489),
			.L_b_y1(991.3843),
			.L_y2(1133.373)
		) reg_bc_out4_inst (
			.c_in(reg_c4),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus4_n),
			.b_in(reg_b4),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus4_n),
			.ena1(dec3_y53),
			.y2(op2bus4_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.806),
			.L_b_y1(990.9408),
			.L_y2(1131.472)
		) reg_bc_out5_inst (
			.c_in(reg_c5),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus5_n),
			.b_in(reg_b5),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus5_n),
			.ena1(dec3_y53),
			.y2(op2bus5_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.39),
			.L_b_y1(1005.577),
			.L_y2(1134.83)
		) reg_bc_out6_inst (
			.c_in(reg_c6),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus6_n),
			.b_in(reg_b6),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus6_n),
			.ena1(dec3_y53),
			.y2(op2bus6_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.489),
			.L_b_y1(992.0176),
			.L_y2(1134.64)
		) reg_bc_out7_inst (
			.c_in(reg_c7),
			.c_ena2(dec3_y55),
			.c_y1(lo_bus7_n),
			.b_in(reg_b7),
			.b_ena2(dec3_y54),
			.b_y1(hi_bus7_n),
			.ena1(dec3_y53),
			.y2(op2bus7_n)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(2837.112),
			.L_b_y(1165.813),
			.L_b_y_n(516.7595),
			.L_c_y(1133.182),
			.L_c_y_n(1218.077)
		) reg_bus_pch_a0_inst (
			.pch_n(adr_clk_p),
			.a_y(db0),
			.b_y(op1bus0_n),
			.b_y_n(op1val0),
			.c_y(op2bus0_n),
			.c_y_n(op2val0),
			.c_zero(reg_and2_and3_a)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(2962.755),
			.L_b_y(1165.75),
			.L_b_y_n(699.2974),
			.L_c_y(1134.133),
			.L_c_y_n(1207.127)
		) reg_bus_pch_a1_inst (
			.pch_n(adr_clk_p),
			.a_y(db1),
			.b_y(op1bus1_n),
			.b_y_n(op1val1),
			.c_y(op2bus1_n),
			.c_y_n(op2val1),
			.c_zero(reg_and2_and3_a)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(3090.547),
			.L_b_y(1166.447),
			.L_b_y_n(772.8579),
			.L_c_y(1134.64),
			.L_c_y_n(1314.233)
		) reg_bus_pch_a2_inst (
			.pch_n(adr_clk_p),
			.a_y(db2),
			.b_y(op1bus2_n),
			.b_y_n(op1val2),
			.c_y(op2bus2_n),
			.c_y_n(op2val2),
			.c_zero(reg_and2_and3_a)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(3215.205),
			.L_b_y(1164.292),
			.L_b_y_n(845.4044),
			.L_c_y(1133.879),
			.L_c_y_n(1438.06)
		) reg_bus_pch_a3_inst (
			.pch_n(adr_clk_p),
			.a_y(db3),
			.b_y(op1bus3_n),
			.b_y_n(op1val3),
			.c_y(op2bus3_n),
			.c_y_n(op2val3),
			.c_zero(reg_and2_and3_a)
		);

	sm83_reg_bus_pch_a_bit4 #(
			.L_a_y(3346.099),
			.L_b_y(1163.722),
			.L_b_y_n(953.5588),
			.L_c_y(1133.373),
			.L_c_y_n(1383.86)
		) reg_bus_pch_a4_inst (
			.pch_n(adr_clk_p),
			.a_y(db4),
			.b_y(op1bus4_n),
			.b_y_n(op1val4),
			.c_y(op2bus4_n),
			.c_y_n(op2val4),
			.c_zero_a(reg_and2_and3_a),
			.c_zero_b1(reg_and2_and3_b),
			.c_zero_b2(flag_c)
		);

	sm83_reg_bus_pch_a_bit5 #(
			.L_a_y(3460.447),
			.L_b_y(1163.785),
			.L_b_y_n(1066.973),
			.L_c_y(1131.472),
			.L_c_y_n(1500.013)
		) reg_bus_pch_a5_inst (
			.pch_n(adr_clk_p),
			.a_y(db5),
			.b_y(op1bus5_n),
			.b_y_n(op1val5),
			.c_y(op2bus5_n),
			.c_y_n(op2val5),
			.c_zero_a(reg_and2_and3_a),
			.c_zero_b1(reg_and2_and3_b),
			.c_zero_b2(flag_h)
		);

	sm83_reg_bus_pch_a_bit6 #(
			.L_a_y(3577.412),
			.L_b_y(1165.876),
			.L_b_y_n(1160.681),
			.L_c_y(1134.83),
			.L_c_y_n(1694.116)
		) reg_bus_pch_a6_inst (
			.pch_n(adr_clk_p),
			.a_y(db6),
			.b_y(op1bus6_n),
			.b_y_n(op1val6),
			.c_y(op2bus6_n),
			.c_y_n(op2val6),
			.c_zero_a(reg_and2_and3_a),
			.c_zero_b1(reg_and2_and3_b),
			.c_zero_b2(flag_n)
		);

	sm83_reg_bus_pch_a_bit7 #(
			.L_a_y(3700.271),
			.L_b_y(1164.609),
			.L_b_y_n(1232.847),
			.L_c_y(1134.64),
			.L_c_y_n(1698.424)
		) reg_bus_pch_a7_inst (
			.pch_n(adr_clk_p),
			.a_y(db7),
			.b_y(op1bus7_n),
			.b_y_n(op1val7),
			.c_y(op2bus7_n),
			.c_y_n(op2val7),
			.c_zero_a(reg_and2_and3_a),
			.c_zero_b1(reg_and2_and3_b),
			.c_zero_b2(flag_z)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1104.417),
			.L_b_y(991.511)
		) reg_bus_pch_b0_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus0_n),
			.b_y(hi_bus0_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.96),
			.L_b_y(992.5247)
		) reg_bus_pch_b1_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus1_n),
			.b_y(hi_bus1_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.453),
			.L_b_y(993.0314)
		) reg_bus_pch_b2_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus2_n),
			.b_y(hi_bus2_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.643),
			.L_b_y(991.3843)
		) reg_bus_pch_b3_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus3_n),
			.b_y(hi_bus3_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489),
			.L_b_y(991.3843)
		) reg_bus_pch_b4_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus4_n),
			.b_y(hi_bus4_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.806),
			.L_b_y(990.9408)
		) reg_bus_pch_b5_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus5_n),
			.b_y(hi_bus5_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.39),
			.L_b_y(1005.577)
		) reg_bus_pch_b6_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus6_n),
			.b_y(hi_bus6_n)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489),
			.L_b_y(992.0176)
		) reg_bus_pch_b7_inst (
			.pch_n(adr_clk_p),
			.a_y(lo_bus7_n),
			.b_y(hi_bus7_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.07314)
		) reg_c0_inst (
			.d(new_reg_lo0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.31286)
		) reg_c1_inst (
			.d(new_reg_lo1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.13641)
		) reg_c2_inst (
			.d(new_reg_lo2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.56615)
		) reg_c3_inst (
			.d(new_reg_lo3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.50278)
		) reg_c4_inst (
			.d(new_reg_lo4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.80587)
		) reg_c5_inst (
			.d(new_reg_lo5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.7425)
		) reg_c6_inst (
			.d(new_reg_lo6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.62962)
		) reg_c7_inst (
			.d(new_reg_lo7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(c_wr_n),
			.clk_n(dec3_y52),
			.q(reg_c7)
		);

	sm83_not_reg_wr #(
			.L_y(638.7894)
		) reg_c_not_wr_inst (
			.in(dec3_y52),
			.y(c_wr_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.46407)
		) reg_d0_inst (
			.d(new_reg_hi0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.2243)
		) reg_d1_inst (
			.d(new_reg_hi1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.84406)
		) reg_d2_inst (
			.d(new_reg_hi2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.78088)
		) reg_d3_inst (
			.d(new_reg_hi3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.41447)
		) reg_d4_inst (
			.d(new_reg_hi4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.09766)
		) reg_d5_inst (
			.d(new_reg_hi5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.54112)
		) reg_d6_inst (
			.d(new_reg_hi6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.22421)
		) reg_d7_inst (
			.d(new_reg_hi7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(d_wr_n),
			.clk_n(dec3_y49),
			.q(reg_d7)
		);

	sm83_not_reg_wr #(
			.L_y(639.1063)
		) reg_d_not_wr_inst (
			.in(dec3_y49),
			.y(d_wr_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1104.417),
			.L_d_y1(991.511),
			.L_y2(1133.182)
		) reg_de_out0_inst (
			.e_in(reg_e0),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus0_n),
			.d_in(reg_d0),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus0_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus0_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.96),
			.L_d_y1(992.5247),
			.L_y2(1134.133)
		) reg_de_out1_inst (
			.e_in(reg_e1),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus1_n),
			.d_in(reg_d1),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus1_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus1_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.453),
			.L_d_y1(993.0314),
			.L_y2(1134.64)
		) reg_de_out2_inst (
			.e_in(reg_e2),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus2_n),
			.d_in(reg_d2),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus2_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus2_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.643),
			.L_d_y1(991.3843),
			.L_y2(1133.879)
		) reg_de_out3_inst (
			.e_in(reg_e3),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus3_n),
			.d_in(reg_d3),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus3_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus3_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.489),
			.L_d_y1(991.3843),
			.L_y2(1133.373)
		) reg_de_out4_inst (
			.e_in(reg_e4),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus4_n),
			.d_in(reg_d4),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus4_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus4_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.806),
			.L_d_y1(990.9408),
			.L_y2(1131.472)
		) reg_de_out5_inst (
			.e_in(reg_e5),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus5_n),
			.d_in(reg_d5),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus5_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus5_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.39),
			.L_d_y1(1005.577),
			.L_y2(1134.83)
		) reg_de_out6_inst (
			.e_in(reg_e6),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus6_n),
			.d_in(reg_d6),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus6_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus6_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.489),
			.L_d_y1(992.0176),
			.L_y2(1134.64)
		) reg_de_out7_inst (
			.e_in(reg_e7),
			.e_ena2(dec3_y48),
			.e_y1(lo_bus7_n),
			.d_in(reg_d7),
			.d_ena2(dec3_y47),
			.d_y1(hi_bus7_n),
			.d_zero1(dec2_y22),
			.d_zero2(dec2_y12),
			.ena1(dec3_y46),
			.y2(op2bus7_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(76.41145)
		) reg_e0_inst (
			.d(new_reg_lo0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.8054)
		) reg_e1_inst (
			.d(new_reg_lo1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.04498)
		) reg_e2_inst (
			.d(new_reg_lo2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.48849)
		) reg_e3_inst (
			.d(new_reg_lo3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.42517)
		) reg_e4_inst (
			.d(new_reg_lo4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.55182)
		) reg_e5_inst (
			.d(new_reg_lo5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(76.34798)
		) reg_e6_inst (
			.d(new_reg_lo6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(75.65112)
		) reg_e7_inst (
			.d(new_reg_lo7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(e_wr_n),
			.clk_n(dec3_y51),
			.q(reg_e7)
		);

	sm83_not_reg_h_e_wr #(
			.L_y(638.7262)
		) reg_e_not_wr_inst (
			.in(dec3_y51),
			.y(e_wr_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.00626)
		) reg_h0_inst (
			.d(new_reg_hi0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.56268)
		) reg_h1_inst (
			.d(new_reg_hi1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.06957)
		) reg_h2_inst (
			.d(new_reg_hi2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.13294)
		) reg_h3_inst (
			.d(new_reg_hi3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.32302)
		) reg_h4_inst (
			.d(new_reg_hi4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.57643)
		) reg_h5_inst (
			.d(new_reg_hi5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.87952)
		) reg_h6_inst (
			.d(new_reg_hi6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.43596)
		) reg_h7_inst (
			.d(new_reg_hi7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(h_wr_n),
			.clk_n(dec3_y40),
			.q(reg_h7)
		);

	sm83_not_reg_h_e_wr #(
			.L_y(638.9165)
		) reg_h_not_wr_inst (
			.in(dec3_y40),
			.y(h_wr_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1104.417),
			.L_h_y1(991.511),
			.L_y2(1133.182),
			.L_y3(1165.813)
		) reg_hl_out0_inst (
			.l_in(reg_l0),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus0_n),
			.h_in(reg_h0),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus0_n),
			.ena1(dec3_y43),
			.y2(op2bus0_n),
			.y3(op1bus0_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.96),
			.L_h_y1(992.5247),
			.L_y2(1134.133),
			.L_y3(1165.75)
		) reg_hl_out1_inst (
			.l_in(reg_l1),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus1_n),
			.h_in(reg_h1),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus1_n),
			.ena1(dec3_y43),
			.y2(op2bus1_n),
			.y3(op1bus1_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.453),
			.L_h_y1(993.0314),
			.L_y2(1134.64),
			.L_y3(1166.447)
		) reg_hl_out2_inst (
			.l_in(reg_l2),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus2_n),
			.h_in(reg_h2),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus2_n),
			.ena1(dec3_y43),
			.y2(op2bus2_n),
			.y3(op1bus2_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.643),
			.L_h_y1(991.3843),
			.L_y2(1133.879),
			.L_y3(1164.292)
		) reg_hl_out3_inst (
			.l_in(reg_l3),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus3_n),
			.h_in(reg_h3),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus3_n),
			.ena1(dec3_y43),
			.y2(op2bus3_n),
			.y3(op1bus3_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.489),
			.L_h_y1(991.3843),
			.L_y2(1133.373),
			.L_y3(1163.722)
		) reg_hl_out4_inst (
			.l_in(reg_l4),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus4_n),
			.h_in(reg_h4),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus4_n),
			.ena1(dec3_y43),
			.y2(op2bus4_n),
			.y3(op1bus4_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.806),
			.L_h_y1(990.9408),
			.L_y2(1131.472),
			.L_y3(1163.785)
		) reg_hl_out5_inst (
			.l_in(reg_l5),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus5_n),
			.h_in(reg_h5),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus5_n),
			.ena1(dec3_y43),
			.y2(op2bus5_n),
			.y3(op1bus5_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.39),
			.L_h_y1(1005.577),
			.L_y2(1134.83),
			.L_y3(1165.876)
		) reg_hl_out6_inst (
			.l_in(reg_l6),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus6_n),
			.h_in(reg_h6),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus6_n),
			.ena1(dec3_y43),
			.y2(op2bus6_n),
			.y3(op1bus6_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.489),
			.L_h_y1(992.0176),
			.L_y2(1134.64),
			.L_y3(1164.609)
		) reg_hl_out7_inst (
			.l_in(reg_l7),
			.l_ena2(dec3_y45),
			.l_ena3(dec1_y36_buf),
			.l_y1(lo_bus7_n),
			.h_in(reg_h7),
			.h_ena2(dec3_y44),
			.h_ena3(dec1_y47_buf),
			.h_y1(hi_bus7_n),
			.ena1(dec3_y43),
			.y2(op2bus7_n),
			.y3(op1bus7_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(148.6413),
			.L_q_n(106.8873)
		) reg_ie0_inst (
			.d(db0),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie0),
			.q_n(reg_ie0_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(148.9579),
			.L_q_n(106.6971)
		) reg_ie1_inst (
			.d(db1),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie1),
			.q_n(reg_ie1_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(149.0212),
			.L_q_n(107.3308)
		) reg_ie2_inst (
			.d(db2),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie2),
			.q_n(reg_ie2_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.7319),
			.L_q_n(106.8872)
		) reg_ie3_inst (
			.d(db3),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie3),
			.q_n(reg_ie3_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.8588),
			.L_q_n(106.6339)
		) reg_ie4_inst (
			.d(db4),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie4),
			.q_n(reg_ie4_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(149.9082),
			.L_q_n(106.3804)
		) reg_ie5_inst (
			.d(db5),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie5),
			.q_n(reg_ie5_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.7953),
			.L_q_n(107.3941)
		) reg_ie6_inst (
			.d(db6),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie6),
			.q_n(reg_ie6_n)
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.0984),
			.L_q_n(106.7606)
		) reg_ie7_inst (
			.d(db7),
			.r(sync_reset),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ie_wr_n),
			.clk_n(ie_wr),
			.q(reg_ie7),
			.q_n(reg_ie7_n)
		);

	sm83_not_reg_ie_wr #(
			.L_y(636.6985)
		) reg_ie_not_wr_inst (
			.in(ie_wr),
			.y(ie_wr_n)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2979.35)
		) reg_ir0_inst (
			.d(db0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir0)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3077.304)
		) reg_ir1_inst (
			.d(db1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir1)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3186.978)
		) reg_ir2_inst (
			.d(db2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir2)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(5311.949)
		) reg_ir3_inst (
			.d(db3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir3)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6853.198)
		) reg_ir4_inst (
			.d(db4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir4)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6244.999)
		) reg_ir5_inst (
			.d(db5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir5)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2623.017)
		) reg_ir6_inst (
			.d(db6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir6)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3435.917)
		) reg_ir7_inst (
			.d(db7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(ir_wr_n),
			.clk_n(m1),
			.q(ir7)
		);

	sm83_not_reg_wr #(
			.L_y(639.4232)
		) reg_ir_not_wr_inst (
			.in(m1),
			.y(ir_wr_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.8555)
		) reg_l0_inst (
			.d(new_reg_lo0),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l0)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.42571)
		) reg_l1_inst (
			.d(new_reg_lo1),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l1)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.17229)
		) reg_l2_inst (
			.d(new_reg_lo2),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l2)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.7287)
		) reg_l3_inst (
			.d(new_reg_lo3),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l3)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.36231)
		) reg_l4_inst (
			.d(new_reg_lo4),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l4)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.91887)
		) reg_l5_inst (
			.d(new_reg_lo5),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l5)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.23564)
		) reg_l6_inst (
			.d(new_reg_lo6),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l6)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.10892)
		) reg_l7_inst (
			.d(new_reg_lo7),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(l_wr_n),
			.clk_n(dec3_y41),
			.q(reg_l7)
		);

	sm83_not_reg_l_wr #(
			.L_y(639.55)
		) reg_l_not_wr_inst (
			.in(dec3_y41),
			.y(l_wr_n)
		);

	sm83_not_reg #(
			.L_y(653.6786)
		) reg_not0_inst (
			.in(new_reg_hi0_n),
			.y(new_reg_hi0)
		);

	sm83_not_reg #(
			.L_y(654.6292)
		) reg_not1_inst (
			.in(new_reg_hi1_n),
			.y(new_reg_hi1)
		);

	sm83_not_reg #(
			.L_y(652.855)
		) reg_not2_inst (
			.in(new_reg_hi2_n),
			.y(new_reg_hi2)
		);

	sm83_not_reg #(
			.L_y(653.1085)
		) reg_not3_inst (
			.in(new_reg_hi3_n),
			.y(new_reg_hi3)
		);

	sm83_not_reg #(
			.L_y(653.6788)
		) reg_not4_inst (
			.in(new_reg_hi4_n),
			.y(new_reg_hi4)
		);

	sm83_not_reg #(
			.L_y(652.7283)
		) reg_not5_inst (
			.in(new_reg_hi5_n),
			.y(new_reg_hi5)
		);

	sm83_not_reg #(
			.L_y(652.7283)
		) reg_not6_inst (
			.in(new_reg_hi6_n),
			.y(new_reg_hi6)
		);

	sm83_not_reg #(
			.L_y(654.6926)
		) reg_not7_inst (
			.in(new_reg_hi7_n),
			.y(new_reg_hi7)
		);

	sm83_oa21_reg #(
			.L_y(1688.212)
		) reg_oa1_inst (
			.in1(reg_a1),
			.in2(reg_a2),
			.in3(reg_a3),
			.y(reg_oa1)
		);

	sm83_oa21_reg #(
			.L_y(1712.478)
		) reg_oa2_inst (
			.in1(reg_a5),
			.in2(reg_a6),
			.in3(reg_a7),
			.y(reg_oa2)
		);

	sm83_or2_tap_nor_tap_in1_n_reg #(
			.L_y(618.3875),
			.L_tap_nor(617.9441),
			.L_tap_in1_n(638.0291)
		) reg_or_inst (
			.in1(dec1_y61),
			.in2(dec1_y20_buf),
			.y(reg_or),
			.tap_nor(reg_or_tap_nor),
			.tap_in1_n(reg_or_tap_in1_n)
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(2837.112),
			.L_y2(991.511),
			.L_y3(1104.417),
			.L_y4(1165.813),
			.L_y5(67.1629),
			.L_y6(69.50525)
		) reg_pc_out0_inst (
			.in1(dec2_y27),
			.in2(reg_pcl0_n),
			.in3(dec2_y21),
			.in4(reg_pch0_n),
			.in5(dec2_y18),
			.in6(reg_pch0),
			.in7(dec1_y20_buf),
			.in8(reg_pcl0),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z0),
			.in13(dec3_y68),
			.in14(idu_xor_l0),
			.in15(dec2_y29),
			.in16(reg_w0),
			.in17(idu_xor_h0),
			.y1(db0),
			.y2(hi_bus0_n),
			.y3(lo_bus0_n),
			.y4(op1bus0_n),
			.y5(new_reg_pcl0_n),
			.y6(new_reg_pch0_n)
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(2962.755),
			.L_y2(992.5247),
			.L_y3(1102.96),
			.L_y4(1165.75),
			.L_y5(66.4006),
			.L_y6(69.12511)
		) reg_pc_out1_inst (
			.in1(dec2_y27),
			.in2(reg_pcl1_n),
			.in3(dec2_y21),
			.in4(reg_pch1_n),
			.in5(dec2_y18),
			.in6(reg_pch1),
			.in7(dec1_y20_buf),
			.in8(reg_pcl1),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z1),
			.in13(dec3_y68),
			.in14(idu_xor_l1),
			.in15(dec2_y29),
			.in16(reg_w1),
			.in17(idu_xor_h1),
			.y1(db1),
			.y2(hi_bus1_n),
			.y3(lo_bus1_n),
			.y4(op1bus1_n),
			.y5(new_reg_pcl1_n),
			.y6(new_reg_pch1_n)
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(3090.547),
			.L_y2(993.0314),
			.L_y3(1102.453),
			.L_y4(1166.447),
			.L_y5(66.14721),
			.L_y6(69.75874)
		) reg_pc_out2_inst (
			.in1(dec2_y27),
			.in2(reg_pcl2_n),
			.in3(dec2_y21),
			.in4(reg_pch2_n),
			.in5(dec2_y18),
			.in6(reg_pch2),
			.in7(dec1_y20_buf),
			.in8(reg_pcl2),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z2),
			.in13(dec3_y68),
			.in14(idu_xor_l2),
			.in15(dec2_y29),
			.in16(reg_w2),
			.in17(idu_xor_h2),
			.y1(db2),
			.y2(hi_bus2_n),
			.y3(lo_bus2_n),
			.y4(op1bus2_n),
			.y5(new_reg_pcl2_n),
			.y6(new_reg_pch2_n)
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(3215.205),
			.L_y2(991.3843),
			.L_y3(1102.643),
			.L_y4(1164.292),
			.L_y5(66.1473),
			.L_y6(70.13888)
		) reg_pc_out3_inst (
			.in1(dec2_y27),
			.in2(reg_pcl3_n),
			.in3(dec2_y21),
			.in4(reg_pch3_n),
			.in5(dec2_y18),
			.in6(reg_pch3),
			.in7(dec1_y20_buf),
			.in8(reg_pcl3),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z3),
			.in13(dec3_y68),
			.in14(idu_xor_l3),
			.in15(dec2_y29),
			.in16(reg_w3),
			.in17(idu_xor_h3),
			.in18(int_vector3),
			.in19(dec1_y93),
			.in20(ir3),
			.y1(db3),
			.y2(hi_bus3_n),
			.y3(lo_bus3_n),
			.y4(op1bus3_n),
			.y5(new_reg_pcl3_n),
			.y6(new_reg_pch3_n)
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(3346.099),
			.L_y2(991.3843),
			.L_y3(1100.489),
			.L_y4(1163.722),
			.L_y5(66.97082),
			.L_y6(69.31517)
		) reg_pc_out4_inst (
			.in1(dec2_y27),
			.in2(reg_pcl4_n),
			.in3(dec2_y21),
			.in4(reg_pch4_n),
			.in5(dec2_y18),
			.in6(reg_pch4),
			.in7(dec1_y20_buf),
			.in8(reg_pcl4),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z4),
			.in13(dec3_y68),
			.in14(idu_xor_l4),
			.in15(dec2_y29),
			.in16(reg_w4),
			.in17(idu_xor_h4),
			.in18(int_vector4),
			.in19(dec1_y93),
			.in20(ir4),
			.y1(db4),
			.y2(hi_bus4_n),
			.y3(lo_bus4_n),
			.y4(op1bus4_n),
			.y5(new_reg_pcl4_n),
			.y6(new_reg_pch4_n)
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(3460.447),
			.L_y2(990.9408),
			.L_y3(1100.806),
			.L_y4(1163.785),
			.L_y5(67.35095),
			.L_y6(70.01213)
		) reg_pc_out5_inst (
			.in1(dec2_y27),
			.in2(reg_pcl5_n),
			.in3(dec2_y21),
			.in4(reg_pch5_n),
			.in5(dec2_y18),
			.in6(reg_pch5),
			.in7(dec1_y20_buf),
			.in8(reg_pcl5),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z5),
			.in13(dec3_y68),
			.in14(idu_xor_l5),
			.in15(dec2_y29),
			.in16(reg_w5),
			.in17(idu_xor_h5),
			.in18(int_vector5),
			.in19(dec1_y93),
			.in20(ir5),
			.y1(db5),
			.y2(hi_bus5_n),
			.y3(lo_bus5_n),
			.y4(op1bus5_n),
			.y5(new_reg_pcl5_n),
			.y6(new_reg_pch5_n)
		);

	sm83_reg_pc_out_bit67 #(
			.L_y1(3577.412),
			.L_y2(1005.577),
			.L_y3(1102.39),
			.L_y4(1165.876),
			.L_y5(67.41438),
			.L_y6(69.50516)
		) reg_pc_out6_inst (
			.in1(dec2_y27),
			.in2(reg_pcl6_n),
			.in3(dec2_y21),
			.in4(reg_pch6_n),
			.in5(dec2_y18),
			.in6(reg_pch6),
			.in7(dec1_y20_buf),
			.in8(reg_pcl6),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z6),
			.in13(dec3_y68),
			.in14(idu_xor_l6),
			.in15(dec2_y29),
			.in16(reg_w6),
			.in17(idu_xor_h6),
			.in18(int_vector6),
			.y1(db6),
			.y2(hi_bus6_n),
			.y3(lo_bus6_n),
			.y4(op1bus6_n),
			.y5(new_reg_pcl6_n),
			.y6(new_reg_pch6_n)
		);

	sm83_reg_pc_out_bit67 #(
			.L_y1(3700.271),
			.L_y2(992.0176),
			.L_y3(1100.489),
			.L_y4(1164.609),
			.L_y5(66.97091),
			.L_y6(70.01213)
		) reg_pc_out7_inst (
			.in1(dec2_y27),
			.in2(reg_pcl7_n),
			.in3(dec2_y21),
			.in4(reg_pch7_n),
			.in5(dec2_y18),
			.in6(reg_pch7),
			.in7(dec1_y20_buf),
			.in8(reg_pcl7),
			.in9(dec3_y34),
			.in10(t4_clk_p),
			.in11(dec2_y29),
			.in12(reg_z7),
			.in13(dec3_y68),
			.in14(idu_xor_l7),
			.in15(dec2_y29),
			.in16(reg_w7),
			.in17(idu_xor_h7),
			.in18(int_vector7),
			.y1(db7),
			.y2(hi_bus7_n),
			.y3(lo_bus7_n),
			.y4(op1bus7_n),
			.y5(new_reg_pcl7_n),
			.y6(new_reg_pch7_n)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.50525),
			.L_q(69.82197),
			.L_q_n(85.78866)
		) reg_pch0_inst (
			.d(new_reg_pch0_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch0_n),
			.q_n(reg_pch0)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.12511),
			.L_q(68.93504),
			.L_q_n(86.54903)
		) reg_pch1_inst (
			.d(new_reg_pch1_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch1_n),
			.q_n(reg_pch1)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.75874),
			.L_q(69.63199),
			.L_q_n(84.77469)
		) reg_pch2_inst (
			.d(new_reg_pch2_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch2_n),
			.q_n(reg_pch2)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.13888),
			.L_q(69.69522),
			.L_q_n(84.71146)
		) reg_pch3_inst (
			.d(new_reg_pch3_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch3_n),
			.q_n(reg_pch3)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.31517),
			.L_q(70.01213),
			.L_q_n(84.90154)
		) reg_pch4_inst (
			.d(new_reg_pch4_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch4_n),
			.q_n(reg_pch4)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.01213),
			.L_q(69.69531),
			.L_q_n(85.66171)
		) reg_pch5_inst (
			.d(new_reg_pch5_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch5_n),
			.q_n(reg_pch5)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.50516),
			.L_q(70.01213),
			.L_q_n(85.53516)
		) reg_pch6_inst (
			.d(new_reg_pch6_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch6_n),
			.q_n(reg_pch6)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.01213),
			.L_q(70.64567),
			.L_q_n(85.21835)
		) reg_pch7_inst (
			.d(new_reg_pch7_n),
			.pch_n(buke),
			.s_n(pch_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pch_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pch7_n),
			.q_n(reg_pch7)
		);

	sm83_not2_reg_pc_wr #(
			.L_a_y(636.3182),
			.L_b_y(1277.642)
		) reg_pch_not_wr_inst (
			.a_in(dec3_y69),
			.a_y(pch_wr_n),
			.b_in(sync_reset),
			.b_y(pch_reset_n)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.1629),
			.L_q(69.63209),
			.L_q_n(84.33142)
		) reg_pcl0_inst (
			.d(new_reg_pcl0_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl0_n),
			.q_n(reg_pcl0)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.4006),
			.L_q(70.01203),
			.L_q_n(84.58472)
		) reg_pcl1_inst (
			.d(new_reg_pcl1_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl1_n),
			.q_n(reg_pcl1)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.14721),
			.L_q(70.13878),
			.L_q_n(84.33132)
		) reg_pcl2_inst (
			.d(new_reg_pcl2_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl2_n),
			.q_n(reg_pcl2)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.1473),
			.L_q(70.01213),
			.L_q_n(85.15493)
		) reg_pcl3_inst (
			.d(new_reg_pcl3_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl3_n),
			.q_n(reg_pcl3)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.97082),
			.L_q(70.26543),
			.L_q_n(84.0146)
		) reg_pcl4_inst (
			.d(new_reg_pcl4_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl4_n),
			.q_n(reg_pcl4)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.35095),
			.L_q(70.51892),
			.L_q_n(84.52139)
		) reg_pcl5_inst (
			.d(new_reg_pcl5_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl5_n),
			.q_n(reg_pcl5)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.41438),
			.L_q(70.26563),
			.L_q_n(84.52139)
		) reg_pcl6_inst (
			.d(new_reg_pcl6_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl6_n),
			.q_n(reg_pcl6)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.97091),
			.L_q(70.64577),
			.L_q_n(83.69778)
		) reg_pcl7_inst (
			.d(new_reg_pcl7_n),
			.pch_n(buke),
			.s_n(pcl_reset_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(pcl_wr_n),
			.clk_n(dec3_y69),
			.q(reg_pcl7_n),
			.q_n(reg_pcl7)
		);

	sm83_not2_reg_pc_wr #(
			.L_a_y(636.1281),
			.L_b_y(1276.882)
		) reg_pcl_not_wr_inst (
			.a_in(dec3_y69),
			.a_y(pcl_wr_n),
			.b_in(sync_reset),
			.b_y(pcl_reset_n)
		);

	sm83_reg_sp_out #(
			.L_y1(2837.112),
			.L_y2(1165.813),
			.L_y3(1133.182),
			.L_y4(1104.417),
			.L_y5(991.511),
			.L_y6(74.32063),
			.L_y7(62.28228)
		) reg_sp_out0_inst (
			.in1(dec1_y61),
			.in2(reg_spl0_n),
			.in3(dec1_y67),
			.in4(reg_sph0_n),
			.in5(dec2_y16),
			.in6(reg_spl0),
			.in7(dec2_y7),
			.in8(reg_sph0),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w0),
			.in17(dec3_y63),
			.in18(idu_xor_h0),
			.in19(idu_xor_l0),
			.in20(reg_z0),
			.y1(db0),
			.y2(op1bus0_n),
			.y3(op2bus0_n),
			.y4(lo_bus0_n),
			.y5(hi_bus0_n),
			.y6(new_reg_sph0_n),
			.y7(new_reg_spl0_n)
		);

	sm83_reg_sp_out #(
			.L_y1(2962.755),
			.L_y2(1165.75),
			.L_y3(1134.133),
			.L_y4(1102.96),
			.L_y5(992.5247),
			.L_y6(73.94048),
			.L_y7(62.85249)
		) reg_sp_out1_inst (
			.in1(dec1_y61),
			.in2(reg_spl1_n),
			.in3(dec1_y67),
			.in4(reg_sph1_n),
			.in5(dec2_y16),
			.in6(reg_spl1),
			.in7(dec2_y7),
			.in8(reg_sph1),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w1),
			.in17(dec3_y63),
			.in18(idu_xor_h1),
			.in19(idu_xor_l1),
			.in20(reg_z1),
			.y1(db1),
			.y2(op1bus1_n),
			.y3(op2bus1_n),
			.y4(lo_bus1_n),
			.y5(hi_bus1_n),
			.y6(new_reg_sph1_n),
			.y7(new_reg_spl1_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3090.547),
			.L_y2(1166.447),
			.L_y3(1134.64),
			.L_y4(1102.453),
			.L_y5(993.0314),
			.L_y6(74.63744),
			.L_y7(62.66252)
		) reg_sp_out2_inst (
			.in1(dec1_y61),
			.in2(reg_spl2_n),
			.in3(dec1_y67),
			.in4(reg_sph2_n),
			.in5(dec2_y16),
			.in6(reg_spl2),
			.in7(dec2_y7),
			.in8(reg_sph2),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w2),
			.in17(dec3_y63),
			.in18(idu_xor_h2),
			.in19(idu_xor_l2),
			.in20(reg_z2),
			.y1(db2),
			.y2(op1bus2_n),
			.y3(op2bus2_n),
			.y4(lo_bus2_n),
			.y5(hi_bus2_n),
			.y6(new_reg_sph2_n),
			.y7(new_reg_spl2_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3215.205),
			.L_y2(1164.292),
			.L_y3(1133.879),
			.L_y4(1102.643),
			.L_y5(991.3843),
			.L_y6(73.94029),
			.L_y7(62.97924)
		) reg_sp_out3_inst (
			.in1(dec1_y61),
			.in2(reg_spl3_n),
			.in3(dec1_y67),
			.in4(reg_sph3_n),
			.in5(dec2_y16),
			.in6(reg_spl3),
			.in7(dec2_y7),
			.in8(reg_sph3),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w3),
			.in17(dec3_y63),
			.in18(idu_xor_h3),
			.in19(idu_xor_l3),
			.in20(reg_z3),
			.y1(db3),
			.y2(op1bus3_n),
			.y3(op2bus3_n),
			.y4(lo_bus3_n),
			.y5(hi_bus3_n),
			.y6(new_reg_sph3_n),
			.y7(new_reg_spl3_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3346.099),
			.L_y2(1163.722),
			.L_y3(1133.373),
			.L_y4(1100.489),
			.L_y5(991.3843),
			.L_y6(73.75022),
			.L_y7(62.47235)
		) reg_sp_out4_inst (
			.in1(dec1_y61),
			.in2(reg_spl4_n),
			.in3(dec1_y67),
			.in4(reg_sph4_n),
			.in5(dec2_y16),
			.in6(reg_spl4),
			.in7(dec2_y7),
			.in8(reg_sph4),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w4),
			.in17(dec3_y63),
			.in18(idu_xor_h4),
			.in19(idu_xor_l4),
			.in20(reg_z4),
			.y1(db4),
			.y2(op1bus4_n),
			.y3(op2bus4_n),
			.y4(lo_bus4_n),
			.y5(hi_bus4_n),
			.y6(new_reg_sph4_n),
			.y7(new_reg_spl4_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3460.447),
			.L_y2(1163.785),
			.L_y3(1131.472),
			.L_y4(1100.806),
			.L_y5(990.9408),
			.L_y6(74.44727),
			.L_y7(62.85259)
		) reg_sp_out5_inst (
			.in1(dec1_y61),
			.in2(reg_spl5_n),
			.in3(dec1_y67),
			.in4(reg_sph5_n),
			.in5(dec2_y16),
			.in6(reg_spl5),
			.in7(dec2_y7),
			.in8(reg_sph5),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w5),
			.in17(dec3_y63),
			.in18(idu_xor_h5),
			.in19(idu_xor_l5),
			.in20(reg_z5),
			.y1(db5),
			.y2(op1bus5_n),
			.y3(op2bus5_n),
			.y4(lo_bus5_n),
			.y5(hi_bus5_n),
			.y6(new_reg_sph5_n),
			.y7(new_reg_spl5_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3577.412),
			.L_y2(1165.876),
			.L_y3(1134.83),
			.L_y4(1102.39),
			.L_y5(1005.577),
			.L_y6(75.65102),
			.L_y7(63.42271)
		) reg_sp_out6_inst (
			.in1(dec1_y61),
			.in2(reg_spl6_n),
			.in3(dec1_y67),
			.in4(reg_sph6_n),
			.in5(dec2_y16),
			.in6(reg_spl6),
			.in7(dec2_y7),
			.in8(reg_sph6),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w6),
			.in17(dec3_y63),
			.in18(idu_xor_h6),
			.in19(idu_xor_l6),
			.in20(reg_z6),
			.y1(db6),
			.y2(op1bus6_n),
			.y3(op2bus6_n),
			.y4(lo_bus6_n),
			.y5(hi_bus6_n),
			.y6(new_reg_sph6_n),
			.y7(new_reg_spl6_n)
		);

	sm83_reg_sp_out #(
			.L_y1(3700.271),
			.L_y2(1164.609),
			.L_y3(1134.64),
			.L_y4(1100.489),
			.L_y5(992.0176),
			.L_y6(74.57391),
			.L_y7(63.16931)
		) reg_sp_out7_inst (
			.in1(dec1_y61),
			.in2(reg_spl7_n),
			.in3(dec1_y67),
			.in4(reg_sph7_n),
			.in5(dec2_y16),
			.in6(reg_spl7),
			.in7(dec2_y7),
			.in8(reg_sph7),
			.in9(dec1_y36_buf),
			.in10(ir4),
			.in11(ir5),
			.in12(dec1_y47_buf),
			.in13(dec3_y66),
			.in14(t4_clk_p),
			.in15(dec3_y64),
			.in16(reg_w7),
			.in17(dec3_y63),
			.in18(idu_xor_h7),
			.in19(idu_xor_l7),
			.in20(reg_z7),
			.y1(db7),
			.y2(op1bus7_n),
			.y3(op2bus7_n),
			.y4(lo_bus7_n),
			.y5(hi_bus7_n),
			.y6(new_reg_sph7_n),
			.y7(new_reg_spl7_n)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.32063),
			.L_q(61.96537),
			.L_q_n(85.15502)
		) reg_sph0_inst (
			.d(new_reg_sph0_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph0_n),
			.q_n(reg_sph0)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.94048),
			.L_q(62.53578),
			.L_q_n(85.15502)
		) reg_sph1_inst (
			.d(new_reg_sph1_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph1_n),
			.q_n(reg_sph1)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.63744),
			.L_q(61.90205),
			.L_q_n(85.02818)
		) reg_sph2_inst (
			.d(new_reg_sph2_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph2_n),
			.q_n(reg_sph2)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.94029),
			.L_q(62.34561),
			.L_q_n(85.66181)
		) reg_sph3_inst (
			.d(new_reg_sph3_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph3_n),
			.q_n(reg_sph3)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.75022),
			.L_q(62.97924),
			.L_q_n(85.28176)
		) reg_sph4_inst (
			.d(new_reg_sph4_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph4_n),
			.q_n(reg_sph4)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.44727),
			.L_q(62.91592),
			.L_q_n(85.85197)
		) reg_sph5_inst (
			.d(new_reg_sph5_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph5_n),
			.q_n(reg_sph5)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(75.65102),
			.L_q(62.47235),
			.L_q_n(85.59859)
		) reg_sph6_inst (
			.d(new_reg_sph6_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph6_n),
			.q_n(reg_sph6)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.57391),
			.L_q(62.15544),
			.L_q_n(85.85198)
		) reg_sph7_inst (
			.d(new_reg_sph7_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(sph_wr_n),
			.clk_n(dec3_y62),
			.q(reg_sph7_n),
			.q_n(reg_sph7)
		);

	sm83_not_reg_sp_wr #(
			.L_y(639.423)
		) reg_sph_not_wr_inst (
			.in(dec3_y62),
			.y(sph_wr_n)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.28228),
			.L_q(61.7753),
			.L_q_n(91.3008)
		) reg_spl0_inst (
			.d(new_reg_spl0_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl0_n),
			.q_n(reg_spl0)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.85249),
			.L_q(62.02889),
			.L_q_n(90.98407)
		) reg_spl1_inst (
			.d(new_reg_spl1_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl1_n),
			.q_n(reg_spl1)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.66252),
			.L_q(62.97924),
			.L_q_n(89.59016)
		) reg_spl2_inst (
			.d(new_reg_spl2_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl2_n),
			.q_n(reg_spl2)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.97924),
			.L_q(62.91582),
			.L_q_n(90.41386)
		) reg_spl3_inst (
			.d(new_reg_spl3_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl3_n),
			.q_n(reg_spl3)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.47235),
			.L_q(62.97924),
			.L_q_n(89.78033)
		) reg_spl4_inst (
			.d(new_reg_spl4_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl4_n),
			.q_n(reg_spl4)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.85259),
			.L_q(62.85249),
			.L_q_n(90.09705)
		) reg_spl5_inst (
			.d(new_reg_spl5_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl5_n),
			.q_n(reg_spl5)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(63.42271),
			.L_q(62.91592),
			.L_q_n(90.60403)
		) reg_spl6_inst (
			.d(new_reg_spl6_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl6_n),
			.q_n(reg_spl6)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(63.16931),
			.L_q(63.23264),
			.L_q_n(89.65349)
		) reg_spl7_inst (
			.d(new_reg_spl7_n),
			.pch_n(buke),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(spl_wr_n),
			.clk_n(dec3_y62),
			.q(reg_spl7_n),
			.q_n(reg_spl7)
		);

	sm83_not_reg_sp_wr #(
			.L_y(638.7259)
		) reg_spl_not_wr_inst (
			.in(dec3_y62),
			.y(spl_wr_n)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9099)
		) reg_w0_inst (
			.d(new_reg_w0_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w0)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.4306)
		) reg_w1_inst (
			.d(new_reg_w1_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w1)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.3538)
		) reg_w2_inst (
			.d(new_reg_w2_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w2)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.2269)
		) reg_w3_inst (
			.d(new_reg_w3_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w3)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9101)
		) reg_w4_inst (
			.d(new_reg_w4_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w4)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.8109)
		) reg_w5_inst (
			.d(new_reg_w5_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w5)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.7336)
		) reg_w6_inst (
			.d(new_reg_w6_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w6)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.0367)
		) reg_w7_inst (
			.d(new_reg_w7_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(w_wr_n),
			.clk_n(dec3_y60),
			.q_n(reg_w7)
		);

	sm83_not_reg_wr #(
			.L_y(638.6625)
		) reg_w_not_wr_inst (
			.in(dec3_y60),
			.y(w_wr_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.5721),
			.L_aoi_b_y(76.15791),
			.L_muxi_a_y(127.4158),
			.L_muxi_b_y(167.1421),
			.L_nand_y(1133.182),
			.L_oai21_y(991.511),
			.L_oai31_y(1104.417)
		) reg_wz_out0_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res0),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l0),
			.aoi_b_in3_muxi_b_d1(idu_xor_h0),
			.aoi_a_y_n(new_reg_lo0),
			.aoi_b_y(new_reg_hi0_n),
			.muxi_d0(db0),
			.muxi_a_y(new_reg_z0_n),
			.muxi_b_y(new_reg_w0_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus0_n),
			.oai21_in_aoi_b_in2(reg_w0),
			.oai21_y(hi_bus0_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z0),
			.oai31_y(lo_bus0_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(508.2055),
			.L_aoi_b_y(75.84119),
			.L_muxi_a_y(127.6058),
			.L_muxi_b_y(167.3954),
			.L_nand_y(1134.133),
			.L_oai21_y(992.5247),
			.L_oai31_y(1102.96)
		) reg_wz_out1_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res1),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l1),
			.aoi_b_in3_muxi_b_d1(idu_xor_h1),
			.aoi_a_y_n(new_reg_lo1),
			.aoi_b_y(new_reg_hi1_n),
			.muxi_d0(db1),
			.muxi_a_y(new_reg_z1_n),
			.muxi_b_y(new_reg_w1_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus1_n),
			.oai21_in_aoi_b_in2(reg_w1),
			.oai21_y(hi_bus1_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z1),
			.oai31_y(lo_bus1_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.3184),
			.L_aoi_b_y(75.96793),
			.L_muxi_a_y(126.7188),
			.L_muxi_b_y(167.6491),
			.L_nand_y(1134.64),
			.L_oai21_y(993.0314),
			.L_oai31_y(1102.453)
		) reg_wz_out2_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res2),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l2),
			.aoi_b_in3_muxi_b_d1(idu_xor_h2),
			.aoi_a_y_n(new_reg_lo2),
			.aoi_b_y(new_reg_hi2_n),
			.muxi_d0(db2),
			.muxi_a_y(new_reg_z2_n),
			.muxi_b_y(new_reg_w2_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus2_n),
			.oai21_in_aoi_b_in2(reg_w2),
			.oai21_y(hi_bus2_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z2),
			.oai31_y(lo_bus2_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.5582),
			.L_aoi_b_y(75.84109),
			.L_muxi_a_y(127.3523),
			.L_muxi_b_y(166.5718),
			.L_nand_y(1133.879),
			.L_oai21_y(991.3843),
			.L_oai31_y(1102.643)
		) reg_wz_out3_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res3),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l3),
			.aoi_b_in3_muxi_b_d1(idu_xor_h3),
			.aoi_a_y_n(new_reg_lo3),
			.aoi_b_y(new_reg_hi3_n),
			.muxi_d0(db3),
			.muxi_a_y(new_reg_z3_n),
			.muxi_b_y(new_reg_w3_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus3_n),
			.oai21_in_aoi_b_in2(reg_w3),
			.oai21_y(hi_bus3_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z3),
			.oai31_y(lo_bus3_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.6852),
			.L_aoi_b_y(76.22133),
			.L_muxi_a_y(126.6554),
			.L_muxi_b_y(166.5718),
			.L_nand_y(1133.373),
			.L_oai21_y(991.3843),
			.L_oai31_y(1100.489)
		) reg_wz_out4_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res4),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l4),
			.aoi_b_in3_muxi_b_d1(idu_xor_h4),
			.aoi_a_y_n(new_reg_lo4),
			.aoi_b_y(new_reg_hi4_n),
			.muxi_d0(db4),
			.muxi_a_y(new_reg_z4_n),
			.muxi_b_y(new_reg_w4_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus4_n),
			.oai21_in_aoi_b_in2(reg_w4),
			.oai21_y(hi_bus4_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z4),
			.oai31_y(lo_bus4_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.3047),
			.L_aoi_b_y(76.53815),
			.L_muxi_a_y(128.0493),
			.L_muxi_b_y(167.0788),
			.L_nand_y(1131.472),
			.L_oai21_y(990.9408),
			.L_oai31_y(1100.806)
		) reg_wz_out5_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res5),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l5),
			.aoi_b_in3_muxi_b_d1(idu_xor_h5),
			.aoi_a_y_n(new_reg_lo5),
			.aoi_b_y(new_reg_hi5_n),
			.muxi_d0(db5),
			.muxi_a_y(new_reg_z5_n),
			.muxi_b_y(new_reg_w5_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus5_n),
			.oai21_in_aoi_b_in2(reg_w5),
			.oai21_y(hi_bus5_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z5),
			.oai31_y(lo_bus5_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.6848),
			.L_aoi_b_y(76.53804),
			.L_muxi_a_y(126.9089),
			.L_muxi_b_y(167.3322),
			.L_nand_y(1134.83),
			.L_oai21_y(1005.577),
			.L_oai31_y(1102.39)
		) reg_wz_out6_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res6),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l6),
			.aoi_b_in3_muxi_b_d1(idu_xor_h6),
			.aoi_a_y_n(new_reg_lo6),
			.aoi_b_y(new_reg_hi6_n),
			.muxi_d0(db6),
			.muxi_a_y(new_reg_z6_n),
			.muxi_b_y(new_reg_w6_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus6_n),
			.oai21_in_aoi_b_in2(reg_w6),
			.oai21_y(hi_bus6_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z6),
			.oai31_y(lo_bus6_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.2552),
			.L_aoi_b_y(75.90461),
			.L_muxi_a_y(127.7325),
			.L_muxi_b_y(166.9519),
			.L_nand_y(1134.64),
			.L_oai21_y(992.0176),
			.L_oai31_y(1100.489)
		) reg_wz_out7_inst (
			.pch_n(phi_clk_n),
			.aoi_in1(res7),
			.aoi_ena1(dec3_nor2),
			.aoi_ena2(dec3_y57),
			.aoi_ena3(dec3_nor1),
			.aoi_a_in3_muxi_a_d1(idu_xor_l7),
			.aoi_b_in3_muxi_b_d1(idu_xor_h7),
			.aoi_a_y_n(new_reg_lo7),
			.aoi_b_y(new_reg_hi7_n),
			.muxi_d0(db7),
			.muxi_a_y(new_reg_z7_n),
			.muxi_b_y(new_reg_w7_n),
			.muxi_a_sel(dec1_y61),
			.muxi_a_sel_n(reg_or_tap_in1_n),
			.muxi_b_sel(reg_or),
			.muxi_b_sel_n(reg_or_tap_nor),
			.nand_ena(dec3_y59),
			.nand_y(op2bus7_n),
			.oai21_in_aoi_b_in2(reg_w7),
			.oai21_y(hi_bus7_n),
			.oai_ena1(dec1_y104_buf),
			.oai_ena2(dec2_y2),
			.oai_ena3(dec2_y12),
			.oai31_in_nand_in_aoi_a_in2(reg_z7),
			.oai31_y(lo_bus7_n)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.3767)
		) reg_z0_inst (
			.d(new_reg_z0_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z0)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(607.6166)
		) reg_z1_inst (
			.d(new_reg_z1_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z1)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.6303)
		) reg_z2_inst (
			.d(new_reg_z2_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z2)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.5669)
		) reg_z3_inst (
			.d(new_reg_z3_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z3)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2305.746)
		) reg_z4_inst (
			.d(new_reg_z4_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z4)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2264.402)
		) reg_z5_inst (
			.d(new_reg_z5_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z5)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2417.375)
		) reg_z6_inst (
			.d(new_reg_z6_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z6)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(3175.844)
		) reg_z7_inst (
			.d(new_reg_z7_n),
			.ena(t4_clk_p),
			.ena_n(t4_clk_n),
			.clk(z_wr_n),
			.clk_n(dec3_y61),
			.q_n(reg_z7)
		);

	sm83_not_reg_wr #(
			.L_y(638.8528)
		) reg_z_not_wr_inst (
			.in(dec3_y61),
			.y(z_wr_n)
		);

	sm83_nand2_spare #(
			.L_y(43.08442)
		) spare_nand_inst (
			.in1(dec3_y16),
			.in2(dec3_y16),
			.y(spare_y)
		);

	sm83_nor2_spare #(
			.L_y(43.08442)
		) spare_nor_inst (
			.in1(dec3_y16),
			.in2(dec3_y16),
			.y(spare_y)
		);

	sm83_tie #(
			.L_gnd(32966.6),
			.L_vdd(25766.37)
		) supply_inst (
			.gnd(gnd),
			.vdd(vdd)
		);

	sm83_and2_in1_n_tap_in1 #(
			.L_y(196.7943),
			.L_tap_in1(367.421)
		) vequ_inst (
			.in1_n(xdqf),
			.in2(dec2_y13),
			.y(vequ),
			.tap_in1(vequ_tap_in1)
		);

	sm83_nor2_e #(
			.L_y(27.24453)
		) wafr_inst (
			.in1(dec3_not68),
			.in2(unor),
			.y(wafr)
		);

	sm83_nor2_d #(
			.L_y(157.0681)
		) wagr_inst (
			.in1(ycnf),
			.in2(alu_not9),
			.y(wagr)
		);

	sm83_oa21 #(
			.L_y(1694.611)
		) wdin_inst (
			.in1(m1),
			.in2(dec2_y13),
			.in3(wafr),
			.y(rd)
		);

	sm83_nand2_in1_n_b #(
			.L_y(54.61588)
		) ween_inst (
			.in1_n(dec2_y26),
			.in2(wagr),
			.y(ween)
		);

	sm83_nand2_in1_n_a #(
			.L_y(67.28761)
		) werf_inst (
			.in1_n(dec2_y25),
			.in2(wagr),
			.y(werf)
		);

	sm83_nand2_in1_n_c #(
			.L_y(73.1167)
		) wudz_inst (
			.in1_n(dec2_y14),
			.in2(wagr),
			.y(wudz)
		);

	sm83_dff_cc_q #(
			.L_q(167.5223)
		) xaym_inst (
			.d(wudz),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(xaym)
		);

	sm83_dff_cc_q #(
			.L_q(461.0666)
		) xdqf_inst (
			.d(vequ),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(xdqf)
		);

	sm83_dff_cc_q #(
			.L_q(184.3758)
		) xirf_inst (
			.d(ween),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(xirf)
		);

	sm83_ao31_in3_n #(
			.L_y(377.3053)
		) xogs_inst (
			.in1(phi_clk_n),
			.in2(m1),
			.in3_n(dec1_y103),
			.in4(ycnf),
			.y(xogs)
		);

	sm83_aoi21_b #(
			.L_y(167.6778)
		) xtip_inst (
			.in1(xurg),
			.in2(xudo),
			.in3(gnd),
			.y(xtip)
		);

	sm83_not_f #(
			.L_y(29.90562)
		) xudo_inst (
			.in(xufu_buf),
			.y(xudo)
		);

	sm83_dff_cc_q_alt #(
			.L_q(164.3542)
		) xufu_inst (
			.d(werf),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(xufu)
		);

	sm83_dffre_cc_q #(
			.L_q(122.6638)
		) xurg_inst (
			.d(dec1_y103),
			.clk(xuri),
			.clk_n(m1),
			.ena(t4_clk_p),
			.r(ynkw),
			.q(xurg)
		);

	sm83_not_d #(
			.L_y(71.27934)
		) xuri_inst (
			.in(m1),
			.y(xuri)
		);

	sm83_not_e #(
			.L_y(1011.47)
		) xwee_inst (
			.in(ynkw),
			.y(halt_n)
		);

	sm83_nor3 #(
			.L_y(58.1639)
		) xygb_inst (
			.in1(gnd),
			.in2(ycnf),
			.in3(zacw),
			.y(xygb)
		);

	sm83_or3_b #(
			.L_y(445.7336)
		) ycnf_inst (
			.in1(ynkw),
			.in2(sync_reset),
			.in3(gnd),
			.y(ycnf)
		);

	sm83_dff_cc_q #(
			.L_q(47.13942)
		) ydxa_inst (
			.d(nmi_n),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(ydxa)
		);

	sm83_not_c #(
			.L_y(163.0235)
		) yepj_inst (
			.in(nmi),
			.y(nmi_n)
		);

	sm83_oai21 #(
			.L_y(163.5307)
		) ykua_inst (
			.in1(yolu),
			.in2(yoii),
			.in3(zhzo),
			.y(ykua)
		);

	sm83_aoi21_a #(
			.L_y(209.8464)
		) yneu_inst (
			.in1(zrby),
			.in2(dec1_y94),
			.in3(sync_reset),
			.y(yneu)
		);

	sm83_nor2_c #(
			.L_y(77.86861)
		) yniu_inst (
			.in1(yodp),
			.in2(nmi_n),
			.y(yniu)
		);

	sm83_srlatch_r_n_alt #(
			.L_q(247.9886)
		) ynkw_inst (
			.s(ynoz),
			.r_n(ykua),
			.q(ynkw)
		);

	sm83_or3_a #(
			.L_y(29.3987)
		) ynoz_inst (
			.in1(async_reset),
			.in2(zkai),
			.in3(ysbt),
			.y(ynoz)
		);

	sm83_dlatch_ee_q_n #(
			.L_q_n(60.76164)
		) yodp_inst (
			.d(ydxa),
			.ena(main_clk_n),
			.ena_n(main_clk_p),
			.q_n(yodp)
		);

	sm83_dff_cc_q #(
			.L_q(35.98814)
		) yoii_inst (
			.d(irq_head_c_y),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(yoii)
		);

	sm83_nor2_in2_n #(
			.L_y(26.42095)
		) yolu_inst (
			.in1(zorp),
			.in2_n(zaza),
			.y(yolu)
		);

	sm83_dff_cc_q #(
			.L_q(40.99353)
		) ysbt_inst (
			.d(dec1_y101),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(ysbt)
		);

	sm83_dff_cc_q #(
			.L_q(852.6908)
		) zacw_inst (
			.d(zfex),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zacw)
		);

	sm83_nor4_in2_n_in4_n #(
			.L_y(91.36417)
		) zaij_inst (
			.in1(zivv),
			.in2_n(phi_clk_n),
			.in3(zaoc),
			.in4_n(zzom),
			.y(zaij)
		);

	sm83_nand2_c #(
			.L_y(87.43592)
		) zaoc_inst (
			.in1(irq_head_a_y),
			.in2(xogs),
			.y(zaoc)
		);

	sm83_dff_cc_q #(
			.L_q(145.093)
		) zaza_inst (
			.d(zorp),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zaza)
		);

	sm83_ao33_s3_tap_in1_n #(
			.L_y(4.308392),
			.L_tap_in1_n(414.3069)
		) zbpp_inst (
			.in1(ir3),
			.in2(dec1_y100),
			.in3(phi_clk_n),
			.in4(dec3_y42),
			.in5(zkdu),
			.y(zbpp),
			.tap_in1_n(zbpp_tap_in1_n)
		);

	sm83_or2_b #(
			.L_y(88.63976)
		) zfex_inst (
			.in1(zkog),
			.in2(zloz),
			.y(zfex)
		);

	sm83_not_a #(
			.L_y(79.00925)
		) zgna_inst (
			.in(zloz),
			.y(zgna)
		);

	sm83_nor2_f #(
			.L_y(360.515)
		) zhzo_inst (
			.in1(sync_reset),
			.in2(async_reset),
			.y(zhzo)
		);

	sm83_nand2_d #(
			.L_y(81.92373)
		) ziks_inst (
			.in1(osc_stable),
			.in2(zudn),
			.y(ziks)
		);

	sm83_and2 #(
			.L_y(113.6035)
		) ziul_inst (
			.in1(dec1_y102),
			.in2(ir4),
			.y(ziul)
		);

	sm83_dff_cc_q #(
			.L_q(5.575608)
		) zivv_inst (
			.d(zoxc),
			.clk(adr_clk_n),
			.clk_n(adr_clk_p),
			.q(zivv)
		);

	sm83_not_x3_p2 #(
			.L_y(1209.704)
		) zjbf_inst (
			.in(zumn),
			.y(stop_n)
		);

	sm83_srlatch_r_n #(
			.L_q(42.89428)
		) zjje_inst (
			.s(zbpp),
			.r_n(zwuu),
			.q(zjje)
		);

	sm83_dff_cc_q #(
			.L_q(102.0087)
		) zkai_inst (
			.d(ziul),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zkai)
		);

	sm83_dff_cc_q #(
			.L_q(531.8436)
		) zkdu_inst (
			.d(zrsy),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zkdu)
		);

	sm83_srlatch_r_n #(
			.L_q(13.87572)
		) zkog_inst (
			.s(zaij),
			.r_n(zowa),
			.q(zkog)
		);

	sm83_not_g #(
			.L_y(95.16583)
		) zkon_inst (
			.in(zhzo),
			.y(zkon)
		);

	sm83_srlatch_r_n #(
			.L_q(520.434)
		) zloz_inst (
			.s(zyoc),
			.r_n(yneu),
			.q(zloz)
		);

	sm83_oa211_in1_n_in3_n #(
			.L_y(1402.967)
		) zlyz_inst (
			.in1_n(tutu),
			.in2(umut),
			.in3_n(syro),
			.in4(dec2_y8),
			.y(mreq)
		);

	sm83_or2_a #(
			.L_y(11.59473)
		) znda_inst (
			.in1(sync_reset),
			.in2(dec3_y42),
			.y(znda)
		);

	sm83_srlatch_r_n #(
			.L_q(19.70688)
		) zojz_inst (
			.s(yniu),
			.r_n(yneu),
			.q(zojz)
		);

	sm83_dff_cc_q #(
			.L_q(154.9137)
		) zorp_inst (
			.d(ziks),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zorp)
		);

	sm83_nor2_a #(
			.L_y(60.31816)
		) zowa_inst (
			.in1(dec1_y94),
			.in2(sync_reset),
			.y(zowa)
		);

	sm83_nand2_a #(
			.L_y(168.9161)
		) zoxc_inst (
			.in1(zrsy),
			.in2(zjje),
			.y(zoxc)
		);

	sm83_dff_cc_q #(
			.L_q(1017.489)
		) zrby_inst (
			.d(zloz),
			.clk(main_clk_p),
			.clk_n(main_clk_n),
			.q(zrby)
		);

	sm83_srlatch_r_n #(
			.L_q(168.9162)
		) zrsy_inst (
			.s(znda),
			.r_n(zgna),
			.q(zrsy)
		);

	sm83_not_b #(
			.L_y(160.8068)
		) zudn_inst (
			.in(sync_reset),
			.y(zudn)
		);

	sm83_srlatch_r_n #(
			.L_q(16.22001)
		) zumn_inst (
			.s(zkai),
			.r_n(zwlm),
			.q(zumn)
		);

	sm83_nor2_b #(
			.L_y(108.4078)
		) zwlm_inst (
			.in1(wake),
			.in2(zkon),
			.y(zwlm)
		);

	sm83_aoi331_s3 #(
			.L_y(113.0965)
		) zwuu_inst (
			.in1(zbpp_tap_in1_n),
			.in2(dec1_y100),
			.in3(phi_clk_n),
			.in4(zkdu),
			.in5(zacw),
			.in6(sync_reset),
			.y(zwuu)
		);

	sm83_and3 #(
			.L_y(40.42339)
		) zyoc_inst (
			.in1(xogs),
			.in2(zkdu),
			.in3(zojz),
			.y(zyoc)
		);

	sm83_nand2_b #(
			.L_y(47.20277)
		) zzom_inst (
			.in1(zbpp_tap_in1_n),
			.in2(dec1_y100),
			.y(zzom)
		);

	keeper carry_in_n_keeper(.n(carry_in_n));
	keeper ctl_mwrite_n_keeper(.n(ctl_mwrite_n));
	keeper dec1_y1_n_keeper(.n(dec1_y1_n));
	keeper dec1_y10_n_keeper(.n(dec1_y10_n));
	keeper dec1_y100_n_keeper(.n(dec1_y100_n));
	keeper dec1_y101_n_keeper(.n(dec1_y101_n));
	keeper dec1_y102_n_keeper(.n(dec1_y102_n));
	keeper dec1_y103_n_keeper(.n(dec1_y103_n));
	keeper dec1_y104_n_keeper(.n(dec1_y104_n));
	keeper dec1_y105_n_keeper(.n(dec1_y105_n));
	keeper dec1_y106_n_keeper(.n(dec1_y106_n));
	keeper dec1_y107_n_keeper(.n(dec1_y107_n));
	keeper dec1_y11_n_keeper(.n(dec1_y11_n));
	keeper dec1_y12_n_keeper(.n(dec1_y12_n));
	keeper dec1_y13_n_keeper(.n(dec1_y13_n));
	keeper dec1_y14_n_keeper(.n(dec1_y14_n));
	keeper dec1_y15_n_keeper(.n(dec1_y15_n));
	keeper dec1_y16_n_keeper(.n(dec1_y16_n));
	keeper dec1_y17_n_keeper(.n(dec1_y17_n));
	keeper dec1_y18_n_keeper(.n(dec1_y18_n));
	keeper dec1_y19_n_keeper(.n(dec1_y19_n));
	keeper dec1_y2_n_keeper(.n(dec1_y2_n));
	keeper dec1_y20_n_keeper(.n(dec1_y20_n));
	keeper dec1_y21_n_keeper(.n(dec1_y21_n));
	keeper dec1_y22_n_keeper(.n(dec1_y22_n));
	keeper dec1_y23_n_keeper(.n(dec1_y23_n));
	keeper dec1_y24_n_keeper(.n(dec1_y24_n));
	keeper dec1_y25_n_keeper(.n(dec1_y25_n));
	keeper dec1_y26_n_keeper(.n(dec1_y26_n));
	keeper dec1_y27_n_keeper(.n(dec1_y27_n));
	keeper dec1_y28_n_keeper(.n(dec1_y28_n));
	keeper dec1_y29_n_keeper(.n(dec1_y29_n));
	keeper dec1_y3_n_keeper(.n(dec1_y3_n));
	keeper dec1_y30_n_keeper(.n(dec1_y30_n));
	keeper dec1_y31_n_keeper(.n(dec1_y31_n));
	keeper dec1_y32_n_keeper(.n(dec1_y32_n));
	keeper dec1_y33_n_keeper(.n(dec1_y33_n));
	keeper dec1_y34_n_keeper(.n(dec1_y34_n));
	keeper dec1_y35_n_keeper(.n(dec1_y35_n));
	keeper dec1_y36_n_keeper(.n(dec1_y36_n));
	keeper dec1_y37_n_keeper(.n(dec1_y37_n));
	keeper dec1_y38_n_keeper(.n(dec1_y38_n));
	keeper dec1_y39_n_keeper(.n(dec1_y39_n));
	keeper dec1_y4_n_keeper(.n(dec1_y4_n));
	keeper dec1_y40_n_keeper(.n(dec1_y40_n));
	keeper dec1_y41_n_keeper(.n(dec1_y41_n));
	keeper dec1_y42_n_keeper(.n(dec1_y42_n));
	keeper dec1_y43_n_keeper(.n(dec1_y43_n));
	keeper dec1_y44_n_keeper(.n(dec1_y44_n));
	keeper dec1_y45_n_keeper(.n(dec1_y45_n));
	keeper dec1_y46_n_keeper(.n(dec1_y46_n));
	keeper dec1_y47_n_keeper(.n(dec1_y47_n));
	keeper dec1_y48_n_keeper(.n(dec1_y48_n));
	keeper dec1_y49_n_keeper(.n(dec1_y49_n));
	keeper dec1_y5_n_keeper(.n(dec1_y5_n));
	keeper dec1_y50_n_keeper(.n(dec1_y50_n));
	keeper dec1_y51_n_keeper(.n(dec1_y51_n));
	keeper dec1_y52_n_keeper(.n(dec1_y52_n));
	keeper dec1_y53_n_keeper(.n(dec1_y53_n));
	keeper dec1_y54_n_keeper(.n(dec1_y54_n));
	keeper dec1_y55_n_keeper(.n(dec1_y55_n));
	keeper dec1_y56_n_keeper(.n(dec1_y56_n));
	keeper dec1_y57_n_keeper(.n(dec1_y57_n));
	keeper dec1_y58_n_keeper(.n(dec1_y58_n));
	keeper dec1_y59_n_keeper(.n(dec1_y59_n));
	keeper dec1_y6_n_keeper(.n(dec1_y6_n));
	keeper dec1_y60_n_keeper(.n(dec1_y60_n));
	keeper dec1_y61_n_keeper(.n(dec1_y61_n));
	keeper dec1_y62_n_keeper(.n(dec1_y62_n));
	keeper dec1_y63_n_keeper(.n(dec1_y63_n));
	keeper dec1_y64_n_keeper(.n(dec1_y64_n));
	keeper dec1_y65_n_keeper(.n(dec1_y65_n));
	keeper dec1_y66_n_keeper(.n(dec1_y66_n));
	keeper dec1_y67_n_keeper(.n(dec1_y67_n));
	keeper dec1_y68_n_keeper(.n(dec1_y68_n));
	keeper dec1_y69_n_keeper(.n(dec1_y69_n));
	keeper dec1_y7_n_keeper(.n(dec1_y7_n));
	keeper dec1_y70_n_keeper(.n(dec1_y70_n));
	keeper dec1_y71_n_keeper(.n(dec1_y71_n));
	keeper dec1_y72_n_keeper(.n(dec1_y72_n));
	keeper dec1_y73_n_keeper(.n(dec1_y73_n));
	keeper dec1_y74_n_keeper(.n(dec1_y74_n));
	keeper dec1_y75_n_keeper(.n(dec1_y75_n));
	keeper dec1_y76_n_keeper(.n(dec1_y76_n));
	keeper dec1_y77_n_keeper(.n(dec1_y77_n));
	keeper dec1_y78_n_keeper(.n(dec1_y78_n));
	keeper dec1_y79_n_keeper(.n(dec1_y79_n));
	keeper dec1_y8_n_keeper(.n(dec1_y8_n));
	keeper dec1_y80_n_keeper(.n(dec1_y80_n));
	keeper dec1_y81_n_keeper(.n(dec1_y81_n));
	keeper dec1_y82_n_keeper(.n(dec1_y82_n));
	keeper dec1_y83_n_keeper(.n(dec1_y83_n));
	keeper dec1_y84_n_keeper(.n(dec1_y84_n));
	keeper dec1_y85_n_keeper(.n(dec1_y85_n));
	keeper dec1_y86_n_keeper(.n(dec1_y86_n));
	keeper dec1_y87_n_keeper(.n(dec1_y87_n));
	keeper dec1_y88_n_keeper(.n(dec1_y88_n));
	keeper dec1_y89_n_keeper(.n(dec1_y89_n));
	keeper dec1_y9_n_keeper(.n(dec1_y9_n));
	keeper dec1_y90_n_keeper(.n(dec1_y90_n));
	keeper dec1_y91_n_keeper(.n(dec1_y91_n));
	keeper dec1_y92_n_keeper(.n(dec1_y92_n));
	keeper dec1_y93_n_keeper(.n(dec1_y93_n));
	keeper dec1_y94_n_keeper(.n(dec1_y94_n));
	keeper dec1_y95_n_keeper(.n(dec1_y95_n));
	keeper dec1_y96_n_keeper(.n(dec1_y96_n));
	keeper dec1_y97_n_keeper(.n(dec1_y97_n));
	keeper dec1_y98_n_keeper(.n(dec1_y98_n));
	keeper dec1_y99_n_keeper(.n(dec1_y99_n));
	keeper dec2_y1_n_keeper(.n(dec2_y1_n));
	keeper dec2_y10_n_keeper(.n(dec2_y10_n));
	keeper dec2_y11_n_keeper(.n(dec2_y11_n));
	keeper dec2_y12_n_keeper(.n(dec2_y12_n));
	keeper dec2_y13_n_keeper(.n(dec2_y13_n));
	keeper dec2_y14_n_keeper(.n(dec2_y14_n));
	keeper dec2_y15_n_keeper(.n(dec2_y15_n));
	keeper dec2_y16_n_keeper(.n(dec2_y16_n));
	keeper dec2_y17_n_keeper(.n(dec2_y17_n));
	keeper dec2_y18_n_keeper(.n(dec2_y18_n));
	keeper dec2_y19_n_keeper(.n(dec2_y19_n));
	keeper dec2_y2_n_keeper(.n(dec2_y2_n));
	keeper dec2_y20_n_keeper(.n(dec2_y20_n));
	keeper dec2_y21_n_keeper(.n(dec2_y21_n));
	keeper dec2_y22_n_keeper(.n(dec2_y22_n));
	keeper dec2_y23_n_keeper(.n(dec2_y23_n));
	keeper dec2_y24_n_keeper(.n(dec2_y24_n));
	keeper dec2_y25_n_keeper(.n(dec2_y25_n));
	keeper dec2_y26_n_keeper(.n(dec2_y26_n));
	keeper dec2_y27_n_keeper(.n(dec2_y27_n));
	keeper dec2_y28_n_keeper(.n(dec2_y28_n));
	keeper dec2_y29_n_keeper(.n(dec2_y29_n));
	keeper dec2_y3_n_keeper(.n(dec2_y3_n));
	keeper dec2_y30_n_keeper(.n(dec2_y30_n));
	keeper dec2_y4_n_keeper(.n(dec2_y4_n));
	keeper dec2_y6_n_keeper(.n(dec2_y6_n));
	keeper dec2_y7_n_keeper(.n(dec2_y7_n));
	keeper dec2_y8_n_keeper(.n(dec2_y8_n));
	keeper dec2_y9_n_keeper(.n(dec2_y9_n));
	keeper dec3_y1_n_keeper(.n(dec3_y1_n));
	keeper dec3_y10_n_keeper(.n(dec3_y10_n));
	keeper dec3_y11_n_keeper(.n(dec3_y11_n));
	keeper dec3_y12_n_keeper(.n(dec3_y12_n));
	keeper dec3_y13_n_keeper(.n(dec3_y13_n));
	keeper dec3_y14_n_keeper(.n(dec3_y14_n));
	keeper dec3_y15_n_keeper(.n(dec3_y15_n));
	keeper dec3_y16_n_keeper(.n(dec3_y16_n));
	keeper dec3_y17_n_keeper(.n(dec3_y17_n));
	keeper dec3_y18_n_keeper(.n(dec3_y18_n));
	keeper dec3_y19_n_keeper(.n(dec3_y19_n));
	keeper dec3_y2_n_keeper(.n(dec3_y2_n));
	keeper dec3_y20_n_keeper(.n(dec3_y20_n));
	keeper dec3_y21_n_keeper(.n(dec3_y21_n));
	keeper dec3_y22_n_keeper(.n(dec3_y22_n));
	keeper dec3_y23_n_keeper(.n(dec3_y23_n));
	keeper dec3_y24_n_keeper(.n(dec3_y24_n));
	keeper dec3_y25_n_keeper(.n(dec3_y25_n));
	keeper dec3_y26_n_keeper(.n(dec3_y26_n));
	keeper dec3_y27_n_keeper(.n(dec3_y27_n));
	keeper dec3_y28_n_keeper(.n(dec3_y28_n));
	keeper dec3_y29_n_keeper(.n(dec3_y29_n));
	keeper dec3_y3_n_keeper(.n(dec3_y3_n));
	keeper dec3_y30_n_keeper(.n(dec3_y30_n));
	keeper dec3_y31_n_keeper(.n(dec3_y31_n));
	keeper dec3_y32_n_keeper(.n(dec3_y32_n));
	keeper dec3_y33_n_keeper(.n(dec3_y33_n));
	keeper dec3_y34_n_keeper(.n(dec3_y34_n));
	keeper dec3_y35_n_keeper(.n(dec3_y35_n));
	keeper dec3_y36_n_keeper(.n(dec3_y36_n));
	keeper dec3_y37_n_keeper(.n(dec3_y37_n));
	keeper dec3_y38_n_keeper(.n(dec3_y38_n));
	keeper dec3_y39_n_keeper(.n(dec3_y39_n));
	keeper dec3_y4_n_keeper(.n(dec3_y4_n));
	keeper dec3_y40_n_keeper(.n(dec3_y40_n));
	keeper dec3_y41_n_keeper(.n(dec3_y41_n));
	keeper dec3_y42_n_keeper(.n(dec3_y42_n));
	keeper dec3_y43_n_keeper(.n(dec3_y43_n));
	keeper dec3_y44_n_keeper(.n(dec3_y44_n));
	keeper dec3_y45_n_keeper(.n(dec3_y45_n));
	keeper dec3_y46_n_keeper(.n(dec3_y46_n));
	keeper dec3_y47_n_keeper(.n(dec3_y47_n));
	keeper dec3_y48_n_keeper(.n(dec3_y48_n));
	keeper dec3_y49_n_keeper(.n(dec3_y49_n));
	keeper dec3_y5_n_keeper(.n(dec3_y5_n));
	keeper dec3_y50_n_keeper(.n(dec3_y50_n));
	keeper dec3_y51_n_keeper(.n(dec3_y51_n));
	keeper dec3_y52_n_keeper(.n(dec3_y52_n));
	keeper dec3_y53_n_keeper(.n(dec3_y53_n));
	keeper dec3_y54_n_keeper(.n(dec3_y54_n));
	keeper dec3_y55_n_keeper(.n(dec3_y55_n));
	keeper dec3_y56_n_keeper(.n(dec3_y56_n));
	keeper dec3_y57_n_keeper(.n(dec3_y57_n));
	keeper dec3_y58_n_keeper(.n(dec3_y58_n));
	keeper dec3_y59_n_keeper(.n(dec3_y59_n));
	keeper dec3_y6_n_keeper(.n(dec3_y6_n));
	keeper dec3_y60_n_keeper(.n(dec3_y60_n));
	keeper dec3_y61_n_keeper(.n(dec3_y61_n));
	keeper dec3_y62_n_keeper(.n(dec3_y62_n));
	keeper dec3_y63_n_keeper(.n(dec3_y63_n));
	keeper dec3_y64_n_keeper(.n(dec3_y64_n));
	keeper dec3_y65_n_keeper(.n(dec3_y65_n));
	keeper dec3_y66_n_keeper(.n(dec3_y66_n));
	keeper dec3_y67_n_keeper(.n(dec3_y67_n));
	keeper dec3_y68_n_keeper(.n(dec3_y68_n));
	keeper dec3_y69_n_keeper(.n(dec3_y69_n));
	keeper dec3_y7_n_keeper(.n(dec3_y7_n));
	keeper dec3_y8_n_keeper(.n(dec3_y8_n));
	keeper dec3_y9_n_keeper(.n(dec3_y9_n));
	keeper hi_bus0_n_keeper(.n(hi_bus0_n));
	keeper hi_bus1_n_keeper(.n(hi_bus1_n));
	keeper hi_bus2_n_keeper(.n(hi_bus2_n));
	keeper hi_bus3_n_keeper(.n(hi_bus3_n));
	keeper hi_bus4_n_keeper(.n(hi_bus4_n));
	keeper hi_bus5_n_keeper(.n(hi_bus5_n));
	keeper hi_bus6_n_keeper(.n(hi_bus6_n));
	keeper hi_bus7_n_keeper(.n(hi_bus7_n));
	keeper int_vector3_n_keeper(.n(int_vector3_n));
	keeper int_vector4_n_keeper(.n(int_vector4_n));
	keeper int_vector5_n_keeper(.n(int_vector5_n));
	keeper lo_bus0_n_keeper(.n(lo_bus0_n));
	keeper lo_bus1_n_keeper(.n(lo_bus1_n));
	keeper lo_bus2_n_keeper(.n(lo_bus2_n));
	keeper lo_bus3_n_keeper(.n(lo_bus3_n));
	keeper lo_bus4_n_keeper(.n(lo_bus4_n));
	keeper lo_bus5_n_keeper(.n(lo_bus5_n));
	keeper lo_bus6_n_keeper(.n(lo_bus6_n));
	keeper lo_bus7_n_keeper(.n(lo_bus7_n));
	keeper new_flag_c_n_keeper(.n(new_flag_c_n));
	keeper new_flag_h_n_keeper(.n(new_flag_h_n));
	keeper new_flag_n_n_keeper(.n(new_flag_n_n));
	keeper new_flag_z_n_keeper(.n(new_flag_z_n));
	keeper new_reg_hi0_n_keeper(.n(new_reg_hi0_n));
	keeper new_reg_hi1_n_keeper(.n(new_reg_hi1_n));
	keeper new_reg_hi2_n_keeper(.n(new_reg_hi2_n));
	keeper new_reg_hi3_n_keeper(.n(new_reg_hi3_n));
	keeper new_reg_hi4_n_keeper(.n(new_reg_hi4_n));
	keeper new_reg_hi5_n_keeper(.n(new_reg_hi5_n));
	keeper new_reg_hi6_n_keeper(.n(new_reg_hi6_n));
	keeper new_reg_hi7_n_keeper(.n(new_reg_hi7_n));
	keeper new_reg_pch0_n_keeper(.n(new_reg_pch0_n));
	keeper new_reg_pch1_n_keeper(.n(new_reg_pch1_n));
	keeper new_reg_pch2_n_keeper(.n(new_reg_pch2_n));
	keeper new_reg_pch3_n_keeper(.n(new_reg_pch3_n));
	keeper new_reg_pch4_n_keeper(.n(new_reg_pch4_n));
	keeper new_reg_pch5_n_keeper(.n(new_reg_pch5_n));
	keeper new_reg_pch6_n_keeper(.n(new_reg_pch6_n));
	keeper new_reg_pch7_n_keeper(.n(new_reg_pch7_n));
	keeper new_reg_pcl0_n_keeper(.n(new_reg_pcl0_n));
	keeper new_reg_pcl1_n_keeper(.n(new_reg_pcl1_n));
	keeper new_reg_pcl2_n_keeper(.n(new_reg_pcl2_n));
	keeper new_reg_pcl3_n_keeper(.n(new_reg_pcl3_n));
	keeper new_reg_pcl4_n_keeper(.n(new_reg_pcl4_n));
	keeper new_reg_pcl5_n_keeper(.n(new_reg_pcl5_n));
	keeper new_reg_pcl6_n_keeper(.n(new_reg_pcl6_n));
	keeper new_reg_pcl7_n_keeper(.n(new_reg_pcl7_n));
	keeper new_reg_sph0_n_keeper(.n(new_reg_sph0_n));
	keeper new_reg_sph1_n_keeper(.n(new_reg_sph1_n));
	keeper new_reg_sph2_n_keeper(.n(new_reg_sph2_n));
	keeper new_reg_sph3_n_keeper(.n(new_reg_sph3_n));
	keeper new_reg_sph4_n_keeper(.n(new_reg_sph4_n));
	keeper new_reg_sph5_n_keeper(.n(new_reg_sph5_n));
	keeper new_reg_sph6_n_keeper(.n(new_reg_sph6_n));
	keeper new_reg_sph7_n_keeper(.n(new_reg_sph7_n));
	keeper new_reg_spl0_n_keeper(.n(new_reg_spl0_n));
	keeper new_reg_spl1_n_keeper(.n(new_reg_spl1_n));
	keeper new_reg_spl2_n_keeper(.n(new_reg_spl2_n));
	keeper new_reg_spl3_n_keeper(.n(new_reg_spl3_n));
	keeper new_reg_spl4_n_keeper(.n(new_reg_spl4_n));
	keeper new_reg_spl5_n_keeper(.n(new_reg_spl5_n));
	keeper new_reg_spl6_n_keeper(.n(new_reg_spl6_n));
	keeper new_reg_spl7_n_keeper(.n(new_reg_spl7_n));
	keeper op1bus0_n_keeper(.n(op1bus0_n));
	keeper op1bus1_n_keeper(.n(op1bus1_n));
	keeper op1bus2_n_keeper(.n(op1bus2_n));
	keeper op1bus3_n_keeper(.n(op1bus3_n));
	keeper op1bus4_n_keeper(.n(op1bus4_n));
	keeper op1bus5_n_keeper(.n(op1bus5_n));
	keeper op1bus6_n_keeper(.n(op1bus6_n));
	keeper op1bus7_n_keeper(.n(op1bus7_n));
	keeper op1dec0_n_keeper(.n(op1dec0_n));
	keeper op1dec1_n_keeper(.n(op1dec1_n));
	keeper op1dec2_n_keeper(.n(op1dec2_n));
	keeper op1dec3_n_keeper(.n(op1dec3_n));
	keeper op1dec4_n_keeper(.n(op1dec4_n));
	keeper op1dec5_n_keeper(.n(op1dec5_n));
	keeper op1dec6_n_keeper(.n(op1dec6_n));
	keeper op1dec7_n_keeper(.n(op1dec7_n));
	keeper op2bus0_n_keeper(.n(op2bus0_n));
	keeper op2bus1_n_keeper(.n(op2bus1_n));
	keeper op2bus2_n_keeper(.n(op2bus2_n));
	keeper op2bus3_n_keeper(.n(op2bus3_n));
	keeper op2bus4_n_keeper(.n(op2bus4_n));
	keeper op2bus5_n_keeper(.n(op2bus5_n));
	keeper op2bus6_n_keeper(.n(op2bus6_n));
	keeper op2bus7_n_keeper(.n(op2bus7_n));
	keeper alu_decoder_y12_keeper(.n(alu_decoder_y12));
	keeper db0_keeper(.n(db0));
	keeper db1_keeper(.n(db1));
	keeper db2_keeper(.n(db2));
	keeper db3_keeper(.n(db3));
	keeper db4_keeper(.n(db4));
	keeper db5_keeper(.n(db5));
	keeper db6_keeper(.n(db6));
	keeper db7_keeper(.n(db7));
	keeper idu_chain_a_y0_keeper(.n(idu_chain_a_y0));
	keeper idu_chain_a_y1_keeper(.n(idu_chain_a_y1));
	keeper idu_chain_a_y2_keeper(.n(idu_chain_a_y2));
	keeper idu_chain_a_y3_keeper(.n(idu_chain_a_y3));
	keeper idu_chain_a_y4_keeper(.n(idu_chain_a_y4));
	keeper idu_chain_a_y5_keeper(.n(idu_chain_a_y5));
	keeper idu_chain_a_y6_keeper(.n(idu_chain_a_y6));
	keeper idu_chain_b_y0_keeper(.n(idu_chain_b_y0));
	keeper idu_chain_b_y1_keeper(.n(idu_chain_b_y1));
	keeper idu_chain_b_y2_keeper(.n(idu_chain_b_y2));
	keeper idu_chain_b_y3_keeper(.n(idu_chain_b_y3));
	keeper idu_chain_b_y4_keeper(.n(idu_chain_b_y4));
	keeper idu_chain_b_y5_keeper(.n(idu_chain_b_y5));
	keeper idu_chain_b_y6_keeper(.n(idu_chain_b_y6));
	keeper irq_prio_dist_nand_a_y_keeper(.n(irq_prio_dist_nand_a_y));
	keeper irq_prio_dist_nand_a_y_n1_keeper(.n(irq_prio_dist_nand_a_y_n1));
	keeper irq_prio_dist_nand_a_y_n2_keeper(.n(irq_prio_dist_nand_a_y_n2));
	keeper irq_prio_dist_nand_a_y_n3_keeper(.n(irq_prio_dist_nand_a_y_n3));
	keeper irq_prio_dist_nand_a_y_n4_keeper(.n(irq_prio_dist_nand_a_y_n4));
	keeper irq_prio_dist_nand_a_y_n5_keeper(.n(irq_prio_dist_nand_a_y_n5));
	keeper irq_prio_dist_nand_a_y_n6_keeper(.n(irq_prio_dist_nand_a_y_n6));
	keeper irq_prio_dist_nand_a_y_n7_keeper(.n(irq_prio_dist_nand_a_y_n7));
	keeper irq_prio_dist_nand_b_y_keeper(.n(irq_prio_dist_nand_b_y));
	keeper irq_prio_dist_nand_b_y_n1_keeper(.n(irq_prio_dist_nand_b_y_n1));
	keeper irq_prio_dist_nand_b_y_n2_keeper(.n(irq_prio_dist_nand_b_y_n2));
	keeper irq_prio_dist_nand_b_y_n3_keeper(.n(irq_prio_dist_nand_b_y_n3));
	keeper irq_prio_dist_nand_b_y_n4_keeper(.n(irq_prio_dist_nand_b_y_n4));
	keeper irq_prio_dist_nand_b_y_n5_keeper(.n(irq_prio_dist_nand_b_y_n5));
	keeper irq_prio_dist_nand_b_y_n6_keeper(.n(irq_prio_dist_nand_b_y_n6));
	keeper irq_prio_dist_nand_b_y_n7_keeper(.n(irq_prio_dist_nand_b_y_n7));
	keeper irq_prio_dist_nor_y_keeper(.n(irq_prio_dist_nor_y));
	keeper irq_prio_dist_nor_y_p1_keeper(.n(irq_prio_dist_nor_y_p1));
	keeper irq_prio_dist_nor_y_p2_keeper(.n(irq_prio_dist_nor_y_p2));
	keeper irq_prio_dist_nor_y_p3_keeper(.n(irq_prio_dist_nor_y_p3));
	keeper irq_prio_dist_nor_y_p4_keeper(.n(irq_prio_dist_nor_y_p4));
	keeper irq_prio_dist_nor_y_p5_keeper(.n(irq_prio_dist_nor_y_p5));
	keeper irq_prio_dist_nor_y_p6_keeper(.n(irq_prio_dist_nor_y_p6));
	keeper irq_prio_dist_nor_y_p7_keeper(.n(irq_prio_dist_nor_y_p7));
	keeper irq_prio_nand_a_y_keeper(.n(irq_prio_nand_a_y));
	keeper irq_prio_nand_b_y0_keeper(.n(irq_prio_nand_b_y0));
	keeper irq_prio_nand_b_y1_keeper(.n(irq_prio_nand_b_y1));
	keeper irq_prio_nand_b_y2_keeper(.n(irq_prio_nand_b_y2));
	keeper irq_prio_nand_b_y3_keeper(.n(irq_prio_nand_b_y3));
	keeper irq_prio_nand_b_y4_keeper(.n(irq_prio_nand_b_y4));
	keeper irq_prio_nand_b_y5_keeper(.n(irq_prio_nand_b_y5));
	keeper irq_prio_nand_b_y6_keeper(.n(irq_prio_nand_b_y6));
	keeper irq_prio_nand_b_y7_keeper(.n(irq_prio_nand_b_y7));
	keeper shift0_keeper(.n(shift0));
	keeper shift1_keeper(.n(shift1));
	keeper shift2_keeper(.n(shift2));
	keeper shift3_keeper(.n(shift3));
	keeper shift4_keeper(.n(shift4));
	keeper shift5_keeper(.n(shift5));
	keeper shift6_keeper(.n(shift6));
	keeper shift7_keeper(.n(shift7));

endmodule

`default_nettype wire
