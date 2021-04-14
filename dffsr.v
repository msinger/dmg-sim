`default_nettype none
`timescale 1ns/100ps

module dffsr(clk, nset, nreset, d, q);

	parameter INITIAL_Q = 2;

	input  wire clk, nset, nreset, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(posedge clk or negedge nset or negedge nreset) begin
		if (nset && nreset)
			ff <= (d === 1'bx) ? $random : d;
		else if (!nreset) // TODO: check priority of set/reset
			ff <= 0;
		else
			ff <= 1;
	end

	assign #T_DFFSR q = ff;

endmodule
