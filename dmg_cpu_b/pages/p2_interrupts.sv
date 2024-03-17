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
	dffr_bp dffr_batu(boga1mhz, nreset2, kery, batu);
	dffr_bp dffr_acef(boga1mhz, nreset2, batu, acef);
	dffr_bp dffr_agem(boga1mhz, nreset2, acef, agem);
	dffr_bp dffr_apug(boga1mhz, nreset2, agem, apug);
	dlatch_b latch_awob(boga1mhz, kery, awob);
	assign   kery = p13_c || p12_c || p11_c || p10_c;
	assign  asok = apug && batu;
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
	dlatch_b latch_maty(nff0f_rd, lope, maty);
	dlatch_b latch_nejy(nff0f_rd, ubul, nejy);
	dlatch_b latch_nuty(nff0f_rd, ulak, nuty);
	dlatch_b latch_mopo(nff0f_rd, lalu, mopo);
	dlatch_b latch_pavy(nff0f_rd, nybo, pavy);
	assign  rotu = !nff0f_wr;
	assign  lety = !cpu_irq0_ack;
	assign   muxe = d[0] || nff0f_wr;
	assign  lufe = !cpu_irq3_ack;
	assign   sulo = d[3] || nff0f_wr;
	assign  lamo = !cpu_irq4_ack;
	assign   seme = d[4] || nff0f_wr;
	assign  leja = !cpu_irq1_ack;
	assign   nabe = d[1] || nff0f_wr;
	assign  lesa = !cpu_irq2_ack;
	assign   rake = d[2] || nff0f_wr;
	assign myzu = !(rotu && lety && d[0]);
	assign  lyta = muxe && lety && nreset2;
	assign tome = !(rotu && lufe && d[3]);
	assign  tuny = sulo && lufe && nreset2;
	assign toga = !(rotu && lamo && d[4]);
	assign  tyme = seme && lamo && nreset2;
	assign mody = !(rotu && leja && d[1]);
	assign  movu = nabe && leja && nreset2;
	assign pyhu = !(rotu && lesa && d[2]);
	assign  pyga = rake && lesa && nreset2;
	assign  pola = !nff0f_rd;
	assign  nela = pola ? !(!maty) : 'z;
	assign  pado = pola ? !(!nejy) : 'z;
	assign  pegy = pola ? !(!nuty) : 'z;
	assign  nabo = pola ? !(!mopo) : 'z;
	assign  rova = pola ? !(!pavy) : 'z;
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
