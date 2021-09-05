`default_nettype none

module channel4(
		inout tri logic [7:0] d,

		input logic ncpu_rd, apu_reset, napu_reset4, nphi, net03,
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
	logic ch4_lfsr_clk1, ch4_lfsr_clk2, ch4_lfsr_clk3, nff23_d6, ch4_bit;
	dffr dffr_esep(!dere, napu_reset4, !esep, esep); // check clk edge
	dffr dffr_dere(!dota, napu_reset4, !dere, dere); // check clk edge
	dffr dffr_dota(!erut, napu_reset4, !dota, dota); // check clk edge
	dffr dffr_erut(!dete, napu_reset4, !erut, erut); // check clk edge
	dffr dffr_dete(!dose, napu_reset4, !dete, dete); // check clk edge
	dffr dffr_dose(!demo, napu_reset4, !dose, dose); // check clk edge
	dffr dffr_demo(!doke, napu_reset4, !demo, demo); // check clk edge
	dffr dffr_doke(!dale, napu_reset4, !doke, doke); // check clk edge
	dffr dffr_dale(!dure, napu_reset4, !dale, dale); // check clk edge
	dffr dffr_dure(!epor, napu_reset4, !dure, dure); // check clk edge
	dffr dffr_epor(!ezef, napu_reset4, !epor, epor); // check clk edge
	dffr dffr_ezef(!deko, napu_reset4, !ezef, ezef); // check clk edge
	dffr dffr_deko(!cexo, napu_reset4, !deko, deko); // check clk edge
	dffr dffr_cexo(cary,  napu_reset4, !cexo, cexo); // check clk edge
	assign #T_NOR  emof = !(nff22_d4 || nff22_d5 || nff22_d6);
	assign #T_NOR  elar = !(nff22_d6 || nff22_d5 || ff22_d4);
	assign #T_NOR  dudu = !(nff22_d6 || ff22_d5 || nff22_d4);
	assign #T_NOR  etat = !(nff22_d6 || ff22_d5 || ff22_d4);
	assign #T_NOR  fura = !(ff22_d6 || nff22_d5 || nff22_d4);
	assign #T_NOR  etar = !(ff22_d6 || nff22_d5 || ff22_d4);
	assign #T_NOR  ever = !(ff22_d6 || ff22_d5 || nff22_d4);
	assign #T_NOR  etov = !(ff22_d6 || ff22_d5 || ff22_d4);
	assign #T_AOI  etyr = !((esep && dudu) || (dere && etat) || (dota && fura) ||
	                        (erut && etar) || (dete && ever) || (dose && etov));
	assign #T_AOI  elyx = !((demo && emof) || (doke && elar) || (dale && dudu) || (dure && etat));
	assign #T_AOI  dary = !((epor && fura) || (ezef && etar) || (deko && ever) || (cexo && etov));
	assign #T_OR   eryf = dary || elyx;
	assign #T_MUX  feme = ff22_d7 ? etyr : eryf;
	assign #T_MUX  ezul = dyry ? feme : lfsr_out;
	assign #T_INV  gufa = !feme;
	assign #T_INV  gyve = !gufa;
	assign #T_INV  kara = !gyve;
	assign #T_INV  kopa = !kara;
	assign #T_INV  cosa = !ncpu_rd;
	assign #T_AND  dyry = nff23_d6 && net03;
	assign #T_INV  cepy = !ff23_d6;
	assign #T_AND  como = dyry && cosa;
	assign #T_AND  cote = cepy && net03;
	assign #T_NAND bagu = !(ff23 && como);
	assign #T_INV  befa = !cary;
	assign #T_OR   dato = ezul || cote;
	assign #T_TRI  atel = !bagu ? !befa : 'z;
	assign ch4_lfsr_clk1 = feme;
	assign ch4_lfsr_clk2 = gyve;
	assign ch4_lfsr_clk3 = kopa;
	assign nff23_d6 = cepy;
	assign ch4_bit  = dato;
	assign d[0] = atel;

	logic felo, fole, etef, edyf, elaf, feko, faty, feru, fyro, akof, byzy, apyr, boza;
	logic daro, cuty, dubo, emet, evur, fyno, enur, erox;
	dffr dffr_fyno(ch4_eg_tick, emet, evur, fyno); // check clk edge
	count count_feko(fole, ch4_restart, ff21_d4, feko);
	count count_faty(etef, ch4_restart, ff21_d5, faty);
	count count_feru(edyf, ch4_restart, ff21_d6, feru);
	count count_fyro(elaf, ch4_restart, ff21_d7, fyro);
	srlatch latch_erox(fyno, enur, erox);
	assign #T_OR   felo = ch4_eg_tick || ch4_eg_disable || erox;
	assign #T_AOI  fole = !((felo && ff21_d3) || (felo && nff21_d3));
	assign #T_AOI  etef = !((feko && ff21_d3) || (!feko && nff21_d3));
	assign #T_AOI  edyf = !((faty && ff21_d3) || (!faty && nff21_d3));
	assign #T_AOI  elaf = !((feru && ff21_d3) || (!feru && nff21_d3));
	assign #T_AND  akof = feko && ch4_bit;
	assign #T_AND  byzy = faty && ch4_bit;
	assign #T_AND  apyr = feru && ch4_bit;
	assign #T_AND  boza = fyro && ch4_bit;
	assign #T_NOR  daro = !(ff21_d3 || feko || faty || feru || fyro);
	assign #T_NAND cuty = !(ff21_d3 && feko && faty && feru && fyro);
	assign #T_INV  dubo = !cuty;
	assign #T_NOR  emet = !(ch4_restart || apu_reset);
	assign #T_OR   evur = daro || dubo;
	assign #T_OR   enur = apu_reset || ch4_restart;
	assign ch4_out = { boza, apyr, byzy, akof };

	logic alop, boky, abel, bawa, buxo, dogo, cofe, cuna, ejex;
	logic fosy, enec, dapy, gexe, hury, fowa, gopa;
	logic ch4_eg_tick, ch4_eg_disable;
	dffr dffr_abel(alop,       boky, !abel, abel); // check clk edge
	dffr dffr_fosy(horu_512hz, gopa, ejex,  fosy); // check clk edge
	count count_dogo(cofe, dapy, nff21_d2, dogo);
	count count_cofe(cuna, dapy, nff21_d1, cofe);
	count count_cuna(buxo, dapy, nff21_d0, cuna);
	assign #T_INV  alop = !byfe_128hz;
	assign #T_INV  boky = !apu_reset;
	assign #T_INV  bawa = !abel;
	assign #T_INV  buxo = !bawa;
	assign #T_AND  ejex = dogo && cofe && cuna;
	assign #T_NOR  enec = !(ch4_restart || fosy);
	assign #T_INV  dapy = !enec;
	assign #T_INV  gexe = !fosy;
	assign #T_NOR  hury = !(horu_512hz || gexe);
	assign #T_NOR  fowa = !(ff21_d0 || ff21_d1 || ff21_d2);
	assign #T_NOR  gopa = !(hury || fowa || ch4_restart || apu_reset);
	assign ch4_eg_tick    = fosy;
	assign ch4_eg_disable = fowa;

	logic gaso, fale, helu, gysu, hazo, guzy, gone, feby, gora, gaty, hapu;
	logic gevy, efot, hery, fegy, jery, gena, kyku, juwa, kony, kanu;
	logic jyco, jyre, jyfu, hyno, gyba, gary, cary, gofu, guny, huce;
	logic gepo, goge, jyja, kavu, game, hura, lfsr_out;
	logic jepe, javo, hepa, hory, heno, hyro, hezu;
	logic joto, komu, ketu, kuta, kuzy, kywy, jaju, hape, juxe;
	dffr dffr_gysu(nphi,          gaso, ff23_d7, gysu); // check clk edge
	dffr dffr_gone(hama_512k,     fale, !hazo,   gone); // check clk edge
	dffr dffr_gora(hama_512k,     feby, gone,    gora); // check clk edge
	dffr dffr_gaty(hama_512k,     feby, gora,    gaty); // check clk edge
	dffr dffr_gary(gyba,          guny, hyno,    gary); // check clk edge
	dffr dffr_jepe(ch4_lfsr_clk2, goge, kavu,    jepe); // check clk edge
	dffr dffr_javo(ch4_lfsr_clk2, goge, jepe,    javo); // check clk edge
	dffr dffr_hepa(ch4_lfsr_clk1, goge, javo,    hepa); // check clk edge
	dffr dffr_hory(ch4_lfsr_clk1, goge, hepa,    hory); // check clk edge
	dffr dffr_heno(ch4_lfsr_clk1, goge, hory,    heno); // check clk edge
	dffr dffr_hyro(ch4_lfsr_clk1, goge, heno,    hyro); // check clk edge
	dffr dffr_hezu(ch4_lfsr_clk1, goge, hyro,    hezu); // check clk edge
	dffr dffr_joto(jyja,          goge, hura,    joto); // check clk edge
	dffr dffr_komu(ch4_lfsr_clk3, goge, joto,    komu); // check clk edge
	dffr dffr_ketu(ch4_lfsr_clk3, goge, komu,    ketu); // check clk edge
	dffr dffr_kuta(ch4_lfsr_clk3, goge, ketu,    kuta); // check clk edge
	dffr dffr_kuzy(ch4_lfsr_clk3, goge, kuta,    kuzy); // check clk edge
	dffr dffr_kywy(ch4_lfsr_clk3, goge, kuzy,    kywy); // check clk edge
	dffr dffr_jaju(ch4_lfsr_clk2, goge, kywy,    jaju); // check clk edge
	dffr dffr_hape(ch4_lfsr_clk2, goge, jaju,    hape); // check clk edge
	dffr dffr_juxe(ch4_lfsr_clk2, goge, hape,    juxe); // check clk edge
	count count_jyco(kanu, huce, nff22_d0, jyco);
	count count_jyre(jyco, huce, nff22_d1, jyre);
	count count_jyfu(jyre, huce, nff22_d2, jyfu);
	srlatch latch_gena(ch4_restart, fegy,  gena);
	srlatch latch_hazo(helu,        gysu,  hazo);
	srlatch latch_jery(!hapu,       !hery, jery); /* srlatch with !s & !r inputs */
	assign #T_INV  gaso = !apu_reset;
	assign #T_NOR  fale = !(apu_reset || gora);
	assign #T_INV  helu = !fale;
	assign #T_NOR  guzy = !(apu_reset || gysu);
	assign #T_INV  feby = !apu_reset;
	assign #T_INV  hapu = !gaty;
	assign #T_NOR  gevy = !(ff21_d3 || ff21_d4 || ff21_d5 || ff21_d6 || ff21_d7);
	assign #T_AND  efot = ff23_d6 && fugo_q;
	assign #T_NOR  hery = !(gevy || apu_reset);
	assign #T_OR   fegy = apu_reset || efot || gevy;
	assign #T_OR   kyku = !jery || jeso_512k; /* takes !q output of srlatch */
	assign #T_INV  juwa = !gena;
	assign #T_INV  kony = !kyku;
	assign #T_INV  kanu = !kony;
	assign #T_OR   hyno = jyfu || jyre || jyco;
	assign #T_INV  gyba = !bavu_1mhz;
	assign #T_AND  cary = bavu_1mhz && gary;
	assign #T_NOR  gofu = !(ch4_restart || gary);
	assign #T_NOR  guny = !(apu_reset || ch4_restart);
	assign #T_INV  huce = !gofu;
	assign #T_OR   gepo = ch4_restart || apu_reset;
	assign #T_INV  goge = !gepo;
	assign #T_INV  jyja = !ch4_lfsr_clk1;
	assign #T_AOI  kavu = !((joto && ff22_d3) || (nff22_d3 && juxe));
	assign #T_NAND game = !(gena && hezu);
	assign #T_XNOR hura = hyro == hezu;
	assign rst_ff23_d7 = guzy;
	assign ch4_restart = gone;
	assign nch4_amp_en = gevy;
	assign nch4_active = juwa;
	assign lfsr_out    = game;

endmodule
