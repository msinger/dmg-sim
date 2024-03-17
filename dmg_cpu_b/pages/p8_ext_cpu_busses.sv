`default_nettype none

module ext_cpu_busses(
		inout  tri logic [7:0]  d,
		input      logic [7:0]  d_in,
		output     logic [7:0]  d_d,
		inout  tri logic [15:0] a,
		input      logic [15:0] a_c, dma_a,
		output     logic [15:0] a_a, a_d,

		output logic wr_a, wr_c, rd_a, rd_c,

		input logic from_cpu3, from_cpu4, from_cpu5,
		input logic cpu_raw_rd, cpu_wr_sync,
		input logic cpu_rd, nt1_t2, t1_nt2, dma_addr_ext,

		input  logic abuz, tutu, nfexxffxx,
		output logic texo, roru, lula,

		output logic cs_out, tola_na1
	);

	logic sogy, tuma, tynu, toza, soby, sepy, ryca, raza, syzu, tyho, tazy, rulo, suze;
	assign  sogy = !a[14];
	assign  tuma = a[13] && sogy && a[15];
	assign   tynu = (a[15] && a[14]) || tuma;
	assign  toza = tynu && abuz && nfexxffxx;
	assign  soby = !(a[15] || tutu);
	assign sepy = !(abuz && soby);
	assign  ryca = !t1_nt2;
	assign  raza = a_c[15];
	assign syzu = !ryca ? raza : 'z;
	assign  tyho = dma_addr_ext ? dma_a[15] : toza;
	assign  tazy = dma_addr_ext ? dma_a[15] : sepy;
	assign  rulo = !(t1_nt2 || tazy);
	assign suze = !(tazy && ryca);
	assign cs_out = tyho;
	assign a_d[15] = rulo;
	assign a_a[15] = suze;
	assign a[15]   = syzu;

	logic tova, nyre, lonu, lobu, lumy, pate, lysa, luno, pege, muce, mojy, male, pamy, masu, mano;
	logic pahy, puhe, leva, labe, loso, luce, lyny, lepy, rore, roxu, meny, mune, mego, myny, net01;
	dlatch_b latch_nyre(mate, a[14], nyre);
	dlatch_b latch_lonu(mate, a[13], lonu);
	dlatch_b latch_lobu(mate, a[12], lobu);
	dlatch_b latch_lumy(mate, a[11], lumy);
	dlatch_b latch_pate(mate, a[10], pate);
	dlatch_b latch_lysa(mate, a[9],  lysa);
	dlatch_b latch_luno(mate, a[8],  luno);
	assign  tova = !t1_nt2;
	assign  pege = dma_addr_ext ? dma_a[14] : nyre;
	assign  muce = dma_addr_ext ? dma_a[13] : lonu;
	assign  mojy = dma_addr_ext ? dma_a[12] : lobu;
	assign  male = dma_addr_ext ? dma_a[11] : lumy;
	assign  pamy = dma_addr_ext ? dma_a[10] : pate;
	assign  masu = dma_addr_ext ? dma_a[9]  : lysa;
	assign  mano = dma_addr_ext ? dma_a[8]  : luno;
	assign  pahy = !(t1_nt2 || pege);
	assign puhe = !(pege && tova);
	assign  leva = !(t1_nt2 || muce);
	assign labe = !(muce && tova);
	assign  loso = !(t1_nt2 || mojy);
	assign luce = !(mojy && tova);
	assign  lyny = !(t1_nt2 || male);
	assign lepy = !(male && tova);
	assign  rore = !(t1_nt2 || pamy);
	assign roxu = !(pamy && tova);
	assign  meny = !(t1_nt2 || masu);
	assign mune = !(masu && tova);
	assign  mego = !(t1_nt2 || mano);
	assign myny = !(mano && tova);
	assign net01   = tova;
	assign a_d[14] = pahy;
	assign a_a[14] = puhe;
	assign a_d[13] = leva;
	assign a_a[13] = labe;
	assign a_d[12] = loso;
	assign a_a[12] = luce;
	assign a_d[11] = lyny;
	assign a_a[11] = lepy;
	assign a_d[10] = rore;
	assign a_a[10] = roxu;
	assign a_d[9]  = meny;
	assign a_a[9]  = mune;
	assign a_d[8]  = mego;
	assign a_a[8]  = myny;

	logic arym, aros, atev, avys, aret, alyr, apur, alor, asur, atyr, atov, atem, amer, apok, atol, amet;
	logic colo, defy, cyka, cepu, ajav, badu, bevo, byla, bola, boty, bajo, boku, cotu, caba, koty, kupo;
	dlatch_b latch_arym(mate, a[7], arym);
	dlatch_b latch_aros(mate, a[6], aros);
	dlatch_b latch_atev(mate, a[5], atev);
	dlatch_b latch_avys(mate, a[4], avys);
	dlatch_b latch_aret(mate, a[3], aret);
	dlatch_b latch_alyr(mate, a[2], alyr);
	dlatch_b latch_apur(mate, a[1], apur);
	dlatch_b latch_alor(mate, a[0], alor);
	assign  asur = dma_addr_ext ? dma_a[7] : arym;
	assign  atyr = dma_addr_ext ? dma_a[6] : aros;
	assign  atov = dma_addr_ext ? dma_a[5] : atev;
	assign  atem = dma_addr_ext ? dma_a[4] : avys;
	assign  amer = dma_addr_ext ? dma_a[3] : aret;
	assign  apok = dma_addr_ext ? dma_a[2] : alyr;
	assign  atol = dma_addr_ext ? dma_a[1] : apur;
	assign  amet = dma_addr_ext ? dma_a[0] : alor;
	assign  colo = !(t1_nt2 || asur);
	assign defy = !(net01 && asur);
	assign  cyka = !(t1_nt2 || atyr);
	assign cepu = !(net01 && atyr);
	assign  ajav = !(t1_nt2 || atov);
	assign badu = !(net01 && atov);
	assign  bevo = !(t1_nt2 || atem);
	assign byla = !(net01 && atem);
	assign  bola = !(t1_nt2 || amer);
	assign boty = !(net01 && amer);
	assign  bajo = !(t1_nt2 || apok);
	assign boku = !(net01 && apok);
	assign  cotu = !(t1_nt2 || atol);
	assign caba = !(net01 && atol);
	assign  koty = !(t1_nt2 || amet);
	assign kupo = !(net01 && amet);
	assign a_d[7] = colo;
	assign a_a[7] = defy;
	assign a_d[6] = cyka;
	assign a_a[6] = cepu;
	assign a_d[5] = ajav;
	assign a_a[5] = badu;
	assign a_d[4] = bevo;
	assign a_a[4] = byla;
	assign a_d[3] = bola;
	assign a_a[3] = boty;
	assign a_d[2] = bajo;
	assign a_a[2] = boku;
	assign a_d[1] = cotu;
	assign a_a[1] = caba;
	assign a_d[0] = koty;
	assign a_a[0] = kupo;

	logic tola, mule, loxo, lasy, mate, sore, tevy, levo, lagu;
	assign  tola = !a[1];
	assign  mule = !nt1_t2;
	assign   loxo = (mule && texo) || nt1_t2;
	assign  lasy = !loxo;
	assign  mate = !lasy;
	assign  sore = !a[15];
	assign   tevy = a[13] || a[14] || sore;
	assign  texo = from_cpu4 && tevy;
	assign  levo = !texo;
	assign   lagu = (cpu_raw_rd && levo) || from_cpu3;
	assign tola_na1 = tola;

	logic moca, mexo, lywe, nevy, moty, puva, tymu, usuf, uver, ugac, urun;
	assign  moca = !(texo || nt1_t2);
	assign  mexo = !cpu_wr_sync;
	assign  lywe = !lagu;
	assign   nevy = mexo || moca;
	assign   moty = moca || lywe;
	assign   puva = nevy || dma_addr_ext;
	assign  tymu = !(dma_addr_ext || moty);
	assign  usuf = !(t1_nt2 || puva);
	assign uver = !(puva && net01);
	assign ugac = !(net01 && tymu);
	assign  urun = !(tymu || t1_nt2);
	assign wr_c = usuf;
	assign wr_a = uver;
	assign rd_a = ugac;
	assign rd_c = urun;

	logic base, afec, buxu, camu, cygu, cogo, kova, anar, azuv, akan, byxe, byne, byna, kejo;
	assign  base = !a_c[3];
	assign  afec = !a_c[4];
	assign  buxu = !a_c[2];
	assign  camu = !a_c[1];
	assign  cygu = !a_c[6];
	assign  cogo = !a_c[7];
	assign  kova = !a_c[0];
	assign anar = !net01 ? base : 'z;
	assign azuv = !net01 ? afec : 'z;
	assign akan = !net01 ? buxu : 'z;
	assign byxe = !net01 ? camu : 'z;
	assign byne = !net01 ? cygu : 'z;
	assign byna = !net01 ? cogo : 'z;
	assign kejo = !net01 ? kova : 'z;
	assign a[3] = anar;
	assign a[4] = azuv;
	assign a[2] = akan;
	assign a[1] = byxe;
	assign a[6] = byne;
	assign a[7] = byna;
	assign a[0] = kejo;

	logic lahe, lura, mujy, pevo, mady, nena, sura, abup, lyna, lefy, lofa, nefe, lora, mapu, rala, ajov;
	assign  lahe = !a_c[12];
	assign  lura = !a_c[13];
	assign  mujy = !a_c[8];
	assign  pevo = !a_c[14];
	assign  mady = !a_c[11];
	assign  nena = !a_c[9];
	assign  sura = !a_c[10];
	assign  abup = !a_c[5];
	assign lyna = !net01 ? lahe : 'z;
	assign lefy = !net01 ? lura : 'z;
	assign lofa = !net01 ? mujy : 'z;
	assign nefe = !net01 ? pevo : 'z;
	assign lora = !net01 ? mady : 'z;
	assign mapu = !net01 ? nena : 'z;
	assign rala = !net01 ? sura : 'z;
	assign ajov = !net01 ? abup : 'z;
	assign a[12] = lyna;
	assign a[13] = lefy;
	assign a[8]  = lofa;
	assign a[14] = nefe;
	assign a[11] = lora;
	assign a[9]  = mapu;
	assign a[10] = rala;
	assign a[5]  = ajov;

	logic redu, rogy, ryda, rune, resy, rypu, suly, seze, tamu;
	assign  redu = !cpu_rd;
	assign  roru = t1_nt2 ? redu : moty;
	assign  lula = !roru;
	assign  rogy = !(roru || d[6]);
	assign  ryda = !(roru || d[7]);
	assign  rune = !(roru || d[0]);
	assign  resy = !(roru || d[4]);
	assign  rypu = !(roru || d[1]);
	assign  suly = !(roru || d[2]);
	assign  seze = !(roru || d[3]);
	assign  tamu = !(roru || d[5]);
	assign d_d[6] = rogy;
	assign d_d[7] = ryda;
	assign d_d[0] = rune;
	assign d_d[4] = resy;
	assign d_d[1] = rypu;
	assign d_d[2] = suly;
	assign d_d[3] = seze;
	assign d_d[5] = tamu;

	logic lavo, sody, selo, rony, soma, raxy, rupa, sago, sazy;
	logic tepe, tavo, ruvo, ryma, ryko, sevu, safo, taju;
	dlatch_b latch_sody(lavo, d_in[4], sody);
	dlatch_b latch_selo(lavo, d_in[3], selo);
	dlatch_b latch_rony(lavo, d_in[1], rony);
	dlatch_b latch_soma(lavo, d_in[0], soma);
	dlatch_b latch_raxy(lavo, d_in[2], raxy);
	dlatch_b latch_rupa(lavo, d_in[6], rupa);
	dlatch_b latch_sago(lavo, d_in[5], sago);
	dlatch_b latch_sazy(lavo, d_in[7], sazy);
	assign lavo = !(cpu_raw_rd && texo && from_cpu5);
	assign  tepe = !lavo ? !sody : 'z;
	assign  tavo = !lavo ? !selo : 'z;
	assign  ruvo = !lavo ? !rony : 'z;
	assign  ryma = !lavo ? !soma : 'z;
	assign  ryko = !lavo ? !raxy : 'z;
	assign  sevu = !lavo ? !rupa : 'z;
	assign  safo = !lavo ? !sago : 'z;
	assign  taju = !lavo ? !sazy : 'z;
	assign d[4] = tepe;
	assign d[3] = tavo;
	assign d[1] = ruvo;
	assign d[0] = ryma;
	assign d[2] = ryko;
	assign d[6] = sevu;
	assign d[5] = safo;
	assign d[7] = taju;

endmodule
