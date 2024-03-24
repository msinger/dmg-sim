`timescale 1ns/1ns
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
	assign #T_INV  ubet = !nt1;
	assign #T_INV  uvar = !nt2;
	assign #T_NAND upoj = !(ubet && uvar && reset);
	assign #T_AND  unor = nt2 && ubet;
	assign #T_AND  umut = uvar && nt1;
	assign t1t2_nrst = upoj;
	assign t1_nt2    = unor;
	assign nt1_t2    = umut;

	logic ubal, ujyv, lexy, tapu, tedo, dyky, ajas, cupa, asot, pin_nc;
	assign #T_MUXI ubal = !(t1_nt2 ? wr_in : cpu_wr_sync);
	assign #T_MUXI ujyv = !(t1_nt2 ? rd_b  : cpu_raw_rd);
	assign #T_INV  lexy = !from_cpu6;
	assign #T_INV  tapu = !ubal;
	assign #T_INV  tedo = !ujyv;
	assign #T_INV  dyky = !tapu;
	assign #T_INV  ajas = !tedo;
	assign #T_INV  cupa = !dyky;
	assign #T_INV  asot = !ajas;
	assign pin_nc  = lexy;
	assign cpu_wr  = tapu;
	assign cpu_wr2 = cupa;
	assign cpu_rd  = tedo;
	assign cpu_rd2 = asot;

	logic ryfo, semy, sapa, rolo, refa;
	assign #T_AND  ryfo = a[2] && a00_07 && ffxx;
	assign #T_NOR  semy = !(a[7] || a[6] || a[5] || a[4]);
	assign #T_AND  sapa = a[0] && a[1] && a[2] && a[3];
	assign #T_NAND rolo = !(semy && sapa && ffxx && cpu_rd);
	assign #T_NAND refa = !(semy && sapa && ffxx && cpu_wr);
	assign ff04_ff07 = ryfo;
	assign nff0f_rd  = rolo;
	assign nff0f_wr  = refa;

	logic zyra, zage, zabu, zoke, zera, zufy, zyky, zyga, zovy, zuko, zuvy, zyba, zole, zaje, zubu, zapy;
	logic zete, zefu, zyro, zapa, bootrom_na7, bootrom_na6, bootrom_na3, bootrom_na2;
	logic bootrom_na5_na4, bootrom_na5_a4, bootrom_a5_na4, bootrom_a5_a4;
	logic bootrom_na1_na0, bootrom_na1_a0, bootrom_a1_na0, bootrom_a1_a0;
	assign #T_INV  zyra = !a[7];
	assign #T_INV  zage = !a[6];
	assign #T_INV  zabu = !a[3];
	assign #T_INV  zoke = !a[2];
	assign #T_INV  zera = !a[5];
	assign #T_INV  zufy = !a[4];
	assign #T_AND  zyky = zera && zufy;
	assign #T_AND  zyga = zera && a[4];
	assign #T_AND  zovy = a[5] && zufy;
	assign #T_AND  zuko = a[5] && a[4];
	assign #T_INV  zuvy = !a[1];
	assign #T_INV  zyba = !a[0];
	assign #T_AND  zole = zuvy && zyba;
	assign #T_AND  zaje = zuvy && a[0];
	assign #T_AND  zubu = zyba && a[1];
	assign #T_AND  zapy = a[1] && a[0];
	assign #T_INV  zete = !zole;
	assign #T_INV  zefu = !zaje;
	assign #T_INV  zyro = !zubu;
	assign #T_INV  zapa = !zapy;
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
	assign #T_OR   apet = t1_nt2 || nt1_t2;
	assign #T_NAND aper = !(apet && a[5] && a[6] && cpu_wr && anap);
	dffr_bp dffr_amut(aper, nreset2, d[1], amut);
	dffr_bp dffr_buro(aper, nreset2, d[0], buro);
	assign ff60_d1 = amut;
	assign ff60_d0 = buro;

	logic leco, raru, rowe, ryke, ryne, rase, rejy, reka, romy;
	assign #T_NOR  leco = !(bedo || t1_nt2);
	assign #T_TRI  raru = leco ? !0 : 'z;
	assign #T_TRI  rowe = leco ? !0 : 'z;
	assign #T_TRI  ryke = leco ? !0 : 'z;
	assign #T_TRI  ryne = leco ? !0 : 'z;
	assign #T_TRI  rase = leco ? !0 : 'z;
	assign #T_TRI  rejy = leco ? !0 : 'z;
	assign #T_TRI  reka = leco ? !0 : 'z;
	assign #T_TRI  romy = leco ? !0 : 'z;
	assign d[7] = raru;
	assign d[5] = rowe;
	assign d[6] = ryke;
	assign d[1] = ryne;
	assign d[3] = rase;
	assign d[2] = rejy;
	assign d[4] = reka;
	assign d[0] = romy;

	logic wale, woly, wuta;
	assign #T_NAND wale = !(a[0] && a[1] && a[2] && a[3] && a[4] && a[5] && a[6]);
	assign #T_NAND woly = !(wale && a[7] && ffxx);
	assign #T_INV  wuta = !woly;
	assign hram_cs = wuta;

	logic tona, syke, bako, tuna, rycu, rope, soha;
	assign #T_INV  tona = !a[8];
	assign #T_NAND tuna = !(a[15] && a[14] && a[13] && a[12] && a[11] && a[10] && a[9]);
	assign #T_NOR  syke = !(tona || tuna);
	assign #T_INV  bako = !syke;
	assign #T_INV  rycu = !tuna;
	assign #T_INV  soha = !ffxx;
	assign #T_NAND rope = !(rycu && soha);
	assign #T_INV  saro = !rope;
	assign ffxx      = syke;
	assign nffxx     = bako;
	assign nfexxffxx = tuna;

	logic tyro, tufa, texe, sato, tuge, tepu, sypu, tera, yaza, yula, tulo, zoro, zadu, zufa, zado, zery;
	dffr_bp dffr_tepu(tuge, nreset2, sato, tepu);
	assign #T_NOR  tyro = !(a[7] || a[5] || a[3] || a[2] || a[1] || a[0]);
	assign #T_AND  tufa = a[4] && a[6];
	assign #T_AND  texe = cpu_rd && ffxx && tufa && tyro;
	assign #T_OR   sato = d[0] || tepu;
	assign #T_NAND tuge = !(tyro && tufa && ffxx && cpu_wr);
	assign #T_TRI  sypu = texe ? !(!tepu) : 'z;
	assign #T_INV  tera = !tepu;
	assign #T_INV  yaza = !nt1_t2;
	assign #T_AND  tutu = tera && tulo;
	assign #T_AND  yula = yaza && tutu && cpu_rd;
	assign #T_NOR  tulo = !(a[15] || a[14] || a[13] || a[12] || a[11] || a[10] || a[9] || a[8]);
	assign #T_NOR  zoro = !(a[15] || a[14] || a[13] || a[12]);
	assign #T_NOR  zadu = !(a[11] || a[10] || a[9] || a[8]);
	assign #T_AND  zufa = zoro && zadu;
	assign #T_NAND zado = !(yula && zufa);
	assign #T_INV  zery = !zado;
	assign boot_cs = zery;

endmodule
