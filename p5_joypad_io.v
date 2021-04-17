`default_nettype none
`timescale 1ns/100ps

module joypad_io(
		d, nreset2, bedo,
		ff00wr, ff00rd, ff60_d0, from_cpu,
		ser_out, sout, sin_a, sin_b, sin_d,
		p10_a, p10_b, p10_c, p10_d,
		p11_a, p11_b, p11_c, p11_d,
		p12_a, p12_b, p12_c, p12_d,
		p13_a, p13_b, p13_c, p13_d,
		p14_a, p14_b, p15_a, p15_b
	);

	inout wire [7:0] d;

	input wire nreset2, bedo;
	input wire ff00wr, ff00rd, ff60_d0, from_cpu;

	input  wire ser_out;
	output wire sout, sin_a, sin_b, sin_d;

	input  wire p10_c, p11_c, p12_c, p13_c;
	output wire p10_a, p10_b, p10_d;
	output wire p11_a, p11_b, p11_d;
	output wire p12_a, p12_b, p12_d;
	output wire p13_a, p13_b, p13_d;
	output wire p14_a, p14_b, p15_a, p15_b;

	assign sin_b = ff60_d0;
	assign p10_b = 0;
	assign p11_b = 0;
	assign p12_b = 0;
	assign p13_b = 0;

	wire kyme, kuko, keru, jale, kore, jeva, kywe, kena, kory, kale, kyhu, kasy;
	wire byzo, kolo, keja, kevu, kapa, jeku, kuve, kema, kuro, kely, cofy, karu, koce, cudy;
	wire kura, cela, jute, kecy, kole, kybu, kyto, kabu;
	dffr dffr_kyme(ff00wr, nreset2, d[3], kyme); // check clk edge
	dffr dffr_kuko(ff00wr, nreset2, d[6], kuko); // check clk edge
	dffr dffr_keru(ff00wr, nreset2, d[7], keru); // check clk edge
	dffr dffr_jale(ff00wr, nreset2, d[2], jale); // check clk edge
	dffr dffr_kely(ff00wr, nreset2, d[4], kely); // check clk edge
	dffr dffr_cofy(ff00wr, nreset2, d[5], cofy); // check clk edge
	dffr dffr_jute(ff00wr, nreset2, d[0], jute); // check clk edge
	dffr dffr_kecy(ff00wr, nreset2, d[1], kecy); // check clk edge
	latch latch_kolo(byzo, p13_c, kolo);
	latch latch_keja(byzo, p12_c, keja);
	latch latch_kevu(byzo, p10_c, kevu);
	latch latch_kapa(byzo, p11_c, kapa);
	assign #T_INV  jeva = !ff60_d0;
	assign #T_NAND kore = !(keru && ff60_d0);
	assign #T_NOR  kywe = !(jeva || keru);
	assign #T_MUXI kena = !(ff60_d0 ? kuko : ser_out);
	assign #T_NAND kory = !(kyme && ff60_d0);
	assign #T_NOR  kale = !(kyme || kura);
	assign #T_NAND kyhu = !(ff60_d0 && jale);
	assign #T_NOR  kasy = !(jale || kura);
	assign #T_INV  byzo = !ff00rd;
	assign #T_TRI  jeku = !byzo ? !kolo : 1'bz;
	assign #T_TRI  kuve = !byzo ? !keja : 1'bz;
	assign #T_TRI  kema = !byzo ? !kevu : 1'bz;
	assign #T_TRI  kuro = !byzo ? !kapa : 1'bz;
	assign #T_OR   karu = kura || !kely; /* takes !q output of dff */
	assign #T_TRI  koce = !byzo ? kely : 1'bz; /* takes !q output of dff */
	assign #T_TRI  cudy = !byzo ? cofy : 1'bz; /* takes !q output of dff */
	assign #T_OR   cela = !cofy || kura; /* takes !q output of dff */
	assign #T_INV  kura = !ff60_d0;
	assign #T_NAND kole = !(jute && ff60_d0);
	assign #T_NOR  kybu = !(jute || kura);
	assign #T_NAND kyto = !(kecy && ff60_d0);
	assign #T_NOR  kabu = !(kecy || kura);
	assign sin_a = kore;
	assign sin_d = kywe;
	assign sout  = kena;
	assign p13_a = kory;
	assign p13_d = kale;
	assign p12_a = kyhu;
	assign p12_d = kasy;
	assign d[3] = jeku;
	assign d[2] = kuve;
	assign d[0] = kema;
	assign d[1] = kuro;
	assign p14_a = karu;
	assign p14_b = !kely;
	assign p15_a = cela;
	assign p15_b = !cofy;
	assign p10_a = kole;
	assign p10_d = kybu;
	assign p11_a = kyto;
	assign p11_d = kabu;

	wire axyn, adyr, apys, afop, anoc, ajec, arar, benu, akaj, asuz, ataj, beda;
	assign #T_INV  axyn = !bedo;
	assign #T_INV  adyr = !axyn;
	assign #T_NOR  apys = !(from_cpu || adyr);
	assign #T_INV  afop = !apys;
	assign #T_TRI  anoc = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  ajec = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  arar = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  benu = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  akaj = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  asuz = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  ataj = !afop ? 1'b1 : 1'bz;
	assign #T_TRI  beda = !afop ? 1'b1 : 1'bz;
	assign d[0] = anoc;
	assign d[2] = ajec;
	assign d[6] = arar;
	assign d[4] = benu;
	assign d[5] = akaj;
	assign d[3] = asuz;
	assign d[1] = ataj;
	assign d[7] = beda;

endmodule
