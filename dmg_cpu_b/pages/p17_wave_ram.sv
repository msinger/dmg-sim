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
	drlatch latch_bepa(butu_512khz, acor, wave_rd_d[7], bepa);
	drlatch latch_bora(butu_512khz, acor, wave_rd_d[6], bora);
	drlatch latch_cevo(butu_512khz, acor, wave_rd_d[5], cevo);
	drlatch latch_cuvo(butu_512khz, acor, wave_rd_d[4], cuvo);
	drlatch latch_begu(butu_512khz, acor, wave_rd_d[3], begu);
	drlatch latch_budy(butu_512khz, acor, wave_rd_d[2], budy);
	drlatch latch_cesy(butu_512khz, acor, wave_rd_d[1], cesy);
	drlatch latch_cyfo(butu_512khz, acor, wave_rd_d[0], cyfo);
	assign  beka = !butu_512khz;
	assign  coju = !butu_512khz;
	assign  baja = !butu_512khz;
	assign  bufe = !butu_512khz;
	assign  acor = !apu_reset;
	assign  akaf = !wave_rd_d[7];
	assign  cuto = !wave_rd_d[6];
	assign  bero = !wave_rd_d[5];
	assign  baca = !wave_rd_d[4];
	assign  adok = !wave_rd_d[3];
	assign  atec = !wave_rd_d[2];
	assign  cegu = !wave_rd_d[1];
	assign  cugo = !wave_rd_d[0];
	assign  bezu = wave_ram_rd ? !akaf : 'z;
	assign  desa = wave_ram_rd ? !cuto : 'z;
	assign  bava = wave_ram_rd ? !bero : 'z;
	assign  bune = wave_ram_rd ? !baca : 'z;
	assign  bade = wave_ram_rd ? !adok : 'z;
	assign  baty = wave_ram_rd ? !atec : 'z;
	assign  desy = wave_ram_rd ? !cegu : 'z;
	assign  dugu = wave_ram_rd ? !cugo : 'z;
	assign copo = !(efar_q ? !begu : !bepa);
	assign cuzo = !(efar_q ? !budy : !bora);
	assign dazy = !(efar_q ? !cesy : !cevo);
	assign date = !(efar_q ? !cyfo : !cuvo);
	assign d           = { bezu, desa, bava, bune, bade, baty, desy, dugu };
	assign wave_play_d = { copo, cuzo, dazy, date };

	logic abur, bama, aruc, bory, beta, azet, busa, cozy, azor, buku, boxo;
	logic boru, bano, atur, azus, aler, butu;
	dffr_bp dffr_azet(aruc,      bama, azus, azet);
	dffr_bp dffr_busa(amuk_4mhz, bama, gase, busa);
	dffr_bp dffr_bano(cozy,      bama, busa, bano);
	dffr_bp dffr_azus(amuk_4mhz, bama, bano, azus);
	assign  abur = !buke;
	assign  bama = !apu_reset;
	assign  aruc = !amuk_4mhz;
	assign  bory = !abur;
	assign   beta = wave_ram_wr || wave_ram_rd || bory;
	assign  cozy = !amuk_4mhz;
	assign  azor = !beta;
	assign  buku = !azor;
	assign  boxo = !(azus || azet);
	assign  boru = !boxo;
	assign  atur = ch3_active ? boru : buku;
	assign  aler = !atur;
	assign  butu = !(!azus);
	assign wave_ram_ctrl1 = aler;
	assign butu_512khz    = butu;

	logic boke, bena, byza, cazu, amyt, wave_ram_wr;
	assign  boke = !ncpu_rd;
	assign bena = !(boke && ff3x);
	assign  byza = apu_wr && ff3x;
	assign  cazu = !bena;
	assign  amyt = !byza;
	assign wave_ram_rd  = cazu;
	assign wave_ram_wr  = byza;
	assign nwave_ram_wr = amyt;

endmodule
