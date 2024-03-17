`default_nettype none

module ch2_regs(
		inout tri logic [7:0] d,

		input logic apu_wr, apu_reset, napu_reset2, ncpu_rd, net03,

		input  logic ff16, ff17, ff18, ff19,
		output logic nff16_wr, ff16_d6, nff16_d6, ff16_d7, nff16_d7,
		output logic ff17_d0, nff17_d0, ff17_d1, nff17_d1, ff17_d2, nff17_d2,
		output logic ff17_d3, nff17_d3, ff17_d4, ff17_d5, ff17_d6, ff17_d7,
		output logic ff19_d6, nff19_d6, ff19_d7,

		output logic ch2_ftick, beny,

		input logic elox_q, anuj, duce, doca, cogu, erog, dera, gypa
	);

	logic agyn, asyp, bygo, coro, bacu, budu, bamy, bera, ceka, cecy;
	drlatch latch_bamy(bacu, napu_reset2, d[7], bamy);
	drlatch latch_bera(bacu, napu_reset2, d[6], bera);
	assign agyn = !(apu_wr && ff16);
	assign  asyp = !agyn;
	assign  beny = !(asyp || apu_reset || elox_q);
	assign  bygo = !ncpu_rd;
	assign coro = !(ff16 && bygo);
	assign  bacu = ff16 && apu_wr;
	assign  budu = !bacu;
	assign  ceka = !coro ? !(!bamy) : 'z;
	assign  cecy = !coro ? !(!bera) : 'z;
	assign nff16_wr = agyn;
	assign ff16_d7  = bamy;
	assign nff16_d7 = !bamy;
	assign ff16_d6  = bera;
	assign nff16_d6 = !bera;
	assign d[7] = ceka;
	assign d[6] = cecy;

	logic kypu, jenu, kysa, jupy, jany, jefu;
	logic ff19_d0, ff19_d1, ff19_d2;
	drlatch latch_jupy(jenu, kypu, d[2], jupy);
	drlatch latch_jany(jenu, kypu, d[1], jany);
	drlatch latch_jefu(jenu, kypu, d[0], jefu);
	assign  kypu = !apu_reset;
	assign  jenu = ff19 && apu_wr;
	assign  kysa = !jenu;
	assign ff19_d2 = jupy;
	assign ff19_d1 = jany;
	assign ff19_d0 = jefu;

	logic enuf, jybu, fyry, guru, gure, gexa, gere, jede;
	logic gata, fore, gage, gura, gufe, hava, hore, hyfu;
	logic hupe, gene, hyry, horo, here, havu, hyre, huvu;
	drlatch latch_gata(enuf, jybu, d[4], gata);
	drlatch latch_fore(enuf, jybu, d[3], fore);
	drlatch latch_gage(enuf, jybu, d[7], gage);
	drlatch latch_gura(enuf, jybu, d[6], gura);
	drlatch latch_gufe(enuf, jybu, d[5], gufe);
	drlatch latch_hava(gere, jybu, d[2], hava);
	drlatch latch_hore(gere, jybu, d[1], hore);
	drlatch latch_hyfu(gere, jybu, d[0], hyfu);
	assign  enuf = ff17 && apu_wr;
	assign  jybu = !apu_reset;
	assign  fyry = !ff17;
	assign   guru = fyry || ncpu_rd;
	assign  gure = !ff17;
	assign   gexa = gure || ncpu_rd;
	assign  gere = apu_wr && ff17;
	assign  jede = !gere;
	assign  hupe = !guru ? !(!gata) : 'z;
	assign  gene = !guru ? !(!fore) : 'z;
	assign  hyry = !guru ? !(!gage) : 'z;
	assign  horo = !guru ? !(!gura) : 'z;
	assign  here = !guru ? !(!gufe) : 'z;
	assign  havu = !gexa ? !(!hava) : 'z;
	assign  hyre = !gexa ? !(!hore) : 'z;
	assign  huvu = !gexa ? !(!hyfu) : 'z;
	assign ff17_d4  = gata;
	assign ff17_d3  = fore;
	assign nff17_d3 = !fore;
	assign ff17_d7  = gage;
	assign ff17_d6  = gura;
	assign ff17_d5  = gufe;
	assign ff17_d2  = hava;
	assign nff17_d2 = !hava;
	assign ff17_d1  = hore;
	assign nff17_d1 = !hore;
	assign ff17_d0  = hyfu;
	assign nff17_d0 = !hyfu;
	assign d[4] = hupe;
	assign d[3] = gene;
	assign d[7] = hyry;
	assign d[6] = horo;
	assign d[5] = here;
	assign d[2] = havu;
	assign d[1] = hyre;
	assign d[0] = huvu;

	logic dosa, exuc, hude, esur, fyxo, fery, guza, futy, edep;
	logic fofe, fova, fedy, fome, fora, goda, gumy, gupu;
	logic done, dynu, ezof, cyvo, fuxo, gano, goca, gane, gane_nq;
	logic fava, fajy, fegu, fose, gero, gaky, gadu, gazo;
	logic foge, fape, deta, gote, etap, hypo;
	logic gala, hero, hepu, hevy, jeke, jaro, huna;
	drlatch latch_fofe(dosa,  hude, d[0], fofe);
	drlatch latch_fova(dosa,  hude, d[1], fova);
	drlatch latch_fedy(dosa,  hude, d[2], fedy);
	drlatch latch_fome(dosa,  hude, d[3], fome);
	drlatch latch_fora(dosa,  hude, d[4], fora);
	drlatch latch_goda(exuc,  hude, d[5], goda);
	drlatch latch_gumy(exuc,  hude, d[6], gumy);
	drlatch latch_gupu(exuc,  hude, d[7], gupu);
	drlatch latch_etap(!deta, dera, d[7], etap);
	tffd tffd_done(doca, cogu, fofe,    done);
	tffd tffd_dynu(done, cogu, fova,    dynu);
	tffd tffd_ezof(dynu, cogu, fedy,    ezof);
	tffd tffd_cyvo(ezof, cogu, fome,    cyvo);
	tffd tffd_fuxo(edep, erog, fora,    fuxo);
	tffd tffd_gano(fuxo, erog, goda,    gano);
	tffd tffd_goca(gano, erog, gumy,    goca);
	tffd tffd_gane(goca, erog, gupu,    gane);
	tffd tffd_hero(hepu, gypa, ff19_d2, hero);
	tffd tffd_hepu(hevy, gypa, ff19_d1, hepu);
	tffd tffd_hevy(gala, gypa, ff19_d0, hevy);
	assign  dosa = ff18 && apu_wr;
	assign  exuc = ff18 && apu_wr;
	assign  hude = !apu_reset;
	assign  esur = !dosa;
	assign  fyxo = !exuc;
	assign  fery = !ff18;
	assign  guza = !(fery || fape);
	assign  futy = !guza;
	assign  edep = !(!cyvo);
	assign  fava = !futy ? !(!done) : 'z;
	assign  fajy = !futy ? !(!dynu) : 'z;
	assign  fegu = !futy ? !(!ezof) : 'z;
	assign  fose = !futy ? !(!cyvo) : 'z;
	assign  gero = !futy ? !(!fuxo) : 'z;
	assign  gaky = !futy ? !(!gano) : 'z;
	assign  gadu = !futy ? !(!goca) : 'z;
	assign  gazo = !futy ? !(!gane) : 'z;
	assign  foge = !ncpu_rd;
	assign fape = !(foge && net03);
	assign deta = !(apu_wr && ff19);
	assign  gote = !ff19;
	assign   hypo = gote || fape;
	assign  gala = !gane_nq;
	assign  jeke = !hypo ? !(!hero) : 'z;
	assign  jaro = !hypo ? !(!hepu) : 'z;
	assign  huna = !hypo ? !(!hevy) : 'z;
	assign gane_nq   = !gane;
	assign d         = { gazo, gadu, gaky, gero, fose, fegu, fajy, fava };
	assign ff19_d7   = etap;
	assign ch2_ftick = hero;
	assign d[2]      = jeke;
	assign d[1]      = jaro;
	assign d[0]      = huna;

	logic gado, huma, evyf, fazo, emer, gojy;
	drlatch latch_emer(!evyf, fazo, d[6], emer);
	assign  gado = !ncpu_rd;
	assign huma = !(ff19 && gado);
	assign evyf = !(anuj && ff19);
	assign  fazo = !apu_reset;
	assign  gojy = !huma ? !(!emer) : 'z;
	assign ff19_d6  = emer;
	assign nff19_d6 = !emer;
	assign d[6]     = gojy;

endmodule
