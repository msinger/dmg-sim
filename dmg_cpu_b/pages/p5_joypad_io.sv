`timescale 1ns/1ns
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
	assign #T_INV  jeva = !ff60_d0;
	assign #T_NAND kore = !(keru && ff60_d0);
	assign #T_NOR  kywe = !(jeva || keru);
	assign #T_MUXI kena = !(ff60_d0 ? kuko : ser_out);
	assign #T_NAND kory = !(kyme && ff60_d0);
	assign #T_NOR  kale = !(kyme || kura);
	assign #T_NAND kyhu = !(ff60_d0 && jale);
	assign #T_NOR  kasy = !(jale || kura);
	assign #T_INV  byzo = !ff00rd;
	assign #T_TRI  jeku = !byzo ? !kolo : 'z;
	assign #T_TRI  kuve = !byzo ? !keja : 'z;
	assign #T_TRI  kema = !byzo ? !kevu : 'z;
	assign #T_TRI  kuro = !byzo ? !kapa : 'z;
	assign #T_OR   karu = kura || !kely;
	assign #T_TRI  koce = !byzo ? !(!kely) : 'z;
	assign #T_TRI  cudy = !byzo ? !(!cofy) : 'z;
	assign #T_OR   cela = !cofy || kura;
	assign #T_INV  kura = !ff60_d0;
	assign #T_NAND kole = !(jute && ff60_d0);
	assign #T_NOR  kybu = !(jute || kura);
	assign #T_NAND kyto = !(kecy && ff60_d0);
	assign #T_NOR  kabu = !(kecy || kura);
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
	assign #T_INV  axyn = !bedo;
	assign #T_INV  adyr = !axyn;
	assign #T_NOR  apys = !(t1_nt2 || adyr);
	assign #T_INV  afop = !apys;
	assign #T_TRI  anoc = !afop ? !0 : 'z;
	assign #T_TRI  ajec = !afop ? !0 : 'z;
	assign #T_TRI  arar = !afop ? !0 : 'z;
	assign #T_TRI  benu = !afop ? !0 : 'z;
	assign #T_TRI  akaj = !afop ? !0 : 'z;
	assign #T_TRI  asuz = !afop ? !0 : 'z;
	assign #T_TRI  ataj = !afop ? !0 : 'z;
	assign #T_TRI  beda = !afop ? !0 : 'z;
	assign d[0] = anoc;
	assign d[2] = ajec;
	assign d[6] = arar;
	assign d[4] = benu;
	assign d[5] = akaj;
	assign d[3] = asuz;
	assign d[1] = ataj;
	assign d[7] = beda;

endmodule
