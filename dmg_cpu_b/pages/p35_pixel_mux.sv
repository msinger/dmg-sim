`timescale 1ns/1ns
`default_nettype none

module pixel_mux(
		input logic [7:0] obp0_d, obp1_d, bgp_d,
		input logic [7:0] spr_pix_a, spr_pix_b,

		input logic bg_pix_a_7, bg_pix_b_7, nobp0pixel, nobp1pixel,

		input  logic ff40_d0, ff40_d1, vava,
		output logic nbgpixel, nld0, nld1
	);

	logic woxa, xula, tade, rajy, wele, vumu, lava, wolo, wyru;
	logic nuly, ruta, ryfu, poka, vyro, vata, volo, vugo;
	logic wufu, waly, moka, mufa, nura, nelo, paty, pero, ravo, remy;
	logic lyle, lozo, mexa, luku, maby, soba, vyco, ledo, lyky, lopu, laru;
	logic muve, nupo, nale, nypo, nuxo, numa, pobu;
	assign #T_AND  woxa = ff40_d1 && spr_pix_a[7];
	assign #T_AND  xula = ff40_d1 && spr_pix_b[7];
	assign #T_AND  tade = ff40_d0 && bg_pix_b_7;
	assign #T_AND  rajy = ff40_d0 && bg_pix_a_7;
	assign #T_INV  wele = !xula;
	assign #T_INV  vumu = !woxa;
	assign #T_INV  lava = !nobp0pixel;
	assign #T_INV  wolo = !wele;
	assign #T_INV  wyru = !vumu;
	assign #T_NOR  nuly = !(woxa || xula);
	assign #T_AND  ruta = tade && vava;
	assign #T_AND  ryfu = rajy && vava;
	assign #T_NOR  poka = !(nuly || ruta || ryfu);
	assign #T_AND  vyro = wyru && wolo && lava;
	assign #T_AND  vata = wyru && wele && lava;
	assign #T_AND  volo = vumu && wolo && lava;
	assign #T_AND  vugo = vumu && wele && lava;
	assign #T_AO   wufu = (obp0_d[7] && vyro) || (obp0_d[5] && vata) || (obp0_d[3] && volo) || (obp0_d[1] && vugo);
	assign #T_AO   waly = (vyro && obp0_d[6]) || (vata && obp0_d[4]) || (volo && obp0_d[2]) || (vugo && obp0_d[0]);
	assign #T_AO   moka = (obp1_d[7] && ledo) || (obp1_d[5] && laru) || (obp1_d[3] && lyky) || (obp1_d[1] && lopu);
	assign #T_AO   mufa = (ledo && obp1_d[6]) || (laru && obp1_d[4]) || (lyky && obp1_d[2]) || (lopu && obp1_d[0]);
	assign #T_AO   nura = (bgp_d[7] && nypo) || (bgp_d[5] && numa) || (bgp_d[3] && nuxo) || (bgp_d[1] && pobu);
	assign #T_AO   nelo = (nypo && bgp_d[6]) || (numa && bgp_d[4]) || (nuxo && bgp_d[2]) || (pobu && bgp_d[0]);
	assign #T_OR   paty = nura || wufu || moka;
	assign #T_OR   pero = nelo || waly || mufa;
	assign #T_INV  ravo = !paty;
	assign #T_INV  remy = !pero;
	assign #T_INV  lyle = !maby;
	assign #T_INV  lozo = !mexa;
	assign #T_INV  mexa = !woxa;
	assign #T_INV  luku = !nobp1pixel;
	assign #T_INV  maby = !xula;
	assign #T_INV  soba = !rajy;
	assign #T_INV  vyco = !tade;
	assign #T_AND  ledo = lozo && lyle && luku;
	assign #T_AND  lyky = mexa && lyle && luku;
	assign #T_AND  lopu = mexa && maby && luku;
	assign #T_AND  laru = lozo && maby && luku;
	assign #T_INV  muve = !nbgpixel;
	assign #T_INV  nupo = !soba;
	assign #T_INV  nale = !vyco;
	assign #T_AND  nypo = nale && nupo && muve;
	assign #T_AND  nuxo = vyco && nupo && muve;
	assign #T_AND  numa = nale && soba && muve;
	assign #T_AND  pobu = vyco && soba && muve;
	assign nbgpixel = poka;
	assign nld1 = ravo;
	assign nld0 = remy;

endmodule
