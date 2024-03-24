`timescale 1ns/1ns
`default_nettype none

module drlatch #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic c, nreset, d,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (!nreset)
			l = 0;
		else if (c)
			l = d;
	end

	assign #T_DRL q = l;

endmodule
