`default_nettype none
`timescale 1ns/100ps

module apu_control(
		cpu_rd, ncpu_rd,
		nreset2,
		d,
		from_cpu,
		ff24, ff25, ff26,
		apu_wr,
		apu_reset, net03,
		napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6,
		apuv_4mhz, ajer_2mhz, byfe_128hz, dyfa_1mhz,
		fero_q, cate, gaxo,
		lmixer, rmixer,
		nch1_active, nch2_active, nch3_active, nch4_active
	);

	input wire cpu_rd;
	input wire nreset2;

	inout wire [7:0] d;

	input wire from_cpu;

	input wire ff24, ff25, ff26;

	input  wire apu_wr;
	output wire apu_reset, net03, ncpu_rd;
	output wire napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6;
	input  wire apuv_4mhz;
	output wire ajer_2mhz, dyfa_1mhz;
	input  wire byfe_128hz;
	output wire fero_q, cate, gaxo;

	output wire [3:0] lmixer, rmixer;

	input wire nch1_active, nch2_active, nch3_active, nch4_active;

	wire ajer, bata, calo, dyfa, najer_2mhz;
	dffr dffr_ajer(apuv_4mhz, napu_reset3, !ajer, ajer); // check edge
	dffr dffr_calo(bata,      napu_reset,  !calo, calo); // check edge
	assign #T_INV  bata = !ajer_2mhz;
	assign #T_INV  dyfa = calo; /* takes !q output of dff */
	assign ajer_2mhz  = ajer;
	assign najer_2mhz = !ajer;
	assign dyfa_1mhz  = dyfa;

	wire dapa, afat, agur, atyv, kame, cepo, napu_reset3;
	assign #T_INV  dapa = !apu_reset;
	assign #T_INV  afat = !apu_reset;
	assign #T_INV  agur = !apu_reset;
	assign #T_INV  atyv = !apu_reset;
	assign #T_INV  kame = !apu_reset;
	assign #T_INV  cepo = !apu_reset;
	assign napu_reset4 = dapa;
	assign napu_reset2 = afat;
	assign napu_reset  = agur;
	assign napu_reset3 = atyv;
	assign napu_reset5 = kame;
	assign napu_reset6 = cepo;

	wire kydu, jure, hapo, gufo, jyro, kuby, keba, hawu, hada, hope, bopy, bowy, baza, cely, cone;
	wire kepy, etuc, foku, efop, fero, edek;
	dffr dffr_hada(hawu,       gufo,        d[7], hada); // check edge
	dffr dffr_bowy(bopy,       kepy,        d[5], bowy); // check edge
	dffr dffr_baza(najer_2mhz, napu_reset3, bowy, baza); // check edge
	dffr dffr_fero(foku,       kepy,        efop, fero); // check edge
	assign #T_INV  kydu = !ncpu_rd;
	assign #T_NAND jure = !(kydu && ff26);
	assign #T_NAND hawu = !(ff26 && apu_wr);
	assign #T_NAND bopy = !(apu_wr && ff26);
	assign #T_INV  kepy = !jyro;
	assign #T_INV  hapo = !nreset2;
	assign #T_INV  gufo = !hapo;
	assign #T_OR   jyro = hapo || !hada;
	assign #T_TRI  hope = !jure ? !hada : 1'bz;
	assign #T_INV  kuby = !jyro;
	assign #T_INV  keba = !kuby;
	assign #T_MUX  cely = net03 ? baza : byfe_128hz;
	assign #T_INV  cone = !cely;
	assign #T_INV  cate = !cone;
	assign #T_AND  etuc = apu_wr && ff26;
	assign #T_AND  efop = d[4] && from_cpu;
	assign #T_INV  foku = !etuc;
	assign #T_INV  edek = fero; /* takes !q output of dff */
	assign apu_reset = keba;
	assign fero_q    = fero;
	assign net03     = edek;
	assign d[7]      = hope;

	wire aguz, byma, befu, adak, bosu, baxy, bubu, bowe, ataf;
	wire bedu, cozu, bumo, byre, apos, ager, byga, apeg;
	wire atum, bocy, arux, amad, axem, avud, awed, akod;
	dffr dffr_bedu(bubu, jyro, d[7], bedu); // check edge
	dffr dffr_cozu(bubu, jyro, d[6], cozu); // check edge
	dffr dffr_bumo(bubu, jyro, d[5], bumo); // check edge
	dffr dffr_byre(bubu, jyro, d[4], byre); // check edge
	dffr dffr_apos(ataf, jyro, d[3], apos); // check edge
	dffr dffr_ager(ataf, jyro, d[2], ager); // check edge
	dffr dffr_byga(ataf, jyro, d[1], byga); // check edge
	dffr dffr_apeg(ataf, jyro, d[0], apeg); // check edge
	assign #T_INV  aguz = !cpu_rd;
	assign #T_INV  byma = !ff24;
	assign #T_NOR  befu = !(aguz || byma);
	assign #T_INV  adak = !befu;
	assign #T_NAND bosu = !(ff24 && apu_wr);
	assign #T_INV  baxy = !bosu;
	assign #T_INV  bubu = !baxy;
	assign #T_INV  bowe = !bosu;
	assign #T_INV  ataf = !bowe;
	assign #T_TRI  atum = !adak ? bedu : 1'bz; /* takes !q output of dff */
	assign #T_TRI  bocy = !adak ? cozu : 1'bz; /* takes !q output of dff */
	assign #T_TRI  arux = !adak ? bumo : 1'bz; /* takes !q output of dff */
	assign #T_TRI  amad = !adak ? byre : 1'bz; /* takes !q output of dff */
	assign #T_TRI  axem = !adak ? apos : 1'bz; /* takes !q output of dff */
	assign #T_TRI  avud = !adak ? ager : 1'bz; /* takes !q output of dff */
	assign #T_TRI  awed = !adak ? byga : 1'bz; /* takes !q output of dff */
	assign #T_TRI  akod = !adak ? apeg : 1'bz; /* takes !q output of dff */
	assign ncpu_rd = aguz;
	assign d[7]    = atum;
	assign d[6]    = bocy;
	assign d[5]    = arux;
	assign d[4]    = amad;
	assign d[3]    = axem;
	assign d[2]    = avud;
	assign d[1]    = awed;
	assign d[0]    = akod;

	wire gepa, hefa, gumu, bupo, bono, byfa;
	wire bogu, bafo, atuf, anev, bepu, befo, bume, bofa;
	wire capu, caga, boca, buzu, cere, cada, cavu, cudu;
	dffr dffr_bogu(bono, jyro, d[1], bogu); // check edge
	dffr dffr_bafo(bono, jyro, d[2], bafo); // check edge
	dffr dffr_atuf(bono, jyro, d[3], atuf); // check edge
	dffr dffr_anev(bono, jyro, d[0], anev); // check edge
	dffr dffr_bepu(byfa, jyro, d[7], bepu); // check edge
	dffr dffr_befo(byfa, jyro, d[6], befo); // check edge
	dffr dffr_bume(byfa, jyro, d[4], bume); // check edge
	dffr dffr_bofa(byfa, jyro, d[5], bofa); // check edge
	assign #T_INV  gepa = !ff25;
	assign #T_NOR  hefa = !(ncpu_rd || gepa);
	assign #T_INV  gumu = !hefa;
	assign #T_NAND bupo = !(ff25 && apu_wr);
	assign #T_INV  bono = !bupo;
	assign #T_INV  byfa = !bupo;
	assign #T_TRI  capu = !gumu ? bogu : 1'bz; /* takes !q output of dff */
	assign #T_TRI  caga = !gumu ? bafo : 1'bz; /* takes !q output of dff */
	assign #T_TRI  boca = !gumu ? atuf : 1'bz; /* takes !q output of dff */
	assign #T_TRI  buzu = !gumu ? anev : 1'bz; /* takes !q output of dff */
	assign #T_TRI  cere = !gumu ? bepu : 1'bz; /* takes !q output of dff */
	assign #T_TRI  cada = !gumu ? befo : 1'bz; /* takes !q output of dff */
	assign #T_TRI  cavu = !gumu ? bume : 1'bz; /* takes !q output of dff */
	assign #T_TRI  cudu = !gumu ? bofa : 1'bz; /* takes !q output of dff */
	assign lmixer[1] = bogu;
	assign lmixer[2] = bafo;
	assign lmixer[3] = atuf;
	assign lmixer[0] = anev;
	assign rmixer[3] = bepu;
	assign rmixer[2] = befo;
	assign rmixer[0] = bume;
	assign rmixer[1] = bofa;
	assign d[1]      = capu;
	assign d[2]      = caga;
	assign d[3]      = boca;
	assign d[0]      = buzu;
	assign d[7]      = cere;
	assign d[6]      = cada;
	assign d[4]      = cavu;
	assign d[5]      = cudu;

	wire ceto, kazo, curu, dole, kamu, duru, fewa, coto, koge, efus, fate;
	assign #T_INV  ceto = !ncpu_rd;
	assign #T_INV  kazo = !ncpu_rd;
	assign #T_INV  curu = !ncpu_rd;
	assign #T_INV  gaxo = !ncpu_rd;
	assign #T_NAND dole = !(ff26 && ceto);
	assign #T_NAND kamu = !(ff26 && kazo);
	assign #T_NAND duru = !(ff26 && curu);
	assign #T_NAND fewa = !(ff26 && gaxo);
	assign #T_TRI  coto = !dole ? !nch1_active : 1'bz;
	assign #T_TRI  koge = !dole ? !nch4_active : 1'bz;
	assign #T_TRI  efus = !dole ? !nch2_active : 1'bz;
	assign #T_TRI  fate = !dole ? !nch3_active : 1'bz;
	assign d[0] = coto;
	assign d[3] = koge;
	assign d[1] = efus;
	assign d[2] = fate;

endmodule
