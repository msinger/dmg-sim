`default_nettype none

package dmg_tie_param;

	import dmg_timing::L_unit;

	parameter real L_gnd = 0.0;
	parameter real L_vdd = 0.0;

endpackage

module dmg_tie #(
		parameter real L_gnd      = dmg_tie_param::L_gnd,
		parameter real L_vdd      = dmg_tie_param::L_vdd,
		parameter real W_gate_gnd = 0,
		parameter real W_gate_vdd = 0
	) (
		output tri logic gnd, vdd
	);

	assign (supply1, supply0) gnd = 0;
	assign (supply1, supply0) vdd = 1;

endmodule

`default_nettype wire
