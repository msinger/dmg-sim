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
	real lout, rout;

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

	logic           clk;
	logic           reset;
	logic           ncyc;

	logic [15:0]    adr;
	logic [7:0]     din, dout;
	logic           rd;
	logic           wr;

	logic [7:0]     irq;
	logic [7:0]     iack;

	sm83 cpu(.*);

	assign ncyc       = !dmg.p1_clocks_reset.adyk && !dmg.p1_clocks_reset.alef;
	assign irq        = 0;
	assign cpu_a      = cpu_a_out;
	assign d          = cpu_drv_d ? cpu_d_out : 'z;
	assign din        = d;
	assign cpu_out_r7 = (cpu_raw_rd || cpu_raw_wr) && !cpu_in_r4 && !cpu_in_r5;

	logic        cpu_drv_d;
	logic [7:0]  cpu_d_out;
	logic [15:0] cpu_a_out;

	initial cpu_a_out  = 0;
	initial cpu_raw_rd = 0;
	initial cpu_raw_wr = 0;

	/* CPU must not drive data bus when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high,
	 * otherwise it collides with 0xff driven on the right side of page 5. */
	assign cpu_drv_d = cpu_raw_wr && cpu_clkin_t3 && !cpu_clkin_t2;

	always @(posedge cpu_clkin_t3) if (rd && !cpu_in_t12 && !cpu_in_t13) begin :read_cycle
		cpu_a_out  <= adr;
		cpu_raw_rd <= 1;
		@(posedge cpu_clkin_t2);
		cpu_raw_rd <= 0;
		if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
			cpu_a_out[15:8] <= 0;
	end

	always @(posedge cpu_clkin_t3) if (wr && !cpu_in_t12 && !cpu_in_t13) begin :write_cycle
		cpu_a_out  <= adr;
		cpu_d_out  <= '1;
		cpu_raw_wr <= 1;
		@(posedge cpu_clkin_t5);
		cpu_d_out  <= dout;
		@(posedge cpu_clkin_t2);
		cpu_raw_wr <= 0;
		if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
			cpu_a_out[15:8] <= 0;
	end

	always @(posedge cpu_clkin_t10, posedge cpu_in_t12, posedge cpu_in_t13) if (cpu_in_t12 || cpu_in_t13) begin
		disable read_cycle;
		disable write_cycle;
		cpu_raw_rd <= 0;
		cpu_raw_wr <= 0;
		cpu_a_out  <= 0;
	end

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
			reset = 1;

			cpu_out_t1   = 0;
			cpu_clk_ena  = 0;
			cpu_xo_ena   = 1;
			cpu_irq0_ack = 0;
			cpu_irq1_ack = 0;
			cpu_irq2_ack = 0;
			cpu_irq3_ack = 0;
			cpu_irq4_ack = 0;
			cpu_irq5_ack = 0;
			cpu_irq6_ack = 0;
			cpu_irq7_ack = 0;

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

					@(posedge cpu_clkin_t3);
					@(posedge cpu_clkin_t2);
					reset = 0;

					repeat (6000000) begin
						@(posedge cpu_clkin_t3);
						@(posedge cpu_clkin_t2);
					end

					disable tick_tick;
					disable video_dump;
				end
			join

			$finish;
		end
	endprogram

endmodule

