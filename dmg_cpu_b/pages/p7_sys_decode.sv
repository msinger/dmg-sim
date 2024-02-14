`default_nettype none

module sys_decode(
		input      logic [15:0] a,
		inout  tri logic [7:0]  d,

		input  logic reset, nreset2, nt1, nt2, wr_in, rd_b,
		input  logic cpu_wr_sync, cpu_raw_rd,
		input  logic from_cpu6,
		output logic cpu_wr, cpu_wr2, cpu_rd, cpu_rd2,
		output logic t1t2_nrst, t1_nt2, nt1_t2,

		output logic ff04_ff07, nff0f_rd, nff0f_wr,
		output logic hram_cs,

		input  logic anap, bedo,
		output logic tutu,
		input  logic a00_07,
		output logic ffxx, nffxx, nfexxffxx, saro,
		output logic ff60_d1, ff60_d0,
		output logic boot_cs
	);

	logic ubet, uvar, upoj, unor, umut;
	assign  ubet = !nt1;
	assign  uvar = !nt2;
	assign upoj = !(ubet && uvar && reset);
	assign  unor = nt2 && ubet;
	assign  umut = uvar && nt1;
	assign t1t2_nrst = upoj;
	assign t1_nt2    = unor;
	assign nt1_t2    = umut;

	logic ubal, ujyv, lexy, tapu, tedo, dyky, ajas, cupa, asot, pin_nc;
	assign ubal = !(t1_nt2 ? wr_in : cpu_wr_sync);
	assign ujyv = !(t1_nt2 ? rd_b  : cpu_raw_rd);
	assign  lexy = !from_cpu6;
	assign  tapu = !ubal;
	assign  tedo = !ujyv;
	assign  dyky = !tapu;
	assign  ajas = !tedo;
	assign  cupa = !dyky;
	assign  asot = !ajas;
	assign pin_nc  = lexy;
	assign cpu_wr  = tapu;
	assign cpu_wr2 = cupa;
	assign cpu_rd  = tedo;
	assign cpu_rd2 = asot;

	logic ryfo, semy, sapa, rolo, refa;
	assign  ryfo = a[2] && a00_07 && ffxx;
	assign  semy = !(a[7] || a[6] || a[5] || a[4]);
	assign  sapa = a[0] && a[1] && a[2] && a[3];
	assign rolo = !(semy && sapa && ffxx && cpu_rd);
	assign refa = !(semy && sapa && ffxx && cpu_wr);
	assign ff04_ff07 = ryfo;
	assign nff0f_rd  = rolo;
	assign nff0f_wr  = refa;

	logic zyra, zage, zabu, zoke, zera, zufy, zyky, zyga, zovy, zuko, zuvy, zyba, zole, zaje, zubu, zapy;
	logic zete, zefu, zyro, zapa, bootrom_na7, bootrom_na6, bootrom_na3, bootrom_na2;
	logic bootrom_na5_na4, bootrom_na5_a4, bootrom_a5_na4, bootrom_a5_a4;
	logic bootrom_na1_na0, bootrom_na1_a0, bootrom_a1_na0, bootrom_a1_a0;
	assign  zyra = !a[7];
	assign  zage = !a[6];
	assign  zabu = !a[3];
	assign  zoke = !a[2];
	assign  zera = !a[5];
	assign  zufy = !a[4];
	assign  zyky = zera && zufy;
	assign  zyga = zera && a[4];
	assign  zovy = a[5] && zufy;
	assign  zuko = a[5] && a[4];
	assign  zuvy = !a[1];
	assign  zyba = !a[0];
	assign  zole = zuvy && zyba;
	assign  zaje = zuvy && a[0];
	assign  zubu = zyba && a[1];
	assign  zapy = a[1] && a[0];
	assign  zete = !zole;
	assign  zefu = !zaje;
	assign  zyro = !zubu;
	assign  zapa = !zapy;
	assign bootrom_na7     = zyra;
	assign bootrom_na6     = zage;
	assign bootrom_na3     = zabu;
	assign bootrom_na2     = zoke;
	assign bootrom_na5_na4 = zyky;
	assign bootrom_na5_a4  = zyga;
	assign bootrom_a5_na4  = zovy;
	assign bootrom_a5_a4   = zuko;
	assign bootrom_na1_na0 = zete;
	assign bootrom_na1_a0  = zefu;
	assign bootrom_a1_na0  = zyro;
	assign bootrom_a1_a0   = zapa;

	logic apet, aper, amut, buro;
	assign   apet = t1_nt2 || nt1_t2;
	assign aper = !(apet && a[5] && a[6] && cpu_wr && anap);
	dffr_bp dffr_amut(aper, nreset2, d[1], amut);
	dffr_bp dffr_buro(aper, nreset2, d[0], buro);
	assign ff60_d1 = amut;
	assign ff60_d0 = buro;

	logic leco, raru, rowe, ryke, ryne, rase, rejy, reka, romy;
	assign  leco = !(bedo || t1_nt2);
	assign  raru = leco ? !0 : 'z;
	assign  rowe = leco ? !0 : 'z;
	assign  ryke = leco ? !0 : 'z;
	assign  ryne = leco ? !0 : 'z;
	assign  rase = leco ? !0 : 'z;
	assign  rejy = leco ? !0 : 'z;
	assign  reka = leco ? !0 : 'z;
	assign  romy = leco ? !0 : 'z;
	assign d[7] = raru;
	assign d[5] = rowe;
	assign d[6] = ryke;
	assign d[1] = ryne;
	assign d[3] = rase;
	assign d[2] = rejy;
	assign d[4] = reka;
	assign d[0] = romy;

	logic wale, woly, wuta;
	assign wale = !(a[0] && a[1] && a[2] && a[3] && a[4] && a[5] && a[6]);
	assign woly = !(wale && a[7] && ffxx);
	assign  wuta = !woly;
	assign hram_cs = wuta;

	logic tona, syke, bako, tuna, rycu, rope, soha;
	assign  tona = !a[8];
	assign tuna = !(a[15] && a[14] && a[13] && a[12] && a[11] && a[10] && a[9]);
	assign  syke = !(tona || tuna);
	assign  bako = !syke;
	assign  rycu = !tuna;
	assign  soha = !ffxx;
	assign rope = !(rycu && soha);
	assign  saro = !rope;
	assign ffxx      = syke;
	assign nffxx     = bako;
	assign nfexxffxx = tuna;

	logic tyro, tufa, texe, sato, tuge, tepu, sypu, tera, yaza, yula, tulo, zoro, zadu, zufa, zado, zery;
	dffr_bp dffr_tepu(tuge, nreset2, sato, tepu);
	assign  tyro = !(a[7] || a[5] || a[3] || a[2] || a[1] || a[0]);
	assign  tufa = a[4] && a[6];
	assign  texe = cpu_rd && ffxx && tufa && tyro;
	assign   sato = d[0] || tepu;
	assign tuge = !(tyro && tufa && ffxx && cpu_wr);
	assign  sypu = texe ? !(!tepu) : 'z;
	assign  tera = !tepu;
	assign  yaza = !nt1_t2;
	assign  tutu = tera && tulo;
	assign  yula = yaza && tutu && cpu_rd;
	assign  tulo = !(a[15] || a[14] || a[13] || a[12] || a[11] || a[10] || a[9] || a[8]);
	assign  zoro = !(a[15] || a[14] || a[13] || a[12]);
	assign  zadu = !(a[11] || a[10] || a[9] || a[8]);
	assign  zufa = zoro && zadu;
	assign zado = !(yula && zufa);
	assign  zery = !zado;
	assign boot_cs = zery;

endmodule
