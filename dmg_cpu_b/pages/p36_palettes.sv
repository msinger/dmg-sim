`default_nettype none

module palettes(
		inout tri logic [7:0] d,

		input logic cpu_rd2, cpu_wr2,
		input logic ff47, ff48, ff49,

		output logic [7:0] bgp_d, obp0_d, obp1_d
	);

	logic vuso, vely, tepy, tepo, mena, moru, maxy, nusy, mogy, muke, pylu, pavo;
	logic lary, lyka, lobe, paba, lody, lace, redo, raro;
	dlatch_a latch_mena(!tepo, d[7], mena);
	dlatch_a latch_moru(!tepo, d[5], moru);
	dlatch_a latch_maxy(!tepo, d[3], maxy);
	dlatch_a latch_nusy(!tepo, d[1], nusy);
	dlatch_a latch_mogy(!tepo, d[6], mogy);
	dlatch_a latch_muke(!tepo, d[4], muke);
	dlatch_a latch_pylu(!tepo, d[2], pylu);
	dlatch_a latch_pavo(!tepo, d[0], pavo);
	assign  vuso = cpu_rd2 && ff47;
	assign  vely = cpu_wr2 && ff47;
	assign  tepy = !vuso;
	assign  tepo = !vely;
	assign  lary = !tepy ? !(!mena) : 'z;
	assign  lyka = !tepy ? !(!moru) : 'z;
	assign  lobe = !tepy ? !(!maxy) : 'z;
	assign  paba = !tepy ? !(!nusy) : 'z;
	assign  lody = !tepy ? !(!mogy) : 'z;
	assign  lace = !tepy ? !(!muke) : 'z;
	assign  redo = !tepy ? !(!pylu) : 'z;
	assign  raro = !tepy ? !(!pavo) : 'z;
	assign bgp_d[7] = mena;
	assign bgp_d[5] = moru;
	assign bgp_d[3] = maxy;
	assign bgp_d[1] = nusy;
	assign bgp_d[6] = mogy;
	assign bgp_d[4] = muke;
	assign bgp_d[2] = pylu;
	assign bgp_d[0] = pavo;
	assign d[7] = lary;
	assign d[5] = lyka;
	assign d[3] = lobe;
	assign d[1] = paba;
	assign d[6] = lody;
	assign d[4] = lace;
	assign d[2] = redo;
	assign d[0] = raro;

	logic xufy, xoma, xozy, xelo, xana, xyze, xalo, xuky, xupo, xeru, xova, xufu;
	logic xawo, xobo, xuby, xoke, xaxa, xaju, xuno, xary;
	dlatch_a latch_xana(!xelo, d[7], xana);
	dlatch_a latch_xyze(!xelo, d[5], xyze);
	dlatch_a latch_xalo(!xelo, d[3], xalo);
	dlatch_a latch_xuky(!xelo, d[1], xuky);
	dlatch_a latch_xupo(!xelo, d[6], xupo);
	dlatch_a latch_xeru(!xelo, d[4], xeru);
	dlatch_a latch_xova(!xelo, d[2], xova);
	dlatch_a latch_xufu(!xelo, d[0], xufu);
	assign  xufy = cpu_rd2 && ff48;
	assign  xoma = cpu_wr2 && ff48;
	assign  xozy = !xufy;
	assign  xelo = !xoma;
	assign  xawo = !xozy ? !(!xana) : 'z;
	assign  xobo = !xozy ? !(!xyze) : 'z;
	assign  xuby = !xozy ? !(!xalo) : 'z;
	assign  xoke = !xozy ? !(!xuky) : 'z;
	assign  xaxa = !xozy ? !(!xupo) : 'z;
	assign  xaju = !xozy ? !(!xeru) : 'z;
	assign  xuno = !xozy ? !(!xova) : 'z;
	assign  xary = !xozy ? !(!xufu) : 'z;
	assign obp0_d[7] = xana;
	assign obp0_d[5] = xyze;
	assign obp0_d[3] = xalo;
	assign obp0_d[1] = xuky;
	assign obp0_d[6] = xupo;
	assign obp0_d[4] = xeru;
	assign obp0_d[2] = xova;
	assign obp0_d[0] = xufu;
	assign d[7] = xawo;
	assign d[5] = xobo;
	assign d[3] = xuby;
	assign d[1] = xoke;
	assign d[6] = xaxa;
	assign d[4] = xaju;
	assign d[2] = xuno;
	assign d[0] = xary;

	logic mumy, myxe, lote, leho, luxo, lugu, lose, lawo, lepu, lune, mosa, moxy;
	logic lelu, luga, lyza, lepa, leba, luky, lode, laju;
	dlatch_a latch_luxo(!leho, d[7], luxo);
	dlatch_a latch_lugu(!leho, d[5], lugu);
	dlatch_a latch_lose(!leho, d[3], lose);
	dlatch_a latch_lawo(!leho, d[1], lawo);
	dlatch_a latch_lepu(!leho, d[6], lepu);
	dlatch_a latch_lune(!leho, d[4], lune);
	dlatch_a latch_mosa(!leho, d[2], mosa);
	dlatch_a latch_moxy(!leho, d[0], moxy);
	assign  mumy = cpu_rd2 && ff49;
	assign  myxe = cpu_wr2 && ff49;
	assign  lote = !mumy;
	assign  leho = !myxe;
	assign  lelu = !lote ? !(!luxo) : 'z;
	assign  luga = !lote ? !(!lugu) : 'z;
	assign  lyza = !lote ? !(!lose) : 'z;
	assign  lepa = !lote ? !(!lawo) : 'z;
	assign  leba = !lote ? !(!lepu) : 'z;
	assign  luky = !lote ? !(!lune) : 'z;
	assign  lode = !lote ? !(!mosa) : 'z;
	assign  laju = !lote ? !(!moxy) : 'z;
	assign obp1_d[7] = luxo;
	assign obp1_d[5] = lugu;
	assign obp1_d[3] = lose;
	assign obp1_d[1] = lawo;
	assign obp1_d[6] = lepu;
	assign obp1_d[4] = lune;
	assign obp1_d[2] = mosa;
	assign obp1_d[0] = moxy;
	assign d[7] = lelu;
	assign d[5] = luga;
	assign d[3] = lyza;
	assign d[1] = lepa;
	assign d[6] = leba;
	assign d[4] = luky;
	assign d[2] = lode;
	assign d[0] = laju;

endmodule
