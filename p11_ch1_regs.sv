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
	dffr_a dffr_jopu(kagy, hato, d[7], jopu); // check clk edge
	dffr_a dffr_jena(kagy, hato, d[6], jena); // check clk edge
	dffr_a dffr_jaxo(kagy, hato, d[5], jaxo); // check clk edge
	dffr_a dffr_jaty(kagy, hato, d[4], jaty); // check clk edge
	dffr_a dffr_jafy(kagy, hato, d[3], jafy); // check clk edge
	dffr_a dffr_jusa(kygy, hato, d[0], jusa); // check clk edge
	dffr_a dffr_juzy(kygy, hato, d[1], juzy); // check clk edge
	dffr_a dffr_joma(kygy, hato, d[2], joma); // check clk edge
	assign #T_INV  gago = !ff12;
	assign #T_OR   hocu = gago || ncpu_rd;
	assign #T_NAND gaxu = !(ff12 && apu_wr);
	assign #T_INV  kagy = !gaxu;
	assign #T_INV  hato = !apu_reset;
	assign #T_INV  haxe = !ff12;
	assign #T_OR   hamy = haxe || ncpu_rd;
	assign #T_AND  hafu = apu_wr && ff12;
	assign #T_INV  kygy = !hafu;
	assign #T_TRI  jyse = !hocu ? jopu : 'z; /* takes !q output of dffr */
	assign #T_TRI  heve = !hocu ? jena : 'z; /* takes !q output of dffr */
	assign #T_TRI  hewa = !hocu ? jaxo : 'z; /* takes !q output of dffr */
	assign #T_TRI  howu = !hocu ? jaty : 'z; /* takes !q output of dffr */
	assign #T_TRI  hono = !hocu ? jafy : 'z; /* takes !q output of dffr */
	assign #T_TRI  jyne = !hamy ? jusa : 'z; /* takes !q output of dffr */
	assign #T_TRI  jaca = !hamy ? juzy : 'z; /* takes !q output of dffr */
	assign #T_TRI  joku = !hamy ? joma : 'z; /* takes !q output of dffr */
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
	dffr_a dffr_boko(bage, camy, d[6], boko); // check clk edge
	assign #T_INV  buda = !cpu_rd;
	assign #T_NAND bale = !(buda && ff14);
	assign #T_NAND bage = !(anuj && ff14);
	assign #T_INV  camy = !apu_reset;
	assign #T_TRI  bytu = !bale ? boko : 'z; /* takes !q output of dffr */
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
	assign #T_INV  kype = kyna; /* takes !q output of tffd */
	assign #T_INV  cure = !ff14;
	assign #T_OR   dupy = cure || daxa;
	assign #T_INV  dako = !epyk;
	assign #T_INV  deru = ekov; /* takes !q output of tffd */
	assign #T_TRI  foru = !evaj ? gaxe : 'z; /* takes !q output of tffd */
	assign #T_TRI  gefu = !evaj ? hyfe : 'z; /* takes !q output of tffd */
	assign #T_TRI  kyvu = !evaj ? jyty : 'z; /* takes !q output of tffd */
	assign #T_TRI  kumo = !evaj ? kyna : 'z; /* takes !q output of tffd */
	assign #T_TRI  kary = !evaj ? jema : 'z; /* takes !q output of tffd */
	assign #T_TRI  gode = !evaj ? hyke : 'z; /* takes !q output of tffd */
	assign #T_TRI  goje = !evaj ? feva : 'z; /* takes !q output of tffd */
	assign #T_TRI  foze = !evaj ? ekov : 'z; /* takes !q output of tffd */
	assign #T_TRI  dopa = !dupy ? emus : 'z; /* takes !q output of tffd */
	assign #T_TRI  demu = !dupy ? evak : 'z; /* takes !q output of tffd */
	assign #T_TRI  dexo = !dupy ? copu : 'z; /* takes !q output of tffd */
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
	dffr_a dffr_bany(cenu, napu_reset, d[0], bany); // check clk edge
	dffr_a dffr_anaz(cenu, napu_reset, d[2], anaz); // check clk edge
	dffr_a dffr_botu(cenu, napu_reset, d[6], botu); // check clk edge
	dffr_a dffr_avaf(cenu, napu_reset, d[3], avaf); // check clk edge
	dffr_a dffr_arax(cenu, napu_reset, d[1], arax); // check clk edge
	dffr_a dffr_adek(cenu, napu_reset, d[4], adek); // check clk edge
	dffr_a dffr_bana(cenu, napu_reset, d[5], bana); // check clk edge
	assign #T_AND  cenu = apu_wr && ff10;
	assign #T_INV  buze = !ff10;
	assign #T_NOR  atyn = !(ncpu_rd || buze);
	assign #T_INV  asop = !atyn;
	assign #T_TRI  amyd = !asop ? bany : 'z; /* takes !q output of dffr */
	assign #T_TRI  azyp = !asop ? anaz : 'z; /* takes !q output of dffr */
	assign #T_TRI  awos = !asop ? botu : 'z; /* takes !q output of dffr */
	assign #T_TRI  afox = !asop ? avaf : 'z; /* takes !q output of dffr */
	assign #T_TRI  atax = !asop ? arax : 'z; /* takes !q output of dffr */
	assign #T_TRI  avek = !asop ? adek : 'z; /* takes !q output of dffr */
	assign #T_TRI  akux = !asop ? bana : 'z; /* takes !q output of dffr */
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
	dffr_a dffr_cena(dafo, napu_reset6, d[6], cena); // check clk edge
	dffr_a dffr_dyca(dafo, napu_reset6, d[7], dyca); // check clk edge
	assign #T_INV  buwa = !ncpu_rd;
	assign #T_NAND bexu = !(buwa && ff11);
	assign #T_AND  covu = apu_wr && ff11;
	assign #T_INV  dafo = !covu;
	assign #T_TRI  bowo = !bexu ? cena : 'z; /* takes !q output of dffr */
	assign #T_TRI  cuda = !bexu ? dyca : 'z; /* takes !q output of dffr */
	assign ff11_d6  = cena;
	assign nff11_d6 = !cena;
	assign ff11_d7  = dyca;
	assign nff11_d7 = !dyca;
	assign d[6] = bowo;
	assign d[7] = cuda;

endmodule
