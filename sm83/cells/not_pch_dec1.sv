`default_nettype none

package sm83_not_pch_dec1_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n = 0.0;
	parameter real L_in    = 0.0;
	parameter real L_y     = 0.0;

	parameter real W_gate_pch_n =  8*L_unit;
	parameter real W_gate_in    = 25*L_unit;

endpackage

module sm83_not_pch_dec1 #(
		parameter real L_in      = 54 + sm83_not_pch_dec1_param::L_in,
		parameter real L_y       = 24 + sm83_not_pch_dec1_param::L_y,
		parameter real W_gate_in = sm83_not_pch_dec1_param::W_gate_in,
		parameter real W_gate_y  = 0
	) (
		input      logic pch_n,
		inout  tri logic in,
		output     logic y
	);

	import sm83_timing::*;

	assign y = !in;

	localparam realtime T_rise_buf = tpd_elmore(L_in, R_pmos_ohm(8*L_unit), C_gate_F(W_gate_in));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, T_Z_buf, T_Z_buf) (in, '1, pch_n);

	specify
		specparam T_rise_y = tpd_elmore(L_y, R_pmos_ohm(17*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y = tpd_elmore(L_y, R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_y));

		(in *> y) = (T_rise_y, T_fall_y);
	endspecify

endmodule

`default_nettype wire
