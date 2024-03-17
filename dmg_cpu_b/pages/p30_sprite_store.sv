`default_nettype none

module sprite_store(
		input logic [7:0] oam_a,

		input logic xupy, buza, fepo, dege, daby, dabu, gysa,
		input logic deny, akol, xyme, wuse, gowo, wylu, gugy, fefo, dydo, byvy,
		input logic gygy, dymo, gyma, feka, fame, buzy, fado, wufa, furo, geny,
		input logic bymy, zuru, ewot, wabe, ahof, bucy, xyha, fuke, faka, enob,

		output logic weza, wuco, wyda, zysu, wyse, wuzy,
		output logic wenu, cucu, cuca, cega
	);

	logic cyke, wuda, xecu, yduf, xobe, zuze, xedy, xadu;
	logic weza_o, wuco_o, wyda_o, zysu_o, wyse_o, wuzy_o;
	logic wenu_o, cucu_o, cuca_o, cega_o;
	logic adyb, apob, apyv, afen, akyh, apoc, bujy, boso, ahac, bazu;
	logic axuv, bada, apev, bado, bexy, byhe, afym, azap, afut, afyx;
	logic wocy, elyc, wabo, ezoc, wywy, wato, zudo, ybuk, zyto, ykoz;
	logic gecu, foxy, gohu, fogo, gacy, gabo, zube, zumy, zexo, zafu;
	logic waja, woxy, xyre, weru, wepy, wuxu, bydo, buce, bove, bevy;
	logic xynu, xege, xabo, wanu, xefe, xave, cumu, capo, cono, caju;
	logic evyt, waba, etad, elep, wygo, wako, wana, waxe, wabu, ypoz;
	logic fuzo, gesy, fysu, fefa, gyno, gule, xygo, xyna, xaku, ygum;
	logic bemo, cyby, bety, cegy, celu, cubo, befe, byro, baco, ahum;
	logic cajy, cuza, coma, cufa, cebo, cadu, abug, ames, abop, arof;
	logic dalo, daly, duza, waga, dyny, dobo, awat, bace, bodu, buja;
	logic ekap, etav, ebex, goru, etym, ekop, aned, acep, abux, abeg;
	logic dezu, efud, dony, dowa, dygo, enap, zypo, zexe, yjem, ywav;
	logic dafu, deba, duha, duny, dese, devy, zury, zuro, zene, zylu;
	logic axec, cyro, cuvu, apon, afoz, cube, zaby, zuke, wuxe, were;
	logic boxa, buna, bulu, beca, byhu, buhe, ykuk, ylov, xazy, xosy;
	logic yhal, yrad, xyra, ynev, zojy, zaro, cawo, byme, coho, gate;
	logic xufo, xute, xotu, xyfe, yzor, yber, dewu, cana, dysy, fofo;
	logic zetu, zece, zave, woko, zumu, zedy, gofo, wehe, ajal, buky;
	logic ygus, ysok, yzep, wyte, zony, ywak, fyhy, gyho, bozu, cufo;
	dffr_b dffr_xecu(!cyke, '1, oam_a[7], xecu);
	dffr_b dffr_yduf(!cyke, '1, oam_a[6], yduf);
	dffr_b dffr_xobe(!cyke, '1, oam_a[5], xobe);
	dffr_b dffr_zuze(!cyke, '1, oam_a[4], zuze);
	dffr_b dffr_xedy(!cyke, '1, oam_a[3], xedy);
	dffr_b dffr_xadu(!cyke, '1, oam_a[2], xadu);
	dlatch_a latch_axuv(!akol, weza, axuv);
	dlatch_a latch_bada(!akol, wuco, bada);
	dlatch_a latch_apev(!akol, wyda, apev);
	dlatch_a latch_bado(!akol, zysu, bado);
	dlatch_a latch_bexy(!akol, wyse, bexy);
	dlatch_a latch_byhe(!akol, wuzy, byhe);
	dlatch_a latch_afym(!bymy, wenu, afym);
	dlatch_a latch_azap(!bymy, cucu, azap);
	dlatch_a latch_afut(!bymy, cega, afut);
	dlatch_a latch_afyx(!bymy, cuca, afyx);
	dlatch_a latch_gecu(!wuse, weza, gecu);
	dlatch_a latch_foxy(!wuse, wuco, foxy);
	dlatch_a latch_gohu(!wuse, wyda, gohu);
	dlatch_a latch_fogo(!wuse, zysu, fogo);
	dlatch_a latch_gacy(!wuse, wyse, gacy);
	dlatch_a latch_gabo(!wuse, wuzy, gabo);
	dlatch_a latch_zube(!zuru, wenu, zube);
	dlatch_a latch_zumy(!zuru, cucu, zumy);
	dlatch_a latch_zexo(!zuru, cega, zexo);
	dlatch_a latch_zafu(!zuru, cuca, zafu);
	dlatch_a latch_xynu(!wylu, weza, xynu);
	dlatch_a latch_xege(!wylu, wuco, xege);
	dlatch_a latch_xabo(!wylu, wyda, xabo);
	dlatch_a latch_wanu(!wylu, zysu, wanu);
	dlatch_a latch_xefe(!wylu, wyse, xefe);
	dlatch_a latch_xave(!wylu, wuzy, xave);
	dlatch_a latch_cumu(!ewot, wenu, cumu);
	dlatch_a latch_capo(!ewot, cucu, capo);
	dlatch_a latch_cono(!ewot, cega, cono);
	dlatch_a latch_caju(!ewot, cuca, caju);
	dlatch_a latch_fuzo(!fefo, weza, fuzo);
	dlatch_a latch_gesy(!fefo, wuco, gesy);
	dlatch_a latch_fysu(!fefo, wyda, fysu);
	dlatch_a latch_fefa(!fefo, zysu, fefa);
	dlatch_a latch_gyno(!fefo, wyse, gyno);
	dlatch_a latch_gule(!fefo, wuzy, gule);
	dlatch_a latch_xygo(!wabe, wenu, xygo);
	dlatch_a latch_xyna(!wabe, cucu, xyna);
	dlatch_a latch_xaku(!wabe, cega, xaku);
	dlatch_a latch_ygum(!wabe, cuca, ygum);
	dlatch_a latch_cajy(!byvy, weza, cajy);
	dlatch_a latch_cuza(!byvy, wuco, cuza);
	dlatch_a latch_coma(!byvy, wyda, coma);
	dlatch_a latch_cufa(!byvy, zysu, cufa);
	dlatch_a latch_cebo(!byvy, wyse, cebo);
	dlatch_a latch_cadu(!byvy, wuzy, cadu);
	dlatch_a latch_abug(!ahof, wenu, abug);
	dlatch_a latch_ames(!ahof, cucu, ames);
	dlatch_a latch_abop(!ahof, cega, abop);
	dlatch_a latch_arof(!ahof, cuca, arof);
	dlatch_a latch_ekap(!dymo, weza, ekap);
	dlatch_a latch_etav(!dymo, wuco, etav);
	dlatch_a latch_ebex(!dymo, wyda, ebex);
	dlatch_a latch_goru(!dymo, zysu, goru);
	dlatch_a latch_etym(!dymo, wyse, etym);
	dlatch_a latch_ekop(!dymo, wuzy, ekop);
	dlatch_a latch_aned(!bucy, wenu, aned);
	dlatch_a latch_acep(!bucy, cucu, acep);
	dlatch_a latch_abux(!bucy, cega, abux);
	dlatch_a latch_abeg(!bucy, cuca, abeg);
	dlatch_a latch_dafu(!feka, weza, dafu);
	dlatch_a latch_deba(!feka, wuco, deba);
	dlatch_a latch_duha(!feka, wyda, duha);
	dlatch_a latch_duny(!feka, zysu, duny);
	dlatch_a latch_dese(!feka, wyse, dese);
	dlatch_a latch_devy(!feka, wuzy, devy);
	dlatch_a latch_zury(!xyha, wenu, zury);
	dlatch_a latch_zuro(!xyha, cucu, zuro);
	dlatch_a latch_zene(!xyha, cega, zene);
	dlatch_a latch_zylu(!xyha, cuca, zylu);
	dlatch_a latch_boxa(!buzy, weza, boxa);
	dlatch_a latch_buna(!buzy, wuco, buna);
	dlatch_a latch_bulu(!buzy, wyda, bulu);
	dlatch_a latch_beca(!buzy, zysu, beca);
	dlatch_a latch_byhu(!buzy, wyse, byhu);
	dlatch_a latch_buhe(!buzy, wuzy, buhe);
	dlatch_a latch_ykuk(!fuke, wenu, ykuk);
	dlatch_a latch_ylov(!fuke, cucu, ylov);
	dlatch_a latch_xazy(!fuke, cega, xazy);
	dlatch_a latch_xosy(!fuke, cuca, xosy);
	dlatch_a latch_xufo(!wufa, weza, xufo);
	dlatch_a latch_xute(!wufa, wuco, xute);
	dlatch_a latch_xotu(!wufa, wyda, xotu);
	dlatch_a latch_xyfe(!wufa, zysu, xyfe);
	dlatch_a latch_yzor(!wufa, wyse, yzor);
	dlatch_a latch_yber(!wufa, wuzy, yber);
	dlatch_a latch_dewu(!faka, wenu, dewu);
	dlatch_a latch_cana(!faka, cucu, cana);
	dlatch_a latch_dysy(!faka, cega, dysy);
	dlatch_a latch_fofo(!faka, cuca, fofo);
	dlatch_a latch_ygus(!geny, weza, ygus);
	dlatch_a latch_ysok(!geny, wuco, ysok);
	dlatch_a latch_yzep(!geny, wyda, yzep);
	dlatch_a latch_wyte(!geny, zysu, wyte);
	dlatch_a latch_zony(!geny, wyse, zony);
	dlatch_a latch_ywak(!geny, wuzy, ywak);
	dlatch_a latch_fyhy(!enob, wenu, fyhy);
	dlatch_a latch_gyho(!enob, cucu, gyho);
	dlatch_a latch_bozu(!enob, cega, bozu);
	dlatch_a latch_cufo(!enob, cuca, cufo);
	assign  cyke = !xupy;
	assign  wuda = !cyke;
	assign  weza_o = !buza ? !(!xecu) : 'z;
	assign  wuco_o = !buza ? !(!yduf) : 'z;
	assign  wyda_o = !buza ? !(!xobe) : 'z;
	assign  zysu_o = !buza ? !(!zuze) : 'z;
	assign  wyse_o = !buza ? !(!xedy) : 'z;
	assign  wuzy_o = !buza ? !(!xadu) : 'z;
	assign  wenu_o = !fepo ? !gysa : 'z;
	assign  cucu_o = !fepo ? !dege : 'z;
	assign  cega_o = !fepo ? !dabu : 'z;
	assign  cuca_o = !fepo ? !daby : 'z;
	assign  adyb = !deny ? !(!axuv) : 'z;
	assign  apob = !deny ? !(!bada) : 'z;
	assign  apyv = !deny ? !(!apev) : 'z;
	assign  afen = !deny ? !(!bado) : 'z;
	assign  akyh = !deny ? !(!bexy) : 'z;
	assign  apoc = !deny ? !(!byhe) : 'z;
	assign  bujy = !deny ? !(!afym) : 'z;
	assign  boso = !deny ? !(!azap) : 'z;
	assign  ahac = !deny ? !(!afut) : 'z;
	assign  bazu = !deny ? !(!afyx) : 'z;
	assign  wocy = !xyme ? !(!gecu) : 'z;
	assign  elyc = !xyme ? !(!foxy) : 'z;
	assign  wabo = !xyme ? !(!gohu) : 'z;
	assign  ezoc = !xyme ? !(!fogo) : 'z;
	assign  wywy = !xyme ? !(!gacy) : 'z;
	assign  wato = !xyme ? !(!gabo) : 'z;
	assign  zudo = !xyme ? !(!zube) : 'z;
	assign  ybuk = !xyme ? !(!zumy) : 'z;
	assign  zyto = !xyme ? !(!zexo) : 'z;
	assign  ykoz = !xyme ? !(!zafu) : 'z;
	assign  waja = !gowo ? !(!xynu) : 'z;
	assign  woxy = !gowo ? !(!xege) : 'z;
	assign  xyre = !gowo ? !(!xabo) : 'z;
	assign  weru = !gowo ? !(!wanu) : 'z;
	assign  wepy = !gowo ? !(!xefe) : 'z;
	assign  wuxu = !gowo ? !(!xave) : 'z;
	assign  bydo = !gowo ? !(!cumu) : 'z;
	assign  buce = !gowo ? !(!capo) : 'z;
	assign  bove = !gowo ? !(!cono) : 'z;
	assign  bevy = !gowo ? !(!caju) : 'z;
	assign  evyt = !gugy ? !(!fuzo) : 'z;
	assign  waba = !gugy ? !(!gesy) : 'z;
	assign  etad = !gugy ? !(!fysu) : 'z;
	assign  elep = !gugy ? !(!fefa) : 'z;
	assign  wygo = !gugy ? !(!gyno) : 'z;
	assign  wako = !gugy ? !(!gule) : 'z;
	assign  wana = !gugy ? !(!xygo) : 'z;
	assign  waxe = !gugy ? !(!xyna) : 'z;
	assign  wabu = !gugy ? !(!xaku) : 'z;
	assign  ypoz = !gugy ? !(!ygum) : 'z;
	assign  bemo = !dydo ? !(!cajy) : 'z;
	assign  cyby = !dydo ? !(!cuza) : 'z;
	assign  bety = !dydo ? !(!coma) : 'z;
	assign  cegy = !dydo ? !(!cufa) : 'z;
	assign  celu = !dydo ? !(!cebo) : 'z;
	assign  cubo = !dydo ? !(!cadu) : 'z;
	assign  befe = !dydo ? !(!abug) : 'z;
	assign  byro = !dydo ? !(!ames) : 'z;
	assign  baco = !dydo ? !(!abop) : 'z;
	assign  ahum = !dydo ? !(!arof) : 'z;
	assign  dalo = !gygy ? !(!ekap) : 'z;
	assign  daly = !gygy ? !(!etav) : 'z;
	assign  duza = !gygy ? !(!ebex) : 'z;
	assign  waga = !gygy ? !(!goru) : 'z;
	assign  dyny = !gygy ? !(!etym) : 'z;
	assign  dobo = !gygy ? !(!ekop) : 'z;
	assign  awat = !gygy ? !(!aned) : 'z;
	assign  bace = !gygy ? !(!acep) : 'z;
	assign  bodu = !gygy ? !(!abux) : 'z;
	assign  buja = !gygy ? !(!abeg) : 'z;
	assign  dezu = !gyma ? !(!dafu) : 'z;
	assign  efud = !gyma ? !(!deba) : 'z;
	assign  dony = !gyma ? !(!duha) : 'z;
	assign  dowa = !gyma ? !(!duny) : 'z;
	assign  dygo = !gyma ? !(!dese) : 'z;
	assign  enap = !gyma ? !(!devy) : 'z;
	assign  zypo = !gyma ? !(!zury) : 'z;
	assign  zexe = !gyma ? !(!zuro) : 'z;
	assign  yjem = !gyma ? !(!zene) : 'z;
	assign  ywav = !gyma ? !(!zylu) : 'z;
	assign  axec = !fame ? !(!boxa) : 'z;
	assign  cyro = !fame ? !(!buna) : 'z;
	assign  cuvu = !fame ? !(!bulu) : 'z;
	assign  apon = !fame ? !(!beca) : 'z;
	assign  afoz = !fame ? !(!byhu) : 'z;
	assign  cube = !fame ? !(!buhe) : 'z;
	assign  zaby = !fame ? !(!ykuk) : 'z;
	assign  zuke = !fame ? !(!ylov) : 'z;
	assign  wuxe = !fame ? !(!xazy) : 'z;
	assign  were = !fame ? !(!xosy) : 'z;
	assign  yhal = !fado ? !(!xufo) : 'z;
	assign  yrad = !fado ? !(!xute) : 'z;
	assign  xyra = !fado ? !(!xotu) : 'z;
	assign  ynev = !fado ? !(!xyfe) : 'z;
	assign  zojy = !fado ? !(!yzor) : 'z;
	assign  zaro = !fado ? !(!yber) : 'z;
	assign  cawo = !fado ? !(!dewu) : 'z;
	assign  byme = !fado ? !(!cana) : 'z;
	assign  coho = !fado ? !(!dysy) : 'z;
	assign  gate = !fado ? !(!fofo) : 'z;
	assign  zetu = !furo ? !(!ygus) : 'z;
	assign  zece = !furo ? !(!ysok) : 'z;
	assign  zave = !furo ? !(!yzep) : 'z;
	assign  woko = !furo ? !(!wyte) : 'z;
	assign  zumu = !furo ? !(!zony) : 'z;
	assign  zedy = !furo ? !(!ywak) : 'z;
	assign  gofo = !furo ? !(!fyhy) : 'z;
	assign  wehe = !furo ? !(!gyho) : 'z;
	assign  ajal = !furo ? !(!bozu) : 'z;
	assign  buky = !furo ? !(!cufo) : 'z;
	assign weza_tri = weza_o;
	assign wuco_tri = wuco_o;
	assign wyda_tri = wyda_o;
	assign zysu_tri = zysu_o;
	assign wyse_tri = wyse_o;
	assign wuzy_tri = wuzy_o;
	assign wenu_tri = wenu_o;
	assign cucu_tri = cucu_o;
	assign cega_tri = cega_o;
	assign cuca_tri = cuca_o;
	assign weza_tri = adyb;
	assign wuco_tri = apob;
	assign wyda_tri = apyv;
	assign zysu_tri = afen;
	assign wyse_tri = akyh;
	assign wuzy_tri = apoc;
	assign wenu_tri = bujy;
	assign cucu_tri = boso;
	assign cega_tri = ahac;
	assign cuca_tri = bazu;
	assign weza_tri = wocy;
	assign wuco_tri = elyc;
	assign wyda_tri = wabo;
	assign zysu_tri = ezoc;
	assign wyse_tri = wywy;
	assign wuzy_tri = wato;
	assign wenu_tri = zudo;
	assign cucu_tri = ybuk;
	assign cega_tri = zyto;
	assign cuca_tri = ykoz;
	assign weza_tri = waja;
	assign wuco_tri = woxy;
	assign wyda_tri = xyre;
	assign zysu_tri = weru;
	assign wyse_tri = wepy;
	assign wuzy_tri = wuxu;
	assign wenu_tri = bydo;
	assign cucu_tri = buce;
	assign cega_tri = bove;
	assign cuca_tri = bevy;
	assign weza_tri = evyt;
	assign wuco_tri = waba;
	assign wyda_tri = etad;
	assign zysu_tri = elep;
	assign wyse_tri = wygo;
	assign wuzy_tri = wako;
	assign wenu_tri = wana;
	assign cucu_tri = waxe;
	assign cega_tri = wabu;
	assign cuca_tri = ypoz;
	assign weza_tri = bemo;
	assign wuco_tri = cyby;
	assign wyda_tri = bety;
	assign zysu_tri = cegy;
	assign wyse_tri = celu;
	assign wuzy_tri = cubo;
	assign wenu_tri = befe;
	assign cucu_tri = byro;
	assign cega_tri = baco;
	assign cuca_tri = ahum;
	assign weza_tri = dalo;
	assign wuco_tri = daly;
	assign wyda_tri = duza;
	assign zysu_tri = waga;
	assign wyse_tri = dyny;
	assign wuzy_tri = dobo;
	assign wenu_tri = awat;
	assign cucu_tri = bace;
	assign cega_tri = bodu;
	assign cuca_tri = buja;
	assign weza_tri = dezu;
	assign wuco_tri = efud;
	assign wyda_tri = dony;
	assign zysu_tri = dowa;
	assign wyse_tri = dygo;
	assign wuzy_tri = enap;
	assign wenu_tri = zypo;
	assign cucu_tri = zexe;
	assign cega_tri = yjem;
	assign cuca_tri = ywav;
	assign weza_tri = axec;
	assign wuco_tri = cyro;
	assign wyda_tri = cuvu;
	assign zysu_tri = apon;
	assign wyse_tri = afoz;
	assign wuzy_tri = cube;
	assign wenu_tri = zaby;
	assign cucu_tri = zuke;
	assign cega_tri = wuxe;
	assign cuca_tri = were;
	assign weza_tri = yhal;
	assign wuco_tri = yrad;
	assign wyda_tri = xyra;
	assign zysu_tri = ynev;
	assign wyse_tri = zojy;
	assign wuzy_tri = zaro;
	assign wenu_tri = cawo;
	assign cucu_tri = byme;
	assign cega_tri = coho;
	assign cuca_tri = gate;
	assign weza_tri = zetu;
	assign wuco_tri = zece;
	assign wyda_tri = zave;
	assign zysu_tri = woko;
	assign wyse_tri = zumu;
	assign wuzy_tri = zedy;
	assign wenu_tri = gofo;
	assign cucu_tri = wehe;
	assign cega_tri = ajal;
	assign cuca_tri = buky;
	assign weza = weza_tri;
	assign wuco = wuco_tri;
	assign wyda = wyda_tri;
	assign zysu = zysu_tri;
	assign wyse = wyse_tri;
	assign wuzy = wuzy_tri;
	assign wenu = wenu_tri;
	assign cucu = cucu_tri;
	assign cega = cega_tri;
	assign cuca = cuca_tri;

	/* Icarus doesn't support trireg, so we do it like this: */
	tri logic weza_tri, wuco_tri, wyda_tri, zysu_tri, wyse_tri, wuzy_tri;
	tri logic wenu_tri, cucu_tri, cuca_tri, cega_tri;
	logic     weza_cap = $random, wuco_cap = $random, wyda_cap = $random, zysu_cap = $random;
	logic     wyse_cap = $random, wuzy_cap = $random;
	logic     wenu_cap = $random, cucu_cap = $random, cuca_cap = $random, cega_cap = $random;
	always @(weza_tri) weza_cap = weza_tri;
	always @(wuco_tri) wuco_cap = wuco_tri;
	always @(wyda_tri) wyda_cap = wyda_tri;
	always @(zysu_tri) zysu_cap = zysu_tri;
	always @(wyse_tri) wyse_cap = wyse_tri;
	always @(wuzy_tri) wuzy_cap = wuzy_tri;
	always @(wenu_tri) wenu_cap = wenu_tri;
	always @(cucu_tri) cucu_cap = cucu_tri;
	always @(cuca_tri) cuca_cap = cuca_tri;
	always @(cega_tri) cega_cap = cega_tri;
	assign (weak1, weak0) weza_tri = weza_cap;
	assign (weak1, weak0) wuco_tri = wuco_cap;
	assign (weak1, weak0) wyda_tri = wyda_cap;
	assign (weak1, weak0) zysu_tri = zysu_cap;
	assign (weak1, weak0) wyse_tri = wyse_cap;
	assign (weak1, weak0) wuzy_tri = wuzy_cap;
	assign (weak1, weak0) wenu_tri = wenu_cap;
	assign (weak1, weak0) cucu_tri = cucu_cap;
	assign (weak1, weak0) cuca_tri = cuca_cap;
	assign (weak1, weak0) cega_tri = cega_cap;

endmodule
