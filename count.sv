`default_nettype none

// TODO: check if clock is negedge for all COUNT cells
// TODO: check if async load is active high for all COUNT cells
module count #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic nclk, load, d,
		output logic q
	);

	logic ff;

	initial ff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	always @(negedge nclk, posedge load) begin
		if (load)
			ff <= $isunknown(d) ? $random : d;
		else
			ff <= !ff;
	end

	assign #T_COUNT q = load ? d : ff;

endmodule
