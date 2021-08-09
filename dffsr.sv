`default_nettype none

module dffsr #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nset, nreset, d,
		output logic q
	);

	logic ff;

	initial ff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	always_ff @(posedge clk, negedge nset, negedge nreset) begin
		if (nset && nreset)
			ff <= $isunknown(d) ? $random : d;
		else if (!nreset) // TODO: check priority of set/reset
			ff <= 0;
		else
			ff <= 1;
	end

	assign #T_DFFSR q = ff;

endmodule
