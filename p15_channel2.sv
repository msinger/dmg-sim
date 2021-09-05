`default_nettype none

module channel2(
		input logic [7:0] d,

		input logic apu_reset, napu_reset2, nphi, net03,

		input logic byfe_128hz, bufy_256hz, horu_512hz, amuk_4mhz,

		input logic nff16_wr, ff16_d6, nff16_d6, ff16_d7, nff16_d7,
		input logic ff17_d0, nff17_d0, ff17_d1, nff17_d1, ff17_d2, nff17_d2,
		input logic ff17_d3, nff17_d3, ff17_d4, ff17_d5, ff17_d6, ff17_d7,
		input logic ff19_d6, nff19_d6, ff19_d7,

		input  logic ch2_ftick, beny,
		output logic nch2_active, nch2_amp_en,
		output logic elox_q, doca, cogu, erog, dera, gypa,

		output logic [3:0] ch2_out
	);

	logic hota, katy, jyna, kylo, kene, jore, jona, jevy, kyvo;
	logic galu, gyko, etuk, davu, fujy, gyre, duju;
	logic jopa, cywu, hepo, dope, dala, elox, hyly, hypa, hyle;
	logic jake, cexe, jeme, dory, dory_q, doxa, celo, gade, holy, jupu, hofo, hafe;
	logic cyre, deme, dora, fute, dyro, esyk, ares, dane, defu;
	logic bymo, aget, eryc, cera, conu, came, buva, akyd, akyd_nq, buko;
	logic cule, cano, cagy, dyve, dymu, duge, dare, egog, domo, dyta, doju, dove, exes;
	logic buwe, azeg, atep, caza, byho, bufo, bodo, cemo, cemo_1mhz, buta, cama;
	logic fopy, etup, faru, gafa, fena, fomy, fete, feno;
	logic dome, cyse, bonu, emyr, erat, fyre, gufy, amov, asog, anyv, anan;
	dffr dffr_jyna(hota,       katy,        !jyna,   jyna); // check clk edge
	dffr dffr_gyko(galu,       gyre,        !gyko,   gyko); // check clk edge
	dffr dffr_jopa(horu_512hz, hafe,        kyvo,    jopa); // check clk edge
	dffr dffr_hepo(jopa,       hypa,        gufy,    hepo); // check clk edge
	dffr dffr_dope(nphi,       cywu,        ff19_d7, dope); // check clk edge
	dffr dffr_elox(cemo_1mhz,  doxa,        !dala,   elox); // check clk edge
	dffr dffr_dory(cemo_1mhz,  cexe,        elox,    dory); // check clk edge
	dffr dffr_cyre(akyd_nq,    beny,        !cyre,   cyre); // check clk edge
	dffr dffr_cano(cule,       napu_reset2, !cano,   cano); // check clk edge
	dffr dffr_cagy(!cano,      napu_reset2, !cagy,   cagy); // check clk edge
	dffr dffr_dyve(!cagy,      napu_reset2, !dyve,   dyve); // check clk edge
	dffr dffr_atep(azeg,       buwe,        !atep,   atep); // check clk edge
	dffr dffr_caza(cemo,       cexe,        dory_q,  caza); // check clk edge
	dffr dffr_cemo(bufo,       byho,        !cemo,   cemo); // check clk edge
	dffr dffr_dome(davu,       napu_reset2, exes,    dome); // check clk edge
	count count_jore(kene, jake,   nff17_d0, jore);
	count count_jona(jore, jake,   nff17_d1, jona);
	count count_jevy(jona, jake,   nff17_d2, jevy);
	count count_eryc(dyro, bymo,   d[0],     eryc);
	count count_cera(eryc, bymo,   d[1],     cera);
	count count_conu(cera, bymo,   d[2],     conu);
	count count_came(conu, bymo,   d[3],     came);
	count count_buva(buko, aget,   d[4],     buva);
	count count_akyd(buva, aget,   d[5],     akyd);
	count count_fena(fopy, elox_q, ff17_d7,  fena);
	count count_fomy(etup, elox_q, ff17_d6,  fomy);
	count count_fete(faru, elox_q, ff17_d5,  fete);
	count count_feno(gafa, elox_q, ff17_d4,  feno);
	srlatch latch_buta(!bodo, !ares, buta); /* srlatch with !s & !r inputs */
	srlatch latch_dala(celo,  dope,  dala);
	srlatch latch_dane(elox,  esyk,  dane);
	srlatch latch_jeme(hepo,  hyle,  jeme);
	assign #T_INV  hota = !byfe_128hz;
	assign #T_INV  katy = !apu_reset;
	assign #T_INV  kylo = !jyna;
	assign #T_INV  kene = !kylo;
	assign #T_AND  kyvo = jevy && jona && jore;
	assign #T_INV  galu = !ch2_ftick;
	assign #T_INV  etuk = !gyko;
	assign #T_INV  davu = !etuk;
	assign #T_AND  fujy = gyko && cemo_1mhz;
	assign #T_NOR  gyre = !(apu_reset || elox || fujy);
	assign #T_NOR  duju = !(davu || elox);
	assign #T_INV  cogu = !duju;
	assign #T_INV  erog = !duju;
	assign #T_INV  gypa = !duju;
	assign #T_INV  cywu = !apu_reset;
	assign #T_NOR  dera = !(apu_reset || dope);
	assign #T_NOR  hyly = !(elox || jopa);
	assign #T_NOR  hypa = !(elox || apu_reset);
	assign #T_OR   hyle = apu_reset || elox;
	assign #T_INV  jake = !hyly;
	assign #T_INV  cexe = !apu_reset;
	assign #T_OR   doxa = apu_reset || dory;
	assign #T_INV  celo = !doxa;
	assign #T_INV  gade = !jopa;
	assign #T_NOR  holy = !(horu_512hz || gade);
	assign #T_NOR  jupu = !(ff17_d0 || ff17_d1 || ff17_d2);
	assign #T_OR   hofo = jopa || jupu || jeme;
	assign #T_OR   hafe = holy || jupu || elox_q || apu_reset;
	assign #T_INV  buwe = !apu_reset;
	assign #T_INV  azeg = !amuk_4mhz;
	assign #T_INV  byho = !buwe;
	assign #T_INV  bufo = !atep;
	assign #T_INV  bodo = !caza;
	assign #T_NOR  cama = !(cemo || !buta); /* takes !q output of srlatch */
	assign #T_INV  doca = !cama;
	assign #T_AOI  fopy = !((fomy && ff17_d3) || (!fomy && nff17_d3));
	assign #T_AOI  etup = !((fete && ff17_d3) || (!fete && nff17_d3));
	assign #T_AOI  faru = !((feno && ff17_d3) || (!feno && nff17_d3));
	assign #T_AOI  gafa = !((hofo && ff17_d3) || (hofo && nff17_d3));
	assign #T_AND  cyse = dane && dome;
	assign #T_OR   bonu = cyse || net03;
	assign #T_NOR  emyr = !(ff17_d3 || feno || fete || fomy || fena);
	assign #T_NAND erat = !(ff17_d3 && feno && fete && fomy && fena);
	assign #T_INV  fyre = !erat;
	assign #T_OR   gufy = emyr || fyre;
	assign #T_AND  amov = fena && bonu;
	assign #T_AND  asog = fomy && bonu;
	assign #T_AND  anyv = fete && bonu;
	assign #T_AND  anan = feno && bonu;
	assign elox_q     = elox;
	assign dory_q     = dory;
	assign cemo_1mhz  = cemo;
	assign ch2_out[3] = amov;
	assign ch2_out[2] = asog;
	assign ch2_out[1] = anyv;
	assign ch2_out[0] = anan;

endmodule
