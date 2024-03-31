/*
 * Implemented ALU based on this information:
 * http://www.righto.com/2013/09/the-z-80-has-4-bit-alu-heres-how-it.html
 * https://baltazarstudios.com/
 */

 `timescale 1ns/1ns
`default_nettype none

module sm83_alu_control(
		input  logic       clk,

		output logic [7:0] daa_out,          /* Outputs 0x00, 0x06, 0x60 or 0x66, depending on comparators in ALU. */

		input  logic [2:0] op543,            /* Controls shift behaviour and conditionals. Bit [5:3] of current op code. */
		input  logic       shift,            /* Perform shift operation. */
		input  logic       shift_dbh,        /* MSB used as carry during shift or for sign extend. */
		input  logic       shift_dbl,        /* LSB used as carry during shift. */
		input  logic       zero,             /* Zero flag input. */
		input  logic       carry,            /* Carry input. */
		input  logic       pri_carry,        /* Carry input coming directly from primary carry buffer. */
		input  logic       daa_carry,        /* Half carry input for DAA. */
		input  logic       daa_neg,          /* Subtract flag input for DAA. */
		input  logic       cond_we,          /* Evaluate flags for condition and buffer result. */

		input  logic       daa_l_gt_9,       /* ALU lower A greater than 9? */
		input  logic       daa_h_gt_9,       /* ALU higher A greater than 9? */
		input  logic       daa_h_eq_9,       /* ALU higher A equals 9? */

		output logic       shift_out,        /* Shift carry output. */
		output logic       shift_into_alu,   /* Shift carry in for ALU. */
		output logic       shift_l, shift_r, /* Shift left and right signals for ALU. */
		output logic       cond_result,      /* Buffered condition result. */
		output logic       daa_carry_out     /* Carry output from DAA. */
	);

	assign shift_l = shift && !op543[0];
	assign shift_r = shift && op543[0];

	always_comb unique case (op543)
		0, 5:    shift_into_alu = shift_dbh; /* RLC, SRA */
		1:       shift_into_alu = shift_dbl; /* RRC */
		2, 3:    shift_into_alu = pri_carry; /* RL, RR */
		4, 7:    shift_into_alu = 0;         /* SLA, SRL */
		default: shift_into_alu = 'x;        /* (SWAP doesn't use shift) */
	endcase

	assign shift_out = op543[0] ? shift_dbl : shift_dbh;

	always_ff @(posedge clk) if (cond_we) unique case (op543[1:0])
		0: cond_result <= !zero;
		1: cond_result <= zero;
		2: cond_result <= !carry;
		3: cond_result <= carry;
	endcase
	initial cond_result = 0;

	always_comb begin
		logic [7:0] out;
		logic       c;

		out = 0;
		c   = daa_carry;
		if (!daa_neg)
			c |= daa_l_gt_9;

		if (c)
			out |= 'h06;

		c = pri_carry;
		if (!daa_neg) begin
			c |= daa_h_gt_9;
			c |= daa_l_gt_9 && daa_h_eq_9;
		end

		if (c)
			out |= 'h60;

		daa_out       = out;
		daa_carry_out = c;
	end

endmodule
