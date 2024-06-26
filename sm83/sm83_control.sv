`default_nettype none

module sm83_control(
		input  logic       clk, reset, ncyc,

		output logic       m1, m2, m3, m4, m5, m6,
		output logic       t1, t2, t3, t4,

		input  logic [7:0] opcode,
		input  logic       bank_cb,
		input  logic       intr_entry,

		input  logic       alu_fl_neg, alu_cond_result,

		input  logic       clk_ena, int_pending,

		output logic       ctl_mread, ctl_mwrite,
		output logic       ctl_reg_gp2h_oe, ctl_reg_gp2l_oe,
		output logic       ctl_reg_h2gp_oe, ctl_reg_l2gp_oe,
		output logic       ctl_reg_gp_hi_sel, ctl_reg_gp_lo_sel,
		output logic       ctl_reg_gp_we,
		output logic       ctl_reg_sys_hi_sel, ctl_reg_sys_lo_sel,
		output logic       ctl_reg_sys_hi_we, ctl_reg_sys_lo_we,
		output logic       ctl_reg_bc_sel, ctl_reg_de_sel, ctl_reg_hl_sel, ctl_reg_af_sel, ctl_reg_sp_sel, ctl_reg_wz_sel, ctl_reg_pc_sel,
		output logic       ctl_reg_gp2sys_oe, ctl_reg_sys2gp_oe,
		output logic       ctl_al_we, ctl_al_hi_ff,
		output logic       ctl_inc_dec, ctl_inc_cy,
		output logic       ctl_inc_oe,
		output logic       ctl_db_c2l_oe, ctl_db_l2c_oe,
		output logic       ctl_db_l2h_oe, ctl_db_h2l_oe,
		output logic       ctl_db_c2l_mask543,
		output logic       ctl_io_data_oe, ctl_io_data_we,
		output logic       ctl_io_adr_we,
		output logic       ctl_zero_data_oe,
		output logic       ctl_ir_we,
		output logic       ctl_ir_bank_we,
		output logic       ctl_ir_bank_cb_set,
		output logic       ctl_alu_oe, ctl_alu_fl_oe, ctl_alu_daa_oe,
		output logic       ctl_alu_sh_oe, ctl_alu_op_a_oe, ctl_alu_res_oe, ctl_alu_bs_oe,
		output logic       ctl_alu_op_a_bus, ctl_alu_op_a_zero,
		output logic       ctl_alu_op_b_bus, ctl_alu_op_b_zero,
		output logic       ctl_alu_nc, ctl_alu_fc, ctl_alu_ic,
		output logic       ctl_alu_neg, ctl_alu_op_low, ctl_alu_op_b_high,
		output logic       ctl_alu_shift,   /* Makes ALU perform shift operation on data input. */
		output logic       ctl_alu_sel_hc,  /* Selects which carry flag goes into ALU core. (0: carry; 1: half carry) */
		output logic       ctl_alu_cond_we, /* Write condition result flag for conditional operation. */
		output logic       ctl_alu_fl_bus, ctl_alu_fl_alu,
		output logic       ctl_alu_fl_zero_we, ctl_alu_fl_zero_clr,
		output logic       ctl_alu_fl_half_we, ctl_alu_fl_half_set, ctl_alu_fl_half_cpl,
		output logic       ctl_alu_fl_daac_we,
		output logic       ctl_alu_fl_neg_we, ctl_alu_fl_neg_set, ctl_alu_fl_neg_clr,
		output logic       ctl_alu_fl_carry_we, ctl_alu_fl_carry_set, ctl_alu_fl_carry_cpl,
		output logic       ctl_alu_fl_c2_we, ctl_alu_fl_c2_sh, ctl_alu_fl_c2_daa, ctl_alu_fl_sel_c2,
		output logic       ctl_update_int, ctl_ime_we, ctl_ime_bit, ctl_ack_int, ctl_int_vector_oe,
		output logic       ctl_halt_set
	);

	logic set_m1;
	logic no_pc;
	logic no_int;
	logic no_inc;

	logic in_rst;
	logic in_alu, new_in_alu;

	logic add_r;      /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP r/(HL) */
	logic add_hl;     /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP (HL) */
	logic add_n;      /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP n */
	logic add_x;      /* ADD r/(HL)/n */
	logic adc_x;      /* ADC r/(HL)/n */
	logic sub_x;      /* SUB r/(HL)/n */
	logic sbc_x;      /* SBC r/(HL)/n */
	logic and_x;      /* AND r/(HL)/n */
	logic xor_x;      /* XOR r/(HL)/n */
	logic or_x;       /* OR r/(HL)/n */
	logic cp_x;       /* CP r/(HL)/n */
	logic inc_m;      /* INC/DEC r/(HL) */
	logic inc_hl;     /* INC/DEC (HL) */
	logic dec_m;      /* DEC r/(HL) */
	logic rxxa;       /* RLCA/RLA/RRCA/RRA */
	logic daa;        /* DAA */
	logic cpl;        /* CPL */
	logic scf;        /* SCF */
	logic ccf;        /* CCF */
	logic add_hl_ss;  /* ADD HL, ss */
	logic add_sp_e;   /* ADD SP, e */
	logic inc_ss;     /* INC/DEC ss */
	logic ld_r_r;     /* LD r, r  ~or~  LD r, (HL)  ~or~  LD (HL), r  (~or~  HALT) */
	logic ld_r_hl;    /* LD r, (HL)  (~or~  HALT) */
	logic ld_hl_r;    /* LD (HL), r  (~or~  HALT) */
	logic ld_r_n;     /* LD r, n  ~or~  LD (HL), n */
	logic ld_hl_n;    /* LD (HL), n */
	logic ld_xx_a;    /* LD (BC/DE), A  ~or~  LD A, (BC/DE) */
	logic ld_hl_a;    /* LD (HLI/HLD), A  ~or~  LD A, (HLI/HLD) */
	logic ld_x_dir;   /* LD (BC/DE), A  ~or~  LD (HLI/HLD), A */
	logic ldx_nn_a;   /* LDX (nn), A  ~or~  LDX A, (nn) */
	logic ld_n_a;     /* LD (n), A  ~or~  LD A, (n) */
	logic ld_c_a;     /* LD (C), A  ~or~  LD A, (C) */
	logic ld_n_dir;   /* LD (n), A  ~or~  LD (C), A  ~or~  LDX (nn), A  (~or~  ADD SP, e) */
	logic ld_dd_nn;   /* LD dd, nn */
	logic ld_sp_hl;   /* LD SP, HL */
	logic ld_nn_sp;   /* LD (nn), SP */
	logic ldhl_sp_e;  /* LDHL SP, e */
	logic push_pop;   /* PUSH/POP qq */
	logic push_qq;    /* PUSH qq */
	logic jp_nn;      /* JP nn */
	logic jp_cc_nn;   /* JP cc, nn */
	logic jp_hl;      /* JP (HL) */
	logic jr_e;       /* JR e */
	logic jr_cc_e;    /* JR cc, e */
	logic call_nn;    /* CALL nn */
	logic call_cc_nn; /* CALL cc, nn */
	logic ret;        /* RET */
	logic reti;       /* RETI */
	logic ret_cc;     /* RET cc */
	logic rst_t;      /* RST t */
	logic nop;        /* NOP */
	logic stop;       /* STOP */
	logic halt;       /* HALT */
	logic di_ei;      /* DI/EI */
	logic prefix_cb;  /* Prefix CB */
	logic rlc_m;      /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL r/(HL) */
	logic swap_m;     /* SWAP r/(HL) */
	logic bit_b_m;    /* BIT b, r/(HL) */
	logic res_b_m;    /* RES b, r/(HL) */
	logic set_b_m;    /* SET b, r/(HL) */
	logic cb_hl;      /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL (HL)  ~or~  BIT/RES/SET b, (HL) */

	localparam int Z = 8;
	localparam int N = 4;
	localparam int H = 2;
	localparam int C = 1;

	localparam int BC = 0;
	localparam int DE = 1;
	localparam int HL = 2;
	localparam int AF = 3;

	localparam bit INC = 0;
	localparam bit DEC = 1;

	localparam int LOW  = 1;
	localparam int HIGH = 2;

	/* Specifies direction of data flow within register file for write_regsp task */
	localparam bit GP2SYS = 0;
	localparam bit SYS2GP = 1;

	/* Opcode bits for selecting general purpose register */
	logic [1:0] op210_gp_reg;
	logic [1:0] op543_gp_reg;
	logic       op210_gp_hi;
	logic       op543_gp_hi;
	logic [1:0] op210_gp_hilo;
	logic [1:0] op543_gp_hilo;

	logic [1:0] reg_sel, new_reg_sel;
	logic       use_sp, new_use_sp;

	logic new_mread, new_mwrite;
	logic new_reg_gp2h_oe, new_reg_gp2l_oe;
	logic new_reg_h2gp_oe, new_reg_l2gp_oe;
	logic new_reg_gp_hi_sel, new_reg_gp_lo_sel;
	logic new_reg_gp_we;
	logic new_reg_sys_hi_sel, new_reg_sys_lo_sel;
	logic new_reg_sys_hi_we, new_reg_sys_lo_we;
	logic new_reg_sp_sel, new_reg_wz_sel, new_reg_pc_sel;
	logic new_reg_gp2sys_oe, new_reg_sys2gp_oe;
	logic new_al_we, new_al_hi_ff;
	logic new_inc_dec, new_inc_cy;
	logic new_inc_oe;
	logic new_db_c2l_oe, new_db_l2c_oe;
	logic new_db_l2h_oe, new_db_h2l_oe;
	logic new_db_c2l_mask543;
	logic new_io_data_oe, new_io_data_we;
	logic new_io_adr_we;
	logic new_zero_data_oe;
	logic new_ir_we;
	logic new_ir_bank_we;
	logic new_ir_bank_cb_set;
	logic new_alu_oe, new_alu_fl_oe, new_alu_daa_oe;
	logic new_alu_sh_oe, new_alu_op_a_oe, new_alu_res_oe, new_alu_bs_oe;
	logic new_alu_op_a_bus, new_alu_op_a_zero;
	logic new_alu_op_b_bus, new_alu_op_b_zero;
	logic new_alu_nc, new_alu_fc, new_alu_ic;
	logic new_alu_neg, new_alu_op_low, new_alu_op_b_high;
	logic new_alu_shift;
	logic new_alu_sel_hc;
	logic new_alu_cond_we;
	logic new_alu_fl_bus, new_alu_fl_alu;
	logic new_alu_fl_zero_we, new_alu_fl_zero_clr;
	logic new_alu_fl_half_we, new_alu_fl_half_set, new_alu_fl_half_cpl;
	logic new_alu_fl_daac_we;
	logic new_alu_fl_neg_we, new_alu_fl_neg_set, new_alu_fl_neg_clr;
	logic new_alu_fl_carry_we, new_alu_fl_carry_set, new_alu_fl_carry_cpl;
	logic new_alu_fl_c2_we, new_alu_fl_c2_sh, new_alu_fl_c2_daa, new_alu_fl_sel_c2;
	logic new_update_int, new_ime_we, new_ime_bit, new_ack_int, new_int_vector_oe;
	logic new_halt_set;

	sm83_sequencer seq(.*);
	sm83_decode    dec(.*);

	assign op210_gp_reg  = opcode[2:1];
	assign op543_gp_reg  = opcode[5:4];
	assign op210_gp_hi   = (op210_gp_reg == AF) ? opcode[0] : !opcode[0];
	assign op543_gp_hi   = (op543_gp_reg == AF) ? opcode[3] : !opcode[3];
	assign op210_gp_hilo = { op210_gp_hi, !op210_gp_hi };
	assign op543_gp_hilo = { op543_gp_hi, !op543_gp_hi };

	/* Select general purpose register */
	assign ctl_reg_bc_sel = reg_sel === BC;
	assign ctl_reg_de_sel = reg_sel === DE;
	assign ctl_reg_hl_sel = reg_sel === HL;
	assign ctl_reg_af_sel = reg_sel === AF && !use_sp;

	/* Trigger read memory cycle */
	task automatic read_mcyc_after(logic cyc);
		if (cyc && t4) new_mread = 1;
	endtask

	/* Trigger write memory cycle */
	task automatic write_mcyc_after(logic cyc);
		if (cyc && t4) new_mwrite = 1;
	endtask

	/* Indicate last memory cycle of instruction */
	task automatic last_mcyc(logic last);
		if (last && t4) set_m1 = 1;
	endtask

	/* Read general purpose register */
	task automatic read_reg(logic [1:0] r);
		new_reg_sel       = r;
		new_reg_gp_lo_sel = 1;
		new_reg_gp_hi_sel = 1;
	endtask

	/* Read general purpose register or SP iff r==AF */
	task automatic read_regsp(logic [1:0] r);
		new_use_sp         = r == AF;
		read_reg(r);
		new_reg_sp_sel     = new_use_sp;
		new_reg_sys2gp_oe  = new_use_sp;
		new_reg_gp2sys_oe  = !new_use_sp;
		new_reg_sys_lo_sel = 1;
		new_reg_sys_hi_sel = 1;
	endtask

	/* Write general purpose register */
	task automatic write_reg(logic [1:0] r, logic [1:0] hilo);
		new_reg_sel       = r;
		new_reg_gp_lo_sel = hilo[0];
		new_reg_gp_hi_sel = hilo[1];
		new_reg_gp_we     = 1;
	endtask

	/* Write general purpose register or to SP iff r==AF */
	task automatic write_regsp(logic [1:0] r, logic [1:0] hilo, logic sys2gp);
		new_use_sp         = r == AF;
		write_reg(r, hilo);
		new_reg_sp_sel     = new_use_sp;
		new_reg_sys2gp_oe  = sys2gp;
		new_reg_gp2sys_oe  = !sys2gp;
		new_reg_sys_lo_sel = hilo[0];
		new_reg_sys_hi_sel = hilo[1];
		new_reg_sys_lo_we  = hilo[0];
		new_reg_sys_hi_we  = hilo[1];
	endtask

	/* Write system register (PC, SP or WZ) */
	task automatic write_sys(logic [1:0] hilo);
		new_reg_sys_lo_sel = hilo[0];
		new_reg_sys_hi_sel = hilo[1];
		new_reg_sys_lo_we  = hilo[0];
		new_reg_sys_hi_we  = hilo[1];
	endtask

	/* Write SP register */
	task automatic write_sp(logic [1:0] hilo);
		new_reg_sp_sel = 1;
		write_sys(hilo);
	endtask

	/* Write WZ register */
	task automatic write_wz(logic [1:0] hilo);
		new_reg_wz_sel = 1;
		write_sys(hilo);
	endtask

	task automatic reg_to_sys(logic [1:0] r);
		read_reg(r);
		new_reg_gp2sys_oe = 1;
	endtask

	/* Increment or decrement address latch */
	task automatic inc_al(logic dec);
		new_inc_cy  = 1;
		new_inc_dec = dec;
		new_inc_oe  = 1;
		new_al_we   = 1;
	endtask

	/* Apply system register to address pins */
	task automatic sys_to_adr;
		new_reg_sys_hi_sel = 1;
		new_reg_sys_lo_sel = 1;
		new_al_we          = 1;
		new_io_adr_we      = 1;
	endtask

	/* Apply PC to address pins */
	task automatic pc_to_adr;
		new_reg_pc_sel = 1;
		sys_to_adr();
	endtask

	/* Apply SP to address pins */
	task automatic sp_to_adr;
		new_reg_sp_sel = 1;
		sys_to_adr();
	endtask

	/* Apply WZ to address pins */
	task automatic wz_to_adr;
		new_reg_wz_sel    = 1;
		new_reg_gp2sys_oe = 1;
		sys_to_adr();
	endtask

	/* Apply general purpose register to address pins */
	task automatic reg_to_adr(logic [1:0] r);
		reg_to_sys(r);
		new_al_we     = 1;
		new_io_adr_we = 1;
	endtask

	/* Write incremented address latch to PC */
	task automatic pc_from_adr_inc;
		inc_al(INC);
		new_reg_pc_sel = 1;
		write_sys(HIGH|LOW);
	endtask

	/* Write incremented or decremented address latch to SP */
	task automatic sp_from_adr_inc(logic dec);
		inc_al(dec);
		new_reg_sp_sel = 1;
		write_sys(HIGH|LOW);
	endtask

	/* Write incremented or decremented address latch to register */
	task automatic reg_from_adr_inc(logic [1:0] r, logic dec);
		inc_al(dec);
		new_reg_sys2gp_oe = 1;
		write_reg(r, HIGH|LOW);
	endtask

	/* Apply general purpose register to internal data bus (dbl and dbh) */
	task automatic reg_to_db(logic [1:0] r, logic [1:0] hilo);
		read_reg(r);
		new_reg_gp2l_oe = hilo[0];
		new_reg_gp2h_oe = hilo[1];
		new_db_l2h_oe   = hilo[0] && !hilo[1];
		new_db_h2l_oe   = !hilo[0] && hilo[1];
	endtask

	/* Apply general purpose register to data latch */
	task automatic reg_to_dl(logic [1:0] r, logic [1:0] hilo);
		reg_to_db(r, hilo);
		new_db_l2c_oe  = 1;
		new_io_data_we = 1;
	endtask

	/* Write general purpose register to ALU operand A */
	task automatic reg_to_alu_op_a(logic [1:0] r, logic [1:0] hilo);
		reg_to_db(r, hilo);
		new_alu_sh_oe    = 1;
		new_alu_op_a_bus = 1;
	endtask

	/* Write general purpose register to ALU operand B */
	task automatic reg_to_alu_op_b(logic [1:0] r, logic [1:0] hilo);
		reg_to_db(r, hilo);
		new_alu_sh_oe    = 1;
		new_alu_op_b_bus = 1;
	endtask

	/* Write general purpose register with value on internal data bus (dbl to low byte and/or dbh to high byte) */
	task automatic reg_from_db(logic [1:0] r, logic [1:0] hilo);
		new_reg_h2gp_oe = 1;
		new_reg_l2gp_oe = 1;
		write_reg(r, hilo);
	endtask

	/* Write general purpose register with value on internal data bus (dbl to low byte and/or high byte) */
	task automatic reg_from_dbl(logic [1:0] r, logic [1:0] hilo);
		new_db_l2h_oe = 1;
		reg_from_db(r, hilo);
	endtask

	/* Write general purpose register with value on internal data bus (dbh to low byte and/or high byte) */
	task automatic reg_from_dbh(logic [1:0] r, logic [1:0] hilo);
		new_db_h2l_oe = 1;
		reg_from_db(r, hilo);
	endtask

	/* Write value from data latch to general purpose register */
	task automatic reg_from_dl(logic [1:0] r, logic [1:0] hilo);
		new_io_data_oe = 1;
		new_db_c2l_oe  = 1;
		reg_from_dbl(r, hilo);
	endtask

	/* Write value from data latch to general purpose register or to SP iff r==AF */
	task automatic regsp_from_dl(logic [1:0] r, logic [1:0] hilo);
		reg_from_dl(r, hilo);
		write_regsp(r, hilo, GP2SYS);
	endtask

	/* Apply system register to internal data bus (dbl and dbh) */
	task automatic sys_to_db(logic [1:0] hilo);
		new_reg_sys_lo_sel = 1;
		new_reg_sys_hi_sel = 1;
		new_reg_sys2gp_oe  = 1;
		new_reg_gp2l_oe    = hilo[0];
		new_reg_gp2h_oe    = hilo[1];
		new_db_l2h_oe      = hilo[0] && !hilo[1];
		new_db_h2l_oe      = !hilo[0] && hilo[1];
	endtask

	/* Apply PC to data latch */
	task automatic pc_to_dl(logic [1:0] hilo);
		new_reg_pc_sel = 1;
		sys_to_db(hilo);
		new_db_l2c_oe  = 1;
		new_io_data_we = 1;
	endtask

	/* Apply SP to data latch */
	task automatic sp_to_dl(logic [1:0] hilo);
		new_reg_sp_sel = 1;
		sys_to_db(hilo);
		new_db_l2c_oe  = 1;
		new_io_data_we = 1;
	endtask

	/* Write PC to ALU operand A */
	task automatic pc_to_alu_op_a(logic [1:0] hilo);
		new_reg_pc_sel   = 1;
		sys_to_db(hilo);
		new_alu_sh_oe    = 1;
		new_alu_op_a_bus = 1;
	endtask

	/* Write SP to ALU operand A */
	task automatic sp_to_alu_op_a(logic [1:0] hilo);
		new_reg_sp_sel   = 1;
		sys_to_db(hilo);
		new_alu_sh_oe    = 1;
		new_alu_op_a_bus = 1;
	endtask

	/* Write ALU result to SP */
	task automatic sp_from_alu(logic [1:0] hilo);
		new_alu_res_oe    = 1;
		new_alu_oe        = 1;
		new_db_h2l_oe     = 1;
		new_reg_h2gp_oe   = 1;
		new_reg_l2gp_oe   = 1;
		new_reg_gp2sys_oe = 1;
		new_reg_sp_sel    = 1;
		write_sys(hilo);
	endtask

	/* Write ALU result to WZ */
	task automatic wz_from_alu(logic [1:0] hilo);
		new_alu_res_oe  = 1;
		new_alu_oe      = 1;
		new_db_h2l_oe   = 1;
		new_reg_l2gp_oe = hilo[0];
		new_reg_h2gp_oe = hilo[1];
		write_wz(hilo);
	endtask

	/* Write value from data latch to WZ */
	task automatic wz_from_dl(logic [1:0] hilo);
		new_io_data_oe  = 1;
		new_db_c2l_oe   = 1;
		new_db_l2h_oe   = 1;
		new_reg_l2gp_oe = hilo[0];
		new_reg_h2gp_oe = hilo[1];
		write_wz(hilo);
	endtask

	/* Write ALU result to general purpose register */
	task automatic reg_from_alu(logic [1:0] r, logic [1:0] hilo);
		new_alu_res_oe = 1;
		new_alu_oe     = 1;
		reg_from_dbh(r, hilo);
	endtask

	/* Write ALU operand A to general purpose register */
	task automatic reg_from_alu_op_a(logic [1:0] r, logic [1:0] hilo);
		new_alu_op_a_oe = 1;
		new_alu_oe      = 1;
		reg_from_dbh(r, hilo);
	endtask

	/* Write selected ALU flags (either from internal data bus or ALU core) */
	task automatic write_alu_flags(logic [3:0] fmask);
		new_alu_fl_zero_we  = fmask[$clog2(Z)];
		new_alu_fl_neg_we   = fmask[$clog2(N)];
		new_alu_fl_half_we  = fmask[$clog2(H)];
		new_alu_fl_carry_we = fmask[$clog2(C)];
	endtask

	/* Update selected ALU flags based on ALU core outputs */
	task automatic update_alu_flags(logic [3:0] fmask);
		new_alu_fl_alu = 1;
		write_alu_flags(fmask);
	endtask

	/* Write AF to ALU operands and selected flags */
	task automatic af_to_alu(logic [3:0] fmask);
		reg_to_alu_op_a(AF, HIGH|LOW);
		reg_to_alu_op_b(AF, HIGH|LOW);
		new_alu_fl_bus = 1;
		write_alu_flags(fmask);
	endtask

	/* Write ALU flags to F */
	task automatic f_from_alu;
		new_alu_fl_oe = 1;
		reg_from_dbl(AF, LOW);
	endtask

	/* Write ALU result into data latch */
	task automatic dl_from_alu;
		new_alu_res_oe = 1;
		new_alu_oe     = 1;
		new_db_h2l_oe  = 1;
		new_db_l2c_oe  = 1;
		new_io_data_we = 1;
	endtask

	/* Write DL to ALU operand A */
	task automatic dl_to_alu_op_a;
		new_io_data_oe   = 1;
		new_db_c2l_oe    = 1;
		new_db_l2h_oe    = 1;
		new_alu_sh_oe    = 1;
		new_alu_op_a_bus = 1;
	endtask

	/* Write DL to ALU operand B */
	task automatic dl_to_alu_op_b;
		new_io_data_oe   = 1;
		new_db_c2l_oe    = 1;
		new_db_l2h_oe    = 1;
		new_alu_sh_oe    = 1;
		new_alu_op_b_bus = 1;
	endtask

	/* Demux 8 bit mask from bits 5:3 of DL into ALU operands */
	task automatic dl_to_alu_bsel;
		new_io_data_oe   = 1;
		new_alu_bs_oe    = 1;
		new_alu_op_a_bus = 1;
		new_alu_op_b_bus = 1;
	endtask

	/* Configure ALU for AND operation */
	task automatic alu_op_and;
		new_alu_fc           = 1;
		new_alu_fl_carry_set = 1;
	endtask

	/* Configure ALU for XOR operation */
	task automatic alu_op_xor;
		new_alu_nc           = 1;
		new_alu_fl_carry_set = 1;
		new_alu_fl_carry_cpl = 1;
	endtask

	/* Configure ALU for OR operation */
	task automatic alu_op_or;
		new_alu_nc           = 1;
		new_alu_fc           = 1;
		new_alu_ic           = 1;
		new_alu_fl_carry_set = 1;
		new_alu_fl_carry_cpl = 1;
	endtask

	always_comb begin
		set_m1 = 0;
		no_pc  = 0;
		no_int = 0;
		no_inc = 0;

		new_in_alu = 0;

		new_reg_sel = 'x;
		new_use_sp  = 0;

		new_mread            = 0;
		new_mwrite           = 0;
		new_reg_gp2h_oe      = 0;
		new_reg_gp2l_oe      = 0;
		new_reg_h2gp_oe      = 0;
		new_reg_l2gp_oe      = 0;
		new_reg_gp_hi_sel    = 0;
		new_reg_gp_lo_sel    = 0;
		new_reg_gp_we        = 0;
		new_reg_sys_hi_sel   = 0;
		new_reg_sys_lo_sel   = 0;
		new_reg_sys_hi_we    = 0;
		new_reg_sys_lo_we    = 0;
		new_reg_sp_sel       = 0;
		new_reg_wz_sel       = 0;
		new_reg_pc_sel       = 0;
		new_reg_gp2sys_oe    = 0;
		new_reg_sys2gp_oe    = 0;
		new_al_we            = 0;
		new_al_hi_ff         = 0;
		new_inc_dec          = 0;
		new_inc_cy           = 0;
		new_inc_oe           = 0;
		new_db_c2l_oe        = 0;
		new_db_l2c_oe        = 0;
		new_db_l2h_oe        = 0;
		new_db_h2l_oe        = 0;
		new_db_c2l_mask543   = 0;
		new_io_data_oe       = 0;
		new_io_data_we       = 0;
		new_io_adr_we        = 0;
		new_zero_data_oe     = 0;
		new_ir_we            = 0;
		new_ir_bank_we       = 0;
		new_ir_bank_cb_set   = 0;
		new_alu_oe           = 0;
		new_alu_fl_oe        = 0;
		new_alu_daa_oe       = 0;
		new_alu_sh_oe        = 0;
		new_alu_op_a_oe      = 0;
		new_alu_res_oe       = 0;
		new_alu_bs_oe        = 0;
		new_alu_op_a_bus     = 0;
		new_alu_op_a_zero    = 0;
		new_alu_op_b_bus     = 0;
		new_alu_op_b_zero    = 0;
		new_alu_nc           = 0;
		new_alu_fc           = 0;
		new_alu_ic           = 0;
		new_alu_neg          = 0;
		new_alu_op_low       = 0;
		new_alu_op_b_high    = 0;
		new_alu_shift        = 0;
		new_alu_sel_hc       = 0;
		new_alu_cond_we      = 0;
		new_alu_fl_bus       = 0;
		new_alu_fl_alu       = 0;
		new_alu_fl_zero_we   = 0;
		new_alu_fl_zero_clr  = 0;
		new_alu_fl_half_we   = 0;
		new_alu_fl_half_set  = 0;
		new_alu_fl_half_cpl  = 0;
		new_alu_fl_daac_we   = 0;
		new_alu_fl_neg_we    = 0;
		new_alu_fl_neg_set   = 0;
		new_alu_fl_neg_clr   = 0;
		new_alu_fl_carry_we  = 0;
		new_alu_fl_carry_set = 0;
		new_alu_fl_carry_cpl = 0;
		new_alu_fl_c2_we     = 0;
		new_alu_fl_c2_sh     = 0;
		new_alu_fl_c2_daa    = 0;
		new_alu_fl_sel_c2    = 0;
		new_update_int       = 0;
		new_ime_we           = 0;
		new_ime_bit          = 0;
		new_ack_int          = 0;
		new_int_vector_oe    = 0;
		new_halt_set         = 0;

		if (clk_ena) unique0 case (1)
			/* NOP -- No operation */
			nop:
				last_mcyc(m1);

			/* LD r, n -- Load register r with immediate value n */
			ld_r_n && !ld_hl_n: begin
				read_mcyc_after(m1); /* Read immediate value n during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					/* Write fetched immediate from data latch into register selected by opcode[5:3] */
					m2 && t4: reg_from_dl(op543_gp_reg, op543_gp_hilo);
				endcase
			end

			/* LD r, r' -- Load register r with value from register r' */
			ld_r_r && !ld_r_hl && !ld_hl_r: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register selected by opcode[2:0] into ALU operand A */
					m1 && t4: reg_to_alu_op_a(op210_gp_reg, op210_gp_hilo);

					/* Write ALU operand A into register selected by opcode[5:3] */
					m1 && t2: reg_from_alu_op_a(op543_gp_reg, op543_gp_hilo);
				endcase
			end

			/* LD r, (HL) -- Load register r with value stored at address in HL */
			ld_r_hl && !halt: begin
				read_mcyc_after(m1); /* Read value stored at address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Write fetched value from data latch into register selected by opcode[5:3] */
					m2 && t4: reg_from_dl(op543_gp_reg, op543_gp_hilo);
				endcase
			end

			/* LD (HL), r -- Load register r to address in HL */
			ld_hl_r && !halt: begin
				write_mcyc_after(m1); /* Write to address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for write cycle */
					m1 && t4: reg_to_adr(HL);

					/* Read register selected by opcode[2:0] into data latch */
					m2 && t1: reg_to_dl(op210_gp_reg, op210_gp_hilo);
				endcase
			end

			/* LD (HL), n -- Load immediate value n to address in HL */
			ld_hl_n: begin
				read_mcyc_after(m1);  /* Read immediate value n during M2 */
				write_mcyc_after(m2); /* Write to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					/* Apply HL to address pins for write cycle */
					m2 && t4: reg_to_adr(HL);
				endcase
			end

			/* LD (BC), A -- Load A to address in BC */
			/* LD (DE), A -- Load A to address in DE */
			ld_xx_a && ld_x_dir: begin
				write_mcyc_after(m1); /* Write to address in BC/DE during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply BC/DE to address pins for write cycle */
					m1 && t4: reg_to_adr(opcode[5:4]);

					/* Write A into data latch */
					m2 && t1: reg_to_dl(AF, HIGH);
				endcase
			end

			/* LD A, (BC) -- Load A with value stored at address in BC */
			/* LD A, (DE) -- Load A with value stored at address in DE */
			ld_xx_a && !ld_x_dir: begin
				read_mcyc_after(m1); /* Read value stored at address in BC/DE during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply BC/DE to address pins for read cycle */
					m1 && t4: reg_to_adr(opcode[5:4]);

					/* Write fetched value from data latch into A */
					m2 && t4: reg_from_dl(AF, HIGH);
				endcase
			end

			/* LD (HLI), A -- Load A to address in HL and post-increment HL */
			/* LD (HLD), A -- Load A to address in HL and post-decrement HL */
			ld_hl_a && ld_x_dir: begin
				write_mcyc_after(m1); /* Write to address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for write cycle */
					m1 && t4: reg_to_adr(HL);

					/* Write A into data latch */
					m2 && t1: reg_to_dl(AF, HIGH);

					/* Increment or decrement HL */
					m2 && t3: reg_from_adr_inc(HL, opcode[4]);
				endcase
			end

			/* LD A, (HLI) -- Load A with value stored at address in HL and post-increment HL */
			/* LD A, (HLD) -- Load A with value stored at address in HL and post-decrement HL */
			ld_hl_a && !ld_x_dir: begin
				read_mcyc_after(m1); /* Read value stored at address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Increment or decrement HL */
					m2 && t3: reg_from_adr_inc(HL, opcode[4]);

					/* Write fetched value from data latch into A */
					m2 && t4: reg_from_dl(AF, HIGH);
				endcase
			end

			/* LDX (nn), A -- Load A to immediate address nn */
			/* LDX A, (nn) -- Load A with value stored at immediate address nn */
			ldx_nn_a: begin
				read_mcyc_after(m1);              /* Read immediate address nn low byte during M2 */
				read_mcyc_after(m2);              /* Read immediate address nn high byte during M3 */
				write_mcyc_after(m3 && ld_n_dir); /* Write to immediate address nn during M4 */
				read_mcyc_after(m3 && !ld_n_dir); /* Read value stored at immediate address nn during M4 */
				last_mcyc(m4);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment PC */
					m3 && t3: pc_from_adr_inc;

					m3 && t4: begin
						/* Write immediate fetched during M3 from data latch into W */
						wz_from_dl(HIGH);

						/* Apply WZ to address pins for write or read cycle */
						wz_to_adr;
					end

					m4 && t1: if (ld_n_dir) begin /* LDX (nn), A */
						/* Write A into data latch */
						reg_to_dl(AF, HIGH);
					end

					m4 && t4: if (!ld_n_dir) begin /* LDX A, (nn) */
						/* Write value from data latch into A */
						reg_from_dl(AF, HIGH);
					end
				endcase
			end

			/* LD (n), A -- Load A to immediate address $ff00+n */
			/* LD A, (n) -- Load A with value stored at immediate address $ff00+n */
			ld_n_a: begin
				read_mcyc_after(m1);              /* Read immediate address low byte n during M2 */
				write_mcyc_after(m2 && ld_n_dir); /* Write to address $ff00+n during M3 */
				read_mcyc_after(m2 && !ld_n_dir); /* Read value stored at address $ff00+n during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into Z */
						wz_from_dl(LOW);

						/* Apply $ff00+Z to address pins for write or read cycle */
						new_al_hi_ff = 1;
						wz_to_adr;
					end

					m3 && t1: if (ld_n_dir) begin /* LD (n), A */
						/* Write A into data latch */
						reg_to_dl(AF, HIGH);
					end

					m3 && t4: if (!ld_n_dir) begin /* LD A, (n) */
						/* Write value from data latch into A */
						reg_from_dl(AF, HIGH);
					end
				endcase
			end

			/* LD (C), A -- Load A to address $ff00+C */
			/* LD A, (C) -- Load A with value stored at address $ff00+C */
			ld_c_a: begin
				write_mcyc_after(m1 && ld_n_dir); /* Write to address $ff00+C during M2 */
				read_mcyc_after(m1 && !ld_n_dir); /* Read value stored at address $ff00+C during M2 */
				last_mcyc(m2);

				unique0 case (1)
					m1 && t4: begin
						/* Write C into Z */
						read_reg(BC);
						write_wz(HIGH|LOW);

						/* Apply $ff00+Z to address pins for write or read cycle */
						new_al_hi_ff = 1;
						wz_to_adr;
					end

					m2 && t1: if (ld_n_dir) begin /* LD (C), A */
						/* Write A into data latch */
						reg_to_dl(AF, HIGH);
					end

					m2 && t4: if (!ld_n_dir) begin /* LD A, (C) */
						/* Write value from data latch into A */
						reg_from_dl(AF, HIGH);
					end
				endcase
			end

			/* LD dd, nn -- Load register dd with immediate value nn */
			ld_dd_nn: begin
				read_mcyc_after(m1); /* Read immediate value nn low byte during M2 */
				read_mcyc_after(m2); /* Read immediate value nn high byte during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					/* Apply address latch to address pins for read cycle */
					m2 && t4: new_io_adr_we = 1;

					/* Write immediate fetched during M2 from data latch into low byte register */
					m3 && t1: regsp_from_dl(opcode[5:4], LOW);

					/* Increment PC */
					m3 && t3: pc_from_adr_inc;

					/* Write immediate fetched during M3 from data latch into high byte register */
					m1 && t1: regsp_from_dl(opcode[5:4], HIGH);
				endcase
			end

			/* LD SP, HL -- Load SP with value from HL */
			ld_sp_hl: begin
				last_mcyc(m2);

				unique0 case (1)
					m2 && t2: begin
						/* Write HL into SP */
						reg_to_sys(HL);
						write_sp(HIGH|LOW);
					end
				endcase
			end

			/* LD (nn), SP -- Load SP to immediate address nn */
			ld_nn_sp: begin
				read_mcyc_after(m1);  /* Read immediate address nn low byte during M2 */
				read_mcyc_after(m2);  /* Read immediate address nn high byte during M3 */
				write_mcyc_after(m3); /* Write low byte of SP to immediate address nn during M4 */
				write_mcyc_after(m4); /* Write high byte of SP to immediate address nn+1 during M5 */
				last_mcyc(m5);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment PC */
					m3 && t3: pc_from_adr_inc;

					m3 && t4: begin
						/* Write immediate fetched during M3 from data latch into W */
						wz_from_dl(HIGH);

						/* Apply WZ to address pins for write cycle */
						wz_to_adr;
					end

					/* Write low byte of SP into data latch */
					m4 && t1: sp_to_dl(LOW);

					/* Increment address latch */
					m4 && t2: inc_al(INC);

					/* Apply address latch to address pins for write cycle */
					m4 && t4: new_io_adr_we = 1;

					/* Write high byte of SP into data latch */
					m5 && t1: sp_to_dl(HIGH);
				endcase
			end

			/* LDHL SP, e -- Load HL with the sum of SP and the signed immediate value e */
			ldhl_sp_e: begin
				read_mcyc_after(m1); /* Read signed immediate value e during M2 */
				last_mcyc(m3);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags and clear zero flag */
						new_alu_fl_zero_clr = 1;
						af_to_alu(Z|N|H|C);

						/* Apply PC to address pins for read cycle */
						pc_to_adr;
					end

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Update ALU subtract flag (N) with sign bit from ALU core */
						update_alu_flags(0|N|0|0);
					end

					m3 && t1: begin
						/* Write low byte of SP into ALU operand A */
						sp_to_alu_op_a(LOW);

						/* No carry-in */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = 1;

						/* Caclulate low nibble of low byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m3 && t2: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble of low byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|0|C);

						/* Write ALU result into L */
						reg_from_alu(HL, LOW);
					end

					m1 && t1: begin
						/* Write high byte of SP into ALU operand A */
						sp_to_alu_op_a(HIGH);

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_op_b_zero = 1;
						new_alu_neg       = alu_fl_neg;

						/* Caclulate low nibble of high byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags (keep H and C from low byte calculation and use secondary carry now) */
						update_alu_flags(0|0|0|0);
						new_alu_fl_c2_we = 1;
					end

					m1 && t2: begin
						/* Select secondary carry for high byte calculation */
						new_alu_fl_sel_c2 = 1;

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_neg = alu_fl_neg;

						/* Caclulate high nibble of high byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|0|0);

						/* Write ALU result into H */
						reg_from_alu(HL, HIGH);
					end

					/* Write ALU flags into register F */
					m1 && t3: f_from_alu;
				endcase
			end

			/* PUSH qq -- Decrements SP, then loads register qq to address in SP */
			push_pop && push_qq: begin
				write_mcyc_after(m2); /* Write high byte to address in SP-1 during M3 */
				write_mcyc_after(m3); /* Write low byte to address in SP-2 during M4 */
				last_mcyc(m4);

				unique0 case (1)
					/* Apply SP to address pins for decrement */
					m1 && t4: sp_to_adr;

					/* Decrement SP */
					m2 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m2 && t4: new_io_adr_we = 1;

					/* Read high byte register into data latch */
					m3 && t1: reg_to_dl(opcode[5:4], HIGH);

					/* Decrement SP */
					m3 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m3 && t4: new_io_adr_we = 1;

					/* Read low byte register into data latch */
					m4 && t1: reg_to_dl(opcode[5:4], LOW);
				endcase
			end

			/* POP qq -- Loads register qq with value stored at address in SP, then increments SP */
			push_pop && !push_qq: begin
				read_mcyc_after(m1); /* Read value stored at address in SP during M2 */
				read_mcyc_after(m2); /* Read value stored at address in SP+1 during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply SP to address pins for read cycle */
					m1 && t4: sp_to_adr;

					/* Increment SP */
					m2 && t3: sp_from_adr_inc(INC);

					m2 && t4: begin
						/* Write value from data latch that was fetched during M2 into low byte register */
						reg_from_dl(opcode[5:4], LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment SP */
					m3 && t3: sp_from_adr_inc(INC);

					/* Write value from data latch that was fetched during M3 into high byte register */
					m3 && t4: reg_from_dl(opcode[5:4], HIGH);
				endcase
			end

			/* ADD A, r -- Add register r to A */
			/* ADC A, r -- Add register r and carry flag to A */
			/* SUB A, r -- Subtract register r from A */
			/* SBC A, r -- Subtract register r and carry flag from A */
			/* AND r    -- Perform bitwise AND operation on A and register r and store result in A */
			/* XOR r    -- Perform bitwise exclusive-OR operation on A and register r and store result in A */
			/* OR r     -- Perform bitwise OR operation on A and register r and store result in A */
			/* CP r     -- Subtract register r from A without writing the result into A */
			add_r && !add_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register A into ALU operand A and register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operand B */
						reg_to_alu_op_b(op210_gp_reg, op210_gp_hilo);

						/* Caclulate low nibble in ALU */
						new_in_alu     = 1;
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|H|0);
					end

					m1 && t2: begin
						/* Caclulate high nibble in ALU */
						new_in_alu        = 1;
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|0|C);

						/* Write ALU result into A (write is disabled for CP instruction in ALU control block below) */
						reg_from_alu(AF, HIGH);
					end

					m1 && t3: begin
						/* Complement carry flags for SUB, SBC and CP */
						new_alu_fl_carry_cpl = alu_fl_neg;
						new_alu_fl_half_cpl  = alu_fl_neg;

						/* Write ALU flags into register F */
						new_in_alu = 1;
						f_from_alu;
					end
				endcase
			end

			/* ADD A, n -- Add immediate value to A */
			/* ADC A, n -- Add immediate value and carry flag to A */
			/* SUB A, n -- Subtract immediate value from A */
			/* SBC A, n -- Subtract immediate value and carry flag from A */
			/* AND n    -- Perform bitwise AND operation on A and immediate value and store result in A */
			/* XOR n    -- Perform bitwise exclusive-OR operation on A and immediate value and store result in A */
			/* OR n     -- Perform bitwise OR operation on A and immediate value and store result in A */
			/* CP n     -- Subtract immediate value from A without writing the result into A */
			add_n: begin
				read_mcyc_after(m1); /* Read immediate value n during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply PC to address pins for read cycle */
					m1 && t4: pc_to_adr;

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					/* Read register A into ALU operand A and register F into ALU flags */
					m2 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Write data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Caclulate low nibble in ALU */
						new_in_alu     = 1;
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|H|0);
					end

					m1 && t2: begin
						/* Caclulate high nibble in ALU */
						new_in_alu        = 1;
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|0|C);

						/* Write ALU result into A (write is disabled for CP instruction in ALU control block below) */
						reg_from_alu(AF, HIGH);
					end

					m1 && t3: begin
						/* Complement carry flags for SUB, SBC and CP */
						new_alu_fl_carry_cpl = alu_fl_neg;
						new_alu_fl_half_cpl  = alu_fl_neg;

						/* Write ALU flags into register F */
						new_in_alu = 1;
						f_from_alu;
					end
				endcase
			end

			/* ADD A, (HL) -- Add value stored at address in HL to A */
			/* ADC A, (HL) -- Add value stored at address in HL and carry flag to A */
			/* SUB A, (HL) -- Subtract value stored at address in HL from A */
			/* SBC A, (HL) -- Subtract value stored at address in HL and carry flag from A */
			/* AND (HL)    -- Perform bitwise AND operation on A and value stored at address in HL and store result in A */
			/* XOR (HL)    -- Perform bitwise exclusive-OR operation on A and value stored at address in HL and store result in A */
			/* OR (HL)     -- Perform bitwise OR operation on A and value stored at address in HL and store result in A */
			/* CP (HL)     -- Subtract value stored at address in HL from A without writing the result into A */
			add_hl: begin
				read_mcyc_after(m1); /* Read value stored at address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Read register A into ALU operand A and register F into ALU flags */
					m2 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Write data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Caclulate low nibble in ALU */
						new_in_alu     = 1;
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|H|0);
					end

					m1 && t2: begin
						/* Caclulate high nibble in ALU */
						new_in_alu        = 1;
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|0|C);

						/* Write ALU result into A (write is disabled for CP instruction in ALU control block below) */
						reg_from_alu(AF, HIGH);
					end

					m1 && t3: begin
						/* Complement carry flags for SUB, SBC and CP */
						new_alu_fl_carry_cpl = alu_fl_neg;
						new_alu_fl_half_cpl  = alu_fl_neg;

						/* Write ALU flags into register F */
						new_in_alu = 1;
						f_from_alu;
					end
				endcase
			end

			/* INC r -- Increment register r */
			/* DEC r -- Decrement register r */
			inc_m && !inc_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Read register selected by opcode[5:3] into ALU operand A */
						reg_to_alu_op_a(op543_gp_reg, op543_gp_hilo);

						/* Zero ALU operand B */
						new_alu_op_b_zero = 1;

						/* Set carry for increment/decrement */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = dec_m;

						/* Complement ALU operand B for decrement */
						new_alu_neg = dec_m;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
						new_alu_fl_c2_we   = 1;
					end

					m1 && t2: begin
						/* Select secondary carry for high nibble calculation */
						new_alu_fl_sel_c2 = 1; // TODO: why?

						/* Clear carry output for high nibble decrement */
						new_alu_fl_carry_set = dec_m; // TODO: why?
						new_alu_fl_carry_cpl = dec_m; // TODO: why?

						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Complement ALU operand B for decrement */
						new_alu_neg = dec_m;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_set = dec_m;
						update_alu_flags(Z|0|0|0);
						new_alu_fl_neg_we  = dec_m;

						/* Write ALU result into register selected by opcode[5:3] */
						reg_from_alu(op543_gp_reg, op543_gp_hilo);
					end

					m1 && t3: begin
						/* Complement half carry flag after decrement */
						new_alu_fl_half_cpl = alu_fl_neg;

						/* Write ALU flags into register F */
						f_from_alu;
					end
				endcase
			end

			/* INC (HL) -- Increment value stored at address in HL */
			/* DEC (HL) -- Decrement value stored at address in HL */
			inc_hl: begin
				read_mcyc_after(m1);  /* Read value stored at address in HL during M2 */
				write_mcyc_after(m2); /* Write incremented value to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Read register F into ALU flags */
					m2 && t3: af_to_alu(Z|N|H|C);

					m2 && t4: begin
						/* Write data latch into ALU operand A */
						dl_to_alu_op_a;

						/* Zero ALU operand B */
						new_alu_op_b_zero = 1;

						/* Set carry for increment/decrement */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = dec_m;

						/* Complement ALU operand B for decrement */
						new_alu_neg = dec_m;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
						new_alu_fl_c2_we   = 1;

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					m3 && t1: begin
						/* Select secondary carry for high nibble calculation */
						new_alu_fl_sel_c2 = 1; // TODO: why?

						/* Clear carry output for high nibble decrement */
						new_alu_fl_carry_set = dec_m; // TODO: why?
						new_alu_fl_carry_cpl = dec_m; // TODO: why?

						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Complement ALU operand B for decrement */
						new_alu_neg = dec_m;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_set = dec_m;
						update_alu_flags(Z|0|0|0);
						new_alu_fl_neg_we  = dec_m;

						/* Write ALU result into data latch */
						dl_from_alu;
					end

					m3 && t3: begin
						/* Complement half carry flag after decrement */
						new_alu_fl_half_cpl = alu_fl_neg;

						/* Write ALU flags into register F */
						f_from_alu;
					end
				endcase
			end

			/* CPL -- Complement A */
			cpl: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register A into ALU operand B and register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Zero ALU operand A */
						new_alu_op_a_zero = 1;

						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_set = 1;
						update_alu_flags(0|N|H|0);
					end

					m1 && t2: begin
						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_set = 1;
						update_alu_flags(0|N|0|0);

						/* Write ALU result into register A */
						reg_from_alu(AF, HIGH);
					end

					m1 && t3: begin
						/* Complement half carry flag */
						new_alu_fl_half_cpl = alu_fl_neg;

						/* Write ALU flags into register F */
						f_from_alu;
					end
				endcase
			end

			/* DAA -- Decimal adjust A */
			daa: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t4: begin
						/* Read register A into ALU operand A and register F into ALU flags (use DAA half carry) */
						af_to_alu(Z|N|0|C);
						new_alu_fl_daac_we = 1;
					end

					m1 && t1: begin
						/* Apply DAA correction to ALU operand B */
						new_alu_daa_oe   = 1;
						new_db_l2h_oe    = 1;
						new_alu_sh_oe    = 1;
						new_alu_op_b_bus = 1;

						/* Conditionally complement ALU operand B based on subtract flag (N) */
						new_alu_neg = alu_fl_neg;

						/* Set carry flag for low byte calculation based on subtract flag (N) */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = !alu_fl_neg;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|H|0);
						new_alu_fl_c2_daa = 1;
						new_alu_fl_c2_we  = 1;
					end

					m1 && t2: begin
						/* Conditionally complement ALU operand B based on subtract flag (N) */
						new_alu_neg = alu_fl_neg;

						new_alu_fl_carry_cpl = !alu_fl_neg; // TODO: why?

						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(Z|0|0|C);

						/* Write ALU result into register A */
						reg_from_alu(AF, HIGH);
					end

					m1 && t3: begin
						/* Clear half carry flag */
						new_alu_fl_half_set = 1; // TODO: find other way to clear H flag; this is the only instruction that needs this signal
						new_alu_fl_half_cpl = 1;

						/* Select secondary carry */
						new_alu_fl_sel_c2 = 1;

						/* Write ALU flags into register F */
						f_from_alu;
					end
				endcase
			end

			/* ADD HL, ss -- Add register ss to HL */
			add_hl_ss: begin
				last_mcyc(m2);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags and clear subtract (N) flag */
						new_alu_fl_neg_clr = 1;
						af_to_alu(Z|N|H|C);
					end

					/* Write low byte of HL into ALU operand A */
					m2 && t1: reg_to_alu_op_a(HL, LOW);

					m2 && t2: begin
						/* Write low byte of register ss into ALU operand B */
						read_regsp(opcode[5:4]);
						reg_to_db(opcode[5:4], LOW);
						new_alu_sh_oe    = 1;
						new_alu_op_b_bus = 1;

						/* No carry-in */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = 1;

						/* Caclulate low nibble of low byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m2 && t3: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble of low byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|0|C);

						/* Write ALU result into low byte of HL */
						reg_from_alu(HL, LOW);
					end

					/* Write high byte of HL into ALU operand A */
					m2 && t4: reg_to_alu_op_a(HL, HIGH);

					m1 && t1: begin
						/* Write high byte of register ss into ALU operand B */
						read_regsp(opcode[5:4]);
						reg_to_db(opcode[5:4], HIGH);
						new_alu_sh_oe    = 1;
						new_alu_op_b_bus = 1;

						/* Caclulate low nibble of high byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m1 && t2: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble of high byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|0|C);

						/* Write ALU result into high byte of HL */
						reg_from_alu(HL, HIGH);
					end

					/* Write ALU flags into register F */
					m1 && t3: f_from_alu;
				endcase
			end

			/* ADD SP, e -- Add signed immediate value e to SP */
			add_sp_e: begin
				read_mcyc_after(m1); /* Read signed immediate value e during M2 */
				last_mcyc(m4);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags and clear zero flag */
						new_alu_fl_zero_clr = 1;
						af_to_alu(Z|N|H|C);

						/* Apply PC to address pins for read cycle */
						pc_to_adr;
					end

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Update ALU subtract flag (N) with sign bit from ALU core */
						update_alu_flags(0|N|0|0);
					end

					m3 && t1: begin
						/* Write low byte of SP into ALU operand A */
						sp_to_alu_op_a(LOW);

						/* No carry-in */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = 1;

						/* Caclulate low nibble of low byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m3 && t2: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble of low byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|0|C);

						/* Write ALU result into low byte of SP */
						sp_from_alu(LOW);
					end

					m4 && t1: begin
						/* Write high byte of SP into ALU operand A */
						sp_to_alu_op_a(HIGH);

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_op_b_zero = 1;
						new_alu_neg       = alu_fl_neg;

						/* Caclulate low nibble of high byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags (keep H and C from low byte calculation and use secondary carry now) */
						update_alu_flags(0|0|0|0);
						new_alu_fl_c2_we = 1;
					end

					m4 && t2: begin
						/* Select secondary carry for high byte calculation */
						new_alu_fl_sel_c2 = 1;

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_neg = alu_fl_neg;

						/* Caclulate high nibble of high byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|0|0);

						/* Write ALU result into high byte of SP */
						sp_from_alu(HIGH);
					end

					/* Write ALU flags into register F */
					m4 && t3: f_from_alu;
				endcase
			end

			/* INC ss -- Increment register ss */
			/* DEC ss -- Decrement register ss */
			inc_ss: begin
				last_mcyc(m2);

				unique0 case (1)
					m1 && t4: begin
						/* Read register into address latch */
						read_regsp(opcode[5:4]);
						new_al_we = 1;
					end

					m2 && t2: begin
						/* Write incremented or decremented value back into register */
						inc_al(opcode[3]);
						write_regsp(opcode[5:4], HIGH|LOW, SYS2GP);
					end
				endcase
			end

			/* RLC r -- Rotate register r left circular */
			/* RRC r -- Rotate register r right circular */
			/* RL r  -- Rotate register r left through carry */
			/* RR r  -- Rotate register r right through carry */
			/* SLA r -- Shift register r left arithmetic */
			/* SRA r -- Shift register r right arithmetic */
			/* SRL r -- Shift register r right logical */
			rxxa, rlc_m && !swap_m && !cb_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operands with shift */
						reg_to_alu_op_a(op210_gp_reg, op210_gp_hilo);
						reg_to_alu_op_b(op210_gp_reg, op210_gp_hilo);
						new_alu_shift = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);
						new_alu_fl_c2_sh   = 1;
						new_alu_fl_c2_we   = 1;
					end

					m1 && t2: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_zero_clr = rxxa;
						new_alu_fl_neg_clr  = 1;
						update_alu_flags(Z|N|H|C);

						/* Write ALU result into register selected by opcode[2:0] */
						reg_from_alu(op210_gp_reg, op210_gp_hilo);
					end

					m1 && t3: begin
						/* Write ALU flags into register F */
						new_alu_fl_sel_c2 = 1;
						f_from_alu;
					end
				endcase
			end

			/* RLC (HL) -- Rotate value at address in HL left circular */
			/* RRC (HL) -- Rotate value at address in HL right circular */
			/* RL (HL)  -- Rotate value at address in HL left through carry */
			/* RR (HL)  -- Rotate value at address in HL right through carry */
			/* SLA (HL) -- Shift value at address in HL left arithmetic */
			/* SRA (HL) -- Shift value at address in HL right arithmetic */
			/* SRL (HL) -- Shift value at address in HL right logical */
			rlc_m && !swap_m && cb_hl: begin
				read_mcyc_after(m1);  /* Read value from address in HL during M2 */
				write_mcyc_after(m2); /* Write value to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Read register F into ALU flags */
					m2 && t3: af_to_alu(Z|N|H|C);

					m2 && t4: begin
						/* Write data latch into ALU operands with shift */
						dl_to_alu_op_a;
						dl_to_alu_op_b;
						new_alu_shift = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);
						new_alu_fl_c2_sh   = 1;
						new_alu_fl_c2_we   = 1;

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					m3 && t1: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|C);

						/* Write ALU result into data latch */
						dl_from_alu;
					end

					m3 && t3: begin
						/* Write ALU flags into register F */
						new_alu_fl_sel_c2 = 1;
						f_from_alu;
					end
				endcase
			end

			/* SWAP r -- Swap nibbles of register r */
			swap_m && !cb_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operand B */
						reg_to_alu_op_b(op210_gp_reg, op210_gp_hilo);

						/* Zero ALU operand A */
						new_alu_op_a_zero = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low    = 1;
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);
					end

					m1 && t2: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|C);

						/* Write ALU result into register selected by opcode[2:0] */
						reg_from_alu(op210_gp_reg, op210_gp_hilo);
					end

					/* Write ALU flags into register F */
					m1 && t3: f_from_alu;
				endcase
			end

			/* SWAP (HL) -- Swap nibbles of value at address in HL */
			swap_m && cb_hl: begin
				read_mcyc_after(m1);  /* Read value from address in HL during M2 */
				write_mcyc_after(m2); /* Write value to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					/* Read register F into ALU flags */
					m2 && t3: af_to_alu(Z|N|H|C);

					m2 && t4: begin
						/* Write data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Zero ALU operand A */
						new_alu_op_a_zero = 1;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low    = 1;
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					m3 && t1: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|C);

						/* Write ALU result into data latch */
						dl_from_alu;
					end

					/* Write ALU flags into register F */
					m3 && t3: f_from_alu;
				endcase
			end

			/* BIT b, r -- Test bit b of register r */
			bit_b_m && !cb_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operand A */
						reg_to_alu_op_a(op210_gp_reg, op210_gp_hilo);

						/* Configure ALU for AND operation */
						alu_op_and;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
					end

					m1 && t2: begin
						/* Configure ALU for AND operation */
						alu_op_and;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;
						new_alu_res_oe    = 1;
						new_alu_oe        = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
					end

					/* Write ALU flags into register F */
					m1 && t3: f_from_alu;
				endcase
			end

			/* BIT b, (HL) -- Test bit b of value at address in HL */
			bit_b_m && cb_hl: begin
				read_mcyc_after(m1); /* Read value from address in HL during M2 */
				last_mcyc(m2);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					m2 && t3: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m2 && t4: begin
						/* Write data latch into ALU operand A */
						dl_to_alu_op_a;

						/* Configure ALU for AND operation */
						alu_op_and;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
					end

					m1 && t1: begin
						/* Configure ALU for AND operation */
						alu_op_and;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;
						new_alu_res_oe    = 1;
						new_alu_oe        = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(Z|N|H|0);
					end

					/* Write ALU flags into register F */
					m1 && t3: f_from_alu;
				endcase
			end

			/* RES b, r -- Reset bit b of register r */
			res_b_m && !cb_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operand A */
						reg_to_alu_op_a(op210_gp_reg, op210_gp_hilo);

						/* Configure ALU for AND operation */
						alu_op_and;

						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;
					end

					m1 && t2: begin
						/* Configure ALU for AND operation */
						alu_op_and;

						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Write ALU result into register selected by opcode[2:0] */
						reg_from_alu(op210_gp_reg, op210_gp_hilo);
					end
				endcase
			end

			/* RES b, (HL) -- Reset bit b of value at address in HL */
			res_b_m && cb_hl: begin
				read_mcyc_after(m1);  /* Read value from address in HL during M2 */
				write_mcyc_after(m2); /* Write value to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					m2 && t3: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m2 && t4: begin
						/* Write data latch into ALU operand A */
						dl_to_alu_op_a;

						/* Configure ALU for AND operation */
						alu_op_and;

						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					m3 && t1: begin
						/* Configure ALU for AND operation */
						alu_op_and;

						/* Complement ALU operand B */
						new_alu_neg = 1;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Write ALU result into data latch */
						dl_from_alu;
					end
				endcase
			end

			/* SET b, r -- Set bit b of register r */
			set_b_m && !cb_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m1 && t1: begin
						/* Read register selected by opcode[2:0] into ALU operand A */
						reg_to_alu_op_a(op210_gp_reg, op210_gp_hilo);

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;
					end

					m1 && t2: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Write ALU result into register selected by opcode[2:0] */
						reg_from_alu(op210_gp_reg, op210_gp_hilo);
					end
				endcase
			end

			/* SET b, (HL) -- Set bit b of value at address in HL */
			set_b_m && cb_hl: begin
				read_mcyc_after(m1);  /* Read value from address in HL during M2 */
				write_mcyc_after(m2); /* Write value to address in HL during M3 */
				last_mcyc(m3);

				unique0 case (1)
					/* Apply HL to address pins for read cycle */
					m1 && t4: reg_to_adr(HL);

					m2 && t3: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);
						new_alu_sh_oe = 0;

						/* Read bit number from data latch into ALU operands as bit mask */
						dl_to_alu_bsel;
					end

					m2 && t4: begin
						/* Write data latch into ALU operand A */
						dl_to_alu_op_a;

						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					m3 && t1: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;

						/* Write ALU result into data latch */
						dl_from_alu;
					end
				endcase
			end

			/* JP nn     -- Jump to immediate address nn */
			/* JP cc, nn -- Jump to immediate address nn if condition cc is met */
			jp_nn, jp_cc_nn: begin
				read_mcyc_after(m1); /* Read immediate address nn low byte during M2 */
				read_mcyc_after(m2); /* Read immediate address nn high byte during M3 */
				last_mcyc(m3 && !alu_cond_result && jp_cc_nn);
				last_mcyc(m4);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);

						/* Apply PC to address pins for read cycle */
						pc_to_adr;
					end

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment PC */
					m3 && t3: pc_from_adr_inc;

					m3 && t4: begin
						/* Write immediate fetched during M3 from data latch into W */
						wz_from_dl(HIGH);
						no_pc = 1;
					end

					m4 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* JR e     -- Jump to immediate relative address e */
			/* JR cc, e -- Jump to immediate relative address e if condition cc is met */
			jr_e, jr_cc_e: begin
				read_mcyc_after(m1); /* Read immediate relative address e during M2 */
				last_mcyc(m2 && !alu_cond_result && jr_cc_e);
				last_mcyc(m3);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);

						/* Apply PC to address pins for read cycle */
						pc_to_adr;
					end

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into ALU operand B */
						dl_to_alu_op_b;

						/* Update ALU subtract flag (N) with sign bit from ALU core */
						update_alu_flags(0|N|0|0);
					end

					m3 && t1: begin
						/* Write low byte of PC into ALU operand A */
						pc_to_alu_op_a(LOW);

						/* No carry-in */
						new_alu_fl_carry_set = 1;
						new_alu_fl_carry_cpl = 1;

						/* Caclulate low nibble of low byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m3 && t2: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Caclulate high nibble of low byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|0|C);

						/* Write ALU result into Z */
						wz_from_alu(LOW);
					end

					m3 && t3: begin
						/* Write high byte of PC into ALU operand A */
						pc_to_alu_op_a(HIGH);

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_op_b_zero = 1;
						new_alu_neg       = alu_fl_neg;

						/* Caclulate low nibble of high byte in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						update_alu_flags(0|0|H|0);
					end

					m3 && t4: begin
						/* Use half carry for high nibble calculation */
						new_alu_sel_hc = 1;

						/* Sign extend ALU operand B for high byte calculation */
						new_alu_neg = alu_fl_neg;

						/* Caclulate high nibble of high byte in ALU */
						new_alu_op_b_high = 1;

						/* Update ALU flags (or not) */
						update_alu_flags(0|0|0|0);

						/* Write ALU result into W */
						wz_from_alu(HIGH);

						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* JP (HL) -- Jump to address in HL */
			jp_hl: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t4: begin
						/* Apply HL to address pins instead of PC */
						reg_to_adr(HL);
						no_pc = 1;
					end
				endcase
			end

			/* CALL nn     -- Push PC and jump to immediate address nn */
			/* CALL cc, nn -- Push PC and jump to immediate address nn if condition cc is met */
			call_nn, call_cc_nn: begin
				read_mcyc_after(m1);  /* Read immediate address nn low byte during M2 */
				read_mcyc_after(m2);  /* Read immediate address nn high byte during M3 */
				write_mcyc_after(m4); /* Write PC high byte to address in SP-1 during M5 */
				write_mcyc_after(m5); /* Write PC low byte to address in SP-2 during M6 */
				last_mcyc(m3 && !alu_cond_result && call_cc_nn);
				last_mcyc(m6);

				unique0 case (1)
					m1 && t4: begin
						/* Read register F into ALU flags */
						af_to_alu(Z|N|H|C);

						/* Apply PC to address pins for read cycle */
						pc_to_adr;
					end

					/* Increment PC */
					m2 && t3: pc_from_adr_inc;

					m2 && t4: begin
						/* Write immediate fetched during M2 from data latch into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment PC */
					m3 && t3: pc_from_adr_inc;

					/* Apply SP to address pins for decrement */
					m3 && t4: if (!set_m1) sp_to_adr;

					/* Decrement SP */
					m4 && t3: sp_from_adr_inc(DEC);

					m4 && t4: begin
						/* Write immediate fetched during M3 from data latch into W */
						wz_from_dl(HIGH);

						/* Apply address latch to address pins for write cycle */
						new_io_adr_we = 1;
					end

					/* Read high byte of PC into data latch */
					m5 && t1: pc_to_dl(HIGH);

					/* Decrement SP */
					m5 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m5 && t4: new_io_adr_we = 1;

					/* Read low byte of PC into data latch */
					m6 && t1: pc_to_dl(LOW);

					m6 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* RET  -- Pop PC */
			/* RETI -- Pop PC and enable interrupts */
			ret, reti: begin
				read_mcyc_after(m1); /* Read PC low byte from address in SP during M2 */
				read_mcyc_after(m2); /* Read PC high byte from address in SP+1 during M3 */
				last_mcyc(m4);

				unique0 case (1)
					/* Apply SP to address pins for read cycle */
					m1 && t4: sp_to_adr;

					/* Increment SP */
					m2 && t3: sp_from_adr_inc(INC);

					m2 && t4: begin
						/* Write value from data latch that was fetched during M2 into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment SP */
					m3 && t3: sp_from_adr_inc(INC);

					/* Write value from data latch that was fetched during M3 into W */
					m3 && t4: wz_from_dl(HIGH);

					/* If RETI, set IME register */
					m4 && t3: begin
						new_ime_we  = reti;
						new_ime_bit = reti;
					end

					m4 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* RET cc -- Pop PC if condition cc is met */
			ret_cc: begin
				read_mcyc_after(m2); /* Read PC low byte from address in SP during M3 */
				read_mcyc_after(m3); /* Read PC high byte from address in SP+1 during M4 */
				last_mcyc(m2 && !alu_cond_result);
				last_mcyc(m5);

				unique0 case (1)
					/* Read register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					/* Apply SP to address pins for read cycle */
					m2 && t4: if (!set_m1) sp_to_adr;

					/* Increment SP */
					m3 && t3: sp_from_adr_inc(INC);

					m3 && t4: begin
						/* Write value from data latch that was fetched during M3 into Z */
						wz_from_dl(LOW);

						/* Apply address latch to address pins for read cycle */
						new_io_adr_we = 1;
					end

					/* Increment SP */
					m4 && t3: sp_from_adr_inc(INC);

					/* Write value from data latch that was fetched during M4 into W */
					m4 && t4: wz_from_dl(HIGH);

					m5 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* RST t -- Push PC and jump to vector t */
			rst_t: begin
				write_mcyc_after(m2); /* Write PC high byte to address in SP-1 during M3 */
				write_mcyc_after(m3); /* Write PC low byte to address in SP-2 during M4 */
				last_mcyc(m4);

				unique0 case (1)
					/* Apply SP to address pins for decrement */
					m1 && t4: sp_to_adr;

					m2 && t1: begin
						/* Use ALU operand A to output $00 as high byte of destination address */
						new_alu_op_a_zero = 1;
						new_alu_op_a_oe   = 1;
						new_alu_oe        = 1;

						/* Use opcode in data latch masked with $38 as low byte of destination address */
						new_io_data_oe     = 1;
						new_db_c2l_mask543 = 1;
						new_db_c2l_oe      = 1;

						/* Write destination address into WZ */
						new_reg_l2gp_oe = 1;
						new_reg_h2gp_oe = 1;
						write_wz(HIGH|LOW);
					end

					/* Decrement SP */
					m2 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m2 && t4: new_io_adr_we = 1;

					/* Read high byte of PC into data latch */
					m3 && t1: pc_to_dl(HIGH);

					/* Decrement SP */
					m3 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m3 && t4: new_io_adr_we = 1;

					/* Read low byte of PC into data latch */
					m4 && t1: pc_to_dl(LOW);

					m4 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end

			/* SCF -- Set carry flag */
			scf: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register A into ALU operands and register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);
					end

					m1 && t2: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;
						new_alu_res_oe    = 1;
						new_alu_oe        = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|0|0);
					end

					m1 && t3: begin
						/* Write ALU flags into register F */
						new_alu_fl_carry_set = 1;
						f_from_alu;
					end
				endcase
			end

			/* CCF -- Complement carry flag */
			ccf: begin
				last_mcyc(m1);

				unique0 case (1)
					/* Read register A into ALU operands and register F into ALU flags */
					m1 && t4: af_to_alu(Z|N|H|C);

					m1 && t1: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate low nibble in ALU */
						new_alu_op_low = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|H|0);
					end

					m1 && t2: begin
						/* Configure ALU for OR operation */
						alu_op_or;

						/* Caclulate high nibble in ALU */
						new_alu_op_b_high = 1;
						new_alu_res_oe    = 1;
						new_alu_oe        = 1;

						/* Update ALU flags */
						new_alu_fl_neg_clr = 1;
						update_alu_flags(0|N|0|0);
					end

					m1 && t3: begin
						/* Write ALU flags into register F */
						new_alu_fl_carry_cpl = 1;
						f_from_alu;
					end
				endcase
			end

			/* HALT -- Halt CPU and wake on interrupt */
			halt: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t3: begin
						new_halt_set = !int_pending;
						no_inc       = 1;
					end
				endcase
			end

			/* STOP -- Halt system and wake on interrupt */
			stop: begin
				last_mcyc(m1);

				// TODO: Implement STOP instruction
			end

			/* EI -- Enable interrupts */
			/* DI -- Disable interrupts */
			di_ei: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t3: begin
						/* Don't allow interrupts during DI instruction */
						no_int = !opcode[3];

						/* Write IME register */
						new_ime_we  = 1;
						new_ime_bit = opcode[3];
					end
				endcase
			end

			/* Prefix CB */
			prefix_cb: begin
				last_mcyc(m1);

				unique0 case (1)
					m1 && t3: begin
						/* Don't allow interrupts between prefix and actual instruction */
						no_int = 1;

						/* Select CB bank for next instruction */
						new_ir_bank_cb_set = 1;
					end
				endcase
			end

			/* Interrupt Entry */
			intr_entry: begin
				write_mcyc_after(m3); /* Write PC high byte to address in SP-1 during M3 */
				write_mcyc_after(m4); /* Write PC low byte to address in SP-2 during M4 */
				last_mcyc(m5);

				unique0 case (1)
					/* Decrement PC so that the fetch of the instruction that was just aborted by the interrupt
					   will be restarted after the interrupt returned. */
					m2 && t3: begin
						inc_al(DEC);
						new_reg_pc_sel = 1;
						write_sys(HIGH|LOW);
					end

					/* Apply SP to address pins for decrement */
					m2 && t4: sp_to_adr;

					/* Decrement SP */
					m3 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m3 && t4: new_io_adr_we = 1;

					/* Read high byte of PC into data latch */
					m4 && t1: pc_to_dl(HIGH);

					/* Decrement SP */
					m4 && t3: sp_from_adr_inc(DEC);

					/* Apply address latch to address pins for write cycle */
					m4 && t4: new_io_adr_we = 1;

					/* Read low byte of PC into data latch */
					m5 && t1: pc_to_dl(LOW);

					m5 && t3: begin
						/* Use ALU operand A to output $00 as high byte of destination address */
						new_alu_op_a_zero = 1;
						new_alu_op_a_oe   = 1;
						new_alu_oe        = 1;

						/* Use interrupt number as low byte of destination address */
						new_int_vector_oe = 1;
						new_db_c2l_oe     = 1;

						/* Write destination address into WZ */
						new_reg_l2gp_oe = 1;
						new_reg_h2gp_oe = 1;
						write_wz(HIGH|LOW);

						/* Acknowledge interrupt */
						new_ack_int = 1;

						/* Reset IME register */
						new_ime_we = 1;
					end

					m5 && t4: begin
						/* Apply WZ to address pins instead of PC */
						wz_to_adr;
						no_pc = 1;
					end
				endcase
			end
		endcase else last_mcyc(m1);

		/* Control ALU operation for 8 bit arithmetical and logical instructions */
		unique0 case (1)
			add_x, adc_x: begin
				if (add_x) begin
					/* Clear carry for low nibble caclulation */
					new_alu_fl_carry_set |= new_alu_op_low;
					new_alu_fl_carry_cpl |= new_alu_op_low;
				end

				/* Use (zeroed) carry for low nibble and half carry for high nibble calculation */
				new_alu_sel_hc = !new_alu_op_low;

				/* Clear subtract (N) flag */
				new_alu_fl_neg_clr = 1;
				new_alu_fl_neg_we  = 1;
			end

			sub_x, sbc_x, cp_x: begin
				if (sbc_x) begin
					/* Complement carry for low nibble caclulation */
					new_alu_fl_carry_cpl |= new_alu_op_low;
				end else begin
					/* Set carry for low nibble caclulation */
					new_alu_fl_carry_set |= new_alu_op_low;
				end

				/* Complement ALU operand B */
				new_alu_neg = 1;

				/* Use carry for low nibble and half carry for high nibble calculation */
				new_alu_sel_hc = !new_alu_op_low;

				/* Set subtract (N) flag */
				new_alu_fl_neg_we  = 1;
				new_alu_fl_neg_set = 1;

				if (cp_x && m1 && t2) begin
					/* Prevent A from being written when executing CP instruction */
					new_reg_gp_hi_sel = 0;
					new_reg_gp_we     = 0;
				end
			end

			and_x: begin
				/* Configure ALU for AND operation */
				alu_op_and;

				/* Clear subtract (N) flag */
				new_alu_fl_neg_clr = 1;
				new_alu_fl_neg_we  = 1;

				if (m1 && t3) begin
					/* Clear carry flag for write back to register F */
					new_alu_fl_carry_cpl = 1;
				end
			end

			xor_x: begin
				/* Configure ALU for XOR operation */
				alu_op_xor;

				/* Clear subtract (N) flag */
				new_alu_fl_neg_clr = 1;
				new_alu_fl_neg_we  = 1;
			end

			or_x: begin
				/* Configure ALU for OR operation */
				alu_op_or;

				/* Clear subtract (N) flag */
				new_alu_fl_neg_clr = 1;
				new_alu_fl_neg_we  = 1;
			end
		endcase

		/* Read opcode from bus during next M1 cycle */
		read_mcyc_after(set_m1);

		/* Apply PC to address pins for read cycle */
		if (set_m1 && !no_pc) pc_to_adr;
		if (set_m1) new_io_adr_we = 1;

		/* Instruction fetch */
		unique0 case (1)
			m1 && t3: begin
				/* Increment PC */
				pc_from_adr_inc;

				/* Allow interrupts */
				new_update_int = !no_int;

				/* Select opcode bank for next instruction */
				new_ir_bank_we = 1;
			end

			m1 && t4: begin
				/* Override data (opcode) with zero when halted or under reset; executing a no-op effectively */
				new_zero_data_oe = !clk_ena || in_rst;

				/* Write fetched opcode to instruction register */
				new_ir_we = 1;
			end
		endcase

		/* Evaluate ALU flags for conditional instructions; F must be loaded into ALU on M1 T4 */
		if (m2 && t1) new_alu_cond_we = 1;

		new_inc_cy &= !no_inc && !in_rst && clk_ena;

		in_alu  = new_in_alu;
		reg_sel = new_reg_sel;
		use_sp  = new_use_sp;

		ctl_mread            = new_mread;
		ctl_mwrite           = new_mwrite;
		ctl_reg_gp2h_oe      = new_reg_gp2h_oe;
		ctl_reg_gp2l_oe      = new_reg_gp2l_oe;
		ctl_reg_h2gp_oe      = new_reg_h2gp_oe;
		ctl_reg_l2gp_oe      = new_reg_l2gp_oe;
		ctl_reg_gp_hi_sel    = new_reg_gp_hi_sel;
		ctl_reg_gp_lo_sel    = new_reg_gp_lo_sel;
		ctl_reg_gp_we        = new_reg_gp_we;
		ctl_reg_sys_hi_sel   = new_reg_sys_hi_sel;
		ctl_reg_sys_lo_sel   = new_reg_sys_lo_sel;
		ctl_reg_sys_hi_we    = new_reg_sys_hi_we;
		ctl_reg_sys_lo_we    = new_reg_sys_lo_we;
		ctl_reg_sp_sel       = new_reg_sp_sel;
		ctl_reg_wz_sel       = new_reg_wz_sel;
		ctl_reg_pc_sel       = new_reg_pc_sel;
		ctl_reg_gp2sys_oe    = new_reg_gp2sys_oe;
		ctl_reg_sys2gp_oe    = new_reg_sys2gp_oe;
		ctl_al_we            = new_al_we;
		ctl_al_hi_ff         = new_al_hi_ff;
		ctl_inc_dec          = new_inc_dec;
		ctl_inc_cy           = new_inc_cy;
		ctl_inc_oe           = new_inc_oe;
		ctl_db_c2l_oe        = new_db_c2l_oe;
		ctl_db_l2c_oe        = new_db_l2c_oe;
		ctl_db_l2h_oe        = new_db_l2h_oe;
		ctl_db_h2l_oe        = new_db_h2l_oe;
		ctl_db_c2l_mask543   = new_db_c2l_mask543;
		ctl_io_data_oe       = new_io_data_oe;
		ctl_io_data_we       = new_io_data_we;
		ctl_io_adr_we        = new_io_adr_we;
		ctl_zero_data_oe     = new_zero_data_oe;
		ctl_ir_we            = new_ir_we;
		ctl_ir_bank_we       = new_ir_bank_we;
		ctl_ir_bank_cb_set   = new_ir_bank_cb_set;
		ctl_alu_oe           = new_alu_oe;
		ctl_alu_fl_oe        = new_alu_fl_oe;
		ctl_alu_daa_oe       = new_alu_daa_oe;
		ctl_alu_sh_oe        = new_alu_sh_oe;
		ctl_alu_op_a_oe      = new_alu_op_a_oe;
		ctl_alu_res_oe       = new_alu_res_oe;
		ctl_alu_bs_oe        = new_alu_bs_oe;
		ctl_alu_op_a_bus     = new_alu_op_a_bus;
		ctl_alu_op_a_zero    = new_alu_op_a_zero;
		ctl_alu_op_b_bus     = new_alu_op_b_bus;
		ctl_alu_op_b_zero    = new_alu_op_b_zero;
		ctl_alu_nc           = new_alu_nc;
		ctl_alu_fc           = new_alu_fc;
		ctl_alu_ic           = new_alu_ic;
		ctl_alu_neg          = new_alu_neg;
		ctl_alu_op_low       = new_alu_op_low;
		ctl_alu_op_b_high    = new_alu_op_b_high;
		ctl_alu_shift        = new_alu_shift;
		ctl_alu_sel_hc       = new_alu_sel_hc;
		ctl_alu_cond_we      = new_alu_cond_we;
		ctl_alu_fl_bus       = new_alu_fl_bus;
		ctl_alu_fl_alu       = new_alu_fl_alu;
		ctl_alu_fl_zero_we   = new_alu_fl_zero_we;
		ctl_alu_fl_zero_clr  = new_alu_fl_zero_clr;
		ctl_alu_fl_half_we   = new_alu_fl_half_we;
		ctl_alu_fl_half_set  = new_alu_fl_half_set;
		ctl_alu_fl_half_cpl  = new_alu_fl_half_cpl;
		ctl_alu_fl_daac_we   = new_alu_fl_daac_we;
		ctl_alu_fl_neg_we    = new_alu_fl_neg_we;
		ctl_alu_fl_neg_set   = new_alu_fl_neg_set;
		ctl_alu_fl_neg_clr   = new_alu_fl_neg_clr;
		ctl_alu_fl_carry_we  = new_alu_fl_carry_we;
		ctl_alu_fl_carry_set = new_alu_fl_carry_set;
		ctl_alu_fl_carry_cpl = new_alu_fl_carry_cpl;
		ctl_alu_fl_c2_we     = new_alu_fl_c2_we;
		ctl_alu_fl_c2_sh     = new_alu_fl_c2_sh;
		ctl_alu_fl_c2_daa    = new_alu_fl_c2_daa;
		ctl_alu_fl_sel_c2    = new_alu_fl_sel_c2;
		ctl_update_int       = new_update_int;
		ctl_ime_we           = new_ime_we;
		ctl_ime_bit          = new_ime_bit;
		ctl_ack_int          = new_ack_int;
		ctl_int_vector_oe    = new_int_vector_oe;
		ctl_halt_set         = new_halt_set;
	end

	always_ff @(posedge clk) begin
		if (reset)
			in_rst <= 1; /* prevent PC increment and read zero opcode (no-op) during first M cycle */
		else if (set_m1)
			in_rst <= 0;
	end

endmodule
