`default_nettype none

module ch4_regs(
		inout tri logic [7:0] d,

		input logic ncpu_rd, apu_wr, apu_reset, napu_reset4, napu_reset5,
		input logic bufy_256hz,

		input  logic ff20, ff21, ff22, ff23,
		output logic ff21_d0, nff21_d0, ff21_d1, nff21_d1, ff21_d2, nff21_d2,
		output logic ff21_d3, nff21_d3, ff21_d4, ff21_d5, ff21_d6, ff21_d7,
		output logic nff22_d0, nff22_d1, nff22_d2, ff22_d3, nff22_d3, ff22_d4, nff22_d4,
		output logic ff22_d5, nff22_d5, ff22_d6, nff22_d6, ff22_d7,
		output logic ff23_d6, ff23_d7,

		input  logic ch4_restart, rst_ff23_d7, anuj,
		output logic fugo_q
	);

	logic fugo, dopu, caze, doda, furu, epek, dotu, cuwa;
	logic gapy, edop, fylo, dano, favy, dena, cedo;
	dffr_bp dffr_fugo(!edop, gapy, !fugo, fugo); // check clk edge
	tffd tffd_edop(fylo, epek, d[5], edop);
	tffd tffd_fylo(dopu, epek, d[4], fylo);
	tffd tffd_dano(cuwa, dotu, d[0], dano);
	tffd tffd_favy(dano, dotu, d[1], favy);
	tffd tffd_dena(favy, dotu, d[2], dena);
	tffd tffd_cedo(dena, dotu, d[3], cedo);
	assign #T_INV  dopu = cedo; /* takes !q output of tffd */
	assign #T_NAND caze = !(apu_wr && ff20);
	assign #T_NOR  doda = !(fugo || bufy_256hz || ff23_d6);
	assign #T_INV  furu = !caze;
	assign #T_INV  epek = !caze;
	assign #T_INV  dotu = !caze;
	assign #T_INV  cuwa = !doda;
	assign #T_NOR  gapy = !(furu || apu_reset || ch4_restart);
	assign fugo_q = fugo;

	logic fexo, goko, fupa, gony, hasu, daco, dyke, bofy, boxe;
	logic gedu, gozo, goky, garu, geky, ezyk, etyj, emok;
	logic hacu, hoge, godu, heda, gome, cuzu, coce, demy;
	dffr_a dffr_gedu(fupa, fexo, d[7], gedu); // check clk edge
	dffr_a dffr_gozo(fupa, fexo, d[6], gozo); // check clk edge
	dffr_a dffr_goky(fupa, fexo, d[5], goky); // check clk edge
	dffr_a dffr_garu(fupa, fexo, d[4], garu); // check clk edge
	dffr_a dffr_geky(fupa, fexo, d[3], geky); // check clk edge
	dffr_a dffr_ezyk(dyke, fexo, d[2], ezyk); // check clk edge
	dffr_a dffr_etyj(dyke, fexo, d[1], etyj); // check clk edge
	dffr_a dffr_emok(dyke, fexo, d[0], emok); // check clk edge
	assign #T_INV  fexo = !apu_reset;
	assign #T_AND  goko = ff21 && apu_wr;
	assign #T_INV  fupa = !goko;
	assign #T_INV  gony = !ff21;
	assign #T_OR   hasu = gony || ncpu_rd;
	assign #T_AND  daco = apu_wr && ff21;
	assign #T_INV  dyke = !daco;
	assign #T_INV  bofy = !ff21;
	assign #T_OR   boxe = bofy || ncpu_rd;
	assign #T_TRI  hacu = !hasu ? gedu : 'z; /* takes !q output of dffr */
	assign #T_TRI  hoge = !hasu ? gozo : 'z; /* takes !q output of dffr */
	assign #T_TRI  godu = !hasu ? goky : 'z; /* takes !q output of dffr */
	assign #T_TRI  heda = !hasu ? garu : 'z; /* takes !q output of dffr */
	assign #T_TRI  gome = !hasu ? geky : 'z; /* takes !q output of dffr */
	assign #T_TRI  cuzu = !boxe ? ezyk : 'z; /* takes !q output of dffr */
	assign #T_TRI  coce = !boxe ? etyj : 'z; /* takes !q output of dffr */
	assign #T_TRI  demy = !boxe ? emok : 'z; /* takes !q output of dffr */
	assign ff21_d7  = gedu;
	assign ff21_d6  = gozo;
	assign ff21_d5  = goky;
	assign ff21_d4  = garu;
	assign ff21_d3  = geky;
	assign nff21_d3 = !geky;
	assign ff21_d2  = ezyk;
	assign nff21_d2 = !ezyk;
	assign ff21_d1  = etyj;
	assign nff21_d1 = !etyj;
	assign ff21_d0  = emok;
	assign nff21_d0 = !emok;
	assign d = { hacu, hoge, godu, heda, gome, cuzu, coce, demy };

	logic kage, jora, hoso, getu, gugo, heze, hyne, efug;
	logic jamy, feta, gogo, gafo, fyto, keta, geda, gaka, hapy, gype;
	dffr_a dffr_jamy(hoso, hyne,        d[3], jamy); // check clk edge
	dffr_a dffr_feta(efug, napu_reset4, d[4], feta); // check clk edge
	dffr_a dffr_gogo(efug, napu_reset4, d[6], gogo); // check clk edge
	dffr_a dffr_gafo(efug, napu_reset4, d[7], gafo); // check clk edge
	dffr_a dffr_fyto(efug, napu_reset4, d[5], fyto); // check clk edge
	assign #T_INV  kage = !ncpu_rd;
	assign #T_NAND jora = !(kage && ff22);
	assign #T_NAND hoso = !(ff22 && apu_wr);
	assign #T_AND  getu = apu_wr && ff22;
	assign #T_INV  gugo = !ff22;
	assign #T_OR   heze = gugo || ncpu_rd;
	assign #T_INV  hyne = !apu_reset;
	assign #T_INV  efug = !getu;
	assign #T_TRI  keta = !jora ? jamy : 'z; /* takes !q output of dffr */
	assign #T_TRI  geda = !heze ? feta : 'z; /* takes !q output of dffr */
	assign #T_TRI  gaka = !heze ? gogo : 'z; /* takes !q output of dffr */
	assign #T_TRI  hapy = !heze ? gafo : 'z; /* takes !q output of dffr */
	assign #T_TRI  gype = !heze ? fyto : 'z; /* takes !q output of dffr */
	assign ff22_d3  = jamy;
	assign nff22_d3 = !jamy;
	assign ff22_d4  = feta;
	assign nff22_d4 = !feta;
	assign ff22_d6  = gogo;
	assign nff22_d6 = !gogo;
	assign ff22_d7  = gafo;
	assign ff22_d5  = fyto;
	assign nff22_d5 = !fyto;
	assign d[3] = keta;
	assign d[4] = geda;
	assign d[6] = gaka;
	assign d[7] = hapy;
	assign d[5] = gype;

	logic humo, hova, koku, keka, jaky, jero, jare, kyro, kaku, kamo;
	dffr_a dffr_jaky(hova, napu_reset5, d[2], jaky); // check clk edge
	dffr_a dffr_jero(hova, napu_reset5, d[1], jero); // check clk edge
	dffr_a dffr_jare(hova, napu_reset5, d[0], jare); // check clk edge
	assign #T_AND  humo = apu_wr && ff22;
	assign #T_INV  hova = !humo;
	assign #T_INV  koku = !ff22;
	assign #T_OR   keka = koku || ncpu_rd;
	assign #T_TRI  kyro = !keka ? jaky : 'z; /* takes !q output of dffr */
	assign #T_TRI  kaku = !keka ? jero : 'z; /* takes !q output of dffr */
	assign #T_TRI  kamo = !keka ? jare : 'z; /* takes !q output of dffr */
	assign nff22_d2 = !jaky;
	assign nff22_d1 = !jero;
	assign nff22_d0 = !jare;
	assign d[2] = kyro;
	assign d[1] = kaku;
	assign d[0] = kamo;

	logic bylo, dulu, cabe, bare, cuny, cury;
	dffr_a dffr_cuny(dulu, cabe, d[6], cuny); // check clk edge
	assign #T_INV  bylo = !ncpu_rd;
	assign #T_NAND dulu = !(anuj && ff23);
	assign #T_INV  cabe = !apu_reset;
	assign #T_NAND bare = !(ff23 && bylo);
	assign #T_TRI  cury = !bare ? cuny : 'z; /* takes !q output of dffr */
	assign ff23_d6 = cuny;
	assign d[6] = cury;

	logic foxe, hoga;
	dffr_a dffr_hoga(foxe, rst_ff23_d7, d[7], hoga); // check clk edge
	assign #T_NAND foxe = !(apu_wr && ff23);
	assign ff23_d7 = hoga;

endmodule
