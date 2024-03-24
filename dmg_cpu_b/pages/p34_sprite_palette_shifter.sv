`timescale 1ns/1ns
`default_nettype none

module sprite_palette_shifter(
		input logic [7:0] spr_pix_a, spr_pix_b,

		input  logic clkpipe, xefy, ngomo,
		output logic lesy, lota, lyku, roby, tyta, tyco, soka, xovu,

		input  logic nbgpixel,
		output logic nobp0pixel, nobp1pixel
	);

	logic mefu, meve, myzo, ruda, voto, vysa, tory, wope;
	logic sypy, totu, naro, wexy, ryzy, ryfe, lady, lafy;
	logic pume, suco, soro, tafa, pamo, pyzy, suky, towa;
	logic rora, rudu, mene, pazo, luke, lowa, lamy, lunu;
	logic rugo, sata, rosa, somy, palu, nuke, moda, lyme;
	logic lome, lafu, leka;
	dffsr dffsr_rugo(clkpipe, pume, suco, '0,   rugo);
	dffsr dffsr_sata(clkpipe, soro, tafa, rugo, sata);
	dffsr dffsr_rosa(clkpipe, pamo, pyzy, sata, rosa);
	dffsr dffsr_somy(clkpipe, suky, towa, rosa, somy);
	dffsr dffsr_palu(clkpipe, rora, rudu, somy, palu);
	dffsr dffsr_nuke(clkpipe, mene, pazo, palu, nuke);
	dffsr dffsr_moda(clkpipe, luke, lowa, nuke, moda);
	dffsr dffsr_lyme(clkpipe, lamy, lunu, moda, lyme);
	assign #T_OR   mefu = xefy || spr_pix_a[0] || spr_pix_b[0];
	assign #T_OR   meve = xefy || spr_pix_a[1] || spr_pix_b[1];
	assign #T_OR   myzo = xefy || spr_pix_a[2] || spr_pix_b[2];
	assign #T_OR   ruda = xefy || spr_pix_a[3] || spr_pix_b[3];
	assign #T_OR   voto = xefy || spr_pix_a[4] || spr_pix_b[4];
	assign #T_OR   vysa = xefy || spr_pix_a[5] || spr_pix_b[5];
	assign #T_OR   tory = xefy || spr_pix_a[6] || spr_pix_b[6];
	assign #T_OR   wope = xefy || spr_pix_a[7] || spr_pix_b[7];
	assign #T_INV  lesy = !mefu;
	assign #T_INV  lota = !meve;
	assign #T_INV  lyku = !myzo;
	assign #T_INV  roby = !ruda;
	assign #T_INV  tyta = !voto;
	assign #T_INV  tyco = !vysa;
	assign #T_INV  soka = !tory;
	assign #T_INV  xovu = !wope;
	assign #T_INV  sypy = !ngomo;
	assign #T_INV  totu = !ngomo;
	assign #T_INV  naro = !ngomo;
	assign #T_INV  wexy = !ngomo;
	assign #T_INV  ryzy = !ngomo;
	assign #T_INV  ryfe = !ngomo;
	assign #T_INV  lady = !ngomo;
	assign #T_INV  lafy = !ngomo;
	assign #T_NAND pume = !(ngomo && lesy);
	assign #T_NAND suco = !(sypy && lesy);
	assign #T_NAND soro = !(ngomo && lota);
	assign #T_NAND tafa = !(totu && lota);
	assign #T_NAND pamo = !(ngomo && lyku);
	assign #T_NAND pyzy = !(naro && lyku);
	assign #T_NAND suky = !(ngomo && roby);
	assign #T_NAND towa = !(wexy && roby);
	assign #T_NAND rora = !(ngomo && tyta);
	assign #T_NAND rudu = !(ryzy && tyta);
	assign #T_NAND mene = !(ngomo && tyco);
	assign #T_NAND pazo = !(ryfe && tyco);
	assign #T_NAND luke = !(ngomo && soka);
	assign #T_NAND lowa = !(lady && soka);
	assign #T_NAND lamy = !(ngomo && xovu);
	assign #T_NAND lunu = !(lafy && xovu);
	assign #T_INV  lome = !lyme;
	assign #T_NAND lafu = !(lome && nbgpixel);
	assign #T_NAND leka = !(lyme && nbgpixel);
	assign nobp0pixel = lafu;
	assign nobp1pixel = leka;

endmodule
