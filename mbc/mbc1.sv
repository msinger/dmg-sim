`timescale 1ns/1ns
`default_nettype none

module mbc1(
		input  logic         nrst,
		input  logic [15:13] a,
		input  logic [4:0]   d,
		input  logic         nrd,
		input  logic         nwr,
		input  logic         ncs,

		output logic [18:14] ra,
		output logic [14:13] aa,
		output logic         ncs_rom,
		output logic         ncs_ram,
		output logic         cs_ram
	);

	logic       ena;
	logic [4:0] rom_bank;
	logic [1:0] ram_bank;
	logic       mode;

	always_ff @(negedge nwr, negedge nrst) begin
		if (!nrst) begin
			ena      <= 0;
			rom_bank <= 0;
			ram_bank <= 0;
			mode     <= 0;
		end else unique0 case (a)
			0: ena      <= d[3:0] == 'ha;
			1: rom_bank <= d;
			2: ram_bank <= d[1:0];
			3: mode     <= d[0];
		endcase
	end

	assign ncs_rom = !(!nrst || (!a[15] && !nrd));
	assign ncs_ram = !(ena && !ncs && !a[14]);
	assign cs_ram  = !ncs_ram;

	always_comb priority case (1)
		!nrst, !a[14]: ra = 0;
		!rom_bank:     ra = 1;
		default:       ra = rom_bank;
	endcase

	always_comb priority case (1)
		mode, a[14]: aa = ram_bank;
		default:     aa = 0;
	endcase

endmodule
