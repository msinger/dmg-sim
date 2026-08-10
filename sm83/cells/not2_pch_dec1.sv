`default_nettype none

package sm83_not2_pch_dec1_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n = 0.0;
	parameter real L_a_in  = 0.0;
	parameter real L_b_in  = 0.0;
	parameter real L_a_y   = 0.0;
	parameter real L_b_y   = 0.0;

	parameter real W_gate_pch_n = 16*L_unit;
	parameter real W_gate_a_in  = 25*L_unit;
	parameter real W_gate_b_in  = 25*L_unit;

endpackage

module sm83_not2_pch_dec1 #(
		parameter real L_a_in      = 52 + sm83_not2_pch_dec1_param::L_a_in,
		parameter real L_b_in      = 52 + sm83_not2_pch_dec1_param::L_b_in,
		parameter real L_a_y       = 24 + sm83_not2_pch_dec1_param::L_a_y,
		parameter real L_b_y       = 33 + sm83_not2_pch_dec1_param::L_b_y,
		parameter real W_gate_a_in = sm83_not2_pch_dec1_param::W_gate_a_in,
		parameter real W_gate_b_in = sm83_not2_pch_dec1_param::W_gate_b_in,
		parameter real W_gate_a_y  = 0,
		parameter real W_gate_b_y  = 0
	) (
		input      logic pch_n,
		inout  tri logic a_in, b_in,
		output     logic a_y, b_y
	);

	import sm83_timing::*;

	assign a_y = !a_in;
	assign b_y = !b_in;

	localparam realtime T_rise_buf_a = tpd_elmore(L_a_in, R_pmos_ohm(8*L_unit), C_gate_F(W_gate_a_in));
	localparam realtime T_Z_buf_a    = tpd_z(T_rise_buf_a);
	bufif0 (strong1, highz0) #(T_rise_buf_a, T_Z_buf_a, T_Z_buf_a) (a_in, '1, pch_n);

	localparam realtime T_rise_buf_b = tpd_elmore(L_b_in, R_pmos_ohm(8*L_unit), C_gate_F(W_gate_b_in));
	localparam realtime T_Z_buf_b    = tpd_z(T_rise_buf_b);
	bufif0 (strong1, highz0) #(T_rise_buf_b, T_Z_buf_b, T_Z_buf_b) (b_in, '1, pch_n);

	specify
		specparam T_rise_a_y = tpd_elmore(L_a_y, R_pmos_ohm(17*L_unit), C_gate_F(W_gate_a_y));
		specparam T_fall_a_y = tpd_elmore(L_a_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_a_y));
		specparam T_rise_b_y = tpd_elmore(L_b_y, R_pmos_ohm(17*L_unit), C_gate_F(W_gate_b_y));
		specparam T_fall_b_y = tpd_elmore(L_b_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_b_y));

		(a_in *> a_y) = (T_rise_a_y, T_fall_a_y);
		(b_in *> b_y) = (T_rise_b_y, T_fall_b_y);
	endspecify

endmodule

`default_nettype wire
