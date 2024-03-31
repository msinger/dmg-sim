`timescale 1ns/1ns
`default_nettype none

module ch1_regs(
		inout tri logic [7:0] d,

		input logic apu_wr, cpu_rd, ncpu_rd, apu_reset, napu_reset, napu_reset6,
		input logic ff10, ff11, ff12, ff13, ff14,

		output logic nff10_d0, nff10_d1, nff10_d2, nff10_d3, nff10_d4, nff10_d5, nff10_d6,
		output logic ff11_d6, ff11_d7, nff11_d6, nff11_d7,
		output logic ff12_d0, ff12_d1, ff12_d2, ff12_d3, ff12_d4, ff12_d5, ff12_d6, ff12_d7,
		output logic nff12_d0, nff12_d1, nff12_d2, nff12_d3,
		output logic ff14_d6, nff14_d6,

		input  logic [10:0] acc_d,
		input  logic ch1_restart, dyfa_1mhz, net03,
		input  logic anuj, cope, ngexu,
		output logic copu
	);

	logic gago, hocu, gaxu, kagy, hato, haxe, hamy, hafu, kygy;
	logic jopu, jena, jaxo, jaty, jafy, jusa, juzy, joma;
	logic jyse, heve, hewa, howu, hono, jyne, jaca, joku;
	drlatch latch_jopu(gaxu, hato, d[7], jopu);
	drlatch latch_jena(gaxu, hato, d[6], jena);
	drlatch latch_jaxo(gaxu, hato, d[5], jaxo);
	drlatch latch_jaty(gaxu, hato, d[4], jaty);
	drlatch latch_jafy(gaxu, hato, d[3], jafy);
	drlatch latch_jusa(hafu, hato, d[0], jusa);
	drlatch latch_juzy(hafu, hato, d[1], juzy);
	drlatch latch_joma(hafu, hato, d[2], joma);
	assign #T_INV  gago = !ff12;
	assign #T_OR   hocu = gago || ncpu_rd;
	assign #T_AND  gaxu = ff12 && apu_wr;
	assign #T_INV  kagy = !gaxu;
	assign #T_INV  hato = !apu_reset;
	assign #T_INV  haxe = !ff12;
	assign #T_OR   hamy = haxe || ncpu_rd;
	assign #T_AND  hafu = apu_wr && ff12;
	assign #T_INV  kygy = !hafu;
	assign #T_TRI  jyse = !hocu ? !(!jopu) : 'z;
	assign #T_TRI  heve = !hocu ? !(!jena) : 'z;
	assign #T_TRI  hewa = !hocu ? !(!jaxo) : 'z;
	assign #T_TRI  howu = !hocu ? !(!jaty) : 'z;
	assign #T_TRI  hono = !hocu ? !(!jafy) : 'z;
	assign #T_TRI  jyne = !hamy ? !(!jusa) : 'z;
	assign #T_TRI  jaca = !hamy ? !(!juzy) : 'z;
	assign #T_TRI  joku = !hamy ? !(!joma) : 'z;
	assign ff12_d7  = jopu;
	assign ff12_d6  = jena;
	assign ff12_d5  = jaxo;
	assign ff12_d4  = jaty;
	assign ff12_d3  = jafy;
	assign nff12_d3 = !jafy;
	assign ff12_d0  = jusa;
	assign nff12_d0 = !jusa;
	assign ff12_d1  = juzy;
	assign nff12_d1 = !juzy;
	assign ff12_d2  = joma;
	assign nff12_d2 = !joma;
	assign d[7] = jyse;
	assign d[6] = heve;
	assign d[5] = hewa;
	assign d[4] = howu;
	assign d[3] = hono;
	assign d[0] = jyne;
	assign d[1] = jaca;
	assign d[2] = joku;

	logic buda, bale, bage, camy, boko, bytu;
	drlatch latch_boko(!bage, camy, d[6], boko);
	assign #T_INV  buda = !ncpu_rd;
	assign #T_NAND bale = !(buda && ff14);
	assign #T_NAND bage = !(anuj && ff14);
	assign #T_INV  camy = !apu_reset;
	assign #T_TRI  bytu = !bale ? !(!boko) : 'z;
	assign ff14_d6  = boko;
	assign nff14_d6 = !boko;
	assign d[6] = bytu;

	logic cege, daxa, caca, dypu, evaj, epyk, fume, fulo, geku, dega, kype, cure, dako, deru, dupy;
	logic gaxe, hyfe, jyty, kyna, jema, hyke, feva, ekov, emus, evak;
	logic foru, gefu, kyvu, kumo, kary, gode, goje, foze, dopa, demu, dexo;
	tffd tffd_gaxe(geku, fume, acc_d[0],  gaxe);
	tffd tffd_hyfe(gaxe, fume, acc_d[1],  hyfe);
	tffd tffd_jyty(hyfe, fume, acc_d[2],  jyty);
	tffd tffd_kyna(jyty, fume, acc_d[3],  kyna);
	tffd tffd_jema(kype, dega, acc_d[4],  jema);
	tffd tffd_hyke(jema, dega, acc_d[5],  hyke);
	tffd tffd_feva(hyke, dega, acc_d[6],  feva);
	tffd tffd_ekov(feva, dega, acc_d[7],  ekov);
	tffd tffd_emus(deru, dako, acc_d[8],  emus);
	tffd tffd_evak(emus, dako, acc_d[9],  evak);
	tffd tffd_copu(evak, dako, acc_d[10], copu);
	assign #T_INV  cege = !ncpu_rd;
	assign #T_NAND daxa = !(cege && net03);
	assign #T_INV  caca = !ff13;
	assign #T_NOR  dypu = !(daxa || caca);
	assign #T_INV  evaj = !dypu;
	assign #T_NOR  epyk = !(ch1_restart || cope);
	assign #T_INV  fume = !epyk;
	assign #T_NOR  fulo = !(dyfa_1mhz || ngexu);
	assign #T_INV  geku = !fulo;
	assign #T_INV  dega = !epyk;
	assign #T_INV  kype = !(!kyna);
	assign #T_INV  cure = !ff14;
	assign #T_OR   dupy = cure || daxa;
	assign #T_INV  dako = !epyk;
	assign #T_INV  deru = !(!ekov);
	assign #T_TRI  foru = !evaj ? !(!gaxe) : 'z;
	assign #T_TRI  gefu = !evaj ? !(!hyfe) : 'z;
	assign #T_TRI  kyvu = !evaj ? !(!jyty) : 'z;
	assign #T_TRI  kumo = !evaj ? !(!kyna) : 'z;
	assign #T_TRI  kary = !evaj ? !(!jema) : 'z;
	assign #T_TRI  gode = !evaj ? !(!hyke) : 'z;
	assign #T_TRI  goje = !evaj ? !(!feva) : 'z;
	assign #T_TRI  foze = !evaj ? !(!ekov) : 'z;
	assign #T_TRI  dopa = !dupy ? !(!emus) : 'z;
	assign #T_TRI  demu = !dupy ? !(!evak) : 'z;
	assign #T_TRI  dexo = !dupy ? !(!copu) : 'z;
	assign d[0] = foru;
	assign d[1] = gefu;
	assign d[2] = kyvu;
	assign d[3] = kumo;
	assign d[4] = kary;
	assign d[5] = gode;
	assign d[6] = goje;
	assign d[7] = foze;
	assign d[0] = dopa;
	assign d[1] = demu;
	assign d[2] = dexo;

	logic cenu, buze, atyn, asop;
	logic bany, anaz, botu, avaf, arax, adek, bana, amyd, azyp, awos, afox, atax, avek, akux;
	drlatch latch_bany(cenu, napu_reset, d[0], bany);
	drlatch latch_anaz(cenu, napu_reset, d[2], anaz);
	drlatch latch_botu(cenu, napu_reset, d[6], botu);
	drlatch latch_avaf(cenu, napu_reset, d[3], avaf);
	drlatch latch_arax(cenu, napu_reset, d[1], arax);
	drlatch latch_adek(cenu, napu_reset, d[4], adek);
	drlatch latch_bana(cenu, napu_reset, d[5], bana);
	assign #T_AND  cenu = apu_wr && ff10;
	assign #T_INV  buze = !ff10;
	assign #T_NOR  atyn = !(ncpu_rd || buze);
	assign #T_INV  asop = !atyn;
	assign #T_TRI  amyd = !asop ? !(!bany) : 'z;
	assign #T_TRI  azyp = !asop ? !(!anaz) : 'z;
	assign #T_TRI  awos = !asop ? !(!botu) : 'z;
	assign #T_TRI  afox = !asop ? !(!avaf) : 'z;
	assign #T_TRI  atax = !asop ? !(!arax) : 'z;
	assign #T_TRI  avek = !asop ? !(!adek) : 'z;
	assign #T_TRI  akux = !asop ? !(!bana) : 'z;
	assign nff10_d0 = !bany;
	assign nff10_d2 = !anaz;
	assign nff10_d6 = !botu;
	assign nff10_d3 = !avaf;
	assign nff10_d1 = !arax;
	assign nff10_d4 = !adek;
	assign nff10_d5 = !bana;
	assign d[0] = amyd;
	assign d[2] = azyp;
	assign d[6] = awos;
	assign d[3] = afox;
	assign d[1] = atax;
	assign d[4] = avek;
	assign d[5] = akux;

	logic buwa, bexu, covu, dafo, cena, dyca, bowo, cuda;
	drlatch latch_cena(covu, napu_reset6, d[6], cena);
	drlatch latch_dyca(covu, napu_reset6, d[7], dyca);
	assign #T_INV  buwa = !ncpu_rd;
	assign #T_NAND bexu = !(buwa && ff11);
	assign #T_AND  covu = apu_wr && ff11;
	assign #T_INV  dafo = !covu;
	assign #T_TRI  bowo = !bexu ? !(!cena) : 'z;
	assign #T_TRI  cuda = !bexu ? !(!dyca) : 'z;
	assign ff11_d6  = cena;
	assign nff11_d6 = !cena;
	assign ff11_d7  = dyca;
	assign nff11_d7 = !dyca;
	assign d[6] = bowo;
	assign d[7] = cuda;

endmodule
