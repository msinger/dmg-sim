`default_nettype none

module latch(
		input  logic c, d,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (c)
			l = d;
	end

	assign #T_LATCH q = l;

endmodule
