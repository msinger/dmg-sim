`default_nettype none

module serial_link(
		input     logic [15:0] a,
		inout tri logic [7:0]  d,

		input logic  nreset2, cpu_wr, cpu_rd, ffxx,
		output logic a00_07, int_serial,

		output logic sck_a, sck_dir, sck_d, ser_out,
		input  logic sck_in, sin_in,

		input logic _16384hz, tovy_na0, tola_na1
	);

	logic uwam, ucom, coty, cave, dawa, etaf, culy, caro, eluv, core, _8192hz;
	logic kexu, jago, kujo, edyl, cafa, cylo, cyde, caly, coba, caby, nser_tick;
	dffr dffr_coty(_16384hz, uwam,    !coty, coty); // check clk edge
	dffr dffr_etaf(uwam,     caby,    d[7],  etaf); // check clk edge
	dffr dffr_culy(uwam,     nreset2, d[0],  culy); // check clk edge
	dffr dffr_cafa(dawa,     caro,    !cafa, cafa); // check clk edge
	dffr dffr_cylo(!cafa,    caro,    !cylo, cylo); // check clk edge
	dffr dffr_cyde(!cylo,    caro,    !cyde, cyde); // check clk edge
	dffr dffr_caly(!cyde,    caro,    !caly, caly); // check clk edge
	assign #T_NAND uwam = !(tovy_na0 && a[1] && cpu_wr && sano);
	assign #T_AND  ucom = sano && cpu_rd && a[1] && tovy_na0;
	assign #T_MUXI cave = !(culy ? coty : sck_in);
	assign #T_OR   dawa = cave || !etaf; /* takes !q output of dff */
	assign #T_TRI  eluv = ucom ? etaf : 'z; /* takes !q output of dff */
	assign #T_TRI  core = ucom ? culy : 'z; /* takes !q output of dff */
	assign #T_AND  caro = uwam && nreset2;
	assign #T_NAND kexu = !(dawa && sck_dir);
	assign #T_INV  jago = !sck_dir;
	assign #T_INV  edyl = !dawa;
	assign #T_NOR  kujo = !(jago || dawa);
	assign #T_INV  coba = !caly;
	assign #T_AND  caby = coba && nreset2;
	assign _8192hz    = coty;
	assign sck_dir    = culy;
	assign d[7]       = eluv;
	assign d[0]       = core;
	assign sck_a      = kexu;
	assign sck_d      = kujo;
	assign nser_tick  = edyl;
	assign int_serial = caly;

	logic sare, sefy, sano, urys, daku, epyt, deho, dawe, cage, ufeg;
	logic cohy, dumo, dybo, daju, dyly, ehuj, efak, eguv, cufu, docu, dela, dyge, dola, elok, edel, efef;
	logic cuba, degu, dyra, dojo, dovu, ejab, erod, eder, cugy, dude, detu, daso, dame, evok, efab, etak, elys;
	dffsr dffsr_cuba(dawe, cufu, cohy, cage, cuba); // check clk edge
	dffsr dffsr_degu(dawe, docu, dumo, cuba, degu); // check clk edge
	dffsr dffsr_dyra(dawe, dela, dybo, degu, dyra); // check clk edge
	dffsr dffsr_dojo(dawe, dyge, daju, dyra, dojo); // check clk edge
	dffsr dffsr_dovu(epyt, dola, dyly, dojo, dovu); // check clk edge
	dffsr dffsr_ejab(epyt, elok, ehuj, dovu, ejab); // check clk edge
	dffsr dffsr_erod(epyt, edel, efak, ejab, erod); // check clk edge
	dffsr dffsr_eder(epyt, efef, eguv, erod, eder); // check clk edge
	dffr dffr_elys(nser_tick, nreset2, eder, elys); // check clk edge
	assign #T_NOR  sare = !(a[7] || a[6] || a[5] || a[4] || a[3]);
	assign #T_INV  sefy = !a[2];
	assign #T_AND  sano = sefy && sare && ffxx;
	assign #T_NAND urys = !(sano && cpu_wr && tola_na1 && a[0]);
	assign #T_INV  daku = !urys;
	assign #T_INV  epyt = !nser_tick;
	assign #T_INV  deho = !epyt;
	assign #T_INV  dawe = !deho;
	assign #T_INV  cage = !sin_in;
	assign #T_AND  ufeg = sano && cpu_rd && tola_na1 && a[0];
	assign #T_OA   cohy = (urys || d[0]) && nreset2;
	assign #T_OA   dumo = (urys || d[1]) && nreset2;
	assign #T_OA   dybo = (urys || d[2]) && nreset2;
	assign #T_OA   daju = (urys || d[3]) && nreset2;
	assign #T_OA   dyly = (urys || d[4]) && nreset2;
	assign #T_OA   ehuj = (urys || d[5]) && nreset2;
	assign #T_OA   efak = (urys || d[6]) && nreset2;
	assign #T_OA   eguv = (urys || d[7]) && nreset2;
	assign #T_NAND cufu = !(d[0] && daku);
	assign #T_NAND docu = !(d[1] && daku);
	assign #T_NAND dela = !(d[2] && daku);
	assign #T_NAND dyge = !(d[3] && daku);
	assign #T_NAND dola = !(d[4] && daku);
	assign #T_NAND elok = !(d[5] && daku);
	assign #T_NAND edel = !(d[6] && daku);
	assign #T_NAND efef = !(d[7] && daku);
	assign #T_TRI  cugy = ufeg ? cuba : 'z; /* takes !q output of dff */
	assign #T_TRI  dude = ufeg ? degu : 'z; /* takes !q output of dff */
	assign #T_TRI  detu = ufeg ? dyra : 'z; /* takes !q output of dff */
	assign #T_TRI  daso = ufeg ? dojo : 'z; /* takes !q output of dff */
	assign #T_TRI  dame = ufeg ? dovu : 'z; /* takes !q output of dff */
	assign #T_TRI  evok = ufeg ? ejab : 'z; /* takes !q output of dff */
	assign #T_TRI  efab = ufeg ? erod : 'z; /* takes !q output of dff */
	assign #T_TRI  etak = ufeg ? eder : 'z; /* takes !q output of dff */
	assign a00_07  = sare;
	assign d[0]    = cugy;
	assign d[1]    = dude;
	assign d[2]    = detu;
	assign d[3]    = daso;
	assign d[4]    = dame;
	assign d[5]    = evok;
	assign d[6]    = efab;
	assign d[7]    = etak;
	assign ser_out = elys;

endmodule
