`default_nettype none
`timescale 1ns/100ps

module dff(clk, d, q);

	parameter INITIAL_Q = 2;

	input  wire clk, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(posedge clk) begin
		ff <= (d === 1'bx) ? $random : d;
	end

	assign #T_DFF q = ff;

endmodule
