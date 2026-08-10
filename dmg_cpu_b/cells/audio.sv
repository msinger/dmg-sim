`default_nettype none

package dmg_audio_param;

	import dmg_timing::L_unit;

	parameter real L_ch1_0      = 0.0;
	parameter real L_ch1_1      = 0.0;
	parameter real L_ch1_2      = 0.0;
	parameter real L_ch1_3      = 0.0;
	parameter real L_ch2_0      = 0.0;
	parameter real L_ch2_1      = 0.0;
	parameter real L_ch2_2      = 0.0;
	parameter real L_ch2_3      = 0.0;
	parameter real L_ch3_0      = 0.0;
	parameter real L_ch3_1      = 0.0;
	parameter real L_ch3_2      = 0.0;
	parameter real L_ch3_3      = 0.0;
	parameter real L_ch4_0      = 0.0;
	parameter real L_ch4_1      = 0.0;
	parameter real L_ch4_2      = 0.0;
	parameter real L_ch4_3      = 0.0;
	parameter real L_ena        = 0.0;
	parameter real L_ena_n      = 0.0;
	parameter real L_ch1_ena_n  = 0.0;
	parameter real L_ch2_ena_n  = 0.0;
	parameter real L_ch3_ena_n  = 0.0;
	parameter real L_ch4_ena_n  = 0.0;
	parameter real L_r_vin_ena  = 0.0;
	parameter real L_rmixer0    = 0.0;
	parameter real L_rmixer1    = 0.0;
	parameter real L_rmixer2    = 0.0;
	parameter real L_rmixer3    = 0.0;
	parameter real L_l_vin_ena  = 0.0;
	parameter real L_lmixer0    = 0.0;
	parameter real L_lmixer1    = 0.0;
	parameter real L_lmixer2    = 0.0;
	parameter real L_lmixer3    = 0.0;
	parameter real L_rvolume_n0 = 0.0;
	parameter real L_rvolume_n1 = 0.0;
	parameter real L_rvolume_n2 = 0.0;
	parameter real L_lvolume_n0 = 0.0;
	parameter real L_lvolume_n1 = 0.0;
	parameter real L_lvolume_n2 = 0.0;
	parameter real L_rout       = 0.0;
	parameter real L_lout       = 0.0;
	parameter real L_vin        = 0.0;

	parameter real W_gate_ch1_0      =  78*L_unit;
	parameter real W_gate_ch1_1      =  78*L_unit;
	parameter real W_gate_ch1_2      =  78*L_unit;
	parameter real W_gate_ch1_3      =  78*L_unit;
	parameter real W_gate_ch2_0      =  78*L_unit;
	parameter real W_gate_ch2_1      =  78*L_unit;
	parameter real W_gate_ch2_2      =  78*L_unit;
	parameter real W_gate_ch2_3      =  78*L_unit;
	parameter real W_gate_ch3_0      =  78*L_unit;
	parameter real W_gate_ch3_1      =  78*L_unit;
	parameter real W_gate_ch3_2      =  78*L_unit;
	parameter real W_gate_ch3_3      =  78*L_unit;
	parameter real W_gate_ch4_0      =  78*L_unit;
	parameter real W_gate_ch4_1      =  78*L_unit;
	parameter real W_gate_ch4_2      =  78*L_unit;
	parameter real W_gate_ch4_3      =  78*L_unit;
	parameter real W_gate_ena        = 562*L_unit;
	parameter real W_gate_ena_n      =  32*L_unit;
	parameter real W_gate_ch1_ena_n  =  22*L_unit;
	parameter real W_gate_ch2_ena_n  =  22*L_unit;
	parameter real W_gate_ch3_ena_n  =  22*L_unit;
	parameter real W_gate_ch4_ena_n  =  22*L_unit;
	parameter real W_gate_r_vin_ena  =  80*L_unit;
	parameter real W_gate_rmixer0    =  80*L_unit;
	parameter real W_gate_rmixer1    =  80*L_unit;
	parameter real W_gate_rmixer2    =  80*L_unit;
	parameter real W_gate_rmixer3    =  80*L_unit;
	parameter real W_gate_l_vin_ena  =  80*L_unit;
	parameter real W_gate_lmixer0    =  80*L_unit;
	parameter real W_gate_lmixer1    =  80*L_unit;
	parameter real W_gate_lmixer2    =  80*L_unit;
	parameter real W_gate_lmixer3    =  80*L_unit;
	parameter real W_gate_rvolume_n0 = 576*L_unit;
	parameter real W_gate_rvolume_n1 = 296*L_unit;
	parameter real W_gate_rvolume_n2 = 156*L_unit;
	parameter real W_gate_lvolume_n0 = 576*L_unit;
	parameter real W_gate_lvolume_n1 = 296*L_unit;
	parameter real W_gate_lvolume_n2 = 156*L_unit;
	parameter real W_gate_vin        = 0;

endpackage

module dmg_audio #(
		parameter real L_rout      = dmg_audio_param::L_rout,
		parameter real L_lout      = dmg_audio_param::L_lout,
		parameter real W_gate_rout = 0,
		parameter real W_gate_lout = 0
	) (
		input  logic [3:0] ch1, ch2, ch3, ch4,
		input  logic       ena, ena_n, ch1_ena_n, ch2_ena_n, ch3_ena_n, ch4_ena_n,
		input  logic       r_vin_ena, rmixer0, rmixer1, rmixer2, rmixer3,
		input  logic       l_vin_ena, lmixer0, lmixer1, lmixer2, lmixer3,
		input  logic [2:0] rvolume_n, lvolume_n,
		output real        rout, lout,
		input  real        vin
	);

	logic [3:0] ch1_dl, ch2_dl, ch3_dl, ch4_dl;
	logic       ena_dl;
	logic       rmix_ena1_dl, rmix_ena2_dl, rmix_ena3_dl, rmix_ena4_dl, rmix_ena5_dl;
	logic       lmix_ena1_dl, lmix_ena2_dl, lmix_ena3_dl, lmix_ena4_dl, lmix_ena5_dl;
	logic [3:0] rvol_dl, lvol_dl;

	real ch1_out, ch2_out, ch3_out, ch4_out;
	real radj, ladj;

	// Add a quarter cycle delay to prevent glitches from signal delay differences within vectors.
	realtime dl = dmg_timing::nodelay ? 0 : 60ns;
	assign #dl ch1_dl       = ch1;
	assign #dl ch2_dl       = ch2;
	assign #dl ch3_dl       = ch3;
	assign #dl ch4_dl       = ch4;
	assign #dl ena_dl       = ena & !ena_n;
	assign #dl rmix_ena1_dl = rmixer3 & !ch4_ena_n & ena & !ena_n;
	assign #dl rmix_ena2_dl = rmixer2 & !ch3_ena_n & ena & !ena_n;
	assign #dl rmix_ena3_dl = rmixer1 & !ch2_ena_n & ena & !ena_n;
	assign #dl rmix_ena4_dl = rmixer0 & !ch1_ena_n & ena & !ena_n;
	assign #dl rmix_ena5_dl = r_vin_ena & ena & !ena_n;
	assign #dl lmix_ena1_dl = lmixer3 & !ch4_ena_n & ena & !ena_n;
	assign #dl lmix_ena2_dl = lmixer2 & !ch3_ena_n & ena & !ena_n;
	assign #dl lmix_ena3_dl = lmixer1 & !ch2_ena_n & ena & !ena_n;
	assign #dl lmix_ena4_dl = lmixer0 & !ch1_ena_n & ena & !ena_n;
	assign #dl lmix_ena5_dl = l_vin_ena & ena & !ena_n;
	assign #dl rvol_dl      = 3'(~rvolume_n) + 1;
	assign #dl lvol_dl      = 3'(~lvolume_n) + 1;

	// DACs generate voltages between 0.7V and 3.7V in 0.2V steps.
	assign ch1_out = $itor(ch1_dl) / 5.0 + 0.7;
	assign ch2_out = $itor(ch2_dl) / 5.0 + 0.7;
	assign ch3_out = $itor(ch3_dl) / 5.0 + 0.7;
	assign ch4_out = $itor(ch4_dl) / 5.0 + 0.7;

	// Mixing and volume adjustment is inverting and scaling at 2.2V midpoint.
	// Resistors in mixer are four times the size of the rheostat's maximum resistance, hence multiply by 0.25.
	assign radj = ((rmix_ena1_dl ? ch4_out - 2.2 : 0.0) * 0.25 +
	               (rmix_ena2_dl ? ch3_out - 2.2 : 0.0) * 0.25 +
	               (rmix_ena3_dl ? ch2_out - 2.2 : 0.0) * 0.25 +
	               (rmix_ena4_dl ? ch1_out - 2.2 : 0.0) * 0.25 +
	               (rmix_ena5_dl ? vin     - 2.2 : 0.0) * 0.25) * -($itor(rvol_dl) / 8.0) + 2.2;
	assign ladj = ((lmix_ena1_dl ? ch4_out - 2.2 : 0.0) * 0.25 +
	               (lmix_ena2_dl ? ch3_out - 2.2 : 0.0) * 0.25 +
	               (lmix_ena3_dl ? ch2_out - 2.2 : 0.0) * 0.25 +
	               (lmix_ena4_dl ? ch1_out - 2.2 : 0.0) * 0.25 +
	               (lmix_ena5_dl ? vin     - 2.2 : 0.0) * 0.25) * -($itor(lvol_dl) / 8.0) + 2.2;

	// Output is capped at 0.3V and 4.3V.
	assign rout = ena_dl ? ((radj > 4.3) ? 4.3 : ((radj < 0.3) ? 0.3 : radj)) : 2.2;
	assign lout = ena_dl ? ((ladj > 4.3) ? 4.3 : ((ladj < 0.3) ? 0.3 : ladj)) : 2.2;

endmodule

`default_nettype wire
