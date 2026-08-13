`default_nettype none

package sm83_reg_hl_out_param;

	import sm83_timing::L_unit;

	parameter real L_ena1   = 11.2;
	parameter real L_h_ena2 = 15.6;
	parameter real L_l_ena2 =  0.0;
	parameter real L_h_ena3 = 13.8;
	parameter real L_l_ena3 = 11.2;
	parameter real L_h_in   =  0.0;
	parameter real L_l_in   = 18.8;
	parameter real L_h_y1   =  0.0;
	parameter real L_l_y1   =  0.0;
	parameter real L_y2     =  0.0;
	parameter real L_y3     = 11.0;

	parameter real W_gate_ena1   = 16*L_unit;
	parameter real W_gate_h_ena2 =  8*L_unit;
	parameter real W_gate_l_ena2 =  8*L_unit;
	parameter real W_gate_h_ena3 =  8*L_unit;
	parameter real W_gate_l_ena3 =  8*L_unit;
	parameter real W_gate_h_in   = 24*L_unit;
	parameter real W_gate_l_in   = 24*L_unit;

endpackage

module sm83_reg_hl_out #(
		parameter real L_h_y1      = 42 + sm83_reg_hl_out_param::L_h_y1,
		parameter real L_l_y1      = 90 + sm83_reg_hl_out_param::L_l_y1,
		parameter real L_y2        = 85 + sm83_reg_hl_out_param::L_y2,
		parameter real L_y3        = 90 + sm83_reg_hl_out_param::L_y3,
		parameter real W_gate_h_y1 = 0,
		parameter real W_gate_l_y1 = 0,
		parameter real W_gate_y2   = 0,
		parameter real W_gate_y3   = 0
	) (
		input      logic ena1, h_ena2, h_ena3, l_ena2, l_ena3, h_in, l_in,
		output tri logic h_y1, l_y1, y2, y3
	);

	import sm83_timing::*;

	localparam realtime T_fall_h_y1 = tpd_elmore(L_h_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_h_y1));
	localparam realtime T_Z_h_y1    = tpd_z(, T_fall_h_y1);
	assign (highz1, strong0) #(T_Z_h_y1, T_fall_h_y1, T_Z_h_y1) h_y1 = (ena1 & h_in) ? 0 : 'z;

	localparam realtime T_fall_l_y1 = tpd_elmore(L_l_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_l_y1));
	localparam realtime T_Z_l_y1    = tpd_z(, T_fall_l_y1);
	assign (highz1, strong0) #(T_Z_l_y1, T_fall_l_y1, T_Z_l_y1) l_y1 = (ena1 & l_in) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y2));
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(T_Z_y2, T_fall_y2, T_Z_y2) y2 = ((h_ena2 & h_in) | (l_ena2 & l_in)) ? 0 : 'z;

	localparam realtime T_fall_y3 = tpd_elmore(L_y3, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y3));
	localparam realtime T_Z_y3    = tpd_z(, T_fall_y3);
	assign (highz1, strong0) #(T_Z_y3, T_fall_y3, T_Z_y3) y3 = ((h_ena3 & h_in) | (l_ena3 & l_in)) ? 0 : 'z;

endmodule

`default_nettype wire
