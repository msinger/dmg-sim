`default_nettype none

package sm83_idu_ctl_param;

	import sm83_timing::L_unit;

	parameter real L_in1 =  0.0;
	parameter real L_in2 =  0.0;
	parameter real L_in3 = 20.6;
	parameter real L_in4 = 38.5;
	parameter real L_in5 =  0.0;
	parameter real L_y1  =  0.0;
	parameter real L_y2  =  0.0;
	parameter real L_y3  =  0.0;

	parameter real W_gate_in1 =  6*L_unit;
	parameter real W_gate_in2 = 16*L_unit;
	parameter real W_gate_in3 = 20*L_unit;
	parameter real W_gate_in4 = 16*L_unit;
	parameter real W_gate_in5 =  6*L_unit;

endpackage

module sm83_idu_ctl #(
		parameter real L_y1      = 24 + sm83_idu_ctl_param::L_y1,
		parameter real L_y2      = 36 + sm83_idu_ctl_param::L_y2,
		parameter real L_y3      = 40 + sm83_idu_ctl_param::L_y3,
		parameter real W_gate_y1 = 0,
		parameter real W_gate_y2 = 0,
		parameter real W_gate_y3 = 0
	) (
		input  logic in1, in2, in3, in4, in5,
		output logic y1, y2, y3
	);

	import sm83_timing::*;

	assign y1 = (in3 & !in4 & in2) | (in3 & in4 & !in2);
	assign y2 = (in3 & !in4 & in2) | in1;
	assign y3 = in5 | (in3 & in4 & !in2);

	specify
		specparam T_rise_in1_n = tpd_elmore(  19,   R_pmos_ohm(3*L_unit), C_gate_F(14*L_unit));
		specparam T_fall_in1_n = tpd_elmore(  19,   R_nmos_ohm(3*L_unit), C_gate_F(14*L_unit));
		specparam T_rise_in2_n = tpd_elmore(  34,   R_pmos_ohm(3*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_in2_n = tpd_elmore(  34,   R_nmos_ohm(3*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_in4_n = tpd_elmore(  25,   R_pmos_ohm(3*L_unit), C_gate_F(10*L_unit));
		specparam T_fall_in4_n = tpd_elmore(  25,   R_nmos_ohm(3*L_unit), C_gate_F(10*L_unit));
		specparam T_rise_in5_n = tpd_elmore(  18,   R_pmos_ohm(3*L_unit), C_gate_F(14*L_unit));
		specparam T_fall_in5_n = tpd_elmore(  18,   R_nmos_ohm(3*L_unit), C_gate_F(14*L_unit));
		specparam T_rise_nand1 = tpd_elmore(  68,   R_pmos_ohm(5*L_unit), C_gate_F(28*L_unit));  // PN 6, 7, 8
		specparam T_fall_nand1 = tpd_elmore(  68, 3*R_nmos_ohm(5*L_unit), C_gate_F(28*L_unit));
		specparam T_rise_nand2 = tpd_elmore(  92,   R_pmos_ohm(5*L_unit), C_gate_F(28*L_unit));  // PN 11, 12, 13
		specparam T_fall_nand2 = tpd_elmore(  92, 3*R_nmos_ohm(5*L_unit), C_gate_F(28*L_unit));
		specparam T_rise_y1    = tpd_elmore(L_y1,   R_pmos_ohm(7*L_unit), C_gate_F(W_gate_y1));
		specparam T_fall_y1    = tpd_elmore(L_y1, 2*R_nmos_ohm(7*L_unit), C_gate_F(W_gate_y1));
		specparam T_rise_y2    = tpd_elmore(L_y2,   R_pmos_ohm(7*L_unit), C_gate_F(W_gate_y2));
		specparam T_fall_y2    = tpd_elmore(L_y2, 2*R_nmos_ohm(7*L_unit), C_gate_F(W_gate_y2));
		specparam T_rise_y3    = tpd_elmore(L_y3,   R_pmos_ohm(7*L_unit), C_gate_F(W_gate_y3));
		specparam T_fall_y3    = tpd_elmore(L_y3, 2*R_nmos_ohm(7*L_unit), C_gate_F(W_gate_y3));

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
