`default_nettype none

module sm83_tie #(
		parameter real L_gnd = 0,
		parameter real L_vdd = 0
	) (
		output tri logic gnd, vdd
	);

	import sm83_timing::*;

	assign (supply1, supply0) gnd = 0;
	assign (supply1, supply0) vdd = 1;

endmodule

`default_nettype wire
