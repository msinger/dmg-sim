`timescale 1ns/1ns
`default_nettype none

module channel3(
		inout tri logic [7:0]  d,
		input     logic [15:0] a,

		input logic ncpu_rd, apu_reset, net03,

		input logic bufy_256hz, butu_512khz, cery_2mhz, ajer_2mhz,

		input logic nff1a_d7, ff1b_wr1, ff1b_wr2, ff1b_wr3, ff1c,
		input logic ff1c_d5, nff1c_d5, ff1c_d6, nff1c_d6,
		input logic ff1d_d0, ff1d_d1, ff1d_d2, ff1d_d3, ff1d_d4, ff1d_d5, ff1d_d6, ff1d_d7,
		input logic ff1e_d0, ff1e_d1, ff1e_d2, ff1e_d6, nff1e_d6,

		output logic ch3_active, nch3_active, gase, efar_q, atok,
		output logic nkutu, nkupe, nkunu, nkemu, nkygu, nkepa, nkafo, nkeno, nkeju, nkeza, njapu,
		input  logic wave_ram_rd, ngugu, gara,

		input  logic [3:0] wave_play_d,
		output logic [3:0] wave_a, wave_dac_d
	);

	logic jyfo, huno, hupa, hema, gafu, hefo, juty;
	logic hera, kyko, kaso, kyru, jera, kese;
	logic kutu, kupe, kunu, kemu, kygu, kepa, kafo, keno, keju, keza, japu;
	logic fety, foto, etan, gyry, dero, jeco, hony, geno;
	logic efar, erus, efuz, exel, efal, bole, agyl, afum, axol;
	logic fapy, faro, fote, fana, fera;
	dffr_bp dffr_huno(jyfo,  gafu, !huno, huno);
	dffr_bp dffr_fety(!efal, gyry, !fety, fety);
	dffr_bp dffr_efar(dero,  etan, !efar, efar);
	dffr_bp dffr_erus(!efar, etan, !erus, erus);
	dffr_bp dffr_efuz(!erus, etan, !efuz, efuz);
	dffr_bp dffr_exel(!efuz, etan, !exel, exel);
	dffr_bp dffr_efal(!exel, etan, !efal, efal);
	tffd tffd_kutu(juty, kyko, ff1d_d0, kutu);
	tffd tffd_kupe(kutu, kyko, ff1d_d1, kupe);
	tffd tffd_kunu(kupe, kyko, ff1d_d2, kunu);
	tffd tffd_kemu(kunu, kyko, ff1d_d3, kemu);
	tffd tffd_kygu(kyru, kaso, ff1d_d4, kygu);
	tffd tffd_kepa(kygu, kaso, ff1d_d5, kepa);
	tffd tffd_kafo(kepa, kaso, ff1d_d6, kafo);
	tffd tffd_keno(kafo, kaso, ff1d_d7, keno);
	tffd tffd_keju(kese, jera, ff1e_d0, keju);
	tffd tffd_keza(keju, jera, ff1e_d1, keza);
	tffd tffd_japu(keza, jera, ff1e_d2, japu);
	assign #T_INV  jyfo = !japu;
	assign #T_AND  hupa = huno && cery_2mhz;
	assign #T_INV  hema = !huno;
	assign #T_INV  gase = !hema;
	assign #T_NOR  gafu = !(apu_reset || gara || hupa);
	assign #T_NOR  hefo = !(cery_2mhz || ngugu);
	assign #T_INV  juty = !hefo;
	assign #T_NOR  hera = !(gase || gara);
	assign #T_INV  kyko = !hera;
	assign #T_INV  kaso = !hera;
	assign #T_INV  kyru = !(!kemu);
	assign #T_INV  jera = !hera;
	assign #T_INV  kese = !(!keno);
	assign #T_AND  foto = fety && gase;
	assign #T_NOR  etan = !(gara || fety);
	assign #T_NOR  gyry = !(apu_reset || gara || foto);
	assign #T_INV  dero = !gase;
	assign #T_INV  jeco = !ncpu_rd;
	assign #T_AND  hony = net03 && jeco && ff1c;
	assign #T_INV  geno = !hony;
	assign #T_MUX  bole = ch3_active ? erus : a[0];
	assign #T_MUX  agyl = ch3_active ? efuz : a[1];
	assign #T_MUX  afum = ch3_active ? exel : a[2];
	assign #T_MUX  axol = ch3_active ? efal : a[3];
	assign #T_TRI  fapy = !geno ? !(!efar) : 'z;
	assign #T_TRI  faro = !geno ? !(!erus) : 'z;
	assign #T_TRI  fote = !geno ? !(!efuz) : 'z;
	assign #T_TRI  fana = !geno ? !(!exel) : 'z;
	assign #T_TRI  fera = !geno ? !(!efal) : 'z;
	assign nkutu = !kutu;
	assign nkupe = !kupe;
	assign nkunu = !kunu;
	assign nkemu = !kemu;
	assign nkygu = !kygu;
	assign nkepa = !kepa;
	assign nkafo = !kafo;
	assign nkeno = !keno;
	assign nkeju = !keju;
	assign nkeza = !keza;
	assign njapu = !japu;
	assign efar_q = efar;
	assign wave_a = { axol, afum, agyl, bole };
	assign d[0] = fapy;
	assign d[1] = faro;
	assign d[2] = fote;
	assign d[3] = fana;
	assign d[4] = fera;

	logic gedo, fygo, fozu, ezas, calu, doru, davo, coka, ered;
	dffr_bp dffr_davo(ajer_2mhz, calu, doru, davo);
	nor_srlatch latch_fozu(gara, fygo, fozu,);
	assign #T_AND  gedo = fexu && ff1e_d6;
	assign #T_OR   fygo = apu_reset || gedo || nff1a_d7;
	assign #T_INV  ezas = !fozu;
	assign #T_INV  calu = !apu_reset;
	assign #T_INV  doru = !ezas;
	assign #T_INV  coka = !(!davo);
	assign #T_INV  ered = !coka;
	assign ch3_active  = coka;
	assign nch3_active = ered;

	logic guda, fexu, gepy, genu, falu;
	logic gevo, fory, gatu, gapo, gemo, foro, fave, fyru;
	dffr_bp dffr_fexu(!fyru, guda, !fexu, fexu);
	tffd tffd_gevo(genu, ff1b_wr2, d[0], gevo);
	tffd tffd_fory(gevo, ff1b_wr2, d[1], fory);
	tffd tffd_gatu(fory, ff1b_wr2, d[2], gatu);
	tffd tffd_gapo(gatu, ff1b_wr2, d[3], gapo);
	tffd tffd_gemo(falu, ff1b_wr1, d[4], gemo);
	tffd tffd_foro(gemo, ff1b_wr1, d[5], foro);
	tffd tffd_fave(foro, ff1b_wr1, d[6], fave);
	tffd tffd_fyru(fave, ff1b_wr1, d[7], fyru);
	assign #T_NOR  guda = !(ff1b_wr3 || apu_reset || gara);
	assign #T_NOR  gepy = !(fexu || bufy_256hz || nff1e_d6);
	assign #T_INV  genu = !gepy;
	assign #T_INV  falu = !(!gapo);

	logic goka, gemy, gege, ezag, evug, doky, dore, bary, byka, bopa, bely;
	assign #T_NOR  goka = !(nff1c_d6 || ff1c_d5);
	assign #T_NOR  gemy = !(nff1c_d6 || nff1c_d5);
	assign #T_NOR  gege = !(ff1c_d6 || nff1c_d5);
	assign #T_AO   ezag = (wave_play_d[0] && gege) || (wave_play_d[1] && goka) || (wave_play_d[2] && gemy);
	assign #T_AO   evug = (wave_play_d[1] && gege) || (wave_play_d[2] && goka) || (wave_play_d[3] && gemy);
	assign #T_AO   doky = (gege && wave_play_d[2]) || (wave_play_d[3] && goka);
	assign #T_AND  dore = wave_play_d[3] && gege;
	assign #T_AND  bary = ch3_active && ezag;
	assign #T_AND  byka = ch3_active && evug;
	assign #T_AND  bopa = ch3_active && doky;
	assign #T_AND  bely = ch3_active && dore;
	assign wave_dac_d = { bely, bopa, byka, bary };

	logic beno;
	assign #T_MUX  beno = ch3_active ? butu_512khz : wave_ram_rd;
	assign #T_INV  atok = !beno;

endmodule
