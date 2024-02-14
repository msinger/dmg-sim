`default_nettype none

module apu_control(
		input logic cpu_rd,
		input logic nreset2,

		inout tri logic [7:0] d,

		input logic t1_nt2,

		input logic ff24, ff25, ff26,

		input  logic apu_wr,
		output logic apu_reset, net03, ncpu_rd,
		output logic napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6,
		input  logic apuv_4mhz,
		output logic ajer_2mhz, dyfa_1mhz,
		input  logic byfe_128hz,
		output logic fero_q, cate, gaxo,

		output logic [3:0] rmixer, lmixer,
		output logic [2:0] nrvolume, nlvolume,
		output logic       vin_r_ena, vin_l_ena,

		input logic nch1_active, nch2_active, nch3_active, nch4_active
	);

	logic ajer, bata, calo, dyfa, najer_2mhz;
	dffr_bp dffr_ajer(apuv_4mhz, napu_reset3, !ajer, ajer);
	dffr_bp dffr_calo(bata,      napu_reset,  !calo, calo);
	assign  bata = !ajer_2mhz;
	assign  dyfa = !(!calo);
	assign ajer_2mhz  = ajer;
	assign najer_2mhz = !ajer;
	assign dyfa_1mhz  = dyfa;

	logic dapa, afat, agur, atyv, kame, cepo, napu_reset3;
	assign  dapa = !apu_reset;
	assign  afat = !apu_reset;
	assign  agur = !apu_reset;
	assign  atyv = !apu_reset;
	assign  kame = !apu_reset;
	assign  cepo = !apu_reset;
	assign napu_reset4 = dapa;
	assign napu_reset2 = afat;
	assign napu_reset  = agur;
	assign napu_reset3 = atyv;
	assign napu_reset5 = kame;
	assign napu_reset6 = cepo;

	logic kydu, jure, hapo, gufo, jyro, kuby, keba, hawu, hada, hope, bopy, bowy, baza, cely, cone;
	logic kepy, etuc, foku, efop, fero, edek;
	dffr_bp dffr_hada(hawu,       gufo,        d[7], hada);
	dffr_bp dffr_bowy(bopy,       kepy,        d[5], bowy);
	dffr_bp dffr_baza(najer_2mhz, napu_reset3, bowy, baza);
	drlatch latch_fero(etuc, kepy, efop, fero);
	assign  kydu = !ncpu_rd;
	assign jure = !(kydu && ff26);
	assign hawu = !(ff26 && apu_wr);
	assign bopy = !(apu_wr && ff26);
	assign  kepy = !jyro;
	assign  hapo = !nreset2;
	assign  gufo = !hapo;
	assign   jyro = hapo || !hada;
	assign  hope = !jure ? !(!hada) : 'z;
	assign  kuby = !jyro;
	assign  keba = !kuby;
	assign  cely = net03 ? baza : byfe_128hz;
	assign  cone = !cely;
	assign  cate = !cone;
	assign  etuc = apu_wr && ff26;
	assign  efop = d[4] && t1_nt2;
	assign  foku = !etuc;
	assign  edek = !(!fero);
	assign apu_reset = keba;
	assign fero_q    = fero;
	assign net03     = edek;
	assign d[7]      = hope;

	logic aguz, byma, befu, adak, bosu, baxy, bubu, bowe, ataf;
	logic bedu, cozu, bumo, byre, apos, ager, byga, apeg;
	logic atum, bocy, arux, amad, axem, avud, awed, akod;
	drlatch latch_bedu(baxy, kepy, d[7], bedu);
	drlatch latch_cozu(baxy, kepy, d[6], cozu);
	drlatch latch_bumo(baxy, kepy, d[5], bumo);
	drlatch latch_byre(baxy, kepy, d[4], byre);
	drlatch latch_apos(bowe, kepy, d[3], apos);
	drlatch latch_ager(bowe, kepy, d[2], ager);
	drlatch latch_byga(bowe, kepy, d[1], byga);
	drlatch latch_apeg(bowe, kepy, d[0], apeg);
	assign  aguz = !cpu_rd;
	assign  byma = !ff24;
	assign  befu = !(aguz || byma);
	assign  adak = !befu;
	assign bosu = !(ff24 && apu_wr);
	assign  baxy = !bosu;
	assign  bubu = !baxy;
	assign  bowe = !bosu;
	assign  ataf = !bowe;
	assign  atum = !adak ? !(!bedu) : 'z;
	assign  bocy = !adak ? !(!cozu) : 'z;
	assign  arux = !adak ? !(!bumo) : 'z;
	assign  amad = !adak ? !(!byre) : 'z;
	assign  axem = !adak ? !(!apos) : 'z;
	assign  avud = !adak ? !(!ager) : 'z;
	assign  awed = !adak ? !(!byga) : 'z;
	assign  akod = !adak ? !(!apeg) : 'z;
	assign ncpu_rd = aguz;
	assign d[7]    = atum;
	assign d[6]    = bocy;
	assign d[5]    = arux;
	assign d[4]    = amad;
	assign d[3]    = axem;
	assign d[2]    = avud;
	assign d[1]    = awed;
	assign d[0]    = akod;
	assign vin_l_ena   = bedu;
	assign nlvolume[2] = !cozu;
	assign nlvolume[1] = !bumo;
	assign nlvolume[0] = !byre;
	assign vin_r_ena   = apos;
	assign nrvolume[2] = !ager;
	assign nrvolume[1] = !byga;
	assign nrvolume[0] = !apeg;

	logic gepa, hefa, gumu, bupo, bono, byfa;
	logic bogu, bafo, atuf, anev, bepu, befo, bume, bofa;
	logic capu, caga, boca, buzu, cere, cada, cavu, cudu;
	drlatch latch_bogu(bono, kepy, d[1], bogu);
	drlatch latch_bafo(bono, kepy, d[2], bafo);
	drlatch latch_atuf(bono, kepy, d[3], atuf);
	drlatch latch_anev(bono, kepy, d[0], anev);
	drlatch latch_bepu(byfa, kepy, d[7], bepu);
	drlatch latch_befo(byfa, kepy, d[6], befo);
	drlatch latch_bume(byfa, kepy, d[4], bume);
	drlatch latch_bofa(byfa, kepy, d[5], bofa);
	assign  gepa = !ff25;
	assign  hefa = !(ncpu_rd || gepa);
	assign  gumu = !hefa;
	assign bupo = !(ff25 && apu_wr);
	assign  bono = !bupo;
	assign  byfa = !bupo;
	assign  capu = !gumu ? !(!bogu) : 'z;
	assign  caga = !gumu ? !(!bafo) : 'z;
	assign  boca = !gumu ? !(!atuf) : 'z;
	assign  buzu = !gumu ? !(!anev) : 'z;
	assign  cere = !gumu ? !(!bepu) : 'z;
	assign  cada = !gumu ? !(!befo) : 'z;
	assign  cavu = !gumu ? !(!bume) : 'z;
	assign  cudu = !gumu ? !(!bofa) : 'z;
	assign rmixer[1] = bogu;
	assign rmixer[2] = bafo;
	assign rmixer[3] = atuf;
	assign rmixer[0] = anev;
	assign lmixer[3] = bepu;
	assign lmixer[2] = befo;
	assign lmixer[0] = bume;
	assign lmixer[1] = bofa;
	assign d[1]      = capu;
	assign d[2]      = caga;
	assign d[3]      = boca;
	assign d[0]      = buzu;
	assign d[7]      = cere;
	assign d[6]      = cada;
	assign d[4]      = cavu;
	assign d[5]      = cudu;

	logic ceto, kazo, curu, dole, kamu, duru, fewa, coto, koge, efus, fate;
	assign  ceto = !ncpu_rd;
	assign  kazo = !ncpu_rd;
	assign  curu = !ncpu_rd;
	assign  gaxo = !ncpu_rd;
	assign dole = !(ff26 && ceto);
	assign kamu = !(ff26 && kazo);
	assign duru = !(ff26 && curu);
	assign fewa = !(ff26 && gaxo);
	assign  coto = !dole ? !nch1_active : 'z;
	assign  koge = !dole ? !nch4_active : 'z;
	assign  efus = !dole ? !nch2_active : 'z;
	assign  fate = !dole ? !nch3_active : 'z;
	assign d[0] = coto;
	assign d[3] = koge;
	assign d[1] = efus;
	assign d[2] = fate;

endmodule
