/*
 * Implemented ALU based on this information:
 * http://www.righto.com/2013/09/the-z-80-has-4-bit-alu-heres-how-it.html
 * https://baltazarstudios.com/
 */

 `timescale 1ns/1ns
`default_nettype none

module sm83_alu_flags(
		input  logic       clk,

		output logic [7:0] dout,             /* Flags output to data bus. */
		input  logic [7:0] din,              /* Flags input from data bus. */

		input  logic       flags_bus,        /* Get in flags from din. */
		input  logic       flags_alu,        /* Get in flags from ALU. */

		input  logic       zero_we,          /* Update zero flag. */
		input  logic       zero_clr,         /* Clear zero flag on update. */
		input  logic       half_carry_we,    /* Update half carry flag. */
		input  logic       half_carry_set,   /* Output 1 for half carry flag. */
		input  logic       half_carry_cpl,   /* Invert half carry output. */
		input  logic       daa_carry_we,     /* Update half carry flag for DAA. */
		input  logic       neg_we,           /* Update subtract flag. Can receive sign flag from ALU. */
		input  logic       neg_set,          /* Set subtract flag on update. */
		input  logic       neg_clr,          /* Clear subtract flag on update. */
		input  logic       carry_we,         /* Update primary carry flag. */
		input  logic       sec_carry_we,     /* Update secondary carry flag and prevent update on primary. */
		input  logic       sec_carry_sh,     /* Secondary carry stores shift out carry on update. */
		input  logic       sec_carry_daa,    /* Secondary carry stores DAA carry on update. */
		input  logic       sec_carry_sel,    /* Select secondary carry reg for carry output. */
		input  logic       carry_set,        /* Output 1 for carry flag. */
		input  logic       carry_cpl,        /* Invert carry flag output. */

		input  logic       zero_in,          /* Zero flag from ALU. */
		input  logic       carry_in,         /* Carry flag from ALU. */
		input  logic       shift_out_in,     /* Shift out from ALU control. */
		input  logic       daa_carry_in,     /* DAA carry from ALU control. */
		input  logic       sign_in,          /* Sign flag from ALU. */

		output logic       zero,             /* Zero flag output. */
		output logic       half_carry,       /* Half carry output. */
		output logic       daa_carry,        /* Output of half carry for DAA. */
		output logic       neg,              /* Subtract flag output. */
		output logic       carry,            /* Carry output. */
		output logic       pri_carry         /* Output of carry directly from primary carry reg. */
	);

	localparam int Z = 7;
	localparam int N = 6;
	localparam int H = 5;
	localparam int C = 4;

	assign dout[Z]   = zero;
	assign dout[N]   = neg;
	assign dout[H]   = half_carry;
	assign dout[C]   = carry;
	assign dout[3:0] = 0;

	always_ff @(posedge clk) if (zero_we) begin
		assume (flags_bus != flags_alu);
		if (zero_clr)
			zero <= 0;
		else unique case (1)
			flags_bus: zero <= din[Z];
			flags_alu: zero <= zero_in;
		endcase
	end

	always_ff @(posedge clk) if (neg_we) begin
		assume (neg_clr || neg_set || flags_bus != flags_alu);
		if (neg_clr)
			neg <= 0;
		else if (neg_set)
			neg <= 1;
		else unique case (1)
			flags_bus: neg <= din[N];
			flags_alu: neg <= sign_in;
		endcase
	end

	logic hc_reg, sec_c_reg;

	function automatic logic write_carry(int bitnum);
		assume (flags_bus != flags_alu);
		unique case (1)
			flags_bus: write_carry = din[bitnum];
			flags_alu: write_carry = carry_in;
		endcase
	endfunction

	always_ff @(posedge clk) if (sec_carry_we) unique case ({ sec_carry_daa, sec_carry_sh })
		'b00: sec_c_reg <= carry_in;
		'b01: sec_c_reg <= shift_out_in;
		'b10: sec_c_reg <= daa_carry_in;
	endcase
	initial sec_c_reg = 0;

	assert property (!carry_we || !sec_carry_we);

	always_ff @(posedge clk) if (half_carry_we) hc_reg    <= write_carry(H);
	always_ff @(posedge clk) if (daa_carry_we)  daa_carry <= write_carry(H);
	always_ff @(posedge clk) if (carry_we)      pri_carry <= write_carry(C);
	initial hc_reg    = 0;
	initial daa_carry = 0;
	initial pri_carry = 0;

	always_comb begin
		logic c, hc;

		c  = carry_set;
		hc = half_carry_set || hc_reg;

		if (sec_carry_sel)
			c |= sec_c_reg;
		else
			c |= pri_carry;

		if (carry_cpl)      c  = !c;
		if (half_carry_cpl) hc = !hc;

		carry      = c;
		half_carry = hc;
	end
endmodule
