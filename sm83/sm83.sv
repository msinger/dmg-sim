`timescale 1ns/1ns
`default_nettype none

module sm83(
		input  logic                 clk,
		input  logic                 reset, areset,
		input  logic                 ncyc,

		output logic [ADR_WIDTH-1:0] adr,
		input  logic [WORD_SIZE-1:0] din,
		output logic [WORD_SIZE-1:0] dout,
		output logic                 rd,
		output logic                 wr,

		input  logic [NUM_IRQS-1:0]  irq,
		output logic [NUM_IRQS-1:0]  iack,

		output logic                 clk_ena,
		input  logic                 clk_stable
	);

	localparam int WORD_SIZE = 8;
	localparam int ADR_WIDTH = WORD_SIZE * 2;
	localparam int NUM_IRQS  = WORD_SIZE;

	typedef logic [WORD_SIZE-1:0] word_t;

	typedef struct packed {
		word_t hi;
		word_t lo;
	} adr_t;

	typedef struct packed {
		word_t hi;
		word_t lo;
	} reg_t;

	logic m1, m2, m3, m4, m5, m6;
	logic t1, t2, t3, t4;

	adr_t al_in, al_out, apin;

	word_t opcode;
	logic  bank_cb;
	logic  intr_entry;

	sm83_io io(
		.clk, .reset,
		.t1, .t2, .t3, .t4,
		.mread(ctl_mread), .mwrite(ctl_mwrite),

		.aout(adr), .ain(apin),
		.dout(io_din), .din(io_dout),
		.ext_dout(dout), .ext_din(din),
		.apin_we(ctl_io_adr_we),
		.dl_we(ctl_io_data_we),

		.rd, .wr,

		.opcode, .bank_cb,

		.iena(iena_dout), .iena_sel,

		.ctl_ir_we, .ctl_ir_bank_we, .ctl_ir_bank_cb_set,
		.ctl_zero_data_oe
	);

	logic alu_shift_dbh, alu_shift_dbl;
	logic alu_shift_out, alu_shift_in, alu_shift_l, alu_shift_r;
	logic alu_zero, alu_carry, alu_ct_daa_carry, alu_sign;
	logic alu_daa_lgt9, alu_daa_hgt9, alu_daa_heq9;
	logic alu_fl_zero, alu_fl_carry, alu_fl_pri_carry, alu_fl_half_carry, alu_fl_daa_carry, alu_fl_neg;
	logic alu_cond_result;

	sm83_alu alu(
		.clk,
		.din (alu_din), .dout(alu_dout),

		.load_a(ctl_alu_op_a_bus), .load_a_zero(ctl_alu_op_a_zero),
		.load_b(ctl_alu_op_b_bus), .load_b_zero(ctl_alu_op_b_zero),
		.shift_in(alu_shift_in), .shift_l(alu_shift_l), .shift_r(alu_shift_r),
		.carry_in(ctl_alu_sel_hc ? alu_fl_half_carry : alu_fl_carry),
		.bsel(db_c2l[5:3]),

		.result_oe(ctl_alu_res_oe),
		.shift_oe (ctl_alu_sh_oe),
		.op_a_oe  (ctl_alu_op_a_oe),
		.bs_oe    (ctl_alu_bs_oe),

		.no_carry_out(ctl_alu_nc), .force_carry(ctl_alu_fc), .ignore_carry(ctl_alu_ic),
		.negate(ctl_alu_neg),
		.op_low(ctl_alu_op_low), .op_b_high(ctl_alu_op_b_high),

		.zero(alu_zero), .carry(alu_carry), .sign(alu_sign),

		.shift_dbh(alu_shift_dbh), .shift_dbl(alu_shift_dbl),
		.daa_l_gt_9(alu_daa_lgt9), .daa_h_gt_9(alu_daa_hgt9), .daa_h_eq_9(alu_daa_heq9)
	);

	sm83_alu_control alu_control(
		.clk,
		.daa_out(alu_ct_dout),

		.op543(opcode[5:3]),
		.shift(ctl_alu_shift),
		.shift_dbh(alu_shift_dbh), .shift_dbl(alu_shift_dbl),
		.zero(alu_fl_zero), .carry(alu_fl_carry), .pri_carry(alu_fl_pri_carry), .daa_carry(alu_fl_daa_carry),
		.daa_neg(alu_fl_neg),
		.cond_we(ctl_alu_cond_we),

		.daa_l_gt_9(alu_daa_lgt9), .daa_h_gt_9(alu_daa_hgt9), .daa_h_eq_9(alu_daa_heq9),

		.shift_out(alu_shift_out), .shift_into_alu(alu_shift_in), .shift_l(alu_shift_l), .shift_r(alu_shift_r),
		.cond_result(alu_cond_result),
		.daa_carry_out(alu_ct_daa_carry)
	);

	sm83_alu_flags alu_flags(
		.clk,
		.din(alu_fl_din), .dout(alu_fl_dout),

		.flags_bus(ctl_alu_fl_bus), .flags_alu(ctl_alu_fl_alu),

		.zero_we      (ctl_alu_fl_zero_we),   .zero_clr(ctl_alu_fl_zero_clr),
		.half_carry_we(ctl_alu_fl_half_we),   .half_carry_set(ctl_alu_fl_half_set), .half_carry_cpl(ctl_alu_fl_half_cpl),
		.daa_carry_we (ctl_alu_fl_daac_we),
		.neg_we       (ctl_alu_fl_neg_we),    .neg_set(ctl_alu_fl_neg_set), .neg_clr(ctl_alu_fl_neg_clr),
		.carry_we     (ctl_alu_fl_carry_we),  .sec_carry_we(ctl_alu_fl_c2_we),
		.sec_carry_sh (ctl_alu_fl_c2_sh),     .sec_carry_daa(ctl_alu_fl_c2_daa),
		.sec_carry_sel(ctl_alu_fl_sel_c2),
		.carry_set    (ctl_alu_fl_carry_set), .carry_cpl(ctl_alu_fl_carry_cpl),

		.zero_in(alu_zero), .carry_in(alu_carry), .sign_in(alu_sign),
		.shift_out_in(alu_shift_out), .daa_carry_in(alu_ct_daa_carry),

		.zero(alu_fl_zero), .half_carry(alu_fl_half_carry), .daa_carry(alu_fl_daa_carry),
		.neg(alu_fl_neg), .carry(alu_fl_carry), .pri_carry(alu_fl_pri_carry)
	);

	sm83_adr_inc adr_inc(
		.clk, .reset,
		.ain(al_in), .aout(al_out), .apin,

		.ctl_al_we, .ctl_al_hi_ff,
		.ctl_inc_dec, .ctl_inc_cy,
		.ctl_inc_oe
	);

	function automatic logic [WORD_SIZE-1:0] db_mux(input logic [6:0]           sel,
	                                                input logic [WORD_SIZE-1:0] in0,
	                                                input logic [WORD_SIZE-1:0] in1,
	                                                input logic [WORD_SIZE-1:0] in2,
	                                                input logic [WORD_SIZE-1:0] in3,
	                                                input logic [WORD_SIZE-1:0] in4,
	                                                input logic [WORD_SIZE-1:0] in5,
	                                                input logic [WORD_SIZE-1:0] in6);
		unique case (1)
			sel[0]:                db_mux = in0;
			sel[1]:                db_mux = in1;
			sel[2]:                db_mux = in2;
			sel[3]:                db_mux = in3;
			sel[4]:                db_mux = in4;
			sel[5]:                db_mux = in5;
			sel[6]:                db_mux = in6;
			!sel, $isunknown(sel): db_mux = 'x;
		endcase
	endfunction

	logic ctl_mread, ctl_mwrite;
	logic ctl_reg_gp2h_oe, ctl_reg_gp2l_oe;
	logic ctl_reg_h2gp_oe, ctl_reg_l2gp_oe;
	logic ctl_reg_gp_hi_sel, ctl_reg_gp_lo_sel;
	logic ctl_reg_gp_we;
	logic ctl_reg_sys_hi_sel, ctl_reg_sys_lo_sel;
	logic ctl_reg_sys_hi_we, ctl_reg_sys_lo_we;
	logic ctl_reg_bc_sel, ctl_reg_de_sel, ctl_reg_hl_sel, ctl_reg_af_sel, ctl_reg_sp_sel, ctl_reg_wz_sel, ctl_reg_pc_sel;
	logic ctl_reg_gp2sys_oe, ctl_reg_sys2gp_oe;
	logic ctl_al_we, ctl_al_hi_ff;
	logic ctl_inc_dec, ctl_inc_cy;
	logic ctl_inc_oe;
	logic ctl_db_c2l_oe, ctl_db_l2c_oe;
	logic ctl_db_l2h_oe, ctl_db_h2l_oe;
	logic ctl_db_c2l_mask543;
	logic ctl_io_data_oe, ctl_io_data_we;
	logic ctl_io_adr_we;
	logic ctl_zero_data_oe;
	logic ctl_ir_we;
	logic ctl_ir_bank_we;
	logic ctl_ir_bank_cb_set;
	logic ctl_alu_oe, ctl_alu_fl_oe, ctl_alu_daa_oe;
	logic ctl_alu_sh_oe, ctl_alu_op_a_oe, ctl_alu_res_oe, ctl_alu_bs_oe;
	logic ctl_alu_op_a_bus, ctl_alu_op_a_zero;
	logic ctl_alu_op_b_bus, ctl_alu_op_b_zero;
	logic ctl_alu_nc, ctl_alu_fc, ctl_alu_ic;
	logic ctl_alu_neg, ctl_alu_op_low, ctl_alu_op_b_high;
	logic ctl_alu_shift;   /* Makes ALU perform shift operation on data input. */
	logic ctl_alu_sel_hc;  /* Selects which carry flag goes into ALU core. (0: carry; 1: half carry) */
	logic ctl_alu_cond_we; /* Write condition result flag for conditional operation. */
	logic ctl_alu_fl_bus, ctl_alu_fl_alu;
	logic ctl_alu_fl_zero_we, ctl_alu_fl_zero_clr;
	logic ctl_alu_fl_half_we, ctl_alu_fl_half_set, ctl_alu_fl_half_cpl;
	logic ctl_alu_fl_daac_we;
	logic ctl_alu_fl_neg_we, ctl_alu_fl_neg_set, ctl_alu_fl_neg_clr;
	logic ctl_alu_fl_carry_we, ctl_alu_fl_carry_set, ctl_alu_fl_carry_cpl;
	logic ctl_alu_fl_c2_we, ctl_alu_fl_c2_sh, ctl_alu_fl_c2_daa, ctl_alu_fl_sel_c2;
	logic ctl_update_int, ctl_ime_we, ctl_ime_bit, ctl_ack_int, ctl_int_vector_oe;
	logic ctl_halt_set;

	logic  iena_oe, iena_we, iena_sel, wake, int_pending;
	word_t iena_dout, int_vector;
	assign iena_sel = &adr;
	assign iena_we  = iena_sel && wr && t3; /* Write IE register at T3 or T4: This makes Mooneye GB's acceptance/interrupts/ie_push test pass. */

	sm83_control ctl(.*);
	sm83_int     intr(.*, .iena_din(dout));

	reg_t reg_bc, reg_de, reg_hl, reg_af, reg_sp, reg_wz, reg_pc;
	reg_t reg_gp2sys, reg_sys2gp;

	initial reg_bc = 0;
	initial reg_de = 0;
	initial reg_hl = 0;
	initial reg_af = 0;
	initial reg_sp = 0;
	initial reg_wz = 0;
	initial reg_pc = 0;

	/* common data bus matrix */
	logic [2:0] dbc_sel;
	word_t      db_c2l, io_din, io_dout;
	assign dbc_sel = { ctl_int_vector_oe, ctl_io_data_oe, ctl_db_l2c_oe };
	assign db_c2l  = db_mux(dbc_sel,     'x, io_din, int_vector, 'x, 'x, 'x, 'x) & (ctl_db_c2l_mask543 ? 'h38 : {WORD_SIZE{1'b1}});
	assign io_dout = db_mux(dbc_sel, db_l2c,     'x, int_vector, 'x, 'x, 'x, 'x);

	/* low data bus matrix */
	logic [4:0] dbl_sel;
	word_t      db_l2c, db_l2h, reg_lo_dout, reg_lo_din, alu_ct_dout, alu_fl_dout, alu_fl_din;
	assign dbl_sel = { ctl_alu_fl_oe, ctl_alu_daa_oe, ctl_reg_gp2l_oe, ctl_db_h2l_oe, ctl_db_c2l_oe };
	assign db_l2c     = db_mux(dbl_sel,     'x, db_h2l, reg_lo_dout, alu_ct_dout, alu_fl_dout, 'x, 'x);
	assign db_l2h     = db_mux(dbl_sel, db_c2l,     'x, reg_lo_dout, alu_ct_dout, alu_fl_dout, 'x, 'x);
	assign reg_lo_din = db_mux(dbl_sel, db_c2l, db_h2l,          'x, alu_ct_dout, alu_fl_dout, 'x, 'x);
	assign alu_fl_din = db_mux(dbl_sel, db_c2l, db_h2l, reg_lo_dout, alu_ct_dout,          'x, 'x, 'x);

	/* high data bus matrix */
	logic [2:0] dbh_sel;
	word_t      db_h2l, reg_hi_dout, reg_hi_din, alu_dout, alu_din;
	assign dbh_sel = { ctl_alu_oe, ctl_reg_gp2h_oe, ctl_db_l2h_oe };
	assign db_h2l     = db_mux(dbh_sel,     'x, reg_hi_dout, alu_dout, 'x, 'x, 'x, 'x);
	assign reg_hi_din = db_mux(dbh_sel, db_l2h,          'x, alu_dout, 'x, 'x, 'x, 'x);
	assign alu_din    = db_mux(dbh_sel, db_l2h, reg_hi_dout,       'x, 'x, 'x, 'x, 'x);

	logic [3:0] reg_gp_sel, reg_gp_lo_oe, reg_gp_hi_oe;
	logic       reg_wz_lo_oe, reg_wz_hi_oe;
	assign reg_gp_sel = { ctl_reg_af_sel, ctl_reg_hl_sel, ctl_reg_de_sel, ctl_reg_bc_sel };
	assign reg_gp_lo_oe = reg_gp_sel & {4{ctl_reg_gp_lo_sel && !ctl_reg_gp_we}};
	assign reg_gp_hi_oe = reg_gp_sel & {4{ctl_reg_gp_hi_sel && !ctl_reg_gp_we}};
	assign reg_wz_lo_oe = ctl_reg_wz_sel && ctl_reg_sys_lo_sel && !ctl_reg_sys_lo_we;
	assign reg_wz_hi_oe = ctl_reg_wz_sel && ctl_reg_sys_hi_sel && !ctl_reg_sys_hi_we;

	/* low register bus matrix */
	logic [6:0] rbl_sel;
	word_t      rbl;
	assign rbl_sel = { ctl_reg_sys2gp_oe, ctl_reg_l2gp_oe, reg_wz_lo_oe, reg_gp_lo_oe };
	assign rbl           = db_mux(rbl_sel, reg_bc.lo, reg_de.lo, reg_hl.lo, reg_af.lo & 'hf0, reg_wz.lo, reg_lo_din, reg_sys2gp.lo);
	assign reg_lo_dout   = db_mux(rbl_sel, reg_bc.lo, reg_de.lo, reg_hl.lo, reg_af.lo & 'hf0, reg_wz.lo,         'x, reg_sys2gp.lo);
	assign reg_gp2sys.lo = db_mux(rbl_sel, reg_bc.lo, reg_de.lo, reg_hl.lo, reg_af.lo & 'hf0, reg_wz.lo, reg_lo_din,            'x);
	always_ff @(posedge clk) if (ctl_reg_gp_we && ctl_reg_gp_lo_sel) begin
		if (ctl_reg_bc_sel) reg_bc.lo <= rbl;
		if (ctl_reg_de_sel) reg_de.lo <= rbl;
		if (ctl_reg_hl_sel) reg_hl.lo <= rbl;
		if (ctl_reg_af_sel) reg_af.lo <= rbl;
	end
	always_ff @(posedge clk) if (ctl_reg_sys_lo_we && ctl_reg_sys_lo_sel && ctl_reg_wz_sel) reg_wz.lo <= rbl;

	/* high register bus matrix */
	logic [6:0] rbh_sel;
	word_t      rbh;
	assign rbh_sel = { ctl_reg_sys2gp_oe, ctl_reg_h2gp_oe, reg_wz_hi_oe, reg_gp_hi_oe };
	assign rbh           = db_mux(rbh_sel, reg_bc.hi, reg_de.hi, reg_hl.hi, reg_af.hi, reg_wz.hi, reg_hi_din, reg_sys2gp.hi);
	assign reg_hi_dout   = db_mux(rbh_sel, reg_bc.hi, reg_de.hi, reg_hl.hi, reg_af.hi, reg_wz.hi,         'x, reg_sys2gp.hi);
	assign reg_gp2sys.hi = db_mux(rbh_sel, reg_bc.hi, reg_de.hi, reg_hl.hi, reg_af.hi, reg_wz.hi, reg_hi_din,            'x);
	always_ff @(posedge clk) if (ctl_reg_gp_we && ctl_reg_gp_hi_sel) begin
		if (ctl_reg_bc_sel) reg_bc.hi <= rbh;
		if (ctl_reg_de_sel) reg_de.hi <= rbh;
		if (ctl_reg_hl_sel) reg_hl.hi <= rbh;
		if (ctl_reg_af_sel) reg_af.hi <= rbh;
	end
	always_ff @(posedge clk) if (ctl_reg_sys_hi_we && ctl_reg_sys_hi_sel && ctl_reg_wz_sel) reg_wz.hi <= rbh;

	logic [1:0] reg_sys_sel, reg_sys_lo_oe, reg_sys_hi_oe;
	assign reg_sys_sel = { ctl_reg_sp_sel, ctl_reg_pc_sel };
	assign reg_sys_lo_oe = reg_sys_sel & {2{ctl_reg_sys_lo_sel && !ctl_reg_sys_lo_we}};
	assign reg_sys_hi_oe = reg_sys_sel & {2{ctl_reg_sys_hi_sel && !ctl_reg_sys_hi_we}};

	/* address bus matrix */
	adr_t       ab;
	logic [3:0] abl_sel, abh_sel;
	assign abl_sel = { ctl_inc_oe, ctl_reg_gp2sys_oe, reg_sys_lo_oe };
	assign abh_sel = { ctl_inc_oe, ctl_reg_gp2sys_oe, reg_sys_hi_oe };
	assign ab.lo         = db_mux(abl_sel, reg_pc.lo, reg_sp.lo, reg_gp2sys.lo, al_out.lo, 'x, 'x, 'x);
	assign ab.hi         = db_mux(abh_sel, reg_pc.hi, reg_sp.hi, reg_gp2sys.hi, al_out.hi, 'x, 'x, 'x);
	assign reg_sys2gp.lo = db_mux(abl_sel, reg_pc.lo, reg_sp.lo,            'x, al_out.lo, 'x, 'x, 'x);
	assign reg_sys2gp.hi = db_mux(abh_sel, reg_pc.hi, reg_sp.hi,            'x, al_out.hi, 'x, 'x, 'x);
	assign al_in.lo      = db_mux(abl_sel, reg_pc.lo, reg_sp.lo, reg_gp2sys.lo,        'x, 'x, 'x, 'x);
	assign al_in.hi      = db_mux(abh_sel, reg_pc.hi, reg_sp.hi, reg_gp2sys.hi,        'x, 'x, 'x, 'x);

	always_ff @(posedge clk) begin
		if (reset)
			reg_pc <= 0;
		else begin
			if (ctl_reg_sys_lo_we && ctl_reg_sys_lo_sel) begin
				if (ctl_reg_pc_sel) reg_pc.lo <= ab.lo;
				if (ctl_reg_sp_sel) reg_sp.lo <= ab.lo;
			end
			if (ctl_reg_sys_hi_we && ctl_reg_sys_hi_sel) begin
				if (ctl_reg_pc_sel) reg_pc.hi <= ab.hi;
				if (ctl_reg_sp_sel) reg_sp.hi <= ab.hi;
			end
		end
	end

	always_ff @(negedge clk, posedge areset) begin
		if (areset || (halt_clk && t1))
			clk_ena <= 0;
		else if (clk_stable || wake)
			clk_ena <= 1;
	end

	logic halt_clk;
	always_ff @(posedge clk) begin
		if (reset || t1)
			halt_clk <= 0;
		else if (ctl_halt_set)
			halt_clk <= 1;
	end

endmodule
