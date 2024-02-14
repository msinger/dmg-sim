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
	assign boro = !(apu_wr && ff11);
	assign  boka = !boro;
	assign  cory = !(ch1_restart || apu_reset || boka);
	assign  capy = !(nff14_d6 || bufy_256hz || cero);
	assign  cyfa = cero && ff14_d6;
	assign  hoca = !(ff12_d3 || ff12_d4 || ff12_d5 || ff12_d6 || ff12_d7);
	assign  bone = !atys;
	assign   bery = bone || apu_reset || cyfa || hoca;
	assign  femy = !(apu_reset || hoca);
	assign  gepu = !fyte;
	assign  bugy = !boro;
	assign  canu = !capy;
	assign  bepe = !boro;
	assign  cuso = !(!cuno);
	assign nch1_amp_en = hoca;

	logic cala, comy, cyte, dyru, doka;
	dffr_bp dffr_comy(cala, dyru, !comy, comy);
	assign  cala = !copu;
	assign  cyte = !comy;
	assign  cope = !cyte;
	assign  dyru = !(apu_reset || ch1_restart || doka);
	assign  doka = comy && dyfa_1mhz;

	logic dafa, cymu, bave, caxy, cypu, cupo, bury, coze, bexa;
	dffr_bp dffr_bexa(ajer_2mhz, bury, coze, bexa);
	tffd tffd_caxy(cypu, cymu, nff10_d6, caxy);
	tffd tffd_cypu(cupo, cymu, nff10_d5, cypu);
	tffd tffd_cupo(cate, cymu, nff10_d4, cupo);
	assign  dafa = !(bexa || ch1_restart);
	assign  cymu = !dafa;
	assign  bave = nff10_d6 && nff10_d5 && nff10_d4;
	assign  bury = !(bave || apu_reset);
	assign  coze = caxy && cypu && cupo;

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
	assign  jone = !byfe_128hz;
	assign  kado = !apu_reset;
	assign  kere = !kaly;
	assign  jola = !kere;
	assign  kote = kera && kenu && jova;
	assign  kury = !kozy;
	assign  kuku = !(horu_512hz || kury);
	assign  koro = !(kuku || koma || ch1_restart || apu_reset);
	assign  kaza = !(ch1_restart || kozy);
	assign  kuxu = !kaza;
	assign  koma = !(ff12_d0 || ff12_d1 || ff12_d2);
	assign   kake = kozy || koma || kezu;
	assign  erum = !apu_reset;
	assign  eget = !(apu_reset || fare);
	assign doge = !(apu_wr && ff14);
	assign  dado = !(apu_reset || ezec);
	assign  duka = !apu_reset;
	assign  gefe = !eget;
	assign   keko = apu_reset || feku;
	assign   kaba = apu_reset || feku;
	assign  kyly = !kaba;
	assign hufu = !(ff12_d3 && hafo && hemy && hoko && hevo);
	assign  hano = !(ff12_d3 || hafo || hemy || hoko || hevo);
	assign  hake = !hufu;
	assign  koru = !(ch1_restart || apu_reset);
	assign   jade = hake || hano;
	assign  cara = !cyto;
	assign  cowe = cyto && duwo;
	assign   boto = cowe || net03;
	assign   hesu = (ff12_d3 && hoko) || (!hoko && nff12_d3);
	assign   heto = (ff12_d3 && hemy) || (!hemy && nff12_d3);
	assign   hyto = (ff12_d3 && hafo) || (!hafo && nff12_d3);
	assign   jufy = (ff12_d3 && kake) || (kake && nff12_d3);
	assign  aceg = hevo && boto;
	assign  agof = hoko && boto;
	assign  ason = hemy && boto;
	assign  amop = hafo && boto;
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
	assign  dacu = !(ch1_restart || bexa);
	assign  cylu = !dacu;
	assign buge = !(nff10_d2 && nff10_d1 && nff10_d0);
	assign  copy = copa && caja && byra;
	assign  atat = !(bexa || apu_reset);
	assign  adad = !(!BYTE);
	assign  epuk = !(apu_reset || adad);
	assign  evol = !(bexa || fyte);
	assign  egyp = !(nfemu || dyfa_1mhz);
	assign  cele = !nno_sweep;
	assign  dody = !(cele || egyp);
	assign  egor = !dody;
	assign  dapu = !egor;
	assign nno_sweep     = buge;
	assign ch1_shift_clk = egor;

	logic dajo, esut, eros, dape, duvo, ezoz, enek, codo, coso, cava, cevu, caxo, duna;
	logic ch1_bit;
	dffr_bp dffr_esut(dajo,  napu_reset6, !esut, esut);
	dffr_b  dffr_eros(!esut, napu_reset6, !eros, eros);
	dffr_b  dffr_dape(!eros, napu_reset6, !dape, dape);
	assign  dajo = !cope;
	assign  duvo = !esut;
	assign  ezoz = dape && eros;
	assign  enek = ezoz && duvo;
	assign  codo = !ezoz;
	assign  coso = !(ff11_d6 || ff11_d7);
	assign  cava = !(nff11_d6 || ff11_d7);
	assign  cevu = !(ff11_d6 || nff11_d7);
	assign  caxo = !(nff11_d6 || nff11_d7);
	assign   duna = (enek && coso) || (ezoz && cava) || (dape && cevu) || (codo && caxo);
	assign ch1_bit = duna;

	logic atuv, boje, buso, kala;
	assign  atuv = bexa && atys;
	assign  boje = atuv && nno_sweep;
	assign  buso = nno_sweep && atys && bexa;
	assign  kala = !(bexa || ch1_restart);
	assign ch1_freq_upd2 = boje;
	assign ch1_freq_upd1 = buso;
	assign ch1_ld_shift  = kala;

endmodule
