`default_nettype none

module dmg_cpu_b_gameboy;

	logic        clk;
	logic        reset;
	logic        ncyc;

	logic [15:0] adr;
	logic [7:0]  din;
	logic [7:0]  dout;
	logic        lh;
	logic        p_rd, n_rd;
	logic        p_wr, n_wr;

	logic [7:0]  irq;
	logic [7:0]  iack;

	sm83 cpu(.*);

	initial begin
		$dumpfile("dmg_cpu_b_gameboy.vcd");
		$dumpvars(0, dmg_cpu_b_gameboy);

		$finish;
	end

endmodule

