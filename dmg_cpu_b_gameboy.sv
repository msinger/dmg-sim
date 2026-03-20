`default_nettype none

module dmg_cpu_b_gameboy;

	import snd_dump::write_header;
	import snd_dump::write_bit4_as_int8;
	import snd_dump::write_real_as_int16;
	vid_dump vdump(.*, .t(test.sample_idx));

	/* Clock (crystal) pins */
	logic xi, xo;

	/* External cartridge bus */
	logic            nreset;
	logic            phi;
	tri logic        nrd, nwr;
	logic            ncs;
	tri logic [15:0] a;
	tri logic [7:0]  d;

	/* External video bus */
	tri logic        nmrd, nmwr, nmcs;
	logic     [12:0] ma;
	tri logic [7:0]  md;

	/* Serial link port pins */
	logic     sout;
	tri logic sin;
	tri logic sck;

	/* Button pins */
	tri logic p10, p11, p12, p13;
	tri logic p14, p15;

	/* Display pins */
	logic cpg, cp, cpl, fr, st, s;
	logic [1:0] ld;

	/* Audio pins */
	real rout, lout;

	logic [7:0] video_ram[8192];
	logic [7:0] work_ram[8192];

	bit          has_rom, has_ram;
	bit          has_mbc1, has_mbc5;
	logic [7:0]  cart_rom[8388608];
	logic [7:0]  cart_ram[262144];
	logic [22:0] cart_rom_adr;
	logic [17:0] cart_ram_adr;
	logic        cart_rom_cs, cart_ram_cs;

	logic [18:14] mbc1_ra;
	logic [14:13] mbc1_aa;
	logic         mbc1_ncs_rom, mbc1_ncs_ram, mbc1_cs_ram;

	logic [22:14] mbc5_ra;
	logic [16:13] mbc5_aa;
	logic         mbc5_ncs_ram;

	logic clk;
	logic sys_reset;

	dmg_cpu_b dmg(
		.ck1_pad(xi),
		.ck2_pad(xo),

		.reset_n_pad(nreset),
		.phi_pad(phi),
		.rd_n_pad(nrd),
		.wr_n_pad(nwr),
		.cs_n_pad(ncs),
		.a_pad(a),
		.d_pad(d),
		.vin_pad(0.0),

		.mrd_n_pad(nmrd),
		.mwr_n_pad(nmwr),
		.mcs_n_pad(nmcs),
		.ma_pad(ma),
		.md_pad(md),

		.sout_pad(sout),
		.sin_pad(sin),
		.sck_pad(sck),

		.p10_pad(p10),
		.p11_pad(p11),
		.p12_pad(p12),
		.p13_pad(p13),
		.p14_pad(p14),
		.p15_pad(p15),

		.cpg_pad(cpg),
		.cp_pad(cp),
		.cpl_pad(cpl),
		.fr_pad(fr),
		.st_pad(st),
		.s_pad(s),
		.ld_pad(ld),

		.so1_pad(rout),
		.so2_pad(lout),

		.t1_pad('0),
		.t2_pad('0)
	);

	keeper #(16) a_keeper(a);
	keeper #(8)  d_keeper(d);
	keeper #(8)  md_keeper(md);
	keeper       nrd_keeper(nrd);
	keeper       nwr_keeper(nwr);
	keeper       nmrd_keeper(nmrd);
	keeper       nmwr_keeper(nmwr);
	keeper       nmcs_keeper(nmcs);

	task automatic xi_tick();
		/* Simulate the 4 MiHz crystal that is attached to the XI and XO pins */
		#122ns xi = xo;

		clk = xi;
	endtask

	task automatic cyc(input int num);
		if (xi)
			xi_tick();
		repeat (num * 2)
			xi_tick();
	endtask

	initial foreach (video_ram[i]) video_ram[i] = $random;
	/* VRAM write must be continous for Mooneye acceptance/ppu/lcdon_write_timing-GS test to pass. */
	always_latch if (!nmcs && !nmwr && !$isunknown(ma)) video_ram[ma] = $isunknown(md) ? $random : md;
	/* LH5164LN-10 datasheet says that /WE has precedence over /OE. */
	assign md = (!nmcs && !nmrd && nmwr) ? (!$isunknown(ma) ? video_ram[ma] : 'x) : 'z;

	initial foreach (work_ram[i]) work_ram[i] = $random;
	always_ff @(posedge nwr) if (!ncs && a[14] && !$isunknown(a[12:0])) work_ram[a[12:0]] <= $isunknown(d) ? $random : d;
	assign d = (!ncs && a[14] && !nrd && nwr) ? (!$isunknown(a[12:0]) ? work_ram[a[12:0]] : 'x) : 'z;

	assign d = (has_rom && cart_rom_cs && !nrd) ? (!$isunknown(cart_rom_adr) ? cart_rom[cart_rom_adr]: 'x) : 'z;
	initial foreach (cart_ram[i]) cart_ram[i] = '0;
	always_ff @(posedge nwr) if (has_ram && cart_ram_cs && !$isunknown(cart_ram_adr)) cart_ram[cart_ram_adr] <= $isunknown(d) ? $random : d;
	assign d = (has_ram && cart_ram_cs && !nrd && nwr) ? (!$isunknown(cart_ram_adr) ? cart_ram[cart_ram_adr] : 'x) : 'z;

	mbc1 mbc1_chip(
		.nrst(nreset),
		.a(a[15:13]),
		.d(d[4:0]),
		.nrd, .nwr, .ncs,
		.ra(mbc1_ra),
		.aa(mbc1_aa),
		.ncs_rom(mbc1_ncs_rom),
		.ncs_ram(mbc1_ncs_ram),
		.cs_ram(mbc1_cs_ram)
	);

	mbc5 mbc5_chip(
		.nrst(nreset),
		.a(a[15:12]),
		.d(d),
		.nwr, .ncs,
		.ra(mbc5_ra),
		.aa(mbc5_aa),
		.ncs_ram(mbc5_ncs_ram)
	);

	always_comb unique case (1)
		has_mbc1: begin
			cart_rom_adr = { mbc1_ra, a[13:0] };
			cart_ram_adr = { mbc1_aa, a[12:0] };
			cart_rom_cs  = !mbc1_ncs_rom;
			cart_ram_cs  = !mbc1_ncs_ram && mbc1_cs_ram;
		end

		has_mbc5: begin
			cart_rom_adr = { mbc5_ra, a[13:0] };
			cart_ram_adr = { mbc5_aa, a[12:0] };
			cart_rom_cs  = !a[15];
			cart_ram_cs  = !mbc5_ncs_ram;
		end

		default: begin
			cart_rom_adr = a[14:0];
			cart_ram_adr = a[12:0];
			cart_rom_cs  = !a[15];
			cart_ram_cs  = !ncs && a[13];
		end
	endcase

	initial begin
		string rom_file;
		int    f, _;
		byte   mbc_type, ram_size;
		bit    mbc_type_set, ram_size_set;

		has_rom  = 0;
		has_ram  = 0;
		has_mbc1 = 0;
		has_mbc5 = 0;

		rom_file = "";
		_ = $value$plusargs("ROM=%s", rom_file);

		mbc_type = 0;
		mbc_type_set = $value$plusargs("MBC_TYPE=%x", mbc_type);

		ram_size = 0;
		ram_size_set = $value$plusargs("RAM_SIZE=%x", ram_size);

		f = 0;
		if (rom_file != "") begin
			f = $fopen(rom_file, "rb");
			if (!f)
				$error("Failed to open cartridge ROM file %s for reading.", rom_file);
		end
		if (f) begin
			_ = $fread(cart_rom, f);
			$fclose(f);
			has_rom = 1;
		end

		if (!mbc_type_set && has_rom)
			mbc_type = cart_rom['h147];
		if (!ram_size_set && has_rom)
			ram_size = cart_rom['h149];

		unique case (mbc_type)
			'h00, 'h08, 'h09: ;
			'h01, 'h02, 'h03: has_mbc1 = 1;
			'h05, 'h06:       $error("MBC2 not supported yet.");
			'h0b, 'h0c, 'h0d: $error("MMM01 not supported yet.");
			'h0f, 'h10, 'h11,
			'h12, 'h13:       $error("MBC3 not supported yet.");
			'h19, 'h1a, 'h1b,
			'h1c, 'h1d, 'h1e: has_mbc5 = 1;
			'h20:             $error("MBC6 not supported yet.");
			'h22:             $error("MBC7 not supported yet.");
			'hfc:             $error("MAC-GBD not supported yet.");
			'hfd:             $error("TAMA5 not supported yet.");
			'hfe:             $error("HuC3 not supported yet.");
			'hff:             $error("HuC1 not supported yet.");
			default:          $error("Unsupported MBC type.");
		endcase

		has_ram = |ram_size;
	end

	logic [15:0] sm83_bc;
	assign sm83_bc[7:0]  = dmg.cpu_inst.reg_c;
	assign sm83_bc[15:8] = dmg.cpu_inst.reg_b;

	logic [15:0] sm83_de;
	assign sm83_de[7:0]  = dmg.cpu_inst.reg_e;
	assign sm83_de[15:8] = dmg.cpu_inst.reg_d;

	logic [15:0] sm83_hl;
	assign sm83_hl[7:0]  = dmg.cpu_inst.reg_l;
	assign sm83_hl[15:8] = dmg.cpu_inst.reg_h;

	logic [15:0] sm83_pc;
	assign sm83_pc[7:0]  = dmg.cpu_inst.reg_pcl;
	assign sm83_pc[15:8] = dmg.cpu_inst.reg_pch;

	logic [15:0] sm83_sp;
	assign sm83_sp[7:0]  = dmg.cpu_inst.reg_spl;
	assign sm83_sp[15:8] = dmg.cpu_inst.reg_sph;

	logic [15:0] sm83_wz;
	assign sm83_wz[7:0]  = dmg.cpu_inst.reg_z;
	assign sm83_wz[15:8] = dmg.cpu_inst.reg_w;

	logic [15:0] reg_div16;
	assign reg_div16[0]  = !dmg.ukup_n;
	assign reg_div16[1]  = !dmg.ufor_n;
	assign reg_div16[2]  = !dmg.uner_n;
	assign reg_div16[3]  = !dmg.tero_n;
	assign reg_div16[4]  = !dmg.unyk_n;
	assign reg_div16[5]  = !dmg.tama_n;
	assign reg_div16[6]  = !dmg.ugot_n;
	assign reg_div16[7]  = !dmg.tulu_n;
	assign reg_div16[8]  = !dmg.tugo_n;
	assign reg_div16[9]  = !dmg.tofe_n;
	assign reg_div16[10] = !dmg.teru_n;
	assign reg_div16[11] = !dmg.sola_n;
	assign reg_div16[12] = !dmg.subu_n;
	assign reg_div16[13] = !dmg.teka_n;
	assign reg_div16[14] = !dmg.uket_n;
	assign reg_div16[15] = !dmg.upof_n;

	logic [7:0] reg_ff00;
	assign reg_ff00[0]   = !dmg.kevu;
	assign reg_ff00[1]   = !dmg.kapa;
	assign reg_ff00[2]   = !dmg.keja;
	assign reg_ff00[3]   = !dmg.kolo;
	assign reg_ff00[4]   = !dmg.kely_n;
	assign reg_ff00[5]   = !dmg.cofy_n;
	assign reg_ff00[7:6] = '1;

	logic [7:0] reg_ff01;
	assign reg_ff01[0] = !dmg.cuba_n;
	assign reg_ff01[1] = !dmg.degu_n;
	assign reg_ff01[2] = !dmg.dyra_n;
	assign reg_ff01[3] = !dmg.dojo_n;
	assign reg_ff01[4] = !dmg.dovu_n;
	assign reg_ff01[5] = !dmg.ejab_n;
	assign reg_ff01[6] = !dmg.erod_n;
	assign reg_ff01[7] = !dmg.eder_n;

	logic [7:0] reg_ff02;
	assign reg_ff02[0]   = !dmg.culy_n;
	assign reg_ff02[6:1] = '1;
	assign reg_ff02[7]   = !dmg.sck_en_n;

	logic [7:0] reg_ff04;
	assign reg_ff04 = reg_div16[13:6];

	logic [7:0] reg_ff05;
	assign reg_ff05[0] = !dmg.rega_n;
	assign reg_ff05[1] = !dmg.povy_n;
	assign reg_ff05[2] = !dmg.peru_n;
	assign reg_ff05[3] = !dmg.rate_n;
	assign reg_ff05[4] = !dmg.ruby_n;
	assign reg_ff05[5] = !dmg.rage_n;
	assign reg_ff05[6] = !dmg.peda_n;
	assign reg_ff05[7] = !dmg.nuga_n;

	logic [7:0] reg_ff06;
	assign reg_ff06[0] = !dmg.sabu_n;
	assign reg_ff06[1] = !dmg.nyke_n;
	assign reg_ff06[2] = !dmg.muru_n;
	assign reg_ff06[3] = !dmg.tyva_n;
	assign reg_ff06[4] = !dmg.tyru_n;
	assign reg_ff06[5] = !dmg.sufy_n;
	assign reg_ff06[6] = !dmg.peto_n;
	assign reg_ff06[7] = !dmg.seta_n;

	logic [7:0] reg_ff07;
	assign reg_ff07[0]   = !dmg.sopu_n;
	assign reg_ff07[1]   = !dmg.samy_n;
	assign reg_ff07[2]   = !dmg.sabo_n;
	assign reg_ff07[7:3] = '1;

	logic [7:0] reg_ff0f;
	assign reg_ff0f[0]   = dmg.cpu_irq0;
	assign reg_ff0f[1]   = dmg.cpu_irq1;
	assign reg_ff0f[2]   = dmg.cpu_irq2;
	assign reg_ff0f[3]   = dmg.cpu_irq3;
	assign reg_ff0f[4]   = dmg.cpu_irq4;
	assign reg_ff0f[7:5] = '1;

	logic [7:0] reg_ff10, reg_ff10s;
	assign reg_ff10[0]  = !dmg.ff10_d0_n;
	assign reg_ff10[1]  = !dmg.ff10_d1_n;
	assign reg_ff10[2]  = !dmg.ff10_d2_n;
	assign reg_ff10[3]  = !dmg.ff10_d3_n;
	assign reg_ff10[4]  = !dmg.ff10_d4_n;
	assign reg_ff10[5]  = !dmg.ff10_d5_n;
	assign reg_ff10[6]  = !dmg.ff10_d6_n;
	assign reg_ff10[7]  = '1;
	assign reg_ff10s[0] = !dmg.copa;
	assign reg_ff10s[1] = !dmg.caja;
	assign reg_ff10s[2] = !dmg.byra;
	assign reg_ff10s[3] = reg_ff10[3];
	assign reg_ff10s[4] = !dmg.cupo;
	assign reg_ff10s[5] = !dmg.cypu;
	assign reg_ff10s[6] = !dmg.caxy;
	assign reg_ff10s[7] = reg_ff10[7];

	logic [7:0] reg_ff11;
	assign reg_ff11[0] = dmg.bacy;
	assign reg_ff11[1] = dmg.cavy;
	assign reg_ff11[2] = dmg.bovy;
	assign reg_ff11[3] = !dmg.cuno_n;
	assign reg_ff11[4] = dmg.cura;
	assign reg_ff11[5] = !dmg.ch1_len_timer_stop;
	assign reg_ff11[6] = !dmg.ff11_d6_n;
	assign reg_ff11[7] = !dmg.ff11_d7_n;

	logic [7:0] reg_ff12, reg_ff12s;
	assign reg_ff12[0]  = !dmg.ff12_d0_n;
	assign reg_ff12[1]  = !dmg.ff12_d1_n;
	assign reg_ff12[2]  = !dmg.ff12_d2_n;
	assign reg_ff12[3]  = !dmg.ff12_d3_n;
	assign reg_ff12[4]  = !dmg.jaty_n;
	assign reg_ff12[5]  = !dmg.jaxo_n;
	assign reg_ff12[6]  = !dmg.jena_n;
	assign reg_ff12[7]  = !dmg.jopu_n;
	assign reg_ff12s[0] = !dmg.jova;
	assign reg_ff12s[1] = !dmg.kenu;
	assign reg_ff12s[2] = !dmg.kera;
	assign reg_ff12s[3] = reg_ff12[3];
	assign reg_ff12s[4] = dmg.ch1_env0;
	assign reg_ff12s[5] = dmg.ch1_env1;
	assign reg_ff12s[6] = dmg.ch1_env2;
	assign reg_ff12s[7] = dmg.ch1_env3;

	logic [7:0] reg_ff13, reg_ff13s, reg_ff13t, reg_ff13u, reg_ff13v;
	assign reg_ff13[0]  = !dmg.gaxe_n;
	assign reg_ff13[1]  = !dmg.hyfe_n;
	assign reg_ff13[2]  = !dmg.jyty_n;
	assign reg_ff13[3]  = !dmg.kyna_n;
	assign reg_ff13[4]  = !dmg.jema_n;
	assign reg_ff13[5]  = !dmg.hyke_n;
	assign reg_ff13[6]  = !dmg.feva_n;
	assign reg_ff13[7]  = !dmg.ekov_n;
	assign reg_ff13s[0] = dmg.acc_d0;
	assign reg_ff13s[1] = dmg.acc_d1;
	assign reg_ff13s[2] = dmg.acc_d2;
	assign reg_ff13s[3] = dmg.acc_d3;
	assign reg_ff13s[4] = dmg.acc_d4;
	assign reg_ff13s[5] = dmg.acc_d5;
	assign reg_ff13s[6] = dmg.acc_d6;
	assign reg_ff13s[7] = dmg.acc_d7;
	assign reg_ff13t[0] = dmg.galo;
	assign reg_ff13t[1] = dmg.jode;
	assign reg_ff13t[2] = dmg.kare;
	assign reg_ff13t[3] = dmg.jyme;
	assign reg_ff13t[4] = dmg.gyme;
	assign reg_ff13t[5] = dmg.faxo;
	assign reg_ff13t[6] = dmg.exap;
	assign reg_ff13t[7] = dmg.dele;
	assign reg_ff13u[0] = dmg.fabu;
	assign reg_ff13u[1] = dmg.jefa;
	assign reg_ff13u[2] = dmg.goga;
	assign reg_ff13u[3] = dmg.jolu;
	assign reg_ff13u[4] = dmg.jota;
	assign reg_ff13u[5] = dmg.fude;
	assign reg_ff13u[6] = dmg.fedo;
	assign reg_ff13u[7] = dmg.exac;
	assign reg_ff13v[0] = dmg.hora;
	assign reg_ff13v[1] = dmg.hopa;
	assign reg_ff13v[2] = dmg.hele;
	assign reg_ff13v[3] = dmg.jape;
	assign reg_ff13v[4] = dmg.jete;
	assign reg_ff13v[5] = dmg.gele;
	assign reg_ff13v[6] = dmg.epyr;
	assign reg_ff13v[7] = dmg.edok;

	logic [7:0] reg_ff14, reg_ff14s, reg_ff14t, reg_ff14u, reg_ff14v;
	assign reg_ff14[0]    = !dmg.emus_n;
	assign reg_ff14[1]    = !dmg.evak_n;
	assign reg_ff14[2]    = !dmg.copu_n;
	assign reg_ff14[5:3]  = '1;
	assign reg_ff14[6]    = !dmg.ff14_d6_n;
	assign reg_ff14[7]    = dmg.dupe;
	assign reg_ff14s[0]   = dmg.acc_d8;
	assign reg_ff14s[1]   = dmg.acc_d9;
	assign reg_ff14s[2]   = dmg.acc_d10;
	assign reg_ff14s[6:3] = reg_ff14[6:3];
	assign reg_ff14s[7]   = dmg.ch1_start;
	assign reg_ff14t[0]   = dmg.dexe;
	assign reg_ff14t[1]   = dmg.dofy;
	assign reg_ff14t[2]   = dmg.doly;
	assign reg_ff14t[7:3] = reg_ff14[7:3];
	assign reg_ff14u[0]   = dmg.elux;
	assign reg_ff14u[1]   = dmg.agez;
	assign reg_ff14u[2]   = dmg.beku;
	assign reg_ff14u[7:3] = reg_ff14[7:3];
	assign reg_ff14v[0]   = dmg.defa;
	assign reg_ff14v[1]   = dmg.eter;
	assign reg_ff14v[2]   = dmg.deva;
	assign reg_ff14v[7:3] = reg_ff14[7:3];

	logic [7:0] reg_ff16;
	assign reg_ff16[0] = dmg.eryc;
	assign reg_ff16[1] = dmg.cera;
	assign reg_ff16[2] = dmg.conu;
	assign reg_ff16[3] = !dmg.came_n;
	assign reg_ff16[4] = dmg.buva;
	assign reg_ff16[5] = !dmg.ch2_len_timer_stop;
	assign reg_ff16[6] = !dmg.ff16_d6_n;
	assign reg_ff16[7] = !dmg.ff16_d7_n;

	logic [7:0] reg_ff17, reg_ff17s;
	assign reg_ff17[0]  = !dmg.ff17_d0_n;
	assign reg_ff17[1]  = !dmg.ff17_d1_n;
	assign reg_ff17[2]  = !dmg.ff17_d2_n;
	assign reg_ff17[3]  = !dmg.ff17_d3_n;
	assign reg_ff17[4]  = !dmg.gata_n;
	assign reg_ff17[5]  = !dmg.gufe_n;
	assign reg_ff17[6]  = !dmg.gura_n;
	assign reg_ff17[7]  = !dmg.gage_n;
	assign reg_ff17s[0] = !dmg.jore;
	assign reg_ff17s[1] = !dmg.jona;
	assign reg_ff17s[2] = !dmg.jevy;
	assign reg_ff17s[3] = reg_ff17[3];
	assign reg_ff17s[4] = dmg.ch2_env0;
	assign reg_ff17s[5] = dmg.ch2_env1;
	assign reg_ff17s[6] = dmg.ch2_env2;
	assign reg_ff17s[7] = dmg.ch2_env3;

	logic [7:0] reg_ff18, reg_ff18s;
	assign reg_ff18[0]  = dmg.fofe;
	assign reg_ff18[1]  = dmg.fova;
	assign reg_ff18[2]  = dmg.fedy;
	assign reg_ff18[3]  = dmg.fome;
	assign reg_ff18[4]  = dmg.fora;
	assign reg_ff18[5]  = dmg.goda;
	assign reg_ff18[6]  = dmg.gumy;
	assign reg_ff18[7]  = dmg.gupu;
	assign reg_ff18s[0] = !dmg.done_n;
	assign reg_ff18s[1] = !dmg.dynu_n;
	assign reg_ff18s[2] = !dmg.ezof_n;
	assign reg_ff18s[3] = !dmg.cyvo_n;
	assign reg_ff18s[4] = !dmg.fuxo_n;
	assign reg_ff18s[5] = !dmg.gano_n;
	assign reg_ff18s[6] = !dmg.goca_n;
	assign reg_ff18s[7] = !dmg.gane_n;

	logic [7:0] reg_ff19, reg_ff19s;
	assign reg_ff19[0]    = dmg.jefu;
	assign reg_ff19[1]    = dmg.jany;
	assign reg_ff19[2]    = dmg.jupy;
	assign reg_ff19[5:3]  = '1;
	assign reg_ff19[6]    = !dmg.ff19_d6_n;
	assign reg_ff19[7]    = dmg.etap;
	assign reg_ff19s[0]   = !dmg.hevy_n;
	assign reg_ff19s[1]   = !dmg.hepu_n;
	assign reg_ff19s[2]   = !dmg.hero_n;
	assign reg_ff19s[6:3] = reg_ff19[6:3];
	assign reg_ff19s[7]   = dmg.ch2_start;

	logic [7:0] reg_ff1a;
	assign reg_ff1a[6:0] = '1;
	assign reg_ff1a[7]   = dmg.guxe;

	logic [7:0] reg_ff1b;
	assign reg_ff1b[0] = dmg.gevo;
	assign reg_ff1b[1] = dmg.fory;
	assign reg_ff1b[2] = dmg.gatu;
	assign reg_ff1b[3] = !dmg.gapo_n;
	assign reg_ff1b[4] = dmg.gemo;
	assign reg_ff1b[5] = dmg.foro;
	assign reg_ff1b[6] = dmg.fave;
	assign reg_ff1b[7] = !dmg.ch3_len_timer_stop;

	logic [7:0] reg_ff1c;
	assign reg_ff1c[0] = !dmg.efar_n;
	assign reg_ff1c[1] = !dmg.erus_n;
	assign reg_ff1c[2] = !dmg.efuz_n;
	assign reg_ff1c[3] = !dmg.exel_n;
	assign reg_ff1c[4] = !dmg.efal_n;
	assign reg_ff1c[5] = !dmg.ff1c_d5_n;
	assign reg_ff1c[6] = !dmg.ff1c_d6_n;
	assign reg_ff1c[7] = '1;

	logic [7:0] reg_ff1d, reg_ff1ds;
	assign reg_ff1d[0]  = dmg.koga;
	assign reg_ff1d[1]  = dmg.jovy;
	assign reg_ff1d[2]  = dmg.jaxa;
	assign reg_ff1d[3]  = dmg.jefe;
	assign reg_ff1d[4]  = dmg.jypo;
	assign reg_ff1d[5]  = dmg.jove;
	assign reg_ff1d[6]  = dmg.kana;
	assign reg_ff1d[7]  = dmg.kogu;
	assign reg_ff1ds[0] = !dmg.kutu_n;
	assign reg_ff1ds[1] = !dmg.kupe_n;
	assign reg_ff1ds[2] = !dmg.kunu_n;
	assign reg_ff1ds[3] = !dmg.kemu_n;
	assign reg_ff1ds[4] = !dmg.kygu_n;
	assign reg_ff1ds[5] = !dmg.kepa_n;
	assign reg_ff1ds[6] = !dmg.kafo_n;
	assign reg_ff1ds[7] = !dmg.keno_n;

	logic [7:0] reg_ff1e, reg_ff1es;
	assign reg_ff1e[0]    = dmg.jemo;
	assign reg_ff1e[1]    = dmg.jety;
	assign reg_ff1e[2]    = dmg.jacy;
	assign reg_ff1e[5:3]  = '1;
	assign reg_ff1e[6]    = !dmg.ff1e_d6_n;
	assign reg_ff1e[7]    = dmg.gavu;
	assign reg_ff1es[0]   = !dmg.keju_n;
	assign reg_ff1es[1]   = !dmg.keza_n;
	assign reg_ff1es[2]   = !dmg.japu_n;
	assign reg_ff1es[7:3] = reg_ff1e[7:3];

	logic [7:0] reg_ff20;
	assign reg_ff20[0]   = dmg.dano;
	assign reg_ff20[1]   = dmg.favy;
	assign reg_ff20[2]   = dmg.dena;
	assign reg_ff20[3]   = !dmg.cedo_n;
	assign reg_ff20[4]   = dmg.fylo;
	assign reg_ff20[5]   = !dmg.ch4_len_timer_stop;
	assign reg_ff20[7:6] = '1;

	logic [7:0] reg_ff21, reg_ff21s;
	assign reg_ff21[0]  = !dmg.ff21_d0_n;
	assign reg_ff21[1]  = !dmg.ff21_d1_n;
	assign reg_ff21[2]  = !dmg.ff21_d2_n;
	assign reg_ff21[3]  = !dmg.ff21_d3_n;
	assign reg_ff21[4]  = !dmg.garu_n;
	assign reg_ff21[5]  = !dmg.goky_n;
	assign reg_ff21[6]  = !dmg.gozo_n;
	assign reg_ff21[7]  = !dmg.gedu_n;
	assign reg_ff21s[0] = !dmg.cuna;
	assign reg_ff21s[1] = !dmg.cofe;
	assign reg_ff21s[2] = !dmg.dogo;
	assign reg_ff21s[3] = reg_ff21[3];
	assign reg_ff21s[4] = dmg.ch4_env0;
	assign reg_ff21s[5] = dmg.ch4_env1;
	assign reg_ff21s[6] = dmg.ch4_env2;
	assign reg_ff21s[7] = dmg.ch4_env3;

	logic [7:0] reg_ff22, reg_ff22s;
	assign reg_ff22[0]    = !dmg.ff22_d0_n;
	assign reg_ff22[1]    = !dmg.ff22_d1_n;
	assign reg_ff22[2]    = !dmg.ff22_d2_n;
	assign reg_ff22[3]    = !dmg.ff22_d3_n;
	assign reg_ff22[4]    = !dmg.ff22_d4_n;
	assign reg_ff22[5]    = !dmg.ff22_d5_n;
	assign reg_ff22[6]    = !dmg.ff22_d6_n;
	assign reg_ff22[7]    = !dmg.gafo_n;
	assign reg_ff22s[0]   = !dmg.jyco;
	assign reg_ff22s[1]   = !dmg.jyre;
	assign reg_ff22s[2]   = !dmg.jyfu;
	assign reg_ff22s[7:3] = reg_ff22[7:3];

	logic [7:0] reg_ff23, reg_ff23s;
	assign reg_ff23[5:0]  = '1;
	assign reg_ff23[6]    = !dmg.ff23_d6_n;
	assign reg_ff23[7]    = dmg.hoga;
	assign reg_ff23s[6:0] = reg_ff23[6:0];
	assign reg_ff23s[7]   = dmg.ch4_start;

	logic [7:0] reg_ff24;
	assign reg_ff24[0] = !dmg.rvolume0_n;
	assign reg_ff24[1] = !dmg.rvolume1_n;
	assign reg_ff24[2] = !dmg.rvolume2_n;
	assign reg_ff24[3] = !dmg.apos_n;
	assign reg_ff24[4] = !dmg.lvolume0_n;
	assign reg_ff24[5] = !dmg.lvolume1_n;
	assign reg_ff24[6] = !dmg.lvolume2_n;
	assign reg_ff24[7] = !dmg.bedu_n;

	logic [7:0] reg_ff25;
	assign reg_ff25[0] = !dmg.anev_n;
	assign reg_ff25[1] = !dmg.bogu_n;
	assign reg_ff25[2] = !dmg.bafo_n;
	assign reg_ff25[3] = !dmg.atuf_n;
	assign reg_ff25[4] = !dmg.bume_n;
	assign reg_ff25[5] = !dmg.bofa_n;
	assign reg_ff25[6] = !dmg.befo_n;
	assign reg_ff25[7] = !dmg.bepu_n;

	logic [7:0] reg_ff26;
	assign reg_ff26[0] = !dmg.ch1_active_n;
	assign reg_ff26[1] = !dmg.ch2_active_n;
	assign reg_ff26[2] = !dmg.ch3_active_n;
	assign reg_ff26[3] = !dmg.ch4_active_n;
	assign reg_ff26[4] = !dmg.fero_n;
	assign reg_ff26[5] = dmg.bowy;
	assign reg_ff26[6] = '1;
	assign reg_ff26[7] = !dmg.hada_n;

	logic [7:0] reg_ff40;
	assign reg_ff40[0] = !dmg.vyxe_n;
	assign reg_ff40[1] = !dmg.xylo_n;
	assign reg_ff40[2] = !dmg.xymo_n;
	assign reg_ff40[3] = !dmg.xafo_n;
	assign reg_ff40[4] = !dmg.wexu_n;
	assign reg_ff40[5] = !dmg.wymo_n;
	assign reg_ff40[6] = !dmg.woky_n;
	assign reg_ff40[7] = !dmg.xona_n;

	logic [7:0] reg_ff41;
	assign reg_ff41[0] = !dmg.sadu;
	assign reg_ff41[1] = !dmg.xaty;
	assign reg_ff41[2] = !dmg.rupo_n;
	assign reg_ff41[3] = !dmg.roxe_n;
	assign reg_ff41[4] = !dmg.rufo_n;
	assign reg_ff41[5] = !dmg.refe_n;
	assign reg_ff41[6] = !dmg.rugu_n;
	assign reg_ff41[7] = '1;

	logic [7:0] reg_ff42;
	assign reg_ff42[0] = !dmg.gave_n;
	assign reg_ff42[1] = !dmg.fymo_n;
	assign reg_ff42[2] = !dmg.fezu_n;
	assign reg_ff42[3] = !dmg.fujo_n;
	assign reg_ff42[4] = !dmg.dede_n;
	assign reg_ff42[5] = !dmg.foty_n;
	assign reg_ff42[6] = !dmg.foha_n;
	assign reg_ff42[7] = !dmg.funy_n;

	logic [7:0] reg_ff43;
	assign reg_ff43[0] = !dmg.daty_n;
	assign reg_ff43[1] = !dmg.duzu_n;
	assign reg_ff43[2] = !dmg.cyxu_n;
	assign reg_ff43[3] = !dmg.gubo_n;
	assign reg_ff43[4] = !dmg.bemy_n;
	assign reg_ff43[5] = !dmg.cuzy_n;
	assign reg_ff43[6] = !dmg.cabu_n;
	assign reg_ff43[7] = !dmg.bake_n;

	logic [7:0] reg_ff44;
	assign reg_ff44[0] = dmg.v0;
	assign reg_ff44[1] = dmg.v1;
	assign reg_ff44[2] = dmg.v2;
	assign reg_ff44[3] = dmg.v3;
	assign reg_ff44[4] = dmg.v4;
	assign reg_ff44[5] = dmg.v5;
	assign reg_ff44[6] = dmg.v6;
	assign reg_ff44[7] = dmg.v7;

	logic [7:0] reg_ff45;
	assign reg_ff45[0] = !dmg.syry_n;
	assign reg_ff45[1] = !dmg.vuce_n;
	assign reg_ff45[2] = !dmg.sedy_n;
	assign reg_ff45[3] = !dmg.salo_n;
	assign reg_ff45[4] = !dmg.sota_n;
	assign reg_ff45[5] = !dmg.vafa_n;
	assign reg_ff45[6] = !dmg.vevo_n;
	assign reg_ff45[7] = !dmg.raha_n;

	logic [7:0] reg_ff46;
	assign reg_ff46[0] = !dmg.dma_a8_n;
	assign reg_ff46[1] = !dmg.dma_a9_n;
	assign reg_ff46[2] = !dmg.dma_a10_n;
	assign reg_ff46[3] = !dmg.dma_a11_n;
	assign reg_ff46[4] = !dmg.dma_a12_n;
	assign reg_ff46[5] = !dmg.dma_a13_n;
	assign reg_ff46[6] = !dmg.dma_a14_n;
	assign reg_ff46[7] = !dmg.dma_a15_n;

	logic [7:0] reg_ff47;
	assign reg_ff47[0] = !dmg.bgp_d0_n;
	assign reg_ff47[1] = !dmg.bgp_d1_n;
	assign reg_ff47[2] = !dmg.bgp_d2_n;
	assign reg_ff47[3] = !dmg.bgp_d3_n;
	assign reg_ff47[4] = !dmg.bgp_d4_n;
	assign reg_ff47[5] = !dmg.bgp_d5_n;
	assign reg_ff47[6] = !dmg.bgp_d6_n;
	assign reg_ff47[7] = !dmg.bgp_d7_n;

	logic [7:0] reg_ff48;
	assign reg_ff48[0] = !dmg.obp0_d0_n;
	assign reg_ff48[1] = !dmg.obp0_d1_n;
	assign reg_ff48[2] = !dmg.obp0_d2_n;
	assign reg_ff48[3] = !dmg.obp0_d3_n;
	assign reg_ff48[4] = !dmg.obp0_d4_n;
	assign reg_ff48[5] = !dmg.obp0_d5_n;
	assign reg_ff48[6] = !dmg.obp0_d6_n;
	assign reg_ff48[7] = !dmg.obp0_d7_n;

	logic [7:0] reg_ff49;
	assign reg_ff49[0] = !dmg.obp1_d0_n;
	assign reg_ff49[1] = !dmg.obp1_d1_n;
	assign reg_ff49[2] = !dmg.obp1_d2_n;
	assign reg_ff49[3] = !dmg.obp1_d3_n;
	assign reg_ff49[4] = !dmg.obp1_d4_n;
	assign reg_ff49[5] = !dmg.obp1_d5_n;
	assign reg_ff49[6] = !dmg.obp1_d6_n;
	assign reg_ff49[7] = !dmg.obp1_d7_n;

	logic [7:0] reg_ff50;
	assign reg_ff50[0]   = dmg.tepu;
	assign reg_ff50[7:1] = '1;

	logic [7:0] reg_ff60;
	assign reg_ff60[0]   = dmg.ff60_d0;
	assign reg_ff60[1]   = dmg.ff60_d1;
	assign reg_ff60[7:2] = '1;

	logic [6:0] reg_cpg_count;
	assign reg_cpg_count[0] = dmg.lcd_x0;
	assign reg_cpg_count[1] = dmg.lcd_x1;
	assign reg_cpg_count[2] = dmg.lcd_x2;
	assign reg_cpg_count[3] = dmg.lcd_x3;
	assign reg_cpg_count[4] = dmg.lcd_x4;
	assign reg_cpg_count[5] = dmg.lcd_x5;
	assign reg_cpg_count[6] = dmg.lcd_x6;

	logic [3:0] reg_oam_src;
	assign reg_oam_src[0] = dmg.bese;
	assign reg_oam_src[1] = dmg.cuxy;
	assign reg_oam_src[2] = dmg.bego;
	assign reg_oam_src[3] = dmg.dybe;

	logic [7:0] reg_obj_y_cmp;
	assign reg_obj_y_cmp[0] = dmg.xuso_n;
	assign reg_obj_y_cmp[1] = dmg.xegu_n;
	assign reg_obj_y_cmp[2] = dmg.yjex_n;
	assign reg_obj_y_cmp[3] = dmg.xyju_n;
	assign reg_obj_y_cmp[4] = dmg.ybog_n;
	assign reg_obj_y_cmp[5] = dmg.wyso_n;
	assign reg_obj_y_cmp[6] = dmg.xote_n;
	assign reg_obj_y_cmp[7] = dmg.yzab_n;

	/* Bits in OAM RAMs are stored inverted. OAM RAM A has its data line order reversed. */
	function automatic logic [7:0] oam_a_decode(int col, adr);
		logic [7:0] tmp;
`ifdef SIMPLIFIED_OAM
		tmp = dmg.oam_a_inst.sram_inst.mem[{ adr, col[1:0] }];
