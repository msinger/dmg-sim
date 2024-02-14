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
	dffr_bp dffr_coty(_16384hz, uwam,    !coty, coty);
	dffr_bp dffr_etaf(uwam,     caby,    d[7],  etaf);
	dffr_bp dffr_culy(uwam,     nreset2, d[0],  culy);
	dffr_bp dffr_cafa(dawa,     caro,    !cafa, cafa);
	dffr_bp dffr_cylo(!cafa,    caro,    !cylo, cylo);
	dffr_bp dffr_cyde(!cylo,    caro,    !cyde, cyde);
	dffr_bp dffr_caly(!cyde,    caro,    !caly, caly);
	assign uwam = !(tovy_na0 && a[1] && cpu_wr && sano);
	assign  ucom = sano && cpu_rd && a[1] && tovy_na0;
	assign cave = !(culy ? coty : sck_in);
	assign   dawa = cave || !etaf;
	assign  eluv = ucom ? !(!etaf) : 'z;
	assign  core = ucom ? !(!culy) : 'z;
	assign  caro = uwam && nreset2;
	assign kexu = !(dawa && sck_dir);
	assign  jago = !sck_dir;
	assign  edyl = !dawa;
	assign  kujo = !(jago || dawa);
	assign  coba = !caly;
	assign  caby = coba && nreset2;
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
	dffsr dffsr_cuba(dawe, cufu, cohy, cage, cuba);
	dffsr dffsr_degu(dawe, docu, dumo, cuba, degu);
	dffsr dffsr_dyra(dawe, dela, dybo, degu, dyra);
	dffsr dffsr_dojo(dawe, dyge, daju, dyra, dojo);
	dffsr dffsr_dovu(epyt, dola, dyly, dojo, dovu);
	dffsr dffsr_ejab(epyt, elok, ehuj, dovu, ejab);
	dffsr dffsr_erod(epyt, edel, efak, ejab, erod);
	dffsr dffsr_eder(epyt, efef, eguv, erod, eder);
	dffr_bp dffr_elys(nser_tick, nreset2, eder, elys);
	assign  sare = !(a[7] || a[6] || a[5] || a[4] || a[3]);
	assign  sefy = !a[2];
	assign  sano = sefy && sare && ffxx;
	assign urys = !(sano && cpu_wr && tola_na1 && a[0]);
	assign  daku = !urys;
	assign  epyt = !nser_tick;
	assign  deho = !epyt;
	assign  dawe = !deho;
	assign  cage = !sin_in;
	assign  ufeg = sano && cpu_rd && tola_na1 && a[0];
	assign   cohy = (urys || d[0]) && nreset2;
	assign   dumo = (urys || d[1]) && nreset2;
	assign   dybo = (urys || d[2]) && nreset2;
	assign   daju = (urys || d[3]) && nreset2;
	assign   dyly = (urys || d[4]) && nreset2;
	assign   ehuj = (urys || d[5]) && nreset2;
	assign   efak = (urys || d[6]) && nreset2;
	assign   eguv = (urys || d[7]) && nreset2;
	assign cufu = !(d[0] && daku);
	assign docu = !(d[1] && daku);
	assign dela = !(d[2] && daku);
	assign dyge = !(d[3] && daku);
	assign dola = !(d[4] && daku);
	assign elok = !(d[5] && daku);
	assign edel = !(d[6] && daku);
	assign efef = !(d[7] && daku);
	assign  cugy = ufeg ? !(!cuba) : 'z;
	assign  dude = ufeg ? !(!degu) : 'z;
	assign  detu = ufeg ? !(!dyra) : 'z;
	assign  daso = ufeg ? !(!dojo) : 'z;
	assign  dame = ufeg ? !(!dovu) : 'z;
	assign  evok = ufeg ? !(!ejab) : 'z;
	assign  efab = ufeg ? !(!erod) : 'z;
	assign  etak = ufeg ? !(!eder) : 'z;
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
