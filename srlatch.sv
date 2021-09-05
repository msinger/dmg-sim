`default_nettype none

module srlatch(
		input  logic s, r,
		output logic q
	);

	logic l;

	initial l = $random;

	always_latch begin
		if (s)
			l = 1;
		if (r)
			l = 0;

		if (s && r)
			$display("SRLATCH has S and R set at the same time!");
	end

	assign #T_SRL q = l;

endmodule
