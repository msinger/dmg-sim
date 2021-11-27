`default_nettype none

/* Not sure about these things, so make them easily switchable for testing: */
parameter bit dff_inv_clk   = 0; /* DFF clock input is inverted? */
parameter bit dffra_inv_clk = 0; /* DFFR Variant A clock input is inverted? */
parameter bit dffrc_inv_clk = 0; /* DFFR Variant C clock input is inverted? */
parameter bit xi_in_inv     = 1; /* XI clock input is inverting? */

module dmg;

	function automatic logic bidir_out(input logic drv_low, ndrv_high);
		if ($isunknown(drv_low) || $isunknown(ndrv_high))
			bidir_out = 'x;
		else if (drv_low == ndrv_high)
			bidir_out = !drv_low;
		else if (drv_low)
			bidir_out = 'x;
		else
			bidir_out = 'z;
	endfunction

	logic xo, xi; /* XI, XO clock pins */
	logic t1, t2; /* T1, T2 test pins */
	logic nrst;   /* !RST reset pin */
	logic phi;    /* PHI pin */
	logic nrd;    /* !RD pin */
	logic nwr;    /* !WR pin */
	logic ncs;    /* !CS pin */
	assign xi  = xo;
	assign phi = !nphi_out;
	assign nrd = bidir_out(rd_c, rd_a);
	assign nwr = bidir_out(wr_c, wr_a);
	assign ncs = !cs_out;

	tri logic nmoe; /* !MOE pin */
	tri logic nmwr; /* !MWR pin */
	tri logic nmcs; /* !MCS pin */
	assign nmoe = bidir_out(moe_d, moe_a);
	assign nmwr = bidir_out(mwr_d, mwr_a);
	assign nmcs = bidir_out(mcs_d, mcs_a);

	tri logic [7:0] d_pin;          /* D0-D7 pins */
	logic     [7:0] d_pin_ext = 'z; /* Value driven externally onto the pins if not 'z */
	logic     [7:0] d_pin_drv;      /* Value driven internally onto the pins if not 'z */
	generate
		for (genvar i = 0; i < 8; i++)
			assign d_pin_drv[i] = bidir_out(d_d[i], d_a[i]);
	endgenerate
	assign (pull1, highz0) d_pin = {8{!lula}};
	assign                 d_pin = d_pin_ext;
	assign                 d_pin = d_pin_drv;

	tri logic [7:0] md_pin; /* MD0-MD7 pins */
	generate
		for (genvar i = 0; i < 8; i++)
			assign md_pin[i] = bidir_out(md_out[i], md_a[i]);
	endgenerate
	assign (pull1, highz0) md_pin = {8{!md_b}};

	tri logic [15:0] a_pin; /* A0-A15 pins */
	generate
		for (genvar i = 0; i < 16; i++)
			assign a_pin[i] = bidir_out(a_d[i], a_a[i]);
	endgenerate

	logic [12:0] ma_pin; /* MA0-MA12 pins */
	assign ma_pin = ~nma_out;

	logic     sout; /* SOUT pin */
	tri logic sin;  /* SIN pin */
	tri logic sck;  /* SCK pin */
	assign                 sout = nsout;
	assign                 sin  = bidir_out(sin_d, sin_a);
	assign                 sck  = bidir_out(sck_d, sck_a);
	assign (pull1, highz0) sin  = !sin_b;
	assign (pull1, highz0) sck  = !sck_dir;

	tri logic p10; /* P10 pin */
	tri logic p11; /* P11 pin */
	tri logic p12; /* P12 pin */
	tri logic p13; /* P13 pin */
	logic     p14; /* P14 pin */
	logic     p15; /* P15 pin */
	assign                 p10  = bidir_out(p10_d, p10_a);
	assign                 p11  = bidir_out(p11_d, p11_a);
	assign                 p12  = bidir_out(p12_d, p12_a);
	assign                 p13  = bidir_out(p13_d, p13_a);
	assign                 p14  = bidir_out(p14_b, p14_a);
	assign                 p15  = bidir_out(p15_b, p15_a);
	assign (pull1, highz0) p10  = !p10_b;
	assign (pull1, highz0) p11  = !p11_b;
	assign (pull1, highz0) p12  = !p12_b;
	assign (pull1, highz0) p13  = !p13_b;

	task automatic xi_tick();
		#122ns xo = xo_ena ? !xi : 0;
	endtask

	task automatic cyc(input int num);
		int i;
		if (xi)
			xi_tick();
		for (i = 0; i < num * 2; i++)
			xi_tick();
	endtask

	/* CPU I/Os labeled like here: http://iceboy.a-singer.de/doc/dmg_cpu_connections.html */
	logic cpu_out_t1;     /* CPU out T1  */
	logic cpu_clkin_t2;   /* CPU in  T2  */
	logic cpu_clkin_t3;   /* CPU in  T3  */
	logic cpu_clkin_t4;   /* CPU in  T4  */
	logic cpu_clkin_t5;   /* CPU in  T5  */
	logic cpu_clkin_t6;   /* CPU in  T6  */
	logic cpu_clkin_t7;   /* CPU in  T7  */
	logic cpu_clkin_t8;   /* CPU in  T8  */
	logic cpu_clkin_t9;   /* CPU in  T9  */
	logic cpu_clkin_t10;  /* CPU in  T10 */
	logic cpu_clk_ena;    /* CPU out T11 */
	logic cpu_in_t12;     /* CPU in  T12 */
	logic reset;          /* CPU in  T13  (inverted !RST pin) */
	logic xo_ena;         /* CPU out T14 */
	logic cpu_in_t15;     /* CPU in  T15 */
	logic cpu_in_t16 = 1; /* CPU in  T16 */
	logic cpu_raw_rd;     /* CPU out R1  */
	logic cpu_raw_wr;     /* CPU out R2  */
	logic t1_nt2;         /* CPU in  R3  */
	logic cpu_in_r4;      /* CPU in  R4  */
	logic cpu_in_r5;      /* CPU in  R5  */
	logic nt1_t2;         /* CPU in  R6  */
	logic cpu_out_r7;     /* CPU out R7  */
	logic cpu_irq0_ack;   /* CPU out R14 */
	logic cpu_irq0_trig;  /* CPU in  R15 */
	logic cpu_irq1_ack;   /* CPU out R16 */
	logic cpu_irq1_trig;  /* CPU in  R17 */
	logic cpu_irq2_ack;   /* CPU out R18 */
	logic cpu_irq2_trig;  /* CPU in  R19 */
	logic cpu_irq3_ack;   /* CPU out R20 */
	logic cpu_irq3_trig;  /* CPU in  R21 */
	logic cpu_irq4_ack;   /* CPU out R22 */
	logic cpu_irq4_trig;  /* CPU in  R23 */
	logic [7:0]  cpu_d;   /* CPU I/O B1-B8  */
	logic [15:0] cpu_a;   /* CPU out B9-B24 */
	logic        cpu_drv_d, cpu_drv_a;
	logic cpu_wakeup;     /* CPU in  B25 */
	assign cpu_clkin_t2  = to_cpu;
	assign cpu_clkin_t3  = bedo;
	assign cpu_clkin_t4  = beko;
	assign cpu_clkin_t5  = nphi_out;
	assign cpu_clkin_t6  = bolo;
	assign cpu_clkin_t7  = from_cpu5;
	assign cpu_clkin_t8  = buke;
	assign cpu_clkin_t9  = boma;
	assign cpu_clkin_t10 = boga1mhz;
	assign cpu_in_t12    = afer;
	assign cpu_in_t15    = taba;
	assign cpu_in_r4     = syro;
	assign cpu_in_r5     = tutu;
	assign reset         = !nrst;
	assign d             = cpu_drv_d ? cpu_d : 'z;
	assign a             = cpu_drv_a ? cpu_a : 'z;
	assign cpu_wakeup    = to_cpu2;

	/* CPU must not drive data bus when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high,
	 * otherwise it collides with 0xff driven on the right side of page 5. */
	assign cpu_drv_d = !reset && !cpu_in_t12 && cpu_raw_wr && cpu_clkin_t3 && !cpu_clkin_t2;

	assign cpu_raw_rd = !reset && !cpu_in_t12 && read_cycle;

	/* CPU must release WR when cpu_clkin_t3 (BEDO) is low or cpu_clkin_t2 (BOWA) is high. This
	 * allows the RD signal to be asserted between the cycles for half a tick, like it is seen
	 * on the cartridge connector. */
	// TODO: Figure out if cpu_out_r7 (FROM_CPU4) has to do the same thing.
	assign cpu_raw_wr = !reset && !cpu_in_t12 && write_cycle && cpu_clkin_t3 && !cpu_clkin_t2;

	/* CPU must raise cpu_out_r7 during mem cycles that are targeting external busses. It must not
	 * raise it when accessing FExx and FFxx (cpu_in_r4). */
	// TODO: Figure out if 00xx while boot ROM is visible (cpu_in_r5) is also an exception.
	assign cpu_out_r7 = !reset && !cpu_in_t12 && mem_cycle && !cpu_in_r4;

	logic read_cycle;
	logic write_cycle;
	logic mem_cycle;

	task automatic write(input logic [15:0] adr, logic [7:0] data);
		@(posedge cpu_clkin_t3);
		mem_cycle   = 1;
		cpu_a       = adr;
		cpu_d       = '1;
		write_cycle = 1;
		@(posedge cpu_clkin_t5);
		cpu_d       = data;
		@(posedge cpu_clkin_t2);
		write_cycle = 0;
		mem_cycle   = 0;
		if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
			cpu_a[15:8] = 0;
	endtask

	task automatic read(input logic [15:0] adr, logic [7:0] data);
		@(posedge cpu_clkin_t3);
		mem_cycle    = 1;
		cpu_a        = adr;
		read_cycle   = 1;
		fork
			begin :drive_data_after_chip_select
				@(negedge ncs, negedge a_pin[15]); /* Wait for any of the two chip selects */
				#4ns
				d_pin_ext    = data;
			end
			begin
				@(posedge cpu_clkin_t2);
				d_pin_ext    = 'z;
				read_cycle   = 0;
				mem_cycle    = 0;
				if (!cpu_in_r4 && !cpu_in_r5) /* Higher address byte is supposed to go low after external memory access */
					cpu_a[15:8] = 0;
				disable drive_data_after_chip_select;
			end
		join
	endtask

	task automatic nop;
		@(posedge cpu_clkin_t3);
		@(posedge cpu_clkin_t2);
	endtask

	task automatic write_snd_file_header(input int f, samplerate, channels, bit bit16);
		$fwrite(f, ".snd");
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'd32);
		$fwrite(f, "%c%c%c%c", 8'hff, 8'hff, 8'hff, 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, bit16 ? 8'h03 : 8'h02);
		$fwrite(f, "%c", (samplerate >> 24) & 8'hff);
		$fwrite(f, "%c", (samplerate >> 16) & 8'hff);
		$fwrite(f, "%c", (samplerate >> 8) & 8'hff);
		$fwrite(f, "%c", samplerate & 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, channels & 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'h00);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'h00);
	endtask

	int fch[1:4];
	int fmix;

	initial begin
		$dumpfile("dmg.vcd");
		$dumpvars(0, dmg);

		t1   = 0;
		t2   = 0;
		xo   = 0;
		nrst = 0;

		cpu_out_t1   = 0;
		cpu_clk_ena  = 0;
		xo_ena       = 1;
		read_cycle   = 0;
		write_cycle  = 0;
		mem_cycle    = 0;
		cpu_irq0_ack = 0;
		cpu_irq1_ack = 0;
		cpu_irq2_ack = 0;
		cpu_irq3_ack = 0;
		cpu_irq4_ack = 0;
		cpu_d        = 0;
		cpu_drv_a    = 1;
		cpu_a        = 0;

		cyc(64);
		nrst = 1;

		for (int i = 1; i <= 4; i++) begin
			string filename;
			$sformat(filename, "ch%0d.snd", i);
			fch[i] = $fopen(filename, "wb");
			write_snd_file_header(fch[i], 65536, 1, 0);
		end
		fmix = $fopen("out.snd", "wb");
		write_snd_file_header(fmix, 65536, 2, 1);

		fork
			begin :tick_tick
				int tmp;
				forever begin
					cyc(64);
					$fwrite(fch[1], "%c", { 1'b0, ch1_out, 3'b0 });
					$fwrite(fch[2], "%c", { 1'b0, ch2_out, 3'b0 });
					$fwrite(fch[3], "%c", { 1'b0, wave_dac_d, 3'b0 });
					$fwrite(fch[4], "%c", { 1'b0, ch4_out, 3'b0 });
					tmp = $rtoi(lout_pin * 32767.0);
					$fwrite(fmix, "%c%c", { 1'b0, tmp[14:8] }, tmp[7:0]);
					tmp = $rtoi(rout_pin * 32767.0);
					$fwrite(fmix, "%c%c", { 1'b0, tmp[14:8] }, tmp[7:0]);
				end
			end

			begin
				/* CPU needs to wait for cpu_in_t15 before enabling cpu_clk_ena, otherwise
				 * peripheral resets won't deassert. */
				while (!cpu_clk_ena) @(posedge cpu_clkin_t10)
					if (cpu_in_t15)
						cpu_clk_ena = 1;

				nop;
				nop;

				read('hff00, 'h56);
				read('h1000, 'h56);
				read('hff00, 'h56);
				write('hff00, 'h56);
				read('h0055, 'h56);
				write('h00aa, 'h56);
				read('h1234, 'h56);
				write('h4321, 'h56);
				read('h8aaa, 'h56);

				/* TODO: Address lines must not change when accessing boot ROM or video RAM, but they do. */

				nop;
				nop;

				disable tick_tick;
			end
		join

		$finish;
	end

	tri logic  [7:0]  d;
	tri0 logic [15:0] a;
	tri0 logic [7:0]  md, oam_a_nd, oam_b_nd;
	tri0 logic [12:0] nma;
	logic      [7:0]  oam_a;

	/* Icarus doesn't support trireg, so we do it like this: */
	logic [7:0] d_cap = 'z;
	always @(d) d_cap = d;
	assign (weak1, weak0) d = d_cap;

	logic [7:0]  d_a, d_in, d_d, md_a, md_in, md_out;
	logic [15:0] a_a, a_c, a_d, dma_a;
	logic [12:0] nma_out;
	assign d_in  = ~d_pin;
	assign md_in = ~md_pin;
	assign a_c   = ~a_pin;

	logic wr_a, wr_in, wr_c, rd_a, rd_b, rd_c;
	logic moe_a, moe_in, moe_d, mwr_a, mwr_in, mwr_d, mcs_a, mcs_in, mcs_d, md_b;
	assign wr_in  = !nwr;
	assign rd_b   = !nrd;
	assign moe_in = !nmoe;
	assign mwr_in = !nmwr;
	assign mcs_in = !nmcs;

	/* not yet generated signals */
	assign atej = 0;
	assign sylo = 0;
	assign lesy = 0;
	assign lota = 0;
	assign lyku = 0;
	assign roby = 0;
	assign tyta = 0;
	assign tyco = 0;
	assign soka = 0;
	assign xovu = 0;

	logic clk1, clk2, clk3, clk4, clk5;

	logic cpu_wr, cpu_wr2;
	logic cpu_rd, cpu_rd2;
	logic cpu_rd_sync; /* this is wrongly labeled in the schematics; it is actually WR sync */
	logic t1t2_nrst;
	logic ff04_ff07, nff0f_rd, nff0f_wr, ff00wr, ff00rd;
	logic nff04_d0, nff04_d1;
	logic apu_wr, ncpu_rd;
	logic hram_cs, boot_cs, cs_out;
	logic to_cpu, to_cpu2;
	logic from_cpu5; /* this is wrongly labeled in the schematics; it is actually a CPU input */

	logic clkin_a, clkin_b;
	assign clkin_a = xo_ena;
	assign clkin_b = xi_in_inv ? !xi : xi;

	logic from_cpu3, from_cpu4, from_cpu6, clk_from_cpu;
	assign from_cpu3    = cpu_raw_wr;
	assign from_cpu4    = cpu_out_r7;
	assign from_cpu6    = cpu_out_t1;
	assign clk_from_cpu = cpu_clk_ena;

	logic nt1, nt2;
	assign nt1 = !t1;
	assign nt2 = !t2;

	logic nreset2, nreset6, reset7, nreset7, nreset8, nreset9;
	logic reset_video, nreset_video, reset_video2, nreset_video2, reset_video3;
	logic nphi_out, phi_out, dova_phi;

	logic nsout, sin_a, sin_b, sin_in, sin_d, sck_a, sck_dir, sck_in, sck_d;
	logic p10_a, p10_b, p10_c, p10_d, p11_a, p11_b, p11_c, p11_d, p12_a, p12_b, p12_c, p12_d, p13_a, p13_b, p13_c, p13_d;
	logic p14_a, p14_b, p15_a, p15_b;
	assign sin_in = !sin;
	assign sck_in = !sck;
	assign p10_c  = !p10;
	assign p11_c  = !p11;
	assign p12_c  = !p12;
	assign p13_c  = !p13;

	logic dma_run, vram_to_oam, dma_addr_ext, oam_addr_ndma;
	logic caty, wyja, mopa_nphi;
	logic tovy_na0, tola_na1;

	logic ff60_d1, ff60_d0;
	logic ff26, ff3x, namp_en;

	logic int_serial, int_timer;
	logic ser_out;

	logic apu_reset, net03;
	logic napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6;
	logic apuv_4mhz, amuk_4mhz;
	logic ajer_2mhz, cery_2mhz;
	logic boga1mhz, bavu_1mhz;
	logic byfe_128hz, bufy_256hz, horu_512hz, butu_512khz, jeso_512k, hama_512k, dyfa_1mhz;
	logic afas, fero_q, cate, gaxo, bedo, abuz, tutu, texo, roru, lula, anap, duce, cota, wuko, copu, atys;
	logic abol, ngexu, cope, kyly, adad, elox_q, anuj, doca, cogu, erog, dera, gypa, beny, ngugu, gara;
	logic nkeno, nkafo, nkepa, nkygu, nkemu, nkunu, nkupe, nkutu, njapu, nkeza, nkeju;
	logic buke, gase, efar_q, fugo_q, beko, bolo, boma, afer, taba, syro;
	logic ch1_restart, ch1_shift_clk, ch1_ld_shift, ch1_freq_upd1, ch1_freq_upd2;
	logic ch2_ftick;
	logic nch1_active, nch1_amp_en;
	logic nch2_active, nch2_amp_en;
	logic ch3_active, nch3_active;
	logic ch4_restart;
	logic nch4_active, nch4_amp_en;
	logic _16384hz, _65536hz, _262144hz;

	logic talu, xyvo, nnype, wodu, napo, PURE, sela, nxymu;
	logic wuvu_nq, fepo, tofu, avap, pova, acyl, atej;
	logic waru, xare, mosu, lyry, myvo, sylo, roxy;
	logic loby, nyka, pory, tomu, poky, roxo, segu;
	logic pore, potu, neta, xuha, lesy, lota;
	logic lyku, roby, tyta, tyco, soka, xovu, vava;
	logic wuty, seca, nyxu, vyno, vujo, vymu, mofu;
	logic lena, nydy, myma, xupy, catu, tuvo, tyfo_nq;
	logic xoce, abez, weza, wuco, wyda, zysu, wyse, wuzy;
	logic anom, feto, besu, amab, azyb, byva, leko;
	logic ynaz, ykok, zure, ywos, ekes, cehu, ewam, cyvy, zako, xeba;
	logic ylev, ytub, feha, dama, cyco, daje, ydot, ywap, fyma, cogy;
	logic wenu, cucu, cuca, cega;
	logic fado, deny, gugy, xyme, gygy, gowo, gyma, fame, dydo, furo;
	logic dosy, wuzo, gafy, xaho, ejad, wunu, wupa, gamy, doku, dyna;
	logic texy, dege, daby, dabu, gysa, xyso;
	logic buza, tacu, xefy, xono, xado, puco;
	logic cacu, buzy, fuke, zape, wuse, zuru, fefo, gecy, wabe;
	logic feka, xyha, yfag, cexu, akol, bymy, fuxu, enob, geny;
	logic weme, wufa, faka, cyla, dymo, bucy, wofo, wylu, ewot;
	logic asys, ahof, byvy, ngomo, nbaxo, nyzos, ndepo;
	logic rawu, pyzo, pulo, powy, pozo, poxa, poju, pyju;

	logic oam_clk, oam_a_cpu_nrd, oam_b_cpu_nrd, oam_a_ncs, oam_b_ncs;

	logic ffxx, nffxx, nfexxffxx, a00_07, saro;
	logic ff10, ff11, ff12, ff13, ff14, ff16, ff17, ff18, ff19, ff1a;
	logic ff1b, ff1c, ff1d, ff1e, ff20, ff21, ff22, ff23, ff24, ff25;
	logic ff40, ff41, ff42, ff43, ff44, ff45;
	logic ff46, ff47, ff48, ff49, ff4a, ff4b;
	logic nff10_d0, nff10_d1, nff10_d2, nff10_d3, nff10_d4, nff10_d5, nff10_d6;
	logic ff11_d6, ff11_d7, nff11_d6, nff11_d7;
	logic ff12_d0, ff12_d1, ff12_d2, ff12_d3, ff12_d4, ff12_d5, ff12_d6, ff12_d7;
	logic nff12_d0, nff12_d1, nff12_d2, nff12_d3;
	logic ff14_d6, nff14_d6;
	logic nff16_wr, ff16_d6, nff16_d6, ff16_d7, nff16_d7;
	logic ff17_d0, nff17_d0, ff17_d1, nff17_d1, ff17_d2, nff17_d2;
	logic ff17_d3, nff17_d3, ff17_d4, ff17_d5, ff17_d6, ff17_d7;
	logic ff19_d6, nff19_d6, ff19_d7;
	logic nff1a_d7, ff1b_wr1, ff1b_wr2, ff1b_wr3;
	logic ff1c_d5, nff1c_d5, ff1c_d6, nff1c_d6;
	logic ff1d_d0, ff1d_d1, ff1d_d2, ff1d_d3, ff1d_d4, ff1d_d5, ff1d_d6, ff1d_d7;
	logic ff1e_d0, ff1e_d1, ff1e_d2, ff1e_d6, nff1e_d6;
	logic ff21_d0, nff21_d0, ff21_d1, nff21_d1, ff21_d2, nff21_d2;
	logic ff21_d3, nff21_d3, ff21_d4, ff21_d5, ff21_d6, ff21_d7;
	logic nff22_d0, nff22_d1, nff22_d2, ff22_d3, nff22_d3, ff22_d4, nff22_d4;
	logic ff22_d5, nff22_d5, ff22_d6, nff22_d6, ff22_d7;
	logic ff23_d6, ff23_d7, rst_ff23_d7;
	logic ff40_d0, ff40_d1, ff40_d2, ff40_d3, ff40_d4, ff40_d5, ff40_d6, ff40_d7;
	logic ff42_d0, ff42_d1, ff42_d2, ff42_d3, ff42_d4, ff42_d5, ff42_d6, ff42_d7;
	logic ff43_d0, ff43_d1, ff43_d2, ff43_d3, ff43_d4, ff43_d5, ff43_d6, ff43_d7;
	logic ff45_d0, ff45_d1, ff45_d2, ff45_d3, ff45_d4, ff45_d5, ff45_d6, ff45_d7;
	logic ff4a_d0, ff4a_d1, ff4a_d2, ff4a_d3, ff4a_d4, ff4a_d5, ff4a_d6, ff4a_d7;
	logic ff4b_d0, ff4b_d1, ff4b_d2, ff4b_d3, ff4b_d4, ff4b_d5, ff4b_d6, ff4b_d7;

	logic l113, int_vbl, int_vbl_buf, int_stat, clkpipe;
	logic bg_pix_a_7, bg_pix_b_7;

	logic pin_cpg, cp, pin_cpl, pin_fr, pin_st, pin_s;

	logic [7:0] v, h, nh;
	logic [7:0] bgp_d, obp0_d, obp1_d;

	logic [10:0] acc_d;
	logic [3:0]  wave_play_d;
	logic        wave_ram_rd;

	/* connections to analog parts */
	logic [3:0] lmixer, rmixer;
	logic [3:0] ch1_out, ch2_out, wave_dac_d, ch4_out;
	logic [2:0] nlvolume, nrvolume;
	logic       vin_l_ena, vin_r_ena;

	/* simulate analog input */
	real vin_pin;
	assign vin_pin = 0.0;

	/* simulate analog parts */
	real ch1_fp, ch2_fp, ch3_fp, ch4_fp;
	real lvol_fp, rvol_fp;
	real lmix, rmix;
	real lout_pin, rout_pin;
	assign ch1_fp = $itor(ch1_out) / 15.0;
	assign ch2_fp = $itor(ch2_out) / 15.0;
	assign ch3_fp = $itor(wave_dac_d) / 15.0;
	assign ch4_fp = $itor(ch4_out) / 15.0;
	assign lvol_fp = $itor(~nlvolume) / 7.0;
	assign rvol_fp = $itor(~nrvolume) / 7.0;
	assign lmix = (lmixer[0] ? ch1_fp * 0.7 : 0.0) +
	              (lmixer[1] ? ch2_fp * 0.7 : 0.0) +
	              (lmixer[2] ? ch3_fp * 0.7 : 0.0) +
	              (lmixer[3] ? ch4_fp * 0.7 : 0.0) +
	              (vin_l_ena ? vin_pin * 0.7 : 0.0);
	assign rmix = (rmixer[0] ? ch1_fp * 0.7 : 0.0) +
	              (rmixer[1] ? ch2_fp * 0.7 : 0.0) +
	              (rmixer[2] ? ch3_fp * 0.7 : 0.0) +
	              (rmixer[3] ? ch4_fp * 0.7 : 0.0) +
	              (vin_r_ena ? vin_pin * 0.7 : 0.0);
	assign lout_pin = (lmix * lvol_fp > 1.0) ? 1.0 : (lmix * lvol_fp);
	assign rout_pin = (rmix * rvol_fp > 1.0) ? 1.0 : (rmix * rvol_fp);

	/* connections to wave RAM */
	logic [7:0] wave_rd_d;      /* data output (data input is directly connected to common d[7:0]) */
	logic [3:0] wave_a;         /* address */
	logic       wave_ram_ctrl1; /* !CS */
	logic       nwave_ram_wr;   /* !WR */
	logic       atok;           /* !OE */

	logic [7:0] wave_ram[0:15];
	initial foreach (wave_ram[i]) wave_ram[i] = $random;
	always_ff @(posedge nwave_ram_wr) if (!wave_ram_ctrl1) wave_ram[wave_a] <= d;
	always_latch if (!wave_ram_ctrl1 && !atok) wave_rd_d = wave_ram[wave_a];
	// TODO: The very first sample (high nibble of FF30) gets skipped when CH3 is started. Check if this is correct.
	// TODO: When reading the next byte from wave RAM (for example FF31), the previous sample (high nibble of FF30)
	//       gets output for a very short time before the next sample (high nibble of FF31) gets output. Check if correct.

	clocks_reset           p1_clocks_reset(.*);
	interrupts             p2_interrupts(.*);
	timer                  p3_timer(.*);
	dma                    p4_dma(.*);
	joypad_io              p5_joypad_io(.*);
	serial_link            p6_serial_link(.*);
	sys_decode             p7_sys_decode(.*);
	ext_cpu_busses         p8_ext_cpu_busses(.*);
	apu_control            p9_apu_control(.*);
	apu_decode             p10_apu_decode(.*);
	ch1_regs               p11_ch1_regs(.*);
	ch1_sweep              p12_ch1_sweep(.*);
	channel1               p13_channel1(.*);
	ch2_regs               p14_ch2_regs(.*);
	channel2               p15_channel2(.*);
	ch3_regs               p16_ch3_regs(.*);
	wave_ram               p17_wave_ram(.*);
	channel3               p18_channel3(.*);
	ch4_regs               p19_ch4_regs(.*);
	channel4               p20_channel4(.*);
	video_control          p21_video_control(.*);
	ppu_decode             p22_ppu_decode(.*);
	video_regs             p23_video_regs(.*);
	lcd_control            p24_lcd_control(.*);
	vram_interface         p25_vram_interface(.*);
	background             p26_background(.*);
	window_map_lookup      p27_window_map_lookup(.*);
	oam                    p28_oam(.*);
	sprite_control         p29_sprite_control(.*);
	sprite_store           p30_sprite_store(.*);
	sprite_x_matchers      p31_sprite_x_matchers(.*);
	bg_pixel_shifter       p32_bg_pixel_shifter(.*);
	palettes               p36_palettes(.*);

	/* for convinience */
	logic [15:0] div16;
	logic [7:0]  div8;
	logic [7:0]  reg_ff00;
	assign div16[0]  = p1_clocks_reset.ukup;
	assign div16[1]  = p1_clocks_reset.ufor;
	assign div16[2]  = p1_clocks_reset.uner;
	assign div16[3]  = p1_clocks_reset.tero;
	assign div16[4]  = p1_clocks_reset.unyk;
	assign div16[5]  = p1_clocks_reset.tama;
	assign div16[6]  = p1_clocks_reset.ugot;
	assign div16[7]  = p1_clocks_reset.tulu;
	assign div16[8]  = p1_clocks_reset.tugo;
	assign div16[9]  = p1_clocks_reset.tofe;
	assign div16[10] = p1_clocks_reset.teru;
	assign div16[11] = p1_clocks_reset.sola;
	assign div16[12] = p1_clocks_reset.subu;
	assign div16[13] = p1_clocks_reset.teka;
	assign div16[14] = p1_clocks_reset.uket;
	assign div16[15] = p1_clocks_reset.upof;
	assign div8 = div16[13:6];
	assign reg_ff00[0]   = p5_joypad_io.kema;
	assign reg_ff00[1]   = p5_joypad_io.kuro;
	assign reg_ff00[2]   = p5_joypad_io.kuve;
	assign reg_ff00[3]   = p5_joypad_io.jeku;
	assign reg_ff00[4]   = p5_joypad_io.koce;
	assign reg_ff00[5]   = p5_joypad_io.cudy;
	assign reg_ff00[7:6] = '1;
endmodule
