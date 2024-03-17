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
	assign  lofu = !l113;
	assign  magu = napo != !luca;
	assign  meco = !magu;
	assign  kebo = !meco;
	assign  kasa = !PURE;
	assign  umob = !nff04_d0;
	assign  usec = !nff04_d1;
	assign  kedy = !ff40_d7;
	assign   kahe = (ff40_d7 && kasa) || (kedy && umob);
	assign   kupa = (ff40_d7 && kebo) || (kedy && usec);
	assign  kymo = !kahe;
	assign  kofo = !kupa;
	assign npin_cpl = kymo;
	assign npin_fr  = kofo;

	logic nafy, pygo, socy, vybo, tyfa, paho, pome, sacu, ruju, pofy, ruze;
	dffr_bp dffr_nyka(clk2, nafy,  lyry, nyka);
	dffr_bp dffr_pory(myvo, nafy,  nyka, pory);
	dffr_bp dffr_pygo(clk2, nxymu, pory, pygo);
	dffr_bp dffr_paho(roxo, nxymu, h[3], paho);
	nor_srlatch latch_poky(pygo, loby, poky,);
	assign  loby = !nxymu;
	assign  nafy = !(loby || mosu);
	assign  tomu = !sylo;
	assign  socy = !tomu;
	assign  vybo = !(fepo || wodu || myvo);
	assign  tyfa = socy && poky && vybo;
	assign  segu = !tyfa;
	assign  roxo = !segu;
	assign  pome = !(avap || pofy);
	assign   sacu = segu || roxy;
	assign  tofu = !nreset_video;
	assign   ruju = paho || tofu || pome;
	assign  pofy = !ruju;
	assign  ruze = !pofy;
	assign clkpipe = sacu;
	assign npin_st = ruze;

	logic neru, meda, mure;
	dffr_bp dffr_meda(nnype, nreset_video2, neru, meda);
	assign  neru = !(v[7] || v[4] || v[3] || v[0] || v[1] || v[2] || v[5] || v[6]);
	assign  mure = !meda;
	assign npin_s = mure;

endmodule
