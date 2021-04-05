`default_nettype none
`timescale 1ns/100ps

parameter T_INV   = 2;
parameter T_AND   = 4;
parameter T_NAND  = 2;
parameter T_OR    = 4;
parameter T_NOR   = 2;
parameter T_OA    = 6;
parameter T_AO    = 6;
parameter T_MUX   = 6;
parameter T_TRI   = 2;
parameter T_DFFR  = 8;
parameter T_DFF   = 8;
parameter T_LATCH = 4;

module dmg;

	reg [31:0] cyc;

	reg xi;
	wire clkin_a, clkin_b;
	wire reset; /* inverted !RST pin */
	wire t1 = 0;
	wire t2 = 0;
	assign clkin_a = cyc >= 2;
	assign clkin_b = xi;
	assign reset = cyc >= 40 && cyc <= 80;

	initial begin
		$dumpfile("dmg.vcd");
		$dumpvars(0, dmg);

		cyc = 0;
		xi  = 0;
	end

	always #122 xi = !xi;

	always @(posedge xi) begin
		cyc++;
		if (cyc == 10000) $finish;
	end

	wire [7:0]  d, d_a, d_d;
	wire [12:0] ma;
	wire [15:0] a, a_a, a_d, dma_a;

	wire wr_a, wr_c, rd_a, rd_c;

	/* not yet generated signals */
	wire [7:0] d_in = 'hff;
	wire [15:0] a_c = 0;
	wire wr_in = 0;
	wire rd_b = 0;
	wire cpu_raw_rd = 0;
	wire cpu_wr_raw = 0;
	wire ff40_d7 = 0;
	wire from_cpu = 0;
	wire from_cpu3 = 1;
	wire from_cpu4 = 0;
	wire from_cpu5 = 0;
	wire from_cpu6 = 0;
	wire clk_from_cpu = 1;
	wire tovy_na0 = 1;
	wire apu_wr = 0;
	wire ff26 = 0;
	wire a00_07 = 0;
	wire anap = 0;
	wire ff46 = 0;
	wire amab = 0;

	wire clk1;

	wire cpu_wr, cpu_wr2;
	wire cpu_rd, cpu_rd2;
	wire cpu_rd_sync;
	wire nt1_nt2, nt1_t2, t1_nt2;
	wire ff04_ff07, ff0f_rd, ff0f_wr;
	wire hram_cs, boot_cs, ncs_out;
	wire to_cpu, to_cpu_tutu;

	wire nreset2, nreset6;
	wire nphi_out;

	wire dma_run, vram_to_oam, dma_addr_ext, oam_addr_dma;
	wire caty, wyja, mopa_phi;
	wire tola_na1;

	wire ff60_d1, ff60_d0;

	wire apu_reset;
	wire napu_reset5;
	wire apuv_4mhz;
	wire ajer_2mhz;
	wire byfe_128hz;
	wire fero_q, bedo, abuz, tutu, texo, roru, lula;

	wire ffxx, nffxx, nfexxffxx, saro;

	clk            p1_clk(.*);
	dma            p4_dma(.*);
	sys_decode     p7_sys_decode(.*);
	ext_cpu_busses p8_ext_cpu_busses(.*);
	apu_ctrl       p9_apu_ctrl(.*);
	vram_ifc       p25_vram_ifc(.*);

endmodule

module clk(
		clkin_a, clkin_b, reset,
		nreset2, nreset6,
		clk1, nphi_out,
		d,
		cpu_rd_sync,
		cpu_wr, cpu_rd,
		nt1_nt2, nt1_t2, t1_nt2,
		from_cpu3, from_cpu4, clk_from_cpu, to_cpu,
		ff04_ff07, ff40_d7, ff60_d1, tovy_na0, tola_na1,
		apu_reset, napu_reset5,
		apuv_4mhz, ajer_2mhz, byfe_128hz,
		fero_q, bedo, abuz
	);

	input wire clkin_a, clkin_b;
	input wire reset;

	output wire nreset2, nreset6;
	output wire clk1;
	output wire nphi_out;

	inout wire [7:0] d;

	output wire cpu_rd_sync;
	input  wire cpu_wr, cpu_rd;
	input  wire nt1_nt2, nt1_t2, t1_nt2;

	input  wire from_cpu3;
	input  wire from_cpu4;
	input  wire clk_from_cpu;
	output wire to_cpu;

	input wire ff04_ff07;
	input wire ff40_d7;
	input wire ff60_d1;
	input wire tovy_na0;
	input wire tola_na1;

	input  wire apu_reset;
	input  wire napu_reset5;
	output wire apuv_4mhz;
	input  wire ajer_2mhz;
	output wire byfe_128hz;
	input  wire fero_q;
	output wire bedo, abuz;

	wire arys, anos, avet;
	assign #T_INV  arys = !clkin_b;
	assign #T_NAND anos = !(clkin_b && avet);
	assign #T_NAND avet = !(anos && arys);

	wire atal, atal_4mhz;
	assign #T_INV  atal = !avet;
	assign atal_4mhz = atal;

	wire azof, zaxy, zeme, alet, lape, tava, atag, amuk, clk2, clk4, clk5, amuk_4mhz;
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

	wire aryf, apuv, cybo, bela, cery, aryf_4mhz, cery_2mhz;
	assign #T_INV  aryf = !amuk;
	assign #T_INV  apuv = !amuk;
	assign #T_INV  cybo = !amuk;
	assign #T_INV  bela = !apu_reset;
	dffr dffr_cery(cybo, bela, !cery, cery);
	assign aryf_4mhz = aryf;
	assign apuv_4mhz = apuv;
	assign cery_2mhz = cery;

	wire dula, cunu, xore, walu, wesy, xebe, reset7, nreset7, nreset8, nreset9;
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

	wire xodo, xapo, pyry, atar, lyha, lyfe, reset_video, nreset_video, reset_video2, nreset_video2, reset_video3;
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

	wire adyk, afur, alef, apuk, abol, ucob, uvyt, nclkin_a;
	wire adar, atyp, afep, arov, afas, ajax, bugo, arev, apov, agut, awod, bate, basu, buke;
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
	assign #T_OA   agut = (ajax || arov) && from_cpu4;
	assign #T_OR   awod = nt1_t2 || agut;
	assign #T_INV  abuz = !awod;
	assign #T_NOR  bate = !(bugo || arov || abol);
	assign #T_INV  basu = !bate;
	assign #T_INV  buke = !basu;
	assign nclkin_a = ucob;
	assign nphi_out = uvyt;
	assign cpu_rd_sync = apov;

	wire bapy, belu, beru, byry, bufa, byly, bude, beva, bolo, byda, beko, bavy, beja, dova, phi_out, nphi;
	wire bane, belo, baze, buto;
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

	wire bele, atez, byju, alyp, buty, baly, afar, buvu, boga, asol, boma, byxo, bowa, afer, avor, alur;
	wire boga1mhz;
	dffr dffr_afer(boma, nt1_nt2, asol, afer); // check clk edge
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

	wire tape, ufol, nreset_div;
	assign #T_AND  tape = ff04_ff07 && cpu_wr && tola_na1 && tovy_na0;
	assign #T_NOR  ufol = !(nclkin_a || reset || tape);
	assign nreset_div = ufol;

	wire tama, unyk, tero, uner, ufor, ukup, uvyn, tama16384;
	wire _16384hz, _32768hz, _65536hz, _131072hz, _262144hz, _524288hz;
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

	wire ulur, ugot, tulu, tugo, tofe, teru, sola, subu, teka, uket, upof;
	wire umek, urek, utok, sapy, umer, rave, ryso, udor;
	wire tagy, tawu, taku, temu, tuse, upug, sepu, sawa, tatu;
	wire upyf, tubo, unut, taba, nff04_d0, nff04_d1;
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
	assign #T_TRI  tawu = tagy ? !umek : 1'bz;
	assign #T_TRI  taku = tagy ? !urek : 1'bz;
	assign #T_TRI  temu = tagy ? !utok : 1'bz;
	assign #T_TRI  tuse = tagy ? !sapy : 1'bz;
	assign #T_TRI  upug = tagy ? !umer : 1'bz;
	assign #T_TRI  sepu = tagy ? !rave : 1'bz;
	assign #T_TRI  sawa = tagy ? !ryso : 1'bz;
	assign #T_TRI  tatu = tagy ? !udor : 1'bz;
	assign nff04_d0 = umek;
	assign nff04_d1 = urek;
	assign d = { tatu, sawa, sepu, upug, tuse, temu, taku, tawu };

	wire atus, coke, bara, caru, bylu, bure, fyne, culo, apef, gale, beze, bule, gexy, cofu, baru, horu, bufy, byfe;
	wire _512hz, _256hz, _128hz, horu_512hz, bufy_256hz;
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

	wire bopo, atyk, avok, bavu, jeso, hama, bavu_1mhz, _2097152hz, _1048576hz, jeso_512k, hama_512k;
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

