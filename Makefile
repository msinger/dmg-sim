all: dmg.vcd

.PHONY: all

%: %.v
	iverilog -o $@ $^

%.vcd: %
	./$<

dmg.vcd: dmg
dff_test.vcd: dff_test
