`default_nettype none

package dmg_full_add_param;

	parameter real L_a    = 196.4;
	parameter real L_b    = 188.7;
	parameter real L_cin  = 196.4;
	parameter real L_sum  = dmg_xor_param::L_y;
	parameter real L_cout = dmg_nand2_param::L_y;

	parameter real W_gate_a   = dmg_nand2_param::W_gate_in2 + dmg_xor_param::W_gate_in1;
	parameter real W_gate_b   = dmg_nand2_param::W_gate_in1 + dmg_xor_param::W_gate_in2;
	parameter real W_gate_cin = dmg_nand2_param::W_gate_in1 + dmg_xor_param::W_gate_in2;

endpackage

module dmg_full_add #(
		parameter real L_sum       = 54 + dmg_full_add_param::L_sum,
		parameter real L_cout      = 54 + dmg_full_add_param::L_cout,
		parameter real W_gate_sum  = 0,
		parameter real W_gate_cout = 0
	) (
		input  logic a, b, cin,
		output logic sum, cout
	);

	logic axb, ab, caxb;

	dmg_xor   #(.L_y(L_sum),  .W_gate_y(W_gate_sum))                  xor_sum_inst   (.y(sum),  .in1(axb),  .in2(cin));
	dmg_nand2 #(.L_y(120),    .W_gate_y(dmg_nand2_param::W_gate_in1)) nand2_caxb_inst(.y(caxb), .in1(cin),  .in2(axb));
	dmg_nand2 #(.L_y(L_cout), .W_gate_y(W_gate_cout))                 nand2_cout_inst(.y(cout), .in1(caxb), .in2(ab));
	dmg_nand2 #(.L_y(119),    .W_gate_y(dmg_nand2_param::W_gate_in2)) nand2_ab_inst  (.y(ab),   .in1(b),    .in2(a));
	dmg_xor   #(.L_y(296),    .W_gate_y(dmg_nand2_param::W_gate_in2 +
	                                    dmg_xor_param::W_gate_in1))   xor_axb_inst   (.y(axb),  .in1(a),    .in2(b));

endmodule

`default_nettype wire
