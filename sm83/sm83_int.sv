`timescale 1ns/1ns
`default_nettype none

module sm83_int(
		input  logic       clk, reset,
		input  logic       t1, t2, t3, t4,
		output logic       intr_entry,
		output logic [7:0] int_vector,

		input  logic [7:0] irq,
		output logic [7:0] iack,
		output logic       wake,
		output logic       int_pending,

		input  logic [7:0] iena_din,
		output logic [7:0] iena_dout,
		input  logic       iena_we,

		input  logic       ctl_update_int, ctl_ime_we, ctl_ime_bit, ctl_ack_int
	);

	logic [7:0] reg_iena, irq_latched, wake_latched;
	logic       ime;

	always_ff @(posedge clk) begin
		if (reset)
			ime <= 0;
		else if (ctl_ime_we)
			ime <= ctl_ime_bit;
	end

	always_ff @(posedge clk) begin
		assert(!ctl_update_int || !t2);
		if (reset)
			intr_entry <= 0;
		else if (ctl_update_int)
			intr_entry <= ime && |(irq_latched & reg_iena);
	end

	always_ff @(posedge clk) begin
		if (reset)
			reg_iena <= 0;
		else if (iena_we)
			reg_iena <= iena_din;
	end

	/* Synchronize interrupt flags for interrupt entry. */
	always_latch if (t2) irq_latched <= irq;
	assign int_pending = t3 && |(irq_latched & reg_iena);

	/* Synchronize interrupt flags for wakeup. */
	always_latch if (t4) wake_latched <= irq;
	assign wake = t1 && |(wake_latched & reg_iena);

	always_comb priority casez (irq_latched & reg_iena)
		'b ???????1: int_vector = 'h40;
		'b ??????10: int_vector = 'h48;
		'b ?????100: int_vector = 'h50;
		'b ????1000: int_vector = 'h58;
		'b ???10000: int_vector = 'h60;
		'b ??100000: int_vector = 'h68;
		'b ?1000000: int_vector = 'h70;
		'b 10000000: int_vector = 'h78;
		default:     int_vector = 'h00; /* Must be zero. See Mooneye GB's acceptance/interrupts/ie_push test. */
	endcase

	always_comb priority casez (irq_latched & reg_iena & {8{ctl_ack_int}})
		'b ???????1: iack = 'b 00000001;
		'b ??????10: iack = 'b 00000010;
		'b ?????100: iack = 'b 00000100;
		'b ????1000: iack = 'b 00001000;
		'b ???10000: iack = 'b 00010000;
		'b ??100000: iack = 'b 00100000;
		'b ?1000000: iack = 'b 01000000;
		'b 10000000: iack = 'b 10000000;
		default:     iack = 'b 00000000;
	endcase

	assign iena_dout = reg_iena;

endmodule
