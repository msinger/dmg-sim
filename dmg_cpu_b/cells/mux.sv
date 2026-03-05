`default_nettype none

module dmg_mux #(
		parameter real L_y = 54
	) (
		input  logic d0, d1, sel,
		output logic y
	);

	import dmg_timing::*;

	logic sel_n;
	localparam realtime T_rise_sel = tpd_elmore(33, R_pmos_ohm(6*L_unit));
	localparam realtime T_fall_sel = tpd_elmore(33, R_nmos_ohm(6*L_unit));
	assign #(T_rise_sel, T_fall_sel) sel_n = !sel;

	tri logic mux;
	localparam realtime T_rise_buf = tpd_elmore(93, R_pmos_ohm(6*L_unit));
	localparam realtime T_fall_buf = tpd_elmore(93, R_nmos_ohm(6*L_unit));
	bufif0 (strong1, highz0) #(T_rise_buf, T_fall_buf) (mux, d0, sel);
	bufif1 (highz1, strong0) #(T_rise_buf, T_fall_buf) (mux, d0, sel_n);
	bufif0 (strong1, highz0) #(T_rise_buf, T_fall_buf) (mux, d1, sel_n);
	bufif1 (highz1, strong0) #(T_rise_buf, T_fall_buf) (mux, d1, sel);
	keeper mux_keeper(mux);

	localparam realtime T_rise_muxi = tpd_elmore(116, R_pmos_ohm(35*L_unit));
	localparam realtime T_fall_muxi = tpd_elmore(116, R_nmos_ohm(35*L_unit));
	localparam realtime T_rise_y    = tpd_elmore(L_y, R_pmos_ohm(35*L_unit));
	localparam realtime T_fall_y    = tpd_elmore(L_y, R_nmos_ohm(35*L_unit));
	assign #(T_fall_muxi + T_rise_y, T_rise_muxi + T_fall_y) y = !(!mux);

endmodule

`default_nettype wire
