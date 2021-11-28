`default_nettype none

module sprite_pixel_shifter(
		input  logic [7:0] md,
		output logic [7:0] spr_pix_a, spr_pix_b,

		input logic clkpipe, xono, xado, puco,
		input logic roby, lyku, lesy, lota, tyta, tyco, xovu, soka
	);

	logic pobe, pacy, pono, pugu, pute, puly, pelo, pawe;
	logic pudu, ramu, mytu, mofo, pefo, rewo, peba, roka;
	logic lubo, solo, lumo, lase, loza, rata, nuca, sybo;
	logic lufy, mame, rehu, rano, majo, myxa, lyde, lela;
	logic mofy, mezu, pyzu, pabe, mada, myto, ruca, rusy;
	logic sele, saja, suny, suto, rydu, sega, rama, semo;
	logic voby, wery, wura, wyco, selu, wamy, sery, sulu;
	logic waxo, tyga, xato, vexu, xexu, vaby, xole, vume;
	logic tula, teso, xyve, vune, taby, tapo, tupe, tuxa;
	dff dff_pudu(xado, pobe, pudu);
	dff dff_ramu(puco, pobe, ramu);
	dff dff_mytu(puco, pono, mytu);
	dff dff_mofo(xado, pono, mofo);
	dff dff_pefo(puco, pute, pefo);
	dff dff_rewo(xado, pute, rewo);
	dff dff_peba(xado, pelo, peba);
	dff dff_roka(puco, pelo, roka);
	dff dff_sele(puco, pacy, sele);
	dff dff_saja(xado, pacy, saja);
	dff dff_suny(xado, pugu, suny);
	dff dff_suto(puco, pugu, suto);
	dff dff_rydu(puco, puly, rydu);
	dff dff_sega(xado, puly, sega);
	dff dff_rama(puco, pawe, rama);
	dff dff_semo(xado, pawe, semo);
	assign #T_MUX  pobe = xono ? md[4] : md[3];
	assign #T_MUX  pacy = xono ? md[3] : md[4];
	assign #T_MUX  pono = xono ? md[5] : md[2];
	assign #T_MUX  pugu = xono ? md[2] : md[5];
	assign #T_MUX  pute = xono ? md[7] : md[0];
	assign #T_MUX  puly = xono ? md[0] : md[7];
	assign #T_MUX  pelo = xono ? md[6] : md[1];
	assign #T_MUX  pawe = xono ? md[1] : md[6];
	assign #T_INV  lubo = !pudu;
	assign #T_INV  solo = !ramu;
	assign #T_INV  lumo = !mytu;
	assign #T_INV  lase = !mofo;
	assign #T_INV  loza = !pefo;
	assign #T_INV  rata = !rewo;
	assign #T_INV  nuca = !peba;
	assign #T_INV  sybo = !roka;
	assign #T_NAND lufy = !(lubo && roby);
	assign #T_NAND mame = !(pudu && roby);
	assign #T_NAND rehu = !(solo && roby);
	assign #T_NAND rano = !(ramu && roby);
	assign #T_NAND majo = !(lumo && lyku);
	assign #T_NAND myxa = !(mytu && lyku);
	assign #T_NAND lyde = !(lase && lyku);
	assign #T_NAND lela = !(mofo && lyku);
	assign #T_NAND mofy = !(loza && lesy);
	assign #T_NAND mezu = !(pefo && lesy);
	assign #T_NAND pyzu = !(rata && lesy);
	assign #T_NAND pabe = !(rewo && lesy);
	assign #T_NAND mada = !(nuca && lota);
	assign #T_NAND myto = !(peba && lota);
	assign #T_NAND ruca = !(sybo && lota);
	assign #T_NAND rusy = !(roka && lota);
	assign #T_INV  voby = !sele;
	assign #T_INV  wery = !saja;
	assign #T_INV  wura = !suny;
	assign #T_INV  wyco = !suto;
	assign #T_INV  selu = !rydu;
	assign #T_INV  wamy = !sega;
	assign #T_INV  sery = !sery;
	assign #T_INV  sulu = !semo;
	assign #T_NAND waxo = !(voby && tyta);
	assign #T_NAND tyga = !(sele && tyta);
	assign #T_NAND xato = !(wery && tyta);
	assign #T_NAND vexu = !(saja && tyta);
	assign #T_NAND xexu = !(wura && tyco);
	assign #T_NAND vaby = !(suny && tyco);
	assign #T_NAND xole = !(wyco && tyco);
	assign #T_NAND vume = !(suto && tyco);
	assign #T_NAND tula = !(selu && xovu);
	assign #T_NAND teso = !(rydu && xovu);
	assign #T_NAND xyve = !(wamy && xovu);
	assign #T_NAND vune = !(sega && xovu);
	assign #T_NAND taby = !(sery && soka);
	assign #T_NAND tapo = !(rama && soka);
	assign #T_NAND tupe = !(sulu && soka);
	assign #T_NAND tuxa = !(semo && soka);

	logic nuro, maso, lefe, lesu, wyho, wora, vafo, wufy;
	logic nylu, pefu, naty, pyjo, vare, weba, vanu, vupy;
	dffsr dffsr_nuro(clkpipe, pabe, pyzu, '0,   nuro);
	dffsr dffsr_maso(clkpipe, myto, mada, nuro, maso);
	dffsr dffsr_lefe(clkpipe, lela, lyde, maso, lefe);
	dffsr dffsr_lesu(clkpipe, mame, lufy, lefe, lesu);
	dffsr dffsr_wyho(clkpipe, vexu, xato, lesu, wyho);
	dffsr dffsr_wora(clkpipe, vaby, xexu, wyho, wora);
	dffsr dffsr_vafo(clkpipe, tuxa, tupe, wora, vafo);
	dffsr dffsr_wufy(clkpipe, vune, xyve, vafo, wufy);
	dffsr dffsr_nylu(clkpipe, mezu, mofy, '0,   nylu);
	dffsr dffsr_pefu(clkpipe, rusy, ruca, nylu, pefu);
	dffsr dffsr_naty(clkpipe, myxa, majo, pefu, naty);
	dffsr dffsr_pyjo(clkpipe, rano, rehu, naty, pyjo);
	dffsr dffsr_vare(clkpipe, tyga, waxo, pyjo, vare);
	dffsr dffsr_weba(clkpipe, vume, xole, vare, weba);
	dffsr dffsr_vanu(clkpipe, tapo, taby, weba, vanu);
	dffsr dffsr_vupy(clkpipe, teso, tula, vanu, vupy);
	assign spr_pix_b[0] = nuro;
	assign spr_pix_b[1] = maso;
	assign spr_pix_b[2] = lefe;
	assign spr_pix_b[3] = lesu;
	assign spr_pix_b[4] = wyho;
	assign spr_pix_b[5] = wora;
	assign spr_pix_b[6] = vafo;
	assign spr_pix_b[7] = wufy;
	assign spr_pix_a[0] = nylu;
	assign spr_pix_a[1] = pefu;
	assign spr_pix_a[2] = naty;
	assign spr_pix_a[3] = pyjo;
	assign spr_pix_a[4] = vare;
	assign spr_pix_a[5] = weba;
	assign spr_pix_a[6] = vanu;
	assign spr_pix_a[7] = vupy;

endmodule
