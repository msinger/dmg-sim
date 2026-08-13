`default_nettype none

package sm83_nand2_nand3_od_irq_param;

	import sm83_timing::L_unit;

	parameter real L_a_in1 =  0.0;
	parameter real L_a_in2 = 15.2;
	parameter real L_a_y   =  0.0;
	parameter real L_b_in1 = 19.2;
	parameter real L_b_in2 = 33.2;
	parameter real L_b_in3 = 22.3;
	parameter real L_b_y   =  0.0;

	parameter real W_gate_a_in1 = 6*L_unit;
	parameter real W_gate_a_in2 = 6*L_unit;
	parameter real W_gate_b_in1 = 9*L_unit;
	parameter real W_gate_b_in2 = 9*L_unit;
	parameter real W_gate_b_in3 = 9*L_unit;

endpackage

module sm83_nand2_nand3_od_irq #(
		parameter real L_a_y      = 44 + sm83_nand2_nand3_od_irq_param::L_a_y,
		parameter real L_b_y      = 69 + sm83_nand2_nand3_od_irq_param::L_b_y,
		parameter real W_gate_a_y = 0,
		parameter real W_gate_b_y = 0
	) (
		input      logic a_in1, a_in2, b_in1, b_in2, b_in3,
		output     logic a_y,
		output tri logic b_y
	);

	import sm83_timing::*;

	assign a_y = !(a_in1 & a_in2);

	localparam realtime T_fall_b_y = tpd_elmore(L_b_y, 3*R_nmos_ohm(9*L_unit), C_gate_F(W_gate_b_y));
	localparam realtime T_Z_b_y    = tpd_z(, T_fall_b_y);
	assign (highz1, strong0) #(T_Z_b_y, T_fall_b_y, T_Z_b_y) b_y = (b_in1 & b_in2 & b_in3) ? 0 : 'z;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y,   R_pmos_ohm(3*L_unit), C_gate_F(W_gate_a_y));
		specparam T_fall_a_y = tpd_elmore(L_a_y, 2*R_nmos_ohm(3*L_unit), C_gate_F(W_gate_a_y));

		(a_in1, a_in2 *> a_y) = (T_rise_a_y, T_fall_a_y);
	endspecify

endmodule

`default_nettype wire
