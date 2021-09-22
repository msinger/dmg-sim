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
	logic fabo, gaze, gyta, gyra, faju, goma, foba, fury, gulo, gofy, fako, epyx, gavu;
	dffr_a  dffr_guxe(gucy,      gove, d[7],  guxe); // check clk edge
	dffr_bp dffr_gara(fabo,      fury, !gofy, gara); // check clk edge
	dffr_bp dffr_gyta(fabo,      gaze, gara,  gyta); // check clk edge
	dffr_bp dffr_gyra(cery_2mhz, gaze, gyta,  gyra); // check clk edge
	dffr_bp dffr_foba(dova_phi,  goma, gavu,  foba); // check clk edge
	dffr_a  dffr_gavu(epyx,      fako, d[7],  gavu); // check clk edge
	srlatch latch_gofy(gulo,  foba,  gofy);
	srlatch latch_gugu(!faju, !fuvo, gugu); /* srlatch with !s & !r inputs */
	assign #T_AND  gejo = ff1a && apu_wr;
	assign #T_INV  gucy = !gejo;
	assign #T_INV  gove = !apu_reset;
	assign #T_NOR  fuvo = !(!guxe || apu_reset); /* takes !q output of dffr */
	assign #T_NAND fasy = !(ff1a && gaxo);
	assign #T_INV  fevo = !guxe;
	assign #T_TRI  geko = !fasy ? !fevo : 'z;
	assign #T_INV  fabo = !cery_2mhz;
	assign #T_INV  gaze = !apu_reset;
	assign #T_INV  faju = !gyra;
	assign #T_INV  goma = !apu_reset;
	assign #T_NOR  fury = !(apu_reset || gyta);
	assign #T_INV  gulo = !fury;
	assign #T_NOR  fako = !(apu_reset || foba);
	assign #T_NAND epyx = !(apu_wr && ff1e);
	assign nff1a_d7 = !guxe;
	assign d[7]     = geko;
	assign ngugu    = !gugu;

	logic dery, geto, emut, gajy;
	assign #T_NAND dery = !(apu_wr && ff1b);
	assign #T_INV  geto = !dery;
	assign #T_INV  emut = !dery;
	assign #T_INV  gajy = !dery;
	assign ff1b_wr3 = geto;
	assign ff1b_wr1 = emut;
	assign ff1b_wr2 = gajy;

	logic kota, jafa, kuha, kyho, kuly;
	logic kogu, kana, jove, jypo, jefe, jaxa, jovy, koga;
	dffr_a dffr_kogu(kyho, kuha, d[7], kogu); // check clk edge
	dffr_a dffr_kana(kyho, kuha, d[6], kana); // check clk edge
	dffr_a dffr_jove(kyho, kuha, d[5], jove); // check clk edge
	dffr_a dffr_jypo(kuly, kuha, d[4], jypo); // check clk edge
	dffr_a dffr_jefe(kuly, kuha, d[3], jefe); // check clk edge
	dffr_a dffr_jaxa(kuly, kuha, d[2], jaxa); // check clk edge
	dffr_a dffr_jovy(kuly, kuha, d[1], jovy); // check clk edge
	dffr_a dffr_koga(kuly, kuha, d[0], koga); // check clk edge
	assign #T_NAND kota = !(ff1d && apu_wr);
	assign #T_NAND jafa = !(ff1d && apu_wr);
	assign #T_INV  kuha = !apu_reset;
	assign #T_INV  kyho = !kota;
	assign #T_INV  kuly = !jafa;
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
	assign #T_INV  dovo = !ncpu_rd;
	assign #T_NAND egad = !(net03 && dovo);
	assign #T_INV  hoxa = !ff1d;
	assign #T_NOR  gute = !(hoxa || egad);
	assign #T_INV  hovo = !gute;
	assign #T_TRI  kamy = !hovo ? !nkeno : 'z;
	assign #T_TRI  kora = !hovo ? !nkafo : 'z;
	assign #T_TRI  jeza = !hovo ? !nkepa : 'z;
	assign #T_TRI  juke = !hovo ? !nkygu : 'z;
	assign #T_TRI  jude = !hovo ? !nkemu : 'z;
	assign #T_TRI  kesy = !hovo ? !nkunu : 'z;
	assign #T_TRI  kafu = !hovo ? !nkupe : 'z;
	assign #T_TRI  jofo = !hovo ? !nkutu : 'z;
	assign d = { kamy, kora, jeza, juke, jude, kesy, kafu, jofo };

	logic fovo, heky, gory, hoto, gawa, haca;
	dffr_a dffr_hoto(fovo, heky, d[6], hoto); // check clk edge
	assign #T_AND  anuj = from_cpu5 && apu_wr;
	assign #T_NAND fovo = !(anuj && ff1e);
	assign #T_INV  heky = !apu_reset;
	assign #T_INV  gory = !ncpu_rd;
	assign #T_NAND gawa = !(ff1e && gory);
	assign #T_TRI  haca = !gawa ? hoto : 'z; /* takes !q output of dffr */
	assign ff1e_d6  = hoto;
	assign nff1e_d6 = !hoto;
	assign d[6]     = haca;

	logic huda, juzo, kopy, jemo, jacy, jety;
	dffr_a dffr_jemo(juzo, kopy, d[0], jemo); // check clk edge
	dffr_a dffr_jacy(juzo, kopy, d[2], jacy); // check clk edge
	dffr_a dffr_jety(juzo, kopy, d[1], jety); // check clk edge
	assign #T_NAND huda = !(ff1e && apu_wr);
	assign #T_INV  juzo = !huda;
	assign #T_INV  kopy = !apu_reset;
	assign ff1e_d0 = jemo;
	assign ff1e_d2 = jacy;
	assign ff1e_d1 = jety;

	logic gunu, fuva, hufo, jura, juvy;
	assign #T_INV  gunu = !ff1e;
	assign #T_OR   fuva = gunu || egad;
	assign #T_TRI  hufo = !fuva ? !njapu : 'z;
	assign #T_TRI  jura = !fuva ? !nkeza : 'z;
	assign #T_TRI  juvy = !fuva ? !nkeju : 'z;
	assign d[2] = hufo;
	assign d[1] = jura;
	assign d[0] = juvy;

	logic haga, guro, guzu, huky, hody, jotu, henu, huco, hamu;
	dffr_a dffr_huky(guzu, guro, d[6], huky); // check clk edge
	dffr_a dffr_hody(guzu, guro, d[5], hody); // check clk edge
	assign #T_AND  haga = apu_wr && ff1c;
	assign #T_INV  guro = !apu_reset;
	assign #T_INV  guzu = !haga;
	assign #T_INV  jotu = !ncpu_rd;
	assign #T_NAND henu = !(ff1c && jotu);
	assign #T_TRI  huco = !henu ? huky : 'z; /* takes !q output of dffr */
	assign #T_TRI  hamu = !henu ? hody : 'z; /* takes !q output of dffr */
	assign ff1c_d6  = huky;
	assign nff1c_d6 = !huky;
	assign ff1c_d5  = hody;
	assign nff1c_d5 = !hody;
	assign d[6]     = huco;
	assign d[5]     = hamu;

endmodule
