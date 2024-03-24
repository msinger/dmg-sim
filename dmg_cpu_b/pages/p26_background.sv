`timescale 1ns/1ns
`default_nettype none

module background(
		inout tri logic [12:0] nma,

		input logic [7:0] v, h,

		input  logic ff40_d3, clkpipe,
		input  logic ff42_d0, ff42_d1, ff42_d2, ff42_d3, ff42_d4, ff42_d5, ff42_d6, ff42_d7,
		input  logic ff43_d0, ff43_d1, ff43_d2, ff43_d3, ff43_d4, ff43_d5, ff43_d6, ff43_d7,
		input  logic pore, potu, neta, xuha, ndepo, lesy, lota, lyku, roby, tyta, tyco, soka, xovu,
		output logic vava
	);

	logic axad, acen, asul, bafy, beje;
	logic fafo, emux, ecab, etam, doto, daba, efyk, ejok;
	logic fafo_c, emux_c, ecab_c, etam_c, doto_c, daba_c, efyk_c, ejok_c;
	logic asum, evad, dahu, dode, duho, CASE, cypo, ceta, dafe;
	logic atad, behu, apyh, babe, abod, bewy, byca, acul;
	logic atad_c, behu_c, apyh_c, babe_c, abod_c, bewy_c, byca_c, acul_c;
	logic amuv, coxo, cove, axep, afeb, alel, coly, ajan;
	assign #T_INV  axad = !pore;
	assign #T_AND  acen = potu && axad;
	assign #T_AND  asul = axad && neta;
	assign #T_INV  bafy = !acen;
	assign #T_INV  beje = !asul;
	assign #T_HADD { fafo_c, fafo } = v[0] + ff42_d0;
	assign #T_ADD  { emux_c, emux } = v[1] + ff42_d1 + fafo_c;
	assign #T_ADD  { ecab_c, ecab } = v[2] + ff42_d2 + emux_c;
	assign #T_ADD  { etam_c, etam } = v[3] + ff42_d3 + ecab_c;
	assign #T_ADD  { doto_c, doto } = v[4] + ff42_d4 + etam_c;
	assign #T_ADD  { daba_c, daba } = v[5] + ff42_d5 + doto_c;
	assign #T_ADD  { efyk_c, efyk } = v[6] + ff42_d6 + daba_c;
	assign #T_ADD  { ejok_c, ejok } = v[7] + ff42_d7 + efyk_c;
	assign #T_TRI  asum = !beje ? !xuha : 'z;
	assign #T_TRI  evad = !beje ? !fafo : 'z;
	assign #T_TRI  dahu = !beje ? !emux : 'z;
	assign #T_TRI  dode = !beje ? !ecab : 'z;
	assign #T_TRI  duho = !bafy ? !etam : 'z;
	assign #T_TRI  CASE = !bafy ? !doto : 'z;
	assign #T_TRI  cypo = !bafy ? !daba : 'z;
	assign #T_TRI  ceta = !bafy ? !efyk : 'z;
	assign #T_TRI  dafe = !bafy ? !ejok : 'z;
	assign #T_HADD { atad_c, atad } = h[0] + ff43_d0;
	assign #T_ADD  { behu_c, behu } = h[1] + ff43_d1 + atad_c;
	assign #T_ADD  { apyh_c, apyh } = h[2] + ff43_d2 + behu_c;
	assign #T_ADD  { babe_c, babe } = h[3] + ff43_d3 + apyh_c;
	assign #T_ADD  { abod_c, abod } = h[4] + ff43_d4 + babe_c;
	assign #T_ADD  { bewy_c, bewy } = h[5] + ff43_d5 + abod_c;
	assign #T_ADD  { byca_c, byca } = h[6] + ff43_d6 + bewy_c;
	assign #T_ADD  { acul_c, acul } = h[7] + ff43_d7 + byca_c;
	assign #T_TRI  amuv = !bafy ? !ff40_d3 : 'z;
	assign #T_TRI  coxo = !bafy ? !1 : 'z;
	assign #T_TRI  cove = !bafy ? !1 : 'z;
	assign #T_TRI  axep = !bafy ? !babe : 'z;
	assign #T_TRI  afeb = !bafy ? !abod : 'z;
	assign #T_TRI  alel = !bafy ? !bewy : 'z;
	assign #T_TRI  coly = !bafy ? !byca : 'z;
	assign #T_TRI  ajan = !bafy ? !acul : 'z;
	assign nma[0]  = asum;
	assign nma[1]  = evad;
	assign nma[2]  = dahu;
	assign nma[3]  = dode;
	assign nma[5]  = duho;
	assign nma[6]  = CASE;
	assign nma[7]  = cypo;
	assign nma[8]  = ceta;
	assign nma[9]  = dafe;
	assign nma[10] = amuv;
	assign nma[12] = coxo;
	assign nma[11] = cove;
	assign nma[0]  = axep;
	assign nma[1]  = afeb;
	assign nma[2]  = alel;
	assign nma[3]  = coly;
	assign nma[4]  = ajan;

	logic xoga, xura, tajo, xenu, xyke, xaba, tafu, xuho;
	logic tede, woka, xala, wede, tyra, tufo, xyru, wevo;
	logic xuku, wedy, xely, wuja, tyko, tena, tuwu, wubu;
	logic vezo, wuru, vosa, wyfu, xete, woda, vumo;
	dffsr dffsr_vezo(clkpipe, tede, woka, '1,   vezo);
	dffsr dffsr_wuru(clkpipe, xala, wede, vezo, wuru);
	dffsr dffsr_vosa(clkpipe, tyra, tufo, wuru, vosa);
	dffsr dffsr_wyfu(clkpipe, xyru, wevo, vosa, wyfu);
	dffsr dffsr_xete(clkpipe, xuku, wedy, wyfu, xete);
	dffsr dffsr_woda(clkpipe, xely, wuja, xete, woda);
	dffsr dffsr_vumo(clkpipe, tyko, tena, woda, vumo);
	dffsr dffsr_vava(clkpipe, tuwu, wubu, vumo, vava);
	assign #T_INV  xoga = !ndepo;
	assign #T_INV  xura = !ndepo;
	assign #T_INV  tajo = !ndepo;
	assign #T_INV  xenu = !ndepo;
	assign #T_INV  xyke = !ndepo;
	assign #T_INV  xaba = !ndepo;
	assign #T_INV  tafu = !ndepo;
	assign #T_INV  xuho = !ndepo;
	assign #T_NAND tede = !(ndepo && lesy);
	assign #T_NAND woka = !(xoga && lesy);
	assign #T_NAND xala = !(ndepo && lota);
	assign #T_NAND wede = !(xura && lota);
	assign #T_NAND tyra = !(ndepo && lyku);
	assign #T_NAND tufo = !(tajo && lyku);
	assign #T_NAND xyru = !(ndepo && roby);
	assign #T_NAND wevo = !(xenu && roby);
	assign #T_NAND xuku = !(ndepo && tyta);
	assign #T_NAND wedy = !(xyke && tyta);
	assign #T_NAND xely = !(ndepo && tyco);
	assign #T_NAND wuja = !(xaba && tyco);
	assign #T_NAND tyko = !(ndepo && soka);
	assign #T_NAND tena = !(tafu && soka);
	assign #T_NAND tuwu = !(ndepo && xovu);
	assign #T_NAND wubu = !(xuho && xovu);

endmodule
