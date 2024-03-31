`timescale 1ns/1ns
`default_nettype none

module channel1(
		input logic [7:0] d,

		input logic apu_wr, apu_reset, napu_reset6, dova_phi, net03,
		input logic ff11, ff11_d6, nff11_d6, ff11_d7, nff11_d7, ff14, ff14_d6, nff14_d6,
		input logic nff10_d0, nff10_d1, nff10_d2, nff10_d4, nff10_d5, nff10_d6,
		input logic ff12_d0, ff12_d1, ff12_d2, ff12_d3, ff12_d4, ff12_d5, ff12_d6, ff12_d7,
		input logic nff12_d0, nff12_d1, nff12_d2, nff12_d3,

		output logic ch1_restart, ch1_shift_clk, ch1_ld_shift, ch1_freq_upd1, ch1_freq_upd2,
		output logic nch1_active, nch1_amp_en,
		input  logic atys, copu, cate,
		output logic ngexu, cope, kyly, adad,
		input  logic byfe_128hz, bufy_256hz, horu_512hz, dyfa_1mhz, ajer_2mhz,

		output logic [3:0] ch1_out
	);

	logic boro, boka, cory, cero, capy, cyfa, hoca, bone, bery, femy, gepu, gexu, bugy, canu, bepe, cuso;
	logic bacy, cavy, bovy, cuno, cura, eram;
	dffr_bp dffr_cero(!eram, cory, !cero, cero);
	tffd tffd_bacy(canu, bugy, d[0], bacy);
	tffd tffd_cavy(bacy, bugy, d[1], cavy);
	tffd tffd_bovy(cavy, bugy, d[2], bovy);
	tffd tffd_cuno(bovy, bugy, d[3], cuno);
	tffd tffd_cura(cuso, bepe, d[4], cura);
	tffd tffd_eram(cura, bepe, d[5], eram);
	nand_srlatch latch_gexu(gepu, femy, gexu, ngexu);
	assign #T_NAND boro = !(apu_wr && ff11);
	assign #T_INV  boka = !boro;
	assign #T_NOR  cory = !(ch1_restart || apu_reset || boka);
	assign #T_NOR  capy = !(nff14_d6 || bufy_256hz || cero);
	assign #T_AND  cyfa = cero && ff14_d6;
	assign #T_NOR  hoca = !(ff12_d3 || ff12_d4 || ff12_d5 || ff12_d6 || ff12_d7);
	assign #T_INV  bone = !atys;
	assign #T_OR   bery = bone || apu_reset || cyfa || hoca;
	assign #T_NOR  femy = !(apu_reset || hoca);
	assign #T_INV  gepu = !fyte;
	assign #T_INV  bugy = !boro;
	assign #T_INV  canu = !capy;
	assign #T_INV  bepe = !boro;
	assign #T_INV  cuso = !(!cuno);
	assign nch1_amp_en = hoca;

	logic cala, comy, cyte, dyru, doka;
	dffr_bp dffr_comy(cala, dyru, !comy, comy);
	assign #T_INV  cala = !copu;
	assign #T_INV  cyte = !comy;
	assign #T_INV  cope = !cyte;
	assign #T_NOR  dyru = !(apu_reset || ch1_restart || doka);
	assign #T_AND  doka = comy && dyfa_1mhz;

	logic dafa, cymu, bave, caxy, cypu, cupo, bury, coze, bexa;
	dffr_bp dffr_bexa(ajer_2mhz, bury, coze, bexa);
	tffd tffd_caxy(cypu, cymu, nff10_d6, caxy);
	tffd tffd_cypu(cupo, cymu, nff10_d5, cypu);
	tffd tffd_cupo(cate, cymu, nff10_d4, cupo);
	assign #T_NOR  dafa = !(bexa || ch1_restart);
	assign #T_INV  cymu = !dafa;
	assign #T_AND  bave = nff10_d6 && nff10_d5 && nff10_d4;
	assign #T_NOR  bury = !(bave || apu_reset);
	assign #T_AND  coze = caxy && cypu && cupo;

	logic jone, kado, kaly, kere, jola, jova, kenu, kera, kote, kury, kuku, koro, kozy, kaza, kuxu, koma, kake;
	logic erum, fare, fyte, eget, doge, dado, dupe, duka, ezec, gefe, fyfo, nfyfo, feku, keko, kaba;
	logic hufu, hano, hake, koru, jade, kyno, kezu;
	logic cyto, cara, duwo, cowe, boto;
	logic hesu, heto, hyto, jufy, hevo, hoko, hemy, hafo, aceg, agof, ason, amop;
	dffr_bp dffr_kaly(jone,       kado,        !kaly,       kaly);
	dffr_bp dffr_kozy(horu_512hz, koro,        kote,        kozy);
	dffr_bp dffr_fare(dyfa_1mhz,  erum,        ch1_restart, fare);
	dffr_bp dffr_fyte(dyfa_1mhz,  erum,        fare,        fyte);
	dffr_bp dffr_ezec(dova_phi,   duka,        dupe,        ezec);
	dffr_bp dffr_feku(dyfa_1mhz,  eget,        nfyfo,       feku);
	dffr_bp dffr_kyno(kozy,       koru,        jade,        kyno);
	dffr_bp dffr_duwo(cope,       napu_reset6, ch1_bit,     duwo);
	tffd tffd_jova(jola, kuxu,        nff12_d0, jova);
	tffd tffd_kenu(jova, kuxu,        nff12_d1, kenu);
	tffd tffd_kera(kenu, kuxu,        nff12_d2, kera);
	tffd tffd_hevo(hesu, ch1_restart, ff12_d7,  hevo);
	tffd tffd_hoko(heto, ch1_restart, ff12_d6,  hoko);
	tffd tffd_hemy(hyto, ch1_restart, ff12_d5,  hemy);
	tffd tffd_hafo(jufy, ch1_restart, ff12_d4,  hafo);
	drlatch latch_dupe(!doge, dado, d[7], dupe);
	nor_srlatch latch_cyto(ch1_restart, bery, cyto,);
	nor_srlatch latch_fyfo(gefe,        ezec, fyfo, nfyfo);
	nor_srlatch latch_kezu(kyno,        keko, kezu,);
	assign #T_INV  jone = !byfe_128hz;
	assign #T_INV  kado = !apu_reset;
	assign #T_INV  kere = !kaly;
	assign #T_INV  jola = !kere;
	assign #T_AND  kote = kera && kenu && jova;
	assign #T_INV  kury = !kozy;
	assign #T_NOR  kuku = !(horu_512hz || kury);
	assign #T_NOR  koro = !(kuku || koma || ch1_restart || apu_reset);
	assign #T_NOR  kaza = !(ch1_restart || kozy);
	assign #T_INV  kuxu = !kaza;
	assign #T_NOR  koma = !(ff12_d0 || ff12_d1 || ff12_d2);
	assign #T_OR   kake = kozy || koma || kezu;
	assign #T_INV  erum = !apu_reset;
	assign #T_NOR  eget = !(apu_reset || fare);
	assign #T_NAND doge = !(apu_wr && ff14);
	assign #T_NOR  dado = !(apu_reset || ezec);
	assign #T_INV  duka = !apu_reset;
	assign #T_INV  gefe = !eget;
	assign #T_OR   keko = apu_reset || feku;
	assign #T_OR   kaba = apu_reset || feku;
	assign #T_INV  kyly = !kaba;
	assign #T_NAND hufu = !(ff12_d3 && hafo && hemy && hoko && hevo);
	assign #T_NOR  hano = !(ff12_d3 || hafo || hemy || hoko || hevo);
	assign #T_INV  hake = !hufu;
	assign #T_NOR  koru = !(ch1_restart || apu_reset);
	assign #T_OR   jade = hake || hano;
	assign #T_INV  cara = !cyto;
	assign #T_AND  cowe = cyto && duwo;
	assign #T_OR   boto = cowe || net03;
	assign #T_AO   hesu = (ff12_d3 && hoko) || (!hoko && nff12_d3);
	assign #T_AO   heto = (ff12_d3 && hemy) || (!hemy && nff12_d3);
	assign #T_AO   hyto = (ff12_d3 && hafo) || (!hafo && nff12_d3);
	assign #T_AO   jufy = (ff12_d3 && kake) || (kake && nff12_d3);
	assign #T_AND  aceg = hevo && boto;
	assign #T_AND  agof = hoko && boto;
	assign #T_AND  ason = hemy && boto;
	assign #T_AND  amop = hafo && boto;
	assign ch1_restart = feku;
	assign nch1_active = cara;
	assign ch1_out[3]  = aceg;
	assign ch1_out[2]  = agof;
	assign ch1_out[1]  = ason;
	assign ch1_out[0]  = amop;

	logic dacu, cylu, copa, caja, byra, buge, copy, atat, BYTE, epuk, evol, femu, nfemu, egyp, cele, dody, egor, dapu;
	logic nno_sweep;
	dffr_bp dffr_byte(ajer_2mhz, atat, copy, BYTE);
	tffd tffd_copa(dapu, cylu, nff10_d0, copa);
	tffd tffd_caja(copa, cylu, nff10_d1, caja);
	tffd tffd_byra(caja, cylu, nff10_d2, byra);
	nand_srlatch latch_femu(evol, epuk, femu, nfemu);
	assign #T_NOR  dacu = !(ch1_restart || bexa);
	assign #T_INV  cylu = !dacu;
	assign #T_NAND buge = !(nff10_d2 && nff10_d1 && nff10_d0);
	assign #T_AND  copy = copa && caja && byra;
	assign #T_NOR  atat = !(bexa || apu_reset);
	assign #T_INV  adad = !(!BYTE);
	assign #T_NOR  epuk = !(apu_reset || adad);
	assign #T_NOR  evol = !(bexa || fyte);
	assign #T_NOR  egyp = !(nfemu || dyfa_1mhz);
	assign #T_INV  cele = !nno_sweep;
	assign #T_NOR  dody = !(cele || egyp);
	assign #T_INV  egor = !dody;
	assign #T_INV  dapu = !egor;
	assign nno_sweep     = buge;
	assign ch1_shift_clk = egor;

	logic dajo, esut, eros, dape, duvo, ezoz, enek, codo, coso, cava, cevu, caxo, duna;
	logic ch1_bit;
	dffr_bp dffr_esut(dajo,  napu_reset6, !esut, esut);
	dffr_b  dffr_eros(!esut, napu_reset6, !eros, eros);
	dffr_b  dffr_dape(!eros, napu_reset6, !dape, dape);
	assign #T_INV  dajo = !cope;
	assign #T_INV  duvo = !esut;
	assign #T_AND  ezoz = dape && eros;
	assign #T_AND  enek = ezoz && duvo;
	assign #T_INV  codo = !ezoz;
	assign #T_NOR  coso = !(ff11_d6 || ff11_d7);
	assign #T_NOR  cava = !(nff11_d6 || ff11_d7);
	assign #T_NOR  cevu = !(ff11_d6 || nff11_d7);
	assign #T_NOR  caxo = !(nff11_d6 || nff11_d7);
	assign #T_AO   duna = (enek && coso) || (ezoz && cava) || (dape && cevu) || (codo && caxo);
	assign ch1_bit = duna;

	logic atuv, boje, buso, kala;
	assign #T_AND  atuv = bexa && atys;
	assign #T_AND  boje = atuv && nno_sweep;
	assign #T_AND  buso = nno_sweep && atys && bexa;
	assign #T_NOR  kala = !(bexa || ch1_restart);
	assign ch1_freq_upd2 = boje;
	assign ch1_freq_upd1 = buso;
	assign ch1_ld_shift  = kala;

endmodule