module dma(
		clk1, d, ma, dma_a,
		nreset6, from_cpu5,
		cpu_rd2, cpu_wr2, ff46,
		amab, wyja, caty, dma_run,
		vram_to_oam, dma_addr_ext, oam_addr_dma,
		nphi_out, mopa_phi
	);

	inout  wire [7:0] d;
	output wire [12:0] ma;
	output wire [15:0] dma_a;

	input wire clk1, nreset6, from_cpu5;
	input wire cpu_rd2, cpu_wr2, ff46;

	input  wire amab, nphi_out;
	output wire wyja, caty, dma_run, mopa_phi;
	output wire vram_to_oam, dma_addr_ext, oam_addr_dma;

	wire decy, maka, naxy, powu, luvy, molu, nygo, pusy, lavy, loru, lyxe, lupa, ahoc, loko, lapa, meta;
	dffr dffr_maka(clk1,     nreset6, caty, maka); // check edge
	dffr dffr_luvy(nphi_out, nreset6, lupa, luvy); // check edge
	assign #T_INV  decy = !from_cpu5;
	assign #T_INV  caty = !decy;
	assign #T_NOR  naxy = !(maka || luvy);
	assign #T_AND  powu = matu && naxy;
	assign #T_AO   wyja = (amab && cpu_wr2) || powu;
	assign #T_AND  molu = ff46 && cpu_rd2;
	assign #T_INV  nygo = !molu;
	assign #T_INV  pusy = !nygo;
	assign #T_AND  lavy = ff46 && cpu_wr2;
	assign #T_INV  loru = !lavy;
	assign #T_OR   lyxe = loru || loko;
	assign #T_NOR  lupa = !(lavy || lyxe);
	assign #T_INV  ahoc = !vram_to_oam;
	assign #T_NAND loko = !(nreset6 && !lene);
	assign #T_INV  lapa = !loko;
	assign #T_AND  meta = nphi_out && loky;

	wire mopa, navo, nolo, myte, lene, lara, loky, matu, mory, luma, logo, duga, lebu, muda, muho, lufa;
	dffr dffr_myte(mopa,     lapa,    nolo, myte); // check edge
	dffr dffr_lene(mopa,     nreset6, luvy, lene); // check edge
	dffr dffr_matu(nphi_out, nreset6, loky, matu); // check edge
	assign #T_INV  mopa = !nphi_out;
	assign #T_NAND navo = !(dma_a[0] && dma_a[1] && dma_a[2] && dma_a[3] && dma_a[4] && dma_a[7]);
	assign #T_INV  nolo = !navo;
	assign #T_NAND lara = !(loky && !myte && nreset6);
	assign #T_NAND loky = !(lara && !lene);
	assign #T_NAND mory = !(matu && logo);
	assign #T_INV  luma = !mory;
	assign #T_INV  logo = !muda;
	assign #T_INV  duga = !matu;
	assign #T_INV  lebu = !dma_a[15];
	assign #T_NOR  muda = !(dma_a[13] || dma_a[14] || lebu);
	assign #T_NAND muho = !(matu && muda);
	assign #T_INV  lufa = !muho;
	assign mopa_phi     = mopa;
	assign dma_run      = matu;
	assign dma_addr_ext = luma;
	assign oam_addr_dma = duga;
	assign vram_to_oam  = lufa;

	wire nafa, nygy, para, pyne, pula, nydo, poku, maru, poly, pare, rema, rofo, raly, pane, resu, nuvy;
	wire evax, exyf, eraf, duve, fusy;
	dff dff_nafa(loru, d[0], nafa); // check edge
	dff dff_nygy(loru, d[4], nygy); // check edge
	dff dff_para(loru, d[2], para); // check edge
	dff dff_pyne(loru, d[1], pyne); // check edge
	dff dff_pula(loru, d[5], pula); // check edge
	dff dff_nydo(loru, d[3], nydo); // check edge
	dff dff_poku(loru, d[6], poku); // check edge
	dff dff_maru(loru, d[7], maru); // check edge
	assign #T_TRI  poly = pusy ? nafa : 1'bz; /* takes !q output of dff */
	assign #T_TRI  pare = pusy ? nygy : 1'bz; /* takes !q output of dff */
	assign #T_TRI  rema = pusy ? para : 1'bz; /* takes !q output of dff */
	assign #T_TRI  rofo = pusy ? pyne : 1'bz; /* takes !q output of dff */
	assign #T_TRI  raly = pusy ? pula : 1'bz; /* takes !q output of dff */
	assign #T_TRI  pane = pusy ? nydo : 1'bz; /* takes !q output of dff */
	assign #T_TRI  resu = pusy ? poku : 1'bz; /* takes !q output of dff */
	assign #T_TRI  nuvy = pusy ? maru : 1'bz; /* takes !q output of dff */
	assign #T_TRI  evax = !ahoc ? !nafa : 1'bz;
	assign #T_TRI  exyf = !ahoc ? !nygy : 1'bz;
	assign #T_TRI  eraf = !ahoc ? !para : 1'bz;
	assign #T_TRI  duve = !ahoc ? !pyne : 1'bz;
	assign #T_TRI  fusy = !ahoc ? !nydo : 1'bz;
	assign d[0] = poly;
	assign d[4] = pare;
	assign d[2] = rema;
	assign d[1] = rofo;
	assign d[5] = raly;
	assign d[3] = pane;
	assign d[6] = resu;
	assign d[7] = nuvy;
	assign dma_a[8]  = nafa;
	assign dma_a[12] = nygy;
	assign dma_a[10] = para;
	assign dma_a[9]  = pyne;
	assign dma_a[13] = pula;
	assign dma_a[11] = nydo;
	assign dma_a[14] = poku;
	assign dma_a[15] = maru;
	assign ma[8]  = evax;
	assign ma[12] = exyf;
	assign ma[10] = eraf;
	assign ma[9]  = duve;
	assign ma[11] = fusy;

	wire naky, pyro, nefy, muty, nyko, pylo, nuto, mugu, ecal, egez, fuhe, fyzy, damu, dava, eteg, erew;
	dffr dffr_naky(meta,  lapa, !naky, naky); // check edge
	dffr dffr_pyro(!naky, lapa, !pyro, pyro); // check edge
	dffr dffr_nefy(!pyro, lapa, !nefy, nefy); // check edge
	dffr dffr_muty(!nefy, lapa, !muty, muty); // check edge
	dffr dffr_nyko(!muty, lapa, !nyko, nyko); // check edge
	dffr dffr_pylo(!nyko, lapa, !pylo, pylo); // check edge
	dffr dffr_nuto(!pylo, lapa, !nuto, nuto); // check edge
	dffr dffr_mugu(!nuto, lapa, !mugu, mugu); // check edge
	assign #T_TRI  ecal = !ahoc ? !naky : 1'bz;
	assign #T_TRI  egez = !ahoc ? !pyro : 1'bz;
	assign #T_TRI  fuhe = !ahoc ? !nefy : 1'bz;
	assign #T_TRI  fyzy = !ahoc ? !muty : 1'bz;
	assign #T_TRI  damu = !ahoc ? !nyko : 1'bz;
	assign #T_TRI  dava = !ahoc ? !pylo : 1'bz;
	assign #T_TRI  eteg = !ahoc ? !nuto : 1'bz;
	assign #T_TRI  erew = !ahoc ? !mugu : 1'bz;
	assign dma_a[0] = naky;
	assign dma_a[1] = pyro;
	assign dma_a[2] = nefy;
	assign dma_a[3] = muty;
	assign dma_a[4] = nyko;
	assign dma_a[5] = pylo;
	assign dma_a[6] = nuto;
	assign dma_a[7] = mugu;
	assign ma[0] = ecal;
	assign ma[1] = egez;
	assign ma[2] = fuhe;
	assign ma[3] = fyzy;
	assign ma[4] = damu;
	assign ma[5] = dava;
	assign ma[6] = eteg;
	assign ma[7] = erew;

