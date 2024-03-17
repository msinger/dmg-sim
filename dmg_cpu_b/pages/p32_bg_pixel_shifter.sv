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
	assign  leso = !mofu;
	assign  luve = !leso;
	assign  labu = !luve;
	assign  mete = !nydy;
	assign  loma = !mete;
	assign  loze = !nyxu;
	assign  luxa = !nyxu;
	assign  tosa = !rawu;
	assign  luhe = !legu;
	assign  tyce = !pyzo;
	assign  leke = !muku;
	assign  ryga = !pulo;
	assign  lala = !megu;
	assign  rapu = !powy;
	assign  neze = !nasa;
	assign seja = !(tosa && luxa);
	assign tuxe = !(luxa && rawu);
	assign loty = !(luhe && loze);
	assign laky = !(loze && legu);
	assign sure = !(tyce && luxa);
	assign ruce = !(luxa && pyzo);
	assign lutu = !(leke && loze);
	assign loto = !(loze && muku);
	assign suca = !(ryga && luxa);
	assign ruto = !(luxa && pulo);
	assign mosy = !(lala && loze);
	assign myvy = !(loze && megu);
	assign supu = !(rapu && luxa);
	assign rajo = !(luxa && powy);
	assign nyha = !(neze && loze);
	assign nute = !(loze && nasa);
	assign  ruco = !pozo;
	assign  noly = !nudu;
	assign  revy = !poxa;
	assign  lomy = !luzo;
	assign  ryle = !poju;
	assign  loxa = !myjy;
	assign  soja = !pyju;
	assign  nobo = !nefo;
	assign seno = !(ruco && luxa);
	assign soly = !(luxa && pozo);
	assign nexa = !(noly && loze);
	assign nyxo = !(loze && nudu);
	assign sebo = !(revy && luxa);
	assign ryja = !(luxa && poxa);
	assign luja = !(lomy && loze);
	assign lydu = !(loze && luzo);
	assign sywe = !(ryle && luxa);
	assign raja = !(luxa && poju);
	assign leru = !(loxa && loze);
	assign lodo = !(loze && myjy);
	assign ryjy = !(soja && luxa);
	assign raga = !(luxa && pyju);
	assign nady = !(nobo && loze);
	assign naja = !(loze && nefo);

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
