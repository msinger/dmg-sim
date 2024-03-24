`timescale 1ns/1ns
`default_nettype none

module oam(
		inout tri logic [7:0]  oam_a_nd, oam_b_nd,
		input     logic [7:0]  d, md,
		output    logic [7:0]  oam_a,
		input     logic [15:0] dma_a,
		input     logic [15:0] a,

		output logic clk3, oam_clk, oam_a_cpu_nrd, oam_b_cpu_nrd, oam_a_ncs, oam_b_ncs,
		input  logic cpu_wr2, cpu_rd2, nreset7, reset_video, nreset_video,
		input  logic dma_run, vram_to_oam, oam_addr_ndma,

		input  logic xupy, avap, catu, nxymu, mopa_nphi, saro, tuvo, tyfo_nq, caty, xoce, waru, xare, abez,
		input  logic weza, wuco, wyda, zysu, wyse, wuzy, wyja,
		output logic anom, feto, besu, acyl, amab, azyb, byva, leko, atej
	);

	logic yfel, wewy, goso, elyn, faha, fony, gava;
	dffr_bp dffr_yfel(gava,  anom, !yfel, yfel);
	dffr_bp dffr_wewy(!yfel, anom, !wewy, wewy);
	dffr_bp dffr_goso(!wewy, anom, !goso, goso);
	dffr_bp dffr_elyn(!goso, anom, !elyn, elyn);
	dffr_bp dffr_faha(!elyn, anom, !faha, faha);
	dffr_bp dffr_fony(!faha, anom, !fony, fony);
	assign #T_AND  feto = yfel && wewy && fony && goso;
	assign #T_OR   gava = feto || xupy;

	logic awoh, abaf, anel, byha, amyg, abak;
	dffr_bp dffr_anel(awoh, abez, catu, anel);
	assign #T_INV  awoh = !xupy;
	assign #T_INV  abaf = !catu;
	assign #T_OA   byha = (anel || abaf) && abez;
	assign #T_INV  atej = !byha;
	assign #T_INV  amyg = !nreset_video;
	assign #T_NOR  anom = !(atej || reset_video);
	assign #T_INV  azyb = !atej;
	assign #T_OR   abak = atej || amyg;
	assign #T_INV  byva = !abak;

	logic asen, boge, ajon, bete, apar, ajuj, asam, xyny, xuto, adah, wuje;
	logic wefy, bofe, ajep, xuja, bota, xupa, xuca, apag, asyt, xecy, azul;
	logic bode, yval, yryv, zodo, xuva, azar;
	logic zaxa, zamy, zaky, zopu, wule, wyky, zozo, zaja;
	logic zufo, zuga, zato, zumo, yvuc, xyto, zufe, zyfa;
	logic wuzu, wowa, axer, aveb, asox, amuh, cetu, cofo;
	logic aryn, azoz, acot, agyk, cuje, buse, ater, anum;
	logic oam_addr_nrender, oam_addr_nparse, oam_addr_ncpu;
	dffr_bp dffr_xuva(xyny, xare, xecy, xuva);
	drlatch latch_xecy(waru, nreset7, d[7], xecy);
	nor_srlatch latch_besu(catu, asen, besu,);
	nor_srlatch latch_wuje(xyny, xuto, wuje,);
	assign #T_OR   asen = reset_video || avap;
	assign #T_INV  boge = !dma_run;
	assign #T_AND  ajon = nxymu && boge;
	assign #T_AND  acyl = boge && besu;
	assign #T_INV  bete = !ajon;
	assign #T_INV  apar = !acyl;
	assign #T_NOR  ajuj = !(dma_run || acyl || ajon);
	assign #T_OR   asam = acyl || nxymu || dma_run;
	assign #T_INV  xyny = !mopa_nphi;
	assign #T_AND  xuto = saro && cpu_wr2;
	assign #T_AND  amab = saro && ajuj;
	assign #T_INV  adah = !saro;
	assign #T_AND  wefy = tuvo && tyfo_nq;
	assign #T_INV  bofe = !caty;
	assign #T_NAND ajep = !(acyl && xoce);
	assign #T_INV  xuja = !wefy;
	assign #T_NAND bota = !(bofe && saro && cpu_rd2);
	assign #T_INV  xupa = !wuje;
	assign #T_INV  xuca = !waru;
	assign #T_AO   apag = (xupa && amab) || (ajuj && adah);
	assign #T_AND  asyt = ajep && xuja && bota;
	assign #T_INV  azul = !apag;
	assign #T_INV  bode = !asyt;
	assign #T_INV  yval = !bode;
	assign #T_INV  yryv = !yval;
	assign #T_INV  zodo = !yryv;
	assign #T_INV  azar = !vram_to_oam;
	assign #T_TRI  zaxa = !azul ? !d[0] : 'z;
	assign #T_TRI  zamy = !azul ? !d[0] : 'z;
	assign #T_TRI  zaky = !azul ? !d[1] : 'z;
	assign #T_TRI  zopu = !azul ? !d[1] : 'z;
	assign #T_TRI  wule = !azul ? !d[2] : 'z;
	assign #T_TRI  wyky = !azul ? !d[2] : 'z;
	assign #T_TRI  zozo = !azul ? !d[3] : 'z;
	assign #T_TRI  zaja = !azul ? !d[3] : 'z;
	assign #T_TRI  zufo = !azul ? !d[4] : 'z;
	assign #T_TRI  zuga = !azul ? !d[4] : 'z;
	assign #T_TRI  zato = !azul ? !d[5] : 'z;
	assign #T_TRI  zumo = !azul ? !d[5] : 'z;
	assign #T_TRI  yvuc = !azul ? !d[6] : 'z;
	assign #T_TRI  xyto = !azul ? !d[6] : 'z;
	assign #T_TRI  zufe = !azul ? !d[7] : 'z;
	assign #T_TRI  zyfa = !azul ? !d[7] : 'z;
	assign #T_TRI  wuzu = !azar ? !md[0] : 'z;
	assign #T_TRI  wowa = !azar ? !md[0] : 'z;
	assign #T_TRI  axer = !azar ? !md[1] : 'z;
	assign #T_TRI  aveb = !azar ? !md[1] : 'z;
	assign #T_TRI  asox = !azar ? !md[2] : 'z;
	assign #T_TRI  amuh = !azar ? !md[2] : 'z;
	assign #T_TRI  cetu = !azar ? !md[3] : 'z;
	assign #T_TRI  cofo = !azar ? !md[3] : 'z;
	assign #T_TRI  aryn = !azar ? !md[4] : 'z;
	assign #T_TRI  azoz = !azar ? !md[4] : 'z;
	assign #T_TRI  acot = !azar ? !md[5] : 'z;
	assign #T_TRI  agyk = !azar ? !md[5] : 'z;
	assign #T_TRI  cuje = !azar ? !md[6] : 'z;
	assign #T_TRI  buse = !azar ? !md[6] : 'z;
	assign #T_TRI  ater = !azar ? !md[7] : 'z;
	assign #T_TRI  anum = !azar ? !md[7] : 'z;
	assign oam_addr_nrender = bete;
	assign oam_addr_nparse  = apar;
	assign oam_addr_ncpu    = asam;
	assign clk3             = bode;
	assign oam_clk          = zodo;
	assign oam_a_nd[0] = zaxa;
	assign oam_b_nd[0] = zamy;
	assign oam_a_nd[1] = zaky;
	assign oam_b_nd[1] = zopu;
	assign oam_a_nd[2] = wule;
	assign oam_b_nd[2] = wyky;
	assign oam_a_nd[3] = zozo;
	assign oam_b_nd[3] = zaja;
	assign oam_a_nd[4] = zufo;
	assign oam_b_nd[4] = zuga;
	assign oam_a_nd[5] = zato;
	assign oam_b_nd[5] = zumo;
	assign oam_a_nd[6] = yvuc;
	assign oam_b_nd[6] = xyto;
	assign oam_a_nd[7] = zufe;
	assign oam_b_nd[7] = zyfa;
	assign oam_a_nd[0] = wuzu;
	assign oam_b_nd[0] = wowa;
	assign oam_a_nd[1] = axer;
	assign oam_b_nd[1] = aveb;
	assign oam_a_nd[2] = asox;
	assign oam_b_nd[2] = amuh;
	assign oam_a_nd[3] = cetu;
	assign oam_b_nd[3] = cofo;
	assign oam_a_nd[4] = aryn;
	assign oam_b_nd[4] = azoz;
	assign oam_a_nd[5] = acot;
	assign oam_b_nd[5] = agyk;
	assign oam_a_nd[6] = cuje;
	assign oam_b_nd[6] = buse;
	assign oam_a_nd[7] = ater;
	assign oam_b_nd[7] = anum;

	logic foby, fyke, goby, fetu, yzet, waxa, fugu, gama, fydu, xemu;
	logic gera, faco, faku, edol, ymev, fevu, faby, futo, elug, yvom;
	logic wape, gyka, gema, fyky, yfoc, gose, gybu, guse, fago, yfot;
	logic wacu, wydu, wuwe, fesa, zyfo, garo, geca, gefy, fodo, geka;
	logic mynu, wafo, guko, wuku, ylyc, ynyc, wume, wewu, zone, zofe;
	tri logic [7:0] oam_na;
	assign #T_TRI  foby = !oam_addr_ncpu    ? !a[7] : 'z;
	assign #T_TRI  fyke = !oam_addr_nrender ? !weza : 'z;
	assign #T_TRI  goby = !oam_addr_nparse  ? !fony : 'z;
	assign #T_TRI  fetu = !oam_addr_ndma    ? !dma_a[7] : 'z;
	assign #T_TRI  waxa = !oam_addr_ncpu    ? !a[6] : 'z;
	assign #T_TRI  fugu = !oam_addr_nrender ? !wuco : 'z;
	assign #T_TRI  gama = !oam_addr_nparse  ? !faha : 'z;
	assign #T_TRI  fydu = !oam_addr_ndma    ? !dma_a[6] : 'z;
	assign #T_TRI  gera = !oam_addr_ncpu    ? !a[5] : 'z;
	assign #T_TRI  faco = !oam_addr_nrender ? !wyda : 'z;
	assign #T_TRI  faku = !oam_addr_nparse  ? !elyn : 'z;
	assign #T_TRI  edol = !oam_addr_ndma    ? !dma_a[5] : 'z;
	assign #T_TRI  fevu = !oam_addr_ncpu    ? !a[4] : 'z;
	assign #T_TRI  faby = !oam_addr_nrender ? !zysu : 'z;
	assign #T_TRI  futo = !oam_addr_nparse  ? !goso : 'z;
	assign #T_TRI  elug = !oam_addr_ndma    ? !dma_a[4] : 'z;
	assign #T_TRI  wape = !oam_addr_ncpu    ? !a[3] : 'z;
	assign #T_TRI  gyka = !oam_addr_nrender ? !wyse : 'z;
	assign #T_TRI  gema = !oam_addr_nparse  ? !wewy : 'z;
	assign #T_TRI  fyky = !oam_addr_ndma    ? !dma_a[3] : 'z;
	assign #T_TRI  gose = !oam_addr_ncpu    ? !a[2] : 'z;
	assign #T_TRI  gybu = !oam_addr_nrender ? !wuzy : 'z;
	assign #T_TRI  guse = !oam_addr_nparse  ? !yfel : 'z;
	assign #T_TRI  fago = !oam_addr_ndma    ? !dma_a[2] : 'z;
	assign #T_TRI  wacu = !oam_addr_ncpu    ? !a[1] : 'z;
	assign #T_TRI  wydu = !oam_addr_nrender ? !1 : 'z;
	assign #T_TRI  wuwe = !oam_addr_nparse  ? !0 : 'z;
	assign #T_TRI  fesa = !oam_addr_ndma    ? !dma_a[1] : 'z;
	assign #T_TRI  garo = !oam_addr_ncpu    ? !a[0] : 'z;
	assign #T_TRI  geca = !oam_addr_nrender ? !1 : 'z;
	assign #T_TRI  gefy = !oam_addr_nparse  ? !0 : 'z;
	assign #T_TRI  fodo = !oam_addr_ndma    ? !dma_a[0] : 'z;
	assign #T_INV  yzet = !oam_na[7];
	assign #T_INV  xemu = !oam_na[6];
	assign #T_INV  ymev = !oam_na[5];
	assign #T_INV  yvom = !oam_na[4];
	assign #T_INV  yfoc = !oam_na[3];
	assign #T_INV  yfot = !oam_na[2];
	assign #T_INV  zyfo = !oam_na[1];
	assign #T_INV  geka = !oam_na[0];
	assign #T_NAND mynu = !(cpu_rd2 && caty);
	assign #T_INV  leko = !mynu;
	assign #T_INV  wafo = !geka;
	assign #T_AND  guko = wafo && amab && leko;
	assign #T_AND  wuku = leko && amab && geka;
	assign #T_AND  ylyc = wyja && geka;
	assign #T_AND  ynyc = wafo && wyja;
	assign #T_INV  wume = !guko;
	assign #T_INV  wewu = !wuku;
	assign #T_INV  zone = !ylyc;
	assign #T_INV  zofe = !ynyc;
	assign oam_na[7] = foby;
	assign oam_na[7] = fyke;
	assign oam_na[7] = goby;
	assign oam_na[7] = fetu;
	assign oam_na[6] = waxa;
	assign oam_na[6] = fugu;
	assign oam_na[6] = gama;
	assign oam_na[6] = fydu;
	assign oam_na[5] = gera;
	assign oam_na[5] = faco;
	assign oam_na[5] = faku;
	assign oam_na[5] = edol;
	assign oam_na[4] = fevu;
	assign oam_na[4] = faby;
	assign oam_na[4] = futo;
	assign oam_na[4] = elug;
	assign oam_na[3] = wape;
	assign oam_na[3] = gyka;
	assign oam_na[3] = gema;
	assign oam_na[3] = fyky;
	assign oam_na[2] = gose;
	assign oam_na[2] = gybu;
	assign oam_na[2] = guse;
	assign oam_na[2] = fago;
	assign oam_na[1] = wacu;
	assign oam_na[1] = wydu;
	assign oam_na[1] = wuwe;
	assign oam_na[1] = fesa;
	assign oam_na[0] = garo;
	assign oam_na[0] = geca;
	assign oam_na[0] = gefy;
	assign oam_na[0] = fodo;
	assign oam_a[7] = yzet;
	assign oam_a[6] = xemu;
	assign oam_a[5] = ymev;
	assign oam_a[4] = yvom;
	assign oam_a[3] = yfoc;
	assign oam_a[2] = yfot;
	assign oam_a[1] = zyfo;
	assign oam_a[0] = geka;
	assign oam_b_cpu_nrd = wume;
	assign oam_a_cpu_nrd = wewu;
	assign oam_a_ncs = zone;
	assign oam_b_ncs = zofe;

	/* Icarus doesn't support trireg, so we do it like this: */
	logic [7:0] oam_na_cap = $random;
	always @(oam_na) oam_na_cap = oam_na;
	assign (weak1, weak0) oam_na = oam_na_cap;

endmodule
