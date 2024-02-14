`default_nettype none

module timer(
		input     logic [15:0] a,
		inout tri logic [7:0]  d,

		input logic nreset2, boga1mhz, tola_na1,
		input logic cpu_wr, cpu_rd, ff04_ff07, nff04_d1, from_cpu5,
		input logic _16384hz, _65536hz, _262144hz,

		output logic int_timer, tovy_na0
	);

	logic sara, sora, uvyr, ubot, sabo, samy, sopu, ukap, teko, supe, rote, ryla, tecy, sogu;
	dffr_bp dffr_sabo(sara, nreset2, d[2], sabo);
	dffr_bp dffr_samy(sara, nreset2, d[1], samy);
	dffr_bp dffr_sopu(sara, nreset2, d[0], sopu);
	assign sara = !(a[0] && a[1] && cpu_wr && ff04_ff07);
	assign  sora = ff04_ff07 && cpu_rd && a[1] && a[0];
	assign  uvyr = !_65536hz;
	assign  ubot = !_262144hz;
	assign  supe = sora ? !(!sabo) : 'z;
	assign  rote = sora ? !(!samy) : 'z;
	assign  ryla = sora ? !(!sopu) : 'z;
	assign ukap = !(sopu ? _16384hz : uvyr);
	assign teko = !(sopu ? ubot : nff04_d1);
	assign tecy = !(samy ? ukap : teko);
	assign  sogu = !(tecy || !sabo);
	assign d[2] = supe;
	assign d[1] = rote;
	assign d[0] = ryla;

	logic muzu, meke, mexu, teda, rega, povy, peru, rate, ruby, rage, peda, nuga, mugy;
	logic soku, racy, ravy, sosy, somu, suro, rowu, puso, nydu, mery, moba;
	tffd tffd_rega(sogu, mexu, puxy, rega);
	tffd tffd_povy(rega, mexu, nero, povy);
	tffd tffd_peru(povy, mexu, nada, peru);
	tffd tffd_rate(peru, mexu, repa, rate);
	tffd tffd_ruby(rate, mexu, rolu, ruby);
	tffd tffd_rage(ruby, mexu, rugy, rage);
	tffd tffd_peda(rage, mexu, pyma, peda);
	tffd tffd_nuga(peda, mexu, pagu, nuga);
	dffr_bp dffr_nydu(boga1mhz, mugy,    nuga, nydu);
	dffr_bp dffr_moba(boga1mhz, nreset2, mery, moba);
	assign   muzu = from_cpu5 || tope;
	assign  meke = !int_timer;
	assign mexu = !(muzu && nreset2 && meke);
	assign  teda = ff04_ff07 && cpu_rd && tola_na1 && a[0];
	assign  mugy = !mexu;
	assign  soku = teda ? !(!rega) : 'z;
	assign  racy = teda ? !(!povy) : 'z;
	assign  ravy = teda ? !(!peru) : 'z;
	assign  sosy = teda ? !(!rate) : 'z;
	assign  somu = teda ? !(!ruby) : 'z;
	assign  suro = teda ? !(!rage) : 'z;
	assign  rowu = teda ? !(!peda) : 'z;
	assign  puso = teda ? !(!nuga) : 'z;
	assign  mery = !(!nydu || nuga);
	assign d[0] = soku;
	assign d[1] = racy;
	assign d[2] = ravy;
	assign d[3] = sosy;
	assign d[4] = somu;
	assign d[5] = suro;
	assign d[6] = rowu;
	assign d[7] = puso;
	assign int_timer = moba;

	logic tovy, tuby, tyju, tope, mulo;
	logic peto, muru, nyke, seta, sabu, tyru, sufy, tyva, reva, nola, pyre, sapu, sete, supo, sotu, salu;
	logic refu, nyku, petu, rato, roke, sala, syru, soce, pyma, nada, nero, pagu, puxy, rolu, rugy, repa;
	dffr_bp dffr_peto(tyju, nreset2, d[6], peto);
	dffr_bp dffr_muru(tyju, nreset2, d[2], muru);
	dffr_bp dffr_nyke(tyju, nreset2, d[1], nyke);
	dffr_bp dffr_seta(tyju, nreset2, d[7], seta);
	dffr_bp dffr_sabu(tyju, nreset2, d[0], sabu);
	dffr_bp dffr_tyru(tyju, nreset2, d[4], tyru);
	dffr_bp dffr_sufy(tyju, nreset2, d[5], sufy);
	dffr_bp dffr_tyva(tyju, nreset2, d[3], tyva);
	assign  tovy = !a[0];
	assign  tuby = ff04_ff07 && cpu_rd && a[1] && tovy;
	assign tyju = !(tovy && a[1] && cpu_wr && ff04_ff07);
	assign tope = !(a[0] && tola_na1 && cpu_wr && ff04_ff07);
	assign  mulo = !nreset2;
	assign  reva = tuby ? !(!peto) : 'z;
	assign  nola = tuby ? !(!muru) : 'z;
	assign  pyre = tuby ? !(!nyke) : 'z;
	assign  sapu = tuby ? !(!seta) : 'z;
	assign  sete = tuby ? !(!sabu) : 'z;
	assign  supo = tuby ? !(!tyru) : 'z;
	assign  sotu = tuby ? !(!sufy) : 'z;
	assign  salu = tuby ? !(!tyva) : 'z;
	assign refu = !(tope ? peto : d[6]);
	assign nyku = !(tope ? muru : d[2]);
	assign petu = !(tope ? nyke : d[1]);
	assign rato = !(tope ? seta : d[7]);
	assign roke = !(tope ? sabu : d[0]);
	assign sala = !(tope ? tyru : d[4]);
	assign syru = !(tope ? sufy : d[5]);
	assign soce = !(tope ? tyva : d[3]);
	assign  pyma = !(mulo || refu);
	assign  nada = !(mulo || nyku);
	assign  nero = !(mulo || petu);
	assign  pagu = !(mulo || rato);
	assign  puxy = !(mulo || roke);
	assign  rolu = !(mulo || sala);
	assign  rugy = !(mulo || syru);
	assign  repa = !(mulo || soce);
	assign tovy_na0 = tovy;
	assign d[6] = reva;
	assign d[2] = nola;
	assign d[1] = pyre;
	assign d[7] = sapu;
	assign d[0] = sete;
	assign d[4] = supo;
	assign d[5] = sotu;
	assign d[3] = salu;

endmodule
