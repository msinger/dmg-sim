`default_nettype none

package dmg_boot_rom_param;

	import dmg_timing::L_unit;

	parameter real L_d0       = 68.3;
	parameter real L_d1       = 68.3;
	parameter real L_d2       = 68.3;
	parameter real L_d3       = 68.3;
	parameter real L_d4       = 68.3;
	parameter real L_d5       = 68.3;
	parameter real L_d6       = 68.3;
	parameter real L_d7       = 68.3;
	parameter real L_row0_n   =  0.0;
	parameter real L_row1_n   =  0.0;
	parameter real L_row2_n   =  0.0;
	parameter real L_row3_n   =  0.0;
	parameter real L_col0     =  0.0;
	parameter real L_col1     =  0.0;
	parameter real L_col2     =  0.0;
	parameter real L_col3     =  0.0;
	parameter real L_a2       =  0.0;
	parameter real L_a3       =  0.0;
	parameter real L_a6       =  0.0;
	parameter real L_a7       =  0.0;
	parameter real L_a2_n     =  0.0;
	parameter real L_a3_n     =  0.0;
	parameter real L_a6_n     =  0.0;
	parameter real L_a7_n     =  0.0;
	parameter real L_oe       =  0.0;
	parameter real L_oe_n     =  0.0;
	parameter real L_bl_pch_n =  0.0;
	parameter real L_wl_pch   =  0.0;
	parameter real L_wl_ena_n =  0.0;

	parameter real W_gate_row0_n   =  180*L_unit;
	parameter real W_gate_row1_n   =  180*L_unit;
	parameter real W_gate_row2_n   =  180*L_unit;
	parameter real W_gate_row3_n   =  180*L_unit;
	parameter real W_gate_col0     =  432*L_unit;
	parameter real W_gate_col1     =  432*L_unit;
	parameter real W_gate_col2     =  432*L_unit;
	parameter real W_gate_col3     =  432*L_unit;
	parameter real W_gate_a2       =   76*L_unit;
	parameter real W_gate_a3       =   81*L_unit;
	parameter real W_gate_a6       =  544*L_unit;
	parameter real W_gate_a7       =  600*L_unit;
	parameter real W_gate_a2_n     =   76*L_unit;
	parameter real W_gate_a3_n     =   81*L_unit;
	parameter real W_gate_a6_n     =  544*L_unit;
	parameter real W_gate_a7_n     =  600*L_unit;
	parameter real W_gate_oe       =  800*L_unit;
	parameter real W_gate_oe_n     = 1088*L_unit;
	parameter real W_gate_bl_pch_n =  200*L_unit;
	parameter real W_gate_wl_pch   =  112*L_unit;
	parameter real W_gate_wl_ena_n =  163*L_unit;

endpackage

module dmg_boot_rom #(
		parameter real L_d0      = dmg_boot_rom_param::L_d0,
		parameter real L_d1      = dmg_boot_rom_param::L_d1,
		parameter real L_d2      = dmg_boot_rom_param::L_d2,
		parameter real L_d3      = dmg_boot_rom_param::L_d3,
		parameter real L_d4      = dmg_boot_rom_param::L_d4,
		parameter real L_d5      = dmg_boot_rom_param::L_d5,
		parameter real L_d6      = dmg_boot_rom_param::L_d6,
		parameter real L_d7      = dmg_boot_rom_param::L_d7,
		parameter real W_gate_d0 = 0,
		parameter real W_gate_d1 = 0,
		parameter real W_gate_d2 = 0,
		parameter real W_gate_d3 = 0,
		parameter real W_gate_d4 = 0,
		parameter real W_gate_d5 = 0,
		parameter real W_gate_d6 = 0,
		parameter real W_gate_d7 = 0
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

	localparam realtime T_rise_d0 = tpd_elmore(L_d0, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d0));
	localparam realtime T_fall_d0 = tpd_elmore(L_d0, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d0));
	localparam realtime T_rise_d1 = tpd_elmore(L_d1, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d1));
	localparam realtime T_fall_d1 = tpd_elmore(L_d1, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d1));
	localparam realtime T_rise_d2 = tpd_elmore(L_d2, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d2));
	localparam realtime T_fall_d2 = tpd_elmore(L_d2, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d2));
	localparam realtime T_rise_d3 = tpd_elmore(L_d3, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d3));
	localparam realtime T_fall_d3 = tpd_elmore(L_d3, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d3));
	localparam realtime T_rise_d4 = tpd_elmore(L_d4, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d4));
	localparam realtime T_fall_d4 = tpd_elmore(L_d4, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d4));
	localparam realtime T_rise_d5 = tpd_elmore(L_d5, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d5));
	localparam realtime T_fall_d5 = tpd_elmore(L_d5, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d5));
	localparam realtime T_rise_d6 = tpd_elmore(L_d6, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d6));
	localparam realtime T_fall_d6 = tpd_elmore(L_d6, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d6));
	localparam realtime T_rise_d7 = tpd_elmore(L_d7, 2*R_pmos_ohm(136*L_unit), C_gate_F(W_gate_d7));
	localparam realtime T_fall_d7 = tpd_elmore(L_d7, 2*R_nmos_ohm(100*L_unit), C_gate_F(W_gate_d7));
	bufif0 (strong1, highz0) #(T_rise_d0, T_fall_d0) (d0, bl_data[0], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d0, T_fall_d0) (d0, bl_data[0], oe);
	bufif0 (strong1, highz0) #(T_rise_d1, T_fall_d1) (d1, bl_data[1], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d1, T_fall_d1) (d1, bl_data[1], oe);
	bufif0 (strong1, highz0) #(T_rise_d2, T_fall_d2) (d2, bl_data[2], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d2, T_fall_d2) (d2, bl_data[2], oe);
	bufif0 (strong1, highz0) #(T_rise_d3, T_fall_d3) (d3, bl_data[3], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d3, T_fall_d3) (d3, bl_data[3], oe);
	bufif0 (strong1, highz0) #(T_rise_d4, T_fall_d4) (d4, bl_data[4], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d4, T_fall_d4) (d4, bl_data[4], oe);
	bufif0 (strong1, highz0) #(T_rise_d5, T_fall_d5) (d5, bl_data[5], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d5, T_fall_d5) (d5, bl_data[5], oe);
	bufif0 (strong1, highz0) #(T_rise_d6, T_fall_d6) (d6, bl_data[6], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d6, T_fall_d6) (d6, bl_data[6], oe);
	bufif0 (strong1, highz0) #(T_rise_d7, T_fall_d7) (d7, bl_data[7], oe_n);
	bufif1 (highz1, strong0) #(T_rise_d7, T_fall_d7) (d7, bl_data[7], oe);

endmodule

`default_nettype wire
