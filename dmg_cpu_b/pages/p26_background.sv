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
	assign  axad = !pore;
	assign  acen = potu && axad;
	assign  asul = axad && neta;
	assign  bafy = !acen;
	assign  beje = !asul;
	assign { fafo_c, fafo } = v[0] + ff42_d0;
	assign  { emux_c, emux } = v[1] + ff42_d1 + fafo_c;
	assign  { ecab_c, ecab } = v[2] + ff42_d2 + emux_c;
	assign  { etam_c, etam } = v[3] + ff42_d3 + ecab_c;
	assign  { doto_c, doto } = v[4] + ff42_d4 + etam_c;
	assign  { daba_c, daba } = v[5] + ff42_d5 + doto_c;
	assign  { efyk_c, efyk } = v[6] + ff42_d6 + daba_c;
	assign  { ejok_c, ejok } = v[7] + ff42_d7 + efyk_c;
	assign  asum = !beje ? !xuha : 'z;
	assign  evad = !beje ? !fafo : 'z;
	assign  dahu = !beje ? !emux : 'z;
	assign  dode = !beje ? !ecab : 'z;
	assign  duho = !bafy ? !etam : 'z;
	assign  CASE = !bafy ? !doto : 'z;
	assign  cypo = !bafy ? !daba : 'z;
	assign  ceta = !bafy ? !efyk : 'z;
	assign  dafe = !bafy ? !ejok : 'z;
	assign { atad_c, atad } = h[0] + ff43_d0;
	assign  { behu_c, behu } = h[1] + ff43_d1 + atad_c;
	assign  { apyh_c, apyh } = h[2] + ff43_d2 + behu_c;
	assign  { babe_c, babe } = h[3] + ff43_d3 + apyh_c;
	assign  { abod_c, abod } = h[4] + ff43_d4 + babe_c;
	assign  { bewy_c, bewy } = h[5] + ff43_d5 + abod_c;
	assign  { byca_c, byca } = h[6] + ff43_d6 + bewy_c;
	assign  { acul_c, acul } = h[7] + ff43_d7 + byca_c;
	assign  amuv = !bafy ? !ff40_d3 : 'z;
	assign  coxo = !bafy ? !1 : 'z;
	assign  cove = !bafy ? !1 : 'z;
	assign  axep = !bafy ? !babe : 'z;
	assign  afeb = !bafy ? !abod : 'z;
	assign  alel = !bafy ? !bewy : 'z;
	assign  coly = !bafy ? !byca : 'z;
	assign  ajan = !bafy ? !acul : 'z;
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
	assign  xoga = !ndepo;
	assign  xura = !ndepo;
	assign  tajo = !ndepo;
	assign  xenu = !ndepo;
	assign  xyke = !ndepo;
	assign  xaba = !ndepo;
	assign  tafu = !ndepo;
	assign  xuho = !ndepo;
	assign tede = !(ndepo && lesy);
	assign woka = !(xoga && lesy);
	assign xala = !(ndepo && lota);
	assign wede = !(xura && lota);
	assign tyra = !(ndepo && lyku);
	assign tufo = !(tajo && lyku);
	assign xyru = !(ndepo && roby);
	assign wevo = !(xenu && roby);
	assign xuku = !(ndepo && tyta);
	assign wedy = !(xyke && tyta);
	assign xely = !(ndepo && tyco);
	assign wuja = !(xaba && tyco);
	assign tyko = !(ndepo && soka);
	assign tena = !(tafu && soka);
	assign tuwu = !(ndepo && xovu);
	assign wubu = !(xuho && xovu);

endmodule
