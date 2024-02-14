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
	assign  woxa = ff40_d1 && spr_pix_a[7];
	assign  xula = ff40_d1 && spr_pix_b[7];
	assign  tade = ff40_d0 && bg_pix_b_7;
	assign  rajy = ff40_d0 && bg_pix_a_7;
	assign  wele = !xula;
	assign  vumu = !woxa;
	assign  lava = !nobp0pixel;
	assign  wolo = !wele;
	assign  wyru = !vumu;
	assign  nuly = !(woxa || xula);
	assign  ruta = tade && vava;
	assign  ryfu = rajy && vava;
	assign  poka = !(nuly || ruta || ryfu);
	assign  vyro = wyru && wolo && lava;
	assign  vata = wyru && wele && lava;
	assign  volo = vumu && wolo && lava;
	assign  vugo = vumu && wele && lava;
	assign   wufu = (obp0_d[7] && vyro) || (obp0_d[5] && vata) || (obp0_d[3] && volo) || (obp0_d[1] && vugo);
	assign   waly = (vyro && obp0_d[6]) || (vata && obp0_d[4]) || (volo && obp0_d[2]) || (vugo && obp0_d[0]);
	assign   moka = (obp1_d[7] && ledo) || (obp1_d[5] && laru) || (obp1_d[3] && lyky) || (obp1_d[1] && lopu);
	assign   mufa = (ledo && obp1_d[6]) || (laru && obp1_d[4]) || (lyky && obp1_d[2]) || (lopu && obp1_d[0]);
	assign   nura = (bgp_d[7] && nypo) || (bgp_d[5] && numa) || (bgp_d[3] && nuxo) || (bgp_d[1] && pobu);
	assign   nelo = (nypo && bgp_d[6]) || (numa && bgp_d[4]) || (nuxo && bgp_d[2]) || (pobu && bgp_d[0]);
	assign   paty = nura || wufu || moka;
	assign   pero = nelo || waly || mufa;
	assign  ravo = !paty;
	assign  remy = !pero;
	assign  lyle = !maby;
	assign  lozo = !mexa;
	assign  mexa = !woxa;
	assign  luku = !nobp1pixel;
	assign  maby = !xula;
	assign  soba = !rajy;
	assign  vyco = !tade;
	assign  ledo = lozo && lyle && luku;
	assign  lyky = mexa && lyle && luku;
	assign  lopu = mexa && maby && luku;
	assign  laru = lozo && maby && luku;
	assign  muve = !nbgpixel;
	assign  nupo = !soba;
	assign  nale = !vyco;
	assign  nypo = nale && nupo && muve;
	assign  nuxo = vyco && nupo && muve;
	assign  numa = nale && soba && muve;
	assign  pobu = vyco && soba && muve;
	assign nbgpixel = poka;
	assign nld1 = ravo;
	assign nld0 = remy;

endmodule
