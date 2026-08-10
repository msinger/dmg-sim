`default_nettype none

package sm83_pch_dec2_b_param;

	import sm83_timing::L_unit;

	parameter real L_pch_n = 0.0;
	parameter real L_y     = 0.0;

	parameter real W_gate_pch_n = 7*L_unit;

endpackage

module sm83_pch_dec2_b #(
		parameter real L_y      = sm83_pch_dec2_b_param::L_y,
		parameter real W_gate_y = 0
	) (
		input      logic pch_n,
		output tri logic y
	);

	import sm83_timing::*;

	localparam realtime T_rise_buf = tpd_elmore(L_y, R_pmos_ohm(7*L_unit), C_gate_F(W_gate_y));
	localparam realtime T_Z_buf    = tpd_z(T_rise_buf);
	bufif0 (strong1, highz0) #(T_rise_buf, T_Z_buf, T_Z_buf) (y, '1, pch_n);

endmodule

`default_nettype wire
