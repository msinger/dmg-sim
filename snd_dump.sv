`timescale 1ns/1ns
`default_nettype none

package snd_dump;

	task automatic write_header(input int f, samplerate, channels, bit bit16);
		$fwrite(f, ".snd");
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'd32);
		$fwrite(f, "%c%c%c%c", 8'hff, 8'hff, 8'hff, 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, bit16 ? 8'h03 : 8'h02);
		$fwrite(f, "%c", (samplerate >> 24) & 8'hff);
		$fwrite(f, "%c", (samplerate >> 16) & 8'hff);
		$fwrite(f, "%c", (samplerate >> 8) & 8'hff);
		$fwrite(f, "%c", samplerate & 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, channels & 8'hff);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'h00);
		$fwrite(f, "%c%c%c%c", 8'h00, 8'h00, 8'h00, 8'h00);
	endtask

	task automatic write_bit4_as_int8(input int f, bit [3:0] s);
		$fwrite(f, "%c", { 1'b0, s, 3'b0 });
	endtask

	task automatic write_real_as_int16(input int f, real s);
		int tmp;
		tmp = $rtoi(s * 32767.0);
		$fwrite(f, "%c%c", { 1'b0, tmp[14:8] }, tmp[7:0]);
	endtask

endpackage

