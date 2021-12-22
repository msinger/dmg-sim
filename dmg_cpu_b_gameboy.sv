`default_nettype none

module dmg_cpu_b_gameboy;

	logic           clk;
	logic           reset;
	logic           ncyc;

	logic [15:0]    adr;
	logic [7:0]     din, dout;
	logic           rd;
	logic           wr;

	logic [7:0]     irq;
	logic [7:0]     iack;

	sm83 cpu(.*);

	initial clk   <= 0;
	initial reset <= 1;
	initial ncyc  <= 0;
	initial din   <= 0;

	task cyc;
		#122ns clk <= 0;
		#122ns clk <= 1;
	endtask

	task mcyc;
		ncyc = 1;
		cyc;
		ncyc = 0;
		cyc;
		cyc;
		cyc;
	endtask

	assign irq = 0;

	program test;
		initial begin
			$dumpfile("dmg_cpu_b_gameboy.vcd");
			$dumpvars(0, dmg_cpu_b_gameboy);

			din <= 0;
			reset <= 1;
			mcyc;
			reset <= 0;
			din <= 0;
			mcyc;
			mcyc;
			din <= 'h3e;
			mcyc;
			din <= 'h01;
			mcyc;
			din <= 'h2e;
			mcyc;
			din <= 'h01;
			mcyc;
			din <= 'h85;
			mcyc;
			din <= 0;
			mcyc;
			mcyc;
		end
	endprogram

endmodule

