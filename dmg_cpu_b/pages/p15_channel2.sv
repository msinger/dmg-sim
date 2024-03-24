`timescale 1ns/1ns
`default_nettype none

module channel2(
		input logic [7:0] d,

		input logic apu_reset, napu_reset2, dova_phi, net03,

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
	logic jopa, cywu, hepo, dope, dala, ndala, elox, hyly, hypa, hyle;
	logic jake, cexe, jeme, dory, dory_q, doxa, celo, gade, holy, jupu, hofo, hafe;
	logic cyre, deme, dora, fute, dyro, esyk, ares, dane, defu;
	logic bymo, aget, eryc, cera, conu, came, buva, akyd, akyd_nq, buko;
	logic cule, cano, cagy, dyve, dymu, duge, dare, egog, domo, dyta, doju, dove, exes;
	logic buwe, azeg, atep, caza, byho, bufo, bodo, cemo, cemo_1mhz, buta, nbuta, cama;
	logic fopy, etup, faru, gafa, fena, fomy, fete, feno;
	logic dome, cyse, bonu, emyr, erat, fyre, gufy, amov, asog, anyv, anan;
	dffr_bp dffr_jyna(hota,       katy,        !jyna,   jyna);
	dffr_bp dffr_gyko(galu,       gyre,        !gyko,   gyko);
	dffr_bp dffr_jopa(horu_512hz, hafe,        kyvo,    jopa);
	dffr_bp dffr_hepo(jopa,       hypa,        gufy,    hepo);
	dffr_bp dffr_dope(dova_phi,   cywu,        ff19_d7, dope);
	dffr_bp dffr_elox(cemo_1mhz,  doxa,        ndala,   elox);
	dffr_bp dffr_dory(cemo_1mhz,  cexe,        elox,    dory);
	dffr_bp dffr_cyre(akyd_nq,    beny,        !cyre,   cyre);
	dffr_bp dffr_cano(cule,       napu_reset2, !cano,   cano);
	dffr_b  dffr_cagy(!cano,      napu_reset2, !cagy,   cagy);
	dffr_b  dffr_dyve(!cagy,      napu_reset2, !dyve,   dyve);
	dffr_bp dffr_atep(azeg,       buwe,        !atep,   atep);
	dffr_bp dffr_caza(cemo,       cexe,        dory_q,  caza);
	dffr_bp dffr_cemo(bufo,       byho,        !cemo,   cemo);
	dffr_bp dffr_dome(davu,       napu_reset2, exes,    dome);
	tffd tffd_jore(kene, jake,   nff17_d0, jore);
	tffd tffd_jona(jore, jake,   nff17_d1, jona);
	tffd tffd_jevy(jona, jake,   nff17_d2, jevy);
	tffd tffd_eryc(dyro, bymo,   d[0],     eryc);
	tffd tffd_cera(eryc, bymo,   d[1],     cera);
	tffd tffd_conu(cera, bymo,   d[2],     conu);
	tffd tffd_came(conu, bymo,   d[3],     came);
	tffd tffd_buva(buko, aget,   d[4],     buva);
	tffd tffd_akyd(buva, aget,   d[5],     akyd);
	tffd tffd_fena(fopy, elox_q, ff17_d7,  fena);
	tffd tffd_fomy(etup, elox_q, ff17_d6,  fomy);
	tffd tffd_fete(faru, elox_q, ff17_d5,  fete);
	tffd tffd_feno(gafa, elox_q, ff17_d4,  feno);
	nand_srlatch latch_buta(bodo, ares, buta, nbuta);
	nor_srlatch  latch_dala(celo, dope, dala, ndala);
	nor_srlatch  latch_dane(elox, esyk, dane,);
	nor_srlatch  latch_jeme(hepo, hyle, jeme,);
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
	assign #T_NOR  doxa = !(apu_reset || dory);
	assign #T_INV  celo = !doxa;
	assign #T_INV  gade = !jopa;
	assign #T_NOR  holy = !(horu_512hz || gade);
	assign #T_NOR  jupu = !(ff17_d0 || ff17_d1 || ff17_d2);
	assign #T_OR   hofo = jopa || jupu || jeme;
	assign #T_NOR  hafe = !(holy || jupu || elox_q || apu_reset);
	assign #T_INV  buwe = !apu_reset;
	assign #T_INV  azeg = !amuk_4mhz;
	assign #T_INV  byho = !apu_reset;
	assign #T_INV  bufo = !atep;
	assign #T_INV  bodo = !caza;
	assign #T_NOR  cama = !(cemo || nbuta);
	assign #T_INV  doca = !cama;
	assign #T_AO   fopy = (fomy && ff17_d3) || (!fomy && nff17_d3);
	assign #T_AO   etup = (fete && ff17_d3) || (!fete && nff17_d3);
	assign #T_AO   faru = (feno && ff17_d3) || (!feno && nff17_d3);
	assign #T_AO   gafa = (hofo && ff17_d3) || (hofo && nff17_d3);
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
	assign #T_NOR  deme = !(cyre || bufy_256hz || nff19_d6);
	assign #T_AND  dora = cyre && ff19_d6;
	assign #T_NOR  fute = !(ff17_d3 || ff17_d4 || ff17_d5 || ff17_d6 || ff17_d7);
	assign #T_INV  dyro = !deme;
	assign #T_OR   esyk = apu_reset || dora || fute;
	assign #T_NOR  ares = !(fute || apu_reset);
	assign #T_INV  defu = !dane;
	assign #T_INV  bymo = !nff16_wr;
	assign #T_INV  aget = !nff16_wr;
	assign #T_INV  buko = !(!came);
	assign #T_INV  cule = !davu;
	assign #T_AND  dymu = dyve && cagy;
	assign #T_INV  duge = !cano;
	assign #T_INV  dare = !dymu;
	assign #T_AND  egog = dymu && duge;
	assign #T_NOR  domo = !(ff16_d6 || ff16_d7);
	assign #T_NOR  dyta = !(nff16_d6 || ff16_d7);
	assign #T_NOR  doju = !(ff16_d6 || nff16_d7);
	assign #T_NOR  dove = !(nff16_d6 || nff16_d7);
	assign #T_AO   exes = (egog && domo) || (dymu && dyta) || (dyve && doju) || (dare && dove);
	assign elox_q     = elox;
	assign dory_q     = dory;
	assign akyd_nq    = !akyd;
	assign cemo_1mhz  = cemo;
	assign ch2_out[3] = amov;
	assign ch2_out[2] = asog;
	assign ch2_out[1] = anyv;
	assign ch2_out[0] = anan;
	assign nch2_amp_en = fute;
	assign nch2_active = defu;

endmodule
