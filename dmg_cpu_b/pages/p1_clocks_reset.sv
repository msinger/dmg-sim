`timescale 1ns/1ns
`default_nettype none

module clocks_reset(
		input logic clkin_a, clkin_b,
		input logic reset,

		output logic nreset2, nreset6, reset7, nreset7, nreset8, nreset9,
		output logic reset_video, nreset_video, reset_video2, nreset_video2, reset_video3,
		output logic clk1, clk2, clk4, clk5,
		output logic nphi_out, phi_out, dova_phi,

		inout tri logic [7:0] d,

		output logic cpu_wr_sync,
		input  logic cpu_wr, cpu_rd,
		input  logic t1t2_nrst, t1_nt2, nt1_t2,

		input  logic from_cpu3,
		input  logic from_cpu4,
		input  logic clk_from_cpu,
		output logic to_cpu, from_cpu5,

		input logic ff04_ff07,
		input logic ff40_d7,
		input logic ff60_d1,
		input logic tovy_na0,
		input logic tola_na1,

		input  logic apu_reset,
		input  logic napu_reset5,
		input  logic ajer_2mhz,
		output logic apuv_4mhz, amuk_4mhz,
		output logic boga1mhz, bavu_1mhz, cery_2mhz,
		output logic byfe_128hz,
		output logic bufy_256hz,
		output logic horu_512hz,
		output logic jeso_512k, hama_512k,
		input  logic fero_q,
		output logic bedo, abuz, afas, beko, bolo, boma, afer, taba, buke,
		output logic nff04_d0, nff04_d1,
		output logic _16384hz, _65536hz, _262144hz
	);

	logic arys, anos, avet;
	assign #T_INV  arys = !clkin_b;
	assign #T_NAND anos = !(clkin_b && avet);
	assign #T_NAND avet = !(anos && arys);

	logic atal, atal_4mhz;
	assign #T_INV  atal = !avet;
	assign atal_4mhz = atal;

	logic azof, zaxy, zeme, alet, lape, tava, atag, amuk;
	assign #T_INV  azof = !atal;
	assign #T_INV  zaxy = !azof;
	assign #T_INV  zeme = !zaxy;
	assign #T_INV  alet = !zeme;
	assign #T_INV  lape = !alet;
	assign #T_INV  tava = !lape;
	assign #T_INV  atag = !azof;
	assign #T_INV  amuk = !atag;
	assign clk1 = zeme;
	assign clk2 = alet;
	assign clk4 = lape;
	assign clk5 = tava;
	assign amuk_4mhz = amuk;

	logic aryf, apuv, cybo, bela, cery, aryf_4mhz;
	assign #T_INV  aryf = !amuk;
	assign #T_INV  apuv = !amuk;
	assign #T_INV  cybo = !amuk;
	assign #T_INV  bela = !apu_reset;
	dffr_bp dffr_cery(cybo, bela, !cery, cery);
	assign aryf_4mhz = aryf;
	assign apuv_4mhz = apuv;
	assign cery_2mhz = cery;

	logic dula, cunu, xore, walu, wesy, xebe;
	assign #T_INV  dula = !nreset2;
	assign #T_INV  cunu = !dula;
	assign #T_INV  xore = !cunu;
	assign #T_INV  walu = !xore;
	assign #T_INV  wesy = !xore;
	assign #T_INV  xebe = !xore;
	assign nreset6 = cunu;
	assign reset7  = xore;
	assign nreset7 = xebe;
	assign nreset8 = walu;
	assign nreset9 = wesy;

	logic xodo, xapo, pyry, atar, lyha, lyfe;
	assign #T_NAND xodo = !(ff40_d7 && nreset7);
	assign #T_INV  xapo = !xodo;
	assign #T_INV  pyry = !xapo;
	assign #T_INV  atar = !xapo;
	assign #T_INV  lyha = !xapo;
	assign #T_INV  lyfe = !lyha;
	assign reset_video   = atar;
	assign nreset_video  = xapo;
	assign reset_video2  = pyry;
	assign nreset_video2 = lyfe;
	assign reset_video3  = lyha;

	logic adyk, afur, alef, apuk, ucob, uvyt, abol, nclkin_a;
	logic adar, atyp, afep, arov, ajax, bugo, arev, apov, agut, awod, bate, basu;
	drlatch latch_adyk(!atal_4mhz, t1t2_nrst, apuk,  adyk);
	drlatch latch_afur(atal_4mhz,  t1t2_nrst, !adyk, afur);
	drlatch latch_alef(!atal_4mhz, t1t2_nrst, afur,  alef);
	drlatch latch_apuk(atal_4mhz,  t1t2_nrst, alef,  apuk);
	assign #T_INV  abol = !clk_from_cpu;
	assign #T_INV  ucob = !clkin_a;
	assign #T_INV  uvyt = !nphi_out;
	assign #T_INV  adar = !adyk;
	assign #T_INV  atyp = !(!afur);
	assign #T_INV  afep = !alef;
	assign #T_INV  arov = !(!apuk);
	assign #T_NOR  afas = !(adar || atyp);
	assign #T_NAND arev = !(from_cpu3 && afas);
	assign #T_INV  apov = !arev;
	assign #T_INV  ajax = !atyp;
	assign #T_INV  bugo = !afep;
	assign #T_OA   agut = (arov || ajax) && from_cpu4;
	assign #T_NOR  awod = !(t1_nt2 || agut);
	assign #T_INV  abuz = !awod;
	assign #T_NOR  bate = !(bugo || arov || abol);
	assign #T_INV  basu = !bate;
	assign #T_INV  buke = !basu;
	assign nclkin_a    = ucob;
	assign phi_out     = uvyt;
	assign cpu_wr_sync = apov;

	logic bapy, belu, beru, byry, bufa, byly, bude, beva, byda, bavy, beja, dova;
	logic bane, belo, baze, buto;
	assign #T_NOR  bapy = !(abol || arov || atyp);
	assign #T_NOR  belu = !(atyp || abol);
	assign #T_INV  beru = !bapy;
	assign #T_INV  byry = !belu;
	assign #T_INV  bufa = !beru;
	assign #T_INV  byly = !beru;
	assign #T_INV  bude = !byry;
	assign #T_INV  beva = !byry;
	assign #T_INV  bolo = !bufa;
	assign #T_INV  byda = !bufa;
	assign #T_INV  beko = !bude;
	assign #T_INV  bavy = !bude;
	assign #T_INV  dova = !bude;
	assign #T_NAND beja = !(bolo && beko);
	assign #T_INV  bane = !beja;
	assign #T_INV  belo = !bane;
	assign #T_INV  baze = !belo;
	assign #T_NAND buto = !(afep && atyp && baze);
	assign nphi_out  = bude;
	assign dova_phi  = dova;
	assign from_cpu5 = bufa;

	logic bele, atez, byju, alyp, buty, baly, afar, buvu, boga, asol, nasol, byxo, bowa, avor, alur;
	dffr_b dffr_afer(boga, t1t2_nrst, nasol, afer);
	nor_srlatch latch_asol(afar, reset, asol, nasol);
	assign #T_INV  bele = !buto;
	assign #T_INV  atez = !clkin_a;
	assign #T_OR   byju = bele || atez;
	assign #T_INV  alyp = !taba;
	assign #T_INV  buty = !abol;
	assign #T_INV  baly = !byju;
	assign #T_NOR  afar = !(alyp || reset);
	assign #T_AND  buvu = buty && baly;
	assign #T_INV  boga = !baly;
	assign #T_INV  byxo = !buvu;
	assign #T_INV  boma = !boga;
	assign #T_INV  bedo = !byxo;
	assign #T_INV  bowa = !bedo;
	assign #T_OR   avor = afer || nasol;
	assign #T_INV  alur = !avor;
	assign boga1mhz = boga;
	assign to_cpu   = bowa;
	assign nreset2  = alur;

	logic tape, ufol, nreset_div;
	assign #T_AND  tape = ff04_ff07 && cpu_wr && tola_na1 && tovy_na0;
	assign #T_NOR  ufol = !(nclkin_a || reset || tape);
	assign nreset_div = ufol;

	logic tama, unyk, tero, uner, ufor, ukup, uvyn, tama16384;
	dffr_bp dffr_tama(!unyk,    nreset_div, !tama, tama);
	dffr_bp dffr_unyk(!tero,    nreset_div, !unyk, unyk);
	dffr_bp dffr_tero(!uner,    nreset_div, !tero, tero);
	dffr_bp dffr_uner(!ufor,    nreset_div, !uner, uner);
	dffr_bp dffr_ufor(!ukup,    nreset_div, !ufor, ufor);
	dffr_bp dffr_ukup(boga1mhz, nreset_div, !ukup, ukup);
	assign #T_INV  uvyn = !tama;
	assign tama16384 = !tama;
	assign _16384hz  = uvyn;
	assign _65536hz  = tero;
	assign _262144hz = ufor;

	logic ulur, ugot, tulu, tugo, tofe, teru, sola, subu, teka, uket, upof;
	logic umek, urek, utok, sapy, umer, rave, ryso, udor;
	logic tagy, tawu, taku, temu, tuse, upug, sepu, sawa, tatu;
	logic upyf, tubo, ntubo, unut;
	dffr_bp dffr_ugot(ulur,  nreset_div, !ugot, ugot);
	dffr_bp dffr_tulu(!ugot, nreset_div, !tulu, tulu);
	dffr_bp dffr_tugo(!tulu, nreset_div, !tugo, tugo);
	dffr_bp dffr_tofe(!tugo, nreset_div, !tofe, tofe);
	dffr_bp dffr_teru(!tofe, nreset_div, !teru, teru);
	dffr_bp dffr_sola(!teru, nreset_div, !sola, sola);
	dffr_bp dffr_subu(!sola, nreset_div, !subu, subu);
	dffr_bp dffr_teka(!subu, nreset_div, !teka, teka);
	dffr_bp dffr_uket(!teka, nreset_div, !uket, uket);
	dffr_bp dffr_upof(!uket, nreset_div, !upof, upof);
	nor_srlatch latch_tubo(clk_from_cpu, upyf, tubo, ntubo);
	assign #T_MUX  ulur = ff60_d1 ? boga1mhz : tama16384;
	assign #T_INV  umek = !ugot;
	assign #T_INV  urek = !tulu;
	assign #T_INV  utok = !tugo;
	assign #T_INV  sapy = !tofe;
	assign #T_INV  umer = !teru;
	assign #T_INV  rave = !sola;
	assign #T_INV  ryso = !subu;
	assign #T_INV  udor = !teka;
	assign #T_AND  tagy = ff04_ff07 && cpu_rd && tola_na1 && tovy_na0;
	assign #T_OR   upyf = reset || nclkin_a;
	assign #T_AND  unut = upof && ntubo;
	assign #T_OR   taba = t1_nt2 || nt1_t2 || unut;
	assign #T_TRI  tawu = tagy ? !umek : 'z;
	assign #T_TRI  taku = tagy ? !urek : 'z;
	assign #T_TRI  temu = tagy ? !utok : 'z;
	assign #T_TRI  tuse = tagy ? !sapy : 'z;
	assign #T_TRI  upug = tagy ? !umer : 'z;
	assign #T_TRI  sepu = tagy ? !rave : 'z;
	assign #T_TRI  sawa = tagy ? !ryso : 'z;
	assign #T_TRI  tatu = tagy ? !udor : 'z;
	assign nff04_d0 = umek;
	assign nff04_d1 = urek;
	assign d = { tatu, sawa, sepu, upug, tuse, temu, taku, tawu };

	logic atus, coke, bara, caru, bylu, bure, fyne, culo, apef, gale, beze, bule, gexy, cofu, baru, horu, bufy, byfe;
	dffr_bp dffr_bara(coke,  atus, umer,  bara);
	dffr_bp dffr_caru(bure,  atus, !caru, caru);
	dffr_bp dffr_bylu(!caru, atus, !bylu, bylu);
	assign #T_INV  atus = !apu_reset;
	assign #T_INV  coke = !ajer_2mhz;
	assign #T_INV  bure = !(!bara);
	assign #T_INV  fyne = !bure;
	assign #T_INV  culo = !(!caru);
	assign #T_INV  apef = !(!bylu);
	assign #T_MUX  gale = fero_q ? hama_512k : fyne;
	assign #T_MUX  beze = fero_q ? hama_512k : culo;
	assign #T_MUX  bule = fero_q ? hama_512k : apef;
	assign #T_INV  gexy = !gale;
	assign #T_INV  horu = !gexy;
	assign #T_INV  cofu = !beze;
	assign #T_INV  bufy = !cofu;
	assign #T_INV  baru = !bule;
	assign #T_INV  byfe = !baru;
	assign horu_512hz = horu;
	assign bufy_256hz = bufy;
	assign byfe_128hz = byfe;

	logic bopo, atyk, avok, bavu, jeso, hama;
	dffr_bp dffr_atyk(aryf_4mhz, bopo,        !atyk, atyk);
	dffr_bp dffr_avok(!atyk,     bopo,        !avok, avok);
	dffr_bp dffr_jeso(bavu,      napu_reset5, !jeso, jeso);
	assign #T_INV  bopo = !apu_reset;
	assign #T_INV  bavu = !avok;
	assign #T_INV  hama = !(!jeso);
	assign bavu_1mhz = bavu;
	assign jeso_512k = jeso;
	assign hama_512k = hama;

endmodule
