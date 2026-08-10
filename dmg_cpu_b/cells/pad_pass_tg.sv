`default_nettype none

package dmg_pad_pass_tg_param;

	import dmg_timing::L_unit;

	parameter real L_a   = 0.0;
	parameter real L_pad = 0.0;

	parameter real W_gate_pad = 0;

endpackage

module dmg_pad_pass_tg #(
		parameter real L_a      = dmg_pad_pass_tg_param::L_a,
		parameter real W_gate_a = 0
	) (
		output real a,
		input  real pad
	);

	assign a = pad;

endmodule

`default_nettype wire
