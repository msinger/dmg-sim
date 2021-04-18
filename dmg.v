`default_nettype none
`timescale 1ns/100ps

module dmg;

	reg [31:0] cyc;

	reg xi;
	wire clkin_a, clkin_b;
	wire reset; /* inverted !RST pin */
	wire t1 = 0;
	wire t2 = 0;
	assign clkin_a = cyc >= 2;
	assign clkin_b = xi;
	assign reset = cyc >= 40 && cyc <= 80;

	initial begin
		$dumpfile("dmg.vcd");
		$dumpvars(0, dmg);

		cyc = 0;
		xi  = 0;
	end

	always #122 xi = !xi;

	always @(posedge xi) begin
		cyc++;
		if (cyc == 10000) $finish;
	end

	wire [7:0]  d, d_a, d_d, md, md_out, md_a, oam_a_d, oam_b_d;
	wire [15:0] a, a_a, a_d, dma_a;
	wire [12:0] ma, ma_out;

	wire wr_a, wr_c, rd_a, rd_c;
	wire moe_a, moe_d, mwr_a, mwr_d, mcs_a, mcs_d, md_b;

	assign a = 0;

	/* not yet generated signals */
	wire [7:0] d_in = 'hff;
	wire [7:0] md_in = 'hff;
	wire [15:0] a_c = 0;
	wire wr_in = 0;
	wire rd_b = 0;
	wire moe_in = 0;
	wire mwr_in = 0;
	wire mcs_in = 0;
	wire cpu_raw_rd = 0;
	wire cpu_wr_raw = 0;
	wire p10_c = 0;
	wire p11_c = 0;
	wire p12_c = 0;
	wire p13_c = 0;
	wire sin_in = 0;
	wire sck_in = 0;
	wire ff40_d7 = 0;
	wire from_cpu = 0;
	wire from_cpu3 = 1;
	wire from_cpu4 = 0;
	wire from_cpu5 = 0;
	wire from_cpu6 = 0;
	wire clk_from_cpu = 1;
	wire ff46 = 0;
	wire ff40_d4 = 0;
	wire amab = 0;
	wire nff1a_d7 = 1;
	wire nch1_amp_en = 1;
	wire nch2_amp_en = 1;
	wire nch4_amp_en = 1;
	wire nch1_active = 1;
	wire nch2_active = 1;
	wire nch3_active = 1;
	wire nch4_active = 1;
	wire tacu = 0;
	wire tuvo = 0;
	wire acyl = 0;
	wire xyso = 0;
	wire texy = 0;
	wire myma = 0;
	wire lena = 0;
	wire xymu = 0;
	wire leko = 0;
	wire xuha = 0;
	wire vyno = 0;
	wire vujo = 0;
	wire vymu = 0;
	wire neta = 0;
	wire pore = 0;
	wire potu = 0;
	wire npyju = 1;
	wire npowy = 1;
	wire npoju = 1;
	wire npulo = 1;
	wire npoxa = 1;
	wire npyzo = 1;
	wire npozo = 1;
	wire nrawu = 1;
	wire int_vbl_buf = 0;
	wire int_serial = 0;
	wire int_stat = 0;
	wire int_timer = 0;
	wire cpu_irq0_ack = 0;
	wire cpu_irq1_ack = 0;
	wire cpu_irq2_ack = 0;
	wire cpu_irq3_ack = 0;
	wire cpu_irq4_ack = 0;
	wire ser_out = 0;
	wire ch1_restart = 0;
	wire ch1_ld_shift = 0;
	wire ch1_shift_clk = 0;
	wire ch1_freq_upd1 = 0;
	wire ch1_freq_upd2 = 0;
	wire anuj = 0;
	wire cope = 0;
	wire gexu = 0;
	wire adad = 0;
	wire kyly = 0;

	wire clk1;

	wire cpu_wr, cpu_wr2;
	wire cpu_rd, cpu_rd2;
	wire cpu_rd_sync;
	wire nt1_nt2, nt1_t2, t1_nt2;
	wire ff04_ff07, nff0f_rd, nff0f_wr, ff00wr, ff00rd;
	wire nff04_d0, nff04_d1;
	wire apu_wr, ncpu_rd;
	wire hram_cs, boot_cs, ncs_out;
	wire to_cpu, to_cpu2, to_cpu_tutu;
	wire cpu_irq0_trig, cpu_irq1_trig, cpu_irq2_trig, cpu_irq3_trig, cpu_irq4_trig;

	wire nreset2, nreset6;
	wire nphi_out;

	wire sout, sin_a, sin_b, sin_d, sck_a, sck_dir, sck_d;
	wire p10_a, p10_b, p10_d, p11_a, p11_b, p11_d, p12_a, p12_b, p12_d, p13_a, p13_b, p13_d;
	wire p14_a, p14_b, p15_a, p15_b;

	wire dma_run, vram_to_oam, dma_addr_ext, oam_addr_dma;
	wire caty, wyja, mopa_phi;
	wire tovy_na0, tola_na1;

	wire ff60_d1, ff60_d0;
	wire ff26, ff3x, namp_en;

	wire apu_reset, net03;
	wire napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6;
	wire apuv_4mhz;
	wire ajer_2mhz;
	wire boga1mhz;
	wire byfe_128hz;
	wire dyfa_1mhz;
	wire afas, fero_q, cate, gaxo, bedo, abuz, tutu, texo, roru, lula, anap, duce, cota, wuko, copu, atys;
	wire _16384hz, _65536hz, _262144hz;

	wire ffxx, nffxx, nfexxffxx, a00_07, saro;
	wire ff10, ff11, ff12, ff13, ff14, ff16, ff17, ff18, ff19, ff1a;
	wire ff1b, ff1c, ff1d, ff1e, ff20, ff21, ff22, ff23, ff24, ff25;
	wire nff10_d0, nff10_d1, nff10_d2, nff10_d3, nff10_d4, nff10_d5, nff10_d6;
	wire ff11_d6, ff11_d7, nff11_d6, nff11_d7;
	wire ff12_d0, ff12_d1, ff12_d2, ff12_d3, ff12_d4, ff12_d5, ff12_d6, ff12_d7;
	wire nff12_d0, nff12_d1, nff12_d2, nff12_d3;
	wire ff14_d6, nff14_d6;

	wire [10:0] acc_d;
	wire [3:0]  lmixer, rmixer;

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
	vram_interface p25_vram_interface(.*);

endmodule
