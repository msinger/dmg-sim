`default_nettype none

module dlatch_a #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic c, d,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (c)
			l = d;
	end

	assign q = l;

endmodule
