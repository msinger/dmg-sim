`default_nettype none
`timescale 1ns/100ps

parameter T_INV  = 2;
parameter T_AND  = 4;
parameter T_NAND = 2;
parameter T_OR   = 4;
parameter T_NOR  = 2;
parameter T_OA   = 6;
parameter T_MUX  = 6;
parameter T_TRI  = 2;
parameter T_DTFF = 8;

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

	wire [7:0] d;

	wire arys, anos, avet;
	assign #T_INV  arys = !clkin_b;
	assign #T_NAND anos = !(clkin_b && avet);
	assign #T_NAND avet = !(anos && arys);

	wire atal, atal_4mhz;
	assign #T_INV  atal = !avet;
	assign atal_4mhz = atal;

	wire azof, zaxy, zeme, alet, lape, tava, atag, amuk, clk1, clk2, clk4, clk5, amuk_4mhz;
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

	wire aryf, apuv, cybo, bela, cery, aryf_4mhz, apuv_4mhz, cery_2mhz;
	assign #T_INV  aryf = !amuk;
	assign #T_INV  apuv = !amuk;
	assign #T_INV  cybo = !amuk;
	assign #T_INV  bela = !apu_reset;
	dtff dtff_cery(cybo, bela, !cery, cery);
	assign aryf_4mhz = aryf;
	assign apuv_4mhz = apuv;
	assign cery_2mhz = cery;

	wire dula, cunu, xore, walu, wesy, xebe, nreset6, reset7, nreset7, nreset8, nreset9;
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

	wire adyk, afur, alef, apuk, abol, ucob, uvyt, nclkin_a, nphi_out;
	wire adar, atyp, afep, arov, afas, ajax, bugo, arev, apov, agut, awod, abuz, bate, basu, buke, cpu_rd_sync;
	dtff dtff_adyk(atal_4mhz,  nt1_nt2, apuk,  adyk);
	dtff dtff_afur(!atal_4mhz, nt1_nt2, !adyk, afur);
	dtff dtff_alef(atal_4mhz,  nt1_nt2, afur,  alef);
	dtff dtff_apuk(!atal_4mhz, nt1_nt2, alef,  apuk);
	assign #T_INV  abol = !clk_from_cpu;
	assign #T_INV  ucob = !clkin_a;
	assign #T_INV  uvyt = !phi_out;
	assign #T_INV  adar = !adyk;
	assign #T_INV  atyp = afur; /* takes !q output of dtff */
	assign #T_INV  afep = !alef;
	assign #T_INV  arov = apuk; /* takes !q output of dtff */
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

	wire ubet, uvar, upoj, unor, umut, nt1_nt2, nt1_t2, t1_nt2;
	assign #T_INV  ubet = !t1;
	assign #T_INV  uvar = !t2;
	assign #T_NAND upoj = !(ubet && uvar && reset);
	assign #T_AND  unor = t2 && ubet;
	assign #T_AND  umut = uvar && t1;
	assign nt1_nt2 = upoj;
	assign nt1_t2  = unor;
	assign t1_nt2  = umut;

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

	wire bele, atez, byju, alyp, buty, baly, afar, buvu, boga, asol, boma, byxo, bedo, bowa, afer, avor, alur;
	wire boga1mhz, to_cpu, nreset2;
	dtff dtff_afer(boma, nt1_nt2, asol, afer); // check clk edge
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
	dtff dtff_tama(!unyk,    nreset_div, !tama, tama);
	dtff dtff_unyk(!tero,    nreset_div, !unyk, unyk);
	dtff dtff_tero(!uner,    nreset_div, !tero, tero);
	dtff dtff_uner(!ufor,    nreset_div, !uner, uner);
	dtff dtff_ufor(!ukup,    nreset_div, !ufor, ufor);
	dtff dtff_ukup(boga1mhz, nreset_div, !ukup, ukup);
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
	dtff dtff_ugot(ulur,  nreset_div, !ugot, ugot);
	dtff dtff_tulu(!ugot, nreset_div, !tulu, tulu);
	dtff dtff_tugo(!tulu, nreset_div, !tugo, tugo);
	dtff dtff_tofe(!tugo, nreset_div, !tofe, tofe);
	dtff dtff_teru(!tofe, nreset_div, !teru, teru);
	dtff dtff_sola(!teru, nreset_div, !sola, sola);
	dtff dtff_subu(!sola, nreset_div, !subu, subu);
	dtff dtff_teka(!subu, nreset_div, !teka, teka);
	dtff dtff_uket(!teka, nreset_div, !uket, uket);
	dtff dtff_upof(!uket, nreset_div, !upof, upof);
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

	/* not yet generated signals */
	wire apu_reset = 0;
	wire ff40_d7 = 0;
	wire from_cpu3 = 1;
	wire from_cpu4 = 0;
	wire clk_from_cpu = 1;
	wire ff04_ff07 = 0;
	wire cpu_wr = 0;
	wire cpu_rd = 0;
	wire tola_na1 = 1;
	wire tovy_na0 = 1;
	wire ff60_d1 = 0;

endmodule

module dtff(clk, nreset, d, q);

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

	assign #T_DTFF q = ff;

endmodule
