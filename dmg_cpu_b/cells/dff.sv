`default_nettype none

module dff #(
		parameter logic INITIAL_Q = 'x
	) (
		input  logic clk, d,
		output logic q
	);

	bit ff, initff;
	initial begin
		initff = $isunknown(INITIAL_Q) ? $random : INITIAL_Q;
		ff     = initff;
	end

	logic dff_clk;
	assign dff_clk = dff_inv_clk ? !clk : clk;

	always_ff @(posedge dff_clk) begin
		ff <= $isunknown(d) ? initff : d;
	end

	assign #T_DFF q = ff;

endmodule
