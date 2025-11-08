`default_nettype none

module sm83_reg_wz_out #(
		parameter real L_aoi_a_y_n = 107,
		parameter real L_aoi_b_y   =  33,
		parameter real L_muxi_a_y  =  98,
		parameter real L_muxi_b_y  = 134,
		parameter real L_nand_y    = 206,
		parameter real L_oai21_y   = 182,
		parameter real L_oai31_y   = 200
	) (
		input      logic pch_n, aoi_in1, aoi_ena1, aoi_ena2, aoi_ena3, aoi_a_in3_muxi_a_d1, aoi_b_in3_muxi_b_d1,
		                 muxi_d0, muxi_a_sel, muxi_a_sel_n, muxi_b_sel, muxi_b_sel_n, nand_ena,
		                 oai21_in_aoi_b_in2, oai_ena1, oai_ena2, oai_ena3, oai31_in_nand_in_aoi_a_in2,
		output tri logic aoi_b_y, nand_y, oai21_y, oai31_y,
		output     logic aoi_a_y_n, muxi_a_y, muxi_b_y
	);

	import sm83_timing::*;

	logic sel_a, sel_b;

	assign sel_a = (muxi_a_sel == !muxi_a_sel_n) ? muxi_a_sel : 'x;
	assign muxi_a_y = sel_a ? !aoi_a_in3_muxi_a_d1 : !muxi_d0;

	assign sel_b = (muxi_b_sel == !muxi_b_sel_n) ? muxi_b_sel : 'x;
	assign muxi_b_y = sel_b ? !aoi_b_in3_muxi_b_d1 : !muxi_d0;

	tri logic aoi_a_y;

	localparam realtime T_fall_oai31_y = tpd_elmore(L_oai31_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_oai31_y    = tpd_z(, T_fall_oai31_y);
	assign (highz1, strong0) #(0, T_fall_oai31_y, T_Z_oai31_y)
		oai31_y = ((oai_ena1 | oai_ena2 | oai_ena3) & oai31_in_nand_in_aoi_a_in2) ? 0 : 'z;

	localparam realtime T_fall_oai21_y = tpd_elmore(L_oai21_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_oai21_y    = tpd_z(, T_fall_oai21_y);
	assign (highz1, strong0) #(0, T_fall_oai21_y, T_Z_oai21_y)
		oai21_y = ((oai_ena1 | oai_ena2) & oai21_in_aoi_b_in2) ? 0 : 'z;

	localparam realtime T_fall_nand_y = tpd_elmore(L_nand_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_nand_y    = tpd_z(, T_fall_nand_y);
	assign (highz1, strong0) #(0, T_fall_nand_y, T_Z_nand_y)
		nand_y = (nand_ena & oai31_in_nand_in_aoi_a_in2) ? 0 : 'z;

	localparam realtime T_rise_aoi_a_y = tpd_elmore(93, R_pmos_ohm(8*L_unit));
	localparam realtime T_fall_aoi_a_y = tpd_elmore(93, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_aoi_a_y    = tpd_z(T_rise_aoi_a_y, T_fall_aoi_a_y);
	bufif0 (strong1, highz0) #(T_rise_aoi_a_y, 0, T_Z_aoi_a_y) (aoi_a_y, '1, pch_n);
	assign (highz1, strong0) #(0, T_fall_aoi_a_y, T_Z_aoi_a_y)
		aoi_a_y = ((aoi_ena1 & aoi_in1) |
		           (aoi_ena2 & oai31_in_nand_in_aoi_a_in2) |
		           (aoi_ena3 & aoi_a_in3_muxi_a_d1)) ? 0 : 'z;
	keeper aoi_a_y_keeper(aoi_a_y);

	localparam realtime T_rise_aoi_a_y_n = tpd_elmore(L_aoi_a_y_n, R_pmos_ohm(12*L_unit));
	localparam realtime T_fall_aoi_a_y_n = tpd_elmore(L_aoi_a_y_n, R_nmos_ohm( 6*L_unit));
	assign #(T_rise_aoi_a_y_n, T_fall_aoi_a_y_n) aoi_a_y_n = !aoi_a_y;

	localparam realtime T_rise_aoi_b_y = tpd_elmore(L_aoi_b_y, R_pmos_ohm(6*L_unit));
	localparam realtime T_fall_aoi_b_y = tpd_elmore(L_aoi_b_y, R_nmos_ohm(8*L_unit) * 2);
	localparam realtime T_Z_aoi_b_y    = tpd_z(T_rise_aoi_b_y, T_fall_aoi_b_y);
	bufif0 (strong1, highz0) #(T_rise_aoi_b_y, 0, T_Z_aoi_b_y) (aoi_b_y, '1, pch_n);
	assign (highz1, strong0) #(0, T_fall_aoi_b_y, T_Z_aoi_b_y)
		aoi_b_y = ((aoi_ena1 & aoi_in1) |
		           (aoi_ena2 & oai21_in_aoi_b_in2) |
		           (aoi_ena3 & aoi_b_in3_muxi_b_d1)) ? 0 : 'z;

	specify
		specparam T_rise_muxi_a_y = tpd_elmore(L_muxi_a_y, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_muxi_a_y = tpd_elmore(L_muxi_a_y, R_nmos_ohm(3*L_unit) * 2);
		specparam T_rise_muxi_b_y = tpd_elmore(L_muxi_b_y, R_pmos_ohm(3*L_unit) * 2);
		specparam T_fall_muxi_b_y = tpd_elmore(L_muxi_b_y, R_nmos_ohm(3*L_unit) * 2);

		(muxi_a_sel, muxi_a_sel_n, aoi_a_in3_muxi_a_d1, muxi_d0 *> muxi_a_y) = (T_rise_muxi_a_y, T_fall_muxi_a_y);
		(muxi_b_sel, muxi_b_sel_n, aoi_b_in3_muxi_b_d1, muxi_d0 *> muxi_b_y) = (T_rise_muxi_b_y, T_fall_muxi_b_y);
	endspecify

endmodule

`default_nettype wire