`else
		tmp = dmg.oam_a_inst.sram_inst.mem[col][adr];
`endif
		return ~{tmp[0], tmp[1], tmp[2], tmp[3], tmp[4], tmp[5], tmp[6], tmp[7]};
	endfunction
	function automatic logic [7:0] oam_b_decode(int col, adr);
`ifdef SIMPLIFIED_OAM
		return ~(dmg.oam_b_inst.sram_inst.mem[{ adr, col[1:0] }]);
`else
		return ~(dmg.oam_b_inst.sram_inst.mem[col][adr]);
`endif
	endfunction
	function automatic logic [31:0] oam_decode(int n);
		int adr;
		logic [7:0] b0, b1, b2, b3;
		adr = n / 2;
		b0 = oam_b_decode(n[0] ? 2 : 0, adr);
		b1 = oam_a_decode(n[0] ? 2 : 0, adr);
		b2 = oam_b_decode(n[0] ? 3 : 1, adr);
		b3 = oam_a_decode(n[0] ? 3 : 1, adr);
		return { b3, b2, b1, b0 };
	endfunction

	logic [31:0] obj0, obj1, obj2, obj3, obj4, obj5, obj6, obj7;
	always_comb begin
		obj0 = oam_decode(0);
		obj1 = oam_decode(1);
		obj2 = oam_decode(2);
		obj3 = oam_decode(3);
		obj4 = oam_decode(4);
		obj5 = oam_decode(5);
		obj6 = oam_decode(6);
		obj7 = oam_decode(7);
	end

	logic [3:0] reg_obj0y, reg_obj1y, reg_obj2y, reg_obj3y, reg_obj4y;
	logic [3:0] reg_obj5y, reg_obj6y, reg_obj7y, reg_obj8y, reg_obj9y;
	logic [5:0] reg_obj0i, reg_obj1i, reg_obj2i, reg_obj3i, reg_obj4i;
	logic [5:0] reg_obj5i, reg_obj6i, reg_obj7i, reg_obj8i, reg_obj9i;
	logic [7:0] reg_obj0x, reg_obj1x, reg_obj2x, reg_obj3x, reg_obj4x;
	logic [7:0] reg_obj5x, reg_obj6x, reg_obj7x, reg_obj8x, reg_obj9x;
	assign reg_obj8y[0] = !dmg.azap_n;
	assign reg_obj8y[1] = !dmg.afyx_n;
	assign reg_obj8y[2] = !dmg.afut_n;
	assign reg_obj8y[3] = !dmg.afym_n;
	assign reg_obj6y[0] = !dmg.zumy_n;
	assign reg_obj6y[1] = !dmg.zafu_n;
	assign reg_obj6y[2] = !dmg.zexo_n;
	assign reg_obj6y[3] = !dmg.zube_n;
	assign reg_obj4y[0] = !dmg.capo_n;
	assign reg_obj4y[1] = !dmg.caju_n;
	assign reg_obj4y[2] = !dmg.cono_n;
	assign reg_obj4y[3] = !dmg.cumu_n;
	assign reg_obj7y[0] = !dmg.xyna_n;
	assign reg_obj7y[1] = !dmg.ygum_n;
	assign reg_obj7y[2] = !dmg.xaku_n;
	assign reg_obj7y[3] = !dmg.xygo_n;
	assign reg_obj1y[0] = !dmg.ames_n;
	assign reg_obj1y[1] = !dmg.arof_n;
	assign reg_obj1y[2] = !dmg.abop_n;
	assign reg_obj1y[3] = !dmg.abug_n;
	assign reg_obj5y[0] = !dmg.acep_n;
	assign reg_obj5y[1] = !dmg.abeg_n;
	assign reg_obj5y[2] = !dmg.abux_n;
	assign reg_obj5y[3] = !dmg.aned_n;
	assign reg_obj3y[0] = !dmg.zuro_n;
	assign reg_obj3y[1] = !dmg.zylu_n;
	assign reg_obj3y[2] = !dmg.zene_n;
	assign reg_obj3y[3] = !dmg.zury_n;
	assign reg_obj2y[0] = !dmg.ylov_n;
	assign reg_obj2y[1] = !dmg.xosy_n;
	assign reg_obj2y[2] = !dmg.xazy_n;
	assign reg_obj2y[3] = !dmg.ykuk_n;
	assign reg_obj9y[0] = !dmg.cana_n;
	assign reg_obj9y[1] = !dmg.fofo_n;
	assign reg_obj9y[2] = !dmg.dysy_n;
	assign reg_obj9y[3] = !dmg.dewu_n;
	assign reg_obj0y[0] = !dmg.gyho_n;
	assign reg_obj0y[1] = !dmg.cufo_n;
	assign reg_obj0y[2] = !dmg.bozu_n;
	assign reg_obj0y[3] = !dmg.fyhy_n;
	assign reg_obj8i[0] = !dmg.byhe_n;
	assign reg_obj8i[1] = !dmg.bexy_n;
	assign reg_obj8i[2] = !dmg.bado_n;
	assign reg_obj8i[3] = !dmg.apev_n;
	assign reg_obj8i[4] = !dmg.bada_n;
	assign reg_obj8i[5] = !dmg.axuv_n;
	assign reg_obj6i[0] = !dmg.gabo_n;
	assign reg_obj6i[1] = !dmg.gacy_n;
	assign reg_obj6i[2] = !dmg.fogo_n;
	assign reg_obj6i[3] = !dmg.gohu_n;
	assign reg_obj6i[4] = !dmg.foxy_n;
	assign reg_obj6i[5] = !dmg.gecu_n;
	assign reg_obj4i[0] = !dmg.xave_n;
	assign reg_obj4i[1] = !dmg.xefe_n;
	assign reg_obj4i[2] = !dmg.wanu_n;
	assign reg_obj4i[3] = !dmg.xabo_n;
	assign reg_obj4i[4] = !dmg.xege_n;
	assign reg_obj4i[5] = !dmg.xynu_n;
	assign reg_obj7i[0] = !dmg.gule_n;
	assign reg_obj7i[1] = !dmg.gyno_n;
	assign reg_obj7i[2] = !dmg.fefa_n;
	assign reg_obj7i[3] = !dmg.fysu_n;
	assign reg_obj7i[4] = !dmg.gesy_n;
	assign reg_obj7i[5] = !dmg.fuzo_n;
	assign reg_obj1i[0] = !dmg.cadu_n;
	assign reg_obj1i[1] = !dmg.cebo_n;
	assign reg_obj1i[2] = !dmg.cufa_n;
	assign reg_obj1i[3] = !dmg.coma_n;
	assign reg_obj1i[4] = !dmg.cuza_n;
	assign reg_obj1i[5] = !dmg.cajy_n;
	assign reg_obj5i[0] = !dmg.ekop_n;
	assign reg_obj5i[1] = !dmg.etym_n;
	assign reg_obj5i[2] = !dmg.goru_n;
	assign reg_obj5i[3] = !dmg.ebex_n;
	assign reg_obj5i[4] = !dmg.etav_n;
	assign reg_obj5i[5] = !dmg.ekap_n;
	assign reg_obj3i[0] = !dmg.devy_n;
	assign reg_obj3i[1] = !dmg.dese_n;
	assign reg_obj3i[2] = !dmg.duny_n;
	assign reg_obj3i[3] = !dmg.duha_n;
	assign reg_obj3i[4] = !dmg.deba_n;
	assign reg_obj3i[5] = !dmg.dafu_n;
	assign reg_obj2i[0] = !dmg.buhe_n;
	assign reg_obj2i[1] = !dmg.byhu_n;
	assign reg_obj2i[2] = !dmg.beca_n;
	assign reg_obj2i[3] = !dmg.bulu_n;
	assign reg_obj2i[4] = !dmg.buna_n;
	assign reg_obj2i[5] = !dmg.boxa_n;
	assign reg_obj9i[0] = !dmg.yber_n;
	assign reg_obj9i[1] = !dmg.yzor_n;
	assign reg_obj9i[2] = !dmg.xyfe_n;
	assign reg_obj9i[3] = !dmg.xotu_n;
	assign reg_obj9i[4] = !dmg.xute_n;
	assign reg_obj9i[5] = !dmg.xufo_n;
	assign reg_obj0i[0] = !dmg.ywak_n;
	assign reg_obj0i[1] = !dmg.zony_n;
	assign reg_obj0i[2] = !dmg.wyte_n;
	assign reg_obj0i[3] = !dmg.yzep_n;
	assign reg_obj0i[4] = !dmg.ysok_n;
	assign reg_obj0i[5] = !dmg.ygus_n;
	assign reg_obj0x[0] = !dmg.xepe;
	assign reg_obj0x[1] = !dmg.ylah;
	assign reg_obj0x[2] = !dmg.zola;
	assign reg_obj0x[3] = !dmg.zulu;
	assign reg_obj0x[4] = !dmg.welo;
	assign reg_obj0x[5] = !dmg.xuny;
	assign reg_obj0x[6] = !dmg.wote;
	assign reg_obj0x[7] = !dmg.xako;
	assign reg_obj3x[0] = !dmg.xoly;
	assign reg_obj3x[1] = !dmg.xyba;
	assign reg_obj3x[2] = !dmg.xabe;
	assign reg_obj3x[3] = !dmg.xeka;
	assign reg_obj3x[4] = !dmg.xomy;
	assign reg_obj3x[5] = !dmg.wuha;
	assign reg_obj3x[6] = !dmg.wyna;
	assign reg_obj3x[7] = !dmg.weco;
	assign reg_obj7x[0] = !dmg.eraz;
	assign reg_obj7x[1] = !dmg.epum;
	assign reg_obj7x[2] = !dmg.erol;
	assign reg_obj7x[3] = !dmg.ehyn;
	assign reg_obj7x[4] = !dmg.fazu;
	assign reg_obj7x[5] = !dmg.faxe;
	assign reg_obj7x[6] = !dmg.exuk;
	assign reg_obj7x[7] = !dmg.fede;
	assign reg_obj1x[0] = !dmg.dany;
	assign reg_obj1x[1] = !dmg.duko;
	assign reg_obj1x[2] = !dmg.desu;
	assign reg_obj1x[3] = !dmg.dazo;
	assign reg_obj1x[4] = !dmg.dake;
	assign reg_obj1x[5] = !dmg.ceso;
	assign reg_obj1x[6] = !dmg.dyfu;
	assign reg_obj1x[7] = !dmg.cusy;
	assign reg_obj6x[0] = !dmg.ycol;
	assign reg_obj6x[1] = !dmg.yrac;
	assign reg_obj6x[2] = !dmg.ymem;
	assign reg_obj6x[3] = !dmg.yvag;
	assign reg_obj6x[4] = !dmg.zecu;
	assign reg_obj6x[5] = !dmg.zogo;
	assign reg_obj6x[6] = !dmg.zoly;
	assign reg_obj6x[7] = !dmg.zesa;
	assign reg_obj4x[0] = !dmg.wedu;
	assign reg_obj4x[1] = !dmg.ygaj;
	assign reg_obj4x[2] = !dmg.zyjo;
	assign reg_obj4x[3] = !dmg.xury;
	assign reg_obj4x[4] = !dmg.ybed;
	assign reg_obj4x[5] = !dmg.zala;
	assign reg_obj4x[6] = !dmg.wyde;
	assign reg_obj4x[7] = !dmg.xepa;
	assign reg_obj8x[0] = !dmg.gavy;
	assign reg_obj8x[1] = !dmg.gypu;
	assign reg_obj8x[2] = !dmg.gady;
	assign reg_obj8x[3] = !dmg.gaza;
	assign reg_obj8x[4] = !dmg.ezuf;
	assign reg_obj8x[5] = !dmg.enad;
	assign reg_obj8x[6] = !dmg.ebow;
	assign reg_obj8x[7] = !dmg.fyca;
	assign reg_obj9x[0] = !dmg.xuvy;
	assign reg_obj9x[1] = !dmg.xere;
	assign reg_obj9x[2] = !dmg.xuzo;
	assign reg_obj9x[3] = !dmg.xexa;
	assign reg_obj9x[4] = !dmg.ypod;
	assign reg_obj9x[5] = !dmg.yrop;
	assign reg_obj9x[6] = !dmg.ynep;
	assign reg_obj9x[7] = !dmg.yzof;
	assign reg_obj5x[0] = !dmg.fusa;
	assign reg_obj5x[1] = !dmg.faxa;
	assign reg_obj5x[2] = !dmg.fozy;
	assign reg_obj5x[3] = !dmg.fesy;
	assign reg_obj5x[4] = !dmg.cywe;
	assign reg_obj5x[5] = !dmg.dyby;
	assign reg_obj5x[6] = !dmg.dury;
	assign reg_obj5x[7] = !dmg.cuvy;
	assign reg_obj2x[0] = !dmg.foka;
	assign reg_obj2x[1] = !dmg.fyty;
	assign reg_obj2x[2] = !dmg.fuby;
	assign reg_obj2x[3] = !dmg.goxu;
	assign reg_obj2x[4] = !dmg.duhy;
	assign reg_obj2x[5] = !dmg.ejuf;
	assign reg_obj2x[6] = !dmg.enor;
	assign reg_obj2x[7] = !dmg.depy;

	logic [7:0] ppu_pipe_a_in;
	assign ppu_pipe_a_in[0] = dmg.legu;
	assign ppu_pipe_a_in[1] = dmg.nudu;
	assign ppu_pipe_a_in[2] = dmg.muku;
	assign ppu_pipe_a_in[3] = dmg.luzo;
	assign ppu_pipe_a_in[4] = dmg.megu;
	assign ppu_pipe_a_in[5] = dmg.myjy;
	assign ppu_pipe_a_in[6] = dmg.nasa;
	assign ppu_pipe_a_in[7] = dmg.nefo;

	logic [7:0] ppu_pipe_a;
	assign ppu_pipe_a[0] = dmg.myde;
	assign ppu_pipe_a[1] = dmg.nozo;
	assign ppu_pipe_a[2] = dmg.moju;
	assign ppu_pipe_a[3] = dmg.macu;
	assign ppu_pipe_a[4] = dmg.nepo;
	assign ppu_pipe_a[5] = dmg.modu;
	assign ppu_pipe_a[6] = dmg.neda;
	assign ppu_pipe_a[7] = dmg.bg_px_a;

	logic [7:0] ppu_pipe_b_in;
	assign ppu_pipe_b_in[0] = dmg.bg_tile0;
	assign ppu_pipe_b_in[1] = dmg.bg_tile1;
	assign ppu_pipe_b_in[2] = dmg.bg_tile2;
	assign ppu_pipe_b_in[3] = dmg.bg_tile3;
	assign ppu_pipe_b_in[4] = dmg.bg_tile4;
	assign ppu_pipe_b_in[5] = dmg.bg_tile5;
	assign ppu_pipe_b_in[6] = dmg.bg_tile6;
	assign ppu_pipe_b_in[7] = dmg.bg_tile7;

	logic [7:0] ppu_pipe_b;
	assign ppu_pipe_b[0] = dmg.tomy;
	assign ppu_pipe_b[1] = dmg.taca;
	assign ppu_pipe_b[2] = dmg.sady;
	assign ppu_pipe_b[3] = dmg.rysa;
	assign ppu_pipe_b[4] = dmg.sobo;
	assign ppu_pipe_b[5] = dmg.setu;
	assign ppu_pipe_b[6] = dmg.ralu;
	assign ppu_pipe_b[7] = dmg.bg_px_b;

	logic [7:0] oam_a_latch;
	assign oam_a_latch[0] = dmg.xyky_n;
	assign oam_a_latch[1] = dmg.yrum_n;
	assign oam_a_latch[2] = dmg.ysex_n;
	assign oam_a_latch[3] = dmg.yvel_n;
	assign oam_a_latch[4] = dmg.wyno_n;
	assign oam_a_latch[5] = dmg.cyra_n;
	assign oam_a_latch[6] = dmg.zuve_n;
	assign oam_a_latch[7] = dmg.eced_n;

	logic [7:0] oam_b_latch;
	assign oam_b_latch[0] = dmg.ydyv_n;
	assign oam_b_latch[1] = dmg.yceb_n;
	assign oam_b_latch[2] = dmg.zuca_n;
	assign oam_b_latch[3] = dmg.wone_n;
	assign oam_b_latch[4] = dmg.zaxe_n;
	assign oam_b_latch[5] = dmg.xafu_n;
	assign oam_b_latch[6] = dmg.yses_n;
	assign oam_b_latch[7] = dmg.zeca_n;

	assign sys_reset = dmg.cpu_sys_reset;

	task automatic dump_cart_ram(input string sav_file);
		int f;

		if (!has_ram) return;
		if (sav_file == "") return;

		f = $fopen(sav_file, "wb");
		foreach (cart_ram[i])
			$fwrite(f, "%c", cart_ram[i]);
		$fflush(f);
		$fclose(f);
	endtask

	/* Resolves conflicts on OAM data buses when DMA writes while PPU reads from OAM. This causes short-circuits ('x)
	   on the OAM buses. We resolve them by forcing the ANDed values of both active drivers onto the buses while the
	   conflict persists. This behaviour can be seen in the Mooneye madness/mgb_oam_dma_halt_sprites test. */
	localparam bit oam_conflict_alt = 0; /* Some devices produce "0" instead of "8". */
	bit oam_conflict;
	assign oam_conflict = dmg.oam_oe && dmg.dma_addr_ext;

	program solve_oam_conflict;

		initial forever begin
			@(posedge oam_conflict);

			/* Icarus doesn't fully support procedural continuous assgignments. They are only evaluated once. We work
			   around this by giving the signals some time to settle first. For nodelay runs, this code is executed
			   in a program block, so it happens at the end of a cycle. */
			#(dmg_timing::nodelay ? 0 : 20ns);

			force dmg.oam_a_d0_n = !dmg.ralo & dmg.oam_a_inst.dout[7];
			force dmg.oam_a_d1_n = !dmg.tune & dmg.oam_a_inst.dout[6];
			force dmg.oam_a_d2_n = !dmg.sera & dmg.oam_a_inst.dout[5];
			force dmg.oam_a_d3_n = !dmg.tenu & dmg.oam_a_inst.dout[4];
			force dmg.oam_a_d4_n = !dmg.sysa & dmg.oam_a_inst.dout[3];
			force dmg.oam_a_d5_n = !dmg.sugy & dmg.oam_a_inst.dout[2];
			force dmg.oam_a_d6_n = !dmg.tube & dmg.oam_a_inst.dout[1];
			force dmg.oam_a_d7_n = !dmg.syzo & dmg.oam_a_inst.dout[0];
			force dmg.oam_b_d0_n = !dmg.ralo & dmg.oam_b_inst.dout[0];
			force dmg.oam_b_d1_n = dmg.oam_b_inst.dout[1];
			force dmg.oam_b_d2_n = !dmg.sera & dmg.oam_b_inst.dout[2];
			force dmg.oam_b_d3_n = (oam_conflict_alt ? 1 : !dmg.tenu) & dmg.oam_b_inst.dout[3];
			force dmg.oam_b_d4_n = !dmg.sysa & dmg.oam_b_inst.dout[4];
			force dmg.oam_b_d5_n = !dmg.sugy & dmg.oam_b_inst.dout[5];
			force dmg.oam_b_d6_n = !dmg.tube & dmg.oam_b_inst.dout[6];
			force dmg.oam_b_d7_n = !dmg.syzo & dmg.oam_b_inst.dout[7];

			@(negedge oam_conflict);

			release dmg.oam_a_d0_n;
			release dmg.oam_a_d1_n;
			release dmg.oam_a_d2_n;
			release dmg.oam_a_d3_n;
			release dmg.oam_a_d4_n;
			release dmg.oam_a_d5_n;
			release dmg.oam_a_d6_n;
			release dmg.oam_a_d7_n;
			release dmg.oam_b_d0_n;
			release dmg.oam_b_d1_n;
			release dmg.oam_b_d2_n;
			release dmg.oam_b_d3_n;
			release dmg.oam_b_d4_n;
			release dmg.oam_b_d5_n;
			release dmg.oam_b_d6_n;
			release dmg.oam_b_d7_n;
		end
	endprogram

	program test;
		int sample_idx;

		initial begin
			string dumpfile, ch_file, snd_file, vid_file, sav_file;
			string time_str, prev_time_str;
			real   sim_seconds;
			int    _;
			int    fch[1:4];
			int    fmix, fvid;
			int    sim_mcycs;
			bit    dump_channels, dump_sound, dump_video;

			dumpfile = "";
			_ = $value$plusargs("DUMPFILE=%s", dumpfile);

			ch_file = "";
			_ = $value$plusargs("CH_FILE=%s", ch_file);
			dump_channels = ch_file != "";

			snd_file = "";
			_ = $value$plusargs("SND_FILE=%s", snd_file);
			dump_sound = snd_file != "";

			vid_file = "";
			_ = $value$plusargs("VID_FILE=%s", vid_file);
			dump_video = vid_file != "";

			sav_file = "";
			_ = $value$plusargs("SAV_FILE=%s", sav_file);

			sim_seconds = 6.0; /* Enough time for the boot ROM */
			_ = $value$plusargs("SECS=%f", sim_seconds);

			sim_mcycs = $rtoi(sim_seconds * 1048576.0);

			$dumpfile(dumpfile);
			$dumpvars(0, dmg_cpu_b_gameboy);

			if (dump_channels) for (int i = 1; i <= 4; i++) begin
				string filename;
				$sformat(filename, ch_file, i);
				fch[i] = $fopen(filename, "wb");
				write_header(fch[i], 65536, 1, 0);
			end
			if (dump_sound) begin
				fmix = $fopen(snd_file, "wb");
				write_header(fmix, 65536, 2, 1);
			end
			if (dump_video)
				fvid = $fopen(vid_file, "wb");

			sample_idx = 0;

			xi     = 0;
			nreset = 0;
			clk    = 0;

			cyc(64);
			nreset = 1;

			fork
				begin :tick_tick
					forever begin
						cyc(64);
						if (dump_channels) begin
							write_bit4_as_int8(fch[1], dmg.ch1_out);
							write_bit4_as_int8(fch[2], dmg.ch2_out);
							write_bit4_as_int8(fch[3], dmg.ch3_out);
							write_bit4_as_int8(fch[4], dmg.ch4_out);
						end
						if (dump_sound) begin
							write_real_as_int16(fmix, lout);
							write_real_as_int16(fmix, rout);
						end
						sample_idx++;
					end
				end

				if (dump_video) begin :video_dump
					vdump.video_dump_loop(fvid);
				end

				begin :time_dump
					@(negedge sys_reset);
					$sformat(time_str, "%.1f", $itor(sim_mcycs) / 1048576.0);
					$display("System reset done -- will simulate %s seconds", time_str);
					$fflush(32'h8000_0001);
					prev_time_str = time_str;

					while (sim_mcycs) begin
						sim_mcycs--;
						if (sim_mcycs % 131072) begin
							$sformat(time_str, "%.1f", $itor(sim_mcycs) / 1048576.0);
							if (time_str != prev_time_str && time_str != "0.0") begin
								$display("%s seconds remaining", time_str);
								$fflush(32'h8000_0001);
								prev_time_str = time_str;
								dump_cart_ram(sav_file);
							end
						end
						@(posedge dmg.clk_1mhz_n);
						@(posedge dmg.clk_1mhz);
					end

					disable tick_tick;
					disable video_dump;
					disable sim_regs;
					dump_cart_ram(sav_file);
				end

				begin :sim_regs
					forever begin
						@(posedge nwr);
						case ({ncs, a})
							'h0e5a5: begin
								$display("System self-terminated by writing to address 0xe5a5");
								disable tick_tick;
								disable video_dump;
								disable time_dump;
								dump_cart_ram(sav_file);
								disable sim_regs;
							end
						endcase
					end
				end
			join

			$finish;
		end
	endprogram

endmodule

