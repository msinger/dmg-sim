`default_nettype none
`timescale 1ns/100ps

// TODO: check if clock is negedge for all COUNT cells
// TODO: check if async load is active high for all COUNT cells
module count(nclk, load, d, q);

	parameter INITIAL_Q = 2;

	input  wire nclk, load, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(negedge nclk or posedge load) begin
		if (load)
			ff <= (d === 1'bx) ? $random : d;
		else
			ff <= !ff;
	end

	assign #T_COUNT q = load ? d : ff;

endmodule
