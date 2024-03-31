`timescale 1ns/1ns
`default_nettype none

module sm83_adr_inc(
		input  logic        clk, reset,

		input  logic [15:0] ain,
		output logic [15:0] aout,
		output logic [15:0] apin,

		input  logic        ctl_al_we, ctl_al_hi_ff,
		input  logic        ctl_inc_dec, ctl_inc_cy,
		input  logic        ctl_inc_oe
	);

	typedef logic [7:0] word_t;

	typedef struct packed {
		word_t hi;
		word_t lo;
	} adr_t;

	function automatic logic [2:0] inc2b(logic [1:0] din, dec,
	                                     logic       cy_in);
		logic [1:0] dout;
		logic       cy_out;
		dout[0] = din[0] != cy_in;
		dout[1] = din[1] != (cy_in && dec[0]);
		cy_out  = cy_in && &dec;
		inc2b   = { cy_out, dout };
	endfunction

	adr_t adr, al, bus, inc;

	assign bus  = ain;
	assign aout = al;
	assign apin = adr;

	always_ff @(negedge clk) case (1)
		ctl_al_we: al <= adr;
		reset:     al <= 0;
	endcase

	always_comb begin
		adr_t nadr;

		nadr = al;

		if (ctl_al_we) unique case (1)
			ctl_inc_oe:   nadr.hi = inc.hi;
			ctl_al_hi_ff: nadr.hi = 'hff;
			default:      nadr.hi = bus.hi;
		endcase

		if (ctl_al_we) unique case (1)
			ctl_inc_oe: nadr.lo = inc.lo;
			default:    nadr.lo = bus.lo;
		endcase

		adr = nadr;
	end

	always_comb begin
		adr_t        ninc;
		logic [14:0] dec;
		logic        cy, acc0, acc1, acc2;

		dec  = al ^ {15{ctl_inc_dec}};
		cy   = ctl_inc_cy;
		acc0 = &dec[6:0]   && cy;
		acc1 = &dec[11:7]  && acc0;
		acc2 = &dec[14:12] && acc1;

		{ cy, ninc[1:0] } = inc2b(al[1:0], dec[1:0], cy);
		{ cy, ninc[3:2] } = inc2b(al[3:2], dec[3:2], cy);
		{ cy, ninc[5:4] } = inc2b(al[5:4], dec[5:4], cy);
		ninc[6] = al[6] != cy;
		cy      = acc0;

		{ cy, ninc[8:7] }  = inc2b(al[8:7],  dec[8:7],  cy);
		{ cy, ninc[10:9] } = inc2b(al[10:9], dec[10:9], cy);
		ninc[11] = al[11] != cy;
		cy       = acc1;

		{ cy, ninc[13:12] } = inc2b(al[13:12], dec[13:12], cy);
		ninc[14] = al[14] != cy;
		cy       = acc2;

		ninc[15] = al[15] != cy;

		inc = ninc;
	end
endmodule
