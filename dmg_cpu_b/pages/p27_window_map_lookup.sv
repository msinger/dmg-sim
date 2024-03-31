`timescale 1ns/1ns
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
	assign #T_NOR  veku = !(wuty || tave);
	assign #T_INV  tuku = !tomu;
	assign #T_INV  sowo = !taka;
	assign #T_AND  teky = fepo && tuku && lyry && sowo;
	assign #T_INV  rosy = !nreset_video;
	assign #T_AND  ryce = !suda && sobu;
	assign #T_NOR  seca = !(ryce || rosy || atej);

	logic nojo, paga, pezo, nupa, naze, pebo, pomo, nevu;
	logic palo, nele, pafu, roge, sary;
	dffr_bp dffr_sary(talu, nreset_video, roge, sary);
	assign #T_XNOR nojo = ff4a_d4 == v[4];
	assign #T_XNOR paga = ff4a_d5 == v[5];
	assign #T_XNOR pezo = ff4a_d6 == v[6];
	assign #T_XNOR nupa = ff4a_d7 == v[7];
	assign #T_XNOR naze = ff4a_d0 == v[0];
	assign #T_XNOR pebo = ff4a_d1 == v[1];
	assign #T_XNOR pomo = ff4a_d2 == v[2];
	assign #T_XNOR nevu = ff4a_d3 == v[3];
	assign #T_NAND palo = !(ff40_d5 && nojo && paga && pezo && nupa);
	assign #T_INV  nele = !palo;
	assign #T_NAND pafu = !(nele && naze && pebo && pomo && nevu);
	assign #T_INV  roge = !pafu;

	logic lebo, laxe, lyzu, laxu, mesu, nyva, lovy, myso;
	logic nako, nofu, moce, lury, nogu, lony, neny, lusu;
	dffr_bp dffr_lyzu(clk2,  nxymu, laxu,  lyzu);
	dffr_bp dffr_laxu(lebo,  nyxu,  !laxu, laxu);
	dffr_bp dffr_mesu(!laxu, nyxu,  !mesu, mesu);
	dffr_bp dffr_nyva(!mesu, nyxu,  !nyva, nyva);
	dffr_bp dffr_lovy(myvo,  nyxu,  lyry,  lovy);
	nand_srlatch latch_lony(nyxu, lury, lony,);
	assign #T_NAND lebo = !(clk2 && moce);
	assign #T_INV  myvo = !clk2;
	assign #T_INV  lyry = !moce;
	assign #T_INV  laxe = !laxu;
	assign #T_NOR  myso = !(loby || laxe || lyzu);
	assign #T_INV  nako = !mesu;
	assign #T_INV  nofu = !nyva;
	assign #T_NAND moce = !(nyva && nyxu && laxu);
	assign #T_AND  lury = !lovy && nxymu;
	assign #T_AND  mofu = nako && myso;
	assign #T_NAND nogu = !(nako && nofu);
	assign #T_NAND nydy = !(myso && mesu && nofu);
	assign #T_INV  xuha = !nofu;
	assign #T_INV  neny = !nogu;
	assign #T_INV  myma = !lony;
	assign #T_INV  lusu = !lony;
	assign #T_AND  potu = neny && lena;
	assign #T_AND  neta = nogu && lena;
	assign #T_INV  lena = !lusu;

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
	assign #T_OR   repu = int_vbl || reset_video2;
	assign #T_XNOR nezo = ff4b_d4 == h[4];
	assign #T_XNOR nory = ff4b_d5 == h[5];
	assign #T_XNOR nono = ff4b_d6 == h[6];
	assign #T_XNOR pase = ff4b_d7 == h[7];
	assign #T_XNOR mylo = ff4b_d0 == h[0];
	assign #T_XNOR puwu = ff4b_d1 == h[1];
	assign #T_XNOR puho = ff4b_d2 == h[2];
	assign #T_XNOR nytu = ff4b_d3 == h[3];
	assign #T_NAND puky = !(rejo && nezo && nory && nono && pase);
	assign #T_INV  nufa = !puky;
	assign #T_NAND nogy = !(nufa && mylo && puwu && puho && nytu);
	assign #T_INV  nuko = !nogy;
	assign #T_AND  nuny = pynu && !nopa;
	assign #T_INV  nyfo = !nuny;
	assign #T_INV  mosu = !nyfo;
	assign #T_NOR  nyxu = !(avap || mosu || tevo);
	assign #T_INV  roco = !segu;
	assign #T_INV  mehe = !clk2;
	assign #T_INV  nocu = !pynu;
	assign #T_INV  pore = !nocu;
	assign #T_INV  wazy = !pore;
	assign #T_INV  syny = !repu;
	assign #T_INV  paha = !nxymu;
	assign #T_NOR  paso = !(paha || tevo);
	assign #T_NAND pecu = !(roxo && roze);
	assign #T_NAND roze = !(rubu && roga && ryku);
	assign #T_XNOR suha = ff43_d0 == ryku;
	assign #T_XNOR syby = ff43_d1 == roga;
	assign #T_XNOR sozu = ff43_d2 == rubu;
	assign #T_NAND rone = !(roxy && suha && syby && sozu);
	assign #T_INV  pohu = !rone;
	assign #T_INV  moxe = !clk2;
	assign #T_AND  pova = !nyze && puxa;
	assign #T_NOR  puku = !(nuny || rydy);
	assign #T_NOR  rydy = !(puku || pory || reset_video2);
	assign #T_NOR  pany = !(roze || nuko);
	assign #T_NOR  seko = !(!ryfa || rene);
	assign #T_OR   tevo = seko || suzu || tave;
	assign #T_AND  vetu = tevo && pore;
	assign #T_INV  sylo = !rydy;
	assign #T_NAND tuxy = !(sovy && sylo);
	assign #T_INV  suzu = !tuxy;
	assign #T_INV  romo = !poky;
	assign #T_NAND suvu = !(nxymu && romo && nyka && pory);
	assign #T_INV  tave = !suvu;
	assign #T_INV  xahy = !atej;
	assign #T_NAND xofo = !(ff40_d5 && xahy && nreset_video);
	assign #T_INV  xaco = !xofo;
	assign #T_TRI  vevy = !wuko ? !ff40_d6 : 'z;
	assign #T_TRI  vogu = !wuko ? !1 : 'z;
	assign #T_TRI  veza = !wuko ? !1 : 'z;
	assign #T_TRI  vyto = !wuko ? !tufu : 'z;
	assign #T_TRI  veha = !wuko ? !taxa : 'z;
	assign #T_TRI  vace = !wuko ? !tozo : 'z;
	assign #T_TRI  vovo = !wuko ? !tate : 'z;
	assign #T_TRI  vulo = !wuko ? !teke : 'z;
	assign #T_TRI  xeja = !wuko ? !wyka : 'z;
	assign #T_TRI  xamo = !wuko ? !wody : 'z;
	assign #T_TRI  xahe = !wuko ? !wobo : 'z;
	assign #T_TRI  xulo = !wuko ? !wyko : 'z;
	assign #T_TRI  wuju = !wuko ? !xolo : 'z;
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
