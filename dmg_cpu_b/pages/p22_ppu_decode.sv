`timescale 1ns/1ns
`default_nettype none

module ppu_decode(
		input logic [15:0] a,

		input  logic ffxx,
		output logic ff40, ff41, ff42, ff43, ff44, ff45,
		output logic ff46, ff47, ff48, ff49, ff4a, ff4b
	);

	logic xaly, wutu, wero, xola, xeno, xusy, xera, wado, wesa, walo, wepo;
	logic weta, wyle, woru, wate, wyvo, wety, wofa, wavu, wage, webu, vama, wybo;
	logic xayo, xogy, voca, xeda, vyga, xayu, vary, xavy, vumy, xaro, tego, wera;
	assign #T_NOR  xaly = !(a[7] || a[5] || a[4]);
	assign #T_NAND wutu = !(ffxx && a[6] && xaly);
	assign #T_INV  wero = !wutu;
	assign #T_INV  xola = !a[0];
	assign #T_INV  xeno = !a[1];
	assign #T_INV  xusy = !a[2];
	assign #T_INV  xera = !a[3];
	assign #T_INV  wado = !xola;
	assign #T_INV  wesa = !xeno;
	assign #T_INV  walo = !xusy;
	assign #T_INV  wepo = !xera;
	assign #T_NAND weta = !(wero && xola && xeno && xusy && wepo);
	assign #T_NAND wyle = !(wero && xola && xeno && walo && xera);
	assign #T_NAND woru = !(wero && xola && xeno && xusy && xera);
	assign #T_NAND wate = !(wero && xola && wesa && walo && xera);
	assign #T_NAND wyvo = !(wero && xola && wesa && xusy && wepo);
	assign #T_NAND wety = !(wero && wado && xeno && walo && xera);
	assign #T_NAND wofa = !(wero && wado && xeno && xusy && xera);
	assign #T_NAND wavu = !(wero && wado && wesa && xusy && xera);
	assign #T_NAND wage = !(wero && wado && wesa && xusy && wepo);
	assign #T_NAND webu = !(wero && xola && wesa && xusy && xera);
	assign #T_NAND vama = !(wero && wado && xeno && xusy && wepo);
	assign #T_NAND wybo = !(wero && wado && wesa && walo && xera);
	assign #T_INV  xayo = !weta;
	assign #T_INV  xogy = !wyle;
	assign #T_INV  voca = !woru;
	assign #T_INV  xeda = !wate;
	assign #T_INV  vyga = !wyvo;
	assign #T_INV  xayu = !wety;
	assign #T_INV  vary = !wofa;
	assign #T_INV  xavy = !wavu;
	assign #T_INV  vumy = !wage;
	assign #T_INV  xaro = !webu;
	assign #T_INV  tego = !vama;
	assign #T_INV  wera = !wybo;
	assign ff48 = xayo;
	assign ff44 = xogy;
	assign ff40 = voca;
	assign ff46 = xeda;
	assign ff4a = vyga;
	assign ff45 = xayu;
	assign ff41 = vary;
	assign ff43 = xavy;
	assign ff4b = vumy;
	assign ff42 = xaro;
	assign ff49 = tego;
	assign ff47 = wera;

endmodule
