`default_nettype none

module dff #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, d,
		output logic q
	);

	logic ff;

	initial ff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;

	always_ff @(posedge clk) begin
		ff <= $isunknown(d) ? $random : d;
	end

	assign #T_DFF q = ff;

endmodule
