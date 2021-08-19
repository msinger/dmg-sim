`default_nettype none

module clocks_reset(
		input logic clkin_a, clkin_b,
		input logic reset,

		output logic nreset2, nreset6,
		output logic clk1,
		output logic nphi_out, nphi,

		inout tri logic [7:0] d,

		output logic cpu_rd_sync,
		input  logic cpu_wr, cpu_rd,
		input  logic nt1_nt2, nt1_t2, t1_nt2,

		input  logic from_cpu3,
		input  logic from_cpu4,
		input  logic clk_from_cpu,
		output logic to_cpu,

		input logic ff04_ff07,
		input logic ff40_d7,
		input logic ff60_d1,
		input logic tovy_na0,
		input logic tola_na1,

		input  logic apu_reset,
		input  logic napu_reset5,
		output logic apuv_4mhz, amuk_4mhz,
		input  logic ajer_2mhz, cery_2mhz,
		output logic boga1mhz, bavu_1mhz,
		output logic byfe_128hz,
		output logic bufy_256hz,
		output logic horu_512hz,
		output logic jeso_512k, hama_512k,
		input  logic fero_q,
		output logic bedo, abuz, afas, abol,
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

	logic azof, zaxy, zeme, alet, lape, tava, atag, amuk, clk2, clk4, clk5;
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
	dffr dffr_cery(cybo, bela, !cery, cery);
	assign aryf_4mhz = aryf;
	assign apuv_4mhz = apuv;
	assign cery_2mhz = cery;

	logic dula, cunu, xore, walu, wesy, xebe, reset7, nreset7, nreset8, nreset9;
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

	logic xodo, xapo, pyry, atar, lyha, lyfe, reset_video, nreset_video, reset_video2, nreset_video2, reset_video3;
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

	logic adyk, afur, alef, apuk, ucob, uvyt, nclkin_a;
	logic adar, atyp, afep, arov, ajax, bugo, arev, apov, agut, awod, bate, basu, buke;
	dffr dffr_adyk(atal_4mhz,  nt1_nt2, apuk,  adyk);
	dffr dffr_afur(!atal_4mhz, nt1_nt2, !adyk, afur);
	dffr dffr_alef(atal_4mhz,  nt1_nt2, afur,  alef);
	dffr dffr_apuk(!atal_4mhz, nt1_nt2, alef,  apuk);
	assign #T_INV  abol = !clk_from_cpu;
	assign #T_INV  ucob = !clkin_a;
	assign #T_INV  uvyt = !phi_out;
	assign #T_INV  adar = !adyk;
	assign #T_INV  atyp = afur; /* takes !q output of dff */
	assign #T_INV  afep = !alef;
	assign #T_INV  arov = apuk; /* takes !q output of dff */
	assign #T_NOR  afas = !(adar || atyp);
	assign #T_NAND arev = !(from_cpu3 && afas);
	assign #T_INV  apov = !arev;
	assign #T_INV  ajax = !atyp;
	assign #T_INV  bugo = !afep;
	assign #T_OA   agut = (arov || ajax) && from_cpu4;
	assign #T_OR   awod = nt1_t2 || agut;
	assign #T_INV  abuz = !awod;
	assign #T_NOR  bate = !(bugo || arov || abol);
	assign #T_INV  basu = !bate;
	assign #T_INV  buke = !basu;
	assign nclkin_a = ucob;
	assign nphi_out = uvyt;
	assign cpu_rd_sync = apov;

	logic bapy, belu, beru, byry, bufa, byly, bude, beva, bolo, byda, beko, bavy, beja, dova, phi_out;
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
	assign phi_out = bude;
	assign nphi    = dova;

	logic bele, atez, byju, alyp, buty, baly, afar, buvu, boga, asol, boma, byxo, bowa, afer, avor, alur;
	dffr dffr_afer(boga, nt1_nt2, asol, afer);
	assign #T_INV  bele = !buto;
	assign #T_INV  atez = !clkin_a;
	assign #T_OR   byju = bele || atez;
	assign #T_INV  alyp = !taba;
	assign #T_INV  buty = !abol;
	assign #T_INV  baly = !byju;
	assign #T_NOR  afar = !(alyp || reset);
	assign #T_AND  buvu = buty && baly;
	assign #T_INV  boga = !baly;
	assign #T_OR   asol = afar || reset;
	assign #T_INV  byxo = !buvu;
	assign #T_INV  boma = !boga;
	assign #T_INV  bedo = !byxo;
	assign #T_INV  bowa = !bedo;
	assign #T_OR   avor = afer || asol;
	assign #T_INV  alur = !avor;
	assign boga1mhz = boga;
	assign to_cpu   = bowa;
	assign nreset2  = alur;

	logic tape, ufol, nreset_div;
	assign #T_AND  tape = ff04_ff07 && cpu_wr && tola_na1 && tovy_na0;
	assign #T_NOR  ufol = !(nclkin_a || reset || tape);
	assign nreset_div = ufol;

	logic tama, unyk, tero, uner, ufor, ukup, uvyn, tama16384;
	logic _32768hz, _131072hz, _524288hz;
	dffr dffr_tama(!unyk,    nreset_div, !tama, tama);
	dffr dffr_unyk(!tero,    nreset_div, !unyk, unyk);
	dffr dffr_tero(!uner,    nreset_div, !tero, tero);
	dffr dffr_uner(!ufor,    nreset_div, !uner, uner);
	dffr dffr_ufor(!ukup,    nreset_div, !ufor, ufor);
	dffr dffr_ukup(boga1mhz, nreset_div, !ukup, ukup);
	assign #T_INV  uvyn = !tama;
	assign tama16384 = !tama;
	assign _16384hz  = uvyn;
	assign _32768hz  = unyk;
	assign _65536hz  = tero;
	assign _131072hz = uner;
	assign _262144hz = ufor;
	assign _524288hz = ukup;

	logic ulur, ugot, tulu, tugo, tofe, teru, sola, subu, teka, uket, upof;
	logic umek, urek, utok, sapy, umer, rave, ryso, udor;
	logic tagy, tawu, taku, temu, tuse, upug, sepu, sawa, tatu;
	logic upyf, tubo, unut, taba;
	dffr dffr_ugot(ulur,  nreset_div, !ugot, ugot);
	dffr dffr_tulu(!ugot, nreset_div, !tulu, tulu);
	dffr dffr_tugo(!tulu, nreset_div, !tugo, tugo);
	dffr dffr_tofe(!tugo, nreset_div, !tofe, tofe);
	dffr dffr_teru(!tofe, nreset_div, !teru, teru);
	dffr dffr_sola(!teru, nreset_div, !sola, sola);
	dffr dffr_subu(!sola, nreset_div, !subu, subu);
	dffr dffr_teka(!subu, nreset_div, !teka, teka);
	dffr dffr_uket(!teka, nreset_div, !uket, uket);
	dffr dffr_upof(!uket, nreset_div, !upof, upof);
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
	assign #T_OR   tubo = clk_from_cpu || upyf;
	assign #T_AND  unut = upof && tubo;
	assign #T_OR   taba = nt1_t2 || t1_nt2 || unut;
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
	logic _512hz, _256hz, _128hz;
	dffr dffr_bara(coke,  atus, umer,  bara); // check edge
	dffr dffr_caru(bure,  atus, !caru, caru); // check edge
	dffr dffr_bylu(!caru, atus, !bylu, bylu); // check edge
	assign #T_INV  atus = !apu_reset;
	assign #T_INV  coke = !ajer_2mhz;
	assign #T_INV  bure = bara; /* takes !q output of dff */
	assign #T_INV  fyne = !bure;
	assign #T_INV  culo = caru; /* takes !q output of dff */
	assign #T_INV  apef = bylu; /* takes !q output of dff */
	assign #T_MUX  gale = fero_q ? hama_512k : fyne;
	assign #T_MUX  beze = fero_q ? hama_512k : culo;
	assign #T_MUX  bule = fero_q ? hama_512k : apef;
	assign #T_INV  gexy = !gale;
	assign #T_INV  horu = !gexy;
	assign #T_INV  cofu = !beze;
	assign #T_INV  bufy = !cofu;
	assign #T_INV  baru = !bule;
	assign #T_INV  byfe = !baru;
	assign _512hz = bara;
	assign _256hz = caru;
	assign _128hz = bylu;
	assign horu_512hz = horu;
	assign bufy_256hz = bufy;
	assign byfe_128hz = byfe;

	logic bopo, atyk, avok, bavu, jeso, hama, _2097152hz, _1048576hz;
	dffr dffr_atyk(aryf_4mhz, bopo,        !atyk, atyk); // check edge
	dffr dffr_avok(atyk,      bopo,        !avok, avok); // check edge
	dffr dffr_jeso(bavu,      napu_reset5, !jeso, jeso); // check edge
	assign #T_INV  bopo = !apu_reset;
	assign #T_INV  bavu = !avok;
	assign #T_INV  hama = jeso; /* takes !q output of dff */
	assign _2097152hz = atyk;
	assign _1048576hz = avok;
	assign jeso_512k = jeso;
	assign hama_512k = hama;

endmodule