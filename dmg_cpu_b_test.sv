`timescale 1ns/1ns
`default_nettype none

module dmg_cpu_b_test;

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

	dmg_cpu_b dmg(.*, .t1('0), .t2('0), .vin(0.0), .unbonded_pad0('1), .unbonded_pad1());

	task automatic xi_tick();
		/* Simulate the 4 MiHz crystal that is attached to the XI and XO pins */
		#122ns xi = xo;
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

	/* CPU must not drive data bus when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high,
	 * otherwise it collides with 0xff driven on the right side of page 5. */
	assign cpu_drv_d = !cpu_in_t13 && !cpu_in_t12 && cpu_raw_wr && cpu_clkin_t3 && !cpu_clkin_t2;
	assign cpu_drv_a = 1;

	assign cpu_raw_rd = !cpu_in_t13 && !cpu_in_t12 && read_cycle;

	/* CPU must release WR when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high. This
	 * allows the RD signal to be asserted between the cycles for half a tick, like it is seen
	 * on the cartridge connector. */
	// TODO: Figure out if cpu_out_r7 (FROM_CPU4) has to do the same thing.
	assign cpu_raw_wr = !cpu_in_t13 && !cpu_in_t12 && write_cycle && cpu_clkin_t3 && !cpu_clkin_t2;

	/* CPU must raise cpu_out_r7 during mem cycles that are targeting external busses. It must not
	 * raise it when accessing FExx and FFxx (cpu_in_r4) or 00xx while boot ROM is visible (cpu_in_r5). */
	assign cpu_out_r7 = !cpu_in_t13 && !cpu_in_t12 && mem_cycle && !cpu_in_r4 && !cpu_in_r5;

	logic cpu_drv_d, cpu_drv_a;
	logic read_cycle;
	logic write_cycle;
	logic mem_cycle;

	logic [15:0] cpu_a_out;
	assign cpu_a = cpu_drv_a ? cpu_a_out : 'z;

	logic [7:0] cpu_d_out;
	assign d = cpu_drv_d ? cpu_d_out : 'z;

	logic [7:0] d_pin_drv;
	assign d_pin = d_pin_drv;

	task automatic write(input logic [15:0] adr, logic [7:0] data);
		@(posedge cpu_clkin_t3);
		mem_cycle   = 1;
		cpu_a_out   = adr;
		cpu_d_out   = '1;
		write_cycle = 1;
		@(posedge cpu_clkin_t5);
		cpu_d_out   = data;
		@(posedge cpu_clkin_t2);
		write_cycle = 0;
		mem_cycle   = 0;
		if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
			cpu_a_out[15:8] = 0;
	endtask

	task automatic read(input logic [15:0] adr, logic [7:0] data);
		@(posedge cpu_clkin_t3);
		mem_cycle    = 1;
		cpu_a_out    = adr;
		read_cycle   = 1;
		fork
			begin :drive_data_after_chip_select
				@(negedge ncs, negedge a_pin[15]); /* Wait for any of the two chip selects */
				#4ns
				d_pin_drv    = data;
			end
			begin
				@(posedge cpu_clkin_t2);
				d_pin_drv    = 'z;
				read_cycle   = 0;
				mem_cycle    = 0;
				if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
					cpu_a_out[15:8] = 0;
				disable drive_data_after_chip_select;
			end
		join
	endtask

	task automatic nop;
		@(posedge cpu_clkin_t3);
		@(posedge cpu_clkin_t2);
	endtask

	program test;
		int sample_idx;

		initial begin
			string dumpfile, ch_file, snd_file, vid_file;
			bit dump_channels, dump_sound, dump_video;
			int _;
			int fch[1:4];
			int fmix, fvid;

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

			$dumpfile(dumpfile);
			$dumpvars(0, dmg_cpu_b_test);

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

			xi        = 0;
			nrst      = 0;
			d_pin_drv = 'z;

			cpu_out_t1   = 0;
			cpu_clk_ena  = 0;
			cpu_xo_ena   = 1;
			read_cycle   = 0;
			write_cycle  = 0;
			mem_cycle    = 0;
			cpu_irq0_ack = 0;
			cpu_irq1_ack = 0;
			cpu_irq2_ack = 0;
			cpu_irq3_ack = 0;
			cpu_irq4_ack = 0;
			cpu_irq5_ack = 0;
			cpu_irq6_ack = 0;
			cpu_irq7_ack = 0;
			cpu_d_out    = 0;
			cpu_a_out    = 0;

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
					/* CPU needs to wait for cpu_in_t15 before enabling cpu_clk_ena, otherwise
					 * peripheral resets won't deassert. */
					while (!cpu_clk_ena) @(posedge cpu_clkin_t10)
						if (cpu_in_t15)
							cpu_clk_ena = 1;

					nop;
					nop;

					write('hff80, 'h12);
					write('hff81, 'h34);
					write('hff82, 'h56);
					write('hff83, 'h78);
					write('hfffe, 'hab);
					write('hffff, 'hcd);
					write('h0000, 'hef);
					read('hff80, 'h56);
					read('hff81, 'h56);
					read('hff82, 'h56);
					read('hff83, 'h56);
					read('hfffe, 'h56);
					read('hffff, 'h56);
					read('h0000, 'h56);

					read('hff00, 'h56);
					read('h1000, 'h56);
					read('hff00, 'h56);
					write('hff00, 'h56);
					read('h0055, 'h56);
					write('h00aa, 'h56);
					read('h1234, 'h56);
					write('h4321, 'h56);
					read('h8aaa, 'h56);

					write('hff26, 'h80);

					begin
						int j;
						j = 'h01;
						for (int i = 'hff30; i < 'hff40; i++) begin
							write(i, j);
							j += 'h22;
						end
					end

					write('hfe00, 'ha4);
					write('hfe01, 'hb5);
					write('hfe02, 'hc6);
					write('hfe03, 'hd7);
					write('h8000, 'h4a);
					write('h8001, 'h5b);
					write('h8002, 'h6c);
					write('h8003, 'h7d);
					read('hfe00, 'h56);
					read('hfe01, 'h56);
					read('hfe02, 'h56);
					read('hfe03, 'h56);
					read('h8000, 'h56);
					read('h8001, 'h56);
					read('h8002, 'h56);
					read('h8003, 'h56);

//					for (int i = 0; i < 160; i++)
//						write('hfe00 + i, 0);
//					for (int i = 0; i < 8192; i++)
//						write('h8000 + i, 0);

					write('hff47, 'he4);
					write('hff48, 'he4);
					write('hff49, 'h1b);
					write('hff40, 'h83);

					write('hff10, 'h00);
					write('hff11, 'h80);
					write('hff12, 'hf3);
					write('hff16, 'h80);
					write('hff17, 'hf3);
					write('hff1a, 'h80);
					write('hff1b, 'h00);
					write('hff1c, 'h20);
					write('hff20, 'h00);
					write('hff21, 'hf3);
					write('hff25, 'hff);
					write('hff24, 'h77);
					write('hff13, 'h83);
					write('hff14, 'h87);
					write('hff18, 'h83);
					write('hff19, 'h87);
					write('hff22, 'h13);
					write('hff23, 'h80);
					write('hff1d, 'h83);
					write('hff1e, 'h87);
					for (int i = 0; i < 100000; i++)
						nop();
					write('hff13, 'hc1);
					write('hff14, 'h87);
					write('hff18, 'hc1);
					write('hff19, 'h87);
					write('hff1d, 'hc1);
					write('hff1e, 'h87);

					for (int j = 0; j < 10; j++) begin
						for (int i = 0; i < 22000; i++)
							nop();
						write('hff42, j);
						for (int i = 0; i < 22000; i++)
							nop();
						write('hff43, j);
					end
					for (int i = 0; i < 1000000; i++)
						nop();

					/* TODO: Address lines must change when accessing 0xFExx or 0xFFxx */

					nop;
					nop;

					disable tick_tick;
					disable video_dump;
				end
			join

			$finish;
		end
	endprogram

endmodule
