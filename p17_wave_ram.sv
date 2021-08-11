`default_nettype none

module wave_ram(
		inout tri logic [7:0] d,

		input logic ncpu_rd, apu_wr, apu_reset,

		input  logic amuk_4mhz,
		output logic butu_512khz,

		output logic wave_ram_rd, nwave_ram_wr, wave_ram_ctrl1,
		input  logic ff3x, ch3_active, buke, gase, efar_q,

		input  logic [7:0] wave_rd_d,
		output logic [3:0] wave_play_d
	);

	logic beka, coju, baja, bufe, acor;
	logic akaf, cuto, bero, baca, adok, atec, cegu, cugo;
	logic bezu, desa, bava, bune, bade, baty, desy, dugu;
	logic bepa, bora, cevo, cuvo, begu, budy, cesy, cyfo;
	logic copo, cuzo, dazy, date;
	dffr dffr_bepa(coju, acor, wave_rd_d[7], bepa); // check clk edge
	dffr dffr_bora(baja, acor, wave_rd_d[6], bora); // check clk edge
	dffr dffr_cevo(bufe, acor, wave_rd_d[5], cevo); // check clk edge
	dffr dffr_cuvo(beka, acor, wave_rd_d[4], cuvo); // check clk edge
	dffr dffr_begu(coju, acor, wave_rd_d[3], begu); // check clk edge
	dffr dffr_budy(baja, acor, wave_rd_d[2], budy); // check clk edge
	dffr dffr_cesy(bufe, acor, wave_rd_d[1], cesy); // check clk edge
	dffr dffr_cyfo(beka, acor, wave_rd_d[0], cyfo); // check clk edge
	assign #T_INV  beka = !butu_512khz;
	assign #T_INV  coju = !butu_512khz;
	assign #T_INV  baja = !butu_512khz;
	assign #T_INV  bufe = !butu_512khz;
	assign #T_INV  acor = !apu_reset;
	assign #T_INV  akaf = !wave_rd_d[7];
	assign #T_INV  cuto = !wave_rd_d[6];
	assign #T_INV  bero = !wave_rd_d[5];
	assign #T_INV  baca = !wave_rd_d[4];
	assign #T_INV  adok = !wave_rd_d[3];
	assign #T_INV  atec = !wave_rd_d[2];
	assign #T_INV  cegu = !wave_rd_d[1];
	assign #T_INV  cugo = !wave_rd_d[0];
	assign #T_TRI  bezu = wave_ram_rd ? !akaf : 'z;
	assign #T_TRI  desa = wave_ram_rd ? !cuto : 'z;
	assign #T_TRI  bava = wave_ram_rd ? !bero : 'z;
	assign #T_TRI  bune = wave_ram_rd ? !baca : 'z;
	assign #T_TRI  bade = wave_ram_rd ? !adok : 'z;
	assign #T_TRI  baty = wave_ram_rd ? !atec : 'z;
	assign #T_TRI  desy = wave_ram_rd ? !cegu : 'z;
	assign #T_TRI  dugu = wave_ram_rd ? !cugo : 'z;
	assign #T_MUXI copo = !(efar_q ? !begu : !bepa); /* takes !q outputs of dffs */
	assign #T_MUXI cuzo = !(efar_q ? !budy : !bora); /* takes !q outputs of dffs */
	assign #T_MUXI dazy = !(efar_q ? !cesy : !cevo); /* takes !q outputs of dffs */
	assign #T_MUXI date = !(efar_q ? !cyfo : !cuvo); /* takes !q outputs of dffs */
	assign d           = { bezu, desa, bava, bune, bade, baty, desy, dugu };
	assign wave_play_d = { copo, cuzo, dazy, date };

	logic abur, bama, aruc, bory, beta, azet, busa, cozy, azor, buku, boxo;
	logic boru, bano, atur, azus, aler, butu;
	dffr dffr_azet(aruc,      bama, azus, azet); // check clk edge
	dffr dffr_busa(amuk_4mhz, bama, gase, busa); // check clk edge
	dffr dffr_bano(cozy,      bama, busa, bano); // check clk edge
	dffr dffr_azus(amuk_4mhz, bama, bano, azus); // check clk edge
	assign #T_INV  abur = !buke;
	assign #T_INV  bama = !apu_reset;
	assign #T_INV  aruc = !amuk_4mhz;
	assign #T_INV  bory = !abur;
	assign #T_OR   beta = wave_ram_wr || wave_ram_rd || bory;
	assign #T_INV  cozy = !amuk_4mhz;
	assign #T_INV  azor = !beta;
	assign #T_INV  buku = !azor;
	assign #T_NOR  boxo = !(azus || azet);
	assign #T_INV  boru = !boxo;
	assign #T_MUX  atur = ch3_active ? boru : buku;
	assign #T_INV  aler = !atur;
	assign #T_INV  butu = azus; /* takes !q output of dff */
	assign wave_ram_ctrl1 = aler;
	assign butu_512khz    = butu;

	logic boke, bena, byza, cazu, amyt, wave_ram_wr;
	assign #T_INV  boke = !ncpu_rd;
	assign #T_NAND bena = !(boke && ff3x);
	assign #T_AND  byza = apu_wr && ff3x;
	assign #T_INV  cazu = !bena;
	assign #T_INV  amyt = !byza;
	assign wave_ram_rd  = cazu;
	assign wave_ram_wr  = byza;
	assign nwave_ram_wr = amyt;

endmodule
