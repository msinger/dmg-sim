`default_nettype none

module dmg_full_add #(
		parameter real L_sum  = 54,
		parameter real L_cout = 54
	) (
		input  logic a, b, cin,
		output logic sum, cout
	);

	logic axb, ab, caxb;

	dmg_xor   #(.L_y(L_sum))  xor_sum_inst   (.y(sum),  .in1(axb), .in2(cin));
	dmg_nand2 #(.L_y(120))    nand2_caxb_inst(.y(caxb), .in1(cin), .in2(axb));
	dmg_nand2 #(.L_y(L_cout)) nand2_cout_inst(.y(cout), .in1(ab),  .in2(caxb));
	dmg_nand2 #(.L_y(119))    nand2_ab_inst  (.y(ab),   .in1(b),   .in2(a));
	dmg_xor   #(.L_y(296))    xor_axb_inst   (.y(axb),  .in1(a),   .in2(b));

endmodule

`default_nettype wire
