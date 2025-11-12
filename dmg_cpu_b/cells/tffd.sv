`default_nettype none

module tffd #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic nclk, load, d,
		output logic q
	);

	bit ff1, ff2, initff;
	initial begin
		initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;
		ff1    = initff;
		ff2    = initff;
	end

	always_latch begin
		if (load) begin
			ff2  = $isunknown(d) ? initff : d;
			ff1 <= ff2;
		end else if (nclk)
			ff2  = !ff1;
		else
			ff1 <= ff2;
	end

	assign #T_TFFD q = ff1;

endmodule
