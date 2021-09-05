`default_nettype none

module dlatch(
		input  logic c, d,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (c)
			l = d;
	end

	assign #T_DL q = l;

endmodule
