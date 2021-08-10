`default_nettype none

module dmg;

	int   cyc;
	logic xi;
	logic clkin_a, clkin_b;
	logic reset; /* inverted !RST pin */
	logic t1 = 0;
	logic t2 = 0;
	assign clkin_a = cyc >= 2;
	assign clkin_b = xi;
	assign reset = cyc >= 40 && cyc <= 80;

	initial begin
		$dumpfile("dmg.vcd");
		$dumpvars(0, dmg);

		xi = 0;

		for (cyc = 0; cyc < 20000; cyc++)
			#122ns xi = !xi;

		$finish;
	end

	tri1 logic [7:0]  d, md, oam_a_d, oam_b_d;
	tri0 logic [15:0] a;
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
	logic cpu_raw_rd = 0;
	logic cpu_wr_raw = 0;
	logic p10_c = 0;
	logic p11_c = 0;
	logic p12_c = 0;
	logic p13_c = 0;
	logic sin_in = 0;
	logic sck_in = 0;
	logic ff40_d7 = 0;
	logic from_cpu = 0;
	logic from_cpu3 = 1;
	logic from_cpu4 = 0;
	logic from_cpu5 = 0;
	logic from_cpu6 = 0;
	logic clk_from_cpu = 1;
	logic ff46 = 0;
	logic ff40_d4 = 0;
	logic amab = 0;
	logic nff1a_d7 = 1;
	logic nch2_amp_en = 1;
	logic nch4_amp_en = 1;
	logic nch2_active = 1;
	logic nch3_active = 1;
	logic nch4_active = 1;
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
	logic cpu_irq0_ack = 0;
	logic cpu_irq1_ack = 0;
	logic cpu_irq2_ack = 0;
	logic cpu_irq3_ack = 0;
	logic cpu_irq4_ack = 0;

	logic clk1;

	logic cpu_wr, cpu_wr2;
	logic cpu_rd, cpu_rd2;
	logic cpu_rd_sync;
	logic nt1_nt2, nt1_t2, t1_nt2;
	logic ff04_ff07, nff0f_rd, nff0f_wr, ff00wr, ff00rd;
	logic nff04_d0, nff04_d1;
	logic apu_wr, ncpu_rd;
	logic hram_cs, boot_cs, ncs_out;
	logic to_cpu, to_cpu2, to_cpu_tutu;
	logic cpu_irq0_trig, cpu_irq1_trig, cpu_irq2_trig, cpu_irq3_trig, cpu_irq4_trig;

	logic nreset2, nreset6;
	logic nphi_out, nphi;

	logic sout, sin_a, sin_b, sin_d, sck_a, sck_dir, sck_d;
	logic p10_a, p10_b, p10_d, p11_a, p11_b, p11_d, p12_a, p12_b, p12_d, p13_a, p13_b, p13_d;
	logic p14_a, p14_b, p15_a, p15_b;

	logic dma_run, vram_to_oam, dma_addr_ext, oam_addr_dma;
	logic caty, wyja, mopa_phi;
	logic tovy_na0, tola_na1;

	logic ff60_d1, ff60_d0;
	logic ff26, ff3x, namp_en;

	logic int_serial, int_timer;
	logic ser_out;

	logic apu_reset, net03;
	logic napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6;
	logic apuv_4mhz;
	logic ajer_2mhz;
	logic boga1mhz;
	logic byfe_128hz, bufy_256hz, horu_512hz, dyfa_1mhz;
	logic afas, fero_q, cate, gaxo, bedo, abuz, tutu, texo, roru, lula, anap, duce, cota, wuko, copu, atys;
	logic abol, gexu, cope, kyly, adad, elox_q, anuj, doca, cogu, erog, dera, gypa;
	logic ch1_restart, ch1_shift_clk, ch1_ld_shift, ch1_freq_upd1, ch1_freq_upd2;
	logic ch2_ftick;
	logic nch1_active, nch1_amp_en;
	logic _16384hz, _65536hz, _262144hz;

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

	logic [10:0] acc_d;
	logic [3:0]  lmixer, rmixer;
	logic [3:0]  ch1_out;

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
	vram_interface p25_vram_interface(.*);

endmodule
