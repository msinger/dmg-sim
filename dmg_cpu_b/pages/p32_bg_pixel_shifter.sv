`timescale 1ns/1ns
`default_nettype none

module bg_pixel_shifter(
		input logic [7:0] md,

		input  logic clkpipe, mofu, nydy, nyxu,
		output logic rawu, pyzo, pulo, powy, pozo, poxa, poju, pyju,
		output logic bg_pix_a_7, bg_pix_b_7
	);

	logic leso, luve, labu, mete, loma, loze, luxa, legu, muku, megu, nasa;
	logic tosa, luhe, tyce, leke, ryga, lala, rapu, neze;
	logic seja, tuxe, loty, laky, sure, ruce, lutu, loto;
	logic suca, ruto, mosy, myvy, supu, rajo, nyha, nute;
	logic nudu, luzo, myjy, nefo;
	logic ruco, noly, revy, lomy, ryle, loxa, soja, nobo;
	logic seno, soly, nexa, nyxo, sebo, ryja, luja, lydu;
	logic sywe, raja, leru, lodo, ryjy, raga, nady, naja;
	dlatch_a latch_legu(!loma, md[0], legu);
	dlatch_a latch_muku(!loma, md[2], muku);
	dlatch_a latch_megu(!loma, md[4], megu);
	dlatch_a latch_nasa(!loma, md[6], nasa);
	dlatch_a latch_nudu(!loma, md[1], nudu);
	dlatch_a latch_luzo(!loma, md[3], luzo);
	dlatch_a latch_myjy(!loma, md[5], myjy);
	dlatch_a latch_nefo(!loma, md[7], nefo);
	dffr_a dffr_rawu(labu, '1, md[0], rawu);
	dffr_a dffr_pyzo(labu, '1, md[2], pyzo);
	dffr_a dffr_pulo(labu, '1, md[4], pulo);
	dffr_a dffr_powy(labu, '1, md[6], powy);
	dffr_a dffr_pozo(labu, '1, md[1], pozo);
	dffr_a dffr_poxa(labu, '1, md[3], poxa);
	dffr_a dffr_poju(labu, '1, md[5], poju);
	dffr_a dffr_pyju(labu, '1, md[7], pyju);
	assign #T_INV  leso = !mofu;
	assign #T_INV  luve = !leso;
	assign #T_INV  labu = !luve;
	assign #T_INV  mete = !nydy;
	assign #T_INV  loma = !mete;
	assign #T_INV  loze = !nyxu;
	assign #T_INV  luxa = !nyxu;
	assign #T_INV  tosa = !rawu;
	assign #T_INV  luhe = !legu;
	assign #T_INV  tyce = !pyzo;
	assign #T_INV  leke = !muku;
	assign #T_INV  ryga = !pulo;
	assign #T_INV  lala = !megu;
	assign #T_INV  rapu = !powy;
	assign #T_INV  neze = !nasa;
	assign #T_NAND seja = !(tosa && luxa);
	assign #T_NAND tuxe = !(luxa && rawu);
	assign #T_NAND loty = !(luhe && loze);
	assign #T_NAND laky = !(loze && legu);
	assign #T_NAND sure = !(tyce && luxa);
	assign #T_NAND ruce = !(luxa && pyzo);
	assign #T_NAND lutu = !(leke && loze);
	assign #T_NAND loto = !(loze && muku);
	assign #T_NAND suca = !(ryga && luxa);
	assign #T_NAND ruto = !(luxa && pulo);
	assign #T_NAND mosy = !(lala && loze);
	assign #T_NAND myvy = !(loze && megu);
	assign #T_NAND supu = !(rapu && luxa);
	assign #T_NAND rajo = !(luxa && powy);
	assign #T_NAND nyha = !(neze && loze);
	assign #T_NAND nute = !(loze && nasa);
	assign #T_INV  ruco = !pozo;
	assign #T_INV  noly = !nudu;
	assign #T_INV  revy = !poxa;
	assign #T_INV  lomy = !luzo;
	assign #T_INV  ryle = !poju;
	assign #T_INV  loxa = !myjy;
	assign #T_INV  soja = !pyju;
	assign #T_INV  nobo = !nefo;
	assign #T_NAND seno = !(ruco && luxa);
	assign #T_NAND soly = !(luxa && pozo);
	assign #T_NAND nexa = !(noly && loze);
	assign #T_NAND nyxo = !(loze && nudu);
	assign #T_NAND sebo = !(revy && luxa);
	assign #T_NAND ryja = !(luxa && poxa);
	assign #T_NAND luja = !(lomy && loze);
	assign #T_NAND lydu = !(loze && luzo);
	assign #T_NAND sywe = !(ryle && luxa);
	assign #T_NAND raja = !(luxa && poju);
	assign #T_NAND leru = !(loxa && loze);
	assign #T_NAND lodo = !(loze && myjy);
	assign #T_NAND ryjy = !(soja && luxa);
	assign #T_NAND raga = !(luxa && pyju);
	assign #T_NAND nady = !(nobo && loze);
	assign #T_NAND naja = !(loze && nefo);

	logic tomy, taca, sady, rysa, sobo, setu, ralu, sohu;
	logic myde, nozo, moju, macu, nepo, modu, neda, pybo;
	dffsr dffsr_tomy(clkpipe, tuxe, seja, '0,   tomy);
	dffsr dffsr_taca(clkpipe, soly, seno, tomy, taca);
	dffsr dffsr_sady(clkpipe, ruce, sure, taca, sady);
	dffsr dffsr_rysa(clkpipe, ryja, sebo, sady, rysa);
	dffsr dffsr_sobo(clkpipe, ruto, suca, rysa, sobo);
	dffsr dffsr_setu(clkpipe, raja, sywe, sobo, setu);
	dffsr dffsr_ralu(clkpipe, rajo, supu, setu, ralu);
	dffsr dffsr_sohu(clkpipe, raga, ryjy, ralu, sohu);
	dffsr dffsr_myde(clkpipe, laky, loty, '0,   myde);
	dffsr dffsr_nozo(clkpipe, nyxo, nexa, myde, nozo);
	dffsr dffsr_moju(clkpipe, loto, lutu, nozo, moju);
	dffsr dffsr_macu(clkpipe, lydu, luja, moju, macu);
	dffsr dffsr_nepo(clkpipe, myvy, mosy, macu, nepo);
	dffsr dffsr_modu(clkpipe, lodo, leru, nepo, modu);
	dffsr dffsr_neda(clkpipe, nute, nyha, modu, neda);
	dffsr dffsr_pybo(clkpipe, naja, nady, neda, pybo);
	assign bg_pix_b_7 = sohu;
	assign bg_pix_a_7 = pybo;

endmodule
