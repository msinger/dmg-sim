`timescale 1ns/1ns
`default_nettype none

module dffsr #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, nset, nreset, d,
		output logic q
	);

	bit ff, initff;
	initial begin
		initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;
		ff     = initff;
	end

	bit nset_posedge;
	initial nset_posedge = 0;
	always @(posedge nset) nset_posedge <= 1;

	bit nreset_posedge;
	initial nreset_posedge = 0;
	always @(posedge nreset) nreset_posedge <= 1;

	always @(posedge clk, negedge nset, negedge nreset, posedge nset_posedge, posedge nreset_posedge) begin
		if (!nreset) // TODO: check priority of set/reset
			ff <= 0;
		else if (!nset)
			ff <= 1;
		else if (nreset_posedge)
			ff <= 0;
		else if (nset_posedge)
			ff <= 1;
		else
			ff <= $isunknown(d) ? initff : d;

		if (nset_posedge)
			nset_posedge <= 0;

		if (nreset_posedge)
			nreset_posedge <= 0;
	end

	assign #T_DFFSR q = ff;

endmodule