endmodule

module sys_decode(
		reset, nreset2, t1, t2, wr_in, rd_b, a, d,
		cpu_rd_sync, cpu_raw_rd, cpu_wr_raw,
		from_cpu6, to_cpu_tutu,
		cpu_wr, cpu_wr2, cpu_rd, cpu_rd2,
		nt1_nt2, nt1_t2, t1_nt2,
		ff04_ff07, ff0f_rd, ff0f_wr,
		hram_cs,
		anap, bedo, tutu,
		a00_07, ffxx, nffxx, nfexxffxx, saro,
		ff60_d1, ff60_d0, boot_cs
	);

	input  wire reset, nreset2, t1, t2, wr_in, rd_b;
	input  wire [15:0] a;
	inout  wire [7:0] d;
	input  wire cpu_rd_sync, cpu_raw_rd, cpu_wr_raw;
	input  wire from_cpu6;
	output wire to_cpu_tutu;
	output wire cpu_wr, cpu_wr2, cpu_rd, cpu_rd2;
	output wire nt1_nt2, nt1_t2, t1_nt2;

	output wire ff04_ff07, ff0f_rd, ff0f_wr;
	output wire hram_cs;

	input  wire anap, bedo;
	output wire tutu;
	input  wire a00_07;
	output wire ffxx, nffxx, nfexxffxx, saro;
	output wire ff60_d1, ff60_d0;
	output wire boot_cs;

	wire ubet, uvar, upoj, unor, umut;
	assign #T_INV  ubet = !t1;
	assign #T_INV  uvar = !t2;
	assign #T_NAND upoj = !(ubet && uvar && reset);
	assign #T_AND  unor = t2 && ubet;
	assign #T_AND  umut = uvar && t1;
	assign nt1_nt2 = upoj;
	assign nt1_t2  = unor;
	assign t1_nt2  = umut;

	wire ubal, ujyv, lexy, tapu, tedo, dyky, ajas, cupa, asot, pin_nc;
	assign #T_MUX  ubal = !(nt1_t2 ? wr_in : cpu_rd_sync);
	assign #T_MUX  ujyv = !(nt1_t2 ? rd_b  : cpu_raw_rd);
	assign #T_INV  lexy = !from_cpu6;
	assign #T_INV  tapu = !ubal;
	assign #T_INV  tedo = !ujyv;
	assign #T_INV  dyky = !tapu;
	assign #T_INV  ajas = !tedo;
	assign #T_INV  cupa = !dyky;
	assign #T_INV  asot = !ajas;
	assign pin_nc  = lexy;
	assign cpu_wr  = tapu;
	assign cpu_wr2 = cupa;
	assign cpu_rd  = tedo;
	assign cpu_rd2 = asot;

	wire ryfo, semy, sapa, rolo, refa;
	assign #T_AND  ryfo = a[2] && a00_07 && ffxx;
	assign #T_NOR  semy = !(a[7] || a[6] || a[5] || a[4]);
	assign #T_AND  sapa = a[0] && a[1] && a[2] && a[3];
	assign #T_NAND rolo = !(semy && sapa && ffxx && cpu_rd);
	assign #T_NAND refa = !(semy && sapa && ffxx && cpu_wr_raw);
	assign ff04_ff07 = ryfo;
	assign ff0f_rd   = rolo;
	assign ff0f_wr   = refa;

	wire zyra, zage, zabu, zoke, zera, zufy, zyky, zyga, zovy, zuko, zuvy, zyba, zole, zaje, zubu, zapy;
	wire zete, zefu, zyro, zapa, bootrom_na7, bootrom_na6, bootrom_na3, bootrom_na2;
	wire bootrom_na5_na4, bootrom_na5_a4, bootrom_a5_na4, bootrom_a5_a4;
	wire bootrom_na1_na0, bootrom_na1_a0, bootrom_a1_na0, bootrom_a1_a0;
	assign #T_INV  zyra = !a[7];
	assign #T_INV  zage = !a[6];
	assign #T_INV  zabu = !a[3];
	assign #T_INV  zoke = !a[2];
	assign #T_INV  zera = !a[5];
	assign #T_INV  zufy = !a[4];
	assign #T_AND  zyky = zera && zufy;
	assign #T_AND  zyga = zera && a[4];
	assign #T_AND  zovy = a[5] && zufy;
	assign #T_AND  zuko = a[5] && a[4];
	assign #T_INV  zuvy = !a[1];
	assign #T_INV  zyba = !a[0];
	assign #T_AND  zole = zuvy && zyba;
	assign #T_AND  zaje = zuvy && a[0];
	assign #T_AND  zubu = zyba && a[1];
	assign #T_AND  zapy = a[1] && a[0];
	assign #T_INV  zete = !zole;
	assign #T_INV  zefu = !zaje;
	assign #T_INV  zyro = !zubu;
	assign #T_INV  zapa = !zapy;
	assign bootrom_na7     = zyra;
	assign bootrom_na6     = zage;
	assign bootrom_na3     = zabu;
	assign bootrom_na2     = zoke;
	assign bootrom_na5_na4 = zyky;
	assign bootrom_na5_a4  = zyga;
	assign bootrom_a5_na4  = zovy;
	assign bootrom_a5_a4   = zuko;
	assign bootrom_na1_na0 = zete;
	assign bootrom_na1_a0  = zefu;
	assign bootrom_a1_na0  = zyro;
	assign bootrom_a1_a0   = zapa;

	wire apet, aper, amut, buro;
	assign #T_OR   apet = nt1_t2 || t1_nt2;
	assign #T_NAND aper = !(apet && a[5] && a[6] && cpu_wr && anap);
	dffr dffr_amut(aper, nreset2, d[1], amut); // check edge
	dffr dffr_buro(aper, nreset2, d[0], buro); // check edge
	assign ff60_d1 = amut;
	assign ff60_d0 = buro;

	wire leco, raru, rowe, ryke, ryne, rase, rejy, reka, romy;
	assign #T_NOR  leco = !(bedo || nt1_t2);
	assign #T_TRI  raru = leco ? 1'b1 : 1'bz;
	assign #T_TRI  rowe = leco ? 1'b1 : 1'bz;
	assign #T_TRI  ryke = leco ? 1'b1 : 1'bz;
	assign #T_TRI  ryne = leco ? 1'b1 : 1'bz;
	assign #T_TRI  rase = leco ? 1'b1 : 1'bz;
	assign #T_TRI  rejy = leco ? 1'b1 : 1'bz;
	assign #T_TRI  reka = leco ? 1'b1 : 1'bz;
	assign #T_TRI  romy = leco ? 1'b1 : 1'bz;
	assign d[7] = raru;
	assign d[5] = rowe;
	assign d[6] = ryke;
	assign d[1] = ryne;
	assign d[3] = rase;
	assign d[2] = rejy;
	assign d[4] = reka;
	assign d[0] = romy;

	wire wale, woly, wuta;
	assign #T_NAND wale = !(a[0] && a[1] && a[2] && a[3] && a[4] && a[5] && a[6]);
	assign #T_NAND woly = !(wale && a[7] && ffxx);
	assign #T_INV  wuta = !woly;
	assign hram_cs = woly;

	wire tona, syke, bako, tuna, rycu, rope, soha;
	assign #T_INV  tona = !a[8];
	assign #T_NAND tuna = !(a[15] && a[14] && a[13] && a[12] && a[11] && a[10] && a[9]);
	assign #T_NOR  syke = !(tona || tuna);
	assign #T_INV  bako = !syke;
	assign #T_INV  rycu = !tuna;
	assign #T_INV  soha = !ffxx;
	assign #T_NAND rope = !(rycu && soha);
	assign #T_INV  saro = !rope;
	assign ffxx      = syke;
	assign nffxx     = bako;
	assign nfexxffxx = tuna;

	wire tyro, tufa, texe, sato, tuge, tepu, sypu, tera, yaza, yula, tulo, zoro, zadu, zufa, zado, zery;
	dffr dffr_tepu(tuge, nreset2, sato, tepu); // check edge
	assign #T_NOR  tyro = !(a[7] || a[5] || a[3] || a[2] || a[1] || a[0]);
	assign #T_AND  tufa = a[4] && a[6];
	assign #T_AND  texe = cpu_rd && ffxx && tufa && tyro;
	assign #T_OR   sato = d[0] || tepu;
	assign #T_NAND tuge = !(tyro && tufa && ffxx && cpu_wr);
	assign #T_TRI  sypu = texe ? tepu : 1'bz; /* takes !q output of dff */
	assign #T_INV  tera = !tepu;
	assign #T_INV  yaza = t1_nt2;
	assign #T_AND  tutu = tera && tulo;
	assign #T_AND  yula = yaza && tutu && cpu_rd;
	assign #T_NOR  tulo = !(a[15] || a[14] || a[13] || a[12] || a[11] || a[10] || a[9] || a[8]);
	assign #T_NOR  zoro = !(a[15] || a[14] || a[13] || a[12]);
	assign #T_NOR  zadu = !(a[11] || a[10] || a[9] || a[8]);
	assign #T_AND  zufa = zoro && zadu;
	assign #T_NAND zado = !(yula && zufa);
	assign #T_INV  zery = !zado;
	assign to_cpu_tutu = tutu;
	assign boot_cs     = zery;

