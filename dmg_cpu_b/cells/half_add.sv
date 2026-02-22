`default_nettype none

module dmg_half_add #(
		parameter real L_sum  = 54,
		parameter real L_cout = 54
	) (
		input  logic a, b,
		output logic sum, cout
	);

	dmg_and2 #(.L_y(L_cout)) and2_cout_inst(.y(cout), .in1(a), .in2(b));
	dmg_xor  #(.L_y(L_sum))  xor_sum_inst  (.y(sum),  .in1(a), .in2(b));

endmodule

`default_nettype wire
