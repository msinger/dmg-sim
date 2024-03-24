`timescale 1ns/1ns
`default_nettype none

module dlatch_b(
		input  logic c, d,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (c)
			l = d;
	end

	assign #T_DL_B q = l;

endmodule
