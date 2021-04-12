`default_nettype none
`timescale 1ns/100ps

module vram_interface(
		a, ma, ma_out,
		md, md_in, md_out, md_a,
		d, d_in, d_a,
		oam_a_d, oam_b_d,
		moe_in, mwr_in, mcs_in, moe_a, moe_d, mwr_a, mwr_d, mcs_a, mcs_d, md_b,
		nt1_t2, dma_run, mopa_phi, nfexxffxx, nreset6, cpu_rd_sync, vram_to_oam, dma_addr_ext, ff40_d4,
		roru, lula, bedo, saro, tacu, tuvo, acyl, xyso, texo, abuz, afas, texy, myma, lena, xymu, leko,
		xuha, vyno, vujo, vymu, neta, pore, potu, npyju, npowy, npoju, npulo, npoxa, npyzo, npozo, nrawu,
		cota, wuko
	);

	input wire [15:0] a;

	inout  wire [12:0] ma;
	output wire [12:0] ma_out;

	inout  wire [7:0] d;
	input  wire [7:0] d_in;
	output wire [7:0] d_a;

	inout  wire [7:0] md;
	input  wire [7:0] md_in;
	output wire [7:0] md_out, md_a;

	output wire [7:0] oam_a_d, oam_b_d;

	input  wire moe_in, mwr_in, mcs_in;
	output wire moe_a, moe_d, mwr_a, mwr_d, mcs_a, mcs_d, md_b;

	input wire nt1_t2, dma_run, mopa_phi, nfexxffxx, nreset6, cpu_rd_sync, vram_to_oam, dma_addr_ext, ff40_d4;

	input  wire roru, lula, bedo, saro, tacu, tuvo, acyl, xyso, texo, abuz, afas, texy, myma, lena, xymu, leko;
	input  wire xuha, vyno, vujo, vymu, neta, pore, potu, npyju, npowy, npoju, npulo, npoxa, npyzo, npozo, nrawu;
	output wire cota, wuko;

	wire reho, pony, ruma, pedu, ruky, nuva, vode, tago, vova, tujy, mume, luby, mewy;
	wire lefa, mysa, lalo, mepa, loly, mavu, luvo, myre, laca, masa, lozu, myfu, lexe;
	assign #T_INV  reho = !ma[12];
	assign #T_INV  ruma = !ma[11];
	assign #T_INV  ruky = !ma[10];
	assign #T_INV  vode = !ma[9];
	assign #T_INV  vova = !ma[8];
	assign #T_INV  mume = !ma[7];
	assign #T_INV  mewy = !ma[6];
	assign #T_INV  mysa = !ma[5];
	assign #T_INV  mepa = !ma[4];
	assign #T_INV  mavu = !ma[3];
	assign #T_INV  myre = !ma[2];
	assign #T_INV  masa = !ma[1];
	assign #T_INV  myfu = !ma[0];
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
	assign ma_out[12] = pony;
	assign ma_out[11] = pedu;
	assign ma_out[10] = nuva;
	assign ma_out[9]  = tago;
	assign ma_out[8]  = tujy;
	assign ma_out[7]  = luby;
	assign ma_out[6]  = lefa;
	assign ma_out[5]  = lalo;
	assign ma_out[4]  = loly;
	assign ma_out[3]  = luvo;
	assign ma_out[2]  = laca;
	assign ma_out[1]  = lozu;
	assign ma_out[0]  = lexe;

	wire ryvo, rera, raby, rory, ruja, ravu, rafy, ruxa;
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

	wire cufe, vape, aver, xujy, bycu;
	assign #T_NAO  cufe = !((saro && dma_run) || mopa_phi);
	assign #T_AND  vape = tacu && tuvo;
	assign #T_AND  aver = acyl && xyso;
	assign #T_INV  xujy = !vape;
	assign #T_NOR  bycu = !(cufe || xujy || aver);
	assign #T_INV  cota = !bycu;

	wire syro, tefa, sose, tuca, tuja, tegu, tavy, sycy, soto, tuto, sudo, tefy, sale, tyjy, tole;
	dffr dffr_soto(sycy, nreset6, !soto, soto); // check edge
	assign #T_INV  syro = !nfexxffxx;
	assign #T_NOR  tefa = !(syro || texo);
	assign #T_AND  sose = a[15] && tefa;
	assign #T_AND  tuca = sose && abuz;
	assign #T_AND  tuja = sose && cpu_rd_sync;
	assign #T_NAND tegu = !(sose && afas);
	assign #T_INV  tavy = !moe_in;
	assign #T_INV  sycy = !nt1_t2;
	assign #T_AND  tuto = nt1_t2 && !soto;
	assign #T_INV  sudo = !mwr_in;
	assign #T_INV  tefy = !mcs_in;
	assign #T_MUX  sale = tuto ? tavy : tegu;
	assign #T_MUX  tyjy = tuto ? sudo : tuja;
	assign #T_MUX  tole = tuto ? tefy : tuca;

	wire soho, rawa, raco, rylu, racu, apam, ruvy, sohy, sutu, sere, sazo, ropy, ryje, revo, rela, rocy;
	wire rena, rahu, rofa, rute, sema, sofy, taxy, sewo, tode, saha, refo, ragu, sysy, sety, soky;
	assign #T_AND  soho = tacu && texy;
	assign #T_INV  rawa = !soho;
	assign #T_NAND rylu = !(sale && ropy);
	assign #T_INV  apam = !vram_to_oam;
	assign #T_AND  racu = rylu && rawa && myma && apam;
	assign #T_INV  raco = !tuto;
	assign #T_INV  ruvy = !sale;
	assign #T_NOR  sutu = !(lena || vram_to_oam || texy || sere);
	assign #T_NAND sohy = !(tyjy && sere);
	assign #T_INV  ropy = !xymu;
	assign #T_AND  sere = tole && ropy;
	assign #T_AND  sazo = ruvy && sere;
	assign #T_INV  ryje = !sazo;
	assign #T_INV  revo = !ryje;
	assign #T_OR   rela = revo || sazo;
	assign #T_INV  rena = !rela;
	assign #T_INV  rofa = !rena;
	assign #T_AND  rocy = sazo && revo;
	assign #T_INV  rahu = !rocy;
	assign #T_OR   rute = tuto || raco;
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

	wire raku, roce, remo, ropu, reta, rydo, rody, reba;
	assign #T_TRI  raku = rena ? !md_in[7] : 1'bz;
	assign #T_TRI  roce = rena ? !md_in[4] : 1'bz;
	assign #T_TRI  remo = rena ? !md_in[3] : 1'bz;
	assign #T_TRI  ropu = rena ? !md_in[5] : 1'bz;
	assign #T_TRI  reta = rena ? !md_in[6] : 1'bz;
	assign #T_TRI  rydo = rena ? !md_in[2] : 1'bz;
	assign #T_TRI  rody = rena ? !md_in[0] : 1'bz;
	assign #T_TRI  reba = rena ? !md_in[1] : 1'bz;
	assign md[7] = raku;
	assign md[4] = roce;
	assign md[3] = remo;
	assign md[5] = ropu;
	assign md[6] = reta;
	assign md[2] = rydo;
	assign md[0] = rody;
	assign md[1] = reba;

	wire runy, tuso, sole, tahy, tesu, taxo, tovu, tazu, tewa, sosa, sedu;
	assign         runy = 1'b1;
	assign #T_NOR  tuso = !(nt1_t2 || bedo);
	assign #T_INV  sole = !tuso;
	assign #T_TRI  tahy = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tesu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  taxo = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tovu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tazu = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  tewa = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  sosa = !runy ? !sole : 1'bz; // check enable input polarity
	assign #T_TRI  sedu = !runy ? !sole : 1'bz; // check enable input polarity
	assign d[4] = tahy;
	assign d[5] = tesu;
	assign d[3] = taxo;
	assign d[0] = tovu;
	assign d[6] = tazu;
	assign d[7] = tewa;
	assign d[1] = sosa;
	assign d[2] = sedu;

	wire xane, xedu, xeca, xybo, rysu, ruse, rumo, xyne, xoba, xody, ryna, rese, xaky, xopo, xuxu;
	assign #T_NOR  xane = !(vram_to_oam || xymu);
	assign #T_INV  xedu = !xane;
	assign #T_TRI  xeca = !xedu ? !a[4]  : 1'bz;
	assign #T_TRI  xybo = !xedu ? !a[7]  : 1'bz;
	assign #T_TRI  rysu = !xedu ? !a[8]  : 1'bz;
	assign #T_TRI  ruse = !xedu ? !a[10] : 1'bz;
	assign #T_TRI  rumo = !xedu ? !a[12] : 1'bz;
	assign #T_TRI  xyne = !xedu ? !a[2]  : 1'bz;
	assign #T_TRI  xoba = !xedu ? !a[5]  : 1'bz;
	assign #T_TRI  xody = !xedu ? !a[3]  : 1'bz;
	assign #T_TRI  ryna = !xedu ? !a[11] : 1'bz;
	assign #T_TRI  rese = !xedu ? !a[9]  : 1'bz;
	assign #T_TRI  xaky = !xedu ? !a[0]  : 1'bz;
	assign #T_TRI  xopo = !xedu ? !a[6]  : 1'bz;
	assign #T_TRI  xuxu = !xedu ? !a[1]  : 1'bz;
	assign ma[4]  = xeca;
	assign ma[7]  = xybo;
	assign ma[8]  = rysu;
	assign ma[10] = ruse;
	assign ma[12] = rumo;
	assign ma[2]  = xyne;
	assign ma[5]  = xoba;
	assign ma[3]  = xody;
	assign ma[11] = ryna;
	assign ma[9]  = rese;
	assign ma[0]  = xaky;
	assign ma[6]  = xopo;
	assign ma[1]  = xuxu;

	wire lyra, ryba, ruzy, rome, tehe, soca, ratu, tovo, saza;
	wire ropa, sywa, sugu, tute, temy, sajo, tuty, tawo;
	assign #T_NAND lyra = !(nt1_t2 && roru);
	assign #T_INV  ryba = !d_in[7];
	assign #T_INV  ruzy = !d_in[1];
	assign #T_INV  rome = !d_in[2];
	assign #T_INV  tehe = !d_in[4];
	assign #T_INV  soca = !d_in[6];
	assign #T_INV  ratu = !d_in[5];
	assign #T_INV  tovo = !d_in[0];
	assign #T_INV  saza = !d_in[3];
	assign #T_TRI  ropa = !lyra ? !ryba : 1'bz; // check enable input polarity
	assign #T_TRI  sywa = !lyra ? !ruzy : 1'bz; // check enable input polarity
	assign #T_TRI  sugu = !lyra ? !rome : 1'bz; // check enable input polarity
	assign #T_TRI  tute = !lyra ? !tehe : 1'bz; // check enable input polarity
	assign #T_TRI  temy = !lyra ? !soca : 1'bz; // check enable input polarity
	assign #T_TRI  sajo = !lyra ? !ratu : 1'bz; // check enable input polarity
	assign #T_TRI  tuty = !lyra ? !tovo : 1'bz; // check enable input polarity
	assign #T_TRI  tawo = !lyra ? !saza : 1'bz; // check enable input polarity
	assign d[7] = ropa;
	assign d[1] = sywa;
	assign d[2] = sugu;
	assign d[4] = tute;
	assign d[6] = temy;
	assign d[5] = sajo;
	assign d[0] = tuty;
	assign d[3] = tawo;

	wire rove, sefa, suna, sumo, suke, samo, sogo, sazu, sefu, rege, rada, ryro, ryze, reku, ryky, revu, razo;
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

	wire cede, syzo, tune, sera, sysa, tube, sugy, ralo, tenu;
	wire bape, bypy, bomo, bubo, basa, betu, buma, baxu, basy, byny, bupy, buhu, wasa, wejo, cako, cyme;
	assign #T_INV  cede = !dma_addr_ext;
	assign #T_INV  syzo = !d_in[7];
	assign #T_INV  tune = !d_in[1];
	assign #T_INV  sera = !d_in[2];
	assign #T_INV  sysa = !d_in[4];
	assign #T_INV  tube = !d_in[6];
	assign #T_INV  sugy = !d_in[5];
	assign #T_INV  ralo = !d_in[0];
	assign #T_INV  tenu = !d_in[3];
	assign #T_TRI  bape = !cede ? !syzo : 1'bz;
	assign #T_TRI  bypy = !cede ? !syzo : 1'bz;
	assign #T_TRI  bomo = !cede ? !tune : 1'bz;
	assign #T_TRI  bubo = !cede ? !tune : 1'bz;
	assign #T_TRI  basa = !cede ? !sera : 1'bz;
	assign #T_TRI  betu = !cede ? !sera : 1'bz;
	assign #T_TRI  buma = !cede ? !sysa : 1'bz;
	assign #T_TRI  baxu = !cede ? !sysa : 1'bz;
	assign #T_TRI  basy = !cede ? !tube : 1'bz;
	assign #T_TRI  byny = !cede ? !tube : 1'bz;
	assign #T_TRI  bupy = !cede ? !sugy : 1'bz;
	assign #T_TRI  buhu = !cede ? !sugy : 1'bz;
	assign #T_TRI  wasa = !cede ? !ralo : 1'bz;
	assign #T_TRI  wejo = !cede ? !ralo : 1'bz;
	assign #T_TRI  cako = !cede ? !tenu : 1'bz;
	assign #T_TRI  cyme = !cede ? !tenu : 1'bz;
	assign oam_b_d[7] = bape;
	assign oam_a_d[7] = bypy;
	assign oam_b_d[1] = bomo;
	assign oam_a_d[1] = bubo;
	assign oam_a_d[2] = basa;
	assign oam_b_d[2] = betu;
	assign oam_b_d[4] = buma;
	assign oam_a_d[4] = baxu;
	assign oam_b_d[6] = basy;
	assign oam_a_d[6] = byny;
	assign oam_a_d[5] = bupy;
	assign oam_b_d[5] = buhu;
	assign oam_a_d[0] = wasa;
	assign oam_b_d[0] = wejo;
	assign oam_b_d[3] = cako;
	assign oam_a_d[3] = cyme;

	wire tyvy, seby, roro, rery, rona, runa, runo, same, sana, rabo, rexu, ruga, rybu, rota, raju, toku, tyja, rupy;
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
	assign #T_TRI  rexu = seby ? !roro : 1'bz;
	assign #T_TRI  ruga = seby ? !rery : 1'bz;
	assign #T_TRI  rybu = seby ? !rona : 1'bz;
	assign #T_TRI  rota = seby ? !runa : 1'bz;
	assign #T_TRI  raju = seby ? !runo : 1'bz;
	assign #T_TRI  toku = seby ? !same : 1'bz;
	assign #T_TRI  tyja = seby ? !sana : 1'bz;
	assign #T_TRI  rupy = seby ? !rabo : 1'bz;
	assign d[5] = rexu;
	assign d[0] = ruga;
	assign d[2] = rybu;
	assign d[1] = rota;
	assign d[3] = raju;
	assign d[7] = toku;
	assign d[4] = tyja;
	assign d[6] = rupy;

	wire xonu, wudo, wawe, wolu, xucy, xeze;
	assign #T_TRI  xonu = !xucy ? !xuha : 1'bz;
	assign #T_TRI  wudo = !xucy ? !vyno : 1'bz;
	assign #T_TRI  wawe = !xucy ? !vujo : 1'bz;
	assign #T_TRI  wolu = !xucy ? !vymu : 1'bz;
	assign #T_NAND xucy = !(neta && pore);
	assign #T_AND  xeze = potu && pore;
	assign #T_INV  wuko = !xeze;

	wire teme, tewu, tygo, sote, seke, rujo, tofa, suza;
	wire synu, syma, roko, sybu, sako, sejy, sedo, sawu;
	wire rura, ruly, rare, rodu, rube, rumu, ryty, rady;
	assign #T_TRI  teme = !rahu ? !d[0] : 1'bz; // check enable input polarity
	assign #T_TRI  tewu = !rahu ? !d[1] : 1'bz; // check enable input polarity
	assign #T_TRI  tygo = !rahu ? !d[2] : 1'bz; // check enable input polarity
	assign #T_TRI  sote = !rahu ? !d[3] : 1'bz; // check enable input polarity
	assign #T_TRI  seke = !rahu ? !d[4] : 1'bz; // check enable input polarity
	assign #T_TRI  rujo = !rahu ? !d[5] : 1'bz; // check enable input polarity
	assign #T_TRI  tofa = !rahu ? !d[6] : 1'bz; // check enable input polarity
	assign #T_TRI  suza = !rahu ? !d[7] : 1'bz; // check enable input polarity
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

	wire vuza, vury, tobo, suvo, reso, roha, rusa, vejy, sezu, vapy;
	assign #T_NOR  vuza = !(ff40_d4 || npyju);
	assign #T_TRI  vury = neta ? !vuza  : 1'bz;
	assign #T_TRI  tobo = neta ? !npyju : 1'bz;
	assign #T_TRI  suvo = neta ? !npowy : 1'bz;
	assign #T_TRI  reso = neta ? !npoju : 1'bz;
	assign #T_TRI  roha = neta ? !npulo : 1'bz;
	assign #T_TRI  rusa = neta ? !npoxa : 1'bz;
	assign #T_TRI  vejy = neta ? !npyzo : 1'bz;
	assign #T_TRI  sezu = neta ? !npozo : 1'bz;
	assign #T_TRI  vapy = neta ? !nrawu : 1'bz;
	assign ma[12] = vury;
	assign ma[11] = tobo;
	assign ma[10] = suvo;
	assign ma[9]  = reso;
	assign ma[8]  = roha;
	assign ma[7]  = rusa;
	assign ma[6]  = vejy;
	assign ma[5]  = sezu;
	assign ma[4]  = vapy;

endmodule
