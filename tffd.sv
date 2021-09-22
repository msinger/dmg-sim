`default_nettype none

module tffd #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic nclk, load, d,
		output logic q
	);

	logic initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	logic ff;
	initial ff = initff;

	always @(negedge nclk, posedge load) begin
		if (load)
			ff <= $isunknown(d) ? initff : d;
		else
			ff <= !ff;
	end

	assign #T_TFFD q = load ? d : ff;

endmodule
