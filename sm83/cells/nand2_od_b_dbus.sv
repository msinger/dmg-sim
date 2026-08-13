`default_nettype none

package sm83_nand2_od_b_dbus_param;

	import sm83_timing::L_unit;

	parameter real L_in1 = 0.0;
	parameter real L_in2 = 0.0;
	parameter real L_y   = 0.0;

	parameter real W_gate_in1 = 12*L_unit;
	parameter real W_gate_in2 = 12*L_unit;

endpackage

module sm83_nand2_od_b_dbus #(
		parameter real L_y      = 3 + sm83_nand2_od_b_dbus_param::L_y,
		parameter real W_gate_y = 0
	) (
		input      logic in1, in2,
		output tri logic y
	);

	import sm83_timing::*;

	localparam realtime T_fall_y = tpd_elmore(L_y, 2*R_nmos_ohm(12*L_unit), C_gate_F(W_gate_y));
	localparam realtime T_Z_y    = tpd_z(, T_fall_y);
	assign (highz1, strong0) #(T_Z_y, T_fall_y, T_Z_y) y = (in1 & in2) ? 0 : 'z;

endmodule

`default_nettype wire
