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
	logic [7:0] cpu_irq_ack;
	logic [7:0] cpu_irq_trig;
	tri logic [7:0]  d;     /* CPU I/O B1-B8  */
	tri logic [7:0]  db;
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

	dmg_cpu_b dmg(
		.*, .t1('0), .t2('0), .vin(0.0), .unbonded_pad0('1), .unbonded_pad1(),
		.cpu_irq0_trig(cpu_irq_trig[0]), .cpu_irq0_ack(cpu_irq_ack[0]),
		.cpu_irq1_trig(cpu_irq_trig[1]), .cpu_irq1_ack(cpu_irq_ack[1]),
		.cpu_irq2_trig(cpu_irq_trig[2]), .cpu_irq2_ack(cpu_irq_ack[2]),
		.cpu_irq3_trig(cpu_irq_trig[3]), .cpu_irq3_ack(cpu_irq_ack[3]),
		.cpu_irq4_trig(cpu_irq_trig[4]), .cpu_irq4_ack(cpu_irq_ack[4]),
		.cpu_irq5_trig(cpu_irq_trig[5]), .cpu_irq5_ack(cpu_irq_ack[5]),
		.cpu_irq6_trig(cpu_irq_trig[6]), .cpu_irq6_ack(cpu_irq_ack[6]),
		.cpu_irq7_trig(cpu_irq_trig[7]), .cpu_irq7_ack(cpu_irq_ack[7])
	);

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
		.exec_phase_n(cpu_clkin_t2),
		.exec_phase(cpu_clkin_t3),
		.data_phase_n(cpu_clkin_t4),
		.data_phase(cpu_clkin_t5),
		.write_phase_n(cpu_clkin_t6),
		.write_phase(cpu_clkin_t7),
		.pch_phase_n(cpu_clkin_t8),
		.clk_n(cpu_clkin_t9),
		.clk(cpu_clkin_t10),
		.halt_n(cpu_clk_ena),
		.sys_reset(cpu_in_t12),
		.pwron_reset(cpu_in_t13),
		.stop_n(cpu_xo_ena),
		.clk_ready(cpu_in_t15),
		.nmi(cpu_in_t16),
		.rd(cpu_raw_rd),
		.wr(cpu_raw_wr),
		.oe_n(cpu_in_r3),
		.internal_access(cpu_in_r4),
		.shadow_access(cpu_in_r5),
		.shadow_override(cpu_in_r6),
		.mreq(cpu_out_r7),
		.inta(cpu_irq_ack),
		.\int (cpu_irq_trig),
		.d(d),
		.db(db),
		.a(cpu_a),
		.wake(cpu_wakeup),
		.test_freeze('0)
	);

	keeper #(16) a_keeper(cpu_a);
	keeper #(8)  d_keeper(d);
	keeper #(8)  db_keeper(db);

	logic [15:0] sm83_bc;
	assign sm83_bc[7:0]  = cpu.reg_c;
	assign sm83_bc[15:8] = cpu.reg_b;

	logic [15:0] sm83_de;
	assign sm83_de[7:0]  = cpu.reg_e;
	assign sm83_de[15:8] = cpu.reg_d;

	logic [15:0] sm83_hl;
	assign sm83_hl[7:0]  = cpu.reg_l;
	assign sm83_hl[15:8] = cpu.reg_h;

	logic [15:0] sm83_pc;
	assign sm83_pc[7:0]  = cpu.reg_pcl;
	assign sm83_pc[15:8] = cpu.reg_pch;

	logic [15:0] sm83_sp;
	assign sm83_sp[7:0]  = cpu.reg_spl;
	assign sm83_sp[15:8] = cpu.reg_sph;

	logic [15:0] sm83_wz;
	assign sm83_wz[7:0]  = cpu.reg_z;
	assign sm83_wz[15:8] = cpu.reg_w;

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

