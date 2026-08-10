`default_nettype none

package dmg_pad_pass_param;

	import dmg_timing::L_unit;

	parameter real L_a   = 0.0;
	parameter real L_pad = 0.0;

	parameter real W_gate_a = 0;

endpackage

module dmg_pad_pass #(
		parameter real L_pad      = dmg_pad_pass_param::L_pad,
		parameter real W_gate_pad = 0
	) (
		input  real a,
		output real pad
	);

	assign pad = a;

endmodule

`default_nettype wire
