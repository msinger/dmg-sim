`default_nettype none

package sm83_nor2_pch_in1_dec3_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n = 20.0;
	parameter real L_in1   = 0.0;
	parameter real L_in2   = 0.0;
	parameter real L_y     = 0.0;

	parameter real W_gate_pch_n =  8*L_unit;
	parameter real W_gate_in1   = 25*L_unit;
	parameter real W_gate_in2   = 25*L_unit;

endpackage

module sm83_nor2_pch_in1_dec3 #(
		parameter real L_in1      = 27 + sm83_nor2_pch_in1_dec3_param::L_in1,
		parameter real L_y        = 45 + sm83_nor2_pch_in1_dec3_param::L_y,
		parameter real W_gate_in1 = sm83_nor2_pch_in1_dec3_param::W_gate_in1,
		parameter real W_gate_y   = 0
	) (
		input     logic pch_n, in2,
		inout tri logic in1,
		output    logic y
	);

	import sm83_timing::*;

	assign y = !(in1 | in2);

	localparam realtime T_rise_buf = tpd_elmore(L_in1, R_pmos_ohm(8*L_unit), C_gate_F(W_gate_in1));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, T_Z_buf, T_Z_buf) (in1, '1, pch_n);

	specify
		specparam T_rise_y = tpd_elmore(L_y, 2*R_pmos_ohm(17*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y,   R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_y));

		(in1, in2 *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
