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
	dffsr dffsr_axan(ch1_freq_upd1, afeg, apaj, coru, axan); // check clk edge
	dffsr dffsr_evab(ch1_freq_upd1, budo, bovu, dule, evab); // check clk edge
	dffsr dffsr_dygy(ch1_freq_upd1, bugu, boxu, dyxe, dygy); // check clk edge
	dffsr dffsr_hopo(ch1_freq_upd2, etol, esel, etek, hopo); // check clk edge
	dffsr dffsr_hyxu(ch1_freq_upd2, eler, eluf, fego, hyxu); // check clk edge
	dffsr dffsr_holu(ch1_freq_upd2, kypa, kaju, geva, holu); // check clk edge
	dffsr dffsr_fely(ch1_freq_upd2, kovu, kapo, hexo, fely); // check clk edge
	dffsr dffsr_edul(ch1_freq_upd2, gope, gamo, jory, edul); // check clk edge
	dffsr dffsr_havo(ch1_freq_upd2, golo, gyfu, jule, havo); // check clk edge
	dffsr dffsr_jyka(ch1_freq_upd2, geta, gato, halu, jyka); // check clk edge
	dffsr dffsr_hyka(ch1_freq_upd2, gylu, efor, guxa, hyka); // check clk edge
	dffsr dffsr_beku(becy,          beju, avuf,   '0, beku); // check clk edge
	dffsr dffsr_agez(becy,          beso, afux, beku, agez); // check clk edge
	dffsr dffsr_elux(becy,          bege, agor, agez, elux); // check clk edge
	dffsr dffsr_exac(becy,          dace, bewo, elux, exac); // check clk edge
	dffsr dffsr_fedo(ejyb,          ekem, enok, exac, fedo); // check clk edge
	dffsr dffsr_fude(ejyb,          govo, ezuk, fedo, fude); // check clk edge
	dffsr dffsr_jota(ejyb,          kola, kybo, fude, jota); // check clk edge
	dffsr dffsr_jolu(ejyb,          kyry, keto, jota, jolu); // check clk edge
	dffsr dffsr_goga(ch1_shift_clk, hawy, hyvu, jolu, goga); // check clk edge
	dffsr dffsr_jefa(ch1_shift_clk, hola, hobu, goga, jefa); // check clk edge
	dffsr dffsr_fabu(ch1_shift_clk, hozu, jado, jefa, fabu); // check clk edge
	dffr_c dffr_doly(adad, kyly, axan, doly); // check clk edge
	dffr_c dffr_dofy(adad, kyly, evab, dofy); // check clk edge
	dffr_c dffr_dexe(adad, kyly, dygy, dexe); // check clk edge
	dffr_c dffr_dele(adad, kyly, hopo, dele); // check clk edge
	dffr_c dffr_exap(adad, kyly, hyxu, exap); // check clk edge
	dffr_c dffr_faxo(adad, kyly, holu, faxo); // check clk edge
	dffr_c dffr_gyme(adad, kyly, fely, gyme); // check clk edge
	dffr_c dffr_jyme(adad, kyly, edul, jyme); // check clk edge
	dffr_c dffr_kare(adad, kyly, havo, kare); // check clk edge
	dffr_c dffr_jode(adad, kyly, jyka, jode); // check clk edge
	dffr_c dffr_galo(adad, kyly, hyka, galo); // check clk edge
	dffr_c dffr_deva(adad, kyly, culu, deva); // check clk edge
	dffr_c dffr_eter(adad, kyly, dozy, eter); // check clk edge
	dffr_c dffr_defa(adad, kyly, cale, defa); // check clk edge
	dffr_c dffr_edok(adad, kyly, dyme, edok); // check clk edge
	dffr_c dffr_epyr(adad, kyly, fure, epyr); // check clk edge
	dffr_c dffr_gele(adad, kyly, goly, gele); // check clk edge
	dffr_c dffr_jete(adad, kyly, kefe, jete); // check clk edge
	dffr_c dffr_jape(adad, kyly, hefy, jape); // check clk edge
	dffr_c dffr_hele(adad, kyly, gopo, hele); // check clk edge
	dffr_c dffr_hopa(adad, kyly, gela, hopa); // check clk edge
	dffr_c dffr_hora(adad, kyly, gylo, hora); // check clk edge
	assign #T_AND  deby = apu_wr && ff14;
	assign #T_NAND depu = !(apu_wr && ff13);
	assign #T_INV  dyla = !depu;
	assign #T_INV  aryl = !nff10_d3;
	assign #T_NOR  byle = !(aryl || coru_c);
	assign #T_OR   atys = byle || aryl;
	assign #T_INV  kedo = !ch1_ld_shift;
	assign #T_INV  juju = !ch1_ld_shift;
	assign #T_INV  kape = !ch1_ld_shift;
	assign #T_INV  cybe = !ejyb;
	assign #T_INV  becy = !cybe;
	assign #T_INV  faja = !ch1_shift_clk;
	assign #T_INV  ejyb = !faja;
	assign #T_INV  byfu = !d[2];
	assign #T_INV  bofu = !d[1];
	assign #T_INV  bysu = !d[0];
	assign #T_INV  dulo = !d[7];
	assign #T_INV  dylu = !d[6];
	assign #T_INV  julo = !d[5];
	assign #T_INV  kopu = !d[4];
	assign #T_INV  etuv = !d[3];
	assign #T_INV  fule = !d[2];
	assign #T_INV  gulu = !d[1];
	assign #T_INV  deke = !d[0];
	assign #T_NAND afeg = !(d[2] && deby);
	assign #T_AND  ajux = deby && byfu;
	assign #T_NAND budo = !(d[1] && deby);
	assign #T_AND  amac = deby && bofu;
	assign #T_NAND bugu = !(d[0] && deby);
	assign #T_AND  baso = deby && bysu;
	assign #T_NAND etol = !(d[7] && dyla);
	assign #T_AND  emar = dyla && dulo;
	assign #T_NAND eler = !(d[6] && dyla);
	assign #T_AND  etok = dyla && dylu;
	assign #T_NAND kypa = !(d[5] && dyla);
	assign #T_AND  kyfu = dyla && julo;
	assign #T_NAND kovu = !(d[4] && dyla);
	assign #T_AND  kavo = dyla && kopu;
	assign #T_NAND gope = !(d[3] && dyla);
	assign #T_AND  fega = dyla && etuv;
	assign #T_NAND golo = !(d[2] && dyla);
	assign #T_AND  foke = dyla && fule;
	assign #T_NAND geta = !(d[1] && dyla);
	assign #T_AND  fopu = dyla && gulu;
	assign #T_NAND gylu = !(d[0] && dyla);
	assign #T_AND  ejyf = dyla && deke;
	assign #T_NOR  apaj = !(ajux || apu_reset);
	assign #T_NOR  bovu = !(amac || apu_reset);
	assign #T_NOR  boxu = !(baso || apu_reset);
	assign #T_NOR  esel = !(emar || apu_reset);
	assign #T_NOR  eluf = !(etok || apu_reset);
	assign #T_NOR  kaju = !(kyfu || apu_reset);
	assign #T_NOR  kapo = !(kavo || apu_reset);
	assign #T_NOR  gamo = !(fega || apu_reset);
	assign #T_NOR  gyfu = !(foke || apu_reset);
	assign #T_NOR  gato = !(fopu || apu_reset);
	assign #T_NOR  efor = !(ejyf || apu_reset);
	assign #T_ADD  { coru_c, coru } = !doly + !deva + dule_c;
	assign #T_ADD  { dule_c, dule } = !dofy + !eter + dyxe_c;
	assign #T_ADD  { dyxe_c, dyxe } = !dexe + !defa + etek_c;
	assign #T_ADD  { etek_c, etek } = !dele + !edok + fego_c;
	assign #T_ADD  { fego_c, fego } = !exap + !epyr + geva_c;
	assign #T_ADD  { geva_c, geva } = !faxo + !gele + hexo_c;
	assign #T_ADD  { hexo_c, hexo } = !gyme + !jete + jory_c;
	assign #T_ADD  { jory_c, jory } = !jyme + !jape + jule_c;
	assign #T_ADD  { jule_c, jule } = !kare + !hele + halu_c;
	assign #T_ADD  { halu_c, halu } = !jode + !hopa + guxa_c;
	assign #T_ADD  { guxa_c, guxa } = !galo + !hora + aryl;
	assign #T_INV  bojo = !axan;
	assign #T_INV  apat = !evab;
	assign #T_INV  byru = !dygy;
	assign #T_INV  cyky = !hopo;
	assign #T_INV  debo = !hyxu;
	assign #T_INV  fohy = !holu;
	assign #T_INV  kovo = !fely;
	assign #T_INV  keke = !edul;
	assign #T_INV  huny = !havo;
	assign #T_INV  hoxe = !jyka;
	assign #T_INV  juta = !hyka;
	assign #T_AND  afyr = kedo && bojo;
	assign #T_NAND beju = !(axan && kedo);
	assign #T_AND  buvo = kedo && apat;
	assign #T_NAND beso = !(evab && kedo);
	assign #T_AND  afug = kedo && byru;
	assign #T_NAND bege = !(dygy && kedo);
	assign #T_AND  bapu = kedo && cyky;
	assign #T_NAND dace = !(hopo && kedo);
	assign #T_AND  ereg = juju && debo;
	assign #T_NAND ekem = !(hyxu && juju);
	assign #T_AND  evof = juju && fohy;
	assign #T_NAND govo = !(holu && juju);
	assign #T_AND  kevy = juju && kovo;
	assign #T_NAND kola = !(fely && juju);
	assign #T_AND  kaxy = juju && keke;
	assign #T_NAND kyry = !(edul && juju);
	assign #T_AND  jehy = kape && huny;
	assign #T_NAND hawy = !(havo && kape);
	assign #T_AND  jocy = kape && hoxe;
	assign #T_NAND hola = !(jyka && kape);
	assign #T_AND  koko = kape && juta;
	assign #T_NAND hozu = !(hyka && kape);
	assign #T_NOR  avuf = !(apu_reset || afyr);
	assign #T_NOR  afux = !(apu_reset || buvo);
	assign #T_NOR  agor = !(apu_reset || afug);
	assign #T_NOR  bewo = !(apu_reset || bapu);
	assign #T_NOR  enok = !(apu_reset || ereg);
	assign #T_NOR  ezuk = !(apu_reset || evof);
	assign #T_NOR  kybo = !(apu_reset || kevy);
	assign #T_NOR  keto = !(apu_reset || kaxy);
	assign #T_NOR  hyvu = !(apu_reset || jehy);
	assign #T_NOR  hobu = !(apu_reset || jocy);
	assign #T_NOR  jado = !(apu_reset || koko);
	assign #T_XOR  culu = aryl != beku;
	assign #T_XOR  dozy = aryl != agez;
	assign #T_XOR  cale = aryl != elux;
	assign #T_XOR  dyme = aryl != exac;
	assign #T_XOR  fure = aryl != fedo;
	assign #T_XOR  goly = aryl != fude;
	assign #T_XOR  kefe = aryl != jota;
	assign #T_XOR  hefy = aryl != jolu;
	assign #T_XOR  gopo = aryl != goga;
	assign #T_XOR  gela = aryl != jefa;
	assign #T_XOR  gylo = aryl != fabu;
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
