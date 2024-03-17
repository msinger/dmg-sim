`default_nettype none

module joypad_io(
		inout tri logic [7:0] d,

		input logic nreset2, bedo,
		input logic ff00wr, ff00rd, ff60_d0, t1_nt2,

		input  logic ser_out,
		output logic nsout, sin_a, sin_b, sin_d,

		input  logic p10_c, p11_c, p12_c, p13_c,
		output logic p10_a, p10_b, p10_d,
		output logic p11_a, p11_b, p11_d,
		output logic p12_a, p12_b, p12_d,
		output logic p13_a, p13_b, p13_d,
		output logic p14_a, p14_b, p15_a, p15_b
	);

	assign sin_b = ff60_d0;
	assign p10_b = 0;
	assign p11_b = 0;
	assign p12_b = 0;
	assign p13_b = 0;

	logic kyme, kuko, keru, jale, kore, jeva, kywe, kena, kory, kale, kyhu, kasy;
	logic byzo, kolo, keja, kevu, kapa, jeku, kuve, kema, kuro, kely, cofy, karu, koce, cudy;
	logic kura, cela, jute, kecy, kole, kybu, kyto, kabu;
	dffr_bp dffr_kyme(ff00wr, nreset2, d[3], kyme);
	dffr_bp dffr_kuko(ff00wr, nreset2, d[6], kuko);
	dffr_bp dffr_keru(ff00wr, nreset2, d[7], keru);
	dffr_bp dffr_jale(ff00wr, nreset2, d[2], jale);
	dffr_bp dffr_kely(ff00wr, nreset2, d[4], kely);
	dffr_bp dffr_cofy(ff00wr, nreset2, d[5], cofy);
	dffr_bp dffr_jute(ff00wr, nreset2, d[0], jute);
	dffr_bp dffr_kecy(ff00wr, nreset2, d[1], kecy);
	dlatch_b latch_kolo(byzo, p13_c, kolo);
	dlatch_b latch_keja(byzo, p12_c, keja);
	dlatch_b latch_kevu(byzo, p10_c, kevu);
	dlatch_b latch_kapa(byzo, p11_c, kapa);
	assign  jeva = !ff60_d0;
	assign kore = !(keru && ff60_d0);
	assign  kywe = !(jeva || keru);
	assign kena = !(ff60_d0 ? kuko : ser_out);
	assign kory = !(kyme && ff60_d0);
	assign  kale = !(kyme || kura);
	assign kyhu = !(ff60_d0 && jale);
	assign  kasy = !(jale || kura);
	assign  byzo = !ff00rd;
	assign  jeku = !byzo ? !kolo : 'z;
	assign  kuve = !byzo ? !keja : 'z;
	assign  kema = !byzo ? !kevu : 'z;
	assign  kuro = !byzo ? !kapa : 'z;
	assign   karu = kura || !kely;
	assign  koce = !byzo ? !(!kely) : 'z;
	assign  cudy = !byzo ? !(!cofy) : 'z;
	assign   cela = !cofy || kura;
	assign  kura = !ff60_d0;
	assign kole = !(jute && ff60_d0);
	assign  kybu = !(jute || kura);
	assign kyto = !(kecy && ff60_d0);
	assign  kabu = !(kecy || kura);
	assign sin_a = kore;
	assign sin_d = kywe;
	assign nsout = kena;
	assign p13_a = kory;
	assign p13_d = kale;
	assign p12_a = kyhu;
	assign p12_d = kasy;
	assign d[3] = jeku;
	assign d[2] = kuve;
	assign d[0] = kema;
	assign d[1] = kuro;
	assign d[4] = koce;
	assign d[5] = cudy;
	assign p14_a = karu;
	assign p14_b = !kely;
	assign p15_a = cela;
	assign p15_b = !cofy;
	assign p10_a = kole;
	assign p10_d = kybu;
	assign p11_a = kyto;
	assign p11_d = kabu;

	logic axyn, adyr, apys, afop, anoc, ajec, arar, benu, akaj, asuz, ataj, beda;
	assign  axyn = !bedo;
	assign  adyr = !axyn;
	assign  apys = !(t1_nt2 || adyr);
	assign  afop = !apys;
	assign  anoc = !afop ? !0 : 'z;
	assign  ajec = !afop ? !0 : 'z;
	assign  arar = !afop ? !0 : 'z;
	assign  benu = !afop ? !0 : 'z;
	assign  akaj = !afop ? !0 : 'z;
	assign  asuz = !afop ? !0 : 'z;
	assign  ataj = !afop ? !0 : 'z;
	assign  beda = !afop ? !0 : 'z;
	assign d[0] = anoc;
	assign d[2] = ajec;
	assign d[6] = arar;
	assign d[4] = benu;
	assign d[5] = akaj;
	assign d[3] = asuz;
	assign d[1] = ataj;
	assign d[7] = beda;

endmodule
