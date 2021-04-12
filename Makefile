all: dmg.vcd

.PHONY: all

%: %.v
	iverilog -g2012 -o $@ $^

%.vcd: %
	./$<

dmg.vcd: dmg
