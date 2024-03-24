`timescale 1ns/1ns
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
	assign #T_XOR  syfu = v[7] != ff45_d7;
	assign #T_XOR  tery = v[6] != ff45_d6;
	assign #T_XOR  tucy = v[5] != ff45_d5;
	assign #T_XOR  tyku = v[4] != ff45_d4;
	assign #T_XOR  rasy = v[3] != ff45_d3;
	assign #T_XOR  reda = v[2] != ff45_d2;
	assign #T_XOR  tyde = v[1] != ff45_d1;
	assign #T_XOR  ryme = v[0] != ff45_d0;
	assign #T_NOR  sovu = !(syfu || tery || tucy || tyku);
	assign #T_NOR  subo = !(rasy || reda || tyde || ryme);
	assign #T_NAND rape = !(sovu && subo);
	assign #T_INV  paly = !rape;

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
	assign #T_NOR  mude = !(l113 || reset_video3);
	assign #T_INV  talu = !(!vena);
	assign #T_INV  tocu = !saxo;
	assign #T_INV  vepe = !typo;
	assign #T_INV  vuty = !vyzo;
	assign #T_INV  tuju = !tyry;
	assign #T_INV  tafy = !taha;
	assign #T_INV  tuda = !sude;
	assign #T_INV  vate = !telu;
	assign #T_NAND voku = !(tuju && tafy && tuda && vate && vuty && vepe && tocu);
	assign #T_NAND tozu = !(tuju && tafy && tuda && vate && vyzo && typo && saxo);
	assign #T_NAND tece = !(tuju && taha && tuda && telu && vyzo && vepe && saxo);
	assign #T_NAND tebo = !(tyry && tafy && sude && vate && vuty && typo && saxo);
	assign #T_NAND tegy = !(voku && tozu && tece && tebo);
	assign #T_AND  sanu = tyry && taha && sude && saxo;
	assign #T_INV  sono = !talu;
	assign #T_OR   ryno = rutu || sygu;
	assign #T_INV  pogu = !ryno;
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
	assign #T_AND  xyvo = v[4] && v[7];
	assign #T_NAND xugu = !(h[0] && h[1] && h[2] && h[5] && h[7]);
	assign #T_INV  xena = !fepo;
	assign #T_INV  xano = !xugu;
	assign #T_INV  paru = !(!popu);
	assign #T_AND  wodu = xena && xano;
	assign #T_INV  PURE = !l113;
	assign #T_INV  sela = !PURE;
	assign #T_INV  tolu = !paru;
	assign #T_AND  tapa = sela && tolu;
	assign #T_AND  taru = wodu && tolu;
	assign #T_INV  vypu = !tolu;
	assign #T_AND  sepa = cpu_wr2 && ff41;
	assign #T_INV  ryve = !sepa;
	assign #T_AO   suko = (rugu && ropo) || (refe && int_oam) || (rufo && int_vbl) || (roxe && int_hbl);
	assign #T_INV  tuva = !suko;
	assign #T_INV  voty = !tuva;
	assign #T_OR   wego = tofu || voga;
	assign #T_AND  xajo = h[0] && h[3];
	assign #T_AND  toba = wusa && clkpipe;
	assign #T_AND  tobe = cpu_rd2 && ff41;
	assign #T_OR   semu = toba || pova;
	assign #T_INV  vave = !tobe;
	assign #T_NOR  sadu = !(nxymu || paru);
	assign #T_NOR  xaty = !(acyl || nxymu);
	assign #T_INV  rypo = !semu;
	assign #T_INV  ryju = !sepa;
	assign #T_TRI  puzo = !vave ? !(!roxe) : 'z;
	assign #T_TRI  sasy = !vave ? !(!refe) : 'z;
	assign #T_TRI  pofo = !vave ? !(!rufo) : 'z;
	assign #T_TRI  pote = !vave ? !(!rugu) : 'z;
	assign #T_TRI  teby = tobe ? !sadu : 'z;
	assign #T_TRI  wuga = tobe ? !xaty : 'z;
	assign #T_OR   pago = nreset9 || ryju;
	assign #T_TRI  sego = tobe ? !nrupo : 'z;
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
	assign #T_NOR  tady = !(atej || tofu);
	assign #T_AND  xuke = xeho && savy;
	assign #T_AND  xyle = xuke && xodu;
	assign #T_XOR  rybo = savy != xeho;
	assign #T_XOR  xegy = xodu != xuke;
	assign #T_XOR  xora = xydo != xyle;
	assign #T_INV  acam = !xeho;
	assign #T_INV  azub = !savy;
	assign #T_INV  amel = !xodu;
	assign #T_INV  ahal = !xydo;
	assign #T_INV  toca = !h[3];
	assign #T_AND  tyba = tuhu && tuky;
	assign #T_AND  sury = tyba && tako;
	assign #T_XOR  sake = tuky != tuhu;
	assign #T_XOR  tyge = tako != tyba;
	assign #T_XOR  roku = sybe != sury;
	assign #T_INV  apux = !tuhu;
	assign #T_INV  abef = !tuky;
	assign #T_INV  adaz = !tako;
	assign #T_INV  asah = !sybe;
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
	assign #T_AND  noko = v[7] && v[4] && v[3] && v[0];
	assign #T_NOR  lama = !(myta || reset_video3);
	assign v[0] = muwy;
	assign v[1] = myro;
	assign v[2] = lexa;
	assign v[3] = lydo;
	assign v[4] = lovu;
	assign v[5] = lema;
	assign v[6] = mato;
	assign v[7] = lafo;

endmodule
