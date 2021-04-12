`default_nettype none
`timescale 1ns/100ps

module latch(c, d, q);

	input  wire c, d;
	output wire q;

	assign #T_LATCH q = c ? d : q;

endmodule
