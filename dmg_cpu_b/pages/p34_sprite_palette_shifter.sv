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
	assign   mefu = xefy || spr_pix_a[0] || spr_pix_b[0];
	assign   meve = xefy || spr_pix_a[1] || spr_pix_b[1];
	assign   myzo = xefy || spr_pix_a[2] || spr_pix_b[2];
	assign   ruda = xefy || spr_pix_a[3] || spr_pix_b[3];
	assign   voto = xefy || spr_pix_a[4] || spr_pix_b[4];
	assign   vysa = xefy || spr_pix_a[5] || spr_pix_b[5];
	assign   tory = xefy || spr_pix_a[6] || spr_pix_b[6];
	assign   wope = xefy || spr_pix_a[7] || spr_pix_b[7];
	assign  lesy = !mefu;
	assign  lota = !meve;
	assign  lyku = !myzo;
	assign  roby = !ruda;
	assign  tyta = !voto;
	assign  tyco = !vysa;
	assign  soka = !tory;
	assign  xovu = !wope;
	assign  sypy = !ngomo;
	assign  totu = !ngomo;
	assign  naro = !ngomo;
	assign  wexy = !ngomo;
	assign  ryzy = !ngomo;
	assign  ryfe = !ngomo;
	assign  lady = !ngomo;
	assign  lafy = !ngomo;
	assign pume = !(ngomo && lesy);
	assign suco = !(sypy && lesy);
	assign soro = !(ngomo && lota);
	assign tafa = !(totu && lota);
	assign pamo = !(ngomo && lyku);
	assign pyzy = !(naro && lyku);
	assign suky = !(ngomo && roby);
	assign towa = !(wexy && roby);
	assign rora = !(ngomo && tyta);
	assign rudu = !(ryzy && tyta);
	assign mene = !(ngomo && tyco);
	assign pazo = !(ryfe && tyco);
	assign luke = !(ngomo && soka);
	assign lowa = !(lady && soka);
	assign lamy = !(ngomo && xovu);
	assign lunu = !(lafy && xovu);
	assign  lome = !lyme;
	assign lafu = !(lome && nbgpixel);
	assign leka = !(lyme && nbgpixel);
	assign nobp0pixel = lafu;
	assign nobp1pixel = leka;

endmodule
