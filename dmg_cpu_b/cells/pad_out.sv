`default_nettype none

package dmg_pad_out_param;

	import dmg_timing::L_unit;

	parameter real L_o_n = 0.0;
	parameter real L_pad = 0.0;

	parameter real W_gate_o_n = 280*L_unit;
	parameter real W_gate_pad = 0;

endpackage

module dmg_pad_out #(
		parameter real L_pad      = dmg_pad_out_param::L_pad,
		parameter real W_gate_pad = 0
	) (
		input  logic o_n,
		output logic pad
	);

	import dmg_timing::*;

	localparam realtime T_rise_pad = tpd_elmore(L_pad, R_pmos_ohm(140), C_gate_F(W_gate_pad));
	localparam realtime T_fall_pad = tpd_elmore(L_pad, R_nmos_ohm(140), C_gate_F(W_gate_pad));
	assign #(T_rise_pad, T_fall_pad) pad = !o_n;

endmodule

`default_nettype wire
