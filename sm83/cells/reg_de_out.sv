`default_nettype none

package sm83_reg_de_out_param;

	import sm83_timing::L_unit;

	parameter real L_ena1    = 0.0;
	parameter real L_d_ena2  = 0.0;
	parameter real L_e_ena2  = 0.0;
	parameter real L_d_in    = 0.0;
	parameter real L_e_in    = 0.0;
	parameter real L_d_zero1 = 0.0;
	parameter real L_d_zero2 = 0.0;
	parameter real L_d_y1    = 0.0;
	parameter real L_e_y1    = 0.0;
	parameter real L_y2      = 0.0;

	parameter real W_gate_ena1    = 16*L_unit;
	parameter real W_gate_d_ena2  =  8*L_unit;
	parameter real W_gate_e_ena2  =  8*L_unit;
	parameter real W_gate_d_in    = 16*L_unit;
	parameter real W_gate_e_in    = 16*L_unit;
	parameter real W_gate_d_zero1 = 10*L_unit;
	parameter real W_gate_d_zero2 = 10*L_unit;

endpackage

module sm83_reg_de_out #(
		parameter real L_d_y1      = 61 + sm83_reg_de_out_param::L_d_y1,
		parameter real L_e_y1      = 89 + sm83_reg_de_out_param::L_e_y1,
		parameter real L_y2        = 88 + sm83_reg_de_out_param::L_y2,
		parameter real W_gate_d_y1 = 0,
		parameter real W_gate_e_y1 = 0,
		parameter real W_gate_y2   = 0
	) (
		input      logic ena1, d_ena2, e_ena2, d_in, e_in, d_zero1, d_zero2,
		output tri logic d_y1, e_y1, y2
	);

	import sm83_timing::*;

	localparam realtime T_fall_d_y1  = tpd_elmore(L_d_y1, 2*R_nmos_ohm( 8*L_unit), C_gate_F(W_gate_d_y1));
	localparam realtime T_fall_d_y1z = tpd_elmore(L_d_y1,   R_nmos_ohm(10*L_unit), C_gate_F(W_gate_d_y1));
	localparam realtime T_Z_d_y1     = tpd_z(, T_fall_d_y1);
	assign (highz1, strong0) #(T_Z_d_y1, T_fall_d_y1, T_Z_d_y1)  d_y1 = (ena1 & d_in) ? 0 : 'z;
	assign (highz1, strong0) #(T_Z_d_y1, T_fall_d_y1z, T_Z_d_y1) d_y1 = (d_zero1 | d_zero2) ? 0 : 'z;

	localparam realtime T_fall_e_y1 = tpd_elmore(L_e_y1, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_e_y1));
	localparam realtime T_Z_e_y1    = tpd_z(, T_fall_e_y1);
	assign (highz1, strong0) #(T_Z_e_y1, T_fall_e_y1, T_Z_e_y1) e_y1 = (ena1 & e_in) ? 0 : 'z;

	localparam realtime T_fall_y2 = tpd_elmore(L_y2, 2*R_nmos_ohm(8*L_unit), C_gate_F(W_gate_y2));
	localparam realtime T_Z_y2    = tpd_z(, T_fall_y2);
	assign (highz1, strong0) #(T_Z_y2, T_fall_y2, T_Z_y2) y2 = ((d_ena2 & d_in) | (e_ena2 & e_in)) ? 0 : 'z;

endmodule

`default_nettype wire
