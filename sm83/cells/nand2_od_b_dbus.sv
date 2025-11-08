`default_nettype none

module sm83_nand2_od_b_dbus #(
		parameter real L_y = 0
	) (
		input      logic in1, in2,
		output tri logic y
	);

	import sm83_timing::*;

	localparam realtime T_fall_y = tpd_elmore(L_y, R_nmos_ohm(12*L_unit) * 2);
	localparam realtime T_Z_y    = tpd_z(, T_fall_y);
	assign (highz1, strong0) #(0, T_fall_y, T_Z_y) y = (in1 & in2) ? 0 : 'z;

endmodule

`default_nettype wire
