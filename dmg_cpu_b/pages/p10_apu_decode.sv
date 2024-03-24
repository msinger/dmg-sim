`timescale 1ns/1ns
`default_nettype none

module apu_decode(
		input logic [15:0] a,

		input logic cpu_wr, cpu_rd,

		output logic ff00wr, ff00rd, apu_wr, ff26, ff3x,
		input  logic ffxx, nffxx,
		output logic anap, duce,
		input  logic nff1a_d7, nch1_amp_en, nch2_amp_en, nch4_amp_en,
		output logic namp_en,

		output logic ff10, ff11, ff12, ff13, ff14, ff16, ff17, ff18, ff19, ff1a,
		output logic ff1b, ff1c, ff1d, ff1e, ff20, ff21, ff22, ff23, ff24, ff25
	);

	logic amus, byko, akug, atoz, acat;
	assign #T_NOR  amus = !(a[7] || a[4] || a[3] || a[2] || a[1] || a[0]);
	assign #T_AND  anap = amus && ffxx;
	assign #T_INV  byko = !a[5];
	assign #T_INV  akug = !a[6];
	assign #T_NAND atoz = !(byko && akug && cpu_wr && anap);
	assign #T_AND  acat = anap && cpu_rd && akug && byko;
	assign ff00wr = atoz;
	assign ff00rd = acat;

	logic boxy, awet, bezy, avun, asad, acom, baro, atup, ateg, buno, banu, cona, doxy, bafu, bogy, tace, nff1x;
	logic ff2x, nff2x;
	assign #T_INV  boxy = !a[5];
	assign #T_OR   awet = a[4] || boxy || a[6] || a[7];
	assign #T_OR   bezy = awet || nffxx;
	assign #T_INV  avun = !a[7];
	assign #T_INV  asad = !a[6];
	assign #T_NAND acom = !(avun && asad && a[5] && a[4]);
	assign #T_NOR  baro = !(acom || nffxx);
	assign #T_INV  atup = !a[4];
	assign #T_OR   ateg = atup || a[5] || a[6] || a[7];
	assign #T_NOR  buno = !(nffxx || ateg);
	assign #T_INV  banu = !buno;
	assign #T_INV  cona = !nff2x;
	assign #T_AND  doxy = cona && xxx6;
	assign #T_INV  bafu = !cpu_wr;
	assign #T_INV  bogy = !bafu;
	assign #T_AND  tace = nch1_amp_en && nch2_amp_en && nff1a_d7 && nch4_amp_en;
	assign nff2x   = bezy;
	assign ff3x    = baro;
	assign nff1x   = banu;
	assign ff2x    = cona;
	assign ff26    = doxy;
	assign apu_wr  = bogy;
	assign namp_en = tace;

	logic dyte, doso, afob, dupa, abub, deno, acol;
	logic dupo, datu, daza, dura, duvu, dofa, damy, dufe, duno, dewa, dejy, dona, dafy, emos;
	logic ekag, esot, egen, exat, emax, etuf, gany, dyva, cafy, covy, cora, dutu, ekez, edaf;
	logic cuge, caxe, covo, doza, danu, dara, feny, duja, dugo, emor, dusa, deco, gefo, xxx6;
	assign #T_INV  dyte = !a[0];
	assign #T_INV  doso = !dyte;
	assign #T_INV  afob = !a[1];
	assign #T_INV  dupa = !afob;
	assign #T_INV  abub = !a[2];
	assign #T_INV  deno = !abub;
	assign #T_INV  acol = !a[3];
	assign #T_INV  duce = !acol;
	assign #T_NAND dupo = !(acol && abub && afob && dyte);
	assign #T_NAND datu = !(dyte && afob && deno && acol);
	assign #T_NAND daza = !(acol && deno && dupa && dyte);
	assign #T_NAND dura = !(doso && afob && deno && acol);
	assign #T_NAND duvu = !(acol && deno && dupa && doso);
	assign #T_AND  dofa = acol && abub && dupa && dyte;
	assign #T_NAND damy = !(acol && abub && dupa && dyte);
	assign #T_NAND dufe = !(doso && dupa && abub && acol);
	assign #T_NAND duno = !(acol && abub && afob && doso);
	assign #T_NAND dewa = !(doso && afob && abub && acol);
	assign #T_NAND dejy = !(duce && abub && afob && doso);
	assign #T_NAND dona = !(dyte && afob && abub && acol);
	assign #T_NAND dafy = !(duce && abub && afob && dyte);
	assign #T_NAND emos = !(doso && afob && deno && duce);
	assign #T_AND  ekag = acol && deno && dupa && dyte;
	assign #T_NAND esot = !(acol && deno && afob && dyte);
	assign #T_NAND egen = !(dyte && dupa && deno && duce);
	assign #T_NAND exat = !(duce && abub && dupa && dyte);
	assign #T_NAND emax = !(doso && dupa && abub && duce);
	assign #T_NAND etuf = !(acol && abub && dupa && doso);
	assign #T_NAND gany = !(duce && deno && afob && dyte);
	assign #T_NOR  dyva = !(dupo || nff1x);
	assign #T_NOR  cafy = !(datu || nff2x);
	assign #T_NOR  covy = !(daza || nff1x);
	assign #T_NOR  cora = !(dura || nff2x);
	assign #T_NOR  dutu = !(duvu || nff1x);
	assign #T_AND  ekez = dofa && ff2x;
	assign #T_NOR  edaf = !(damy || nff1x);
	assign #T_NOR  cuge = !(dufe || nff2x);
	assign #T_NOR  caxe = !(duno || nff1x);
	assign #T_NOR  covo = !(dewa || nff2x);
	assign #T_NOR  doza = !(dejy || nff1x);
	assign #T_NOR  danu = !(dona || nff2x);
	assign #T_NOR  dara = !(dafy || nff1x);
	assign #T_NOR  feny = !(emos || nff1x);
	assign #T_NOR  duja = !(esot || nff1x);
	assign #T_NOR  dugo = !(egen || nff1x);
	assign #T_NOR  emor = !(exat || nff1x);
	assign #T_NOR  dusa = !(emax || nff1x);
	assign #T_NOR  deco = !(etuf || nff1x);
	assign #T_NOR  gefo = !(gany || nff1x);
	assign xxx6 = ekag;
	assign ff10 = dyva;
	assign ff24 = cafy;
	assign ff16 = covy;
	assign ff25 = cora;
	assign ff17 = dutu;
	assign ff22 = ekez;
	assign ff12 = edaf;
	assign ff23 = cuge;
	assign ff11 = caxe;
	assign ff21 = covo;
	assign ff19 = doza;
	assign ff20 = danu;
	assign ff18 = dara;
	assign ff1d = feny;
	assign ff14 = duja;
	assign ff1e = dugo;
	assign ff1a = emor;
	assign ff1b = dusa;
	assign ff13 = deco;
	assign ff1c = gefo;

endmodule
