`default_nettype none

module dmg_cpu_b_gameboy;

	import snd_dump::write_header;
	import snd_dump::write_bit4_as_int8;
	import snd_dump::write_real_as_int16;
	vid_dump vdump(.*, .t(test.sample_idx));

	/* Clock (crystal) pins */
	logic xi, xo;

	/* External cartridge bus */
	logic            nrst;
	logic            phi;
	tri logic        nrd, nwr;
	logic            ncs;
	tri logic [15:0] a_pin;
	tri logic [7:0]  d_pin;

	/* External video bus */
	tri logic        nmoe, nmwr, nmcs;
	logic     [12:0] ma_pin;
	tri logic [7:0]  md_pin;

	/* Serial link port pins */
	logic     sout;
	tri logic sin;
	tri logic sck;

	/* Button pins */
	tri logic p10, p11, p12, p13;
	tri logic p14, p15;

	/* Display pins */
	logic cpg, cp, cpl, fr, st, s;
	logic ld0, ld1;

	/* Audio pins */
	real rout, lout;

	/* Connections to SM83 CPU core */
	logic cpu_out_t1;       /* CPU out T1  - Goes to unbonded pin; Some test pin? */
	logic cpu_clkin_t2;     /* CPU in  T2  - 1 MiHz clock; complement of T3 */
	logic cpu_clkin_t3;     /* CPU in  T3  - 1 MiHz clock; complement of T2 */
	logic cpu_clkin_t4;     /* CPU in  T4  - 1 MiHz clock; complement of T5 */
	logic cpu_clkin_t5;     /* CPU in  T5  - 1 MiHz clock; complement of T4 */
	logic cpu_clkin_t6;     /* CPU in  T6  - 1 MiHz clock; complement of T7 */
	logic cpu_clkin_t7;     /* CPU in  T7  - 1 MiHz clock; complement of T6 */
	logic cpu_clkin_t8;     /* CPU in  T8  - 1 MiHz clock */
	logic cpu_clkin_t9;     /* CPU in  T9  - 1 MiHz clock; complement of T10 */
	logic cpu_clkin_t10;    /* CPU in  T10 - 1 MiHz clock; complement of T9 */
	logic cpu_clk_ena;      /* CPU out T11 - Enable clocks; active-high */
	logic cpu_in_t12;       /* CPU in  T12 - Synchonous reset; active-high */
	logic cpu_in_t13;       /* CPU in  T13 - Asynchonous reset; active-high */
	logic cpu_xo_ena;       /* CPU out T14 - Enable crystal oscillator; active-high */
	logic cpu_in_t15;       /* CPU in  T15 - Crystal oscillator stable; active-high */
	logic cpu_in_t16;       /* CPU in  T16 - Goes to unbonded pin; Some test pin? */
	logic cpu_raw_rd;       /* CPU out R1  - Memory read signal; active-high */
	logic cpu_raw_wr;       /* CPU out R2  - Memory write signal; active-high */
	logic cpu_in_r3;        /* CPU in  R3  - High when T1=1 T2=0 */
	logic cpu_in_r4;        /* CPU in  R4  - High when address is 0xFExx or 0xFFxx */
	logic cpu_in_r5;        /* CPU in  R5  - High when address is 0x00xx and boot ROM is still visible */
	logic cpu_in_r6;        /* CPU in  R6  - High when T1=0 T2=1 */
	logic cpu_out_r7;       /* CPU out R7  - External memory request; active-high */
	logic cpu_irq0_ack;     /* CPU out R14 - IRQ0 acknowledge; active-high */
	logic cpu_irq0_trig;    /* CPU in  R15 - IRQ0 trigger; active-high */
	logic cpu_irq1_ack;     /* CPU out R16 - IRQ1 acknowledge; active-high */
	logic cpu_irq1_trig;    /* CPU in  R17 - IRQ1 trigger; active-high */
	logic cpu_irq2_ack;     /* CPU out R18 - IRQ2 acknowledge; active-high */
	logic cpu_irq2_trig;    /* CPU in  R19 - IRQ2 trigger; active-high */
	logic cpu_irq3_ack;     /* CPU out R20 - IRQ3 acknowledge; active-high */
	logic cpu_irq3_trig;    /* CPU in  R21 - IRQ3 trigger; active-high */
	logic cpu_irq4_ack;     /* CPU out R22 - IRQ4 acknowledge; active-high */
	logic cpu_irq4_trig;    /* CPU in  R23 - IRQ4 trigger; active-high */
	logic cpu_irq5_ack;     /* CPU out R24 - IRQ5 acknowledge; active-high */
	logic cpu_irq5_trig;    /* CPU in  R25 - IRQ5 trigger; active-high */
	logic cpu_irq6_ack;     /* CPU out R26 - IRQ6 acknowledge; active-high */
	logic cpu_irq6_trig;    /* CPU in  R27 - IRQ6 trigger; active-high */
	logic cpu_irq7_ack;     /* CPU out R28 - IRQ7 acknowledge; active-high */
	logic cpu_irq7_trig;    /* CPU in  R29 - IRQ7 trigger; active-high */
	tri logic [7:0]  d;     /* CPU I/O B1-B8  */
	tri logic [15:0] cpu_a; /* CPU out B9-B24 */
	logic cpu_wakeup;       /* CPU in  B25 - Wake from STOP mode; active-high */

	logic [7:0] video_ram[0:8191];
	logic [7:0] work_ram[0:8191];

	bit          has_rom, has_ram;
	bit          has_mbc1, has_mbc5;
	logic [7:0]  cart_rom[0:8388607];
	logic [7:0]  cart_ram[0:262143];
	logic [22:0] cart_rom_adr;
	logic [17:0] cart_ram_adr;
	logic        cart_rom_cs, cart_ram_cs;

	logic [18:14] mbc1_ra;
	logic [14:13] mbc1_aa;
	logic         mbc1_ncs_rom, mbc1_ncs_ram, mbc1_cs_ram;

	logic [22:14] mbc5_ra;
	logic [16:13] mbc5_aa;
	logic         mbc5_ncs_ram;

	logic           clk;
	logic           reset;
	logic           ncyc;

	dmg_cpu_b dmg(.*, .t1('0), .t2('0), .vin(0.0), .unbonded_pad0('1), .unbonded_pad1());

	task automatic xi_tick();
		/* Simulate the 4 MiHz crystal that is attached to the XI and XO pins */
		#122ns xi = xo;

		clk = xi;
	endtask

	task automatic cyc(input int num);
		if (xi)
			xi_tick();
		repeat (num * 2)
			xi_tick();
	endtask

	initial foreach (video_ram[i]) video_ram[i] = $random;
	always_ff @(posedge nmwr) if (!nmcs) video_ram[ma_pin] <= $isunknown(md_pin) ? $random : md_pin;
	assign md_pin = (!nmcs && !nmoe) ? video_ram[ma_pin] : 'z;

	initial foreach (work_ram[i]) work_ram[i] = $random;
	always_ff @(posedge nwr) if (!ncs && a_pin[14]) work_ram[a_pin[12:0]] <= $isunknown(d_pin) ? $random : d_pin;
	assign d_pin = (!ncs && a_pin[14] && !nrd) ? work_ram[a_pin[12:0]] : 'z;

	assign d_pin = (has_rom && cart_rom_cs && !nrd) ? cart_rom[cart_rom_adr] : 'z;
	initial foreach (cart_ram[i]) cart_ram[i] = $random;
	always_ff @(posedge nwr) if (has_ram && cart_ram_cs) cart_ram[cart_ram_adr] <= $isunknown(d_pin) ? $random : d_pin;
	assign d_pin = (has_ram && cart_ram_cs && !nrd) ? cart_rom[cart_ram_adr] : 'z;

	mbc1 mbc1_chip(
		.nrst,
		.a(a_pin[15:13]),
		.d(d_pin[4:0]),
		.nrd, .nwr, .ncs,
		.ra(mbc1_ra),
		.aa(mbc1_aa),
		.ncs_rom(mbc1_ncs_rom),
		.ncs_ram(mbc1_ncs_ram),
		.cs_ram(mbc1_cs_ram)
	);

	mbc5 mbc5_chip(
		.nrst,
		.a(a_pin[15:12]),
		.d(d_pin),
		.nwr, .ncs,
		.ra(mbc5_ra),
		.aa(mbc5_aa),
		.ncs_ram(mbc5_ncs_ram)
	);

	always_comb unique case (1)
		has_mbc1: begin
			cart_rom_adr = { mbc1_ra, a_pin[13:0] };
			cart_ram_adr = { mbc1_aa, a_pin[12:0] };
			cart_rom_cs  = !mbc1_ncs_rom;
			cart_ram_cs  = !mbc1_ncs_ram && mbc1_cs_ram;
		end

		has_mbc5: begin
			cart_rom_adr = { mbc5_ra, a_pin[13:0] };
			cart_ram_adr = { mbc5_aa, a_pin[12:0] };
			cart_rom_cs  = !a_pin[15];
			cart_ram_cs  = !mbc5_ncs_ram;
		end

		default: begin
			cart_rom_adr = a_pin[14:0];
			cart_ram_adr = a_pin[12:0];
			cart_rom_cs  = !a_pin[15];
			cart_ram_cs  = !ncs && a_pin[13];
		end
	endcase

	initial begin
		string rom_file;
		int    f, _;
		byte   mbc_type, ram_size;

		has_rom  = 0;
		has_ram  = 0;
		has_mbc1 = 0;
		has_mbc5 = 0;

		rom_file = "";
		_ = $value$plusargs("ROM=%s", rom_file);

		f = 0;
		if (rom_file != "") begin
			f = $fopen(rom_file, "rb");
			if (!f)
				$error("Failed to open cartridge ROM file %s for reading.", rom_file);
		end
		if (f) begin
			_ = $fread(cart_rom, f);
			$fclose(f);
			has_rom = 1;
		end

		if (has_rom) begin
			mbc_type = cart_rom['h147];
			ram_size = cart_rom['h149];

			unique case (mbc_type)
				'h00, 'h08, 'h09: ;
				'h01, 'h02, 'h03: has_mbc1 = 1;
				'h05, 'h06:       $error("MBC2 not supported yet.");
				'h0b, 'h0c, 'h0d: $error("MMM01 not supported yet.");
				'h0f, 'h10, 'h11,
				'h12, 'h13:       $error("MBC3 not supported yet.");
				'h19, 'h1a, 'h1b,
				'h1c, 'h1d, 'h1e: has_mbc5 = 1;
				'h20:             $error("MBC6 not supported yet.");
				'h22:             $error("MBC7 not supported yet.");
				'hfc:             $error("MAC-GBD not supported yet.");
				'hfd:             $error("TAMA5 not supported yet.");
				'hfe:             $error("HuC3 not supported yet.");
				'hff:             $error("HuC1 not supported yet.");
				default:          $error("Unsupported MBC type.");
			endcase

			has_ram = |ram_size;
		end
	end

	sm83 cpu(
		.m1(cpu_out_t1),
		.adr_clk_n(cpu_clkin_t2),
		.adr_clk_p(cpu_clkin_t3),
		.phi_clk_p(cpu_clkin_t4),
		.phi_clk_n(cpu_clkin_t5),
		.t4_clk_n(cpu_clkin_t6),
		.t4_clk_p(cpu_clkin_t7),
		.buke(cpu_clkin_t8),
		.main_clk_n(cpu_clkin_t9),
		.main_clk_p(cpu_clkin_t10),
		.halt_n(cpu_clk_ena),
		.sync_reset(cpu_in_t12),
		.async_reset(cpu_in_t13),
		.stop_n(cpu_xo_ena),
		.osc_stable(cpu_in_t15),
		.nmi(cpu_in_t16),
		.rd(cpu_raw_rd),
		.wr(cpu_raw_wr),
		.unor(cpu_in_r3),
		.syro(cpu_in_r4),
		.tutu(cpu_in_r5),
		.umut(cpu_in_r6),
		.mreq(cpu_out_r7),
		.inta0(cpu_irq0_ack),
		.int0(cpu_irq0_trig),
		.inta1(cpu_irq1_ack),
		.int1(cpu_irq1_trig),
		.inta2(cpu_irq2_ack),
		.int2(cpu_irq2_trig),
		.inta3(cpu_irq3_ack),
		.int3(cpu_irq3_trig),
		.inta4(cpu_irq4_ack),
		.int4(cpu_irq4_trig),
		.inta5(cpu_irq5_ack),
		.int5(cpu_irq5_trig),
		.inta6(cpu_irq6_ack),
		.int6(cpu_irq6_trig),
		.inta7(cpu_irq7_ack),
		.int7(cpu_irq7_trig),
		.d0(d[0]),
		.d1(d[1]),
		.d2(d[2]),
		.d3(d[3]),
		.d4(d[4]),
		.d5(d[5]),
		.d6(d[6]),
		.d7(d[7]),
		.a0(cpu_a[0]),
		.a1(cpu_a[1]),
		.a2(cpu_a[2]),
		.a3(cpu_a[3]),
		.a4(cpu_a[4]),
		.a5(cpu_a[5]),
		.a6(cpu_a[6]),
		.a7(cpu_a[7]),
		.a8(cpu_a[8]),
		.a9(cpu_a[9]),
		.a10(cpu_a[10]),
		.a11(cpu_a[11]),
		.a12(cpu_a[12]),
		.a13(cpu_a[13]),
		.a14(cpu_a[14]),
		.a15(cpu_a[15]),
		.wake(cpu_wakeup)
	);

	keeper #(16) a_keeper(cpu_a);
	keeper #(8)  d_keeper(d);

	logic [7:0] sm83_db;
	assign sm83_db[0] = cpu.db0;
	assign sm83_db[1] = cpu.db1;
	assign sm83_db[2] = cpu.db2;
	assign sm83_db[3] = cpu.db3;
	assign sm83_db[4] = cpu.db4;
	assign sm83_db[5] = cpu.db5;
	assign sm83_db[6] = cpu.db6;
	assign sm83_db[7] = cpu.db7;

	logic [7:0] sm83_op1b;
	assign sm83_op1b[0] = !cpu.op1bus0_n;
	assign sm83_op1b[1] = !cpu.op1bus1_n;
	assign sm83_op1b[2] = !cpu.op1bus2_n;
	assign sm83_op1b[3] = !cpu.op1bus3_n;
	assign sm83_op1b[4] = !cpu.op1bus4_n;
	assign sm83_op1b[5] = !cpu.op1bus5_n;
	assign sm83_op1b[6] = !cpu.op1bus6_n;
	assign sm83_op1b[7] = !cpu.op1bus7_n;

	logic [7:0] sm83_op2b;
	assign sm83_op2b[0] = !cpu.op2bus0_n;
	assign sm83_op2b[1] = !cpu.op2bus1_n;
	assign sm83_op2b[2] = !cpu.op2bus2_n;
	assign sm83_op2b[3] = !cpu.op2bus3_n;
	assign sm83_op2b[4] = !cpu.op2bus4_n;
	assign sm83_op2b[5] = !cpu.op2bus5_n;
	assign sm83_op2b[6] = !cpu.op2bus6_n;
	assign sm83_op2b[7] = !cpu.op2bus7_n;

	logic [7:0] sm83_res;
	assign sm83_res[0] = cpu.res0;
	assign sm83_res[1] = cpu.res1;
	assign sm83_res[2] = cpu.res2;
	assign sm83_res[3] = cpu.res3;
	assign sm83_res[4] = cpu.res4;
	assign sm83_res[5] = cpu.res5;
	assign sm83_res[6] = cpu.res6;
	assign sm83_res[7] = cpu.res7;

	logic [15:0] sm83_hi_lo_bus;
	assign sm83_hi_lo_bus[0]  = !cpu.lo_bus0_n;
	assign sm83_hi_lo_bus[1]  = !cpu.lo_bus1_n;
	assign sm83_hi_lo_bus[2]  = !cpu.lo_bus2_n;
	assign sm83_hi_lo_bus[3]  = !cpu.lo_bus3_n;
	assign sm83_hi_lo_bus[4]  = !cpu.lo_bus4_n;
	assign sm83_hi_lo_bus[5]  = !cpu.lo_bus5_n;
	assign sm83_hi_lo_bus[6]  = !cpu.lo_bus6_n;
	assign sm83_hi_lo_bus[7]  = !cpu.lo_bus7_n;
	assign sm83_hi_lo_bus[8]  = !cpu.hi_bus0_n;
	assign sm83_hi_lo_bus[9]  = !cpu.hi_bus1_n;
	assign sm83_hi_lo_bus[10] = !cpu.hi_bus2_n;
	assign sm83_hi_lo_bus[11] = !cpu.hi_bus3_n;
	assign sm83_hi_lo_bus[12] = !cpu.hi_bus4_n;
	assign sm83_hi_lo_bus[13] = !cpu.hi_bus5_n;
	assign sm83_hi_lo_bus[14] = !cpu.hi_bus6_n;
	assign sm83_hi_lo_bus[15] = !cpu.hi_bus7_n;

	logic [15:0] sm83_idu_cpl_mask;
	assign sm83_idu_cpl_mask[0]  = cpu.idu_chain_a_y_n0;
	assign sm83_idu_cpl_mask[1]  = cpu.idu_chain_a_y_n1;
	assign sm83_idu_cpl_mask[2]  = cpu.idu_chain_a_y_n2;
	assign sm83_idu_cpl_mask[3]  = cpu.idu_chain_a_y_n3;
	assign sm83_idu_cpl_mask[4]  = cpu.idu_chain_a_y_n4;
	assign sm83_idu_cpl_mask[5]  = cpu.idu_chain_a_y_n5;
	assign sm83_idu_cpl_mask[6]  = cpu.idu_chain_a_y_n6;
	assign sm83_idu_cpl_mask[7]  = cpu.idu_chain_a_y_n7;
	assign sm83_idu_cpl_mask[8]  = cpu.idu_chain_b_y_n0;
	assign sm83_idu_cpl_mask[9]  = cpu.idu_chain_b_y_n1;
	assign sm83_idu_cpl_mask[10] = cpu.idu_chain_b_y_n2;
	assign sm83_idu_cpl_mask[11] = cpu.idu_chain_b_y_n3;
	assign sm83_idu_cpl_mask[12] = cpu.idu_chain_b_y_n4;
	assign sm83_idu_cpl_mask[13] = cpu.idu_chain_b_y_n5;
	assign sm83_idu_cpl_mask[14] = cpu.idu_chain_b_y_n6;
	assign sm83_idu_cpl_mask[15] = cpu.idu_chain_b_y_n7;

	logic [15:0] sm83_idu_chain_ena;
	assign sm83_idu_chain_ena[0]  = cpu.idu_mux_l0;
	assign sm83_idu_chain_ena[1]  = cpu.idu_mux_l1;
	assign sm83_idu_chain_ena[2]  = cpu.idu_mux_l2;
	assign sm83_idu_chain_ena[3]  = cpu.idu_mux_l3;
	assign sm83_idu_chain_ena[4]  = cpu.idu_mux_l4;
	assign sm83_idu_chain_ena[5]  = cpu.idu_mux_l5;
	assign sm83_idu_chain_ena[6]  = cpu.idu_mux_l6;
	assign sm83_idu_chain_ena[7]  = cpu.idu_mux_l7;
	assign sm83_idu_chain_ena[8]  = cpu.idu_mux_h0;
	assign sm83_idu_chain_ena[9]  = cpu.idu_mux_h1;
	assign sm83_idu_chain_ena[10] = cpu.idu_mux_h2;
	assign sm83_idu_chain_ena[11] = cpu.idu_mux_h3;
	assign sm83_idu_chain_ena[12] = cpu.idu_mux_h4;
	assign sm83_idu_chain_ena[13] = cpu.idu_mux_h5;
	assign sm83_idu_chain_ena[14] = cpu.idu_mux_h6;
	assign sm83_idu_chain_ena[15] = 0;

	logic [15:0] sm83_idu_out;
	assign sm83_idu_out[0]  = cpu.idu_xor_l0;
	assign sm83_idu_out[1]  = cpu.idu_xor_l1;
	assign sm83_idu_out[2]  = cpu.idu_xor_l2;
	assign sm83_idu_out[3]  = cpu.idu_xor_l3;
	assign sm83_idu_out[4]  = cpu.idu_xor_l4;
	assign sm83_idu_out[5]  = cpu.idu_xor_l5;
	assign sm83_idu_out[6]  = cpu.idu_xor_l6;
	assign sm83_idu_out[7]  = cpu.idu_xor_l7;
	assign sm83_idu_out[8]  = cpu.idu_xor_h0;
	assign sm83_idu_out[9]  = cpu.idu_xor_h1;
	assign sm83_idu_out[10] = cpu.idu_xor_h2;
	assign sm83_idu_out[11] = cpu.idu_xor_h3;
	assign sm83_idu_out[12] = cpu.idu_xor_h4;
	assign sm83_idu_out[13] = cpu.idu_xor_h5;
	assign sm83_idu_out[14] = cpu.idu_xor_h6;
	assign sm83_idu_out[15] = cpu.idu_xor_h7;

	logic [7:0] sm83_ir;
	assign sm83_ir[0] = cpu.ir0;
	assign sm83_ir[1] = cpu.ir1;
	assign sm83_ir[2] = cpu.ir2;
	assign sm83_ir[3] = cpu.ir3;
	assign sm83_ir[4] = cpu.ir4;
	assign sm83_ir[5] = cpu.ir5;
	assign sm83_ir[6] = cpu.ir6;
	assign sm83_ir[7] = cpu.ir7;

	logic [7:0] sm83_a;
	assign sm83_a[0] = cpu.reg_a0;
	assign sm83_a[1] = cpu.reg_a1;
	assign sm83_a[2] = cpu.reg_a2;
	assign sm83_a[3] = cpu.reg_a3;
	assign sm83_a[4] = cpu.reg_a4;
	assign sm83_a[5] = cpu.reg_a5;
	assign sm83_a[6] = cpu.reg_a6;
	assign sm83_a[7] = cpu.reg_a7;

	logic [15:0] sm83_bc;
	assign sm83_bc[0]  = cpu.reg_c0;
	assign sm83_bc[1]  = cpu.reg_c1;
	assign sm83_bc[2]  = cpu.reg_c2;
	assign sm83_bc[3]  = cpu.reg_c3;
	assign sm83_bc[4]  = cpu.reg_c4;
	assign sm83_bc[5]  = cpu.reg_c5;
	assign sm83_bc[6]  = cpu.reg_c6;
	assign sm83_bc[7]  = cpu.reg_c7;
	assign sm83_bc[8]  = cpu.reg_b0;
	assign sm83_bc[9]  = cpu.reg_b1;
	assign sm83_bc[10] = cpu.reg_b2;
	assign sm83_bc[11] = cpu.reg_b3;
	assign sm83_bc[12] = cpu.reg_b4;
	assign sm83_bc[13] = cpu.reg_b5;
	assign sm83_bc[14] = cpu.reg_b6;
	assign sm83_bc[15] = cpu.reg_b7;

	logic [15:0] sm83_de;
	assign sm83_de[0]  = cpu.reg_e0;
	assign sm83_de[1]  = cpu.reg_e1;
	assign sm83_de[2]  = cpu.reg_e2;
	assign sm83_de[3]  = cpu.reg_e3;
	assign sm83_de[4]  = cpu.reg_e4;
	assign sm83_de[5]  = cpu.reg_e5;
	assign sm83_de[6]  = cpu.reg_e6;
	assign sm83_de[7]  = cpu.reg_e7;
	assign sm83_de[8]  = cpu.reg_d0;
	assign sm83_de[9]  = cpu.reg_d1;
	assign sm83_de[10] = cpu.reg_d2;
	assign sm83_de[11] = cpu.reg_d3;
	assign sm83_de[12] = cpu.reg_d4;
	assign sm83_de[13] = cpu.reg_d5;
	assign sm83_de[14] = cpu.reg_d6;
	assign sm83_de[15] = cpu.reg_d7;

	logic [15:0] sm83_hl;
	assign sm83_hl[0]  = cpu.reg_l0;
	assign sm83_hl[1]  = cpu.reg_l1;
	assign sm83_hl[2]  = cpu.reg_l2;
	assign sm83_hl[3]  = cpu.reg_l3;
	assign sm83_hl[4]  = cpu.reg_l4;
	assign sm83_hl[5]  = cpu.reg_l5;
	assign sm83_hl[6]  = cpu.reg_l6;
	assign sm83_hl[7]  = cpu.reg_l7;
	assign sm83_hl[8]  = cpu.reg_h0;
	assign sm83_hl[9]  = cpu.reg_h1;
	assign sm83_hl[10] = cpu.reg_h2;
	assign sm83_hl[11] = cpu.reg_h3;
	assign sm83_hl[12] = cpu.reg_h4;
	assign sm83_hl[13] = cpu.reg_h5;
	assign sm83_hl[14] = cpu.reg_h6;
	assign sm83_hl[15] = cpu.reg_h7;

	logic [15:0] sm83_pc;
	assign sm83_pc[0]  = cpu.reg_pcl0;
	assign sm83_pc[1]  = cpu.reg_pcl1;
	assign sm83_pc[2]  = cpu.reg_pcl2;
	assign sm83_pc[3]  = cpu.reg_pcl3;
	assign sm83_pc[4]  = cpu.reg_pcl4;
	assign sm83_pc[5]  = cpu.reg_pcl5;
	assign sm83_pc[6]  = cpu.reg_pcl6;
	assign sm83_pc[7]  = cpu.reg_pcl7;
	assign sm83_pc[8]  = cpu.reg_pch0;
	assign sm83_pc[9]  = cpu.reg_pch1;
	assign sm83_pc[10] = cpu.reg_pch2;
	assign sm83_pc[11] = cpu.reg_pch3;
	assign sm83_pc[12] = cpu.reg_pch4;
	assign sm83_pc[13] = cpu.reg_pch5;
	assign sm83_pc[14] = cpu.reg_pch6;
	assign sm83_pc[15] = cpu.reg_pch7;

	logic [15:0] sm83_sp;
	assign sm83_sp[0]  = cpu.reg_spl0;
	assign sm83_sp[1]  = cpu.reg_spl1;
	assign sm83_sp[2]  = cpu.reg_spl2;
	assign sm83_sp[3]  = cpu.reg_spl3;
	assign sm83_sp[4]  = cpu.reg_spl4;
	assign sm83_sp[5]  = cpu.reg_spl5;
	assign sm83_sp[6]  = cpu.reg_spl6;
	assign sm83_sp[7]  = cpu.reg_spl7;
	assign sm83_sp[8]  = cpu.reg_sph0;
	assign sm83_sp[9]  = cpu.reg_sph1;
	assign sm83_sp[10] = cpu.reg_sph2;
	assign sm83_sp[11] = cpu.reg_sph3;
	assign sm83_sp[12] = cpu.reg_sph4;
	assign sm83_sp[13] = cpu.reg_sph5;
	assign sm83_sp[14] = cpu.reg_sph6;
	assign sm83_sp[15] = cpu.reg_sph7;

	logic [15:0] sm83_wz;
	assign sm83_wz[0]  = cpu.reg_z0;
	assign sm83_wz[1]  = cpu.reg_z1;
	assign sm83_wz[2]  = cpu.reg_z2;
	assign sm83_wz[3]  = cpu.reg_z3;
	assign sm83_wz[4]  = cpu.reg_z4;
	assign sm83_wz[5]  = cpu.reg_z5;
	assign sm83_wz[6]  = cpu.reg_z6;
	assign sm83_wz[7]  = cpu.reg_z7;
	assign sm83_wz[8]  = cpu.reg_w0;
	assign sm83_wz[9]  = cpu.reg_w1;
	assign sm83_wz[10] = cpu.reg_w2;
	assign sm83_wz[11] = cpu.reg_w3;
	assign sm83_wz[12] = cpu.reg_w4;
	assign sm83_wz[13] = cpu.reg_w5;
	assign sm83_wz[14] = cpu.reg_w6;
	assign sm83_wz[15] = cpu.reg_w7;

	assign ncyc  = !dmg.p1_clocks_reset.adyk && !dmg.p1_clocks_reset.alef;
	assign reset = cpu_in_t12;

	program test;
		int sample_idx;

		initial begin
			string dumpfile, ch_file, snd_file, vid_file;
			string time_str, prev_time_str;
			real   sim_seconds;
			int    _;
			int    fch[1:4];
			int    fmix, fvid;
			int    sim_mcycs;
			bit    dump_channels, dump_sound, dump_video;

			dumpfile = "";
			_ = $value$plusargs("DUMPFILE=%s", dumpfile);

			ch_file = "";
			_ = $value$plusargs("CH_FILE=%s", ch_file);
			dump_channels = ch_file != "";

			snd_file = "";
			_ = $value$plusargs("SND_FILE=%s", snd_file);
			dump_sound = snd_file != "";

			vid_file = "";
			_ = $value$plusargs("VID_FILE=%s", vid_file);
			dump_video = vid_file != "";

			sim_seconds = 6.0; /* Enough time for the boot ROM */
			_ = $value$plusargs("SECS=%f", sim_seconds);

			sim_mcycs = $rtoi(sim_seconds * 1048576.0);

			$dumpfile(dumpfile);
			$dumpvars(0, dmg_cpu_b_gameboy);

			if (dump_channels) for (int i = 1; i <= 4; i++) begin
				string filename;
				$sformat(filename, ch_file, i);
				fch[i] = $fopen(filename, "wb");
				write_header(fch[i], 65536, 1, 0);
			end
			if (dump_sound) begin
				fmix = $fopen(snd_file, "wb");
				write_header(fmix, 65536, 2, 1);
			end
			if (dump_video)
				fvid = $fopen(vid_file, "wb");

			sample_idx = 0;

			xi   = 0;
			nrst = 0;

			clk   = 0;

			cyc(64);
			nrst = 1;

			fork
				begin :tick_tick
					forever begin
						cyc(64);
						if (dump_channels) begin
							write_bit4_as_int8(fch[1], dmg.ch1_out);
							write_bit4_as_int8(fch[2], dmg.ch2_out);
							write_bit4_as_int8(fch[3], dmg.wave_dac_d);
							write_bit4_as_int8(fch[4], dmg.ch4_out);
						end
						if (dump_sound) begin
							write_real_as_int16(fmix, lout);
							write_real_as_int16(fmix, rout);
						end
						sample_idx++;
					end
				end

				if (dump_video) begin :video_dump
					vdump.video_dump_loop(fvid);
				end

				begin
					@(negedge reset);
					$sformat(time_str, "%.1f", $itor(sim_mcycs) / 1048576.0);
					$display("System reset done -- will simulate %s seconds", time_str);
					$fflush(32'h8000_0001);
					prev_time_str = time_str;

					while (sim_mcycs) begin
						sim_mcycs--;
						if (sim_mcycs % 131072) begin
							$sformat(time_str, "%.1f", $itor(sim_mcycs) / 1048576.0);
							if (time_str != prev_time_str && time_str != "0.0") begin
								$display("%s seconds remaining", time_str);
								$fflush(32'h8000_0001);
								prev_time_str = time_str;
							end
						end
						@(posedge cpu_clkin_t9);
						@(posedge cpu_clkin_t10);
					end

					disable tick_tick;
					disable video_dump;
				end
			join

			$finish;
		end
	endprogram

endmodule

