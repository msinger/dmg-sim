`default_nettype none

module video_control(
		inout tri logic [7:0] d,

		input logic cpu_rd2, cpu_wr2, clk2,

		output logic [7:0] v, h, nh,
		output logic l113, int_vbl, int_vbl_buf, int_stat,
		output logic talu, xyvo, nnype, wodu, napo, PURE, sela, nxymu,
		input  logic wuvu_nq, fepo, tofu, avap, pova, acyl, atej,
		input  logic nreset9, nreset_video, nreset_video2, reset_video3, clkpipe,
		input  logic ff45_d0, ff45_d1, ff45_d2, ff45_d3, ff45_d4, ff45_d5, ff45_d6, ff45_d7,
		input  logic ff41,

		output logic npin_cpg, ncp
	);

	logic syfu, tery, tucy, tyku, rasy, reda, tyde, ryme, sovu, subo, rape, paly;
	assign  syfu = v[7] != ff45_d7;
	assign  tery = v[6] != ff45_d6;
	assign  tucy = v[5] != ff45_d5;
	assign  tyku = v[4] != ff45_d4;
	assign  rasy = v[3] != ff45_d3;
	assign  reda = v[2] != ff45_d2;
	assign  tyde = v[1] != ff45_d1;
	assign  ryme = v[0] != ff45_d0;
	assign  sovu = !(syfu || tery || tucy || tyku);
	assign  subo = !(rasy || reda || tyde || ryme);
	assign rape = !(sovu && subo);
	assign  paly = !rape;

	logic vena, mude, saxo, typo, vyzo, telu, sude, taha, tyry;
	logic tocu, vepe, vuty, tuju, tafy, tuda, vate, voku, tozu, tece, tebo, tegy;
	logic sanu, sono, rutu, sygu, ryno, pogu;
	dffr_bp dffr_vena(wuvu_nq, nreset_video,  !vena, vena);
	dffr_bp dffr_saxo(talu,    mude,          !saxo, saxo);
	dffr_bp dffr_typo(!saxo,   mude,          !typo, typo);
	dffr_bp dffr_vyzo(!typo,   mude,          !vyzo, vyzo);
	dffr_bp dffr_telu(!vyzo,   mude,          !telu, telu);
	dffr_bp dffr_sude(!telu,   mude,          !sude, sude);
	dffr_bp dffr_taha(!sude,   mude,          !taha, taha);
	dffr_bp dffr_tyry(!taha,   mude,          !tyry, tyry);
	dffr_bp dffr_rutu(sono,    nreset_video2, sanu,  rutu);
	dffr_bp dffr_sygu(sono,    nreset_video2, tegy,  sygu);
	assign  mude = !(l113 || reset_video3);
	assign  talu = !(!vena);
	assign  tocu = !saxo;
	assign  vepe = !typo;
	assign  vuty = !vyzo;
	assign  tuju = !tyry;
	assign  tafy = !taha;
	assign  tuda = !sude;
	assign  vate = !telu;
	assign voku = !(tuju && tafy && tuda && vate && vuty && vepe && tocu);
	assign tozu = !(tuju && tafy && tuda && vate && vyzo && typo && saxo);
	assign tece = !(tuju && taha && tuda && telu && vyzo && vepe && saxo);
	assign tebo = !(tyry && tafy && sude && vate && vuty && typo && saxo);
	assign tegy = !(voku && tozu && tece && tebo);
	assign  sanu = tyry && taha && sude && saxo;
	assign  sono = !talu;
	assign   ryno = rutu || sygu;
	assign  pogu = !ryno;
	assign l113    = rutu;
	assign npin_cpg = pogu;

	logic nype, popu, xugu, xena, xano, paru, tolu, tapa, taru, vypu;
	logic sepa, ryve, rugu, refe, ropo, rufo, roxe, suko, tuva, voty;
	logic voga, wego, xajo, xymu, wusa, toba, tobe, semu, vave, sadu, xaty, rypo, ryju;
	logic puzo, sasy, pofo, pote, teby, wuga, pago, sego, rupo, nrupo;
	logic int_oam, int_hbl;
	dffr_bp dffr_nype(talu, nreset_video2, l113,  nype);
	dffr_bp dffr_popu(nype, nreset_video2, xyvo,  popu);
	dffr_bp dffr_napo(popu, nreset_video2, !napo, napo);
	dffr_bp dffr_ropo(talu, nreset9,       paly,  ropo);
	dffr_bp dffr_voga(clk2, tady,          wodu,  voga);
	drlatch latch_rugu(!ryve, nreset9, d[6], rugu);
	drlatch latch_refe(!ryve, nreset9, d[5], refe);
	drlatch latch_rufo(!ryve, nreset9, d[4], rufo);
	drlatch latch_roxe(!ryve, nreset9, d[3], roxe);
	nor_srlatch latch_xymu(wego, avap, xymu, nxymu);
	nor_srlatch latch_wusa(xajo, wego, wusa,);
	nor_srlatch latch_rupo(ropo, pago, rupo, nrupo);
	assign  xyvo = v[4] && v[7];
	assign xugu = !(h[0] && h[1] && h[2] && h[5] && h[7]);
	assign  xena = !fepo;
	assign  xano = !xugu;
	assign  paru = !(!popu);
	assign  wodu = xena && xano;
	assign  PURE = !l113;
	assign  sela = !PURE;
	assign  tolu = !paru;
	assign  tapa = sela && tolu;
	assign  taru = wodu && tolu;
	assign  vypu = !tolu;
	assign  sepa = cpu_wr2 && ff41;
	assign  ryve = !sepa;
	assign   suko = (rugu && ropo) || (refe && int_oam) || (rufo && int_vbl) || (roxe && int_hbl);
	assign  tuva = !suko;
	assign  voty = !tuva;
	assign   wego = tofu || voga;
	assign  xajo = h[0] && h[3];
	assign  toba = wusa && clkpipe;
	assign  tobe = cpu_rd2 && ff41;
	assign   semu = toba || pova;
	assign  vave = !tobe;
	assign  sadu = !(nxymu || paru);
	assign  xaty = !(acyl || nxymu);
	assign  rypo = !semu;
	assign  ryju = !sepa;
	assign  puzo = !vave ? !(!roxe) : 'z;
	assign  sasy = !vave ? !(!refe) : 'z;
	assign  pofo = !vave ? !(!rufo) : 'z;
	assign  pote = !vave ? !(!rugu) : 'z;
	assign  teby = tobe ? !sadu : 'z;
	assign  wuga = tobe ? !xaty : 'z;
	assign   pago = nreset9 || ryju;
	assign  sego = tobe ? !nrupo : 'z;
	assign nnype = !nype;
	assign int_vbl     = paru;
	assign int_oam     = tapa;
	assign int_hbl     = taru;
	assign int_vbl_buf = vypu;
	assign int_stat    = voty;
	assign ncp = rypo;
	assign d[3] = puzo;
	assign d[5] = sasy;
	assign d[4] = pofo;
	assign d[6] = pote;
	assign d[0] = teby;
	assign d[1] = wuga;
	assign d[2] = sego;

	logic tady, xuke, xyle, rybo, xegy, xora, xeho, savy, xodu, xydo, acam, azub, amel, ahal;
	logic toca, tyba, sury, sake, tyge, roku, tuhu, tuky, tako, sybe, apux, abef, adaz, asah;
	dffr_bp dffr_xeho(clkpipe, tady, !xeho, xeho);
	dffr_bp dffr_savy(clkpipe, tady, rybo,  savy);
	dffr_bp dffr_xodu(clkpipe, tady, xegy,  xodu);
	dffr_bp dffr_xydo(clkpipe, tady, xora,  xydo);
	dffr_bp dffr_tuhu(toca,    tady, !tuhu, tuhu);
	dffr_bp dffr_tuky(toca,    tady, sake,  tuky);
	dffr_bp dffr_tako(toca,    tady, tyge,  tako);
	dffr_bp dffr_sybe(toca,    tady, roku,  sybe);
	assign  tady = !(atej || tofu);
	assign  xuke = xeho && savy;
	assign  xyle = xuke && xodu;
	assign  rybo = savy != xeho;
	assign  xegy = xodu != xuke;
	assign  xora = xydo != xyle;
	assign  acam = !xeho;
	assign  azub = !savy;
	assign  amel = !xodu;
	assign  ahal = !xydo;
	assign  toca = !h[3];
	assign  tyba = tuhu && tuky;
	assign  sury = tyba && tako;
	assign  sake = tuky != tuhu;
	assign  tyge = tako != tyba;
	assign  roku = sybe != sury;
	assign  apux = !tuhu;
	assign  abef = !tuky;
	assign  adaz = !tako;
	assign  asah = !sybe;
	assign h[0]  = xeho;
	assign h[1]  = savy;
	assign h[2]  = xodu;
	assign h[3]  = xydo;
	assign h[4]  = tuhu;
	assign h[5]  = tuky;
	assign h[6]  = tako;
	assign h[7]  = sybe;
	assign nh[0] = acam;
	assign nh[1] = azub;
	assign nh[2] = amel;
	assign nh[3] = ahal;
	assign nh[4] = apux;
	assign nh[5] = abef;
	assign nh[6] = adaz;
	assign nh[7] = asah;

	logic noko, myta, lama, muwy, myro, lexa, lydo, lovu, lema, mato, lafo;
	dffr_bp dffr_myta(nnype, nreset_video2, noko,  myta);
	dffr_bp dffr_muwy(l113,  lama,          !muwy, muwy);
	dffr_bp dffr_myro(!muwy, lama,          !myro, myro);
	dffr_bp dffr_lexa(!myro, lama,          !lexa, lexa);
	dffr_bp dffr_lydo(!lexa, lama,          !lydo, lydo);
	dffr_bp dffr_lovu(!lydo, lama,          !lovu, lovu);
	dffr_bp dffr_lema(!lovu, lama,          !lema, lema);
	dffr_bp dffr_mato(!lema, lama,          !mato, mato);
	dffr_bp dffr_lafo(!mato, lama,          !lafo, lafo);
	assign  noko = v[7] && v[4] && v[3] && v[0];
	assign  lama = !(myta || reset_video3);
	assign v[0] = muwy;
	assign v[1] = myro;
	assign v[2] = lexa;
	assign v[3] = lydo;
	assign v[4] = lovu;
	assign v[5] = lema;
	assign v[6] = mato;
	assign v[7] = lafo;

endmodule
