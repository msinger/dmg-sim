`default_nettype none

module dmg_pad_pass #(
		parameter real L_pad = 0
	) (
		input  real a,
		output real pad
	);

	assign pad = a;

endmodule

`default_nettype wire
