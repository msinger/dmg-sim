`default_nettype none
`timescale 1ns/100ps

module dff_test;

	parameter T = 100;

	reg  d, c;
	wire q;

	initial begin
		$dumpfile("dff_test.vcd");
		$dumpvars(0, dff_test);

		d = 0;
		c = 0;
	end

	always begin
		#T c = 1;
		#T c = 0;
		#T d = 1;
		#T c = 1;
		#T c = 0;
		#T c = 1;
		#T d = 0;
		#T c = 0;
		#T c = 1;
		#T c = 0;

		$finish;
	end

	dff dff0(d, c, q);

endmodule

module dlatch(d, e, q);

	parameter T_NAND = 2;

	input  wire d, e;
	output wire q;

	wire nand0, nand1, nand2, nand3;

	assign #T_NAND nand0 = !(d && e);
	assign #T_NAND nand1 = !(nand0 && e);
	assign #T_NAND nand2 = !(nand0 && nand3);
	assign #T_NAND nand3 = !(nand2 && nand1);

	assign q = nand2;

endmodule

module dff(d, c, q);

	parameter T_INV = 2;

	input  wire d, c;
	output wire q;

	wire inv0, inv1, w;

	dlatch dlatch0(d, inv0, w);
	dlatch dlatch1(w, inv1, q);

	assign #T_INV inv0 = !c;
	assign #T_INV inv1 = !inv0;

endmodule
