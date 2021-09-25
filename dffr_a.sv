`default_nettype none

module dffr_a #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nreset, d,
		output logic q
	);

	logic initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	logic ff;
	initial ff = initff;

	logic dffra_clk;
	assign dffra_clk = dffra_inv_clk ? !clk : clk;

	always_ff @(posedge dffra_clk, negedge nreset) begin
		if (nreset)
			ff <= $isunknown(d) ? initff : d;
		else
			ff <= 0;
	end

	assign #T_DFFR_A q = ff;

endmodule
