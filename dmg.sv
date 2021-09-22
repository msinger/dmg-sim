`default_nettype none

module dmg;

	logic xo, xi; /* XI, XO clock pins */
	logic t1, t2; /* T1, T2 test pins */
	logic nrst;   /* !RST reset pin */
	logic phi;    /* PHI pin */
	assign xi  = xo;
	assign phi = !nphi_out;

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
		cpu_raw_rd   = 0;
		cpu_raw_wr   = 0;
		cpu_out_r7   = 0;
		cpu_irq0_ack = 0;
		cpu_irq1_ack = 0;
		cpu_irq2_ack = 0;
		cpu_irq3_ack = 0;
		cpu_irq4_ack = 0;
		cpu_drv_d    = 0;
		cpu_d        = 0;
		cpu_drv_a    = 1;
		cpu_a        = 0;

		cyc(256);
		cpu_d      = 'ha5;
		cpu_drv_d  = 1;
		cpu_raw_wr = 1;
		cyc(256);
		cpu_a      = 'h1000;
		cyc(256);
		cpu_out_r7 = 1;
		cyc(256);
		cpu_a      = 'h0000;
		cyc(256);
		cpu_raw_wr = 0;
		cpu_drv_d  = 0;

		cyc(20000);

		$finish;
	end

	tri0 logic [7:0]  d;
	tri0 logic [15:0] a;
	tri0 logic [7:0]  md, oam_a_nd, oam_b_nd;
	tri0 logic [12:0] ma;

	logic [7:0]  d_a, d_d, md_out, md_a;
	logic [15:0] a_a, a_d, dma_a;
	logic [12:0] ma_out;

	logic wr_a, wr_c, rd_a, rd_c;
	logic moe_a, moe_d, mwr_a, mwr_d, mcs_a, mcs_d, md_b;

	/* not yet generated signals */
	logic [7:0] d_in = '1;
	logic [7:0] md_in = '1;
	logic [15:0] a_c = '0;
	logic wr_in = 0;
	logic rd_b = 0;
	logic moe_in = 0;
	logic mwr_in = 0;
	logic mcs_in = 0;
	logic p10_c = 0;
	logic p11_c = 0;
	logic p12_c = 0;
	logic p13_c = 0;
	logic sin_in = 0;
	logic sck_in = 0;
	logic ff40_d7 = 0;
	logic ff46 = 0;
	logic ff40_d4 = 0;
	logic amab = 0;
	logic tacu = 0;
	logic tuvo = 0;
	logic acyl = 0;
	logic xyso = 0;
	logic texy = 0;
	logic myma = 0;
	logic lena = 0;
	logic xymu = 0;
	logic leko = 0;
	logic xuha = 0;
	logic vyno = 0;
	logic vujo = 0;
	logic vymu = 0;
	logic neta = 0;
	logic pore = 0;
	logic potu = 0;
	logic npyju = 1;
	logic npowy = 1;
	logic npoju = 1;
	logic npulo = 1;
	logic npoxa = 1;
	logic npyzo = 1;
	logic npozo = 1;
	logic nrawu = 1;
	logic int_vbl_buf = 0;
	logic int_stat = 0;

	logic clk1;

	logic cpu_wr, cpu_wr2;
	logic cpu_rd, cpu_rd2;
	logic cpu_rd_sync; /* this is wrongly labeled in the schematics; it is actually WR sync */
	logic t1t2_nrst;
	logic ff04_ff07, nff0f_rd, nff0f_wr, ff00wr, ff00rd;
	logic nff04_d0, nff04_d1;
	logic apu_wr, ncpu_rd;
	logic hram_cs, boot_cs, ncs_out;
	logic to_cpu, to_cpu2;
	logic from_cpu5; /* this is wrongly labeled in the schematics; it is actually a CPU input */

	logic clkin_a, clkin_b;
	assign clkin_a = xo_ena;
	assign clkin_b = !xi;

	logic from_cpu3, from_cpu4, from_cpu6, clk_from_cpu;
	assign from_cpu3    = cpu_raw_wr;
	assign from_cpu4    = cpu_out_r7;
	assign from_cpu6    = cpu_out_t1;
	assign clk_from_cpu = cpu_clk_ena;

	logic nt1, nt2;
	assign nt1 = !t1;
	assign nt2 = !t2;

	logic nreset2, nreset6;
	logic nphi_out, phi_out, dova_phi;

	logic sout, sin_a, sin_b, sin_d, sck_a, sck_dir, sck_d;
	logic p10_a, p10_b, p10_d, p11_a, p11_b, p11_d, p12_a, p12_b, p12_d, p13_a, p13_b, p13_d;
	logic p14_a, p14_b, p15_a, p15_b;

	logic dma_run, vram_to_oam, dma_addr_ext, oam_addr_dma;
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

	// TODO: lula controlls direction of external D0-7 pins?

	logic ffxx, nffxx, nfexxffxx, a00_07, saro;
	logic ff10, ff11, ff12, ff13, ff14, ff16, ff17, ff18, ff19, ff1a;
	logic ff1b, ff1c, ff1d, ff1e, ff20, ff21, ff22, ff23, ff24, ff25;
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

	logic [10:0] acc_d;
	logic [3:0]  wave_play_d;
	logic        wave_ram_rd;

	/* connections to audio DAC */
	logic [3:0] lmixer, rmixer;
	logic [3:0] ch1_out, ch2_out, wave_dac_d, ch4_out;

	/* connections to wave RAM */
	logic [7:0] wave_rd_d;      /* data output (data input is directly connected to common d[7:0]) */
	logic [3:0] wave_a;         /* address */
	logic       wave_ram_ctrl1; /* !CS */
	logic       nwave_ram_wr;   /* !WR */
	logic       atok;           /* !OE */

	logic [7:0] wave_ram[0:15];
	initial foreach (wave_ram[i]) wave_ram[i] = $random;
	always_ff @(negedge nwave_ram_wr) if (!wave_ram_ctrl1) wave_ram[wave_a] <= d;
	always_ff @(negedge atok) if (!wave_ram_ctrl1) wave_rd_d <= wave_ram[wave_a];

	clocks_reset   p1_clocks_reset(.*);
	interrupts     p2_interrupts(.*);
	timer          p3_timer(.*);
	dma            p4_dma(.*);
	joypad_io      p5_joypad_io(.*);
	serial_link    p6_serial_link(.*);
	sys_decode     p7_sys_decode(.*);
	ext_cpu_busses p8_ext_cpu_busses(.*);
	apu_control    p9_apu_control(.*);
	apu_decode     p10_apu_decode(.*);
	ch1_regs       p11_ch1_regs(.*);
	ch1_sweep      p12_ch1_sweep(.*);
	channel1       p13_channel1(.*);
	ch2_regs       p14_ch2_regs(.*);
	channel2       p15_channel2(.*);
	ch3_regs       p16_ch3_regs(.*);
	wave_ram       p17_wave_ram(.*);
	channel3       p18_channel3(.*);
	ch4_regs       p19_ch4_regs(.*);
	channel4       p20_channel4(.*);
	vram_interface p25_vram_interface(.*);

endmodule
