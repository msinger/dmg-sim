`default_nettype none

module interrupts(
		inout tri logic [7:0] d,

		input logic nreset2, boga1mhz, p10_c, p11_c, p12_c, p13_c,
		input logic nff0f_wr, nff0f_rd,

		input logic int_vbl_buf, int_serial, int_stat, int_timer,

		input  logic cpu_irq0_ack, cpu_irq1_ack, cpu_irq2_ack, cpu_irq3_ack, cpu_irq4_ack,
		output logic cpu_irq0_trig, cpu_irq1_trig, cpu_irq2_trig, cpu_irq3_trig, cpu_irq4_trig,
		output logic to_cpu2
	);

	logic kery, batu, awob, acef, agem, apug, asok, int_jp;
	dffr dffr_batu(boga1mhz, nreset2, kery, batu); // check clk edge
	dffr dffr_acef(boga1mhz, nreset2, batu, acef); // check clk edge
	dffr dffr_agem(boga1mhz, nreset2, acef, agem); // check clk edge
	dffr dffr_apug(boga1mhz, nreset2, agem, apug); // check clk edge
	latch latch_awob(boga1mhz, kery, awob);
	assign #T_OR   kery = p13_c || p12_c || p11_c || p10_c;
	assign #T_AND  asok = apug && batu;
	assign to_cpu2 = awob;
	assign int_jp  = asok;

	logic rotu, lety, muxe, lufe, sulo, lamo, seme, leja, nabe, lesa, rake;
	logic myzu, lyta, tome, tuny, toga, tyme, mody, movu, pyhu, pyga;
	logic pesu, lope, ubul, ulak, lalu, nybo;
	logic pola, maty, nejy, nuty, mopo, pavy, nela, pado, pegy, nabo, rova;
	dffsr dffsr_lope(int_vbl_buf, myzu, lyta, '1, lope);
	dffsr dffsr_ubul(int_serial,  tome, tuny, '1, ubul);
	dffsr dffsr_ulak(int_jp,      toga, tyme, '1, ulak);
	dffsr dffsr_lalu(int_stat,    mody, movu, '1, lalu);
	dffsr dffsr_nybo(int_timer,   pyhu, pyga, '1, nybo);
	latch latch_maty(nff0f_rd, lope, maty);
	latch latch_nejy(nff0f_rd, ubul, nejy);
	latch latch_nuty(nff0f_rd, ulak, nuty);
	latch latch_mopo(nff0f_rd, lalu, mopo);
	latch latch_pavy(nff0f_rd, nybo, pavy);
	assign #T_INV  rotu = !nff0f_wr;
	assign #T_INV  lety = !cpu_irq0_ack;
	assign #T_OR   muxe = d[0] || nff0f_wr;
	assign #T_INV  lufe = !cpu_irq3_ack;
	assign #T_OR   sulo = d[3] || nff0f_wr;
	assign #T_INV  lamo = !cpu_irq4_ack;
	assign #T_OR   seme = d[4] || nff0f_wr;
	assign #T_INV  leja = !cpu_irq1_ack;
	assign #T_OR   nabe = d[1] || nff0f_wr;
	assign #T_INV  lesa = !cpu_irq2_ack;
	assign #T_OR   rake = d[2] || nff0f_wr;
	assign #T_NAND myzu = !(rotu && lety && d[0]);
	assign #T_AND  lyta = muxe && lety && nreset2;
	assign #T_NAND tome = !(rotu && lufe && d[3]);
	assign #T_AND  tuny = sulo && lufe && nreset2;
	assign #T_NAND toga = !(rotu && lamo && d[4]);
	assign #T_AND  tyme = seme && lamo && nreset2;
	assign #T_NAND mody = !(rotu && leja && d[1]);
	assign #T_AND  movu = nabe && leja && nreset2;
	assign #T_NAND pyhu = !(rotu && lesa && d[2]);
	assign #T_AND  pyga = rake && lesa && nreset2;
	assign #T_INV  pola = !nff0f_rd;
	assign #T_TRI  nela = pola ? maty : 'z; /* takes !q output of dff */
	assign #T_TRI  pado = pola ? nejy : 'z; /* takes !q output of dff */
	assign #T_TRI  pegy = pola ? nuty : 'z; /* takes !q output of dff */
	assign #T_TRI  nabo = pola ? mopo : 'z; /* takes !q output of dff */
	assign #T_TRI  rova = pola ? pavy : 'z; /* takes !q output of dff */
	assign cpu_irq0_trig = lope;
	assign cpu_irq3_trig = ubul;
	assign cpu_irq4_trig = ulak;
	assign cpu_irq1_trig = lalu;
	assign cpu_irq2_trig = nybo;
	assign d[0] = nela;
	assign d[3] = pado;
	assign d[4] = pegy;
	assign d[1] = nabo;
	assign d[2] = rova;

endmodule
