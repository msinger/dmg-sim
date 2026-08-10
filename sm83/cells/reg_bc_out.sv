`default_nettype none

package sm83_reg_bc_out_param;

	import sm83_timing::L_unit;

	parameter real L_ena1   = 0.0;
	parameter real L_b_ena2 = 0.0;
	parameter real L_c_ena2 = 0.0;
	parameter real L_b_in   = 0.0;
	parameter real L_c_in   = 0.0;
	parameter real L_b_y1   = 0.0;
	parameter real L_c_y1   = 0.0;
	parameter real L_y2     = 0.0;

	parameter real W_gate_ena1   = 16*L_unit;
	parameter real W_gate_b_ena2 =  8*L_unit;
	parameter real W_gate_c_ena2 =  8*L_unit;
	parameter real W_gate_b_in   = 16*L_unit;
	parameter real W_gate_c_in   = 16*L_unit;

endpackage

module sm83_reg_bc_out #(
		parameter real L_b_y1      = 48 + sm83_reg_bc_out_param::L_b_y1,
		parameter real L_c_y1      = 81 + sm83_reg_bc_out_param::L_c_y1,
		parameter real L_y2        = 83 + sm83_reg_bc_out_param::L_y2,
		parameter real W_gate_b_y1 = 0,
		parameter real W_gate_c_y1 = 0,
		parameter real W_gate_y2   = 0
	) (
		input      logic ena1, b_ena2, c_ena2, b_in, c_in,
		output tri logic b_y1, c_y1, y2
	);

	import sm83_timing::*;

	localparam realtime T_fall_b_y1 = tpd_elmore(L_b_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_b_y1));
	localparam realtime T_Z_b_y1    = tpd_z(, T_fall_b_y1);
	assign (highz1, strong0) #(T_Z_b_y1, T_fall_b_y1, T_Z_b_y1) b_y1 = (ena1 & b_in) ? 0 : 'z;

	localparam realtime T_fall_c_y1 = tpd_elmore(L_c_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_c_y1));
	localparam realtime T_Z_c_y1    = tpd_z(, T_fall_c_y1);
	assign (highz1, strong0) #(T_Z_c_y1, T_fall_c_y1, T_Z_c_y1) c_y1 = (ena1 & c_in) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y2));
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(T_Z_y2, T_fall_y2, T_Z_y2) y2 = ((b_ena2 & b_in) | (c_ena2 & c_in)) ? 0 : 'z;

endmodule

`default_nettype wire
