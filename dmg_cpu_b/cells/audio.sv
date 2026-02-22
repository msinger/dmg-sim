`default_nettype none

module dmg_audio #(
		parameter real L_rout = 0,
		parameter real L_lout = 0
	) (
		input  logic [3:0] ch1, ch2, ch3, ch4,
		input  logic       ena, ena_n, ch1_ena_n, ch2_ena_n, ch3_ena_n, ch4_ena_n,
		input  logic       r_vin_ena, rmixer0, rmixer1, rmixer2, rmixer3,
		input  logic       l_vin_ena, lmixer0, lmixer1, lmixer2, lmixer3,
		input  logic [2:0] rvolume_n, lvolume_n,
		output real        rout, lout,
		input  real        vin
	);

	real ch1_fp, ch2_fp, ch3_fp, ch4_fp;
	real rvol_fp, lvol_fp;
	real rmix, lmix;

	assign ch1_fp = $itor(ch1) / 15.0;
	assign ch2_fp = $itor(ch2) / 15.0;
	assign ch3_fp = $itor(ch3) / 15.0;
	assign ch4_fp = $itor(ch4) / 15.0;
	assign rvol_fp = $itor(~rvolume_n) / 7.0;
	assign lvol_fp = $itor(~lvolume_n) / 7.0;
	assign rmix = (rmixer0 ? ch1_fp * 0.7 : 0.0) +
	              (rmixer1 ? ch2_fp * 0.7 : 0.0) +
	              (rmixer2 ? ch3_fp * 0.7 : 0.0) +
	              (rmixer3 ? ch4_fp * 0.7 : 0.0) +
	              (r_vin_ena ? vin * 0.7 : 0.0);
	assign lmix = (lmixer0 ? ch1_fp * 0.7 : 0.0) +
	              (lmixer1 ? ch2_fp * 0.7 : 0.0) +
	              (lmixer2 ? ch3_fp * 0.7 : 0.0) +
	              (lmixer3 ? ch4_fp * 0.7 : 0.0) +
	              (l_vin_ena ? vin * 0.7 : 0.0);
	assign rout = (rmix * rvol_fp > 1.0) ? 1.0 : (rmix * rvol_fp);
	assign lout = (lmix * lvol_fp > 1.0) ? 1.0 : (lmix * lvol_fp);

endmodule

`default_nettype wire
