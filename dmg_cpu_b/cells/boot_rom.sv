`default_nettype none

module dmg_boot_rom #(
		parameter real L_d0 = 0,
		parameter real L_d1 = 0,
		parameter real L_d2 = 0,
		parameter real L_d3 = 0,
		parameter real L_d4 = 0,
		parameter real L_d5 = 0,
		parameter real L_d6 = 0,
		parameter real L_d7 = 0
	) (
		output tri logic d0, d1, d2, d3, d4, d5, d6, d7,
		input      logic row0_n, row1_n, row2_n, row3_n,
		input      logic col0, col1, col2, col3,
		input      logic a2, a3, a6, a7, a2_n, a3_n, a6_n, a7_n,
		input      logic oe, oe_n, bl_pch_n, wl_pch, wl_ena_n
	);

	import dmg_timing::*;

	logic [7:0] mem[256];
	logic [7:0] bl_data;
	int         last_wl_adr, wl_adr, cm_adr, row_adr, col_adr, adr;
	bit         wl_adr_valid;

	initial begin
		string bootrom_file;
		int f, _;

		bootrom_file = "";
		_ = $value$plusargs("BOOTROM=%s", bootrom_file);

		f = 0;
		if (bootrom_file != "") begin
			f = $fopen(bootrom_file, "rb");
			if (!f)
				$error("Failed to open boot ROM file %s for reading. Using all-zero boot ROM.", bootrom_file);
		end
		if (f) begin
			_ = $fread(mem, f);
			$fclose(f);
		end else
			foreach (mem[i]) mem[i] = '0;
	end

	initial bl_data       = '0;
	initial last_wl_adr   = -1;
	initial wl_adr_valid  = 0;

	assign wl_adr = (({ a3, a2 } == ~{ a3_n, a2_n }) && wl_adr_valid) ? { a3, a2, 2'b00 } : -1;
	assign cm_adr = ({ a7, a6 } == ~{ a7_n, a6_n }) ? { a7, a6, 6'b000000 } : -1;

	always_comb case ({ row3_n, row2_n, row1_n, row0_n })
		'b1110:  row_adr = 0;
		'b1101:  row_adr = 1;
		'b1011:  row_adr = 2;
		'b0111:  row_adr = 3;
		default: row_adr = -1;
	endcase

	always_comb case ({ col3, col2, col1, col0 })
		'b0001:  col_adr = 'h00;
		'b0010:  col_adr = 'h10;
		'b0100:  col_adr = 'h20;
		'b1000:  col_adr = 'h30;
		default: col_adr = -1;
	endcase

	assign adr = cm_adr | col_adr | wl_adr | row_adr;

	always_latch begin
		if (wl_pch) begin
			last_wl_adr  = -1;
			wl_adr_valid = 1;
		end else if (!wl_ena_n) begin
			if (last_wl_adr == -1 && wl_adr != -1)
				last_wl_adr = wl_adr;
			else if (wl_adr == -1 || last_wl_adr != wl_adr)
				wl_adr_valid = 0;
		end
	end

	always_latch begin
		if (!bl_pch_n)
			bl_data = '1;
		else
			bl_data &= (adr != -1) ? mem[adr] : 'x;
	end

	localparam realtime T_rise_d0 = tpd_elmore(L_d0, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d0 = tpd_elmore(L_d0, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d1 = tpd_elmore(L_d1, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d1 = tpd_elmore(L_d1, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d2 = tpd_elmore(L_d2, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d2 = tpd_elmore(L_d2, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d3 = tpd_elmore(L_d3, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d3 = tpd_elmore(L_d3, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d4 = tpd_elmore(L_d4, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d4 = tpd_elmore(L_d4, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d5 = tpd_elmore(L_d5, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d5 = tpd_elmore(L_d5, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d6 = tpd_elmore(L_d6, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d6 = tpd_elmore(L_d6, R_nmos_ohm(100*L_unit) * 2);
	localparam realtime T_rise_d7 = tpd_elmore(L_d7, R_pmos_ohm(136*L_unit) * 2);
	localparam realtime T_fall_d7 = tpd_elmore(L_d7, R_nmos_ohm(100*L_unit) * 2);
	bufif0 (strong1, highz0) #(T_rise_d0, 0) (d0, bl_data[0], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d0) (d0, bl_data[0], oe);
	bufif0 (strong1, highz0) #(T_rise_d1, 0) (d1, bl_data[1], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d1) (d1, bl_data[1], oe);
	bufif0 (strong1, highz0) #(T_rise_d2, 0) (d2, bl_data[2], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d2) (d2, bl_data[2], oe);
	bufif0 (strong1, highz0) #(T_rise_d3, 0) (d3, bl_data[3], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d3) (d3, bl_data[3], oe);
	bufif0 (strong1, highz0) #(T_rise_d4, 0) (d4, bl_data[4], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d4) (d4, bl_data[4], oe);
	bufif0 (strong1, highz0) #(T_rise_d5, 0) (d5, bl_data[5], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d5) (d5, bl_data[5], oe);
	bufif0 (strong1, highz0) #(T_rise_d6, 0) (d6, bl_data[6], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d6) (d6, bl_data[6], oe);
	bufif0 (strong1, highz0) #(T_rise_d7, 0) (d7, bl_data[7], oe_n);
	bufif1 (highz1, strong0) #(0, T_fall_d7) (d7, bl_data[7], oe);

endmodule

`default_nettype wire
