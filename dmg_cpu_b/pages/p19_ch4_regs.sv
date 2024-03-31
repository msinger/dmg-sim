`timescale 1ns/1ns
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
	dffr_bp dffr_fugo(!edop, gapy, !fugo, fugo);
	tffd tffd_edop(fylo, epek, d[5], edop);
	tffd tffd_fylo(dopu, epek, d[4], fylo);
	tffd tffd_dano(cuwa, dotu, d[0], dano);
	tffd tffd_favy(dano, dotu, d[1], favy);
	tffd tffd_dena(favy, dotu, d[2], dena);
	tffd tffd_cedo(dena, dotu, d[3], cedo);
	assign #T_INV  dopu = !(!cedo);
	assign #T_NAND caze = !(apu_wr && ff20);
	assign #T_NOR  doda = !(fugo || bufy_256hz || nff23_d6);
	assign #T_INV  furu = !caze;
	assign #T_INV  epek = !caze;
	assign #T_INV  dotu = !caze;
	assign #T_INV  cuwa = !doda;
	assign #T_NOR  gapy = !(furu || apu_reset || ch4_restart);
	assign fugo_q = fugo;

	logic fexo, goko, fupa, gony, hasu, daco, dyke, bofy, boxe;
	logic gedu, gozo, goky, garu, geky, ezyk, etyj, emok;
	logic hacu, hoge, godu, heda, gome, cuzu, coce, demy;
	drlatch latch_gedu(goko, fexo, d[7], gedu);
	drlatch latch_gozo(goko, fexo, d[6], gozo);
	drlatch latch_goky(goko, fexo, d[5], goky);
	drlatch latch_garu(goko, fexo, d[4], garu);
	drlatch latch_geky(goko, fexo, d[3], geky);
	drlatch latch_ezyk(daco, fexo, d[2], ezyk);
	drlatch latch_etyj(daco, fexo, d[1], etyj);
	drlatch latch_emok(daco, fexo, d[0], emok);
	assign #T_INV  fexo = !apu_reset;
	assign #T_AND  goko = ff21 && apu_wr;
	assign #T_INV  fupa = !goko;
	assign #T_INV  gony = !ff21;
	assign #T_OR   hasu = gony || ncpu_rd;
	assign #T_AND  daco = apu_wr && ff21;
	assign #T_INV  dyke = !daco;
	assign #T_INV  bofy = !ff21;
	assign #T_OR   boxe = bofy || ncpu_rd;
	assign #T_TRI  hacu = !hasu ? !(!gedu) : 'z;
	assign #T_TRI  hoge = !hasu ? !(!gozo) : 'z;
	assign #T_TRI  godu = !hasu ? !(!goky) : 'z;
	assign #T_TRI  heda = !hasu ? !(!garu) : 'z;
	assign #T_TRI  gome = !hasu ? !(!geky) : 'z;
	assign #T_TRI  cuzu = !boxe ? !(!ezyk) : 'z;
	assign #T_TRI  coce = !boxe ? !(!etyj) : 'z;
	assign #T_TRI  demy = !boxe ? !(!emok) : 'z;
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
	drlatch latch_jamy(!hoso, hyne,        d[3], jamy);
	drlatch latch_feta(getu,  napu_reset4, d[4], feta);
	drlatch latch_gogo(getu,  napu_reset4, d[6], gogo);
	drlatch latch_gafo(getu,  napu_reset4, d[7], gafo);
	drlatch latch_fyto(getu,  napu_reset4, d[5], fyto);
	assign #T_INV  kage = !ncpu_rd;
	assign #T_NAND jora = !(kage && ff22);
	assign #T_NAND hoso = !(ff22 && apu_wr);
	assign #T_AND  getu = apu_wr && ff22;
	assign #T_INV  gugo = !ff22;
	assign #T_OR   heze = gugo || ncpu_rd;
	assign #T_INV  hyne = !apu_reset;
	assign #T_INV  efug = !getu;
	assign #T_TRI  keta = !jora ? !(!jamy) : 'z;
	assign #T_TRI  geda = !heze ? !(!feta) : 'z;
	assign #T_TRI  gaka = !heze ? !(!gogo) : 'z;
	assign #T_TRI  hapy = !heze ? !(!gafo) : 'z;
	assign #T_TRI  gype = !heze ? !(!fyto) : 'z;
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
	drlatch latch_jaky(humo, napu_reset5, d[2], jaky);
	drlatch latch_jero(humo, napu_reset5, d[1], jero);
	drlatch latch_jare(humo, napu_reset5, d[0], jare);
	assign #T_AND  humo = apu_wr && ff22;
	assign #T_INV  hova = !humo;
	assign #T_INV  koku = !ff22;
	assign #T_OR   keka = koku || ncpu_rd;
	assign #T_TRI  kyro = !keka ? !(!jaky) : 'z;
	assign #T_TRI  kaku = !keka ? !(!jero) : 'z;
	assign #T_TRI  kamo = !keka ? !(!jare) : 'z;
	assign nff22_d2 = !jaky;
	assign nff22_d1 = !jero;
	assign nff22_d0 = !jare;
	assign d[2] = kyro;
	assign d[1] = kaku;
	assign d[0] = kamo;

	logic bylo, dulu, cabe, bare, cuny, cury, nff23_d6;
	drlatch latch_cuny(!dulu, cabe, d[6], cuny);
	assign #T_INV  bylo = !ncpu_rd;
	assign #T_NAND dulu = !(anuj && ff23);
	assign #T_INV  cabe = !apu_reset;
	assign #T_NAND bare = !(ff23 && bylo);
	assign #T_TRI  cury = !bare ? !(!cuny) : 'z;
	assign ff23_d6  = cuny;
	assign nff23_d6 = !cuny;
	assign d[6] = cury;

	logic foxe, hoga;
	drlatch latch_hoga(!foxe, rst_ff23_d7, d[7], hoga);
	assign #T_NAND foxe = !(apu_wr && ff23);
	assign ff23_d7 = hoga;

endmodule
