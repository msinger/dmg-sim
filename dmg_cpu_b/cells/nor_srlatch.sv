`default_nettype none

module nor_srlatch(
		input  logic s, r,
		output logic q, nq
	);

	logic lp, lm;

	initial begin
		lp = $random;
		lm = !lp;
	end

	always_latch begin
		if (s && !r) begin
			lp = 1;
			lm = 0;
		end else if (!s && r) begin
			lp = 0;
			lm = 1;
		end else if (s && r) begin
			lp = 0;
			lm = 0;
		end
	end

	assign q  = lp;
	assign nq = lm;

endmodule
