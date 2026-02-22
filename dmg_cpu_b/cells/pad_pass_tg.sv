`default_nettype none

module dmg_pad_pass_tg #(
		parameter real L_a = 0
	) (
		output real a,
		input  real pad
	);

	assign a = pad;

endmodule

`default_nettype wire
