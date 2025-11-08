`default_nettype none

module sm83_nand2_nand3_od_irq #(
		parameter real L_a_y = 44,
		parameter real L_b_y = 69
	) (
		input      logic a_in1, a_in2, b_in1, b_in2, b_in3,
		output     logic a_y,
		output tri logic b_y
	);

	import sm83_timing::*;

	assign a_y = !(a_in1 & a_in2);

	localparam realtime T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm(9*L_unit) * 3);
	localparam realtime T_Z_b_y    = tpd_z(, T_fall_b_y);
	assign (highz1, strong0) #(0, T_fall_b_y, T_Z_b_y) b_y = (b_in1 & b_in2 & b_in3) ? 0 : 'z;

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(3*L_unit));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm(3*L_unit) * 2);

		(a_in1, a_in2 *> a_y) = (T_rise_a_y, T_fall_a_y);
	endspecify

endmodule

`default_nettype wire
