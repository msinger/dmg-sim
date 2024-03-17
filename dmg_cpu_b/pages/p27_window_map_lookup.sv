`default_nettype none

module window_map_lookup(
		inout tri logic [12:0] nma,

		input logic clk2, clk4, clk5, nreset_video, reset_video2,
		input logic int_vbl,

		input logic [7:0] v, h,

		input  logic ff40_d5, ff40_d6,
		input  logic ff43_d0, ff43_d1, ff43_d2,
		input  logic ff4a_d0, ff4a_d1, ff4a_d2, ff4a_d3, ff4a_d4, ff4a_d5, ff4a_d6, ff4a_d7,
		input  logic ff4b_d0, ff4b_d1, ff4b_d2, ff4b_d3, ff4b_d4, ff4b_d5, ff4b_d6, ff4b_d7,
		input  logic wuty, tomu, fepo, atej, talu, avap, segu, wuko, pory, nxymu, poky,
		input  logic nyka, roxo, loby,
		output logic lyry, seca, mosu, nyxu, pore, vyno, vujo, vymu, pova, roxy, mofu,
		output logic myvo, lena, potu, neta, nydy, xuha, myma, sylo
	);

	logic veku, taka, tuku, sowo, teky, sobu, suda, rosy, ryce;
	dffr_bp dffr_sobu(clk5, '1, teky, sobu);
	dffr_bp dffr_suda(clk4, '1, sobu, suda);
	nand_srlatch latch_taka(seca, veku, taka,);
	assign  veku = !(wuty || tave);
	assign  tuku = !tomu;
	assign  sowo = !taka;
	assign  teky = fepo && tuku && lyry && sowo;
	assign  rosy = !nreset_video;
	assign  ryce = !suda && sobu;
	assign  seca = !(ryce || rosy || atej);

	logic nojo, paga, pezo, nupa, naze, pebo, pomo, nevu;
	logic palo, nele, pafu, roge, sary;
	dffr_bp dffr_sary(talu, nreset_video, roge, sary);
	assign nojo = ff4a_d4 == v[4];
	assign paga = ff4a_d5 == v[5];
	assign pezo = ff4a_d6 == v[6];
	assign nupa = ff4a_d7 == v[7];
	assign naze = ff4a_d0 == v[0];
	assign pebo = ff4a_d1 == v[1];
	assign pomo = ff4a_d2 == v[2];
	assign nevu = ff4a_d3 == v[3];
	assign palo = !(ff40_d5 && nojo && paga && pezo && nupa);
	assign  nele = !palo;
	assign pafu = !(nele && naze && pebo && pomo && nevu);
	assign  roge = !pafu;

	logic lebo, laxe, lyzu, laxu, mesu, nyva, lovy, myso;
	logic nako, nofu, moce, lury, nogu, lony, neny, lusu;
	dffr_bp dffr_lyzu(clk2,  nxymu, laxu,  lyzu);
	dffr_bp dffr_laxu(lebo,  nyxu,  !laxu, laxu);
	dffr_bp dffr_mesu(!laxu, nyxu,  !mesu, mesu);
	dffr_bp dffr_nyva(!mesu, nyxu,  !nyva, nyva);
	dffr_bp dffr_lovy(myvo,  nyxu,  lyry,  lovy);
	nand_srlatch latch_lony(nyxu, lury, lony,);
	assign lebo = !(clk2 && moce);
	assign  myvo = !clk2;
	assign  lyry = !moce;
	assign  laxe = !laxu;
	assign  myso = !(loby || laxe || lyzu);
	assign  nako = !mesu;
	assign  nofu = !nyva;
	assign moce = !(nyva && nyxu && laxu);
	assign  lury = !lovy && nxymu;
	assign  mofu = nako && myso;
	assign nogu = !(nako && nofu);
	assign nydy = !(myso && mesu && nofu);
	assign  xuha = !nofu;
	assign  neny = !nogu;
	assign  myma = !lony;
	assign  lusu = !lony;
	assign  potu = neny && lena;
	assign  neta = nogu && lena;
	assign  lena = !lusu;

	logic repu, rejo, nezo, nory, nono, pase, mylo, puwu, puho, nytu;
	logic puky, nufa, nogy, nuko, nopa, nuny, nyfo;
	logic roco, pyco, mehe, nunu, pynu, nocu, wazy, syny;
	logic paha, paso, pecu, ryku, roga, rubu, roze, suha, syby, sozu, rone;
	logic moxe, pohu, nyze, puxa, puku, rydy, pany, ryfa, sovy, romo;
	logic rene, tuxy, suvu, seko, suzu, tave, tevo, vetu, xahy, xofo, xaco;
	logic tufu, taxa, tozo, tate, teke;
	logic wyka, wody, wobo, wyko, xolo;
	logic vevy, vogu, veza, vyto, veha, vace, vovo, vulo;
	logic xeja, xamo, xahe, xulo, wuju;
	dffr_bp dffr_nopa(clk2,  nreset_video, pynu,  nopa);
	dffr_bp dffr_pyco(roco,  nreset_video, nuko,  pyco);
	dffr_bp dffr_nunu(mehe,  nreset_video, pyco,  nunu);
	dffr_bp dffr_ryku(pecu,  paso,         !ryku, ryku);
	dffr_bp dffr_roga(!ryku, paso,         !roga, roga);
	dffr_bp dffr_rubu(!roga, paso,         !rubu, rubu);
	dffr_bp dffr_nyze(moxe,  nxymu,        puxa,  nyze);
	dffr_bp dffr_puxa(roxo,  nxymu,        pohu,  puxa);
	dffr_bp dffr_ryfa(segu,  nxymu,        pany,  ryfa);
	dffr_bp dffr_sovy(clk2,  nreset_video, rydy,  sovy);
	dffr_bp dffr_rene(clk2,  nxymu,        ryfa,  rene);
	dffr_bp dffr_vyno(wazy,  syny,         !vyno, vyno);
	dffr_bp dffr_vujo(!vyno, syny,         !vujo, vujo);
	dffr_bp dffr_vymu(!vujo, syny,         !vymu, vymu);
	dffr_bp dffr_tufu(!vymu, syny,         !tufu, tufu);
	dffr_bp dffr_taxa(!tufu, syny,         !taxa, taxa);
	dffr_bp dffr_tozo(!taxa, syny,         !tozo, tozo);
	dffr_bp dffr_tate(!tozo, syny,         !tate, tate);
	dffr_bp dffr_teke(!tate, syny,         !teke, teke);
	dffr_bp dffr_wyka(vetu,  xaco,         !wyka, wyka);
	dffr_bp dffr_wody(!wyka, xaco,         !wody, wody);
	dffr_bp dffr_wobo(!wody, xaco,         !wobo, wobo);
	dffr_bp dffr_wyko(!wobo, xaco,         !wyko, wyko);
	dffr_bp dffr_xolo(!wyko, xaco,         !xolo, xolo);
	nor_srlatch latch_rejo(sary, repu, rejo,);
	nor_srlatch latch_pynu(nunu, xofo, pynu,);
	nor_srlatch latch_roxy(paha, pova, roxy,);
	assign   repu = int_vbl || reset_video2;
	assign nezo = ff4b_d4 == h[4];
	assign nory = ff4b_d5 == h[5];
	assign nono = ff4b_d6 == h[6];
	assign pase = ff4b_d7 == h[7];
	assign mylo = ff4b_d0 == h[0];
	assign puwu = ff4b_d1 == h[1];
	assign puho = ff4b_d2 == h[2];
	assign nytu = ff4b_d3 == h[3];
	assign puky = !(rejo && nezo && nory && nono && pase);
	assign  nufa = !puky;
	assign nogy = !(nufa && mylo && puwu && puho && nytu);
	assign  nuko = !nogy;
	assign  nuny = pynu && !nopa;
	assign  nyfo = !nuny;
	assign  mosu = !nyfo;
	assign  nyxu = !(avap || mosu || tevo);
	assign  roco = !segu;
	assign  mehe = !clk2;
	assign  nocu = !pynu;
	assign  pore = !nocu;
	assign  wazy = !pore;
	assign  syny = !repu;
	assign  paha = !nxymu;
	assign  paso = !(paha || tevo);
	assign pecu = !(roxo && roze);
	assign roze = !(rubu && roga && ryku);
	assign suha = ff43_d0 == ryku;
	assign syby = ff43_d1 == roga;
	assign sozu = ff43_d2 == rubu;
	assign rone = !(roxy && suha && syby && sozu);
	assign  pohu = !rone;
	assign  moxe = !clk2;
	assign  pova = !nyze && puxa;
	assign  puku = !(nuny || rydy);
	assign  rydy = !(puku || pory || reset_video2);
	assign  pany = !(roze || nuko);
	assign  seko = !(!ryfa || rene);
	assign   tevo = seko || suzu || tave;
	assign  vetu = tevo && pore;
	assign  sylo = !rydy;
	assign tuxy = !(sovy && sylo);
	assign  suzu = !tuxy;
	assign  romo = !poky;
	assign suvu = !(nxymu && romo && nyka && pory);
	assign  tave = !suvu;
	assign  xahy = !atej;
	assign xofo = !(ff40_d5 && xahy && nreset_video);
	assign  xaco = !xofo;
	assign  vevy = !wuko ? !ff40_d6 : 'z;
	assign  vogu = !wuko ? !1 : 'z;
	assign  veza = !wuko ? !1 : 'z;
	assign  vyto = !wuko ? !tufu : 'z;
	assign  veha = !wuko ? !taxa : 'z;
	assign  vace = !wuko ? !tozo : 'z;
	assign  vovo = !wuko ? !tate : 'z;
	assign  vulo = !wuko ? !teke : 'z;
	assign  xeja = !wuko ? !wyka : 'z;
	assign  xamo = !wuko ? !wody : 'z;
	assign  xahe = !wuko ? !wobo : 'z;
	assign  xulo = !wuko ? !wyko : 'z;
	assign  wuju = !wuko ? !xolo : 'z;
	assign nma[10] = vevy;
	assign nma[12] = vogu;
	assign nma[11] = veza;
	assign nma[5]  = vyto;
	assign nma[6]  = veha;
	assign nma[7]  = vace;
	assign nma[8]  = vovo;
	assign nma[9]  = vulo;
	assign nma[0]  = xeja;
	assign nma[1]  = xamo;
	assign nma[2]  = xahe;
	assign nma[3]  = xulo;
	assign nma[4]  = wuju;

endmodule
