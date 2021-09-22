`default_nettype none

module dff #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, d,
		output logic q
	);

	logic initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	logic ff;
	initial ff = initff;

	always_ff @(posedge clk) begin
		ff <= $isunknown(d) ? initff : d;
	end

	assign #T_DFF q = ff;

endmodule
