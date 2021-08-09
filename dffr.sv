`default_nettype none

module dffr #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nreset, d,
		output logic q
	);

	logic ff;

	initial ff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	always_ff @(posedge clk, negedge nreset) begin
		if (nreset)
			ff <= $isunknown(d) ? $random : d;
		else
			ff <= 0;
	end

	assign #T_DFFR q = ff;

endmodule
