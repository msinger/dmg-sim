`timescale 1ns/1ns
`default_nettype none

module tffd #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic nclk, load, d,
		output logic q
	);

	bit ff, initff;
	initial begin
		initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;
		ff     = initff;
	end

	bit load_negedge;
	initial load_negedge = 0;
	always @(negedge load) load_negedge <= 1;

	always @(negedge nclk, posedge load_negedge) begin
		if (load_negedge)
			ff <= $isunknown(d) ? initff : d;
		else
			ff <= !ff;

		if (load_negedge)
			load_negedge <= 0;
	end

	assign #T_TFFD q = load ? d : ff;

endmodule
