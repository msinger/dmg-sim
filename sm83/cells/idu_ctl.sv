`default_nettype none

module sm83_idu_ctl #(
		parameter real L_y1 = 24,
		parameter real L_y2 = 36,
		parameter real L_y3 = 40
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y1, y2, y3
	);

	import sm83_timing::*;

	assign y1 = (in3 & !in4 & in2) | (in3 & in4 & !in2);
	assign y2 = (in3 & !in4 & in2) | in1;
	assign y3 = in5 | (in3 & in4 & !in2);

	specify
		specparam T_rise_in1_n = tpd_elmore(  19, R_pmos_ohm(3*L_unit));
		specparam T_fall_in1_n = tpd_elmore(  19, R_nmos_ohm(3*L_unit));
		specparam T_rise_in2_n = tpd_elmore(  34, R_pmos_ohm(3*L_unit));
		specparam T_fall_in2_n = tpd_elmore(  34, R_nmos_ohm(3*L_unit));
		specparam T_rise_in4_n = tpd_elmore(  25, R_pmos_ohm(3*L_unit));
		specparam T_fall_in4_n = tpd_elmore(  25, R_nmos_ohm(3*L_unit));
		specparam T_rise_in5_n = tpd_elmore(  18, R_pmos_ohm(3*L_unit));
		specparam T_fall_in5_n = tpd_elmore(  18, R_nmos_ohm(3*L_unit));
		specparam T_rise_nand1 = tpd_elmore(  68, R_pmos_ohm(5*L_unit));     // PN 6, 7, 8
		specparam T_fall_nand1 = tpd_elmore(  68, R_nmos_ohm(5*L_unit) * 3);
		specparam T_rise_nand2 = tpd_elmore(  92, R_pmos_ohm(5*L_unit));     // PN 11, 12, 13
		specparam T_fall_nand2 = tpd_elmore(  92, R_nmos_ohm(5*L_unit) * 3);
		specparam T_rise_y1    = tpd_elmore(L_y1, R_pmos_ohm(7*L_unit));
		specparam T_fall_y1    = tpd_elmore(L_y1, R_nmos_ohm(7*L_unit) * 2);
		specparam T_rise_y2    = tpd_elmore(L_y2, R_pmos_ohm(7*L_unit));
		specparam T_fall_y2    = tpd_elmore(L_y2, R_nmos_ohm(7*L_unit) * 2);
		specparam T_rise_y3    = tpd_elmore(L_y3, R_pmos_ohm(7*L_unit));
		specparam T_fall_y3    = tpd_elmore(L_y3, R_nmos_ohm(7*L_unit) * 2);

		(in2      *> y1) = (T_rise_in2_n + T_fall_nand2 + T_rise_y1, T_fall_in2_n + T_rise_nand2 + T_fall_y1);
		(in3      *> y1) = (T_fall_nand2 + T_rise_y1, T_rise_nand2 + T_fall_y1);
		(in4      *> y1) = (T_rise_in4_n + T_fall_nand1 + T_rise_y1, T_fall_in4_n + T_rise_nand1 + T_fall_y1);
		(in1      *> y2) = (T_fall_in1_n + T_rise_y2, T_rise_in1_n + T_fall_y2);
		(in2, in3 *> y2) = (T_fall_nand1 + T_rise_y2, T_rise_nand1 + T_fall_y2);
		(in4      *> y2) = (T_rise_in4_n + T_fall_nand1 + T_rise_y2, T_fall_in4_n + T_rise_nand1 + T_fall_y2);
		(in2      *> y3) = (T_rise_in2_n + T_fall_nand2 + T_rise_y3, T_fall_in2_n + T_rise_nand2 + T_fall_y3);
		(in3, in4 *> y3) = (T_fall_nand2 + T_rise_y3, T_rise_nand2 + T_fall_y3);
		(in5      *> y3) = (T_fall_in5_n + T_rise_y3, T_rise_in5_n + T_fall_y3);

	endspecify

endmodule

`default_nettype wire
