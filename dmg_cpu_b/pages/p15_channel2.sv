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
	assign  hota = !byfe_128hz;
	assign  katy = !apu_reset;
	assign  kylo = !jyna;
	assign  kene = !kylo;
	assign  kyvo = jevy && jona && jore;
	assign  galu = !ch2_ftick;
	assign  etuk = !gyko;
	assign  davu = !etuk;
	assign  fujy = gyko && cemo_1mhz;
	assign  gyre = !(apu_reset || elox || fujy);
	assign  duju = !(davu || elox);
	assign  cogu = !duju;
	assign  erog = !duju;
	assign  gypa = !duju;
	assign  cywu = !apu_reset;
	assign  dera = !(apu_reset || dope);
	assign  hyly = !(elox || jopa);
	assign  hypa = !(elox || apu_reset);
	assign   hyle = apu_reset || elox;
	assign  jake = !hyly;
	assign  cexe = !apu_reset;
	assign  doxa = !(apu_reset || dory);
	assign  celo = !doxa;
	assign  gade = !jopa;
	assign  holy = !(horu_512hz || gade);
	assign  jupu = !(ff17_d0 || ff17_d1 || ff17_d2);
	assign   hofo = jopa || jupu || jeme;
	assign  hafe = !(holy || jupu || elox_q || apu_reset);
	assign  buwe = !apu_reset;
	assign  azeg = !amuk_4mhz;
	assign  byho = !apu_reset;
	assign  bufo = !atep;
	assign  bodo = !caza;
	assign  cama = !(cemo || nbuta);
	assign  doca = !cama;
	assign   fopy = (fomy && ff17_d3) || (!fomy && nff17_d3);
	assign   etup = (fete && ff17_d3) || (!fete && nff17_d3);
	assign   faru = (feno && ff17_d3) || (!feno && nff17_d3);
	assign   gafa = (hofo && ff17_d3) || (hofo && nff17_d3);
	assign  cyse = dane && dome;
	assign   bonu = cyse || net03;
	assign  emyr = !(ff17_d3 || feno || fete || fomy || fena);
	assign erat = !(ff17_d3 && feno && fete && fomy && fena);
	assign  fyre = !erat;
	assign   gufy = emyr || fyre;
	assign  amov = fena && bonu;
	assign  asog = fomy && bonu;
	assign  anyv = fete && bonu;
	assign  anan = feno && bonu;
	assign  deme = !(cyre || bufy_256hz || nff19_d6);
	assign  dora = cyre && ff19_d6;
	assign  fute = !(ff17_d3 || ff17_d4 || ff17_d5 || ff17_d6 || ff17_d7);
	assign  dyro = !deme;
	assign   esyk = apu_reset || dora || fute;
	assign  ares = !(fute || apu_reset);
	assign  defu = !dane;
	assign  bymo = !nff16_wr;
	assign  aget = !nff16_wr;
	assign  buko = !(!came);
	assign  cule = !davu;
	assign  dymu = dyve && cagy;
	assign  duge = !cano;
	assign  dare = !dymu;
	assign  egog = dymu && duge;
	assign  domo = !(ff16_d6 || ff16_d7);
	assign  dyta = !(nff16_d6 || ff16_d7);
	assign  doju = !(ff16_d6 || nff16_d7);
	assign  dove = !(nff16_d6 || nff16_d7);
	assign   exes = (egog && domo) || (dymu && dyta) || (dyve && doju) || (dare && dove);
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
