`default_nettype none
`timescale 1ns/100ps

module dffr(clk, nreset, d, q);

	parameter INITIAL_Q = 2;

	input  wire clk, nreset, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(posedge clk or negedge nreset) begin
		if (nreset)
			ff <= (d === 1'bx) ? $random : d;
		else
			ff <= 0;
	end

	assign #T_DFFR q = ff;

endmodule
