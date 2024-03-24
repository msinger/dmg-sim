`timescale 1ns/1ns
`default_nettype none

/* Not sure about these things, so make them easily switchable for testing: */
parameter bit dffra_inv_clk = 0; /* DFFR Variant A clock input is inverted? */

module dmg_cpu_b(
		/* External pins of the DMG CPU B chip */
		input  logic            xi,         /* Pin 74        - XI clock input pin */
		output logic            xo,         /* Pin 73        - XO clock output pin */
		input  logic            t1, t2,     /* Pin 77, 76    - T1, T2 test pins */
		input  logic            nrst,       /* Pin 71        - !RST reset pin */
		output logic            phi,        /* Pin 75        - PHI pin */
		inout  tri logic        nrd,        /* Pin 79        - !RD pin */
		inout  tri logic        nwr,        /* Pin 78        - !WR pin */
		output logic            ncs,        /* Pin 80        - !CS pin */
		inout  tri logic        nmoe,       /* Pin 45        - !MOE pin */
		inout  tri logic        nmwr,       /* Pin 49        - !MWR pin */
		inout  tri logic        nmcs,       /* Pin 43        - !MCS pin */
		inout  tri logic [7:0]  d_pin,      /* Pin 17-24     - D0-D7 pins */
		inout  tri logic [7:0]  md_pin,     /* Pin 33, 31-25 - MD0-MD7 pins */
		inout  tri logic [15:0] a_pin,      /* Pin 1-16      - A0-A15 pins */
		output logic     [12:0] ma_pin,     /* Pin 34-42     - MA0-MA12 pins */
		output logic            sout,       /* Pin 70        - SOUT pin */
		inout  tri logic        sin,        /* Pin 69        - SIN pin */
		inout  tri logic        sck,        /* Pin 68        - SCK pin */
		inout  tri logic        p10,        /* Pin 67        - P10 pin */
		inout  tri logic        p11,        /* Pin 66        - P11 pin */
		inout  tri logic        p12,        /* Pin 65        - P12 pin */
		inout  tri logic        p13,        /* Pin 64        - P13 pin */
		output tri logic        p14,        /* Pin 63        - P14 pin */
		output tri logic        p15,        /* Pin 62        - P15 pin */
		output logic            cpg,        /* Pin 52        - CPG pin */
		output logic            cp,         /* Pin 53        - CP pin */
		output logic            cpl,        /* Pin 55        - CPL pin */
		output logic            fr,         /* Pin 56        - FR pin */
		output logic            st,         /* Pin 54        - ST pin */
		output logic            s,          /* Pin 57        - S pin */
		output logic            ld0, ld1,   /* Pin 51, 50    - LD0, LD1 pins (pixel data) */
		output real             rout, lout, /* Pin 59, 60    - SO1, SO2 pins (right and left audio out channels) */
		input  real             vin,        /* Pin 61        - Cartridge audio input */

		/* Unbonded I/O pads of the DMG CPU B chip */
		input  logic unbonded_pad0,  /* Unbonded input pad between pin 11 (A10) and 12 (A11) */
		output logic unbonded_pad1,  /* Unbonded output pad between pin 51 (LD0) and 52 (CPG) */

		/* Internal connections to SM83 CPU core
		 * Numbered like here: http://iceboy.a-singer.de/doc/dmg_cpu_connections.html */
		input  logic            cpu_out_t1,    /* CPU out T1  - Goes to unbonded pin; Some test pin? */
		output logic            cpu_clkin_t2,  /* CPU in  T2  - 1 MiHz clock; complement of T3 */
		output logic            cpu_clkin_t3,  /* CPU in  T3  - 1 MiHz clock; complement of T2 */
		output logic            cpu_clkin_t4,  /* CPU in  T4  - 1 MiHz clock; complement of T5 */
		output logic            cpu_clkin_t5,  /* CPU in  T5  - 1 MiHz clock; complement of T4 */
		output logic            cpu_clkin_t6,  /* CPU in  T6  - 1 MiHz clock; complement of T7 */
		output logic            cpu_clkin_t7,  /* CPU in  T7  - 1 MiHz clock; complement of T6 */
		output logic            cpu_clkin_t8,  /* CPU in  T8  - 1 MiHz clock */
		output logic            cpu_clkin_t9,  /* CPU in  T9  - 1 MiHz clock; complement of T10 */
		output logic            cpu_clkin_t10, /* CPU in  T10 - 1 MiHz clock; complement of T9 */
		input  logic            cpu_clk_ena,   /* CPU out T11 - Enable clocks; active-high */
		output logic            cpu_in_t12,    /* CPU in  T12 - Synchonous reset; active-high */
		output logic            cpu_in_t13,    /* CPU in  T13 - Asynchonous reset; active-high */
		input  logic            cpu_xo_ena,    /* CPU out T14 - Enable crystal oscillator; active-high */
		output logic            cpu_in_t15,    /* CPU in  T15 - Crystal oscillator stable; active-high */
		output logic            cpu_in_t16,    /* CPU in  T16 - Goes to unbonded pin; Some test pin? */
		input  logic            cpu_raw_rd,    /* CPU out R1  - Memory read signal; active-high */
		input  logic            cpu_raw_wr,    /* CPU out R2  - Memory write signal; active-high */
		output logic            cpu_in_r3,     /* CPU in  R3  - High when T1=1 T2=0 */
		output logic            cpu_in_r4,     /* CPU in  R4  - High when address is 0xFExx or 0xFFxx */
		output logic            cpu_in_r5,     /* CPU in  R5  - High when address is 0x00xx and boot ROM is still visible */
		output logic            cpu_in_r6,     /* CPU in  R6  - High when T1=0 T2=1 */
		input  logic            cpu_out_r7,    /* CPU out R7  - External memory request; active-high */
		input  logic            cpu_irq0_ack,  /* CPU out R14 - IRQ0 acknowledge; active-high */
		output logic            cpu_irq0_trig, /* CPU in  R15 - IRQ0 trigger; active-high */
		input  logic            cpu_irq1_ack,  /* CPU out R16 - IRQ1 acknowledge; active-high */
		output logic            cpu_irq1_trig, /* CPU in  R17 - IRQ1 trigger; active-high */
		input  logic            cpu_irq2_ack,  /* CPU out R18 - IRQ2 acknowledge; active-high */
		output logic            cpu_irq2_trig, /* CPU in  R19 - IRQ2 trigger; active-high */
		input  logic            cpu_irq3_ack,  /* CPU out R20 - IRQ3 acknowledge; active-high */
		output logic            cpu_irq3_trig, /* CPU in  R21 - IRQ3 trigger; active-high */
		input  logic            cpu_irq4_ack,  /* CPU out R22 - IRQ4 acknowledge; active-high */
		output logic            cpu_irq4_trig, /* CPU in  R23 - IRQ4 trigger; active-high */
		input  logic            cpu_irq5_ack,  /* CPU out R24 - IRQ5 acknowledge; active-high */
		output logic            cpu_irq5_trig, /* CPU in  R25 - IRQ5 trigger; active-high */
		input  logic            cpu_irq6_ack,  /* CPU out R26 - IRQ6 acknowledge; active-high */
		output logic            cpu_irq6_trig, /* CPU in  R27 - IRQ6 trigger; active-high */
		input  logic            cpu_irq7_ack,  /* CPU out R28 - IRQ7 acknowledge; active-high */
		output logic            cpu_irq7_trig, /* CPU in  R29 - IRQ7 trigger; active-high */
		inout  tri logic [7:0]  d,             /* CPU I/O B1-B8  */
		input  tri logic [15:0] cpu_a,         /* CPU out B9-B24 */
		output logic            cpu_wakeup     /* CPU in  B25 - Wake from STOP mode; active-high */
	);

	function automatic logic bidir_out(logic drv_low, ndrv_high);
		if ($isunknown(drv_low) || $isunknown(ndrv_high))
			bidir_out = 'x;
		else if (drv_low == ndrv_high)
			bidir_out = !drv_low;
		else if (drv_low)
			bidir_out = 'x;
		else
			bidir_out = 'z;
	endfunction

	assign phi = !nphi_out;
	assign nrd = bidir_out(rd_c, rd_a);
	assign nwr = bidir_out(wr_c, wr_a);
	assign ncs = !cs_out;

	assign nmoe = bidir_out(moe_d, moe_a);
	assign nmwr = bidir_out(mwr_d, mwr_a);
	assign nmcs = bidir_out(mcs_d, mcs_a);

	logic [7:0] d_pin_drv; /* Value driven internally onto the data pins if not 'z */
	generate
		for (genvar i = 0; i < 8; i++)
			assign d_pin_drv[i] = bidir_out(d_d[i], d_a[i]);
	endgenerate
	assign (pull1, highz0) d_pin = {8{!lula}};
	assign                 d_pin = d_pin_drv;

	logic [7:0] md_pin_drv; /* Value driven internally onto the pins if not 'z */
	generate
		for (genvar i = 0; i < 8; i++)
			assign md_pin_drv[i] = bidir_out(md_out[i], md_a[i]);
	endgenerate
	assign (pull1, highz0) md_pin = {8{!md_b}};
	assign                 md_pin = md_pin_drv;

	generate
		for (genvar i = 0; i < 16; i++)
			assign a_pin[i] = bidir_out(a_d[i], a_a[i]);
	endgenerate

	assign ma_pin = ~nma_out;

	assign                 sout = nsout;
	assign                 sin  = bidir_out(sin_d, sin_a);
	assign                 sck  = bidir_out(sck_d, sck_a);
	assign (pull1, highz0) sin  = !sin_b;
	assign (pull1, highz0) sck  = !sck_dir;

	assign                 p10  = bidir_out(p10_d, p10_a);
	assign                 p11  = bidir_out(p11_d, p11_a);
	assign                 p12  = bidir_out(p12_d, p12_a);
	assign                 p13  = bidir_out(p13_d, p13_a);
	assign                 p14  = bidir_out(p14_b, p14_a);
	assign                 p15  = bidir_out(p15_b, p15_a);
	assign (pull1, highz0) p10  = !p10_b;
	assign (pull1, highz0) p11  = !p11_b;
	assign (pull1, highz0) p12  = !p12_b;
	assign (pull1, highz0) p13  = !p13_b;

	assign cpg = !npin_cpg;
	assign cp  = !ncp;
	assign cpl = !npin_cpl;
	assign fr  = !npin_fr;
	assign st  = !npin_st;
	assign s   = !npin_s;
	assign ld0 = !nld0;
	assign ld1 = !nld1;

	assign cpu_in_t13 = reset;
	assign cpu_in_r3  = t1_nt2;
	assign cpu_in_r6  = nt1_t2;

	assign cpu_clkin_t2  = to_cpu;
	assign cpu_clkin_t3  = bedo;
	assign cpu_clkin_t4  = beko;
	assign cpu_clkin_t5  = nphi_out;
	assign cpu_clkin_t6  = bolo;
	assign cpu_clkin_t7  = from_cpu5;
	assign cpu_clkin_t8  = buke;
	assign cpu_clkin_t9  = boma;
	assign cpu_clkin_t10 = boga1mhz;
	assign cpu_in_t12    = afer;
	assign cpu_in_t15    = taba;
	assign cpu_in_r4     = syro;
	assign cpu_in_r5     = tutu;
	assign a             = cpu_a;
	assign cpu_wakeup    = to_cpu2;
	assign cpu_in_t16    = !unbonded_pad0;
	assign cpu_irq5_trig = 0;
	assign cpu_irq6_trig = 0;
	assign cpu_irq7_trig = 0;

	tri0 logic [15:0] a;
	tri logic  [7:0]  md;
	tri0 logic [12:0] nma;

	/* Icarus doesn't support trireg, so we do it like this: */
	logic [7:0] d_cap = $random, md_cap = $random;
	always @(d) d_cap = d;
	always @(md) md_cap = md;
	assign (weak1, weak0) d = d_cap;
	assign (weak1, weak0) md = md_cap;

	logic [7:0]  d_a, d_in, d_d, md_a, md_in, md_out;
	logic [15:0] a_a, a_c, a_d, dma_a;
	logic [12:0] nma_out;
	assign d_in  = ~d_pin;
	assign md_in = ~md_pin;
	assign a_c   = ~a_pin;

	logic wr_a, wr_in, wr_c, rd_a, rd_b, rd_c;
	logic moe_a, moe_in, moe_d, mwr_a, mwr_in, mwr_d, mcs_a, mcs_in, mcs_d, md_b;
	assign wr_in  = !nwr;
	assign rd_b   = !nrd;
	assign moe_in = !nmoe;
	assign mwr_in = !nmwr;
	assign mcs_in = !nmcs;

	logic clk1, clk2, clk3, clk4, clk5;
	logic cpu_wr, cpu_wr2;
	logic cpu_rd, cpu_rd2;
	logic cpu_wr_sync;
	logic t1t2_nrst;
	logic ff04_ff07, nff0f_rd, nff0f_wr, ff00wr, ff00rd;
	logic nff04_d0, nff04_d1;
	logic apu_wr, ncpu_rd;
	logic cs_out;
	logic to_cpu, to_cpu2;
	logic from_cpu5; /* this is wrongly labeled in the schematics; it is actually a CPU input */

	logic reset;
	assign reset = !nrst;

	logic clkin_a, clkin_b;
	assign clkin_a = cpu_xo_ena;
	assign clkin_b = !xi;

	assign xo = cpu_xo_ena ? !xi : 0;

	logic from_cpu3, from_cpu4, from_cpu6, clk_from_cpu;
	assign from_cpu3    = cpu_raw_wr;
	assign from_cpu4    = cpu_out_r7;
	assign from_cpu6    = cpu_out_t1;
	assign clk_from_cpu = cpu_clk_ena;

	logic nt1, nt2;
	assign nt1 = !t1;
	assign nt2 = !t2;

	logic nreset2, nreset6, reset7, nreset7, nreset8, nreset9;
	logic reset_video, nreset_video, reset_video2, nreset_video2, reset_video3;
	logic nphi_out, phi_out, dova_phi;

	logic nsout, sin_a, sin_b, sin_in, sin_d, sck_a, sck_dir, sck_in, sck_d;
	logic p10_a, p10_b, p10_c, p10_d, p11_a, p11_b, p11_c, p11_d, p12_a, p12_b, p12_c, p12_d, p13_a, p13_b, p13_c, p13_d;
	logic p14_a, p14_b, p15_a, p15_b;
	assign sin_in = !sin;
	assign sck_in = !sck;
	assign p10_c  = !p10;
	assign p11_c  = !p11;
	assign p12_c  = !p12;
	assign p13_c  = !p13;

	logic oam_a_cpu_nrd, oam_b_cpu_nrd;
	logic dma_run, vram_to_oam, dma_addr_ext, oam_addr_ndma;
	logic caty, wyja, mopa_nphi;
	logic tovy_na0, tola_na1;

	logic ff60_d1, ff60_d0;
	logic ff26, ff3x, namp_en;

	logic int_serial, int_timer;
	logic ser_out;

	logic t1_nt2, nt1_t2;
	logic apu_reset, net03;
	logic napu_reset, napu_reset2, napu_reset4, napu_reset5, napu_reset6;
	logic apuv_4mhz, amuk_4mhz;
	logic ajer_2mhz, cery_2mhz;
	logic boga1mhz, bavu_1mhz;
	logic byfe_128hz, bufy_256hz, horu_512hz, butu_512khz, jeso_512k, hama_512k, dyfa_1mhz;
	logic afas, fero_q, cate, gaxo, bedo, abuz, tutu, texo, roru, lula, anap, duce, cota, wuko, copu, atys;
	logic ngexu, cope, kyly, adad, elox_q, anuj, doca, cogu, erog, dera, gypa, beny, ngugu, gara;
	logic nkeno, nkafo, nkepa, nkygu, nkemu, nkunu, nkupe, nkutu, njapu, nkeza, nkeju;
	logic buke, gase, efar_q, fugo_q, beko, bolo, boma, afer, taba, syro;
	logic ch1_restart, ch1_shift_clk, ch1_ld_shift, ch1_freq_upd1, ch1_freq_upd2;
	logic ch2_ftick;
	logic nch1_active, nch1_amp_en;
	logic nch2_active, nch2_amp_en;
	logic ch3_active, nch3_active;
	logic ch4_restart;
	logic nch4_active, nch4_amp_en;
	logic _16384hz, _65536hz, _262144hz;

	logic talu, xyvo, nnype, wodu, napo, PURE, sela, nxymu;
	logic wuvu_nq, fepo, tofu, avap, pova, acyl, atej;
	logic waru, xare, mosu, lyry, myvo, sylo, roxy;
	logic loby, nyka, pory, tomu, poky, roxo, segu;
	logic pore, potu, neta, xuha, lesy, lota;
	logic lyku, roby, tyta, tyco, soka, xovu, vava;
	logic wuty, seca, nyxu, vyno, vujo, vymu, mofu;
	logic lena, nydy, myma, xupy, catu, tuvo, tyfo_nq;
	logic xoce, abez, weza, wuco, wyda, zysu, wyse, wuzy;
	logic anom, feto, besu, amab, azyb, byva, leko;
	logic ynaz, ykok, zure, ywos, ekes, cehu, ewam, cyvy, zako, xeba;
	logic ylev, ytub, feha, dama, cyco, daje, ydot, ywap, fyma, cogy;
	logic wenu, cucu, cuca, cega;
	logic fado, deny, gugy, xyme, gygy, gowo, gyma, fame, dydo, furo;
	logic dosy, wuzo, gafy, xaho, ejad, wunu, wupa, gamy, doku, dyna;
	logic texy, dege, daby, dabu, gysa, xyso;
	logic buza, tacu, xefy, xono, xado, puco;
	logic cacu, buzy, fuke, zape, wuse, zuru, fefo, gecy, wabe;
	logic feka, xyha, yfag, cexu, akol, bymy, fuxu, enob, geny;
	logic weme, wufa, faka, cyla, dymo, bucy, wofo, wylu, ewot;
	logic asys, ahof, byvy, ngomo, nbaxo, nyzos, ndepo;
	logic rawu, pyzo, pulo, powy, pozo, poxa, poju, pyju;

	logic ffxx, nffxx, nfexxffxx, a00_07, saro;
	logic ff10, ff11, ff12, ff13, ff14, ff16, ff17, ff18, ff19, ff1a;
	logic ff1b, ff1c, ff1d, ff1e, ff20, ff21, ff22, ff23, ff24, ff25;
	logic ff40, ff41, ff42, ff43, ff44, ff45;
	logic ff46, ff47, ff48, ff49, ff4a, ff4b;
	logic nff10_d0, nff10_d1, nff10_d2, nff10_d3, nff10_d4, nff10_d5, nff10_d6;
	logic ff11_d6, ff11_d7, nff11_d6, nff11_d7;
	logic ff12_d0, ff12_d1, ff12_d2, ff12_d3, ff12_d4, ff12_d5, ff12_d6, ff12_d7;
	logic nff12_d0, nff12_d1, nff12_d2, nff12_d3;
	logic ff14_d6, nff14_d6;
	logic nff16_wr, ff16_d6, nff16_d6, ff16_d7, nff16_d7;
	logic ff17_d0, nff17_d0, ff17_d1, nff17_d1, ff17_d2, nff17_d2;
	logic ff17_d3, nff17_d3, ff17_d4, ff17_d5, ff17_d6, ff17_d7;
	logic ff19_d6, nff19_d6, ff19_d7;
	logic nff1a_d7, ff1b_wr1, ff1b_wr2, ff1b_wr3;
	logic ff1c_d5, nff1c_d5, ff1c_d6, nff1c_d6;
	logic ff1d_d0, ff1d_d1, ff1d_d2, ff1d_d3, ff1d_d4, ff1d_d5, ff1d_d6, ff1d_d7;
	logic ff1e_d0, ff1e_d1, ff1e_d2, ff1e_d6, nff1e_d6;
	logic ff21_d0, nff21_d0, ff21_d1, nff21_d1, ff21_d2, nff21_d2;
	logic ff21_d3, nff21_d3, ff21_d4, ff21_d5, ff21_d6, ff21_d7;
	logic nff22_d0, nff22_d1, nff22_d2, ff22_d3, nff22_d3, ff22_d4, nff22_d4;
	logic ff22_d5, nff22_d5, ff22_d6, nff22_d6, ff22_d7;
	logic ff23_d6, ff23_d7, rst_ff23_d7;
	logic ff40_d0, ff40_d1, ff40_d2, ff40_d3, ff40_d4, ff40_d5, ff40_d6, ff40_d7;
	logic ff42_d0, ff42_d1, ff42_d2, ff42_d3, ff42_d4, ff42_d5, ff42_d6, ff42_d7;
	logic ff43_d0, ff43_d1, ff43_d2, ff43_d3, ff43_d4, ff43_d5, ff43_d6, ff43_d7;
	logic ff45_d0, ff45_d1, ff45_d2, ff45_d3, ff45_d4, ff45_d5, ff45_d6, ff45_d7;
	logic ff4a_d0, ff4a_d1, ff4a_d2, ff4a_d3, ff4a_d4, ff4a_d5, ff4a_d6, ff4a_d7;
	logic ff4b_d0, ff4b_d1, ff4b_d2, ff4b_d3, ff4b_d4, ff4b_d5, ff4b_d6, ff4b_d7;

	logic l113, int_vbl, int_vbl_buf, int_stat, clkpipe;

	logic       bg_pix_a_7, bg_pix_b_7;
	logic [7:0] spr_pix_a, spr_pix_b;
	logic       nbgpixel, nobp0pixel, nobp1pixel;

	logic npin_cpg, ncp, npin_cpl, npin_fr, npin_st, npin_s, nld0, nld1;

	logic [7:0] v, h, nh;
	logic [7:0] bgp_d, obp0_d, obp1_d;

	logic [10:0] acc_d;
	logic [3:0]  wave_play_d;
	logic        wave_ram_rd;

	/* connections to analog parts */
	logic [3:0] rmixer, lmixer;
	logic [3:0] ch1_out, ch2_out, wave_dac_d, ch4_out;
	logic [2:0] nrvolume, nlvolume;
	logic       vin_r_ena, vin_l_ena;

	/* simulate analog parts */
	real ch1_fp, ch2_fp, ch3_fp, ch4_fp;
	real rvol_fp, lvol_fp;
	real rmix, lmix;
	assign ch1_fp = $itor(ch1_out) / 15.0;
	assign ch2_fp = $itor(ch2_out) / 15.0;
	assign ch3_fp = $itor(wave_dac_d) / 15.0;
	assign ch4_fp = $itor(ch4_out) / 15.0;
	assign rvol_fp = $itor(~nrvolume) / 7.0;
	assign lvol_fp = $itor(~nlvolume) / 7.0;
	assign rmix = (rmixer[0] ? ch1_fp * 0.7 : 0.0) +
	              (rmixer[1] ? ch2_fp * 0.7 : 0.0) +
	              (rmixer[2] ? ch3_fp * 0.7 : 0.0) +
	              (rmixer[3] ? ch4_fp * 0.7 : 0.0) +
	              (vin_r_ena ? vin * 0.7 : 0.0);
	assign lmix = (lmixer[0] ? ch1_fp * 0.7 : 0.0) +
	              (lmixer[1] ? ch2_fp * 0.7 : 0.0) +
	              (lmixer[2] ? ch3_fp * 0.7 : 0.0) +
	              (lmixer[3] ? ch4_fp * 0.7 : 0.0) +
	              (vin_l_ena ? vin * 0.7 : 0.0);
	assign rout = (rmix * rvol_fp > 1.0) ? 1.0 : (rmix * rvol_fp);
	assign lout = (lmix * lvol_fp > 1.0) ? 1.0 : (lmix * lvol_fp);

	/* connections to wave RAM */
	logic [7:0] wave_rd_d = $random; /* data output (data input is directly connected to common d[7:0]) */
	logic [3:0] wave_a;              /* address */
	logic       wave_ram_ctrl1;      /* !CS */
	logic       nwave_ram_wr;        /* !WR */
	logic       atok;                /* !OE */

	logic [7:0] wave_ram[0:15];
	initial foreach (wave_ram[i]) wave_ram[i] = $random;
	always_ff @(posedge nwave_ram_wr) if (!wave_ram_ctrl1) wave_ram[wave_a] <= $isunknown(d) ? $random : d;
	always_latch if (!wave_ram_ctrl1 && !atok) wave_rd_d = wave_ram[wave_a];
	// TODO: The very first sample (high nibble of FF30) gets skipped when CH3 is started. Check if this is correct.
	// TODO: When reading the next byte from wave RAM (for example FF31), the previous sample (high nibble of FF30)
	//       gets output for a very short time before the next sample (high nibble of FF31) gets output. Check if correct.

	/* connections to OAM RAM */
	tri logic [7:0] oam_a_nd, oam_b_nd;      /* ~data I/O */
	logic     [7:0] oam_a;                   /* address (except bit 0) */
	logic     oam_a_ncs, oam_b_ncs;          /* !WR */
	logic     oam_clk;                       /* !OE */

	/* Icarus doesn't support trireg, so we do it like this: */
	logic [7:0] oam_a_nd_cap = $random, oam_b_nd_cap = $random;
	always @(oam_a_nd) oam_a_nd_cap = oam_a_nd;
	always @(oam_b_nd) oam_b_nd_cap = oam_b_nd;
	assign (weak1, weak0) oam_a_nd = oam_a_nd_cap;
	assign (weak1, weak0) oam_b_nd = oam_b_nd_cap;

	logic [7:0] oam_a_ram[0:79], oam_b_ram[0:79];
	initial foreach (oam_a_ram[i]) oam_a_ram[i] = $random;
	initial foreach (oam_b_ram[i]) oam_b_ram[i] = $random;
	always_ff @(posedge oam_a_ncs) oam_a_ram[oam_a[7:1]] <= $isunknown(oam_a_nd) ? $random : oam_a_nd;
	always_ff @(posedge oam_b_ncs) oam_b_ram[oam_a[7:1]] <= $isunknown(oam_b_nd) ? $random : oam_b_nd;
	assign oam_a_nd = (!oam_clk && oam_a[7:1] < 80) ? oam_a_ram[oam_a[7:1]] : 'z;
	assign oam_b_nd = (!oam_clk && oam_a[7:1] < 80) ? oam_b_ram[oam_a[7:1]] : 'z;

	/* connection to HRAM */
	logic hram_cs; /* CS */

	logic [7:0] hram[0:127];
	initial foreach (hram[i]) hram[i] = $random;
	always_ff @(negedge cpu_wr) if (hram_cs) hram[a[6:0]] <= $isunknown(d) ? $random : d;
	assign d = (hram_cs && cpu_rd) ? hram[a[6:0]] : 'z;

	/* connection to boot ROM */
	logic boot_cs; /* OE */

	logic [7:0] brom[0:255];
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
			_ = $fread(brom, f);
			$fclose(f);
		end else
			foreach (brom[i]) brom[i] = '0;
	end
	assign d = boot_cs ? brom[a[7:0]] : 'z;

	clocks_reset           p1_clocks_reset(.*);
	interrupts             p2_interrupts(.*);
	timer                  p3_timer(.*);
	dma                    p4_dma(.*);
	joypad_io              p5_joypad_io(.*);
	serial_link            p6_serial_link(.*);
	sys_decode             p7_sys_decode(.*);
	ext_cpu_busses         p8_ext_cpu_busses(.*);
	apu_control            p9_apu_control(.*);
	apu_decode             p10_apu_decode(.*);
	ch1_regs               p11_ch1_regs(.*);
	ch1_sweep              p12_ch1_sweep(.*);
	channel1               p13_channel1(.*);
	ch2_regs               p14_ch2_regs(.*);
	channel2               p15_channel2(.*);
	ch3_regs               p16_ch3_regs(.*);
	wave_ram               p17_wave_ram(.*);
	channel3               p18_channel3(.*);
	ch4_regs               p19_ch4_regs(.*);
	channel4               p20_channel4(.*);
	video_control          p21_video_control(.*);
	ppu_decode             p22_ppu_decode(.*);
	video_regs             p23_video_regs(.*);
	lcd_control            p24_lcd_control(.*);
	vram_interface         p25_vram_interface(.*);
	background             p26_background(.*);
	window_map_lookup      p27_window_map_lookup(.*);
	oam                    p28_oam(.*);
	sprite_control         p29_sprite_control(.*);
	sprite_store           p30_sprite_store(.*);
	sprite_x_matchers      p31_sprite_x_matchers(.*);
	bg_pixel_shifter       p32_bg_pixel_shifter(.*);
	sprite_pixel_shifter   p33_sprite_pixel_shifter(.*);
	sprite_palette_shifter p34_sprite_palette_shifter(.*);
	pixel_mux              p35_pixel_mux(.*);
	palettes               p36_palettes(.*);

	/* for convinience */
	logic [15:0] reg_div16;
	logic [7:0]  reg_ff00;
	logic [7:0]  reg_ff01;
	logic [7:0]  reg_ff02;
	logic [7:0]  reg_ff04;
	logic [7:0]  reg_ff05;
	logic [7:0]  reg_ff06;
	logic [7:0]  reg_ff07;
	logic [7:0]  reg_ff0f;
	logic [7:0]  reg_ff10, reg_ff10s;
	logic [7:0]  reg_ff11;
	logic [7:0]  reg_ff12, reg_ff12s;
	logic [7:0]  reg_ff13, reg_ff13s, reg_ff13t, reg_ff13u, reg_ff13v;
	logic [7:0]  reg_ff14, reg_ff14s, reg_ff14t, reg_ff14u, reg_ff14v;
	logic [7:0]  reg_ff16;
	logic [7:0]  reg_ff17, reg_ff17s;
	logic [7:0]  reg_ff18, reg_ff18s;
	logic [7:0]  reg_ff19, reg_ff19s;
	logic [7:0]  reg_ff1a;
	logic [7:0]  reg_ff1b;
	logic [7:0]  reg_ff1c;
	logic [7:0]  reg_ff1d, reg_ff1ds;
	logic [7:0]  reg_ff1e, reg_ff1es;
	logic [7:0]  reg_ff20;
	logic [7:0]  reg_ff21, reg_ff21s;
	logic [7:0]  reg_ff22, reg_ff22s;
	logic [7:0]  reg_ff23, reg_ff23s;
	logic [7:0]  reg_ff24;
	logic [7:0]  reg_ff25;
	logic [7:0]  reg_ff26;
	logic [7:0]  reg_ff40;
	logic [7:0]  reg_ff41;
	logic [7:0]  reg_ff42;
	logic [7:0]  reg_ff43;
	logic [7:0]  reg_ff44;
	logic [7:0]  reg_ff45;
	logic [7:0]  reg_ff46;
	logic [7:0]  reg_ff47;
	logic [7:0]  reg_ff48;
	logic [7:0]  reg_ff49;
	logic [7:0]  reg_ff50;
	logic [7:0]  reg_ff60;
	logic [6:0]  reg_cpg_count;
	logic [3:0]  reg_oam_src;
	logic [7:0]  reg_obj_y_cmp;
	logic [31:0] obj0, obj1, obj2, obj3, obj4, obj5, obj6, obj7;
	logic [3:0]  reg_obj0y, reg_obj1y, reg_obj2y, reg_obj3y, reg_obj4y;
	logic [3:0]  reg_obj5y, reg_obj6y, reg_obj7y, reg_obj8y, reg_obj9y;
	logic [5:0]  reg_obj0i, reg_obj1i, reg_obj2i, reg_obj3i, reg_obj4i;
	logic [5:0]  reg_obj5i, reg_obj6i, reg_obj7i, reg_obj8i, reg_obj9i;
	logic [7:0]  reg_obj0x, reg_obj1x, reg_obj2x, reg_obj3x, reg_obj4x;
	logic [7:0]  reg_obj5x, reg_obj6x, reg_obj7x, reg_obj8x, reg_obj9x;
	assign reg_div16[0]   = p1_clocks_reset.ukup;
	assign reg_div16[1]   = p1_clocks_reset.ufor;
	assign reg_div16[2]   = p1_clocks_reset.uner;
	assign reg_div16[3]   = p1_clocks_reset.tero;
	assign reg_div16[4]   = p1_clocks_reset.unyk;
	assign reg_div16[5]   = p1_clocks_reset.tama;
	assign reg_div16[6]   = p1_clocks_reset.ugot;
	assign reg_div16[7]   = p1_clocks_reset.tulu;
	assign reg_div16[8]   = p1_clocks_reset.tugo;
	assign reg_div16[9]   = p1_clocks_reset.tofe;
	assign reg_div16[10]  = p1_clocks_reset.teru;
	assign reg_div16[11]  = p1_clocks_reset.sola;
	assign reg_div16[12]  = p1_clocks_reset.subu;
	assign reg_div16[13]  = p1_clocks_reset.teka;
	assign reg_div16[14]  = p1_clocks_reset.uket;
	assign reg_div16[15]  = p1_clocks_reset.upof;
	assign reg_ff00[0]    = !p5_joypad_io.kevu;
	assign reg_ff00[1]    = !p5_joypad_io.kapa;
	assign reg_ff00[2]    = !p5_joypad_io.keja;
	assign reg_ff00[3]    = !p5_joypad_io.kolo;
	assign reg_ff00[4]    = p5_joypad_io.kely;
	assign reg_ff00[5]    = p5_joypad_io.cofy;
	assign reg_ff00[7:6]  = '1;
	assign reg_ff01[0]    = p6_serial_link.cuba;
	assign reg_ff01[1]    = p6_serial_link.degu;
	assign reg_ff01[2]    = p6_serial_link.dyra;
	assign reg_ff01[3]    = p6_serial_link.dojo;
	assign reg_ff01[4]    = p6_serial_link.dovu;
	assign reg_ff01[5]    = p6_serial_link.ejab;
	assign reg_ff01[6]    = p6_serial_link.erod;
	assign reg_ff01[7]    = p6_serial_link.eder;
	assign reg_ff02[0]    = p6_serial_link.culy;
	assign reg_ff02[6:1]  = '1;
	assign reg_ff02[7]    = p6_serial_link.etaf;
	assign reg_ff04       = reg_div16[13:6];
	assign reg_ff05[0]    = p3_timer.rega;
	assign reg_ff05[1]    = p3_timer.povy;
	assign reg_ff05[2]    = p3_timer.peru;
	assign reg_ff05[3]    = p3_timer.rate;
	assign reg_ff05[4]    = p3_timer.ruby;
	assign reg_ff05[5]    = p3_timer.rage;
	assign reg_ff05[6]    = p3_timer.peda;
	assign reg_ff05[7]    = p3_timer.nuga;
	assign reg_ff06[0]    = p3_timer.sabu;
	assign reg_ff06[1]    = p3_timer.nyke;
	assign reg_ff06[2]    = p3_timer.muru;
	assign reg_ff06[3]    = p3_timer.tyva;
	assign reg_ff06[4]    = p3_timer.tyru;
	assign reg_ff06[5]    = p3_timer.sufy;
	assign reg_ff06[6]    = p3_timer.peto;
	assign reg_ff06[7]    = p3_timer.seta;
	assign reg_ff07[0]    = p3_timer.sopu;
	assign reg_ff07[1]    = p3_timer.samy;
	assign reg_ff07[2]    = p3_timer.sabo;
	assign reg_ff07[7:3]  = '1;
	assign reg_ff0f[0]    = p2_interrupts.lope;
	assign reg_ff0f[1]    = p2_interrupts.lalu;
	assign reg_ff0f[2]    = p2_interrupts.nybo;
	assign reg_ff0f[3]    = p2_interrupts.ubul;
	assign reg_ff0f[4]    = p2_interrupts.ulak;
	assign reg_ff0f[7:5]  = '1;
	assign reg_ff10[0]    = p11_ch1_regs.bany;
	assign reg_ff10[1]    = p11_ch1_regs.arax;
	assign reg_ff10[2]    = p11_ch1_regs.anaz;
	assign reg_ff10[3]    = p11_ch1_regs.avaf;
	assign reg_ff10[4]    = p11_ch1_regs.adek;
	assign reg_ff10[5]    = p11_ch1_regs.bana;
	assign reg_ff10[6]    = p11_ch1_regs.botu;
	assign reg_ff10[7]    = '1;
	assign reg_ff10s[0]   = !p13_channel1.copa;
	assign reg_ff10s[1]   = !p13_channel1.caja;
	assign reg_ff10s[2]   = !p13_channel1.byra;
	assign reg_ff10s[3]   = reg_ff10[3];
	assign reg_ff10s[4]   = !p13_channel1.cupo;
	assign reg_ff10s[5]   = !p13_channel1.cypu;
	assign reg_ff10s[6]   = !p13_channel1.caxy;
	assign reg_ff10s[7]   = reg_ff10[7];
	assign reg_ff11[0]    = p13_channel1.bacy;
	assign reg_ff11[1]    = p13_channel1.cavy;
	assign reg_ff11[2]    = p13_channel1.bovy;
	assign reg_ff11[3]    = p13_channel1.cuno;
	assign reg_ff11[4]    = p13_channel1.cura;
	assign reg_ff11[5]    = p13_channel1.eram;
	assign reg_ff11[6]    = p11_ch1_regs.cena;
	assign reg_ff11[7]    = p11_ch1_regs.dyca;
	assign reg_ff12[0]    = p11_ch1_regs.jusa;
	assign reg_ff12[1]    = p11_ch1_regs.juzy;
	assign reg_ff12[2]    = p11_ch1_regs.joma;
	assign reg_ff12[3]    = p11_ch1_regs.jafy;
	assign reg_ff12[4]    = p11_ch1_regs.jaty;
	assign reg_ff12[5]    = p11_ch1_regs.jaxo;
	assign reg_ff12[6]    = p11_ch1_regs.jena;
	assign reg_ff12[7]    = p11_ch1_regs.jopu;
	assign reg_ff12s[0]   = !p13_channel1.jova;
	assign reg_ff12s[1]   = !p13_channel1.kenu;
	assign reg_ff12s[2]   = !p13_channel1.kera;
	assign reg_ff12s[3]   = reg_ff12[3];
	assign reg_ff12s[4]   = p13_channel1.hafo;
	assign reg_ff12s[5]   = p13_channel1.hemy;
	assign reg_ff12s[6]   = p13_channel1.hoko;
	assign reg_ff12s[7]   = p13_channel1.hevo;
	assign reg_ff13[0]    = p11_ch1_regs.gaxe;
	assign reg_ff13[1]    = p11_ch1_regs.hyfe;
	assign reg_ff13[2]    = p11_ch1_regs.jyty;
	assign reg_ff13[3]    = p11_ch1_regs.kyna;
	assign reg_ff13[4]    = p11_ch1_regs.jema;
	assign reg_ff13[5]    = p11_ch1_regs.hyke;
	assign reg_ff13[6]    = p11_ch1_regs.feva;
	assign reg_ff13[7]    = p11_ch1_regs.ekov;
	assign reg_ff13s[0]   = p12_ch1_sweep.hyka;
	assign reg_ff13s[1]   = p12_ch1_sweep.jyka;
	assign reg_ff13s[2]   = p12_ch1_sweep.havo;
	assign reg_ff13s[3]   = p12_ch1_sweep.edul;
	assign reg_ff13s[4]   = p12_ch1_sweep.fely;
	assign reg_ff13s[5]   = p12_ch1_sweep.holu;
	assign reg_ff13s[6]   = p12_ch1_sweep.hyxu;
	assign reg_ff13s[7]   = p12_ch1_sweep.hopo;
	assign reg_ff13t[0]   = p12_ch1_sweep.galo;
	assign reg_ff13t[1]   = p12_ch1_sweep.jode;
	assign reg_ff13t[2]   = p12_ch1_sweep.kare;
	assign reg_ff13t[3]   = p12_ch1_sweep.jyme;
	assign reg_ff13t[4]   = p12_ch1_sweep.gyme;
	assign reg_ff13t[5]   = p12_ch1_sweep.faxo;
	assign reg_ff13t[6]   = p12_ch1_sweep.exap;
	assign reg_ff13t[7]   = p12_ch1_sweep.dele;
	assign reg_ff13u[0]   = p12_ch1_sweep.fabu;
	assign reg_ff13u[1]   = p12_ch1_sweep.jefa;
	assign reg_ff13u[2]   = p12_ch1_sweep.goga;
	assign reg_ff13u[3]   = p12_ch1_sweep.jolu;
	assign reg_ff13u[4]   = p12_ch1_sweep.jota;
	assign reg_ff13u[5]   = p12_ch1_sweep.fude;
	assign reg_ff13u[6]   = p12_ch1_sweep.fedo;
	assign reg_ff13u[7]   = p12_ch1_sweep.exac;
	assign reg_ff13v[0]   = p12_ch1_sweep.hora;
	assign reg_ff13v[1]   = p12_ch1_sweep.hopa;
	assign reg_ff13v[2]   = p12_ch1_sweep.hele;
	assign reg_ff13v[3]   = p12_ch1_sweep.jape;
	assign reg_ff13v[4]   = p12_ch1_sweep.jete;
	assign reg_ff13v[5]   = p12_ch1_sweep.gele;
	assign reg_ff13v[6]   = p12_ch1_sweep.epyr;
	assign reg_ff13v[7]   = p12_ch1_sweep.edok;
	assign reg_ff14[0]    = p11_ch1_regs.emus;
	assign reg_ff14[1]    = p11_ch1_regs.evak;
	assign reg_ff14[2]    = p11_ch1_regs.copu;
	assign reg_ff14[5:3]  = '1;
	assign reg_ff14[6]    = p11_ch1_regs.boko;
	assign reg_ff14[7]    = p13_channel1.dupe;
	assign reg_ff14s[0]   = p12_ch1_sweep.dygy;
	assign reg_ff14s[1]   = p12_ch1_sweep.evab;
	assign reg_ff14s[2]   = p12_ch1_sweep.axan;
	assign reg_ff14s[6:3] = reg_ff14[6:3];
	assign reg_ff14s[7]   = p13_channel1.ezec;
	assign reg_ff14t[0]   = p12_ch1_sweep.dexe;
	assign reg_ff14t[1]   = p12_ch1_sweep.dofy;
	assign reg_ff14t[2]   = p12_ch1_sweep.doly;
	assign reg_ff14t[7:3] = reg_ff14[7:3];
	assign reg_ff14u[0]   = p12_ch1_sweep.elux;
	assign reg_ff14u[1]   = p12_ch1_sweep.agez;
	assign reg_ff14u[2]   = p12_ch1_sweep.beku;
	assign reg_ff14u[7:3] = reg_ff14[7:3];
	assign reg_ff14v[0]   = p12_ch1_sweep.defa;
	assign reg_ff14v[1]   = p12_ch1_sweep.eter;
	assign reg_ff14v[2]   = p12_ch1_sweep.deva;
	assign reg_ff14v[7:3] = reg_ff14[7:3];
	assign reg_ff16[0]    = p15_channel2.eryc;
	assign reg_ff16[1]    = p15_channel2.cera;
	assign reg_ff16[2]    = p15_channel2.conu;
	assign reg_ff16[3]    = p15_channel2.came;
	assign reg_ff16[4]    = p15_channel2.buva;
	assign reg_ff16[5]    = p15_channel2.akyd;
	assign reg_ff16[6]    = p14_ch2_regs.bera;
	assign reg_ff16[7]    = p14_ch2_regs.bamy;
	assign reg_ff17[0]    = p14_ch2_regs.hyfu;
	assign reg_ff17[1]    = p14_ch2_regs.hore;
	assign reg_ff17[2]    = p14_ch2_regs.hava;
	assign reg_ff17[3]    = p14_ch2_regs.fore;
	assign reg_ff17[4]    = p14_ch2_regs.gata;
	assign reg_ff17[5]    = p14_ch2_regs.gufe;
	assign reg_ff17[6]    = p14_ch2_regs.gura;
	assign reg_ff17[7]    = p14_ch2_regs.gage;
	assign reg_ff17s[0]   = !p15_channel2.jore;
	assign reg_ff17s[1]   = !p15_channel2.jona;
	assign reg_ff17s[2]   = !p15_channel2.jevy;
	assign reg_ff17s[3]   = reg_ff17[3];
	assign reg_ff17s[4]   = p15_channel2.feno;
	assign reg_ff17s[5]   = p15_channel2.fete;
	assign reg_ff17s[6]   = p15_channel2.fomy;
	assign reg_ff17s[7]   = p15_channel2.fena;
	assign reg_ff18[0]    = p14_ch2_regs.fofe;
	assign reg_ff18[1]    = p14_ch2_regs.fova;
	assign reg_ff18[2]    = p14_ch2_regs.fedy;
	assign reg_ff18[3]    = p14_ch2_regs.fome;
	assign reg_ff18[4]    = p14_ch2_regs.fora;
	assign reg_ff18[5]    = p14_ch2_regs.goda;
	assign reg_ff18[6]    = p14_ch2_regs.gumy;
	assign reg_ff18[7]    = p14_ch2_regs.gupu;
	assign reg_ff18s[0]   = p14_ch2_regs.done;
	assign reg_ff18s[1]   = p14_ch2_regs.dynu;
	assign reg_ff18s[2]   = p14_ch2_regs.ezof;
	assign reg_ff18s[3]   = p14_ch2_regs.cyvo;
	assign reg_ff18s[4]   = p14_ch2_regs.fuxo;
	assign reg_ff18s[5]   = p14_ch2_regs.gano;
	assign reg_ff18s[6]   = p14_ch2_regs.goca;
	assign reg_ff18s[7]   = p14_ch2_regs.gane;
	assign reg_ff19[0]    = p14_ch2_regs.jefu;
	assign reg_ff19[1]    = p14_ch2_regs.jany;
	assign reg_ff19[2]    = p14_ch2_regs.jupy;
	assign reg_ff19[5:3]  = '1;
	assign reg_ff19[6]    = p14_ch2_regs.emer;
	assign reg_ff19[7]    = p14_ch2_regs.etap;
	assign reg_ff19s[0]   = p14_ch2_regs.hevy;
	assign reg_ff19s[1]   = p14_ch2_regs.hepu;
	assign reg_ff19s[2]   = p14_ch2_regs.hero;
	assign reg_ff19s[6:3] = reg_ff19[6:3];
	assign reg_ff19s[7]   = p15_channel2.dope;
	assign reg_ff1a[6:0]  = '1;
	assign reg_ff1a[7]    = p16_ch3_regs.guxe;
	assign reg_ff1b[0]    = p18_channel3.gevo;
	assign reg_ff1b[1]    = p18_channel3.fory;
	assign reg_ff1b[2]    = p18_channel3.gatu;
	assign reg_ff1b[3]    = p18_channel3.gapo;
	assign reg_ff1b[4]    = p18_channel3.gemo;
	assign reg_ff1b[5]    = p18_channel3.foro;
	assign reg_ff1b[6]    = p18_channel3.fave;
	assign reg_ff1b[7]    = p18_channel3.fyru;
	assign reg_ff1c[0]    = p18_channel3.efar;
	assign reg_ff1c[1]    = p18_channel3.erus;
	assign reg_ff1c[2]    = p18_channel3.efuz;
	assign reg_ff1c[3]    = p18_channel3.exel;
	assign reg_ff1c[4]    = p18_channel3.efal;
	assign reg_ff1c[5]    = p16_ch3_regs.hody;
	assign reg_ff1c[6]    = p16_ch3_regs.huky;
	assign reg_ff1c[7]    = '1;
	assign reg_ff1d[0]    = p16_ch3_regs.koga;
	assign reg_ff1d[1]    = p16_ch3_regs.jovy;
	assign reg_ff1d[2]    = p16_ch3_regs.jaxa;
	assign reg_ff1d[3]    = p16_ch3_regs.jefe;
	assign reg_ff1d[4]    = p16_ch3_regs.jypo;
	assign reg_ff1d[5]    = p16_ch3_regs.jove;
	assign reg_ff1d[6]    = p16_ch3_regs.kana;
	assign reg_ff1d[7]    = p16_ch3_regs.kogu;
	assign reg_ff1ds[0]   = p18_channel3.kutu;
	assign reg_ff1ds[1]   = p18_channel3.kupe;
	assign reg_ff1ds[2]   = p18_channel3.kunu;
	assign reg_ff1ds[3]   = p18_channel3.kemu;
	assign reg_ff1ds[4]   = p18_channel3.kygu;
	assign reg_ff1ds[5]   = p18_channel3.kepa;
	assign reg_ff1ds[6]   = p18_channel3.kafo;
	assign reg_ff1ds[7]   = p18_channel3.keno;
	assign reg_ff1e[0]    = p16_ch3_regs.jemo;
	assign reg_ff1e[1]    = p16_ch3_regs.jety;
	assign reg_ff1e[2]    = p16_ch3_regs.jacy;
	assign reg_ff1e[5:3]  = '1;
	assign reg_ff1e[6]    = p16_ch3_regs.hoto;
	assign reg_ff1e[7]    = p16_ch3_regs.gavu;
	assign reg_ff1es[0]   = p18_channel3.keju;
	assign reg_ff1es[1]   = p18_channel3.keza;
	assign reg_ff1es[2]   = p18_channel3.japu;
	assign reg_ff1es[7:3] = reg_ff1e[7:3];
	assign reg_ff20[0]    = p19_ch4_regs.dano;
	assign reg_ff20[1]    = p19_ch4_regs.favy;
	assign reg_ff20[2]    = p19_ch4_regs.dena;
	assign reg_ff20[3]    = p19_ch4_regs.cedo;
	assign reg_ff20[4]    = p19_ch4_regs.fylo;
	assign reg_ff20[5]    = p19_ch4_regs.edop;
	assign reg_ff20[7:6]  = '1;
	assign reg_ff21[0]    = p19_ch4_regs.emok;
	assign reg_ff21[1]    = p19_ch4_regs.etyj;
	assign reg_ff21[2]    = p19_ch4_regs.ezyk;
	assign reg_ff21[3]    = p19_ch4_regs.geky;
	assign reg_ff21[4]    = p19_ch4_regs.garu;
	assign reg_ff21[5]    = p19_ch4_regs.goky;
	assign reg_ff21[6]    = p19_ch4_regs.gozo;
	assign reg_ff21[7]    = p19_ch4_regs.gedu;
	assign reg_ff21s[0]   = !p20_channel4.cuna;
	assign reg_ff21s[1]   = !p20_channel4.cofe;
	assign reg_ff21s[2]   = !p20_channel4.dogo;
	assign reg_ff21s[3]   = reg_ff21[3];
	assign reg_ff21s[4]   = p20_channel4.feko;
	assign reg_ff21s[5]   = p20_channel4.faty;
	assign reg_ff21s[6]   = p20_channel4.feru;
	assign reg_ff21s[7]   = p20_channel4.fyro;
	assign reg_ff22[0]    = p19_ch4_regs.jare;
	assign reg_ff22[1]    = p19_ch4_regs.jero;
	assign reg_ff22[2]    = p19_ch4_regs.jaky;
	assign reg_ff22[3]    = p19_ch4_regs.jamy;
	assign reg_ff22[4]    = p19_ch4_regs.feta;
	assign reg_ff22[5]    = p19_ch4_regs.fyto;
	assign reg_ff22[6]    = p19_ch4_regs.gogo;
	assign reg_ff22[7]    = p19_ch4_regs.gafo;
	assign reg_ff22s[0]   = !p20_channel4.jyco;
	assign reg_ff22s[1]   = !p20_channel4.jyre;
	assign reg_ff22s[2]   = !p20_channel4.jyfu;
	assign reg_ff22s[7:3] = reg_ff22[7:3];
	assign reg_ff23[5:0]  = '1;
	assign reg_ff23[6]    = p19_ch4_regs.cuny;
	assign reg_ff23[7]    = p19_ch4_regs.hoga;
	assign reg_ff23s[6:0] = reg_ff23[6:0];
	assign reg_ff23s[7]   = p20_channel4.gysu;
	assign reg_ff24[0]    = p9_apu_control.apeg;
	assign reg_ff24[1]    = p9_apu_control.byga;
	assign reg_ff24[2]    = p9_apu_control.ager;
	assign reg_ff24[3]    = p9_apu_control.apos;
	assign reg_ff24[4]    = p9_apu_control.byre;
	assign reg_ff24[5]    = p9_apu_control.bumo;
	assign reg_ff24[6]    = p9_apu_control.cozu;
	assign reg_ff24[7]    = p9_apu_control.bedu;
	assign reg_ff25[0]    = p9_apu_control.anev;
	assign reg_ff25[1]    = p9_apu_control.bogu;
	assign reg_ff25[2]    = p9_apu_control.bafo;
	assign reg_ff25[3]    = p9_apu_control.atuf;
	assign reg_ff25[4]    = p9_apu_control.bume;
	assign reg_ff25[5]    = p9_apu_control.bofa;
	assign reg_ff25[6]    = p9_apu_control.befo;
	assign reg_ff25[7]    = p9_apu_control.bepu;
	assign reg_ff26[0]    = !nch1_active;
	assign reg_ff26[1]    = !nch2_active;
	assign reg_ff26[2]    = !nch3_active;
	assign reg_ff26[3]    = !nch4_active;
	assign reg_ff26[4]    = p9_apu_control.fero;
	assign reg_ff26[5]    = p9_apu_control.bowy;
	assign reg_ff26[6]    = '1;
	assign reg_ff26[7]    = p9_apu_control.hada;
	assign reg_ff40[0]    = p23_video_regs.vyxe;
	assign reg_ff40[1]    = p23_video_regs.xylo;
	assign reg_ff40[2]    = p23_video_regs.xymo;
	assign reg_ff40[3]    = p23_video_regs.xafo;
	assign reg_ff40[4]    = p23_video_regs.wexu;
	assign reg_ff40[5]    = p23_video_regs.wymo;
	assign reg_ff40[6]    = p23_video_regs.woky;
	assign reg_ff40[7]    = p23_video_regs.xona;
	assign reg_ff41[0]    = p21_video_control.sadu;
	assign reg_ff41[1]    = p21_video_control.xaty;
	assign reg_ff41[2]    = !p21_video_control.nrupo;
	assign reg_ff41[3]    = p21_video_control.roxe;
	assign reg_ff41[4]    = p21_video_control.rufo;
	assign reg_ff41[5]    = p21_video_control.refe;
	assign reg_ff41[6]    = p21_video_control.rugu;
	assign reg_ff41[7]    = '1;
	assign reg_ff42[0]    = p23_video_regs.gave;
	assign reg_ff42[1]    = p23_video_regs.fymo;
	assign reg_ff42[2]    = p23_video_regs.fezu;
	assign reg_ff42[3]    = p23_video_regs.fujo;
	assign reg_ff42[4]    = p23_video_regs.dede;
	assign reg_ff42[5]    = p23_video_regs.foty;
	assign reg_ff42[6]    = p23_video_regs.foha;
	assign reg_ff42[7]    = p23_video_regs.funy;
	assign reg_ff43[0]    = p23_video_regs.daty;
	assign reg_ff43[1]    = p23_video_regs.duzu;
	assign reg_ff43[2]    = p23_video_regs.cyxu;
	assign reg_ff43[3]    = p23_video_regs.gubo;
	assign reg_ff43[4]    = p23_video_regs.bemy;
	assign reg_ff43[5]    = p23_video_regs.cuzy;
	assign reg_ff43[6]    = p23_video_regs.cabu;
	assign reg_ff43[7]    = p23_video_regs.bake;
	assign reg_ff44       = v;
	assign reg_ff45[0]    = p23_video_regs.syry;
	assign reg_ff45[1]    = p23_video_regs.vuce;
	assign reg_ff45[2]    = p23_video_regs.sedy;
	assign reg_ff45[3]    = p23_video_regs.salo;
	assign reg_ff45[4]    = p23_video_regs.sota;
	assign reg_ff45[5]    = p23_video_regs.vafa;
	assign reg_ff45[6]    = p23_video_regs.vevo;
	assign reg_ff45[7]    = p23_video_regs.raha;
	assign reg_ff46[0]    = p4_dma.nafa;
	assign reg_ff46[1]    = p4_dma.nygy;
	assign reg_ff46[2]    = p4_dma.para;
	assign reg_ff46[3]    = p4_dma.pyne;
	assign reg_ff46[4]    = p4_dma.pula;
	assign reg_ff46[5]    = p4_dma.nydo;
	assign reg_ff46[6]    = p4_dma.poku;
	assign reg_ff46[7]    = p4_dma.maru;
	assign reg_ff47[0]    = p36_palettes.pavo;
	assign reg_ff47[1]    = p36_palettes.nusy;
	assign reg_ff47[2]    = p36_palettes.pylu;
	assign reg_ff47[3]    = p36_palettes.maxy;
	assign reg_ff47[4]    = p36_palettes.muke;
	assign reg_ff47[5]    = p36_palettes.moru;
	assign reg_ff47[6]    = p36_palettes.mogy;
	assign reg_ff47[7]    = p36_palettes.mena;
	assign reg_ff48[0]    = p36_palettes.xufu;
	assign reg_ff48[1]    = p36_palettes.xuky;
	assign reg_ff48[2]    = p36_palettes.xova;
	assign reg_ff48[3]    = p36_palettes.xalo;
	assign reg_ff48[4]    = p36_palettes.xeru;
	assign reg_ff48[5]    = p36_palettes.xyze;
	assign reg_ff48[6]    = p36_palettes.xupo;
	assign reg_ff48[7]    = p36_palettes.xana;
	assign reg_ff49[0]    = p36_palettes.moxy;
	assign reg_ff49[1]    = p36_palettes.lawo;
	assign reg_ff49[2]    = p36_palettes.mosa;
	assign reg_ff49[3]    = p36_palettes.lose;
	assign reg_ff49[4]    = p36_palettes.lune;
	assign reg_ff49[5]    = p36_palettes.lugu;
	assign reg_ff49[6]    = p36_palettes.lepu;
	assign reg_ff49[7]    = p36_palettes.luxo;
	assign reg_ff50[0]    = p7_sys_decode.tepu;
	assign reg_ff50[7:1]  = '1;
	assign reg_ff60[0]    = p7_sys_decode.buro;
	assign reg_ff60[1]    = p7_sys_decode.amut;
	assign reg_ff60[7:2]  = '1;
	assign reg_cpg_count[0] = p21_video_control.saxo;
	assign reg_cpg_count[1] = p21_video_control.typo;
	assign reg_cpg_count[2] = p21_video_control.vyzo;
	assign reg_cpg_count[3] = p21_video_control.telu;
	assign reg_cpg_count[4] = p21_video_control.sude;
	assign reg_cpg_count[5] = p21_video_control.taha;
	assign reg_cpg_count[6] = p21_video_control.tyry;
	assign reg_oam_src[0] = p29_sprite_control.bese;
	assign reg_oam_src[1] = p29_sprite_control.cuxy;
	assign reg_oam_src[2] = p29_sprite_control.bego;
	assign reg_oam_src[3] = p29_sprite_control.dybe;
	assign reg_obj_y_cmp[0] = !p29_sprite_control.xuso;
	assign reg_obj_y_cmp[1] = !p29_sprite_control.xegu;
	assign reg_obj_y_cmp[2] = !p29_sprite_control.yjex;
	assign reg_obj_y_cmp[3] = !p29_sprite_control.xyju;
	assign reg_obj_y_cmp[4] = !p29_sprite_control.ybog;
	assign reg_obj_y_cmp[5] = !p29_sprite_control.wyso;
	assign reg_obj_y_cmp[6] = !p29_sprite_control.xote;
	assign reg_obj_y_cmp[7] = !p29_sprite_control.yzab;
	assign obj0 = { oam_a_ram[1], oam_b_ram[1], oam_a_ram[0], oam_b_ram[0] };
	assign obj1 = { oam_a_ram[3], oam_b_ram[3], oam_a_ram[2], oam_b_ram[2] };
	assign obj2 = { oam_a_ram[5], oam_b_ram[5], oam_a_ram[4], oam_b_ram[4] };
	assign obj3 = { oam_a_ram[7], oam_b_ram[7], oam_a_ram[6], oam_b_ram[6] };
	assign obj4 = { oam_a_ram[9], oam_b_ram[9], oam_a_ram[8], oam_b_ram[8] };
	assign obj5 = { oam_a_ram[11], oam_b_ram[11], oam_a_ram[10], oam_b_ram[10] };
	assign obj6 = { oam_a_ram[13], oam_b_ram[13], oam_a_ram[12], oam_b_ram[12] };
	assign obj7 = { oam_a_ram[15], oam_b_ram[15], oam_a_ram[14], oam_b_ram[14] };
	assign reg_obj8y[0] = p30_sprite_store.azap;
	assign reg_obj8y[1] = p30_sprite_store.afyx;
	assign reg_obj8y[2] = p30_sprite_store.afut;
	assign reg_obj8y[3] = p30_sprite_store.afym;
	assign reg_obj6y[0] = p30_sprite_store.zumy;
	assign reg_obj6y[1] = p30_sprite_store.zafu;
	assign reg_obj6y[2] = p30_sprite_store.zexo;
	assign reg_obj6y[3] = p30_sprite_store.zube;
	assign reg_obj4y[0] = p30_sprite_store.capo;
	assign reg_obj4y[1] = p30_sprite_store.caju;
	assign reg_obj4y[2] = p30_sprite_store.cono;
	assign reg_obj4y[3] = p30_sprite_store.cumu;
	assign reg_obj7y[0] = p30_sprite_store.xyna;
	assign reg_obj7y[1] = p30_sprite_store.ygum;
	assign reg_obj7y[2] = p30_sprite_store.xaku;
	assign reg_obj7y[3] = p30_sprite_store.xygo;
	assign reg_obj1y[0] = p30_sprite_store.ames;
	assign reg_obj1y[1] = p30_sprite_store.arof;
	assign reg_obj1y[2] = p30_sprite_store.abop;
	assign reg_obj1y[3] = p30_sprite_store.abug;
	assign reg_obj5y[0] = p30_sprite_store.acep;
	assign reg_obj5y[1] = p30_sprite_store.abeg;
	assign reg_obj5y[2] = p30_sprite_store.abux;
	assign reg_obj5y[3] = p30_sprite_store.aned;
	assign reg_obj3y[0] = p30_sprite_store.zuro;
	assign reg_obj3y[1] = p30_sprite_store.zylu;
	assign reg_obj3y[2] = p30_sprite_store.zene;
	assign reg_obj3y[3] = p30_sprite_store.zury;
	assign reg_obj2y[0] = p30_sprite_store.ylov;
	assign reg_obj2y[1] = p30_sprite_store.xosy;
	assign reg_obj2y[2] = p30_sprite_store.xazy;
	assign reg_obj2y[3] = p30_sprite_store.ykuk;
	assign reg_obj9y[0] = p30_sprite_store.cana;
	assign reg_obj9y[1] = p30_sprite_store.fofo;
	assign reg_obj9y[2] = p30_sprite_store.dysy;
	assign reg_obj9y[3] = p30_sprite_store.dewu;
	assign reg_obj0y[0] = p30_sprite_store.gyho;
	assign reg_obj0y[1] = p30_sprite_store.cufo;
	assign reg_obj0y[2] = p30_sprite_store.bozu;
	assign reg_obj0y[3] = p30_sprite_store.fyhy;
	assign reg_obj8i[0] = p30_sprite_store.byhe;
	assign reg_obj8i[1] = p30_sprite_store.bexy;
	assign reg_obj8i[2] = p30_sprite_store.bado;
	assign reg_obj8i[3] = p30_sprite_store.apev;
	assign reg_obj8i[4] = p30_sprite_store.bada;
	assign reg_obj8i[5] = p30_sprite_store.axuv;
	assign reg_obj6i[0] = p30_sprite_store.gabo;
	assign reg_obj6i[1] = p30_sprite_store.gacy;
	assign reg_obj6i[2] = p30_sprite_store.fogo;
	assign reg_obj6i[3] = p30_sprite_store.gohu;
	assign reg_obj6i[4] = p30_sprite_store.foxy;
	assign reg_obj6i[5] = p30_sprite_store.gecu;
	assign reg_obj4i[0] = p30_sprite_store.xave;
	assign reg_obj4i[1] = p30_sprite_store.xefe;
	assign reg_obj4i[2] = p30_sprite_store.wanu;
	assign reg_obj4i[3] = p30_sprite_store.xabo;
	assign reg_obj4i[4] = p30_sprite_store.xege;
	assign reg_obj4i[5] = p30_sprite_store.xynu;
	assign reg_obj7i[0] = p30_sprite_store.gule;
	assign reg_obj7i[1] = p30_sprite_store.gyno;
	assign reg_obj7i[2] = p30_sprite_store.fefa;
	assign reg_obj7i[3] = p30_sprite_store.fysu;
	assign reg_obj7i[4] = p30_sprite_store.gesy;
	assign reg_obj7i[5] = p30_sprite_store.fuzo;
	assign reg_obj1i[0] = p30_sprite_store.cadu;
	assign reg_obj1i[1] = p30_sprite_store.cebo;
	assign reg_obj1i[2] = p30_sprite_store.cufa;
	assign reg_obj1i[3] = p30_sprite_store.coma;
	assign reg_obj1i[4] = p30_sprite_store.cuza;
	assign reg_obj1i[5] = p30_sprite_store.cajy;
	assign reg_obj5i[0] = p30_sprite_store.ekop;
	assign reg_obj5i[1] = p30_sprite_store.etym;
	assign reg_obj5i[2] = p30_sprite_store.goru;
	assign reg_obj5i[3] = p30_sprite_store.ebex;
	assign reg_obj5i[4] = p30_sprite_store.etav;
	assign reg_obj5i[5] = p30_sprite_store.ekap;
	assign reg_obj3i[0] = p30_sprite_store.devy;
	assign reg_obj3i[1] = p30_sprite_store.dese;
	assign reg_obj3i[2] = p30_sprite_store.duny;
	assign reg_obj3i[3] = p30_sprite_store.duha;
	assign reg_obj3i[4] = p30_sprite_store.deba;
	assign reg_obj3i[5] = p30_sprite_store.dafu;
	assign reg_obj2i[0] = p30_sprite_store.buhe;
	assign reg_obj2i[1] = p30_sprite_store.byhu;
	assign reg_obj2i[2] = p30_sprite_store.beca;
	assign reg_obj2i[3] = p30_sprite_store.bulu;
	assign reg_obj2i[4] = p30_sprite_store.buna;
	assign reg_obj2i[5] = p30_sprite_store.boxa;
	assign reg_obj9i[0] = p30_sprite_store.yber;
	assign reg_obj9i[1] = p30_sprite_store.yzor;
	assign reg_obj9i[2] = p30_sprite_store.xyfe;
	assign reg_obj9i[3] = p30_sprite_store.xotu;
	assign reg_obj9i[4] = p30_sprite_store.xute;
	assign reg_obj9i[5] = p30_sprite_store.xufo;
	assign reg_obj0i[0] = p30_sprite_store.ywak;
	assign reg_obj0i[1] = p30_sprite_store.zony;
	assign reg_obj0i[2] = p30_sprite_store.wyte;
	assign reg_obj0i[3] = p30_sprite_store.yzep;
	assign reg_obj0i[4] = p30_sprite_store.ysok;
	assign reg_obj0i[5] = p30_sprite_store.ygus;
	assign reg_obj0x[0] = !p31_sprite_x_matchers.xepe;
	assign reg_obj0x[1] = !p31_sprite_x_matchers.ylah;
	assign reg_obj0x[2] = !p31_sprite_x_matchers.zola;
	assign reg_obj0x[3] = !p31_sprite_x_matchers.zulu;
	assign reg_obj0x[4] = !p31_sprite_x_matchers.welo;
	assign reg_obj0x[5] = !p31_sprite_x_matchers.xuny;
	assign reg_obj0x[6] = !p31_sprite_x_matchers.wote;
	assign reg_obj0x[7] = !p31_sprite_x_matchers.xako;
	assign reg_obj3x[0] = !p31_sprite_x_matchers.xoly;
	assign reg_obj3x[1] = !p31_sprite_x_matchers.xyba;
	assign reg_obj3x[2] = !p31_sprite_x_matchers.xabe;
	assign reg_obj3x[3] = !p31_sprite_x_matchers.xeka;
	assign reg_obj3x[4] = !p31_sprite_x_matchers.xomy;
	assign reg_obj3x[5] = !p31_sprite_x_matchers.wuha;
	assign reg_obj3x[6] = !p31_sprite_x_matchers.wyna;
	assign reg_obj3x[7] = !p31_sprite_x_matchers.weco;
	assign reg_obj7x[0] = !p31_sprite_x_matchers.eraz;
	assign reg_obj7x[1] = !p31_sprite_x_matchers.epum;
	assign reg_obj7x[2] = !p31_sprite_x_matchers.erol;
	assign reg_obj7x[3] = !p31_sprite_x_matchers.ehyn;
	assign reg_obj7x[4] = !p31_sprite_x_matchers.fazu;
	assign reg_obj7x[5] = !p31_sprite_x_matchers.faxe;
	assign reg_obj7x[6] = !p31_sprite_x_matchers.exuk;
	assign reg_obj7x[7] = !p31_sprite_x_matchers.fede;
	assign reg_obj1x[0] = !p31_sprite_x_matchers.dany;
	assign reg_obj1x[1] = !p31_sprite_x_matchers.duko;
	assign reg_obj1x[2] = !p31_sprite_x_matchers.desu;
	assign reg_obj1x[3] = !p31_sprite_x_matchers.dazo;
	assign reg_obj1x[4] = !p31_sprite_x_matchers.dake;
	assign reg_obj1x[5] = !p31_sprite_x_matchers.ceso;
	assign reg_obj1x[6] = !p31_sprite_x_matchers.dyfu;
	assign reg_obj1x[7] = !p31_sprite_x_matchers.cusy;
	assign reg_obj6x[0] = !p31_sprite_x_matchers.ycol;
	assign reg_obj6x[1] = !p31_sprite_x_matchers.yrac;
	assign reg_obj6x[2] = !p31_sprite_x_matchers.ymem;
	assign reg_obj6x[3] = !p31_sprite_x_matchers.yvag;
	assign reg_obj6x[4] = !p31_sprite_x_matchers.zoly;
	assign reg_obj6x[5] = !p31_sprite_x_matchers.zogo;
	assign reg_obj6x[6] = !p31_sprite_x_matchers.zecu;
	assign reg_obj6x[7] = !p31_sprite_x_matchers.zesa;
	assign reg_obj4x[0] = !p31_sprite_x_matchers.wedu;
	assign reg_obj4x[1] = !p31_sprite_x_matchers.ygaj;
	assign reg_obj4x[2] = !p31_sprite_x_matchers.zyjo;
	assign reg_obj4x[3] = !p31_sprite_x_matchers.xury;
	assign reg_obj4x[4] = !p31_sprite_x_matchers.ybed;
	assign reg_obj4x[5] = !p31_sprite_x_matchers.zala;
	assign reg_obj4x[6] = !p31_sprite_x_matchers.wyde;
	assign reg_obj4x[7] = !p31_sprite_x_matchers.xepa;
	assign reg_obj8x[0] = !p31_sprite_x_matchers.gavy;
	assign reg_obj8x[1] = !p31_sprite_x_matchers.gypu;
	assign reg_obj8x[2] = !p31_sprite_x_matchers.gady;
	assign reg_obj8x[3] = !p31_sprite_x_matchers.gaza;
	assign reg_obj8x[4] = !p31_sprite_x_matchers.ezuf;
	assign reg_obj8x[5] = !p31_sprite_x_matchers.enad;
	assign reg_obj8x[6] = !p31_sprite_x_matchers.ebow;
	assign reg_obj8x[7] = !p31_sprite_x_matchers.fyca;
	assign reg_obj9x[0] = !p31_sprite_x_matchers.xuvy;
	assign reg_obj9x[1] = !p31_sprite_x_matchers.xere;
	assign reg_obj9x[2] = !p31_sprite_x_matchers.xuzo;
	assign reg_obj9x[3] = !p31_sprite_x_matchers.xexa;
	assign reg_obj9x[4] = !p31_sprite_x_matchers.ypod;
	assign reg_obj9x[5] = !p31_sprite_x_matchers.yrop;
	assign reg_obj9x[6] = !p31_sprite_x_matchers.ynep;
	assign reg_obj9x[7] = !p31_sprite_x_matchers.yzof;
	assign reg_obj5x[0] = !p31_sprite_x_matchers.fusa;
	assign reg_obj5x[1] = !p31_sprite_x_matchers.faxa;
	assign reg_obj5x[2] = !p31_sprite_x_matchers.fozy;
	assign reg_obj5x[3] = !p31_sprite_x_matchers.fesy;
	assign reg_obj5x[4] = !p31_sprite_x_matchers.cywe;
	assign reg_obj5x[5] = !p31_sprite_x_matchers.dyby;
	assign reg_obj5x[6] = !p31_sprite_x_matchers.dury;
	assign reg_obj5x[7] = !p31_sprite_x_matchers.cuvy;
	assign reg_obj2x[0] = !p31_sprite_x_matchers.foka;
	assign reg_obj2x[1] = !p31_sprite_x_matchers.fyty;
	assign reg_obj2x[2] = !p31_sprite_x_matchers.fuby;
	assign reg_obj2x[3] = !p31_sprite_x_matchers.goxu;
	assign reg_obj2x[4] = !p31_sprite_x_matchers.duhy;
	assign reg_obj2x[5] = !p31_sprite_x_matchers.ejuf;
	assign reg_obj2x[6] = !p31_sprite_x_matchers.enor;
	assign reg_obj2x[7] = !p31_sprite_x_matchers.depy;

endmodule
