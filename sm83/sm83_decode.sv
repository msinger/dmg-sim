`timescale 1ns/1ns
`default_nettype none

module sm83_decode(
		input  logic [7:0] opcode,
		input  logic       bank_cb,
		input  logic       intr_entry,

		input  logic       in_alu,

		output logic       add_r,      /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP r/(HL) */
		output logic       add_hl,     /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP (HL) */
		output logic       add_n,      /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP n */
		output logic       add_x,      /* ADD r/(HL)/n */
		output logic       adc_x,      /* ADC r/(HL)/n */
		output logic       sub_x,      /* SUB r/(HL)/n */
		output logic       sbc_x,      /* SBC r/(HL)/n */
		output logic       and_x,      /* AND r/(HL)/n */
		output logic       xor_x,      /* XOR r/(HL)/n */
		output logic       or_x,       /* OR r/(HL)/n */
		output logic       cp_x,       /* CP r/(HL)/n */
		output logic       inc_m,      /* INC/DEC r/(HL) */
		output logic       inc_hl,     /* INC/DEC (HL) */
		output logic       dec_m,      /* DEC r/(HL) */
		output logic       rxxa,       /* RLCA/RLA/RRCA/RRA */
		output logic       daa,        /* DAA */
		output logic       cpl,        /* CPL */
		output logic       scf,        /* SCF */
		output logic       ccf,        /* CCF */
		output logic       add_hl_ss,  /* ADD HL, ss */
		output logic       add_sp_e,   /* ADD SP, e */
		output logic       inc_ss,     /* INC/DEC ss */
		output logic       ld_r_r,     /* LD r, r  ~or~  LD r, (HL)  ~or~  LD (HL), r  (~or~  HALT) */
		output logic       ld_r_hl,    /* LD r, (HL)  (~or~  HALT) */
		output logic       ld_hl_r,    /* LD (HL), r  (~or~  HALT) */
		output logic       ld_r_n,     /* LD r, n  ~or~  LD (HL), n */
		output logic       ld_hl_n,    /* LD (HL), n */
		output logic       ld_xx_a,    /* LD (BC/DE), A  ~or~  LD A, (BC/DE) */
		output logic       ld_hl_a,    /* LD (HLI/HLD), A  ~or~  LD A, (HLI/HLD) */
		output logic       ld_x_dir,   /* LD (BC/DE), A  ~or~  LD (HLI/HLD), A */
		output logic       ldx_nn_a,   /* LDX (nn), A  ~or~  LDX A, (nn) */
		output logic       ld_n_a,     /* LD (n), A  ~or~  LD A, (n) */
		output logic       ld_c_a,     /* LD (C), A  ~or~  LD A, (C) */
		output logic       ld_n_dir,   /* LD (n), A  ~or~  LD (C), A  ~or~  LDX (nn), A  (~or~  ADD SP, e) */
		output logic       ld_dd_nn,   /* LD dd, nn */
		output logic       ld_sp_hl,   /* LD SP, HL */
		output logic       ld_nn_sp,   /* LD (nn), SP */
		output logic       ldhl_sp_e,  /* LDHL SP, e */
		output logic       push_pop,   /* PUSH/POP qq */
		output logic       push_qq,    /* PUSH qq */
		output logic       jp_nn,      /* JP nn */
		output logic       jp_cc_nn,   /* JP cc, nn */
		output logic       jp_hl,      /* JP (HL) */
		output logic       jr_e,       /* JR e */
		output logic       jr_cc_e,    /* JR cc, e */
		output logic       call_nn,    /* CALL nn */
		output logic       call_cc_nn, /* CALL cc, nn */
		output logic       ret,        /* RET */
		output logic       reti,       /* RETI */
		output logic       ret_cc,     /* RET cc */
		output logic       rst_t,      /* RST t */
		output logic       nop,        /* NOP */
		output logic       stop,       /* STOP */
		output logic       halt,       /* HALT */
		output logic       di_ei,      /* DI/EI */
		output logic       prefix_cb,  /* Prefix CB */
		output logic       rlc_m,      /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL r/(HL) */
		output logic       swap_m,     /* SWAP r/(HL) */
		output logic       bit_b_m,    /* BIT b, r/(HL) */
		output logic       res_b_m,    /* RES b, r/(HL) */
		output logic       set_b_m,    /* SET b, r/(HL) */
		output logic       cb_hl       /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL (HL)  ~or~  BIT/RES/SET b, (HL) */
	);

	/* ALU operation */
	assign add_x = in_alu && opcode[5:3] == 0; /* ADD r/(HL)/n */
	assign adc_x = in_alu && opcode[5:3] == 1; /* ADC r/(HL)/n */
	assign sub_x = in_alu && opcode[5:3] == 2; /* SUB r/(HL)/n */
	assign sbc_x = in_alu && opcode[5:3] == 3; /* SBC r/(HL)/n */
	assign and_x = in_alu && opcode[5:3] == 4; /* AND r/(HL)/n */
	assign xor_x = in_alu && opcode[5:3] == 5; /* XOR r/(HL)/n */
	assign or_x  = in_alu && opcode[5:3] == 6; /* OR  r/(HL)/n */
	assign cp_x  = in_alu && opcode[5:3] == 7; /* CP  r/(HL)/n */

	logic bank0;
	assign bank0 = !bank_cb && !intr_entry;

	/* 8 bit arithmetic */
	assign add_r  = bank0 && opcode[7:6] == 2;  /* ADD/ADC/SUB/SBC/AND/XOR/OR/CP r/(HL) */
	assign add_hl = bank0 && (opcode == 'h86 || /* ADD (HL) */
	                          opcode == 'h96 || /* SUB (HL) */
	                          opcode == 'ha6 || /* AND (HL) */
	                          opcode == 'hb6 || /* OR (HL) */
	                          opcode == 'h8e || /* ADC (HL) */
	                          opcode == 'h9e || /* SBC (HL) */
	                          opcode == 'hae || /* XOR (HL) */
	                          opcode == 'hbe);  /* CP (HL) */
	assign add_n  = bank0 && (opcode == 'hc6 || /* ADD n */
	                          opcode == 'hd6 || /* SUB n */
	                          opcode == 'he6 || /* AND n */
	                          opcode == 'hf6 || /* OR n */
	                          opcode == 'hce || /* ADC n */
	                          opcode == 'hde || /* SBC n */
	                          opcode == 'hee || /* XOR n */
	                          opcode == 'hfe);  /* CP n */
	assign inc_m  = bank0 && (opcode == 'h04 || /* INC B */
	                          opcode == 'h14 || /* INC D */
	                          opcode == 'h24 || /* INC H */
	                          opcode == 'h34 || /* INC (HL) */
	                          opcode == 'h0c || /* INC C */
	                          opcode == 'h1c || /* INC E */
	                          opcode == 'h2c || /* INC L */
	                          opcode == 'h3c || /* INC A */
	                          opcode == 'h05 || /* DEC B */
	                          opcode == 'h15 || /* DEC D */
	                          opcode == 'h25 || /* DEC H */
	                          opcode == 'h35 || /* DEC (HL) */
	                          opcode == 'h0d || /* DEC C */
	                          opcode == 'h1d || /* DEC E */
	                          opcode == 'h2d || /* DEC L */
	                          opcode == 'h3d);  /* DEC A */
	assign inc_hl = bank0 && (opcode == 'h34 || /* INC (HL) */
	                          opcode == 'h35);  /* DEC (HL) */
	assign dec_m  = bank0 && (opcode == 'h05 || /* DEC B */
	                          opcode == 'h15 || /* DEC D */
	                          opcode == 'h25 || /* DEC H */
	                          opcode == 'h35 || /* DEC (HL) */
	                          opcode == 'h0d || /* DEC C */
	                          opcode == 'h1d || /* DEC E */
	                          opcode == 'h2d || /* DEC L */
	                          opcode == 'h3d);  /* DEC A */
	assign rxxa   = bank0 && (opcode == 'h07 || /* RLCA */
	                          opcode == 'h17 || /* RLA */
	                          opcode == 'h0f || /* RRCA */
	                          opcode == 'h1f);  /* RRA */
	assign daa    = bank0 &&  opcode == 'h27;   /* DAA */
	assign cpl    = bank0 &&  opcode == 'h2f;   /* CPL */
	assign scf    = bank0 &&  opcode == 'h37;   /* SCF */
	assign ccf    = bank0 &&  opcode == 'h3f;   /* CCF */

	/* 16 bit arithmetic */
	assign add_hl_ss = bank0 && (opcode == 'h09 || /* ADD HL, BC */
	                             opcode == 'h19 || /* ADD HL, DE */
	                             opcode == 'h29 || /* ADD HL, HL */
	                             opcode == 'h39);  /* ADD HL, SP */
	assign add_sp_e  = bank0 &&  opcode == 'he8;   /* ADD SP, e */
	assign inc_ss    = bank0 && (opcode == 'h03 || /* INC BC */
	                             opcode == 'h13 || /* INC DE */
	                             opcode == 'h23 || /* INC HL */
	                             opcode == 'h33 || /* INC SP */
	                             opcode == 'h0b || /* DEC BC */
	                             opcode == 'h1b || /* DEC DE */
	                             opcode == 'h2b || /* DEC HL */
	                             opcode == 'h3b);  /* DEC SP */

	/* 8 bit loads */
	assign ld_r_r   = bank0 && opcode[7:6] == 1;  /* LD r, r  ~or~  LD r, (HL)  ~or~  LD (HL), r  (~or~  HALT) */
	assign ld_r_hl  = bank0 && (opcode == 'h46 || /* LD B, (HL) */
	                            opcode == 'h56 || /* LD D, (HL) */
	                            opcode == 'h66 || /* LD H, (HL) */
	                            opcode == 'h76 || /* HALT (just for simplifying logic) */
	                            opcode == 'h4e || /* LD C, (HL) */
	                            opcode == 'h5e || /* LD E, (HL) */
	                            opcode == 'h6e || /* LD L, (HL) */
	                            opcode == 'h7e);  /* LD A, (HL) */
	assign ld_hl_r  = bank0 && (opcode == 'h70 || /* LD (HL), B */
	                            opcode == 'h71 || /* LD (HL), C */
	                            opcode == 'h72 || /* LD (HL), D */
	                            opcode == 'h73 || /* LD (HL), E */
	                            opcode == 'h74 || /* LD (HL), H */
	                            opcode == 'h75 || /* LD (HL), L */
	                            opcode == 'h76 || /* HALT (just for simplifying logic) */
	                            opcode == 'h77);  /* LD (HL), A */
	assign ld_r_n   = bank0 && (opcode == 'h06 || /* LD B, n */
	                            opcode == 'h16 || /* LD D, n */
	                            opcode == 'h26 || /* LD H, n */
	                            opcode == 'h36 || /* LD (HL), n */
	                            opcode == 'h0e || /* LD C, n */
	                            opcode == 'h1e || /* LD E, n */
	                            opcode == 'h2e || /* LD L, n */
	                            opcode == 'h3e);  /* LD A, n */
	assign ld_hl_n  = bank0 &&  opcode == 'h36;   /* LD (HL), n */
	assign ld_xx_a  = bank0 && (opcode == 'h02 || /* LD (BC), A */
	                            opcode == 'h12 || /* LD (DE), A */
	                            opcode == 'h0a || /* LD A, (BC) */
	                            opcode == 'h1a);  /* LD A, (DE) */
	assign ld_hl_a  = bank0 && (opcode == 'h22 || /* LD (HLI), A */
	                            opcode == 'h32 || /* LD (HLD), A */
	                            opcode == 'h2a || /* LD A, (HLI) */
	                            opcode == 'h3a);  /* LD A, (HLD) */
	assign ld_x_dir = bank0 && (opcode == 'h02 || /* LD (BC), A */
	                            opcode == 'h12 || /* LD (DE), A */
	                            opcode == 'h22 || /* LD (HLI), A */
	                            opcode == 'h32);  /* LD (HLD), A */
	assign ldx_nn_a = bank0 && (opcode == 'hea || /* LDX (nn), A */
	                            opcode == 'hfa);  /* LDX A, (nn) */
	assign ld_n_a   = bank0 && (opcode == 'he0 || /* LD (n), A */
	                            opcode == 'hf0);  /* LD A, (n) */
	assign ld_c_a   = bank0 && (opcode == 'he2 || /* LD (C), A */
	                            opcode == 'hf2);  /* LD A, (C) */
	assign ld_n_dir = bank0 && (opcode == 'he0 || /* LD (n), A */
	                            opcode == 'he2 || /* LD (C), A */
	                            opcode == 'he8 || /* ADD SP, e (just for simplifying logic) */
	                            opcode == 'hea);  /* LDX (nn), A */

	/* 16 bit loads */
	assign ld_dd_nn  = bank0 && (opcode == 'h01 || /* LD BC, nn */
	                             opcode == 'h11 || /* LD DE, nn */
	                             opcode == 'h21 || /* LD HL, nn */
	                             opcode == 'h31);  /* LD SP, nn */
	assign ld_sp_hl  = bank0 &&  opcode == 'hf9;   /* LD SP, HL */
	assign ld_nn_sp  = bank0 &&  opcode == 'h08;   /* LD (nn), SP */
	assign ldhl_sp_e = bank0 &&  opcode == 'hf8;   /* LDHL SP, e */
	assign push_pop  = bank0 && (opcode == 'hc1 || /* POP BC */
	                             opcode == 'hd1 || /* POP DE */
	                             opcode == 'he1 || /* POP HL */
	                             opcode == 'hf1 || /* POP AF */
	                             opcode == 'hc5 || /* PUSH BC */
	                             opcode == 'hd5 || /* PUSH DE */
	                             opcode == 'he5 || /* PUSH HL */
	                             opcode == 'hf5);  /* PUSH AF */
	assign push_qq   = bank0 && (opcode == 'hc5 || /* PUSH BC */
	                             opcode == 'hd5 || /* PUSH DE */
	                             opcode == 'he5 || /* PUSH HL */
	                             opcode == 'hf5);  /* PUSH AF */

	/* jumps */
	assign jp_nn      = bank0 &&  opcode == 'hc3;   /* JP nn */
	assign jp_cc_nn   = bank0 && (opcode == 'hc2 || /* JP NZ, nn */
	                              opcode == 'hd2 || /* JP NC, nn */
	                              opcode == 'hca || /* JP Z, nn */
	                              opcode == 'hda);  /* JP C, nn */
	assign jp_hl      = bank0 &&  opcode == 'he9;   /* JP (HL) */
	assign jr_e       = bank0 &&  opcode == 'h18;   /* JR e */
	assign jr_cc_e    = bank0 && (opcode == 'h20 || /* JR NZ, e */
	                              opcode == 'h30 || /* JR NC, e */
	                              opcode == 'h28 || /* JR Z, e */
	                              opcode == 'h38);  /* JR C, e */
	assign call_nn    = bank0 &&  opcode == 'hcd;   /* CALL nn */
	assign call_cc_nn = bank0 && (opcode == 'hc4 || /* CALL NZ, nn */
	                              opcode == 'hd4 || /* CALL NC, nn */
	                              opcode == 'hcc || /* CALL Z, nn */
	                              opcode == 'hdc);  /* CALL C, nn */
	assign ret        = bank0 &&  opcode == 'hc9;   /* RET */
	assign reti       = bank0 &&  opcode == 'hd9;   /* RETI */
	assign ret_cc     = bank0 && (opcode == 'hc0 || /* RET NZ */
	                              opcode == 'hd0 || /* RET NC */
	                              opcode == 'hc8 || /* RET Z */
	                              opcode == 'hd8);  /* RET C */
	assign rst_t      = bank0 && (opcode == 'hc7 || /* RST 00h */
	                              opcode == 'hcf || /* RST 08h */
	                              opcode == 'hd7 || /* RST 10h */
	                              opcode == 'hdf || /* RST 18h */
	                              opcode == 'he7 || /* RST 20h */
	                              opcode == 'hef || /* RST 28h */
	                              opcode == 'hf7 || /* RST 30h */
	                              opcode == 'hff);  /* RST 38h */

	/* misc */
	assign nop       = bank0 &&  opcode == 'h00;   /* NOP */
	assign stop      = bank0 &&  opcode == 'h10;   /* STOP */
	assign halt      = bank0 &&  opcode == 'h76;   /* HALT */
	assign di_ei     = bank0 && (opcode == 'hf3 || /* DI */
	                             opcode == 'hfb);  /* EI */
	assign prefix_cb = bank0 &&  opcode == 'hcb;   /* Prefix CB */

	/* CB prefixed instructions */
	assign rlc_m   = bank_cb && opcode[7:6] == 0; /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL r/(HL) */
	assign swap_m  = bank_cb && opcode[7:3] == 6; /* SWAP r/(HL) */
	assign bit_b_m = bank_cb && opcode[7:6] == 1; /* BIT b, r/(HL) */
	assign res_b_m = bank_cb && opcode[7:6] == 2; /* RES b, r/(HL) */
	assign set_b_m = bank_cb && opcode[7:6] == 3; /* SET b, r/(HL) */
	assign cb_hl   = bank_cb && opcode[2:0] == 6; /* RLC/RRC/RL/RR/SLA/SRA/SWAP/SRL (HL)  ~or~  BIT/RES/SET b, (HL) */

endmodule