endmodule

module ext_cpu_busses(
		d, d_in, d_d,
		a, a_c, a_a, a_d, dma_a,
		wr_a, wr_c, rd_a, rd_c,
		from_cpu3, from_cpu4, from_cpu5,
		cpu_raw_rd, cpu_rd_sync,
		cpu_rd, t1_nt2, nt1_t2, dma_addr_ext,
		abuz, tutu, texo, roru, lula, nfexxffxx,
		ncs_out, tola_na1
	);

	inout  wire [7:0]  d;
	input  wire [7:0]  d_in;
	output wire [7:0]  d_d;
	inout  wire [15:0] a;
	input  wire [15:0] a_c, dma_a;
	output wire [15:0] a_a, a_d;

	output wire wr_a, wr_c, rd_a, rd_c;

	input wire from_cpu3, from_cpu4, from_cpu5;
	input wire cpu_raw_rd, cpu_rd_sync;
	input wire cpu_rd, t1_nt2, nt1_t2, dma_addr_ext;

	input  wire abuz, tutu, nfexxffxx;
	output wire texo, roru, lula;

	output wire ncs_out, tola_na1;

	wire sogy, tuma, tynu, toza, soby, sepy, ryca, raza, syzu, tyho, tazy, rulo, suze;
	assign #T_INV  sogy = !a[14];
	assign #T_AND  tuma = a[13] && sogy && a[15];
	assign #T_AO   tynu = (a[15] && a[14]) || tuma;
	assign #T_AND  toza = tynu && abuz && nfexxffxx;
	assign #T_NOR  soby = !(a[15] || tutu);
	assign #T_NAND sepy = !(abuz && soby);
	assign #T_INV  ryca = !nt1_t2;
	assign #T_INV  raza = a_c[15];
	assign #T_TRI  syzu = !ryca ? !raza : 1'bz;
	assign #T_MUX  tyho = dma_addr_ext ? dma_a[15] : toza;
	assign #T_MUX  tazy = dma_addr_ext ? dma_a[15] : sepy;
	assign #T_NOR  rulo = !(nt1_t2 || tazy);
	assign #T_NAND suze = !(tazy && ryca);
	assign ncs_out = tyho;
	assign a_d[15] = rulo;
	assign a_a[15] = suze;
	assign a[15]   = syzu;

	wire tova, nyre, lonu, lobu, lumy, pate, lysa, luno, pege, muce, mojy, male, pamy, masu, mano;
	wire pahy, puhe, leva, labe, loso, luce, lyny, lepy, rore, roxu, meny, mune, mego, myny, net01;
	latch latch_nyre(mate, a[14], nyre);
	latch latch_lonu(mate, a[13], lonu);
	latch latch_lobu(mate, a[12], lobu);
	latch latch_lumy(mate, a[11], lumy);
	latch latch_pate(mate, a[10], pate);
	latch latch_lysa(mate, a[9],  lysa);
	latch latch_luno(mate, a[8],  luno);
	assign #T_INV  tova = !nt1_t2;
	assign #T_MUX  pege = dma_addr_ext ? dma_a[14] : nyre;
	assign #T_MUX  muce = dma_addr_ext ? dma_a[13] : lonu;
	assign #T_MUX  mojy = dma_addr_ext ? dma_a[12] : lobu;
	assign #T_MUX  male = dma_addr_ext ? dma_a[11] : lumy;
	assign #T_MUX  pamy = dma_addr_ext ? dma_a[10] : pate;
	assign #T_MUX  masu = dma_addr_ext ? dma_a[9]  : lysa;
	assign #T_MUX  mano = dma_addr_ext ? dma_a[8]  : luno;
	assign #T_NOR  pahy = !(nt1_t2 || pege);
	assign #T_NAND puhe = !(pege && tova);
	assign #T_NOR  leva = !(nt1_t2 || muce);
	assign #T_NAND labe = !(muce && tova);
	assign #T_NOR  loso = !(nt1_t2 || mojy);
	assign #T_NAND luce = !(mojy && tova);
	assign #T_NOR  lyny = !(nt1_t2 || male);
	assign #T_NAND lepy = !(male && tova);
	assign #T_NOR  rore = !(nt1_t2 || pamy);
	assign #T_NAND roxu = !(pamy && tova);
	assign #T_NOR  meny = !(nt1_t2 || masu);
	assign #T_NAND mune = !(masu && tova);
	assign #T_NOR  mego = !(nt1_t2 || mano);
	assign #T_NAND myny = !(mano && tova);
	assign net01   = tova;
	assign a_d[14] = pahy;
	assign a_a[14] = puhe;
	assign a_d[13] = leva;
	assign a_a[13] = labe;
	assign a_d[12] = loso;
	assign a_a[12] = luce;
	assign a_d[11] = lyny;
	assign a_a[11] = lepy;
	assign a_d[10] = rore;
	assign a_a[10] = roxu;
	assign a_d[9]  = meny;
	assign a_a[9]  = mune;
	assign a_d[8]  = mego;
	assign a_a[8]  = myny;

	wire arym, aros, atev, avys, aret, alyr, apur, alor, asur, atyr, atov, atem, amer, apok, atol, amet;
	wire colo, defy, cyka, cepu, ajav, badu, bevo, byla, bola, boty, bajo, boku, cotu, caba, koty, kupo;
	latch latch_arym(mate, a[7], arym);
	latch latch_aros(mate, a[6], aros);
	latch latch_atev(mate, a[5], atev);
	latch latch_avys(mate, a[4], avys);
	latch latch_aret(mate, a[3], aret);
	latch latch_alyr(mate, a[2], alyr);
	latch latch_apur(mate, a[1], apur);
	latch latch_alor(mate, a[0], alor);
	assign #T_MUX  asur = dma_addr_ext ? dma_a[7] : arym;
	assign #T_MUX  atyr = dma_addr_ext ? dma_a[6] : aros;
	assign #T_MUX  atov = dma_addr_ext ? dma_a[5] : atev;
	assign #T_MUX  atem = dma_addr_ext ? dma_a[4] : avys;
	assign #T_MUX  amer = dma_addr_ext ? dma_a[3] : aret;
	assign #T_MUX  apok = dma_addr_ext ? dma_a[2] : alyr;
	assign #T_MUX  atol = dma_addr_ext ? dma_a[1] : apur;
	assign #T_MUX  amet = dma_addr_ext ? dma_a[0] : alor;
	assign #T_NOR  colo = !(nt1_t2 || asur);
	assign #T_NAND defy = !(net01 && asur);
	assign #T_NOR  cyka = !(nt1_t2 || atyr);
	assign #T_NAND cepu = !(net01 && atyr);
	assign #T_NOR  ajav = !(nt1_t2 || atov);
	assign #T_NAND badu = !(net01 && atov);
	assign #T_NOR  bevo = !(nt1_t2 || atem);
	assign #T_NAND byla = !(net01 && atem);
	assign #T_NOR  bola = !(nt1_t2 || amer);
	assign #T_NAND boty = !(net01 && amer);
	assign #T_NOR  bajo = !(nt1_t2 || apok);
	assign #T_NAND boku = !(net01 && apok);
	assign #T_NOR  cotu = !(nt1_t2 || atol);
	assign #T_NAND caba = !(net01 && atol);
	assign #T_NOR  koty = !(nt1_t2 || amet);
	assign #T_NAND kupo = !(net01 && amet);
	assign a_d[7] = colo;
	assign a_a[7] = defy;
	assign a_d[6] = cyka;
	assign a_a[6] = cepu;
	assign a_d[5] = ajav;
	assign a_a[5] = badu;
	assign a_d[4] = bevo;
	assign a_a[4] = byla;
	assign a_d[3] = bola;
	assign a_a[3] = boty;
	assign a_d[2] = bajo;
	assign a_a[2] = boku;
	assign a_d[1] = cotu;
	assign a_a[1] = caba;
	assign a_d[0] = koty;
	assign a_a[0] = kupo;

	wire tola, mule, loxo, lasy, mate, sore, tevy, levo, lagu;
	assign #T_INV  tola = !a[1];
	assign #T_INV  mule = !t1_nt2;
	assign #T_AO   loxo = (mule && texo) || t1_nt2;
	assign #T_INV  lasy = !loxo;
	assign #T_INV  mate = !lasy;
	assign #T_INV  sore = !a[15];
	assign #T_OR   tevy = a[13] || a[14] || sore;
	assign #T_AND  texo = from_cpu4 && tevy;
	assign #T_INV  levo = !texo;
	assign #T_AO   lagu = (cpu_raw_rd && levo) || from_cpu3;
	assign tola_na1 = tola;

	wire moca, mexo, lywe, nevy, moty, puva, tymu, usuf, uver, ugac, urun;
	assign #T_NOR  moca = !(texo || t1_nt2);
	assign #T_INV  mexo = !cpu_rd_sync;
	assign #T_INV  lywe = !lagu;
	assign #T_OR   nevy = mexo || moca;
	assign #T_OR   moty = moca || lywe;
	assign #T_OR   puva = nevy || dma_addr_ext;
	assign #T_NOR  tymu = !(dma_addr_ext || moty);
	assign #T_NOR  usuf = !(nt1_t2 || puva);
	assign #T_NAND uver = !(puva && net01);
	assign #T_NAND ugac = !(net01 && tymu);
	assign #T_NOR  urun = !(tymu || nt1_t2);
	assign wr_c = usuf;
	assign wr_a = uver;
	assign rd_a = ugac;
	assign rd_c = urun;

	wire base, afec, buxu, camu, cygu, cogo, kova, anar, azuv, akan, byxe, byne, byna, kejo;
	assign #T_INV  base = !a_c[3];
	assign #T_INV  afec = !a_c[4];
	assign #T_INV  buxu = !a_c[2];
	assign #T_INV  camu = !a_c[1];
	assign #T_INV  cygu = !a_c[6];
	assign #T_INV  cogo = !a_c[7];
	assign #T_INV  kova = !a_c[0];
	assign #T_TRI  anar = !net01 ? !base : 1'bz;
	assign #T_TRI  azuv = !net01 ? !afec : 1'bz;
	assign #T_TRI  akan = !net01 ? !buxu : 1'bz;
	assign #T_TRI  byxe = !net01 ? !camu : 1'bz;
	assign #T_TRI  byne = !net01 ? !cygu : 1'bz;
	assign #T_TRI  byna = !net01 ? !cogo : 1'bz;
	assign #T_TRI  kejo = !net01 ? !kova : 1'bz;
	assign a[3] = anar;
	assign a[4] = azuv;
	assign a[2] = akan;
	assign a[1] = byxe;
	assign a[6] = byne;
	assign a[7] = byna;
	assign a[0] = kejo;

	wire lahe, lura, mujy, pevo, mady, nena, sura, abup, lyna, lefy, lofa, nefe, lora, mapu, rala, ajov;
	assign #T_INV  lahe = !a_c[12];
	assign #T_INV  lura = !a_c[13];
	assign #T_INV  mujy = !a_c[8];
	assign #T_INV  pevo = !a_c[14];
	assign #T_INV  mady = !a_c[11];
	assign #T_INV  nena = !a_c[9];
	assign #T_INV  sura = !a_c[10];
	assign #T_INV  abup = !a_c[5];
	assign #T_TRI  lyna = !net01 ? !lahe : 1'bz;
	assign #T_TRI  lefy = !net01 ? !lura : 1'bz;
	assign #T_TRI  lofa = !net01 ? !mujy : 1'bz;
	assign #T_TRI  nefe = !net01 ? !pevo : 1'bz;
	assign #T_TRI  lora = !net01 ? !mady : 1'bz;
	assign #T_TRI  mapu = !net01 ? !nena : 1'bz;
	assign #T_TRI  rala = !net01 ? !sura : 1'bz;
	assign #T_TRI  ajov = !net01 ? !abup : 1'bz;
	assign a[12] = lyna;
	assign a[13] = lefy;
	assign a[8]  = lofa;
	assign a[14] = nefe;
	assign a[11] = lora;
	assign a[9]  = mapu;
	assign a[10] = rala;
	assign a[5]  = ajov;

	wire redu, rogy, ryda, rune, resy, rypu, suly, seze, tamu;
	assign #T_INV  redu = !cpu_rd;
	assign #T_MUX  roru = nt1_t2 ? redu : moty;
	assign #T_INV  lula = !roru;
	assign #T_NOR  rogy = !(roru || d[6]);
	assign #T_NOR  ryda = !(roru || d[7]);
	assign #T_NOR  rune = !(roru || d[0]);
	assign #T_NOR  resy = !(roru || d[4]);
	assign #T_NOR  rypu = !(roru || d[1]);
	assign #T_NOR  suly = !(roru || d[2]);
	assign #T_NOR  seze = !(roru || d[3]);
	assign #T_NOR  tamu = !(roru || d[5]);
	assign d_d[6] = rogy;
	assign d_d[7] = ryda;
	assign d_d[0] = rune;
	assign d_d[4] = resy;
	assign d_d[1] = rypu;
	assign d_d[2] = suly;
	assign d_d[3] = seze;
	assign d_d[5] = tamu;

	wire lavo, sody, selo, rony, soma, raxy, rupa, sago, sazy;
	wire tepe, tavo, ruvo, ryma, ryko, sevu, safo, taju;
	latch latch_sody(lavo, d_in[4], sody);
	latch latch_selo(lavo, d_in[3], selo);
	latch latch_rony(lavo, d_in[1], rony);
	latch latch_soma(lavo, d_in[0], soma);
	latch latch_raxy(lavo, d_in[2], raxy);
	latch latch_rupa(lavo, d_in[6], rupa);
	latch latch_sago(lavo, d_in[5], sago);
	latch latch_sazy(lavo, d_in[7], sazy);
	assign #T_NAND lavo = !(cpu_raw_rd && texo && from_cpu5);
	assign #T_TRI  tepe = !lavo ? !sody : 1'bz;
	assign #T_TRI  tavo = !lavo ? !selo : 1'bz;
	assign #T_TRI  ruvo = !lavo ? !rony : 1'bz;
	assign #T_TRI  ryma = !lavo ? !soma : 1'bz;
	assign #T_TRI  ryko = !lavo ? !raxy : 1'bz;
	assign #T_TRI  sevu = !lavo ? !rupa : 1'bz;
	assign #T_TRI  safo = !lavo ? !sago : 1'bz;
	assign #T_TRI  taju = !lavo ? !sazy : 1'bz;
	assign d[4] = tepe;
	assign d[3] = tavo;
	assign d[1] = ruvo;
	assign d[0] = ryma;
	assign d[2] = ryko;
	assign d[6] = sevu;
	assign d[5] = safo;
	assign d[7] = taju;

