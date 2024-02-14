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
	assign  xaly = !(a[7] || a[5] || a[4]);
	assign wutu = !(ffxx && a[6] && xaly);
	assign  wero = !wutu;
	assign  xola = !a[0];
	assign  xeno = !a[1];
	assign  xusy = !a[2];
	assign  xera = !a[3];
	assign  wado = !xola;
	assign  wesa = !xeno;
	assign  walo = !xusy;
	assign  wepo = !xera;
	assign weta = !(wero && xola && xeno && xusy && wepo);
	assign wyle = !(wero && xola && xeno && walo && xera);
	assign woru = !(wero && xola && xeno && xusy && xera);
	assign wate = !(wero && xola && wesa && walo && xera);
	assign wyvo = !(wero && xola && wesa && xusy && wepo);
	assign wety = !(wero && wado && xeno && walo && xera);
	assign wofa = !(wero && wado && xeno && xusy && xera);
	assign wavu = !(wero && wado && wesa && xusy && xera);
	assign wage = !(wero && wado && wesa && xusy && wepo);
	assign webu = !(wero && xola && wesa && xusy && xera);
	assign vama = !(wero && wado && xeno && xusy && wepo);
	assign wybo = !(wero && wado && wesa && walo && xera);
	assign  xayo = !weta;
	assign  xogy = !wyle;
	assign  voca = !woru;
	assign  xeda = !wate;
	assign  vyga = !wyvo;
	assign  xayu = !wety;
	assign  vary = !wofa;
	assign  xavy = !wavu;
	assign  vumy = !wage;
	assign  xaro = !webu;
	assign  tego = !vama;
	assign  wera = !wybo;
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
