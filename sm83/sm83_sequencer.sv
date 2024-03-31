`timescale 1ns/1ns
`default_nettype none

module sm83_sequencer(
		input  logic clk, reset, ncyc,
		input  logic set_m1,
		output logic m1, m2, m3, m4, m5, m6,
		output logic t1, t2, t3, t4
	);

	always_ff @(posedge clk) begin
		if (ncyc)
			{ t1, t2, t3, t4 } <= 'b1000;
		else
			{ t1, t2, t3, t4 } <= { 1'b0, t1, t2, t3 };
	end

	always_ff @(posedge clk) begin
		/* set_m1 should only be set on t4 */
		assume (t4 || !set_m1);

		if (t4)
			{ m1, m2, m3, m4, m5, m6 } <= { 1'b0, m1, m2, m3, m4, m5 };
		if (reset || set_m1)
			{ m1, m2, m3, m4, m5, m6 } <= 'b100000;
	end

	assume property ($onehot({ m1, m2, m3, m4, m5, m6 }));
	assume property ($onehot({ t1, t2, t3, t4 }) || reset);

	initial { m1, m2, m3, m4, m5, m6 } = 'b100000;
	initial { t1, t2, t3, t4 }         = 'b1000;

endmodule