endmodule

module apu_ctrl(
		cpu_rd,
		nreset2,
		d,
		from_cpu,
		ff26,
		apu_wr,
		apu_reset,
		napu_reset5,
		apuv_4mhz,
		ajer_2mhz,
		byfe_128hz,
		fero_q
	);

	input wire cpu_rd;
	input wire nreset2;

	inout wire [7:0] d;

	input wire from_cpu;

	input wire ff26;

	input  wire apu_wr;
	output wire apu_reset;
	output wire napu_reset5;
	input  wire apuv_4mhz;
	output wire ajer_2mhz;
	input  wire byfe_128hz;
	output wire fero_q;

	wire ajer, bata, calo, dyfa, dyfa_1mhz;
	dffr dffr_ajer(apuv_4mhz, napu_reset3, !ajer, ajer); // check edge
	dffr dffr_calo(bata,      napu_reset,  !calo, calo); // check edge
	assign #T_INV  bata = !ajer_2mhz;
	assign #T_INV  dyfa = calo; /* takes !q output of dff */
	assign ajer_2mhz = ajer;
	assign dyfa_1mhz = dyfa;

	wire dapa, afat, agur, atyv, kame, cepo;
	wire napu_reset, napu_reset2, napu_reset3, napu_reset4, napu_reset6;
	assign #T_INV  dapa = !apu_reset;
	assign #T_INV  afat = !apu_reset;
	assign #T_INV  agur = !apu_reset;
	assign #T_INV  atyv = !apu_reset;
	assign #T_INV  kame = !apu_reset;
	assign #T_INV  cepo = !apu_reset;
	assign napu_reset4 = dapa;
	assign napu_reset2 = afat;
	assign napu_reset  = agur;
	assign napu_reset3 = atyv;
	assign napu_reset5 = kame;
	assign napu_reset6 = cepo;

	wire kydu, jure, hapo, gufo, jyro, kuby, keba, hawu, hada, hope, bopy, bowy, baza, cely, cone, cate;
	wire kepy, etuc, foku, efop, fero, edek, net03;
	dffr dffr_hada(hawu,       gufo,        d[7], hada); // check edge
	dffr dffr_bowy(bopy,       kepy,        d[5], bowy); // check edge
	dffr dffr_baza(!ajer_2mhz, napu_reset3, bowy, baza); // check edge
	dffr dffr_fero(foku,       kepy,        efop, fero); // check edge
	assign #T_INV  kydu = !ncpu_rd;
	assign #T_NAND jure = !(kydu && ff26);
	assign #T_NAND hawu = !(ff26 && apu_wr);
	assign #T_NAND bopy = !(apu_wr && ff26);
	assign #T_INV  kepy = !jyro;
	assign #T_INV  hapo = !nreset2;
	assign #T_INV  gufo = !hapo;
	assign #T_OR   jyro = hapo || !hada;
	assign #T_TRI  hope = !jure ? !hada : 1'bz;
	assign #T_INV  kuby = !jyro;
	assign #T_INV  keba = !kuby;
	assign #T_MUX  cely = net03 ? baza : byfe_128hz;
	assign #T_INV  cone = !cely;
	assign #T_INV  cate = !cone;
	assign #T_AND  etuc = apu_wr && ff26;
	assign #T_AND  efop = d[4] && from_cpu;
	assign #T_INV  foku = !etuc;
	assign #T_INV  edek = fero; /* takes !q output of dff */
	assign apu_reset = keba;
	assign fero_q    = fero;
	assign net03     = edek;
	assign d[7]      = hope;

	wire aguz, ncpu_rd;
	assign #T_INV  aguz = !cpu_rd;
	assign ncpu_rd = aguz;

