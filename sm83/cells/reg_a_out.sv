`default_nettype none

package sm83_reg_a_out_param;

	import sm83_timing::L_unit;

	parameter real L_a_ena =  8.9;
	parameter real L_b_ena = 10.6;
	parameter real L_in    =  0.0;
	parameter real L_a_y   =  0.0;
	parameter real L_b_y   =  0.0;

	parameter real W_gate_a_ena =  8*L_unit;
	parameter real W_gate_b_ena =  8*L_unit;
	parameter real W_gate_in    = 16*L_unit;

endpackage

module sm83_reg_a_out #(
		parameter real L_a_y      = 44 + sm83_reg_a_out_param::L_a_y,
		parameter real L_b_y      = 33 + sm83_reg_a_out_param::L_b_y,
		parameter real W_gate_a_y = 0,
		parameter real W_gate_b_y = 0
	) (
		input      logic a_ena, b_ena, in,
		output tri logic a_y, b_y
	);

	import sm83_timing::*;

	localparam realtime T_fall_a_y = tpd_elmore(L_a_y, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_a_y));
	localparam realtime T_Z_a_y    = tpd_z(, T_fall_a_y);
	assign (highz1, strong0) #(T_Z_a_y, T_fall_a_y, T_Z_a_y) a_y = (a_ena & in) ? 0 : 'z;

	localparam realtime T_fall_b_y = tpd_elmore(L_b_y, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_b_y));
	localparam realtime T_Z_b_y    = tpd_z(, T_fall_b_y);
	assign (highz1, strong0) #(T_Z_b_y, T_fall_b_y, T_Z_b_y) b_y = (b_ena & in) ? 0 : 'z;

endmodule

`default_nettype wire
