`default_nettype none

package dmg_half_add_param;

	parameter real L_a    = 0.0;
	parameter real L_b    = 0.0;
	parameter real L_sum  = 0.0;
	parameter real L_cout = 0.0;

	parameter real W_gate_a = dmg_and2_param::W_gate_in2 + dmg_xor_param::W_gate_in1;
	parameter real W_gate_b = dmg_and2_param::W_gate_in1 + dmg_xor_param::W_gate_in2;

endpackage

module dmg_half_add #(
		parameter real L_sum       = 54 + dmg_half_add_param::L_sum,
		parameter real L_cout      = 54 + dmg_half_add_param::L_cout,
		parameter real W_gate_sum  = 0,
		parameter real W_gate_cout = 0
	) (
		input  logic a, b,
		output logic sum, cout
	);

	dmg_and2 #(.L_y(L_cout), .W_gate_y(W_gate_cout)) and2_cout_inst(.y(cout), .in1(b), .in2(a));
	dmg_xor  #(.L_y(L_sum),  .W_gate_y(W_gate_sum))  xor_sum_inst  (.y(sum),  .in1(a), .in2(b));

endmodule

`default_nettype wire
