`timescale 1ns/1ns
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
	assign #T_INV  sogy = !a[14];
	assign #T_AND  tuma = a[13] && sogy && a[15];
	assign #T_AO   tynu = (a[15] && a[14]) || tuma;
	assign #T_AND  toza = tynu && abuz && nfexxffxx;
	assign #T_NOR  soby = !(a[15] || tutu);
	assign #T_NAND sepy = !(abuz && soby);
	assign #T_INV  ryca = !t1_nt2;
	assign #T_INV  raza = a_c[15];
	assign #T_TRIB syzu = !ryca ? raza : 'z;
	assign #T_MUX  tyho = dma_addr_ext ? dma_a[15] : toza;
	assign #T_MUX  tazy = dma_addr_ext ? dma_a[15] : sepy;
	assign #T_NOR  rulo = !(t1_nt2 || tazy);
	assign #T_NAND suze = !(tazy && ryca);
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
	assign #T_INV  tova = !t1_nt2;
	assign #T_MUX  pege = dma_addr_ext ? dma_a[14] : nyre;
	assign #T_MUX  muce = dma_addr_ext ? dma_a[13] : lonu;
	assign #T_MUX  mojy = dma_addr_ext ? dma_a[12] : lobu;
	assign #T_MUX  male = dma_addr_ext ? dma_a[11] : lumy;
	assign #T_MUX  pamy = dma_addr_ext ? dma_a[10] : pate;
	assign #T_MUX  masu = dma_addr_ext ? dma_a[9]  : lysa;
	assign #T_MUX  mano = dma_addr_ext ? dma_a[8]  : luno;
	assign #T_NOR  pahy = !(t1_nt2 || pege);
	assign #T_NAND puhe = !(pege && tova);
	assign #T_NOR  leva = !(t1_nt2 || muce);
	assign #T_NAND labe = !(muce && tova);
	assign #T_NOR  loso = !(t1_nt2 || mojy);
	assign #T_NAND luce = !(mojy && tova);
	assign #T_NOR  lyny = !(t1_nt2 || male);
	assign #T_NAND lepy = !(male && tova);
	assign #T_NOR  rore = !(t1_nt2 || pamy);
	assign #T_NAND roxu = !(pamy && tova);
	assign #T_NOR  meny = !(t1_nt2 || masu);
	assign #T_NAND mune = !(masu && tova);
	assign #T_NOR  mego = !(t1_nt2 || mano);
	assign #T_NAND myny = !(mano && tova);
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
	assign #T_MUX  asur = dma_addr_ext ? dma_a[7] : arym;
	assign #T_MUX  atyr = dma_addr_ext ? dma_a[6] : aros;
	assign #T_MUX  atov = dma_addr_ext ? dma_a[5] : atev;
	assign #T_MUX  atem = dma_addr_ext ? dma_a[4] : avys;
	assign #T_MUX  amer = dma_addr_ext ? dma_a[3] : aret;
	assign #T_MUX  apok = dma_addr_ext ? dma_a[2] : alyr;
	assign #T_MUX  atol = dma_addr_ext ? dma_a[1] : apur;
	assign #T_MUX  amet = dma_addr_ext ? dma_a[0] : alor;
	assign #T_NOR  colo = !(t1_nt2 || asur);
	assign #T_NAND defy = !(net01 && asur);
	assign #T_NOR  cyka = !(t1_nt2 || atyr);
	assign #T_NAND cepu = !(net01 && atyr);
	assign #T_NOR  ajav = !(t1_nt2 || atov);
	assign #T_NAND badu = !(net01 && atov);
	assign #T_NOR  bevo = !(t1_nt2 || atem);
	assign #T_NAND byla = !(net01 && atem);
	assign #T_NOR  bola = !(t1_nt2 || amer);
	assign #T_NAND boty = !(net01 && amer);
	assign #T_NOR  bajo = !(t1_nt2 || apok);
	assign #T_NAND boku = !(net01 && apok);
	assign #T_NOR  cotu = !(t1_nt2 || atol);
	assign #T_NAND caba = !(net01 && atol);
	assign #T_NOR  koty = !(t1_nt2 || amet);
	assign #T_NAND kupo = !(net01 && amet);
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
	assign #T_INV  tola = !a[1];
	assign #T_INV  mule = !nt1_t2;
	assign #T_AO   loxo = (mule && texo) || nt1_t2;
	assign #T_INV  lasy = !loxo;
	assign #T_INV  mate = !lasy;
	assign #T_INV  sore = !a[15];
	assign #T_OR   tevy = a[13] || a[14] || sore;
	assign #T_AND  texo = from_cpu4 && tevy;
	assign #T_INV  levo = !texo;
	assign #T_AO   lagu = (cpu_raw_rd && levo) || from_cpu3;
	assign tola_na1 = tola;

	logic moca, mexo, lywe, nevy, moty, puva, tymu, usuf, uver, ugac, urun;
	assign #T_NOR  moca = !(texo || nt1_t2);
	assign #T_INV  mexo = !cpu_wr_sync;
	assign #T_INV  lywe = !lagu;
	assign #T_OR   nevy = mexo || moca;
	assign #T_OR   moty = moca || lywe;
	assign #T_OR   puva = nevy || dma_addr_ext;
	assign #T_NOR  tymu = !(dma_addr_ext || moty);
	assign #T_NOR  usuf = !(t1_nt2 || puva);
	assign #T_NAND uver = !(puva && net01);
	assign #T_NAND ugac = !(net01 && tymu);
	assign #T_NOR  urun = !(tymu || t1_nt2);
	assign wr_c = usuf;
	assign wr_a = uver;
	assign rd_a = ugac;
	assign rd_c = urun;

	logic base, afec, buxu, camu, cygu, cogo, kova, anar, azuv, akan, byxe, byne, byna, kejo;
	assign #T_INV  base = !a_c[3];
	assign #T_INV  afec = !a_c[4];
	assign #T_INV  buxu = !a_c[2];
	assign #T_INV  camu = !a_c[1];
	assign #T_INV  cygu = !a_c[6];
	assign #T_INV  cogo = !a_c[7];
	assign #T_INV  kova = !a_c[0];
	assign #T_TRIB anar = !net01 ? base : 'z;
	assign #T_TRIB azuv = !net01 ? afec : 'z;
	assign #T_TRIB akan = !net01 ? buxu : 'z;
	assign #T_TRIB byxe = !net01 ? camu : 'z;
	assign #T_TRIB byne = !net01 ? cygu : 'z;
	assign #T_TRIB byna = !net01 ? cogo : 'z;
	assign #T_TRIB kejo = !net01 ? kova : 'z;
	assign a[3] = anar;
	assign a[4] = azuv;
	assign a[2] = akan;
	assign a[1] = byxe;
	assign a[6] = byne;
	assign a[7] = byna;
	assign a[0] = kejo;

	logic lahe, lura, mujy, pevo, mady, nena, sura, abup, lyna, lefy, lofa, nefe, lora, mapu, rala, ajov;
	assign #T_INV  lahe = !a_c[12];
	assign #T_INV  lura = !a_c[13];
	assign #T_INV  mujy = !a_c[8];
	assign #T_INV  pevo = !a_c[14];
	assign #T_INV  mady = !a_c[11];
	assign #T_INV  nena = !a_c[9];
	assign #T_INV  sura = !a_c[10];
	assign #T_INV  abup = !a_c[5];
	assign #T_TRIB lyna = !net01 ? lahe : 'z;
	assign #T_TRIB lefy = !net01 ? lura : 'z;
	assign #T_TRIB lofa = !net01 ? mujy : 'z;
	assign #T_TRIB nefe = !net01 ? pevo : 'z;
	assign #T_TRIB lora = !net01 ? mady : 'z;
	assign #T_TRIB mapu = !net01 ? nena : 'z;
	assign #T_TRIB rala = !net01 ? sura : 'z;
	assign #T_TRIB ajov = !net01 ? abup : 'z;
	assign a[12] = lyna;
	assign a[13] = lefy;
	assign a[8]  = lofa;
	assign a[14] = nefe;
	assign a[11] = lora;
	assign a[9]  = mapu;
	assign a[10] = rala;
	assign a[5]  = ajov;

	logic redu, rogy, ryda, rune, resy, rypu, suly, seze, tamu;
	assign #T_INV  redu = !cpu_rd;
	assign #T_MUX  roru = t1_nt2 ? redu : moty;
	assign #T_INV  lula = !roru;
	assign #T_NOR  rogy = !(roru || d[6]);
	assign #T_NOR  ryda = !(roru || d[7]);
	assign #T_NOR  rune = !(roru || d[0]);
	assign #T_NOR  resy = !(roru || d[4]);
	assign #T_NOR  rypu = !(roru || d[1]);
	assign #T_NOR  suly = !(roru || d[2]);
	assign #T_NOR  seze = !(roru || d[3]);
	assign #T_NOR  tamu = !(roru || d[5]);
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
	assign #T_NAND lavo = !(cpu_raw_rd && texo && from_cpu5);
	assign #T_TRI  tepe = !lavo ? !sody : 'z;
	assign #T_TRI  tavo = !lavo ? !selo : 'z;
	assign #T_TRI  ruvo = !lavo ? !rony : 'z;
	assign #T_TRI  ryma = !lavo ? !soma : 'z;
	assign #T_TRI  ryko = !lavo ? !raxy : 'z;
	assign #T_TRI  sevu = !lavo ? !rupa : 'z;
	assign #T_TRI  safo = !lavo ? !sago : 'z;
	assign #T_TRI  taju = !lavo ? !sazy : 'z;
	assign d[4] = tepe;
	assign d[3] = tavo;
	assign d[1] = ruvo;
	assign d[0] = ryma;
	assign d[2] = ryko;
	assign d[6] = sevu;
	assign d[5] = safo;
	assign d[7] = taju;

endmodule
