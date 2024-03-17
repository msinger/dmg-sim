`default_nettype none

module channel4(
		inout tri logic [7:0] d,

		input logic ncpu_rd, apu_reset, napu_reset4, dova_phi, net03,
		input logic byfe_128hz, horu_512hz, jeso_512k, hama_512k, bavu_1mhz,

		input  logic ff23,
		input  logic ff21_d0, nff21_d0, ff21_d1, nff21_d1, ff21_d2, nff21_d2,
		input  logic ff21_d3, nff21_d3, ff21_d4, ff21_d5, ff21_d6, ff21_d7,
		input  logic nff22_d0, nff22_d1, nff22_d2, ff22_d3, nff22_d3, ff22_d4, nff22_d4,
		input  logic ff22_d5, nff22_d5, ff22_d6, nff22_d6, ff22_d7,
		input  logic ff23_d6, ff23_d7,
		output logic rst_ff23_d7,

		output logic ch4_restart, nch4_active, nch4_amp_en,
		input  logic anuj, fugo_q,

		output logic [3:0] ch4_out
	);

	logic emof, elar, dudu, etat, fura, etar, ever, etov;
	logic esep, dere, dota, erut, dete, dose, demo, doke, dale, dure, epor, ezef, deko, cexo;
	logic etyr, elyx, dary, eryf, feme, ezul, gufa, gyve, kara, kopa;
	logic cosa, dyry, cepy, como, cote, bagu, befa, dato, atel;
	logic ch4_lfsr_clk1, ch4_lfsr_clk2, ch4_lfsr_clk3, ch4_bit;
	dffr_bp dffr_esep(!dere, napu_reset4, !esep, esep);
	dffr_bp dffr_dere(!dota, napu_reset4, !dere, dere);
	dffr_bp dffr_dota(!erut, napu_reset4, !dota, dota);
	dffr_bp dffr_erut(!dete, napu_reset4, !erut, erut);
	dffr_bp dffr_dete(!dose, napu_reset4, !dete, dete);
	dffr_bp dffr_dose(!demo, napu_reset4, !dose, dose);
	dffr_bp dffr_demo(!doke, napu_reset4, !demo, demo);
	dffr_bp dffr_doke(!dale, napu_reset4, !doke, doke);
	dffr_bp dffr_dale(!dure, napu_reset4, !dale, dale);
	dffr_bp dffr_dure(!epor, napu_reset4, !dure, dure);
	dffr_bp dffr_epor(!ezef, napu_reset4, !epor, epor);
	dffr_bp dffr_ezef(!deko, napu_reset4, !ezef, ezef);
	dffr_bp dffr_deko(!cexo, napu_reset4, !deko, deko);
	dffr_bp dffr_cexo(cary,  napu_reset4, !cexo, cexo);
	assign  emof = !(nff22_d4 || nff22_d5 || nff22_d6);
	assign  elar = !(nff22_d6 || nff22_d5 || ff22_d4);
	assign  dudu = !(nff22_d6 || ff22_d5 || nff22_d4);
	assign  etat = !(nff22_d6 || ff22_d5 || ff22_d4);
	assign  fura = !(ff22_d6 || nff22_d5 || nff22_d4);
	assign  etar = !(ff22_d6 || nff22_d5 || ff22_d4);
	assign  ever = !(ff22_d6 || ff22_d5 || nff22_d4);
	assign  etov = !(ff22_d6 || ff22_d5 || ff22_d4);
	assign   etyr = (esep && dudu) || (dere && etat) || (dota && fura) ||
	                      (erut && etar) || (dete && ever) || (dose && etov);
	assign   elyx = (demo && emof) || (doke && elar) || (dale && dudu) || (dure && etat);
	assign   dary = (epor && fura) || (ezef && etar) || (deko && ever) || (cexo && etov);
	assign   eryf = dary || elyx;
	assign  feme = ff22_d7 ? etyr : eryf;
	assign  ezul = dyry ? feme : lfsr_out;
	assign  gufa = !feme;
	assign  gyve = !gufa;
	assign  kara = !gyve;
	assign  kopa = !kara;
	assign  cosa = !ncpu_rd;
	assign  dyry = ff23_d6 && net03;
	assign  cepy = !ff23_d6;
	assign  como = dyry && cosa;
	assign  cote = cepy && net03;
	assign bagu = !(ff23 && como);
	assign  befa = !cary;
	assign   dato = ezul || cote;
	assign  atel = !bagu ? !befa : 'z;
	assign ch4_lfsr_clk1 = feme;
	assign ch4_lfsr_clk2 = gyve;
	assign ch4_lfsr_clk3 = kopa;
	assign ch4_bit  = dato;
	assign d[0] = atel;

	logic felo, fole, etef, edyf, elaf, feko, faty, feru, fyro, akof, byzy, apyr, boza;
	logic daro, cuty, dubo, emet, evur, fyno, enur, erox;
	dffr_bp dffr_fyno(ch4_eg_tick, emet, evur, fyno);
	tffd tffd_feko(fole, ch4_restart, ff21_d4, feko);
	tffd tffd_faty(etef, ch4_restart, ff21_d5, faty);
	tffd tffd_feru(edyf, ch4_restart, ff21_d6, feru);
	tffd tffd_fyro(elaf, ch4_restart, ff21_d7, fyro);
	nor_srlatch latch_erox(fyno, enur, erox,);
	assign   felo = ch4_eg_tick || ch4_eg_disable || erox;
	assign   fole = (felo && ff21_d3) || (felo && nff21_d3);
	assign   etef = (feko && ff21_d3) || (!feko && nff21_d3);
	assign   edyf = (faty && ff21_d3) || (!faty && nff21_d3);
	assign   elaf = (feru && ff21_d3) || (!feru && nff21_d3);
	assign  akof = feko && ch4_bit;
	assign  byzy = faty && ch4_bit;
	assign  apyr = feru && ch4_bit;
	assign  boza = fyro && ch4_bit;
	assign  daro = !(ff21_d3 || feko || faty || feru || fyro);
	assign cuty = !(ff21_d3 && feko && faty && feru && fyro);
	assign  dubo = !cuty;
	assign  emet = !(ch4_restart || apu_reset);
	assign   evur = daro || dubo;
	assign   enur = apu_reset || ch4_restart;
	assign ch4_out = { boza, apyr, byzy, akof };

	logic alop, boky, abel, bawa, buxo, dogo, cofe, cuna, ejex;
	logic fosy, enec, dapy, gexe, hury, fowa, gopa;
	logic ch4_eg_tick, ch4_eg_disable;
	dffr_bp dffr_abel(alop,       boky, !abel, abel);
	dffr_bp dffr_fosy(horu_512hz, gopa, ejex,  fosy);
	tffd tffd_dogo(cofe, dapy, nff21_d2, dogo);
	tffd tffd_cofe(cuna, dapy, nff21_d1, cofe);
	tffd tffd_cuna(buxo, dapy, nff21_d0, cuna);
	assign  alop = !byfe_128hz;
	assign  boky = !apu_reset;
	assign  bawa = !abel;
	assign  buxo = !bawa;
	assign  ejex = dogo && cofe && cuna;
	assign  enec = !(ch4_restart || fosy);
	assign  dapy = !enec;
	assign  gexe = !fosy;
	assign  hury = !(horu_512hz || gexe);
	assign  fowa = !(ff21_d0 || ff21_d1 || ff21_d2);
	assign  gopa = !(hury || fowa || ch4_restart || apu_reset);
	assign ch4_eg_tick    = fosy;
	assign ch4_eg_disable = fowa;

	logic gaso, fale, helu, gysu, hazo, nhazo, guzy, gone, feby, gora, gaty, hapu;
	logic gevy, efot, hery, fegy, jery, njery, gena, kyku, juwa, kony, kanu;
	logic jyco, jyre, jyfu, hyno, gyba, gary, cary, gofu, guny, huce;
	logic gepo, goge, jyja, kavu, game, hura, lfsr_out;
	logic jepe, javo, hepa, hory, heno, hyro, hezu;
	logic joto, komu, ketu, kuta, kuzy, kywy, jaju, hape, juxe;
	dffr_bp dffr_gysu(dova_phi,      gaso, ff23_d7, gysu);
	dffr_bp dffr_gone(hama_512k,     fale, nhazo,   gone);
	dffr_bp dffr_gora(hama_512k,     feby, gone,    gora);
	dffr_bp dffr_gaty(hama_512k,     feby, gora,    gaty);
	dffr_bp dffr_gary(gyba,          guny, hyno,    gary);
	dffr_bp dffr_jepe(ch4_lfsr_clk2, goge, kavu,    jepe);
	dffr_bp dffr_javo(ch4_lfsr_clk2, goge, jepe,    javo);
	dffr_bp dffr_hepa(ch4_lfsr_clk1, goge, javo,    hepa);
	dffr_bp dffr_hory(ch4_lfsr_clk1, goge, hepa,    hory);
	dffr_bp dffr_heno(ch4_lfsr_clk1, goge, hory,    heno);
	dffr_bp dffr_hyro(ch4_lfsr_clk1, goge, heno,    hyro);
	dffr_bp dffr_hezu(ch4_lfsr_clk1, goge, hyro,    hezu);
	dffr_bp dffr_joto(jyja,          goge, hura,    joto);
	dffr_bp dffr_komu(ch4_lfsr_clk3, goge, joto,    komu);
	dffr_bp dffr_ketu(ch4_lfsr_clk3, goge, komu,    ketu);
	dffr_bp dffr_kuta(ch4_lfsr_clk3, goge, ketu,    kuta);
	dffr_bp dffr_kuzy(ch4_lfsr_clk3, goge, kuta,    kuzy);
	dffr_bp dffr_kywy(ch4_lfsr_clk3, goge, kuzy,    kywy);
	dffr_bp dffr_jaju(ch4_lfsr_clk2, goge, kywy,    jaju);
	dffr_bp dffr_hape(ch4_lfsr_clk2, goge, jaju,    hape);
	dffr_bp dffr_juxe(ch4_lfsr_clk2, goge, hape,    juxe);
	tffd tffd_jyco(kanu, huce, nff22_d0, jyco);
	tffd tffd_jyre(jyco, huce, nff22_d1, jyre);
	tffd tffd_jyfu(jyre, huce, nff22_d2, jyfu);
	nor_srlatch  latch_gena(ch4_restart, fegy, gena,);
	nor_srlatch  latch_hazo(helu,        gysu, hazo, nhazo);
	nand_srlatch latch_jery(hapu,        hery, jery, njery);
	assign  gaso = !apu_reset;
	assign  fale = !(apu_reset || gora);
	assign  helu = !fale;
	assign  guzy = !(apu_reset || gysu);
	assign  feby = !apu_reset;
	assign  hapu = !gaty;
	assign  gevy = !(ff21_d3 || ff21_d4 || ff21_d5 || ff21_d6 || ff21_d7);
	assign  efot = ff23_d6 && fugo_q;
	assign  hery = !(gevy || apu_reset);
	assign   fegy = apu_reset || efot || gevy;
	assign   kyku = njery || jeso_512k;
	assign  juwa = !gena;
	assign  kony = !kyku;
	assign  kanu = !kony;
	assign  hyno = jyfu && jyre && jyco;
	assign  gyba = !bavu_1mhz;
	assign  cary = bavu_1mhz && gary;
	assign  gofu = !(ch4_restart || gary);
	assign  guny = !(apu_reset || ch4_restart);
	assign  huce = !gofu;
	assign   gepo = ch4_restart || apu_reset;
	assign  goge = !gepo;
	assign  jyja = !ch4_lfsr_clk1;
	assign   kavu = (joto && ff22_d3) || (nff22_d3 && juxe);
	assign  game = gena && hezu;
	assign hura = hyro == hezu;
	assign rst_ff23_d7 = guzy;
	assign ch4_restart = gone;
	assign nch4_amp_en = gevy;
	assign nch4_active = juwa;
	assign lfsr_out    = game;

endmodule
