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
	assign  reho = !nma[12];
	assign  ruma = !nma[11];
	assign  ruky = !nma[10];
	assign  vode = !nma[9];
	assign  vova = !nma[8];
	assign  mume = !nma[7];
	assign  mewy = !nma[6];
	assign  mysa = !nma[5];
	assign  mepa = !nma[4];
	assign  mavu = !nma[3];
	assign  myre = !nma[2];
	assign  masa = !nma[1];
	assign  myfu = !nma[0];
	assign  pony = !reho;
	assign  pedu = !ruma;
	assign  nuva = !ruky;
	assign  tago = !vode;
	assign  tujy = !vova;
	assign  luby = !mume;
	assign  lefa = !mewy;
	assign  lalo = !mysa;
	assign  loly = !mepa;
	assign  luvo = !mavu;
	assign  laca = !myre;
	assign  lozu = !masa;
	assign  lexe = !myfu;
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
	assign ryvo = !(d[5] && lula);
	assign rera = !(d[3] && lula);
	assign raby = !(d[2] && lula);
	assign rory = !(d[4] && lula);
	assign ruja = !(d[1] && lula);
	assign ravu = !(d[7] && lula);
	assign rafy = !(d[6] && lula);
	assign ruxa = !(d[0] && lula);
	assign d_a[5] = ryvo;
	assign d_a[3] = rera;
	assign d_a[2] = raby;
	assign d_a[4] = rory;
	assign d_a[1] = ruja;
	assign d_a[7] = ravu;
	assign d_a[6] = rafy;
	assign d_a[0] = ruxa;

	logic cufe, vape, aver, xujy, bycu;
	assign  cufe = !((saro || dma_run) && mopa_nphi);
	assign  vape = tacu && tuvo;
	assign aver = !(acyl && xyso);
	assign  xujy = !vape;
	assign bycu = !(cufe && xujy && aver);
	assign  cota = !bycu;

	logic tefa, sose, tuca, tuja, tegu, tavy, sycy, soto, tuto, sudo, tefy, sale, tyjy, tole;
	dffr_bp dffr_soto(sycy, nreset6, !soto, soto);
	assign  syro = !nfexxffxx;
	assign  tefa = !(syro || texo);
	assign  sose = a[15] && tefa;
	assign  tuca = sose && abuz;
	assign  tuja = sose && cpu_wr_sync;
	assign tegu = !(sose && from_cpu3);
	assign  tavy = !moe_in;
	assign  sycy = !t1_nt2;
	assign  tuto = t1_nt2 && !soto;
	assign  sudo = !mwr_in;
	assign  tefy = !mcs_in;
	assign  sale = tuto ? tavy : tegu;
	assign  tyjy = tuto ? sudo : tuja;
	assign  tole = tuto ? tefy : tuca;

	logic soho, rawa, raco, rylu, racu, apam, ruvy, sohy, sutu, sere, sazo, ropy, ryje, revo, rela, rocy;
	logic rena, rahu, rofa, rute, sema, sofy, taxy, sewo, tode, saha, refo, ragu, sysy, sety, soky;
	assign  soho = tacu && texy;
	assign  rawa = !soho;
	assign rylu = !(sale && ropy);
	assign  apam = !vram_to_oam;
	assign  racu = rylu && rawa && myma && apam;
	assign  raco = !tuto;
	assign  ruvy = !sale;
	assign  sutu = !(lena || vram_to_oam || texy || sere);
	assign sohy = !(tyjy && sere);
	assign  ropy = !nxymu;
	assign  sere = tole && ropy;
	assign  sazo = ruvy && sere;
	assign  ryje = !sazo;
	assign  revo = !ryje;
	assign   rela = revo || sazo;
	assign  rena = !rela;
	assign  rofa = !rena;
	assign  rocy = sazo && revo;
	assign  rahu = !rocy;
	assign   rute = tuto || racu;
	assign  sema = racu && raco;
	assign   sofy = tuto || sohy;
	assign  taxy = sohy && raco;
	assign   sewo = tuto || sutu;
	assign  tode = sutu && raco;
	assign  saha = !rute;
	assign  refo = !sema;
	assign  ragu = !sofy;
	assign  sysy = !taxy;
	assign  sety = !sewo;
	assign  soky = !tode;
	assign moe_d = saha;
	assign moe_a = refo;
	assign mwr_d = ragu;
	assign mwr_a = sysy;
	assign mcs_d = sety;
	assign mcs_a = soky;
	assign md_b = rofa;

	logic raku, roce, remo, ropu, reta, rydo, rody, reba;
	assign  raku = rena ? !md_in[7] : 'z;
	assign  roce = rena ? !md_in[4] : 'z;
	assign  remo = rena ? !md_in[3] : 'z;
	assign  ropu = rena ? !md_in[5] : 'z;
	assign  reta = rena ? !md_in[6] : 'z;
	assign  rydo = rena ? !md_in[2] : 'z;
	assign  rody = rena ? !md_in[0] : 'z;
	assign  reba = rena ? !md_in[1] : 'z;
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
	assign  tuso = !(t1_nt2 || bedo);
	assign  sole = !tuso;
	assign tahy = !runy ? sole : 'z;
	assign tesu = !runy ? sole : 'z;
	assign taxo = !runy ? sole : 'z;
	assign tovu = !runy ? sole : 'z;
	assign tazu = !runy ? sole : 'z;
	assign tewa = !runy ? sole : 'z;
	assign sosa = !runy ? sole : 'z;
	assign sedu = !runy ? sole : 'z;
	assign d[4] = tahy;
	assign d[5] = tesu;
	assign d[3] = taxo;
	assign d[0] = tovu;
	assign d[6] = tazu;
	assign d[7] = tewa;
	assign d[1] = sosa;
	assign d[2] = sedu;

	logic xane, xedu, xeca, xybo, rysu, ruse, rumo, xyne, xoba, xody, ryna, rese, xaky, xopo, xuxu;
	assign  xane = !(vram_to_oam || nxymu);
	assign  xedu = !xane;
	assign  xeca = !xedu ? !a[4]  : 'z;
	assign  xybo = !xedu ? !a[7]  : 'z;
	assign  rysu = !xedu ? !a[8]  : 'z;
	assign  ruse = !xedu ? !a[10] : 'z;
	assign  rumo = !xedu ? !a[12] : 'z;
	assign  xyne = !xedu ? !a[2]  : 'z;
	assign  xoba = !xedu ? !a[5]  : 'z;
	assign  xody = !xedu ? !a[3]  : 'z;
	assign  ryna = !xedu ? !a[11] : 'z;
	assign  rese = !xedu ? !a[9]  : 'z;
	assign  xaky = !xedu ? !a[0]  : 'z;
	assign  xopo = !xedu ? !a[6]  : 'z;
	assign  xuxu = !xedu ? !a[1]  : 'z;
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
	assign lyra = !(t1_nt2 && roru);
	assign  ryba = !d_in[7];
	assign  ruzy = !d_in[1];
	assign  rome = !d_in[2];
	assign  tehe = !d_in[4];
	assign  soca = !d_in[6];
	assign  ratu = !d_in[5];
	assign  tovo = !d_in[0];
	assign  saza = !d_in[3];
	assign ropa = !lyra ? ryba : 'z;
	assign sywa = !lyra ? ruzy : 'z;
	assign sugu = !lyra ? rome : 'z;
	assign tute = !lyra ? tehe : 'z;
	assign temy = !lyra ? soca : 'z;
	assign sajo = !lyra ? ratu : 'z;
	assign tuty = !lyra ? tovo : 'z;
	assign tawo = !lyra ? saza : 'z;
	assign d[7] = ropa;
	assign d[1] = sywa;
	assign d[2] = sugu;
	assign d[4] = tute;
	assign d[6] = temy;
	assign d[5] = sajo;
	assign d[0] = tuty;
	assign d[3] = tawo;

	logic rove, sefa, suna, sumo, suke, samo, sogo, sazu, sefu, rege, rada, ryro, ryze, reku, ryky, revu, razo;
	assign  rove = !rahu;
	assign  sefa = md[0] && rove;
	assign  suna = md[3] && rove;
	assign  sumo = md[4] && rove;
	assign  suke = md[7] && rove;
	assign  samo = md[6] && rove;
	assign  sogo = md[1] && rove;
	assign  sazu = md[5] && rove;
	assign  sefu = md[2] && rove;
	assign  rege = !sefa;
	assign  rada = !suna;
	assign  ryro = !sumo;
	assign  ryze = !suke;
	assign  reku = !samo;
	assign  ryky = !sogo;
	assign  revu = !sazu;
	assign  razo = !sefu;
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
	assign  cede = !dma_addr_ext;
	assign  syzo = !d_in[7];
	assign  tune = !d_in[1];
	assign  sera = !d_in[2];
	assign  sysa = !d_in[4];
	assign  tube = !d_in[6];
	assign  sugy = !d_in[5];
	assign  ralo = !d_in[0];
	assign  tenu = !d_in[3];
	assign  bape = !cede ? !syzo : 'z;
	assign  bypy = !cede ? !syzo : 'z;
	assign  bomo = !cede ? !tune : 'z;
	assign  bubo = !cede ? !tune : 'z;
	assign  basa = !cede ? !sera : 'z;
	assign  betu = !cede ? !sera : 'z;
	assign  buma = !cede ? !sysa : 'z;
	assign  baxu = !cede ? !sysa : 'z;
	assign  basy = !cede ? !tube : 'z;
	assign  byny = !cede ? !tube : 'z;
	assign  bupy = !cede ? !sugy : 'z;
	assign  buhu = !cede ? !sugy : 'z;
	assign  wasa = !cede ? !ralo : 'z;
	assign  wejo = !cede ? !ralo : 'z;
	assign  cako = !cede ? !tenu : 'z;
	assign  cyme = !cede ? !tenu : 'z;
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
	assign tyvy = !(sere && leko);
	assign  seby = !tyvy;
	assign  roro = !md[5];
	assign  rery = !md[0];
	assign  rona = !md[2];
	assign  runa = !md[1];
	assign  runo = !md[3];
	assign  same = !md[7];
	assign  sana = !md[4];
	assign  rabo = !md[6];
	assign  rexu = seby ? !roro : 'z;
	assign  ruga = seby ? !rery : 'z;
	assign  rybu = seby ? !rona : 'z;
	assign  rota = seby ? !runa : 'z;
	assign  raju = seby ? !runo : 'z;
	assign  toku = seby ? !same : 'z;
	assign  tyja = seby ? !sana : 'z;
	assign  rupy = seby ? !rabo : 'z;
	assign d[5] = rexu;
	assign d[0] = ruga;
	assign d[2] = rybu;
	assign d[1] = rota;
	assign d[3] = raju;
	assign d[7] = toku;
	assign d[4] = tyja;
	assign d[6] = rupy;

	logic xonu, wudo, wawe, wolu, xucy, xeze;
	assign  xonu = !xucy ? !xuha : 'z;
	assign  wudo = !xucy ? !vyno : 'z;
	assign  wawe = !xucy ? !vujo : 'z;
	assign  wolu = !xucy ? !vymu : 'z;
	assign xucy = !(neta && pore);
	assign  xeze = potu && pore;
	assign  wuko = !xeze;
	assign nma[0] = xonu;
	assign nma[1] = wudo;
	assign nma[2] = wawe;
	assign nma[3] = wolu;

	logic teme, tewu, tygo, sote, seke, rujo, tofa, suza;
	logic synu, syma, roko, sybu, sako, sejy, sedo, sawu;
	logic rura, ruly, rare, rodu, rube, rumu, ryty, rady;
	assign teme = !rahu ? d[0] : 'z;
	assign tewu = !rahu ? d[1] : 'z;
	assign tygo = !rahu ? d[2] : 'z;
	assign sote = !rahu ? d[3] : 'z;
	assign seke = !rahu ? d[4] : 'z;
	assign rujo = !rahu ? d[5] : 'z;
	assign tofa = !rahu ? d[6] : 'z;
	assign suza = !rahu ? d[7] : 'z;
	assign   synu = rahu || md[0];
	assign   syma = rahu || md[1];
	assign   roko = rahu || md[2];
	assign   sybu = rahu || md[3];
	assign   sako = rahu || md[4];
	assign   sejy = rahu || md[5];
	assign   sedo = rahu || md[6];
	assign   sawu = rahu || md[7];
	assign  rura = !synu;
	assign  ruly = !syma;
	assign  rare = !roko;
	assign  rodu = !sybu;
	assign  rube = !sako;
	assign  rumu = !sejy;
	assign  ryty = !sedo;
	assign  rady = !sawu;
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
	assign  vuza = !(ff40_d4 || pyju);
	assign  vury = neta ? !vuza  : 'z;
	assign  tobo = neta ? !pyju : 'z;
	assign  suvo = neta ? !powy : 'z;
	assign  reso = neta ? !poju : 'z;
	assign  roha = neta ? !pulo : 'z;
	assign  rusa = neta ? !poxa : 'z;
	assign  vejy = neta ? !pyzo : 'z;
	assign  sezu = neta ? !pozo : 'z;
	assign  vapy = neta ? !rawu : 'z;
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
