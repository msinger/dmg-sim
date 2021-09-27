`default_nettype none

module dma(
		inout  tri logic [7:0]  d,
		inout  tri logic [12:0] nma,
		output     logic [15:0] dma_a,

		input logic clk1, nreset6, from_cpu5,
		input logic cpu_rd2, cpu_wr2, ff46,

		input  logic amab, phi_out,
		output logic wyja, caty, dma_run, mopa_nphi,
		output logic vram_to_oam, dma_addr_ext, oam_addr_dma
	);

	logic decy, maka, naxy, powu, luvy, molu, nygo, pusy, lavy, loru, lyxe, nlyxe, lupa, ahoc, loko, lapa, meta;
	dffr_bp dffr_maka(clk1,    nreset6, caty, maka); // check edge
	dffr_bp dffr_luvy(phi_out, nreset6, lupa, luvy); // check edge
	nor_srlatch latch_lyxe(lavy, loko, lyxe, nlyxe);
	assign #T_INV  decy = !from_cpu5;
	assign #T_INV  caty = !decy;
	assign #T_NOR  naxy = !(maka || phi_out);
	assign #T_AND  powu = matu && naxy;
	assign #T_AO   wyja = (amab && cpu_wr2) || powu;
	assign #T_AND  molu = ff46 && cpu_rd2;
	assign #T_INV  nygo = !molu;
	assign #T_INV  pusy = !nygo;
	assign #T_AND  lavy = cpu_wr2 && ff46;
	assign #T_INV  loru = !lavy;
	assign #T_NOR  lupa = !(lavy || nlyxe);
	assign #T_INV  ahoc = !vram_to_oam;
	assign #T_NAND loko = !(nreset6 && !lene);
	assign #T_INV  lapa = !loko;
	assign #T_AND  meta = phi_out && loky;

	logic mopa, navo, nolo, myte, lene, lara, loky, matu, mory, luma, logo, duga, lebu, muda, muho, lufa;
	dffr_bp dffr_myte(mopa,    lapa,    nolo, myte); // check edge
	dffr_bp dffr_lene(mopa,    nreset6, luvy, lene); // check edge
	dffr_bp dffr_matu(phi_out, nreset6, loky, matu); // check edge
	assign #T_INV  mopa = !phi_out;
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
	assign mopa_nphi    = mopa;
	assign dma_run      = matu;
	assign dma_addr_ext = luma;
	assign oam_addr_dma = duga;
	assign vram_to_oam  = lufa;

	logic nafa, nygy, para, pyne, pula, nydo, poku, maru, poly, pare, rema, rofo, raly, pane, resu, nuvy;
	logic evax, exyf, eraf, duve, fusy;
	dff dff_nafa(loru, d[0], nafa); // check edge
	dff dff_nygy(loru, d[4], nygy); // check edge
	dff dff_para(loru, d[2], para); // check edge
	dff dff_pyne(loru, d[1], pyne); // check edge
	dff dff_pula(loru, d[5], pula); // check edge
	dff dff_nydo(loru, d[3], nydo); // check edge
	dff dff_poku(loru, d[6], poku); // check edge
	dff dff_maru(loru, d[7], maru); // check edge
	assign #T_TRI  poly = pusy ? nafa : 'z; /* takes !q output of dff */
	assign #T_TRI  pare = pusy ? nygy : 'z; /* takes !q output of dff */
	assign #T_TRI  rema = pusy ? para : 'z; /* takes !q output of dff */
	assign #T_TRI  rofo = pusy ? pyne : 'z; /* takes !q output of dff */
	assign #T_TRI  raly = pusy ? pula : 'z; /* takes !q output of dff */
	assign #T_TRI  pane = pusy ? nydo : 'z; /* takes !q output of dff */
	assign #T_TRI  resu = pusy ? poku : 'z; /* takes !q output of dff */
	assign #T_TRI  nuvy = pusy ? maru : 'z; /* takes !q output of dff */
	assign #T_TRI  evax = !ahoc ? !nafa : 'z;
	assign #T_TRI  exyf = !ahoc ? !nygy : 'z;
	assign #T_TRI  eraf = !ahoc ? !para : 'z;
	assign #T_TRI  duve = !ahoc ? !pyne : 'z;
	assign #T_TRI  fusy = !ahoc ? !nydo : 'z;
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
	assign nma[8]  = evax;
	assign nma[12] = exyf;
	assign nma[10] = eraf;
	assign nma[9]  = duve;
	assign nma[11] = fusy;

	logic naky, pyro, nefy, muty, nyko, pylo, nuto, mugu, ecal, egez, fuhe, fyzy, damu, dava, eteg, erew;
	dffr_bp dffr_naky(meta,  lapa, !naky, naky); // check edge
	dffr_bp dffr_pyro(!naky, lapa, !pyro, pyro); // check edge
	dffr_bp dffr_nefy(!pyro, lapa, !nefy, nefy); // check edge
	dffr_bp dffr_muty(!nefy, lapa, !muty, muty); // check edge
	dffr_bp dffr_nyko(!muty, lapa, !nyko, nyko); // check edge
	dffr_bp dffr_pylo(!nyko, lapa, !pylo, pylo); // check edge
	dffr_bp dffr_nuto(!pylo, lapa, !nuto, nuto); // check edge
	dffr_bp dffr_mugu(!nuto, lapa, !mugu, mugu); // check edge
	assign #T_TRI  ecal = !ahoc ? !naky : 'z;
	assign #T_TRI  egez = !ahoc ? !pyro : 'z;
	assign #T_TRI  fuhe = !ahoc ? !nefy : 'z;
	assign #T_TRI  fyzy = !ahoc ? !muty : 'z;
	assign #T_TRI  damu = !ahoc ? !nyko : 'z;
	assign #T_TRI  dava = !ahoc ? !pylo : 'z;
	assign #T_TRI  eteg = !ahoc ? !nuto : 'z;
	assign #T_TRI  erew = !ahoc ? !mugu : 'z;
	assign dma_a[0] = naky;
	assign dma_a[1] = pyro;
	assign dma_a[2] = nefy;
	assign dma_a[3] = muty;
	assign dma_a[4] = nyko;
	assign dma_a[5] = pylo;
	assign dma_a[6] = nuto;
	assign dma_a[7] = mugu;
	assign nma[0] = ecal;
	assign nma[1] = egez;
	assign nma[2] = fuhe;
	assign nma[3] = fyzy;
	assign nma[4] = damu;
	assign nma[5] = dava;
	assign nma[6] = eteg;
	assign nma[7] = erew;

endmodule
