`default_nettype none

module keeper #(parameter int N = 1) (inout tri logic [N-1:0] n);

	logic [N-1:0] cap;
	always @(n) for (int i = 0; i < N; i++) if (n[i] !== 'z) cap[i] <= n[i];
	assign (weak1, weak0) n = cap;

endmodule

`default_nettype wire
