`default_nettype none

module dffr #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nreset, d,
		output logic q
	);

	logic initff = $isunknown(INITIAL_Q) ? $random&1 : INITIAL_Q;

	logic ff;
	initial ff = initff;

	always_ff @(posedge clk, negedge nreset) begin
		if (nreset)
			ff <= $isunknown(d) ? initff : d;
		else
			ff <= 0;
	end

	assign #T_DFFR q = ff;

endmodule
