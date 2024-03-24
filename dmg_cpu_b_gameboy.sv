`timescale 1ns/1ns
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
	logic            nrd, nwr, ncs;
	tri logic [15:0] a_pin;
	tri logic [7:0]  d_pin;

	/* External video bus */
	logic            nmoe, nmwr, nmcs;
	logic     [12:0] ma_pin;
	tri logic [7:0]  md_pin;

	/* Serial link port pins */
	logic     sout;
	tri logic sin;
	tri logic sck;

	/* Button pins */
	tri logic p10, p11, p12, p13;
	logic     p14, p15;

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

	// See dmgcpu/ports.md
	SM83Core cpu(
		.M1(cpu_out_t1),    // out T1 
		.CLK1(cpu_clkin_t2),  // in  T2 
		.CLK2(cpu_clkin_t3),  // in  T3 
		.CLK3(cpu_clkin_t4),  // in  T4 
		.CLK4(cpu_clkin_t5),  // in  T5 
		.CLK5(cpu_clkin_t6),  // in  T6 
		.CLK6(cpu_clkin_t7),  // in  T7 
		.CLK7(cpu_clkin_t8),  // in  T8 
		.CLK8(cpu_clkin_t9),  // in  T9 
		.CLK9(cpu_clkin_t10), // in  T10
		.CLK_ENA(cpu_clk_ena),   // out T11
		.SYNC_RESET(cpu_in_t12),    // in  T12
		.RESET(cpu_in_t13),    // in  T13
		.OSC_ENA(cpu_xo_ena),    // out T14
		.OSC_STABLE(cpu_in_t15),    // in  T15
		// .in(cpu_in_t16),    // in  T16
		.RD(cpu_raw_rd),    // out R1 
		.WR(cpu_raw_wr),    // out R2 
		.Maybe1(cpu_in_r3),     // in  R3 
		.MMIO_REQ(cpu_in_r4),     // in  R4 
		.IPL_REQ(cpu_in_r5),     // in  R5 
		.Maybe2(cpu_in_r6),     // in  R6 
		.MREQ(cpu_out_r7),    // out R7 

		.CPU_IRQ_ACK({
			cpu_irq0_ack, // out R14
			cpu_irq1_ack, // out R16
			cpu_irq2_ack, // out R18
			cpu_irq3_ack, // out R20
			cpu_irq4_ack, // out R22
			cpu_irq5_ack, // out R24
			cpu_irq6_ack, // out R26
			cpu_irq7_ack  // out R28
		}),

		.CPU_IRQ_TRIG({
			cpu_irq0_trig, // in  R15
			cpu_irq1_trig, // in  R17
			cpu_irq2_trig, // in  R19
			cpu_irq3_trig, // in  R21
			cpu_irq4_trig, // in  R23
			cpu_irq5_trig, // in  R25
			cpu_irq6_trig, // in  R27
			cpu_irq7_trig  // in  R29
		}),
		.D(d),             // I/O B1-B8  
		.A(cpu_a),         // out B9-B24 
		.WAKE(cpu_wakeup), // in  B25 
		.NMI(1'b0)
	);

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

	logic [7:0] video_ram[0:8191];
	initial foreach (video_ram[i]) video_ram[i] = $random;
	always_ff @(posedge nmwr) if (!nmcs) video_ram[ma_pin] <= $isunknown(md_pin) ? $random : md_pin;
	assign md_pin = (!nmcs && !nmoe) ? video_ram[ma_pin] : 'z;

	logic [7:0] work_ram[0:8191];
	initial foreach (work_ram[i]) work_ram[i] = $random;
	always_ff @(posedge nwr) if (!ncs && a_pin[14]) work_ram[a_pin[12:0]] <= $isunknown(d_pin) ? $random : d_pin;
	assign d_pin = (!ncs && a_pin[14] && !nrd) ? work_ram[a_pin[12:0]] : 'z;

	bit          has_rom, has_ram;
	bit          has_mbc1, has_mbc5;
	logic [7:0]  cart_rom[0:8388607];
	logic [7:0]  cart_ram[0:262143];
	logic [22:0] cart_rom_adr;
	logic [17:0] cart_ram_adr;
	logic        cart_rom_cs, cart_ram_cs;
	assign d_pin = (has_rom && cart_rom_cs && !nrd) ? cart_rom[cart_rom_adr] : 'z;
	initial foreach (cart_ram[i]) cart_ram[i] = $random;
	always_ff @(posedge nwr) if (has_ram && cart_ram_cs) cart_ram[cart_ram_adr] <= $isunknown(d_pin) ? $random : d_pin;
	assign d_pin = (has_ram && cart_ram_cs && !nrd) ? cart_rom[cart_ram_adr] : 'z;

	logic [18:14] mbc1_ra;
	logic [14:13] mbc1_aa;
	logic         mbc1_ncs_rom, mbc1_ncs_ram, mbc1_cs_ram;
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

	logic [22:14] mbc5_ra;
	logic [16:13] mbc5_aa;
	logic         mbc5_ncs_ram;
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

	logic           clk;
	logic           reset, areset;
	logic           ncyc;

	logic [15:0]    adr;
	logic [7:0]     din, dout;
	logic           rd;
	logic           wr;

	logic [7:0]     irq;
	// logic [7:0]     iack;

	logic           clk_ena;
	logic           clk_stable;

	// sm83 cpu(.*);

	assign ncyc        = !dmg.p1_clocks_reset.adyk && !dmg.p1_clocks_reset.alef;
	// assign cpu_a       = cpu_a_out;
	// assign d           = cpu_drv_d ? cpu_d_out : 'z;
	assign din         = d;
	// assign cpu_out_r7  = (cpu_raw_rd || cpu_raw_wr) && !cpu_in_r4 && !cpu_in_r5;
	assign clk_stable  = cpu_in_t15;
	// assign cpu_clk_ena = clk_ena;
	assign reset       = cpu_in_t12;
	assign areset      = cpu_in_t13;

	logic        cpu_drv_d;
	logic [7:0]  cpu_d_out;
	// logic [15:0] cpu_a_out;

	// initial cpu_a_out  = 0;
	// initial cpu_raw_rd = 0;
	// initial cpu_raw_wr = 0;

	/* CPU must not drive data bus when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high,
	 * otherwise it collides with 0xff driven on the right side of page 5. */
	assign cpu_drv_d = cpu_raw_wr && cpu_clkin_t3 && !cpu_clkin_t2;

	// always @(posedge cpu_clkin_t3) if (rd && !cpu_in_t12 && !cpu_in_t13) begin :read_cycle
	// 	cpu_a_out  <= adr;
	// 	cpu_raw_rd <= 1;
	// 	@(posedge cpu_clkin_t2);
	// 	cpu_raw_rd <= 0;
	// 	if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
	// 		cpu_a_out[15:8] <= 0;
	// end

	// always @(posedge cpu_clkin_t3) if (wr && !cpu_in_t12 && !cpu_in_t13) begin :write_cycle
	// 	cpu_a_out  <= adr;
	// 	cpu_d_out  <= '1;
	// 	cpu_raw_wr <= 1;
	// 	@(posedge cpu_clkin_t5);
	// 	cpu_d_out  <= dout;
	// 	@(posedge cpu_clkin_t2);
	// 	cpu_raw_wr <= 0;
	// 	if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
	// 		cpu_a_out[15:8] <= 0;
	// end

	// always @(posedge cpu_clkin_t10, posedge cpu_in_t12, posedge cpu_in_t13) if (cpu_in_t12 || cpu_in_t13) begin
	// 	disable read_cycle;
	// 	disable write_cycle;
	// 	cpu_raw_rd <= 0;
	// 	cpu_raw_wr <= 0;
	// 	cpu_a_out  <= 0;
	// end

	assign irq[0] = cpu_irq0_trig;
	assign irq[1] = cpu_irq1_trig;
	assign irq[2] = cpu_irq2_trig;
	assign irq[3] = cpu_irq3_trig;
	assign irq[4] = cpu_irq4_trig;
	assign irq[5] = cpu_irq5_trig;
	assign irq[6] = cpu_irq6_trig;
	assign irq[7] = cpu_irq7_trig;

	// always_ff @(posedge clk) begin
	// 	cpu_irq0_ack <= iack[0];
	// 	cpu_irq1_ack <= iack[1];
	// 	cpu_irq2_ack <= iack[2];
	// 	cpu_irq3_ack <= iack[3];
	// 	cpu_irq4_ack <= iack[4];
	// 	cpu_irq5_ack <= iack[5];
	// 	cpu_irq6_ack <= iack[6];
	// 	cpu_irq7_ack <= iack[7];
	// end

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

			// cpu_out_t1   = 0;
			// cpu_xo_ena   = 1;

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

	/* HALT/EI/DI instruction test code */
	/*
	initial irq = 0;
	// For halt.gb:
	//localparam int ser_int_ht = 4;  // interrupt before halt  (iff IME=0, instruction after halt executes two times)
	//localparam int ser_int_ht = 5;  // no unclocked cycles    (iff IME=0, instruction after halt executes two times; otherwise, iff IME=1, HALT executes two times)
	//localparam int ser_int_ht = 12; // no unclocked cycles    (iff IME=0, instruction after halt executes two times; otherwise, iff IME=1, HALT executes two times)
	//localparam int ser_int_ht = 13; // one unclocked cycle
	//localparam int ser_int_ht = 24; // one unclocked cycle
	//localparam int ser_int_ht = 25; // two unclocked cycles
	// For eidi.gb:
	//localparam int ser_int_ht = 4;  // interrupt before EI; one NOP executed and one more fetched
	//localparam int ser_int_ht = 20; // interrupt after EI; still one NOP executed and one more fetched
	//localparam int ser_int_ht = 21; // interrupt after EI; two NOPs executed
	//localparam int ser_int_ht = 4;  // interrupt before DI; DI aborted after fetch
	//localparam int ser_int_ht = 5;  // interrupt blocked by DI
	always @(posedge clk) begin
		int ht;
		irq[3] = 0;
		if (adr == 'hff02 && cpu_raw_wr && din == 'h80 && cpu.t4) begin
			ht = -14;
			begin :ser_int_wait
				forever begin
					@(posedge clk);
					ht++;
					if (ht == ser_int_ht)
						disable ser_int_wait;
					@(negedge clk);
					ht++;
					if (ht == ser_int_ht)
						disable ser_int_wait;
				end
			end
			#61ns;
			irq[3] = 1;
			@(posedge iack[3]);
		end
	end
	*/

endmodule