endmodule

module vram_ifc(
		d, d_in, d_a,
		nt1_t2,
		roru, lula, bedo
	);

	inout  wire [7:0] d;
	input  wire [7:0] d_in;
	output wire [7:0] d_a;

	input wire nt1_t2;
	input wire roru, lula, bedo;

	wire ryvo, rera, raby, rory, ruja, ravu, rafy, ruxa;
	assign #T_NAND ryvo = !(d[5] && lula);
	assign #T_NAND rera = !(d[3] && lula);
	assign #T_NAND raby = !(d[2] && lula);
	assign #T_NAND rory = !(d[4] && lula);
	assign #T_NAND ruja = !(d[1] && lula);
	assign #T_NAND ravu = !(d[7] && lula);
	assign #T_NAND rafy = !(d[6] && lula);
	assign #T_NAND ruxa = !(d[0] && lula);
	assign d_a[5] = ryvo;
	assign d_a[3] = rera;
	assign d_a[2] = raby;
	assign d_a[4] = rory;
	assign d_a[1] = ruja;
	assign d_a[7] = ravu;
	assign d_a[6] = rafy;
	assign d_a[0] = ruxa;

	wire runy, tuso, sole, tahy, tesu, taxo, tovu, tazu, tewa, sosa, sedu;
	assign         runy = 1'b1;
	assign #T_NOR  tuso = !(nt1_t2 || bedo);
	assign #T_INV  sole = !tuso;
	assign #T_TRI  tahy = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tesu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  taxo = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tovu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tazu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tewa = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  sosa = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  sedu = !runy ? !sole : 1'bz; // check enable input polarity
	assign d[4] = tahy;
	assign d[5] = tesu;
	assign d[3] = taxo;
	assign d[0] = tovu;
	assign d[6] = tazu;
	assign d[7] = tewa;
	assign d[1] = sosa;
	assign d[2] = sedu;

	wire lyra, ryba, ruzy, rome, tehe, soca, ratu, tovo, saza;
	wire ropa, sywa, sugu, tute, temy, sajo, tuty, tawo;
	assign #T_NAND lyra = !(nt1_t2 && roru);
	assign #T_INV  ryba = !d_in[7];
	assign #T_INV  ruzy = !d_in[1];
	assign #T_INV  rome = !d_in[2];
	assign #T_INV  tehe = !d_in[4];
	assign #T_INV  soca = !d_in[6];
	assign #T_INV  ratu = !d_in[5];
	assign #T_INV  tovo = !d_in[0];
	assign #T_INV  saza = !d_in[3];
	assign #T_TRI  ropa = !lyra ? !ryba : 1'bz; // check enable input polarity
	assign #T_TRI  sywa = !lyra ? !ruzy : 1'bz; // check enable input polarity
	assign #T_TRI  sugu = !lyra ? !rome : 1'bz; // check enable input polarity
	assign #T_TRI  tute = !lyra ? !tehe : 1'bz; // check enable input polarity
	assign #T_TRI  temy = !lyra ? !soca : 1'bz; // check enable input polarity
	assign #T_TRI  sajo = !lyra ? !ratu : 1'bz; // check enable input polarity
	assign #T_TRI  tuty = !lyra ? !tovo : 1'bz; // check enable input polarity
	assign #T_TRI  tawo = !lyra ? !saza : 1'bz; // check enable input polarity
	assign d[7] = ropa;
	assign d[1] = sywa;
	assign d[2] = sugu;
	assign d[4] = tute;
	assign d[6] = temy;
	assign d[5] = sajo;
	assign d[0] = tuty;
	assign d[3] = tawo;

endmodule

module dffr(clk, nreset, d, q);

	parameter INITIAL_Q = 2;

	input  wire clk, nreset, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(posedge clk or negedge nreset) begin
		if (nreset)
			ff <= (d === 1'bx) ? $random : d;
		else
			ff <= 0;
	end

	assign #T_DFFR q = ff;

endmodule

module dff(clk, d, q);

	parameter INITIAL_Q = 2;

	input  wire clk, d;
	output wire q;

	reg ff;

	initial if (INITIAL_Q != 0 && INITIAL_Q != 1) ff = $random; else ff = INITIAL_Q;

	always @(posedge clk) begin
		ff <= (d === 1'bx) ? $random : d;
	end

	assign #T_DFF q = ff;

endmodule

module latch(c, d, q);

	input  wire c, d;
	output wire q;

	assign #T_LATCH q = c ? d : q;

endmodule
