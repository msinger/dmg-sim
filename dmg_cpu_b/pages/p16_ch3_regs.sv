`default_nettype none

module ch3_regs(
		inout tri logic [7:0] d,

		input logic ncpu_rd, apu_wr, apu_reset, dova_phi, net03, from_cpu5,

		input logic cery_2mhz,

		input  logic ff1a, ff1b, ff1c, ff1d, ff1e,
		output logic nff1a_d7, ff1b_wr1, ff1b_wr2, ff1b_wr3,
		output logic ff1c_d5, nff1c_d5, ff1c_d6, nff1c_d6,
		output logic ff1d_d0, ff1d_d1, ff1d_d2, ff1d_d3, ff1d_d4, ff1d_d5, ff1d_d6, ff1d_d7,
		output logic ff1e_d0, ff1e_d1, ff1e_d2, ff1e_d6, nff1e_d6,

		output logic gara, ngugu, anuj,
		input  logic nkeno, nkafo, nkepa, nkygu, nkemu, nkunu, nkupe, nkutu, njapu, nkeza, nkeju,
		input  logic gaxo
	);

	logic gejo, gucy, gove, guxe, fuvo, gugu, fasy, fevo, geko;
	logic fabo, gaze, gyta, gyra, faju, goma, foba, fury, gulo, gofy, ngofy, fako, epyx, gavu;
	dffr_bp dffr_gara(fabo,      fury, ngofy, gara);
	dffr_bp dffr_gyta(fabo,      gaze, gara,  gyta);
	dffr_bp dffr_gyra(cery_2mhz, gaze, gyta,  gyra);
	dffr_bp dffr_foba(dova_phi,  goma, gavu,  foba);
	drlatch latch_guxe(gejo,  gove, d[7], guxe);
	drlatch latch_gavu(!epyx, fako, d[7], gavu);
	nor_srlatch  latch_gofy(gulo, foba, gofy, ngofy);
	nand_srlatch latch_gugu(faju, fuvo, gugu, ngugu);
	assign  gejo = ff1a && apu_wr;
	assign  gucy = !gejo;
	assign  gove = !apu_reset;
	assign  fuvo = !(!guxe || apu_reset);
	assign fasy = !(ff1a && gaxo);
	assign  fevo = !guxe;
	assign  geko = !fasy ? !fevo : 'z;
	assign  fabo = !cery_2mhz;
	assign  gaze = !apu_reset;
	assign  faju = !gyra;
	assign  goma = !apu_reset;
	assign  fury = !(apu_reset || gyta);
	assign  gulo = !fury;
	assign  fako = !(apu_reset || foba);
	assign epyx = !(apu_wr && ff1e);
	assign nff1a_d7 = !guxe;
	assign d[7]     = geko;

	logic dery, geto, emut, gajy;
	assign dery = !(apu_wr && ff1b);
	assign  geto = !dery;
	assign  emut = !dery;
	assign  gajy = !dery;
	assign ff1b_wr3 = geto;
	assign ff1b_wr1 = emut;
	assign ff1b_wr2 = gajy;

	logic kota, jafa, kuha, kyho, kuly;
	logic kogu, kana, jove, jypo, jefe, jaxa, jovy, koga;
	drlatch latch_kogu(kota, kuha, d[7], kogu);
	drlatch latch_kana(kota, kuha, d[6], kana);
	drlatch latch_jove(kota, kuha, d[5], jove);
	drlatch latch_jypo(jafa, kuha, d[4], jypo);
	drlatch latch_jefe(jafa, kuha, d[3], jefe);
	drlatch latch_jaxa(jafa, kuha, d[2], jaxa);
	drlatch latch_jovy(jafa, kuha, d[1], jovy);
	drlatch latch_koga(jafa, kuha, d[0], koga);
	assign  kota = ff1d && apu_wr;
	assign  jafa = ff1d && apu_wr;
	assign  kuha = !apu_reset;
	assign  kyho = !kota;
	assign  kuly = !jafa;
	assign ff1d_d7 = kogu;
	assign ff1d_d6 = kana;
	assign ff1d_d5 = jove;
	assign ff1d_d4 = jypo;
	assign ff1d_d3 = jefe;
	assign ff1d_d2 = jaxa;
	assign ff1d_d1 = jovy;
	assign ff1d_d0 = koga;

	logic dovo, egad, hoxa, gute, hovo;
	logic kamy, kora, jeza, juke, jude, kesy, kafu, jofo;
	assign  dovo = !ncpu_rd;
	assign egad = !(net03 && dovo);
	assign  hoxa = !ff1d;
	assign  gute = !(hoxa || egad);
	assign  hovo = !gute;
	assign  kamy = !hovo ? !nkeno : 'z;
	assign  kora = !hovo ? !nkafo : 'z;
	assign  jeza = !hovo ? !nkepa : 'z;
	assign  juke = !hovo ? !nkygu : 'z;
	assign  jude = !hovo ? !nkemu : 'z;
	assign  kesy = !hovo ? !nkunu : 'z;
	assign  kafu = !hovo ? !nkupe : 'z;
	assign  jofo = !hovo ? !nkutu : 'z;
	assign d = { kamy, kora, jeza, juke, jude, kesy, kafu, jofo };

	logic fovo, heky, gory, hoto, gawa, haca;
	drlatch latch_hoto(!fovo, heky, d[6], hoto);
	assign  anuj = from_cpu5 && apu_wr;
	assign fovo = !(anuj && ff1e);
	assign  heky = !apu_reset;
	assign  gory = !ncpu_rd;
	assign gawa = !(ff1e && gory);
	assign  haca = !gawa ? !(!hoto) : 'z;
	assign ff1e_d6  = hoto;
	assign nff1e_d6 = !hoto;
	assign d[6]     = haca;

	logic huda, juzo, kopy, jemo, jacy, jety;
	drlatch latch_jemo(huda, kopy, d[0], jemo);
	drlatch latch_jacy(huda, kopy, d[2], jacy);
	drlatch latch_jety(huda, kopy, d[1], jety);
	assign  huda = ff1e && apu_wr;
	assign  juzo = !huda;
	assign  kopy = !apu_reset;
	assign ff1e_d0 = jemo;
	assign ff1e_d2 = jacy;
	assign ff1e_d1 = jety;

	logic gunu, fuva, hufo, jura, juvy;
	assign  gunu = !ff1e;
	assign   fuva = gunu || egad;
	assign  hufo = !fuva ? !njapu : 'z;
	assign  jura = !fuva ? !nkeza : 'z;
	assign  juvy = !fuva ? !nkeju : 'z;
	assign d[2] = hufo;
	assign d[1] = jura;
	assign d[0] = juvy;

	logic haga, guro, guzu, huky, hody, jotu, henu, huco, hamu;
	drlatch latch_huky(haga, guro, d[6], huky);
	drlatch latch_hody(haga, guro, d[5], hody);
	assign  haga = apu_wr && ff1c;
	assign  guro = !apu_reset;
	assign  guzu = !haga;
	assign  jotu = !ncpu_rd;
	assign henu = !(ff1c && jotu);
	assign  huco = !henu ? !(!huky) : 'z;
	assign  hamu = !henu ? !(!hody) : 'z;
	assign ff1c_d6  = huky;
	assign nff1c_d6 = !huky;
	assign ff1c_d5  = hody;
	assign nff1c_d5 = !hody;
	assign d[6]     = huco;
	assign d[5]     = hamu;

endmodule
