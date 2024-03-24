`timescale 1ns/1ns
`default_nettype none

module vid_dump(
		input int   t,
		input logic cpg, cp, cpl, fr, st, s,
		input logic ld0, ld1
	);

	task automatic video_dump_loop(input int f);
		bit [1:0] line[0:159];
		int       pxidx, lineidx;
		bit       dis;

		pxidx   = 0;
		lineidx = 0;
		dis     = 1;

		forever fork :video_event
			begin
				@(posedge s);
				lineidx = 0;
				/* Vertical sync:
				 *   4 byte little endian timestamp + "V" */
				$fwrite(f, "%c%c%c%cV", t[7:0], t[15:8], t[23:16], t[31:24]);
				disable video_event;
			end

			begin
				@(negedge cp);
				if (pxidx < 160) /* Still space in line buffer? */
					line[pxidx] = { ld1, ld0 };
				if (pxidx < 161)
					pxidx++;
				if (st) /* Horizontal sync active at pixel clock edge? */
					pxidx = 0;
				disable video_event;
			end

			begin :video_latch
				int  j;
				byte pxout;
				@(posedge cpl);
				if (pxidx < 160) /* Still space in line buffer? */
					line[pxidx] = { ld1, ld0 };
				if (pxidx < 161)
					pxidx++;
				if (dis || lineidx >= 144)
					disable video_event;
				/* Latch line:
				 *   4 byte little endian timestamp + "L" + 40 bytes pixel data
				 *  or
				 *   4 byte little endian timestamp + "l" + 40 bytes pixel data
				 *  depending on current direction */
				if (fr)
					$fwrite(f, "%c%c%c%cL", t[7:0], t[15:8], t[23:16], t[31:24]);
				else
					$fwrite(f, "%c%c%c%cl", t[7:0], t[15:8], t[23:16], t[31:24]);
				j     = 0;
				pxout = 0;
				for (int i = 0; i < 160; i++) begin
					if (pxidx)
						pxout = (pxout & ~(3 << ((i & 3) * 2))) | (line[j] << ((i & 3) * 2));
					j++;
					if (j >= pxidx) /* Repeat available pixels if less than 160 are in buffer */
						j = 0;
					if (&i[1:0])
						$fwrite(f, "%c", pxout);
				end
				lineidx++;
				disable video_event;
			end

			begin
				@(negedge cpl);
				if (!cpg && !dis) begin
					/* Disable display:
					 *   4 byte little endian timestamp + "D" */
					$fwrite(f, "%c%c%c%cD", t[7:0], t[15:8], t[23:16], t[31:24]);
					dis = 1;
				end else if (cpg && dis) begin
					/* Enable display:
					 *   4 byte little endian timestamp + "E" */
					$fwrite(f, "%c%c%c%cE", t[7:0], t[15:8], t[23:16], t[31:24]);
					dis = 0;
				end
			end
		join
	endtask

endmodule

