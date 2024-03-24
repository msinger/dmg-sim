`timescale 1ns/1ns
`default_nettype none

module nand_srlatch(
		input  logic ns, nr,
		output logic q, nq
	);

	logic lp, lm;

	initial begin
		lp = $random;
		lm = !lp;
	end

	always_latch begin
		if (!ns && nr) begin
			lp = 1;
			lm = 0;
		end else if (ns && !nr) begin
			lp = 0;
			lm = 1;
		end else if (!ns && !nr) begin
			lp = 1;
			lm = 1;
		end
	end

	assign #T_SRL q  = lp;
	assign #T_SRL nq = lm;

endmodule
