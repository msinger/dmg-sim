`timescale 1ns/1ns
`default_nettype none

module video_regs(
		inout tri logic [7:0] d,

		input logic cpu_rd2, cpu_wr2,
		input  logic nreset6, reset7, nreset8, nreset9,

		input logic [7:0] v,

		output logic ff40_d0, ff40_d1, ff40_d2, ff40_d3, ff40_d4, ff40_d5, ff40_d6, ff40_d7,
		output logic ff42_d0, ff42_d1, ff42_d2, ff42_d3, ff42_d4, ff42_d5, ff42_d6, ff42_d7,
		output logic ff43_d0, ff43_d1, ff43_d2, ff43_d3, ff43_d4, ff43_d5, ff43_d6, ff43_d7,
		output logic ff45_d0, ff45_d1, ff45_d2, ff45_d3, ff45_d4, ff45_d5, ff45_d6, ff45_d7,
		output logic ff4a_d0, ff4a_d1, ff4a_d2, ff4a_d3, ff4a_d4, ff4a_d5, ff4a_d6, ff4a_d7,
		output logic ff4b_d0, ff4b_d1, ff4b_d2, ff4b_d3, ff4b_d4, ff4b_d5, ff4b_d6, ff4b_d7,
		input  logic ff40, ff42, ff43, ff44, ff45, ff4a, ff4b,
		output logic waru, xare
	);

	logic wyze, wuza, vycu, voxu, myce, mypa, nofe, nuku, mypu, muvo, meby, noke;
	logic mufe, lova, muka, mara, mele, muly, lole, moko;
	drlatch latch_myce(!voxu, nreset8, d[5], myce);
	drlatch latch_mypa(!voxu, nreset8, d[0], mypa);
	drlatch latch_nofe(!voxu, nreset8, d[1], nofe);
	drlatch latch_nuku(!voxu, nreset8, d[7], nuku);
	drlatch latch_mypu(!voxu, nreset8, d[4], mypu);
	drlatch latch_muvo(!voxu, nreset8, d[6], muvo);
	drlatch latch_meby(!voxu, nreset8, d[3], meby);
	drlatch latch_noke(!voxu, nreset8, d[2], noke);
	assign #T_AND  wyze = cpu_rd2 && ff4b;
	assign #T_AND  wuza = cpu_wr2 && ff4b;
	assign #T_INV  vycu = !wyze;
	assign #T_INV  voxu = !wuza;
	assign #T_TRI  mufe = !vycu ? !(!myce) : 'z;
	assign #T_TRI  lova = !vycu ? !(!mypa) : 'z;
	assign #T_TRI  muka = !vycu ? !(!nofe) : 'z;
	assign #T_TRI  mara = !vycu ? !(!nuku) : 'z;
	assign #T_TRI  mele = !vycu ? !(!mypu) : 'z;
	assign #T_TRI  muly = !vycu ? !(!muvo) : 'z;
	assign #T_TRI  lole = !vycu ? !(!meby) : 'z;
	assign #T_TRI  moko = !vycu ? !(!noke) : 'z;
	assign ff4b_d5 = myce;
	assign ff4b_d0 = mypa;
	assign ff4b_d1 = nofe;
	assign ff4b_d7 = nuku;
	assign ff4b_d4 = mypu;
	assign ff4b_d6 = muvo;
	assign ff4b_d3 = meby;
	assign ff4b_d2 = noke;
	assign d[5] = mufe;
	assign d[0] = lova;
	assign d[1] = muka;
	assign d[7] = mara;
	assign d[4] = mele;
	assign d[6] = muly;
	assign d[3] = lole;
	assign d[2] = moko;

	logic waxu, weko, vomy, vefu, nafu, mela, nyro, naga, nulo, nuka, nene, neso;
	logic mera, loka, poda, pygu, mega, polo, pela, punu;
	drlatch latch_nafu(!vefu, nreset8, d[7], nafu);
	drlatch latch_mela(!vefu, nreset8, d[3], mela);
	drlatch latch_nyro(!vefu, nreset8, d[1], nyro);
	drlatch latch_naga(!vefu, nreset8, d[2], naga);
	drlatch latch_nulo(!vefu, nreset8, d[4], nulo);
	drlatch latch_nuka(!vefu, nreset8, d[6], nuka);
	drlatch latch_nene(!vefu, nreset8, d[5], nene);
	drlatch latch_neso(!vefu, nreset8, d[0], neso);
	assign #T_AND  waxu = cpu_rd2 && ff4a;
	assign #T_AND  weko = cpu_wr2 && ff4a;
	assign #T_INV  vomy = !waxu;
	assign #T_INV  vefu = !weko;
	assign #T_TRI  mera = !vomy ? !(!nafu) : 'z;
	assign #T_TRI  loka = !vomy ? !(!mela) : 'z;
	assign #T_TRI  poda = !vomy ? !(!nyro) : 'z;
	assign #T_TRI  pygu = !vomy ? !(!naga) : 'z;
	assign #T_TRI  mega = !vomy ? !(!nulo) : 'z;
	assign #T_TRI  polo = !vomy ? !(!nuka) : 'z;
	assign #T_TRI  pela = !vomy ? !(!nene) : 'z;
	assign #T_TRI  punu = !vomy ? !(!neso) : 'z;
	assign ff4a_d7 = nafu;
	assign ff4a_d3 = mela;
	assign ff4a_d1 = nyro;
	assign ff4a_d2 = naga;
	assign ff4a_d4 = nulo;
	assign ff4a_d6 = nuka;
	assign ff4a_d5 = nene;
	assign ff4a_d0 = neso;
	assign d[7] = mera;
	assign d[3] = loka;
	assign d[1] = poda;
	assign d[2] = pygu;
	assign d[4] = mega;
	assign d[6] = polo;
	assign d[5] = pela;
	assign d[0] = punu;

	logic avog, arur, beba, amun, cyxu, bake, bemy, cuzy, cabu, duzu, daty, gubo;
	logic cuga, casy, cedu, cata, doxe, ekob, edos, wony;
	drlatch latch_cyxu(!amun, nreset6, d[2], cyxu);
	drlatch latch_bake(!amun, nreset6, d[7], bake);
	drlatch latch_bemy(!amun, nreset6, d[4], bemy);
	drlatch latch_cuzy(!amun, nreset6, d[5], cuzy);
	drlatch latch_cabu(!amun, nreset6, d[6], cabu);
	drlatch latch_duzu(!amun, nreset6, d[1], duzu);
	drlatch latch_daty(!amun, nreset6, d[0], daty);
	drlatch latch_gubo(!amun, nreset6, d[3], gubo);
	assign #T_AND  avog = ff43 && cpu_rd2;
	assign #T_AND  arur = ff43 && cpu_wr2;
	assign #T_INV  beba = !avog;
	assign #T_INV  amun = !arur;
	assign #T_TRI  cuga = !beba ? !(!cyxu) : 'z;
	assign #T_TRI  casy = !beba ? !(!bake) : 'z;
	assign #T_TRI  cedu = !beba ? !(!bemy) : 'z;
	assign #T_TRI  cata = !beba ? !(!cuzy) : 'z;
	assign #T_TRI  doxe = !beba ? !(!cabu) : 'z;
	assign #T_TRI  ekob = !beba ? !(!duzu) : 'z;
	assign #T_TRI  edos = !beba ? !(!daty) : 'z;
	assign #T_TRI  wony = !beba ? !(!gubo) : 'z;
	assign ff43_d2 = cyxu;
	assign ff43_d7 = bake;
	assign ff43_d4 = bemy;
	assign ff43_d5 = cuzy;
	assign ff43_d6 = cabu;
	assign ff43_d1 = duzu;
	assign ff43_d0 = daty;
	assign ff43_d3 = gubo;
	assign d[2] = cuga;
	assign d[7] = casy;
	assign d[4] = cedu;
	assign d[5] = cata;
	assign d[6] = doxe;
	assign d[1] = ekob;
	assign d[0] = edos;
	assign d[3] = wony;

	logic anyp, bedy, buwy, cavo, fezu, funy, dede, foty, foha, fymo, gave, fujo;
	logic gonu, gyza, cusa, gyzo, gune, goba, ware, godo;
	drlatch latch_fezu(!cavo, nreset6, d[2], fezu);
	drlatch latch_funy(!cavo, nreset6, d[7], funy);
	drlatch latch_dede(!cavo, nreset6, d[4], dede);
	drlatch latch_foty(!cavo, nreset6, d[5], foty);
	drlatch latch_foha(!cavo, nreset6, d[6], foha);
	drlatch latch_fymo(!cavo, nreset6, d[1], fymo);
	drlatch latch_gave(!cavo, nreset6, d[0], gave);
	drlatch latch_fujo(!cavo, nreset6, d[3], fujo);
	assign #T_AND  anyp = cpu_rd2 && ff42;
	assign #T_AND  bedy = cpu_wr2 && ff42;
	assign #T_INV  buwy = !anyp;
	assign #T_INV  cavo = !bedy;
	assign #T_TRI  gonu = !buwy ? !(!fezu) : 'z;
	assign #T_TRI  gyza = !buwy ? !(!funy) : 'z;
	assign #T_TRI  cusa = !buwy ? !(!dede) : 'z;
	assign #T_TRI  gyzo = !buwy ? !(!foty) : 'z;
	assign #T_TRI  gune = !buwy ? !(!foha) : 'z;
	assign #T_TRI  goba = !buwy ? !(!fymo) : 'z;
	assign #T_TRI  ware = !buwy ? !(!gave) : 'z;
	assign #T_TRI  godo = !buwy ? !(!fujo) : 'z;
	assign ff42_d2 = fezu;
	assign ff42_d7 = funy;
	assign ff42_d4 = dede;
	assign ff42_d5 = foty;
	assign ff42_d6 = foha;
	assign ff42_d1 = fymo;
	assign ff42_d0 = gave;
	assign ff42_d3 = fujo;
	assign d[2] = gonu;
	assign d[7] = gyza;
	assign d[4] = cusa;
	assign d[5] = gyzo;
	assign d[6] = gune;
	assign d[1] = goba;
	assign d[0] = ware;
	assign d[3] = godo;

	logic vyre, wyce, xubo, xylo, xafo, xymo, xona, wymo, wexu, woky, vyxe;
	logic xero, wuka, wyju, xebu, vato, voke, vaha, wypo;
	drlatch latch_xylo(!xubo, xare, d[1], xylo);
	drlatch latch_xafo(!xubo, xare, d[3], xafo);
	drlatch latch_xymo(!xubo, xare, d[2], xymo);
	drlatch latch_xona(!xubo, xare, d[7], xona);
	drlatch latch_wymo(!xubo, xare, d[5], wymo);
	drlatch latch_wexu(!xubo, xare, d[4], wexu);
	drlatch latch_woky(!xubo, xare, d[6], woky);
	drlatch latch_vyxe(!xubo, xare, d[0], vyxe);
	assign #T_AND  vyre = ff40 && cpu_rd2;
	assign #T_AND  waru = ff40 && cpu_wr2;
	assign #T_INV  wyce = !vyre;
	assign #T_INV  xubo = !waru;
	assign #T_INV  xare = !reset7;
	assign #T_TRI  xero = !wyce ? !(!xylo) : 'z;
	assign #T_TRI  wuka = !wyce ? !(!xafo) : 'z;
	assign #T_TRI  wyju = !wyce ? !(!xymo) : 'z;
	assign #T_TRI  xebu = !wyce ? !(!xona) : 'z;
	assign #T_TRI  vato = !wyce ? !(!wymo) : 'z;
	assign #T_TRI  voke = !wyce ? !(!wexu) : 'z;
	assign #T_TRI  vaha = !wyce ? !(!woky) : 'z;
	assign #T_TRI  wypo = !wyce ? !(!vyxe) : 'z;
	assign ff40_d1 = xylo;
	assign ff40_d3 = xafo;
	assign ff40_d2 = xymo;
	assign ff40_d7 = xona;
	assign ff40_d5 = wymo;
	assign ff40_d4 = wexu;
	assign ff40_d6 = woky;
	assign ff40_d0 = vyxe;
	assign d[1] = xero;
	assign d[3] = wuka;
	assign d[2] = wyju;
	assign d[7] = xebu;
	assign d[5] = vato;
	assign d[4] = voke;
	assign d[6] = vaha;
	assign d[0] = wypo;

	logic xyly, xufa, weku, wane, sota, syry, salo, sedy, vevo, vafa, vuce, raha;
	logic race, retu, redy, razu, vafe, vazu, vojo, pufy;
	drlatch latch_sota(!wane, nreset9, d[4], sota);
	drlatch latch_syry(!wane, nreset9, d[0], syry);
	drlatch latch_salo(!wane, nreset9, d[3], salo);
	drlatch latch_sedy(!wane, nreset9, d[2], sedy);
	drlatch latch_vevo(!wane, nreset9, d[6], vevo);
	drlatch latch_vafa(!wane, nreset9, d[5], vafa);
	drlatch latch_vuce(!wane, nreset9, d[1], vuce);
	drlatch latch_raha(!wane, nreset9, d[7], raha);
	assign #T_AND  xyly = cpu_rd2 && ff45;
	assign #T_AND  xufa = cpu_wr2 && ff45;
	assign #T_INV  weku = !xyly;
	assign #T_INV  wane = !xufa;
	assign #T_TRI  race = !weku ? !(!sota) : 'z;
	assign #T_TRI  retu = !weku ? !(!syry) : 'z;
	assign #T_TRI  redy = !weku ? !(!salo) : 'z;
	assign #T_TRI  razu = !weku ? !(!sedy) : 'z;
	assign #T_TRI  vafe = !weku ? !(!vevo) : 'z;
	assign #T_TRI  vazu = !weku ? !(!vafa) : 'z;
	assign #T_TRI  vojo = !weku ? !(!vuce) : 'z;
	assign #T_TRI  pufy = !weku ? !(!raha) : 'z;
	assign ff45_d4 = sota;
	assign ff45_d0 = syry;
	assign ff45_d3 = salo;
	assign ff45_d2 = sedy;
	assign ff45_d6 = vevo;
	assign ff45_d5 = vafa;
	assign ff45_d1 = vuce;
	assign ff45_d7 = raha;
	assign d[4] = race;
	assign d[0] = retu;
	assign d[3] = redy;
	assign d[2] = razu;
	assign d[6] = vafe;
	assign d[5] = vazu;
	assign d[1] = vojo;
	assign d[7] = pufy;

	logic wafu, varo, wata, xaga, xepo, xuhy, xowo, xuce, wury, myfa;
	logic vyne, wama, wuva, wojy, weze, wavo, vega, lyco;
	assign #T_AND  wafu = cpu_rd2 && ff44;
	assign #T_INV  varo = !wafu;
	assign #T_INV  wata = !v[4];
	assign #T_INV  xaga = !v[5];
	assign #T_INV  xepo = !v[1];
	assign #T_INV  xuhy = !v[3];
	assign #T_INV  xowo = !v[7];
	assign #T_INV  xuce = !v[6];
	assign #T_INV  wury = !v[0];
	assign #T_INV  myfa = !v[2];
	assign #T_TRI  vyne = !varo ? !wata : 'z;
	assign #T_TRI  wama = !varo ? !xaga : 'z;
	assign #T_TRI  wuva = !varo ? !xepo : 'z;
	assign #T_TRI  wojy = !varo ? !xuhy : 'z;
	assign #T_TRI  weze = !varo ? !xowo : 'z;
	assign #T_TRI  wavo = !varo ? !xuce : 'z;
	assign #T_TRI  vega = !varo ? !wury : 'z;
	assign #T_TRI  lyco = !varo ? !myfa : 'z;
	assign d[4] = vyne;
	assign d[5] = wama;
	assign d[1] = wuva;
	assign d[3] = wojy;
	assign d[7] = weze;
	assign d[6] = wavo;
	assign d[0] = vega;
	assign d[2] = lyco;

endmodule
