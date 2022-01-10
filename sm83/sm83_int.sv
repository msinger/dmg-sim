`default_nettype none

module sm83_int(
		input  logic       clk, reset,
		input  logic       set_m1,
		output logic       in_int,
		output logic [2:0] int_num,
		output logic       ime,

		input  logic [7:0] irq,
		output logic [7:0] iack,

		input  logic [7:0] iena_din,
		output logic [7:0] iena_dout,
		input  logic       iena_we,

		input  logic       ctl_no_int, ctl_ime_we, ctl_ime_bit, ctl_ack_int
	);

	logic int_armed;

	logic [7:0] reg_iena;

	always_ff @(posedge clk) begin
		if (reset)
			ime <= 0;
		else if (ctl_ime_we)
			ime <= ctl_ime_bit;
	end

	always_ff @(posedge clk) begin
		if (reset || (in_int && ime))
			int_armed <= 0;
		else
			int_armed <= |(irq & reg_iena);
	end

	always_ff @(posedge clk) begin
		if (reset)
			in_int <= 0;
		else if (set_m1 && !ctl_no_int)
			in_int <= int_armed;
	end

	always_ff @(posedge clk) begin
		if (reset)
			reg_iena <= 0;
		else if (iena_we)
			reg_iena <= iena_din;
	end

	always_comb priority casez (irq & reg_iena)
		'b ???????1: int_num = 0;
		'b ??????10: int_num = 1;
		'b ?????100: int_num = 2;
		'b ????1000: int_num = 3;
		'b ???10000: int_num = 4;
		'b ??100000: int_num = 5;
		'b ?1000000: int_num = 6;
		'b 10000000: int_num = 7;
		default:     int_num = 'x;
	endcase

	always_comb priority casez (irq & reg_iena & {8{ctl_ack_int}})
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
