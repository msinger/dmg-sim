`default_nettype none
`timescale 1ns/100ps

module dma(
		clk1, d, ma, dma_a,
		nreset6, from_cpu5,
		cpu_rd2, cpu_wr2, ff46,
		amab, wyja, caty, dma_run,
		vram_to_oam, dma_addr_ext, oam_addr_dma,
		nphi_out, mopa_phi
	);

	inout  wire [7:0] d;
	output wire [12:0] ma;
	output wire [15:0] dma_a;

	input wire clk1, nreset6, from_cpu5;
	input wire cpu_rd2, cpu_wr2, ff46;

	input  wire amab, nphi_out;
	output wire wyja, caty, dma_run, mopa_phi;
	output wire vram_to_oam, dma_addr_ext, oam_addr_dma;

	wire decy, maka, naxy, powu, luvy, molu, nygo, pusy, lavy, loru, lyxe, lupa, ahoc, loko, lapa, meta;
	dffr dffr_maka(clk1,     nreset6, caty, maka); // check edge
	dffr dffr_luvy(nphi_out, nreset6, lupa, luvy); // check edge
	assign #T_INV  decy = !from_cpu5;
	assign #T_INV  caty = !decy;
	assign #T_NOR  naxy = !(maka || luvy);
	assign #T_AND  powu = matu && naxy;
	assign #T_AO   wyja = (amab && cpu_wr2) || powu;
	assign #T_AND  molu = ff46 && cpu_rd2;
	assign #T_INV  nygo = !molu;
	assign #T_INV  pusy = !nygo;
	assign #T_AND  lavy = ff46 && cpu_wr2;
	assign #T_INV  loru = !lavy;
	assign #T_OR   lyxe = loru || loko;
	assign #T_NOR  lupa = !(lavy || lyxe);
	assign #T_INV  ahoc = !vram_to_oam;
	assign #T_NAND loko = !(nreset6 && !lene);
	assign #T_INV  lapa = !loko;
	assign #T_AND  meta = nphi_out && loky;

	wire mopa, navo, nolo, myte, lene, lara, loky, matu, mory, luma, logo, duga, lebu, muda, muho, lufa;
	dffr dffr_myte(mopa,     lapa,    nolo, myte); // check edge
	dffr dffr_lene(mopa,     nreset6, luvy, lene); // check edge
	dffr dffr_matu(nphi_out, nreset6, loky, matu); // check edge
	assign #T_INV  mopa = !nphi_out;
	assign #T_NAND navo = !(dma_a[0] && dma_a[1] && dma_a[2] && dma_a[3] && dma_a[4] && dma_a[7]);
	assign #T_INV  nolo = !navo;
	assign #T_NAND lara = !(loky && !myte && nreset6);
	assign #T_NAND loky = !(lara && !lene);
	assign #T_NAND mory = !(matu && logo);
	assign #T_INV  luma = !mory;
	assign #T_INV  logo = !muda;
	assign #T_INV  duga = !matu;
	assign #T_INV  lebu = !dma_a[15];
	assign #T_NOR  muda = !(dma_a[13] || dma_a[14] || lebu);
	assign #T_NAND muho = !(matu && muda);
	assign #T_INV  lufa = !muho;
	assign mopa_phi     = mopa;
	assign dma_run      = matu;
	assign dma_addr_ext = luma;
	assign oam_addr_dma = duga;
	assign vram_to_oam  = lufa;

	wire nafa, nygy, para, pyne, pula, nydo, poku, maru, poly, pare, rema, rofo, raly, pane, resu, nuvy;
	wire evax, exyf, eraf, duve, fusy;
	dff dff_nafa(loru, d[0], nafa); // check edge
	dff dff_nygy(loru, d[4], nygy); // check edge
	dff dff_para(loru, d[2], para); // check edge
	dff dff_pyne(loru, d[1], pyne); // check edge
	dff dff_pula(loru, d[5], pula); // check edge
	dff dff_nydo(loru, d[3], nydo); // check edge
	dff dff_poku(loru, d[6], poku); // check edge
	dff dff_maru(loru, d[7], maru); // check edge
	assign #T_TRI  poly = pusy ? nafa : 1'bz; /* takes !q output of dff */
	assign #T_TRI  pare = pusy ? nygy : 1'bz; /* takes !q output of dff */
	assign #T_TRI  rema = pusy ? para : 1'bz; /* takes !q output of dff */
	assign #T_TRI  rofo = pusy ? pyne : 1'bz; /* takes !q output of dff */
	assign #T_TRI  raly = pusy ? pula : 1'bz; /* takes !q output of dff */
	assign #T_TRI  pane = pusy ? nydo : 1'bz; /* takes !q output of dff */
	assign #T_TRI  resu = pusy ? poku : 1'bz; /* takes !q output of dff */
	assign #T_TRI  nuvy = pusy ? maru : 1'bz; /* takes !q output of dff */
	assign #T_TRI  evax = !ahoc ? !nafa : 1'bz;
	assign #T_TRI  exyf = !ahoc ? !nygy : 1'bz;
	assign #T_TRI  eraf = !ahoc ? !para : 1'bz;
	assign #T_TRI  duve = !ahoc ? !pyne : 1'bz;
	assign #T_TRI  fusy = !ahoc ? !nydo : 1'bz;
	assign d[0] = poly;
	assign d[4] = pare;
	assign d[2] = rema;
	assign d[1] = rofo;
	assign d[5] = raly;
	assign d[3] = pane;
	assign d[6] = resu;
	assign d[7] = nuvy;
	assign dma_a[8]  = nafa;
	assign dma_a[12] = nygy;
	assign dma_a[10] = para;
	assign dma_a[9]  = pyne;
	assign dma_a[13] = pula;
	assign dma_a[11] = nydo;
	assign dma_a[14] = poku;
	assign dma_a[15] = maru;
	assign ma[8]  = evax;
	assign ma[12] = exyf;
	assign ma[10] = eraf;
	assign ma[9]  = duve;
	assign ma[11] = fusy;

	wire naky, pyro, nefy, muty, nyko, pylo, nuto, mugu, ecal, egez, fuhe, fyzy, damu, dava, eteg, erew;
	dffr dffr_naky(meta,  lapa, !naky, naky); // check edge
	dffr dffr_pyro(!naky, lapa, !pyro, pyro); // check edge
	dffr dffr_nefy(!pyro, lapa, !nefy, nefy); // check edge
	dffr dffr_muty(!nefy, lapa, !muty, muty); // check edge
	dffr dffr_nyko(!muty, lapa, !nyko, nyko); // check edge
	dffr dffr_pylo(!nyko, lapa, !pylo, pylo); // check edge
	dffr dffr_nuto(!pylo, lapa, !nuto, nuto); // check edge
	dffr dffr_mugu(!nuto, lapa, !mugu, mugu); // check edge
	assign #T_TRI  ecal = !ahoc ? !naky : 1'bz;
	assign #T_TRI  egez = !ahoc ? !pyro : 1'bz;
	assign #T_TRI  fuhe = !ahoc ? !nefy : 1'bz;
	assign #T_TRI  fyzy = !ahoc ? !muty : 1'bz;
	assign #T_TRI  damu = !ahoc ? !nyko : 1'bz;
	assign #T_TRI  dava = !ahoc ? !pylo : 1'bz;
	assign #T_TRI  eteg = !ahoc ? !nuto : 1'bz;
	assign #T_TRI  erew = !ahoc ? !mugu : 1'bz;
	assign dma_a[0] = naky;
	assign dma_a[1] = pyro;
	assign dma_a[2] = nefy;
	assign dma_a[3] = muty;
	assign dma_a[4] = nyko;
	assign dma_a[5] = pylo;
	assign dma_a[6] = nuto;
	assign dma_a[7] = mugu;
	assign ma[0] = ecal;
	assign ma[1] = egez;
	assign ma[2] = fuhe;
	assign ma[3] = fyzy;
	assign ma[4] = damu;
	assign ma[5] = dava;
	assign ma[6] = eteg;
	assign ma[7] = erew;

endmodule
