`default_nettype none

module dma(
		inout  tri logic [7:0]  d,
		inout  tri logic [12:0] nma,
		output     logic [15:0] dma_a,

		input logic clk1, nreset6, from_cpu5,
		input logic cpu_rd2, cpu_wr2, ff46,

		input  logic amab, phi_out,
		output logic wyja, caty, dma_run, mopa_nphi,
		output logic vram_to_oam, dma_addr_ext, oam_addr_ndma
	);

	logic decy, maka, naxy, powu, luvy, molu, nygo, pusy, lavy, loru, lyxe, nlyxe, lupa, ahoc, loko, lapa, meta;
	dffr_bp dffr_maka(clk1,    nreset6, caty, maka);
	dffr_bp dffr_luvy(phi_out, nreset6, lupa, luvy);
	nor_srlatch latch_lyxe(lavy, loko, lyxe, nlyxe);
	assign  decy = !from_cpu5;
	assign  caty = !decy;
	assign  naxy = !(maka || phi_out);
	assign  powu = matu && naxy;
	assign   wyja = (amab && cpu_wr2) || powu;
	assign  molu = ff46 && cpu_rd2;
	assign  nygo = !molu;
	assign  pusy = !nygo;
	assign  lavy = cpu_wr2 && ff46;
	assign  loru = !lavy;
	assign  lupa = !(lavy || nlyxe);
	assign  ahoc = !vram_to_oam;
	assign loko = !(nreset6 && !lene);
	assign  lapa = !loko;
	assign  meta = phi_out && loky;

	logic mopa, navo, nolo, myte, lene, lara, loky, matu, mory, luma, logo, duga, lebu, muda, muho, lufa;
	dffr_bp dffr_myte(mopa,    lapa,    nolo, myte);
	dffr_bp dffr_lene(mopa,    nreset6, luvy, lene);
	dffr_bp dffr_matu(phi_out, nreset6, loky, matu);
	assign  mopa = !phi_out;
	assign navo = !(dma_a[0] && dma_a[1] && dma_a[2] && dma_a[3] && dma_a[4] && dma_a[7]);
	assign  nolo = !navo;
	assign lara = !(loky && !myte && nreset6);
	assign loky = !(lara && !lene);
	assign mory = !(matu && logo);
	assign  luma = !mory;
	assign  logo = !muda;
	assign  duga = !matu;
	assign  lebu = !dma_a[15];
	assign  muda = !(dma_a[13] || dma_a[14] || lebu);
	assign muho = !(matu && muda);
	assign  lufa = !muho;
	assign mopa_nphi     = mopa;
	assign dma_run       = matu;
	assign dma_addr_ext  = luma;
	assign oam_addr_ndma = duga;
	assign vram_to_oam   = lufa;

	logic nafa, nygy, para, pyne, pula, nydo, poku, maru, poly, pare, rema, rofo, raly, pane, resu, nuvy;
	logic evax, exyf, eraf, duve, fusy;
	dlatch_a latch_nafa(!loru, d[0], nafa);
	dlatch_a latch_nygy(!loru, d[4], nygy);
	dlatch_a latch_para(!loru, d[2], para);
	dlatch_a latch_pyne(!loru, d[1], pyne);
	dlatch_a latch_pula(!loru, d[5], pula);
	dlatch_a latch_nydo(!loru, d[3], nydo);
	dlatch_a latch_poku(!loru, d[6], poku);
	dlatch_a latch_maru(!loru, d[7], maru);
	assign  poly = pusy ? !(!nafa) : 'z;
	assign  pare = pusy ? !(!nygy) : 'z;
	assign  rema = pusy ? !(!para) : 'z;
	assign  rofo = pusy ? !(!pyne) : 'z;
	assign  raly = pusy ? !(!pula) : 'z;
	assign  pane = pusy ? !(!nydo) : 'z;
	assign  resu = pusy ? !(!poku) : 'z;
	assign  nuvy = pusy ? !(!maru) : 'z;
	assign  evax = !ahoc ? !nafa : 'z;
	assign  exyf = !ahoc ? !nygy : 'z;
	assign  eraf = !ahoc ? !para : 'z;
	assign  duve = !ahoc ? !pyne : 'z;
	assign  fusy = !ahoc ? !nydo : 'z;
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
	dffr_bp dffr_naky(meta,  lapa, !naky, naky);
	dffr_bp dffr_pyro(!naky, lapa, !pyro, pyro);
	dffr_bp dffr_nefy(!pyro, lapa, !nefy, nefy);
	dffr_bp dffr_muty(!nefy, lapa, !muty, muty);
	dffr_bp dffr_nyko(!muty, lapa, !nyko, nyko);
	dffr_bp dffr_pylo(!nyko, lapa, !pylo, pylo);
	dffr_bp dffr_nuto(!pylo, lapa, !nuto, nuto);
	dffr_bp dffr_mugu(!nuto, lapa, !mugu, mugu);
	assign  ecal = !ahoc ? !naky : 'z;
	assign  egez = !ahoc ? !pyro : 'z;
	assign  fuhe = !ahoc ? !nefy : 'z;
	assign  fyzy = !ahoc ? !muty : 'z;
	assign  damu = !ahoc ? !nyko : 'z;
	assign  dava = !ahoc ? !pylo : 'z;
	assign  eteg = !ahoc ? !nuto : 'z;
	assign  erew = !ahoc ? !mugu : 'z;
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
