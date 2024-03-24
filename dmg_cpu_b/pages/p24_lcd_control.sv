`timescale 1ns/1ns
`default_nettype none

module lcd_control(
		input logic clk2, nreset_video, nreset_video2,

		input logic [7:0] v, h,

		input  logic nff04_d0, nff04_d1,
		input  logic ff40_d7,
		input  logic l113, nxymu, mosu, lyry, myvo, sylo, fepo, wodu, napo, PURE, avap, roxy, nnype,
		output logic loby, nyka, pory, tomu, poky, roxo, segu, tofu,

		output logic npin_cpl, npin_fr, npin_st, npin_s,
		output logic clkpipe
	);

	logic lofu, luca, magu, lebe, meco, kebo, kasa, umob, usec, kedy, kahe, kupa, kymo, kofo;
	dffr_bp dffr_luca(lofu,  nreset_video2, !luca, luca);
	dffr_bp dffr_lebe(!luca, nreset_video2, !lebe, lebe);
	assign #T_INV  lofu = !l113;
	assign #T_XOR  magu = napo != !luca;
	assign #T_INV  meco = !magu;
	assign #T_INV  kebo = !meco;
	assign #T_INV  kasa = !PURE;
	assign #T_INV  umob = !nff04_d0;
	assign #T_INV  usec = !nff04_d1;
	assign #T_INV  kedy = !ff40_d7;
	assign #T_AO   kahe = (ff40_d7 && kasa) || (kedy && umob);
	assign #T_AO   kupa = (ff40_d7 && kebo) || (kedy && usec);
	assign #T_INV  kymo = !kahe;
	assign #T_INV  kofo = !kupa;
	assign npin_cpl = kymo;
	assign npin_fr  = kofo;

	logic nafy, pygo, socy, vybo, tyfa, paho, pome, sacu, ruju, pofy, ruze;
	dffr_bp dffr_nyka(clk2, nafy,  lyry, nyka);
	dffr_bp dffr_pory(myvo, nafy,  nyka, pory);
	dffr_bp dffr_pygo(clk2, nxymu, pory, pygo);
	dffr_bp dffr_paho(roxo, nxymu, h[3], paho);
	nor_srlatch latch_poky(pygo, loby, poky,);
	assign #T_INV  loby = !nxymu;
	assign #T_NOR  nafy = !(loby || mosu);
	assign #T_INV  tomu = !sylo;
	assign #T_INV  socy = !tomu;
	assign #T_NOR  vybo = !(fepo || wodu || myvo);
	assign #T_AND  tyfa = socy && poky && vybo;
	assign #T_INV  segu = !tyfa;
	assign #T_INV  roxo = !segu;
	assign #T_NOR  pome = !(avap || pofy);
	assign #T_OR   sacu = segu || roxy;
	assign #T_INV  tofu = !nreset_video;
	assign #T_OR   ruju = paho || tofu || pome;
	assign #T_INV  pofy = !ruju;
	assign #T_INV  ruze = !pofy;
	assign clkpipe = sacu;
	assign npin_st = ruze;

	logic neru, meda, mure;
	dffr_bp dffr_meda(nnype, nreset_video2, neru, meda);
	assign #T_NOR  neru = !(v[7] || v[4] || v[3] || v[0] || v[1] || v[2] || v[5] || v[6]);
	assign #T_INV  mure = !meda;
	assign npin_s = mure;

endmodule
