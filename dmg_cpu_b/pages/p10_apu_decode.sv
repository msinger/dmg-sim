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
	assign  amus = !(a[7] || a[4] || a[3] || a[2] || a[1] || a[0]);
	assign  anap = amus && ffxx;
	assign  byko = !a[5];
	assign  akug = !a[6];
	assign atoz = !(byko && akug && cpu_wr && anap);
	assign  acat = anap && cpu_rd && akug && byko;
	assign ff00wr = atoz;
	assign ff00rd = acat;

	logic boxy, awet, bezy, avun, asad, acom, baro, atup, ateg, buno, banu, cona, doxy, bafu, bogy, tace, nff1x;
	logic ff2x, nff2x;
	assign  boxy = !a[5];
	assign   awet = a[4] || boxy || a[6] || a[7];
	assign   bezy = awet || nffxx;
	assign  avun = !a[7];
	assign  asad = !a[6];
	assign acom = !(avun && asad && a[5] && a[4]);
	assign  baro = !(acom || nffxx);
	assign  atup = !a[4];
	assign   ateg = atup || a[5] || a[6] || a[7];
	assign  buno = !(nffxx || ateg);
	assign  banu = !buno;
	assign  cona = !nff2x;
	assign  doxy = cona && xxx6;
	assign  bafu = !cpu_wr;
	assign  bogy = !bafu;
	assign  tace = nch1_amp_en && nch2_amp_en && nff1a_d7 && nch4_amp_en;
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
	assign  dyte = !a[0];
	assign  doso = !dyte;
	assign  afob = !a[1];
	assign  dupa = !afob;
	assign  abub = !a[2];
	assign  deno = !abub;
	assign  acol = !a[3];
	assign  duce = !acol;
	assign dupo = !(acol && abub && afob && dyte);
	assign datu = !(dyte && afob && deno && acol);
	assign daza = !(acol && deno && dupa && dyte);
	assign dura = !(doso && afob && deno && acol);
	assign duvu = !(acol && deno && dupa && doso);
	assign  dofa = acol && abub && dupa && dyte;
	assign damy = !(acol && abub && dupa && dyte);
	assign dufe = !(doso && dupa && abub && acol);
	assign duno = !(acol && abub && afob && doso);
	assign dewa = !(doso && afob && abub && acol);
	assign dejy = !(duce && abub && afob && doso);
	assign dona = !(dyte && afob && abub && acol);
	assign dafy = !(duce && abub && afob && dyte);
	assign emos = !(doso && afob && deno && duce);
	assign  ekag = acol && deno && dupa && dyte;
	assign esot = !(acol && deno && afob && dyte);
	assign egen = !(dyte && dupa && deno && duce);
	assign exat = !(duce && abub && dupa && dyte);
	assign emax = !(doso && dupa && abub && duce);
	assign etuf = !(acol && abub && dupa && doso);
	assign gany = !(duce && deno && afob && dyte);
	assign  dyva = !(dupo || nff1x);
	assign  cafy = !(datu || nff2x);
	assign  covy = !(daza || nff1x);
	assign  cora = !(dura || nff2x);
	assign  dutu = !(duvu || nff1x);
	assign  ekez = dofa && ff2x;
	assign  edaf = !(damy || nff1x);
	assign  cuge = !(dufe || nff2x);
	assign  caxe = !(duno || nff1x);
	assign  covo = !(dewa || nff2x);
	assign  doza = !(dejy || nff1x);
	assign  danu = !(dona || nff2x);
	assign  dara = !(dafy || nff1x);
	assign  feny = !(emos || nff1x);
	assign  duja = !(esot || nff1x);
	assign  dugo = !(egen || nff1x);
	assign  emor = !(exat || nff1x);
	assign  dusa = !(emax || nff1x);
	assign  deco = !(etuf || nff1x);
	assign  gefo = !(gany || nff1x);
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
