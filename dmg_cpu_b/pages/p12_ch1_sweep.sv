`default_nettype none

module ch1_sweep(
		input logic [7:0] d,

		input logic apu_wr, apu_reset,
		input logic ff13, ff14, nff10_d3,

		output logic [10:0] acc_d,
		input  logic ch1_ld_shift, ch1_shift_clk, ch1_freq_upd1, ch1_freq_upd2,
		input  logic adad, kyly,
		output logic atys
	);

	logic deby, depu, dyla, aryl, byle, kedo, juju, kape, cybe, becy, faja, ejyb;
	logic byfu, bofu, bysu, dulo, dylu, julo, kopu, etuv, fule, gulu, deke;
	logic afeg, ajux, budo, amac, bugu, baso, etol, emar, eler, etok, kypa;
	logic kyfu, kovu, kavo, gope, fega, golo, foke, geta, fopu, gylu, ejyf;
	logic apaj, bovu, boxu, esel, eluf, kaju, kapo, gamo, gyfu, gato, efor;
	logic axan, evab, dygy, hopo, hyxu, holu, fely, edul, havo, jyka, hyka;
	logic doly, dofy, dexe, dele, exap, faxo, gyme, jyme, kare, jode, galo;
	logic coru, dule, dyxe, etek, fego, geva, hexo, jory, jule, halu, guxa;
	logic coru_c, dule_c, dyxe_c, etek_c, fego_c, geva_c, hexo_c, jory_c, jule_c, halu_c, guxa_c;
	logic bojo, apat, byru, cyky, debo, fohy, kovo, keke, huny, hoxe, juta;
	logic afyr, beju, buvo, beso, afug, bege, bapu, dace, ereg, ekem, evof;
	logic govo, kevy, kola, kaxy, kyry, jehy, hawy, jocy, hola, koko, hozu;
	logic avuf, afux, agor, bewo, enok, ezuk, kybo, keto, hyvu, hobu, jado;
	logic beku, agez, elux, exac, fedo, fude, jota, jolu, goga, jefa, fabu;
	logic culu, dozy, cale, dyme, fure, goly, kefe, hefy, gopo, gela, gylo;
	logic deva, eter, defa, edok, epyr, gele, jete, jape, hele, hopa, hora;
	dffsr dffsr_axan(ch1_freq_upd1, afeg, apaj, coru, axan);
	dffsr dffsr_evab(ch1_freq_upd1, budo, bovu, dule, evab);
	dffsr dffsr_dygy(ch1_freq_upd1, bugu, boxu, dyxe, dygy);
	dffsr dffsr_hopo(ch1_freq_upd2, etol, esel, etek, hopo);
	dffsr dffsr_hyxu(ch1_freq_upd2, eler, eluf, fego, hyxu);
	dffsr dffsr_holu(ch1_freq_upd2, kypa, kaju, geva, holu);
	dffsr dffsr_fely(ch1_freq_upd2, kovu, kapo, hexo, fely);
	dffsr dffsr_edul(ch1_freq_upd2, gope, gamo, jory, edul);
	dffsr dffsr_havo(ch1_freq_upd2, golo, gyfu, jule, havo);
	dffsr dffsr_jyka(ch1_freq_upd2, geta, gato, halu, jyka);
	dffsr dffsr_hyka(ch1_freq_upd2, gylu, efor, guxa, hyka);
	dffsr dffsr_beku(becy,          beju, avuf,   '0, beku);
	dffsr dffsr_agez(becy,          beso, afux, beku, agez);
	dffsr dffsr_elux(becy,          bege, agor, agez, elux);
	dffsr dffsr_exac(becy,          dace, bewo, elux, exac);
	dffsr dffsr_fedo(ejyb,          ekem, enok, exac, fedo);
	dffsr dffsr_fude(ejyb,          govo, ezuk, fedo, fude);
	dffsr dffsr_jota(ejyb,          kola, kybo, fude, jota);
	dffsr dffsr_jolu(ejyb,          kyry, keto, jota, jolu);
	dffsr dffsr_goga(ch1_shift_clk, hawy, hyvu, jolu, goga);
	dffsr dffsr_jefa(ch1_shift_clk, hola, hobu, goga, jefa);
	dffsr dffsr_fabu(ch1_shift_clk, hozu, jado, jefa, fabu);
	dffr_a dffr_doly(adad, kyly, axan, doly);
	dffr_a dffr_dofy(adad, kyly, evab, dofy);
	dffr_a dffr_dexe(adad, kyly, dygy, dexe);
	dffr_a dffr_dele(adad, kyly, hopo, dele);
	dffr_a dffr_exap(adad, kyly, hyxu, exap);
	dffr_a dffr_faxo(adad, kyly, holu, faxo);
	dffr_a dffr_gyme(adad, kyly, fely, gyme);
	dffr_a dffr_jyme(adad, kyly, edul, jyme);
	dffr_a dffr_kare(adad, kyly, havo, kare);
	dffr_a dffr_jode(adad, kyly, jyka, jode);
	dffr_a dffr_galo(adad, kyly, hyka, galo);
	dffr_a dffr_deva(adad, kyly, culu, deva);
	dffr_a dffr_eter(adad, kyly, dozy, eter);
	dffr_a dffr_defa(adad, kyly, cale, defa);
	dffr_a dffr_edok(adad, kyly, dyme, edok);
	dffr_a dffr_epyr(adad, kyly, fure, epyr);
	dffr_a dffr_gele(adad, kyly, goly, gele);
	dffr_a dffr_jete(adad, kyly, kefe, jete);
	dffr_a dffr_jape(adad, kyly, hefy, jape);
	dffr_a dffr_hele(adad, kyly, gopo, hele);
	dffr_a dffr_hopa(adad, kyly, gela, hopa);
	dffr_a dffr_hora(adad, kyly, gylo, hora);
	assign  deby = apu_wr && ff14;
	assign depu = !(apu_wr && ff13);
	assign  dyla = !depu;
	assign  aryl = !nff10_d3;
	assign  byle = !(aryl || coru_c);
	assign   atys = byle || aryl;
	assign  kedo = !ch1_ld_shift;
	assign  juju = !ch1_ld_shift;
	assign  kape = !ch1_ld_shift;
	assign  cybe = !ejyb;
	assign  becy = !cybe;
	assign  faja = !ch1_shift_clk;
	assign  ejyb = !faja;
	assign  byfu = !d[2];
	assign  bofu = !d[1];
	assign  bysu = !d[0];
	assign  dulo = !d[7];
	assign  dylu = !d[6];
	assign  julo = !d[5];
	assign  kopu = !d[4];
	assign  etuv = !d[3];
	assign  fule = !d[2];
	assign  gulu = !d[1];
	assign  deke = !d[0];
	assign afeg = !(d[2] && deby);
	assign  ajux = deby && byfu;
	assign budo = !(d[1] && deby);
	assign  amac = deby && bofu;
	assign bugu = !(d[0] && deby);
	assign  baso = deby && bysu;
	assign etol = !(d[7] && dyla);
	assign  emar = dyla && dulo;
	assign eler = !(d[6] && dyla);
	assign  etok = dyla && dylu;
	assign kypa = !(d[5] && dyla);
	assign  kyfu = dyla && julo;
	assign kovu = !(d[4] && dyla);
	assign  kavo = dyla && kopu;
	assign gope = !(d[3] && dyla);
	assign  fega = dyla && etuv;
	assign golo = !(d[2] && dyla);
	assign  foke = dyla && fule;
	assign geta = !(d[1] && dyla);
	assign  fopu = dyla && gulu;
	assign gylu = !(d[0] && dyla);
	assign  ejyf = dyla && deke;
	assign  apaj = !(ajux || apu_reset);
	assign  bovu = !(amac || apu_reset);
	assign  boxu = !(baso || apu_reset);
	assign  esel = !(emar || apu_reset);
	assign  eluf = !(etok || apu_reset);
	assign  kaju = !(kyfu || apu_reset);
	assign  kapo = !(kavo || apu_reset);
	assign  gamo = !(fega || apu_reset);
	assign  gyfu = !(foke || apu_reset);
	assign  gato = !(fopu || apu_reset);
	assign  efor = !(ejyf || apu_reset);
	assign  { coru_c, coru } = doly + deva + dule_c;
	assign  { dule_c, dule } = dofy + eter + dyxe_c;
	assign  { dyxe_c, dyxe } = dexe + defa + etek_c;
	assign  { etek_c, etek } = dele + edok + fego_c;
	assign  { fego_c, fego } = exap + epyr + geva_c;
	assign  { geva_c, geva } = faxo + gele + hexo_c;
	assign  { hexo_c, hexo } = gyme + jete + jory_c;
	assign  { jory_c, jory } = jyme + jape + jule_c;
	assign  { jule_c, jule } = kare + hele + halu_c;
	assign  { halu_c, halu } = jode + hopa + guxa_c;
	assign  { guxa_c, guxa } = galo + hora + aryl;
	assign  bojo = !axan;
	assign  apat = !evab;
	assign  byru = !dygy;
	assign  cyky = !hopo;
	assign  debo = !hyxu;
	assign  fohy = !holu;
	assign  kovo = !fely;
	assign  keke = !edul;
	assign  huny = !havo;
	assign  hoxe = !jyka;
	assign  juta = !hyka;
	assign  afyr = kedo && bojo;
	assign beju = !(axan && kedo);
	assign  buvo = kedo && apat;
	assign beso = !(evab && kedo);
	assign  afug = kedo && byru;
	assign bege = !(dygy && kedo);
	assign  bapu = kedo && cyky;
	assign dace = !(hopo && kedo);
	assign  ereg = juju && debo;
	assign ekem = !(hyxu && juju);
	assign  evof = juju && fohy;
	assign govo = !(holu && juju);
	assign  kevy = juju && kovo;
	assign kola = !(fely && juju);
	assign  kaxy = juju && keke;
	assign kyry = !(edul && juju);
	assign  jehy = kape && huny;
	assign hawy = !(havo && kape);
	assign  jocy = kape && hoxe;
	assign hola = !(jyka && kape);
	assign  koko = kape && juta;
	assign hozu = !(hyka && kape);
	assign  avuf = !(apu_reset || afyr);
	assign  afux = !(apu_reset || buvo);
	assign  agor = !(apu_reset || afug);
	assign  bewo = !(apu_reset || bapu);
	assign  enok = !(apu_reset || ereg);
	assign  ezuk = !(apu_reset || evof);
	assign  kybo = !(apu_reset || kevy);
	assign  keto = !(apu_reset || kaxy);
	assign  hyvu = !(apu_reset || jehy);
	assign  hobu = !(apu_reset || jocy);
	assign  jado = !(apu_reset || koko);
	assign  culu = aryl != beku;
	assign  dozy = aryl != agez;
	assign  cale = aryl != elux;
	assign  dyme = aryl != exac;
	assign  fure = aryl != fedo;
	assign  goly = aryl != fude;
	assign  kefe = aryl != jota;
	assign  hefy = aryl != jolu;
	assign  gopo = aryl != goga;
	assign  gela = aryl != jefa;
	assign  gylo = aryl != fabu;
	assign acc_d[10] = axan;
	assign acc_d[9]  = evab;
	assign acc_d[8]  = dygy;
	assign acc_d[7]  = hopo;
	assign acc_d[6]  = hyxu;
	assign acc_d[5]  = holu;
	assign acc_d[4]  = fely;
	assign acc_d[3]  = edul;
	assign acc_d[2]  = havo;
	assign acc_d[1]  = jyka;
	assign acc_d[0]  = hyka;

endmodule
