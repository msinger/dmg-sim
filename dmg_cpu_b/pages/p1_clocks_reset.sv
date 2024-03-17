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
	assign  arys = !clkin_b;
	assign anos = !(clkin_b && avet);
	assign avet = !(anos && arys);

	logic atal, atal_4mhz;
	assign  atal = !avet;
	assign atal_4mhz = atal;

	logic azof, zaxy, zeme, alet, lape, tava, atag, amuk;
	assign  azof = !atal;
	assign  zaxy = !azof;
	assign  zeme = !zaxy;
	assign  alet = !zeme;
	assign  lape = !alet;
	assign  tava = !lape;
	assign  atag = !azof;
	assign  amuk = !atag;
	assign clk1 = zeme;
	assign clk2 = alet;
	assign clk4 = lape;
	assign clk5 = tava;
	assign amuk_4mhz = amuk;

	logic aryf, apuv, cybo, bela, cery, aryf_4mhz;
	assign  aryf = !amuk;
	assign  apuv = !amuk;
	assign  cybo = !amuk;
	assign  bela = !apu_reset;
	dffr_bp dffr_cery(cybo, bela, !cery, cery);
	assign aryf_4mhz = aryf;
	assign apuv_4mhz = apuv;
	assign cery_2mhz = cery;

	logic dula, cunu, xore, walu, wesy, xebe;
	assign  dula = !nreset2;
	assign  cunu = !dula;
	assign  xore = !cunu;
	assign  walu = !xore;
	assign  wesy = !xore;
	assign  xebe = !xore;
	assign nreset6 = cunu;
	assign reset7  = xore;
	assign nreset7 = xebe;
	assign nreset8 = walu;
	assign nreset9 = wesy;

	logic xodo, xapo, pyry, atar, lyha, lyfe;
	assign xodo = !(ff40_d7 && nreset7);
	assign  xapo = !xodo;
	assign  pyry = !xapo;
	assign  atar = !xapo;
	assign  lyha = !xapo;
	assign  lyfe = !lyha;
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
	assign  abol = !clk_from_cpu;
	assign  ucob = !clkin_a;
	assign  uvyt = !nphi_out;
	assign  adar = !adyk;
	assign  atyp = !(!afur);
	assign  afep = !alef;
	assign  arov = !(!apuk);
	assign  afas = !(adar || atyp);
	assign arev = !(from_cpu3 && afas);
	assign  apov = !arev;
	assign  ajax = !atyp;
	assign  bugo = !afep;
	assign   agut = (arov || ajax) && from_cpu4;
	assign  awod = !(t1_nt2 || agut);
	assign  abuz = !awod;
	assign  bate = !(bugo || arov || abol);
	assign  basu = !bate;
	assign  buke = !basu;
	assign nclkin_a    = ucob;
	assign phi_out     = uvyt;
	assign cpu_wr_sync = apov;

	logic bapy, belu, beru, byry, bufa, byly, bude, beva, byda, bavy, beja, dova;
	logic bane, belo, baze, buto;
	assign  bapy = !(abol || arov || atyp);
	assign  belu = !(atyp || abol);
	assign  beru = !bapy;
	assign  byry = !belu;
	assign  bufa = !beru;
	assign  byly = !beru;
	assign  bude = !byry;
	assign  beva = !byry;
	assign  bolo = !bufa;
	assign  byda = !bufa;
	assign  beko = !bude;
	assign  bavy = !bude;
	assign  dova = !bude;
	assign beja = !(bolo && beko);
	assign  bane = !beja;
	assign  belo = !bane;
	assign  baze = !belo;
	assign buto = !(afep && atyp && baze);
	assign nphi_out  = bude;
	assign dova_phi  = dova;
	assign from_cpu5 = bufa;

	logic bele, atez, byju, alyp, buty, baly, afar, buvu, boga, asol, nasol, byxo, bowa, avor, alur;
	dffr_b dffr_afer(boga, t1t2_nrst, nasol, afer);
	nor_srlatch latch_asol(afar, reset, asol, nasol);
	assign  bele = !buto;
	assign  atez = !clkin_a;
	assign   byju = bele || atez;
	assign  alyp = !taba;
	assign  buty = !abol;
	assign  baly = !byju;
	assign  afar = !(alyp || reset);
	assign  buvu = buty && baly;
	assign  boga = !baly;
	assign  byxo = !buvu;
	assign  boma = !boga;
	assign  bedo = !byxo;
	assign  bowa = !bedo;
	assign   avor = afer || nasol;
	assign  alur = !avor;
	assign boga1mhz = boga;
	assign to_cpu   = bowa;
	assign nreset2  = alur;

	logic tape, ufol, nreset_div;
	assign  tape = ff04_ff07 && cpu_wr && tola_na1 && tovy_na0;
	assign  ufol = !(nclkin_a || reset || tape);
	assign nreset_div = ufol;

	logic tama, unyk, tero, uner, ufor, ukup, uvyn, tama16384;
	dffr_bp dffr_tama(!unyk,    nreset_div, !tama, tama);
	dffr_bp dffr_unyk(!tero,    nreset_div, !unyk, unyk);
	dffr_bp dffr_tero(!uner,    nreset_div, !tero, tero);
	dffr_bp dffr_uner(!ufor,    nreset_div, !uner, uner);
	dffr_bp dffr_ufor(!ukup,    nreset_div, !ufor, ufor);
	dffr_bp dffr_ukup(boga1mhz, nreset_div, !ukup, ukup);
	assign  uvyn = !tama;
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
	assign  ulur = ff60_d1 ? boga1mhz : tama16384;
	assign  umek = !ugot;
	assign  urek = !tulu;
	assign  utok = !tugo;
	assign  sapy = !tofe;
	assign  umer = !teru;
	assign  rave = !sola;
	assign  ryso = !subu;
	assign  udor = !teka;
	assign  tagy = ff04_ff07 && cpu_rd && tola_na1 && tovy_na0;
	assign   upyf = reset || nclkin_a;
	assign  unut = upof && ntubo;
	assign   taba = t1_nt2 || nt1_t2 || unut;
	assign  tawu = tagy ? !umek : 'z;
	assign  taku = tagy ? !urek : 'z;
	assign  temu = tagy ? !utok : 'z;
	assign  tuse = tagy ? !sapy : 'z;
	assign  upug = tagy ? !umer : 'z;
	assign  sepu = tagy ? !rave : 'z;
	assign  sawa = tagy ? !ryso : 'z;
	assign  tatu = tagy ? !udor : 'z;
	assign nff04_d0 = umek;
	assign nff04_d1 = urek;
	assign d = { tatu, sawa, sepu, upug, tuse, temu, taku, tawu };

	logic atus, coke, bara, caru, bylu, bure, fyne, culo, apef, gale, beze, bule, gexy, cofu, baru, horu, bufy, byfe;
	dffr_bp dffr_bara(coke,  atus, umer,  bara);
	dffr_bp dffr_caru(bure,  atus, !caru, caru);
	dffr_bp dffr_bylu(!caru, atus, !bylu, bylu);
	assign  atus = !apu_reset;
	assign  coke = !ajer_2mhz;
	assign  bure = !(!bara);
	assign  fyne = !bure;
	assign  culo = !(!caru);
	assign  apef = !(!bylu);
	assign  gale = fero_q ? hama_512k : fyne;
	assign  beze = fero_q ? hama_512k : culo;
	assign  bule = fero_q ? hama_512k : apef;
	assign  gexy = !gale;
	assign  horu = !gexy;
	assign  cofu = !beze;
	assign  bufy = !cofu;
	assign  baru = !bule;
	assign  byfe = !baru;
	assign horu_512hz = horu;
	assign bufy_256hz = bufy;
	assign byfe_128hz = byfe;

	logic bopo, atyk, avok, bavu, jeso, hama;
	dffr_bp dffr_atyk(aryf_4mhz, bopo,        !atyk, atyk);
	dffr_bp dffr_avok(!atyk,     bopo,        !avok, avok);
	dffr_bp dffr_jeso(bavu,      napu_reset5, !jeso, jeso);
	assign  bopo = !apu_reset;
	assign  bavu = !avok;
	assign  hama = !(!jeso);
	assign bavu_1mhz = bavu;
	assign jeso_512k = jeso;
	assign hama_512k = hama;

endmodule
