`default_nettype none

package sm83_mux_idu_l_param;

	import sm83_timing::L_unit;

	parameter real L_d0  = 18.1;
	parameter real L_d1  = 18.5;
	parameter real L_sel = 20.9;
	parameter real L_y   =  0.0;

	parameter real W_gate_d0  =  6*L_unit;
	parameter real W_gate_d1  =  6*L_unit;
	parameter real W_gate_sel = 12*L_unit;

endpackage

module sm83_mux_idu_l #(
		parameter real L_y      = 37 + sm83_mux_idu_l_param::L_y,
		parameter real W_gate_y = 0
	) (
		input  logic d0, d1, sel,
		output logic y
	);

	import sm83_timing::*;

	assign y = sel ? d1 : d0;

	specify
		specparam T_rise_sel = tpd_elmore( 31,   R_pmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_fall_sel = tpd_elmore( 31,   R_nmos_ohm( 3*L_unit), C_gate_F( 6*L_unit));
		specparam T_rise_buf = tpd_elmore( 36, 2*R_pmos_ohm( 3*L_unit), C_gate_F(15*L_unit));
		specparam T_fall_buf = tpd_elmore( 36, 2*R_nmos_ohm( 3*L_unit), C_gate_F(15*L_unit));
		specparam T_rise_y   = tpd_elmore(L_y,   R_pmos_ohm(10*L_unit), C_gate_F(W_gate_y));
		specparam T_fall_y   = tpd_elmore(L_y,   R_nmos_ohm( 5*L_unit), C_gate_F(W_gate_y));

		(d0, d1 *> y) = (T_fall_buf + T_rise_y, T_rise_buf + T_fall_y);
		(sel    *> y) = (T_rise_sel + T_fall_buf + T_rise_y, T_fall_sel + T_rise_buf + T_fall_y);
	endspecify

endmodule

`default_nettype wire
