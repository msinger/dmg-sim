`timescale 1ns/1ns
`default_nettype none

module vram_interface(
		input logic [15:0] a,

		inout  tri logic [12:0] nma,
		output     logic [12:0] nma_out,

		inout  tri logic [7:0] d,
		input      logic [7:0] d_in,
		output     logic [7:0] d_a,

		inout  tri logic [7:0] md,
		input      logic [7:0] md_in,
		output     logic [7:0] md_out, md_a,

		inout tri logic [7:0] oam_a_nd, oam_b_nd,

		input  logic moe_in, mwr_in, mcs_in,
		output logic moe_a, moe_d, mwr_a, mwr_d, mcs_a, mcs_d, md_b,

		input logic t1_nt2, dma_run, mopa_nphi, nfexxffxx, nreset6, cpu_wr_sync, vram_to_oam, dma_addr_ext, ff40_d4,

		input  logic from_cpu3, roru, lula, bedo, saro, tacu, tuvo, acyl, xyso, texo, abuz, texy, myma, lena, nxymu, leko,
		input  logic xuha, vyno, vujo, vymu, neta, pore, potu, pyju, powy, poju, pulo, poxa, pyzo, pozo, rawu,
		output logic cota, wuko, syro
	);

	logic reho, pony, ruma, pedu, ruky, nuva, vode, tago, vova, tujy, mume, luby, mewy;
	logic lefa, mysa, lalo, mepa, loly, mavu, luvo, myre, laca, masa, lozu, myfu, lexe;
	assign #T_INV  reho = !nma[12];
	assign #T_INV  ruma = !nma[11];
	assign #T_INV  ruky = !nma[10];
	assign #T_INV  vode = !nma[9];
	assign #T_INV  vova = !nma[8];
	assign #T_INV  mume = !nma[7];
	assign #T_INV  mewy = !nma[6];
	assign #T_INV  mysa = !nma[5];
	assign #T_INV  mepa = !nma[4];
	assign #T_INV  mavu = !nma[3];
	assign #T_INV  myre = !nma[2];
	assign #T_INV  masa = !nma[1];
	assign #T_INV  myfu = !nma[0];
	assign #T_INV  pony = !reho;
	assign #T_INV  pedu = !ruma;
	assign #T_INV  nuva = !ruky;
	assign #T_INV  tago = !vode;
	assign #T_INV  tujy = !vova;
	assign #T_INV  luby = !mume;
	assign #T_INV  lefa = !mewy;
	assign #T_INV  lalo = !mysa;
	assign #T_INV  loly = !mepa;
	assign #T_INV  luvo = !mavu;
	assign #T_INV  laca = !myre;
	assign #T_INV  lozu = !masa;
	assign #T_INV  lexe = !myfu;
	assign nma_out[12] = pony;
	assign nma_out[11] = pedu;
	assign nma_out[10] = nuva;
	assign nma_out[9]  = tago;
	assign nma_out[8]  = tujy;
	assign nma_out[7]  = luby;
	assign nma_out[6]  = lefa;
	assign nma_out[5]  = lalo;
	assign nma_out[4]  = loly;
	assign nma_out[3]  = luvo;
	assign nma_out[2]  = laca;
	assign nma_out[1]  = lozu;
	assign nma_out[0]  = lexe;

	logic ryvo, rera, raby, rory, ruja, ravu, rafy, ruxa;
	assign #T_NAND ryvo = !(d[5] && lula);
	assign #T_NAND rera = !(d[3] && lula);
	assign #T_NAND raby = !(d[2] && lula);
	assign #T_NAND rory = !(d[4] && lula);
	assign #T_NAND ruja = !(d[1] && lula);
	assign #T_NAND ravu = !(d[7] && lula);
	assign #T_NAND rafy = !(d[6] && lula);
	assign #T_NAND ruxa = !(d[0] && lula);
	assign d_a[5] = ryvo;
	assign d_a[3] = rera;
	assign d_a[2] = raby;
	assign d_a[4] = rory;
	assign d_a[1] = ruja;
	assign d_a[7] = ravu;
	assign d_a[6] = rafy;
	assign d_a[0] = ruxa;

	logic cufe, vape, aver, xujy, bycu;
	assign #T_OAI  cufe = !((saro || dma_run) && mopa_nphi);
	assign #T_AND  vape = tacu && tuvo;
	assign #T_NAND aver = !(acyl && xyso);
	assign #T_INV  xujy = !vape;
	assign #T_NAND bycu = !(cufe && xujy && aver);
	assign #T_INV  cota = !bycu;

	logic tefa, sose, tuca, tuja, tegu, tavy, sycy, soto, tuto, sudo, tefy, sale, tyjy, tole;
	dffr_bp dffr_soto(sycy, nreset6, !soto, soto);
	assign #T_INV  syro = !nfexxffxx;
	assign #T_NOR  tefa = !(syro || texo);
	assign #T_AND  sose = a[15] && tefa;
	assign #T_AND  tuca = sose && abuz;
	assign #T_AND  tuja = sose && cpu_wr_sync;
	assign #T_NAND tegu = !(sose && from_cpu3);
	assign #T_INV  tavy = !moe_in;
	assign #T_INV  sycy = !t1_nt2;
	assign #T_AND  tuto = t1_nt2 && !soto;
	assign #T_INV  sudo = !mwr_in;
	assign #T_INV  tefy = !mcs_in;
	assign #T_MUX  sale = tuto ? tavy : tegu;
	assign #T_MUX  tyjy = tuto ? sudo : tuja;
	assign #T_MUX  tole = tuto ? tefy : tuca;

	logic soho, rawa, raco, rylu, racu, apam, ruvy, sohy, sutu, sere, sazo, ropy, ryje, revo, rela, rocy;
	logic rena, rahu, rofa, rute, sema, sofy, taxy, sewo, tode, saha, refo, ragu, sysy, sety, soky;
	assign #T_AND  soho = tacu && texy;
	assign #T_INV  rawa = !soho;
	assign #T_NAND rylu = !(sale && ropy);
	assign #T_INV  apam = !vram_to_oam;
	assign #T_AND  racu = rylu && rawa && myma && apam;
	assign #T_INV  raco = !tuto;
	assign #T_INV  ruvy = !sale;
	assign #T_NOR  sutu = !(lena || vram_to_oam || texy || sere);
	assign #T_NAND sohy = !(tyjy && sere);
	assign #T_INV  ropy = !nxymu;
	assign #T_AND  sere = tole && ropy;
	assign #T_AND  sazo = ruvy && sere;
	assign #T_INV  ryje = !sazo;
	assign #T_INV  revo = !ryje;
	assign #T_OR   rela = revo || sazo;
	assign #T_INV  rena = !rela;
	assign #T_INV  rofa = !rena;
	assign #T_AND  rocy = sazo && revo;
	assign #T_INV  rahu = !rocy;
	assign #T_OR   rute = tuto || racu;
	assign #T_AND  sema = racu && raco;
	assign #T_OR   sofy = tuto || sohy;
	assign #T_AND  taxy = sohy && raco;
	assign #T_OR   sewo = tuto || sutu;
	assign #T_AND  tode = sutu && raco;
	assign #T_INV  saha = !rute;
	assign #T_INV  refo = !sema;
	assign #T_INV  ragu = !sofy;
	assign #T_INV  sysy = !taxy;
	assign #T_INV  sety = !sewo;
	assign #T_INV  soky = !tode;
	assign moe_d = saha;
	assign moe_a = refo;
	assign mwr_d = ragu;
	assign mwr_a = sysy;
	assign mcs_d = sety;
	assign mcs_a = soky;
	assign md_b = rofa;

	logic raku, roce, remo, ropu, reta, rydo, rody, reba;
	assign #T_TRI  raku = rena ? !md_in[7] : 'z;
	assign #T_TRI  roce = rena ? !md_in[4] : 'z;
	assign #T_TRI  remo = rena ? !md_in[3] : 'z;
	assign #T_TRI  ropu = rena ? !md_in[5] : 'z;
	assign #T_TRI  reta = rena ? !md_in[6] : 'z;
	assign #T_TRI  rydo = rena ? !md_in[2] : 'z;
	assign #T_TRI  rody = rena ? !md_in[0] : 'z;
	assign #T_TRI  reba = rena ? !md_in[1] : 'z;
	assign md[7] = raku;
	assign md[4] = roce;
	assign md[3] = remo;
	assign md[5] = ropu;
	assign md[6] = reta;
	assign md[2] = rydo;
	assign md[0] = rody;
	assign md[1] = reba;

	logic runy, tuso, sole, tahy, tesu, taxo, tovu, tazu, tewa, sosa, sedu;
	assign         runy = 1;
	assign #T_NOR  tuso = !(t1_nt2 || bedo);
	assign #T_INV  sole = !tuso;
	assign #T_TRIB tahy = !runy ? sole : 'z;
	assign #T_TRIB tesu = !runy ? sole : 'z;
	assign #T_TRIB taxo = !runy ? sole : 'z;
	assign #T_TRIB tovu = !runy ? sole : 'z;
	assign #T_TRIB tazu = !runy ? sole : 'z;
	assign #T_TRIB tewa = !runy ? sole : 'z;
	assign #T_TRIB sosa = !runy ? sole : 'z;
	assign #T_TRIB sedu = !runy ? sole : 'z;
	assign d[4] = tahy;
	assign d[5] = tesu;
	assign d[3] = taxo;
	assign d[0] = tovu;
	assign d[6] = tazu;
	assign d[7] = tewa;
	assign d[1] = sosa;
	assign d[2] = sedu;

	logic xane, xedu, xeca, xybo, rysu, ruse, rumo, xyne, xoba, xody, ryna, rese, xaky, xopo, xuxu;
	assign #T_NOR  xane = !(vram_to_oam || nxymu);
	assign #T_INV  xedu = !xane;
	assign #T_TRI  xeca = !xedu ? !a[4]  : 'z;
	assign #T_TRI  xybo = !xedu ? !a[7]  : 'z;
	assign #T_TRI  rysu = !xedu ? !a[8]  : 'z;
	assign #T_TRI  ruse = !xedu ? !a[10] : 'z;
	assign #T_TRI  rumo = !xedu ? !a[12] : 'z;
	assign #T_TRI  xyne = !xedu ? !a[2]  : 'z;
	assign #T_TRI  xoba = !xedu ? !a[5]  : 'z;
	assign #T_TRI  xody = !xedu ? !a[3]  : 'z;
	assign #T_TRI  ryna = !xedu ? !a[11] : 'z;
	assign #T_TRI  rese = !xedu ? !a[9]  : 'z;
	assign #T_TRI  xaky = !xedu ? !a[0]  : 'z;
	assign #T_TRI  xopo = !xedu ? !a[6]  : 'z;
	assign #T_TRI  xuxu = !xedu ? !a[1]  : 'z;
	assign nma[4]  = xeca;
	assign nma[7]  = xybo;
	assign nma[8]  = rysu;
	assign nma[10] = ruse;
	assign nma[12] = rumo;
	assign nma[2]  = xyne;
	assign nma[5]  = xoba;
	assign nma[3]  = xody;
	assign nma[11] = ryna;
	assign nma[9]  = rese;
	assign nma[0]  = xaky;
	assign nma[6]  = xopo;
	assign nma[1]  = xuxu;

	logic lyra, ryba, ruzy, rome, tehe, soca, ratu, tovo, saza;
	logic ropa, sywa, sugu, tute, temy, sajo, tuty, tawo;
	assign #T_NAND lyra = !(t1_nt2 && roru);
	assign #T_INV  ryba = !d_in[7];
	assign #T_INV  ruzy = !d_in[1];
	assign #T_INV  rome = !d_in[2];
	assign #T_INV  tehe = !d_in[4];
	assign #T_INV  soca = !d_in[6];
	assign #T_INV  ratu = !d_in[5];
	assign #T_INV  tovo = !d_in[0];
	assign #T_INV  saza = !d_in[3];
	assign #T_TRIB ropa = !lyra ? ryba : 'z;
	assign #T_TRIB sywa = !lyra ? ruzy : 'z;
	assign #T_TRIB sugu = !lyra ? rome : 'z;
	assign #T_TRIB tute = !lyra ? tehe : 'z;
	assign #T_TRIB temy = !lyra ? soca : 'z;
	assign #T_TRIB sajo = !lyra ? ratu : 'z;
	assign #T_TRIB tuty = !lyra ? tovo : 'z;
	assign #T_TRIB tawo = !lyra ? saza : 'z;
	assign d[7] = ropa;
	assign d[1] = sywa;
	assign d[2] = sugu;
	assign d[4] = tute;
	assign d[6] = temy;
	assign d[5] = sajo;
	assign d[0] = tuty;
	assign d[3] = tawo;

	logic rove, sefa, suna, sumo, suke, samo, sogo, sazu, sefu, rege, rada, ryro, ryze, reku, ryky, revu, razo;
	assign #T_INV  rove = !rahu;
	assign #T_AND  sefa = md[0] && rove;
	assign #T_AND  suna = md[3] && rove;
	assign #T_AND  sumo = md[4] && rove;
	assign #T_AND  suke = md[7] && rove;
	assign #T_AND  samo = md[6] && rove;
	assign #T_AND  sogo = md[1] && rove;
	assign #T_AND  sazu = md[5] && rove;
	assign #T_AND  sefu = md[2] && rove;
	assign #T_INV  rege = !sefa;
	assign #T_INV  rada = !suna;
	assign #T_INV  ryro = !sumo;
	assign #T_INV  ryze = !suke;
	assign #T_INV  reku = !samo;
	assign #T_INV  ryky = !sogo;
	assign #T_INV  revu = !sazu;
	assign #T_INV  razo = !sefu;
	assign md_a[0] = rege;
	assign md_a[3] = rada;
	assign md_a[4] = ryro;
	assign md_a[7] = ryze;
	assign md_a[6] = reku;
	assign md_a[1] = ryky;
	assign md_a[5] = revu;
	assign md_a[2] = razo;

	logic cede, syzo, tune, sera, sysa, tube, sugy, ralo, tenu;
	logic bape, bypy, bomo, bubo, basa, betu, buma, baxu, basy, byny, bupy, buhu, wasa, wejo, cako, cyme;
	assign #T_INV  cede = !dma_addr_ext;
	assign #T_INV  syzo = !d_in[7];
	assign #T_INV  tune = !d_in[1];
	assign #T_INV  sera = !d_in[2];
	assign #T_INV  sysa = !d_in[4];
	assign #T_INV  tube = !d_in[6];
	assign #T_INV  sugy = !d_in[5];
	assign #T_INV  ralo = !d_in[0];
	assign #T_INV  tenu = !d_in[3];
	assign #T_TRI  bape = !cede ? !syzo : 'z;
	assign #T_TRI  bypy = !cede ? !syzo : 'z;
	assign #T_TRI  bomo = !cede ? !tune : 'z;
	assign #T_TRI  bubo = !cede ? !tune : 'z;
	assign #T_TRI  basa = !cede ? !sera : 'z;
	assign #T_TRI  betu = !cede ? !sera : 'z;
	assign #T_TRI  buma = !cede ? !sysa : 'z;
	assign #T_TRI  baxu = !cede ? !sysa : 'z;
	assign #T_TRI  basy = !cede ? !tube : 'z;
	assign #T_TRI  byny = !cede ? !tube : 'z;
	assign #T_TRI  bupy = !cede ? !sugy : 'z;
	assign #T_TRI  buhu = !cede ? !sugy : 'z;
	assign #T_TRI  wasa = !cede ? !ralo : 'z;
	assign #T_TRI  wejo = !cede ? !ralo : 'z;
	assign #T_TRI  cako = !cede ? !tenu : 'z;
	assign #T_TRI  cyme = !cede ? !tenu : 'z;
	assign oam_b_nd[7] = bape;
	assign oam_a_nd[7] = bypy;
	assign oam_b_nd[1] = bomo;
	assign oam_a_nd[1] = bubo;
	assign oam_a_nd[2] = basa;
	assign oam_b_nd[2] = betu;
	assign oam_b_nd[4] = buma;
	assign oam_a_nd[4] = baxu;
	assign oam_b_nd[6] = basy;
	assign oam_a_nd[6] = byny;
	assign oam_a_nd[5] = bupy;
	assign oam_b_nd[5] = buhu;
	assign oam_a_nd[0] = wasa;
	assign oam_b_nd[0] = wejo;
	assign oam_b_nd[3] = cako;
	assign oam_a_nd[3] = cyme;

	logic tyvy, seby, roro, rery, rona, runa, runo, same, sana, rabo, rexu, ruga, rybu, rota, raju, toku, tyja, rupy;
	assign #T_NAND tyvy = !(sere && leko);
	assign #T_INV  seby = !tyvy;
	assign #T_INV  roro = !md[5];
	assign #T_INV  rery = !md[0];
	assign #T_INV  rona = !md[2];
	assign #T_INV  runa = !md[1];
	assign #T_INV  runo = !md[3];
	assign #T_INV  same = !md[7];
	assign #T_INV  sana = !md[4];
	assign #T_INV  rabo = !md[6];
	assign #T_TRI  rexu = seby ? !roro : 'z;
	assign #T_TRI  ruga = seby ? !rery : 'z;
	assign #T_TRI  rybu = seby ? !rona : 'z;
	assign #T_TRI  rota = seby ? !runa : 'z;
	assign #T_TRI  raju = seby ? !runo : 'z;
	assign #T_TRI  toku = seby ? !same : 'z;
	assign #T_TRI  tyja = seby ? !sana : 'z;
	assign #T_TRI  rupy = seby ? !rabo : 'z;
	assign d[5] = rexu;
	assign d[0] = ruga;
	assign d[2] = rybu;
	assign d[1] = rota;
	assign d[3] = raju;
	assign d[7] = toku;
	assign d[4] = tyja;
	assign d[6] = rupy;

	logic xonu, wudo, wawe, wolu, xucy, xeze;
	assign #T_TRI  xonu = !xucy ? !xuha : 'z;
	assign #T_TRI  wudo = !xucy ? !vyno : 'z;
	assign #T_TRI  wawe = !xucy ? !vujo : 'z;
	assign #T_TRI  wolu = !xucy ? !vymu : 'z;
	assign #T_NAND xucy = !(neta && pore);
	assign #T_AND  xeze = potu && pore;
	assign #T_INV  wuko = !xeze;
	assign nma[0] = xonu;
	assign nma[1] = wudo;
	assign nma[2] = wawe;
	assign nma[3] = wolu;

	logic teme, tewu, tygo, sote, seke, rujo, tofa, suza;
	logic synu, syma, roko, sybu, sako, sejy, sedo, sawu;
	logic rura, ruly, rare, rodu, rube, rumu, ryty, rady;
	assign #T_TRIB teme = !rahu ? d[0] : 'z;
	assign #T_TRIB tewu = !rahu ? d[1] : 'z;
	assign #T_TRIB tygo = !rahu ? d[2] : 'z;
	assign #T_TRIB sote = !rahu ? d[3] : 'z;
	assign #T_TRIB seke = !rahu ? d[4] : 'z;
	assign #T_TRIB rujo = !rahu ? d[5] : 'z;
	assign #T_TRIB tofa = !rahu ? d[6] : 'z;
	assign #T_TRIB suza = !rahu ? d[7] : 'z;
	assign #T_OR   synu = rahu || md[0];
	assign #T_OR   syma = rahu || md[1];
	assign #T_OR   roko = rahu || md[2];
	assign #T_OR   sybu = rahu || md[3];
	assign #T_OR   sako = rahu || md[4];
	assign #T_OR   sejy = rahu || md[5];
	assign #T_OR   sedo = rahu || md[6];
	assign #T_OR   sawu = rahu || md[7];
	assign #T_INV  rura = !synu;
	assign #T_INV  ruly = !syma;
	assign #T_INV  rare = !roko;
	assign #T_INV  rodu = !sybu;
	assign #T_INV  rube = !sako;
	assign #T_INV  rumu = !sejy;
	assign #T_INV  ryty = !sedo;
	assign #T_INV  rady = !sawu;
	assign md[0] = teme;
	assign md[1] = tewu;
	assign md[2] = tygo;
	assign md[3] = sote;
	assign md[4] = seke;
	assign md[5] = rujo;
	assign md[6] = tofa;
	assign md[7] = suza;
	assign md_out[0] = rura;
	assign md_out[1] = ruly;
	assign md_out[2] = rare;
	assign md_out[3] = rodu;
	assign md_out[4] = rube;
	assign md_out[5] = rumu;
	assign md_out[6] = ryty;
	assign md_out[7] = rady;

	logic vuza, vury, tobo, suvo, reso, roha, rusa, vejy, sezu, vapy;
	assign #T_NOR  vuza = !(ff40_d4 || pyju);
	assign #T_TRI  vury = neta ? !vuza  : 'z;
	assign #T_TRI  tobo = neta ? !pyju : 'z;
	assign #T_TRI  suvo = neta ? !powy : 'z;
	assign #T_TRI  reso = neta ? !poju : 'z;
	assign #T_TRI  roha = neta ? !pulo : 'z;
	assign #T_TRI  rusa = neta ? !poxa : 'z;
	assign #T_TRI  vejy = neta ? !pyzo : 'z;
	assign #T_TRI  sezu = neta ? !pozo : 'z;
	assign #T_TRI  vapy = neta ? !rawu : 'z;
	assign nma[12] = vury;
	assign nma[11] = tobo;
	assign nma[10] = suvo;
	assign nma[9]  = reso;
	assign nma[8]  = roha;
	assign nma[7]  = rusa;
	assign nma[6]  = vejy;
	assign nma[5]  = sezu;
	assign nma[4]  = vapy;

endmodule
