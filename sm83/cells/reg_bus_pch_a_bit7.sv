`default_nettype none

package sm83_reg_bus_pch_a_bit7_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n     = 14.0;
	parameter real L_c_zero_a  =  0.0;
	parameter real L_c_zero_b1 =  0.0;
	parameter real L_c_zero_b2 =  0.0;
	parameter real L_a_y       =  0.0;
	parameter real L_b_y       = 23.3;
	parameter real L_b_y_n     =  0.0;
	parameter real L_c_y       = 76.7;
	parameter real L_c_y_n     =  0.0;

	parameter real W_gate_pch_n     = 56*L_unit;
	parameter real W_gate_c_zero_a  =  8*L_unit;
	parameter real W_gate_c_zero_b1 =  8*L_unit;
	parameter real W_gate_c_zero_b2 =  8*L_unit;
	parameter real W_gate_b_y       = 20*L_unit;
	parameter real W_gate_c_y       = 23*L_unit;

endpackage

module sm83_reg_bus_pch_a_bit7 #(
		parameter real L_a_y        = 67 + sm83_reg_bus_pch_a_bit7_param::L_a_y,
		parameter real L_b_y        = 61 + sm83_reg_bus_pch_a_bit7_param::L_b_y,
		parameter real L_b_y_n      = 54 + sm83_reg_bus_pch_a_bit7_param::L_b_y_n,
		parameter real L_c_y        = 35 + sm83_reg_bus_pch_a_bit7_param::L_c_y,
		parameter real L_c_y_n      = 57 + sm83_reg_bus_pch_a_bit7_param::L_c_y_n,
		parameter real W_gate_a_y   = 0,
		parameter real W_gate_b_y   = sm83_reg_bus_pch_a_bit7_param::W_gate_b_y,
		parameter real W_gate_b_y_n = 0,
		parameter real W_gate_c_y   = sm83_reg_bus_pch_a_bit7_param::W_gate_c_y,
		parameter real W_gate_c_y_n = 0
	) (
		input      logic pch_n, c_zero_a, c_zero_b1, c_zero_b2,
		inout  tri logic b_y, c_y,
		output tri logic a_y,
		output     logic b_y_n, c_y_n
	);

	import sm83_timing::*;

	assign b_y_n = !b_y;
	assign c_y_n = !c_y;

	localparam realtime T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(10*L_unit), C_gate_F(W_gate_a_y));
	localparam realtime T_Z_a_y    = tpd_z(T_rise_a_y);
	bufif0 (strong1, highz0) #(T_rise_a_y, T_Z_a_y, T_Z_a_y) (a_y, '1, pch_n);

	localparam realtime T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm(15*L_unit), C_gate_F(W_gate_b_y));
	localparam realtime T_Z_b_y    = tpd_z(T_rise_b_y);
	bufif0 (strong1, highz0) #(T_rise_b_y, T_Z_b_y, T_Z_b_y) (b_y, '1, pch_n);

	localparam realtime T_rise_c_y  = tpd_elmore(L_c_y,   R_pmos_ohm(15*L_unit), C_gate_F(W_gate_c_y));
	localparam realtime T_fall_c_ya = tpd_elmore(L_c_y, 2*R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_c_y));
	localparam realtime T_fall_c_yb = tpd_elmore(L_c_y, 3*R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_c_y));
	localparam realtime T_Z_c_y     = tpd_z(T_rise_c_y, T_fall_c_yb);
	bufif0 (strong1, highz0) #(T_rise_c_y, T_fall_c_yb, T_Z_c_y) (c_y, '1, pch_n);
	assign #(T_rise_c_y, T_fall_c_ya, T_Z_c_y) c_y = (pch_n & c_zero_a) ? 0 : 'z;
	assign #(T_rise_c_y, T_fall_c_yb, T_Z_c_y) c_y = (pch_n & c_zero_b1 & c_zero_b2) ? 0 : 'z;

	specify
		specparam T_rise_b_y_n = tpd_elmore(L_b_y_n, R_pmos_ohm(15*L_unit), C_gate_F(W_gate_b_y_n));
		specparam T_fall_b_y_n = tpd_elmore(L_b_y_n, R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_b_y_n));
		specparam T_rise_c_y_n = tpd_elmore(L_c_y_n, R_pmos_ohm(15*L_unit), C_gate_F(W_gate_c_y_n));
		specparam T_fall_c_y_n = tpd_elmore(L_c_y_n, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_c_y_n));

		(b_y *> b_y_n) = (T_rise_b_y_n, T_fall_b_y_n);
		(c_y *> c_y_n) = (T_rise_c_y_n, T_fall_c_y_n);
	endspecify

endmodule

`default_nettype wire
