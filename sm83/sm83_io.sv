`timescale 1ns/1ns
`default_nettype none

module sm83_io(
		input  logic        clk, reset,
		input  logic        t1, t2, t3, t4,
		input  logic        mread,
		input  logic        mwrite,

		output logic [15:0] aout,
		input  logic [15:0] ain,

		output logic [7:0]  dout,
		input  logic [7:0]  din,
		output logic [7:0]  ext_dout,
		input  logic [7:0]  ext_din,
		input  logic        apin_we,
		input  logic        dl_we,

		output logic        rd, wr,

		output logic [7:0]  opcode,
		output logic        bank_cb,

		input  logic [7:0]  iena,
		input  logic        iena_sel,

		input  logic        ctl_ir_we,
		input  logic        ctl_ir_bank_we,
		input  logic        ctl_ir_bank_cb_set,
		input  logic        ctl_zero_data_oe
	);

	typedef logic [7:0] word_t;

	always_ff @(posedge clk) begin
		/* read or write sequence should only be triggered right before next cycle */
		assume (t4 || !mread);
		assume (t4 || !mwrite);
		/* only one sequence can be triggered at a time */
		assume (!mread || !mwrite);

		if (reset) begin
			rd <= 0;
			wr <= 0;
		end else if (t4) begin
			rd <= mread;
			wr <= mwrite;
		end else begin
			rd <= rd || mread;
			wr <= wr || mwrite;
		end
	end

	initial rd = 0;
	initial wr = 0;

	always_ff @(posedge clk) begin
		/* Zero upper address lines after each memory cycle */
		if (t4)
			aout[15:8] <= 0;

		if (apin_we)
			aout <= ain;
	end

	initial aout = 0;

	word_t data, data_t4;
	always_ff @(posedge clk) priority case (1)
		ctl_zero_data_oe || dl_we: unique case (1)
			ctl_zero_data_oe: data <= 0;
			dl_we:            data <= din;
		endcase
		rd && t4:             data <= iena_sel ? iena : ext_din;
		default:              data <= dout;
	endcase
	always_comb priority case (1)
		ctl_zero_data_oe: data_t4 = 0;
		default:          data_t4 = iena_sel ? iena : ext_din;
	endcase
	assign dout = rd && t4 ? data_t4 : data;
	assign ext_dout = data;

	initial data    = 0;
	initial data_t4 = 0;

	word_t opcode_r;
	always_ff @(posedge clk) begin
		/* instruction register should only be written during a read at T4 */
		assume ((t4 && rd) || !ctl_ir_we || ctl_zero_data_oe);
		if (reset) begin
			opcode_r <= 0;
			bank_cb  <= 0;
		end else begin
			if (ctl_ir_we)
				opcode_r <= data_t4;
			if (ctl_ir_bank_we)
				bank_cb  <= ctl_ir_bank_cb_set;
		end
	end
	assign opcode = ctl_ir_we ? data_t4 : opcode_r;

	initial bank_cb  = 0;
	initial opcode_r = 0;

	/* Don't run into illegal instructions */
	assume property (bank_cb || opcode != 'hd3);
	assume property (bank_cb || opcode != 'hdb);
	assume property (bank_cb || opcode != 'hdd);
	assume property (bank_cb || opcode != 'he3);
	assume property (bank_cb || opcode != 'he4);
	assume property (bank_cb || opcode != 'heb);
	assume property (bank_cb || opcode != 'hec);
	assume property (bank_cb || opcode != 'hed);
	assume property (bank_cb || opcode != 'hf4);
	assume property (bank_cb || opcode != 'hfc);
	assume property (bank_cb || opcode != 'hfd);

endmodule
