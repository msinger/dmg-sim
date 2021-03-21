all: clk.vcd

.PHONY: all

%: %.v
	iverilog -o $@ $^

%.vcd: %
	./$<
