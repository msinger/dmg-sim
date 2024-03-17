`default_nettype none

module dffr_b #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nreset, d,
		output logic q
	);

	bit ff, initff;
	initial begin
		initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;
		ff     = initff;
	end

	always_ff @(posedge clk, negedge nreset) begin
		if (nreset)
			ff <= $isunknown(d) ? initff : d;
		else
			ff <= 0;
	end

	assign q = ff;

endmodule
