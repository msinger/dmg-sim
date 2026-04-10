`default_nettype none

module dmg_cpu_b #(
		parameter real L_cs_n_pad    = 0,
		parameter real L_mcs_n_pad   = 0,
		parameter real L_mrd_n_pad   = 0,
		parameter real L_mwr_n_pad   = 0,
		parameter real L_nmi_n_pad   = 0,
		parameter real L_rd_n_pad    = 0,
		parameter real L_wr_n_pad    = 0,
		parameter real L_a_pad0      = 0,
		parameter real L_a_pad1      = 0,
		parameter real L_a_pad10     = 0,
		parameter real L_a_pad11     = 0,
		parameter real L_a_pad12     = 0,
		parameter real L_a_pad13     = 0,
		parameter real L_a_pad14     = 0,
		parameter real L_a_pad15     = 0,
		parameter real L_a_pad2      = 0,
		parameter real L_a_pad3      = 0,
		parameter real L_a_pad4      = 0,
		parameter real L_a_pad5      = 0,
		parameter real L_a_pad6      = 0,
		parameter real L_a_pad7      = 0,
		parameter real L_a_pad8      = 0,
		parameter real L_a_pad9      = 0,
		parameter real L_ck2_pad     = 0,
		parameter real L_cp_pad      = 0,
		parameter real L_cpg_pad     = 0,
		parameter real L_cpl_pad     = 0,
		parameter real L_d_pad0      = 0,
		parameter real L_d_pad1      = 0,
		parameter real L_d_pad2      = 0,
		parameter real L_d_pad3      = 0,
		parameter real L_d_pad4      = 0,
		parameter real L_d_pad5      = 0,
		parameter real L_d_pad6      = 0,
		parameter real L_d_pad7      = 0,
		parameter real L_fr_pad      = 0,
		parameter real L_ld_pad0     = 0,
		parameter real L_ld_pad1     = 0,
		parameter real L_m1_pad      = 0,
		parameter real L_ma_pad0     = 0,
		parameter real L_ma_pad1     = 0,
		parameter real L_ma_pad10    = 0,
		parameter real L_ma_pad11    = 0,
		parameter real L_ma_pad12    = 0,
		parameter real L_ma_pad2     = 0,
		parameter real L_ma_pad3     = 0,
		parameter real L_ma_pad4     = 0,
		parameter real L_ma_pad5     = 0,
		parameter real L_ma_pad6     = 0,
		parameter real L_ma_pad7     = 0,
		parameter real L_ma_pad8     = 0,
		parameter real L_ma_pad9     = 0,
		parameter real L_md_pad0     = 0,
		parameter real L_md_pad1     = 0,
		parameter real L_md_pad2     = 0,
		parameter real L_md_pad3     = 0,
		parameter real L_md_pad4     = 0,
		parameter real L_md_pad5     = 0,
		parameter real L_md_pad6     = 0,
		parameter real L_md_pad7     = 0,
		parameter real L_p10_pad     = 0,
		parameter real L_p11_pad     = 0,
		parameter real L_p12_pad     = 0,
		parameter real L_p13_pad     = 0,
		parameter real L_p14_pad     = 0,
		parameter real L_p15_pad     = 0,
		parameter real L_phi_pad     = 0,
		parameter real L_s_pad       = 0,
		parameter real L_sck_pad     = 0,
		parameter real L_sin_pad     = 0,
		parameter real L_so1_pad     = 0,
		parameter real L_so2_pad     = 0,
		parameter real L_sout_pad    = 0,
		parameter real L_st_pad      = 0
	) (
		inout  tri logic [15:0] a_pad,
		inout  tri logic [7:0] d_pad,
		output     logic [1:0] ld_pad,
		output     logic [12:0] ma_pad,
		inout  tri logic [7:0] md_pad,
		output     logic cs_n_pad,
		inout  tri logic mcs_n_pad,
		inout  tri logic mrd_n_pad,
		inout  tri logic mwr_n_pad,
		inout  tri logic nmi_n_pad,
		inout  tri logic rd_n_pad,
		input      logic reset_n_pad,
		inout  tri logic wr_n_pad,
		input      logic ck1_pad,
		output     logic ck2_pad,
		output     logic cp_pad,
		output     logic cpg_pad,
		output     logic cpl_pad,
		output     logic fr_pad,
		output     logic m1_pad,
		inout  tri logic p10_pad,
		inout  tri logic p11_pad,
		inout  tri logic p12_pad,
		inout  tri logic p13_pad,
		output tri logic p14_pad,
		output tri logic p15_pad,
		output     logic phi_pad,
		output     logic s_pad,
		inout  tri logic sck_pad,
		inout  tri logic sin_pad,
		output      real so1_pad,
		output      real so2_pad,
		output     logic sout_pad,
		output     logic st_pad,
		input      logic t1_pad,
		input      logic t2_pad,
		input       real vin_pad
	);

	logic     [3:0] ch1_out;
	logic     [3:0] ch2_out;
	logic     [3:0] ch3_out;
	logic     [3:0] ch4_out;
	tri logic [7:0] cpu_internal_db;
	logic     a0_in_n;
	logic     a1_in_n;
	logic     a10_in_n;
	logic     a11_in_n;
	logic     a12_in_n;
	logic     a13_in_n;
	logic     a14_in_n;
	logic     a15_in_n;
	logic     a2_in_n;
	logic     a3_in_n;
	logic     a4_in_n;
	logic     a5_in_n;
	logic     a6_in_n;
	logic     a7_in_n;
	logic     a8_in_n;
	logic     a9_in_n;
	logic     abeg_n;
	logic     abel_n;
	logic     abop_n;
	logic     abug_n;
	logic     abux_n;
	logic     acep_n;
	logic     adyk_n;
	logic     afur_n;
	logic     afut_n;
	logic     afym_n;
	logic     afyx_n;
	logic     ajer_n;
	logic     ames_n;
	logic     amp_en_n;
	logic     aned_n;
	logic     anev_n;
	logic     apev_n;
	logic     apos_n;
	logic     apu_rd_n;
	logic     apu_reset_n;
	logic     apu_reset2_n;
	logic     apu_reset3_n;
	logic     apu_reset4_n;
	logic     apu_reset5_n;
	logic     apu_reset6_n;
	logic     apuk_n;
	logic     arof_n;
	logic     asol_n;
	logic     atep_n;
	logic     atuf_n;
	logic     atyk_n;
	logic     avok_n;
	logic     axuv_n;
	logic     azap_n;
	logic     azus_n;
	logic     bada_n;
	logic     bado_n;
	logic     bafo_n;
	logic     bake_n;
	logic     bara_n;
	logic     beca_n;
	logic     bedu_n;
	logic     befo_n;
	logic     bego_n;
	logic     begu_n;
	logic     bemy_n;
	logic     bepa_n;
	logic     bepu_n;
	logic     bese_n;
	logic     bexy_n;
	logic     bg_cy_rst_n;
	logic     bgp_d0_n;
	logic     bgp_d1_n;
	logic     bgp_d2_n;
	logic     bgp_d3_n;
	logic     bgp_d4_n;
	logic     bgp_d5_n;
	logic     bgp_d6_n;
	logic     bgp_d7_n;
	logic     bofa_n;
	logic     bogu_n;
	logic     bora_n;
	logic     boxa_n;
	logic     bozu_n;
	logic     budy_n;
	logic     buhe_n;
	logic     bulu_n;
	logic     bume_n;
	logic     buna_n;
	logic     byba_n;
	logic     byhe_n;
	logic     byhu_n;
	logic     bylu_n;
	logic     byte_n;
	logic     cabu_n;
	logic     cadu_n;
	logic     cafa_n;
	logic     cagy_n;
	logic     caju_n;
	logic     cajy_n;
	logic     calo_n;
	logic     caly_n;
	logic     came_n;
	logic     cana_n;
	logic     cano_n;
	logic     capo_n;
	logic     caru_n;
	logic     cebo_n;
	logic     cedo_n;
	logic     cemo_n;
	logic     ceno_n;
	logic     cero_n;
	logic     cery_n;
	logic     cesy_n;
	logic     cevo_n;
	logic     cexo_n;
	logic     ch1_active_n;
	logic     ch1_amp_en_n;
	logic     ch1_ld_shift_n;
	logic     ch1_sum_ovfl_n;
	logic     ch2_active_n;
	logic     ch2_amp_en_n;
	logic     ch3_active_n;
	logic     ch3_amp_en_n;
	logic     ch4_active_n;
	logic     ch4_amp_en_n;
	logic     clk_1mhz_n;
	logic     clk_bg_bp_b_n;
	logic     clk_ena_n;
	logic     clk_in_n;
	tri logic clk_t4_n;
	logic     cofy_n;
	logic     coma_n;
	logic     comy_n;
	logic     cono_n;
	logic     copu_n;
	logic     coty_n;
	logic     cpu_oam_rd_n;
	logic     cuba_n;
	logic     cufa_n;
	logic     cufo_n;
	logic     culy_n;
	logic     cumu_n;
	logic     cuno_n;
	logic     cuvo_n;
	logic     cuxy_n;
	logic     cuza_n;
	logic     cuzy_n;
	logic     cyde_n;
	logic     cyfo_n;
	logic     cylo_n;
	logic     cyra_n;
	logic     cyre_n;
	logic     cyvo_n;
	logic     cyxu_n;
	logic     d0_in_n;
	logic     d1_in_n;
	logic     d2_in_n;
	logic     d3_in_n;
	logic     d4_in_n;
	logic     d5_in_n;
	logic     d6_in_n;
	logic     d7_in_n;
	logic     dafu_n;
	logic     dala_n;
	logic     dale_n;
	logic     dape_n;
	tri logic data_phase_n;
	logic     daty_n;
	logic     davo_n;
	logic     deba_n;
	logic     dede_n;
	logic     degu_n;
	logic     deko_n;
	logic     demo_n;
	logic     dere_n;
	logic     dese_n;
	logic     dete_n;
	logic     devy_n;
	logic     dewu_n;
	logic     dma_a0_n;
	logic     dma_a1_n;
	logic     dma_a10_n;
	logic     dma_a11_n;
	logic     dma_a12_n;
	logic     dma_a13_n;
	logic     dma_a14_n;
	logic     dma_a15_n;
	logic     dma_a2_n;
	logic     dma_a3_n;
	logic     dma_a4_n;
	logic     dma_a5_n;
	logic     dma_a6_n;
	logic     dma_a7_n;
	logic     dma_a8_n;
	logic     dma_a9_n;
	logic     dma_phi_n;
	logic     dojo_n;
	logic     doke_n;
	logic     done_n;
	logic     dose_n;
	logic     dota_n;
	logic     dovu_n;
	logic     duha_n;
	logic     duny_n;
	logic     dure_n;
	logic     duzu_n;
	logic     dybe_n;
	logic     dynu_n;
	logic     dyra_n;
	logic     dysy_n;
	logic     dyve_n;
	logic     ebex_n;
	logic     eced_n;
	logic     eder_n;
	logic     efal_n;
	logic     efar_n;
	logic     efuz_n;
	logic     ejab_n;
	logic     ekap_n;
	logic     ekop_n;
	logic     ekov_n;
	logic     elyn_n;
	logic     emus_n;
	logic     epor_n;
	logic     erod_n;
	logic     eros_n;
	logic     erus_n;
	logic     erut_n;
	logic     esep_n;
	logic     esut_n;
	logic     etav_n;
	logic     etym_n;
	logic     evak_n;
	logic     exec_phase_n;
	logic     exel_n;
	logic     ext_a15_en_n;
	logic     ext_addr_en_n;
	logic     ezef_n;
	logic     ezof_n;
	logic     faha_n;
	logic     faty_n;
	logic     fefa_n;
	logic     feko_n;
	logic     femu_n;
	logic     feno_n;
	logic     fero_n;
	logic     feru_n;
	logic     fete_n;
	logic     fety_n;
	logic     feva_n;
	logic     fexu_n;
	logic     fexx_ffxx_n;
	logic     fezu_n;
	logic     ff00wr_n;
	logic     ff0f_rd_n;
	logic     ff0f_wr_n;
	logic     ff10_d0_n;
	logic     ff10_d1_n;
	logic     ff10_d2_n;
	logic     ff10_d3_n;
	logic     ff10_d4_n;
	logic     ff10_d5_n;
	logic     ff10_d6_n;
	logic     ff11_d6_n;
	logic     ff11_d7_n;
	logic     ff12_d0_n;
	logic     ff12_d1_n;
	logic     ff12_d2_n;
	logic     ff12_d3_n;
	logic     ff14_d6_n;
	logic     ff16_d6_n;
	logic     ff16_d7_n;
	logic     ff17_d0_n;
	logic     ff17_d1_n;
	logic     ff17_d2_n;
	logic     ff17_d3_n;
	logic     ff19_d6_n;
	logic     ff1c_d5_n;
	logic     ff1c_d6_n;
	logic     ff1e_d6_n;
	logic     ff1x_n;
	logic     ff21_d0_n;
	logic     ff21_d1_n;
	logic     ff21_d2_n;
	logic     ff21_d3_n;
	logic     ff22_d0_n;
	logic     ff22_d1_n;
	logic     ff22_d2_n;
	logic     ff22_d3_n;
	logic     ff22_d4_n;
	logic     ff22_d5_n;
	logic     ff22_d6_n;
	logic     ff23_d6_n;
	logic     ff24_ff25_ff26_reset_n;
	logic     ff2x_n;
	logic     ff4a_d0_n;
	logic     ff4a_d1_n;
	logic     ff4a_d2_n;
	logic     ff4a_d3_n;
	logic     ff4a_d4_n;
	logic     ff4a_d5_n;
	logic     ff4a_d6_n;
	logic     ff4a_d7_n;
	logic     ff4b_d0_n;
	logic     ff4b_d1_n;
	logic     ff4b_d2_n;
	logic     ff4b_d3_n;
	logic     ff4b_d4_n;
	logic     ff4b_d5_n;
	logic     ff4b_d6_n;
	logic     ff4b_d7_n;
	logic     ffxx_n;
	logic     fofo_n;
	logic     fogo_n;
	logic     foha_n;
	logic     fomy_n;
	logic     fony_n;
	logic     foty_n;
	logic     foxy_n;
	logic     fugo_n;
	logic     fujo_n;
	logic     funy_n;
	logic     fuxo_n;
	logic     fuzo_n;
	logic     fyfo_n;
	logic     fyhy_n;
	logic     fymo_n;
	logic     fysu_n;
	logic     gabo_n;
	logic     gacy_n;
	logic     gafo_n;
	logic     gage_n;
	logic     gane_n;
	logic     gano_n;
	logic     gapo_n;
	logic     garu_n;
	logic     gata_n;
	logic     gave_n;
	logic     gaxe_n;
	logic     gecu_n;
	logic     gedu_n;
	logic     gesy_n;
	logic     goca_n;
	logic     gofy_n;
	logic     gohu_n;
	logic     goky_n;
	logic     goru_n;
	logic     goso_n;
	logic     gozo_n;
	logic     gubo_n;
	logic     gufe_n;
	logic     gule_n;
	logic     gura_n;
	logic     gyho_n;
	logic     gyko_n;
	logic     gyno_n;
	logic     h_reset_n;
	logic     h0_n;
	logic     h1_n;
	logic     h2_n;
	logic     h3_n;
	logic     h4_n;
	logic     h5_n;
	logic     h6_n;
	logic     h7_n;
	logic     hada_n;
	logic     hafo_n;
	logic     hazo_n;
	logic     hemy_n;
	logic     hepu_n;
	logic     hero_n;
	logic     hevy_n;
	logic     hoko_n;
	logic     hram_bl_precharge_n;
	logic     hram_wldrv_precharge_n;
	logic     huno_n;
	logic     hyfe_n;
	logic     hyke_n;
	logic     japu_n;
	logic     jaty_n;
	logic     jaxo_n;
	logic     jema_n;
	logic     jena_n;
	logic     jeso_n;
	logic     jopu_n;
	logic     jyna_n;
	logic     jyty_n;
	logic     kafo_n;
	logic     kaly_n;
	logic     keju_n;
	logic     kely_n;
	logic     kemu_n;
	logic     keno_n;
	logic     kepa_n;
	logic     keza_n;
	logic     kunu_n;
	logic     kupe_n;
	logic     kutu_n;
	logic     kygu_n;
	logic     kyna_n;
	logic     lafo_n;
	logic     latch_bg_bp_a_n;
	logic     laxu_n;
	logic     lebe_n;
	logic     lema_n;
	logic     lene_n;
	logic     lexa_n;
	logic     lovu_n;
	logic     lovy_n;
	logic     luca_n;
	logic     lvolume0_n;
	logic     lvolume1_n;
	logic     lvolume2_n;
	logic     lyc_stat_reset_n;
	logic     lydo_n;
	logic     lyxe_n;
	logic     m1_n;
	tri logic ma0_n;
	tri logic ma1_n;
	tri logic ma10_n;
	tri logic ma11_n;
	tri logic ma12_n;
	tri logic ma2_n;
	tri logic ma3_n;
	tri logic ma4_n;
	tri logic ma5_n;
	tri logic ma6_n;
	tri logic ma7_n;
	tri logic ma8_n;
	tri logic ma9_n;
	logic     mato_n;
	logic     maty_n;
	logic     mcs_in_n;
	logic     md0_in_n;
	logic     md1_in_n;
	logic     md2_in_n;
	logic     md3_in_n;
	logic     md4_in_n;
	logic     md5_in_n;
	logic     md6_in_n;
	logic     md7_in_n;
	logic     mesu_n;
	logic     mode3_n;
	logic     mopo_n;
	logic     mrd_in_n;
	logic     muru_n;
	logic     muwy_n;
	logic     mwr_in_n;
	logic     myro_n;
	logic     myte_n;
	logic     napo_n;
	logic     nejy_n;
	logic     no_sweep_n;
	logic     nopa_n;
	logic     nuga_n;
	logic     nuty_n;
	logic     nydu_n;
	logic     nyke_n;
	logic     nype_n;
	logic     nyva_n;
	logic     nyze_n;
	tri logic oam_a_d0_n;
	tri logic oam_a_d1_n;
	tri logic oam_a_d2_n;
	tri logic oam_a_d3_n;
	tri logic oam_a_d4_n;
	tri logic oam_a_d5_n;
	tri logic oam_a_d6_n;
	tri logic oam_a_d7_n;
	logic     oam_a_rd_n;
	logic     oam_a_wr_n;
	logic     oam_addr_cpu_n;
	logic     oam_addr_dma_n;
	logic     oam_addr_parse_n;
	logic     oam_addr_render_n;
	tri logic oam_b_d0_n;
	tri logic oam_b_d1_n;
	tri logic oam_b_d2_n;
	tri logic oam_b_d3_n;
	tri logic oam_b_d4_n;
	tri logic oam_b_d5_n;
	tri logic oam_b_d6_n;
	tri logic oam_b_d7_n;
	logic     oam_b_rd_n;
	logic     oam_b_wr_n;
	logic     oam_bl_precharge_n;
	logic     oam_parse_reset_n;
	logic     oam_rd_n;
	logic     oam_wldrv_precharge_n;
	logic     obp0_d0_n;
	logic     obp0_d1_n;
	logic     obp0_d2_n;
	logic     obp0_d3_n;
	logic     obp0_d4_n;
	logic     obp0_d5_n;
	logic     obp0_d6_n;
	logic     obp0_d7_n;
	logic     obp1_d0_n;
	logic     obp1_d1_n;
	logic     obp1_d2_n;
	logic     obp1_d3_n;
	logic     obp1_d4_n;
	logic     obp1_d5_n;
	logic     obp1_d6_n;
	logic     obp1_d7_n;
	logic     p10_in_n;
	logic     p11_in_n;
	logic     p12_in_n;
	logic     p13_in_n;
	logic     pavy_n;
	logic     pch_phase_n;
	logic     peda_n;
	logic     peru_n;
	logic     peto_n;
	logic     popu_n;
	logic     povy_n;
	logic     ppu_4mhz_n;
	logic     ppu_hard_reset_n;
	logic     ppu_reset_n;
	logic     ppu_reset2_n;
	logic     rage_n;
	logic     raha_n;
	logic     rate_n;
	logic     rd_in_n;
	logic     refe_n;
	logic     rega_n;
	logic     reset_div_n;
	logic     reset2_n;
	logic     roga_n;
	logic     roxe_n;
	logic     rubu_n;
	logic     ruby_n;
	logic     rufo_n;
	logic     rugu_n;
	logic     rupo_n;
	logic     rvolume0_n;
	logic     rvolume1_n;
	logic     rvolume2_n;
	logic     ryfa_n;
	logic     ryku_n;
	logic     sabo_n;
	logic     sabu_n;
	logic     salo_n;
	logic     samy_n;
	logic     saxo_n;
	logic     sck_en_n;
	logic     sck_n;
	logic     sedy_n;
	logic     serial_tick_n;
	logic     seta_n;
	logic     sin_n;
	logic     sola_n;
	logic     sopu_n;
	logic     sota_n;
	logic     soto_n;
	logic     sprite_save_en_n;
	logic     sprite_x0_n;
	logic     sprite_x1_n;
	logic     sprite_x2_n;
	logic     sprite_x3_n;
	logic     sprite_x4_n;
	logic     sprite_x5_n;
	logic     sprite_x6_n;
	logic     sprite_x7_n;
	logic     sprite_y0_n;
	logic     sprite_y1_n;
	logic     sprite_y2_n;
	logic     sprite_y3_n;
	logic     subu_n;
	logic     suda_n;
	logic     sude_n;
	logic     sufy_n;
	logic     sum_reset_n;
	logic     syry_n;
	logic     t1_n;
	logic     t1_nt2;
	logic     t2_n;
	logic     taha_n;
	logic     tama_n;
	logic     tate_n;
	logic     taxa_n;
	logic     teka_n;
	logic     teke_n;
	logic     telu_n;
	logic     tepu_n;
	logic     tero_n;
	logic     teru_n;
	logic     tese_n;
	logic     test_reset_n;
	logic     tm_bp_cys_n;
	logic     tofe_n;
	logic     toxe_n;
	logic     tozo_n;
	logic     tubo_n;
	logic     tufu_n;
	logic     tugo_n;
	logic     tuhu_n;
	logic     tulu_n;
	logic     tuly_n;
	logic     tyfo_n;
	logic     typo_n;
	logic     tyru_n;
	logic     tyry_n;
	logic     tyva_n;
	logic     ufor_n;
	logic     ugot_n;
	logic     uket_n;
	logic     ukup_n;
	logic     uner_n;
	logic     unyk_n;
	logic     upof_n;
	logic     v_reset_n;
	logic     vafa_n;
	logic     vclk_n;
	logic     vena_n;
	logic     vevo_n;
	logic     vonu_n;
	logic     vuce_n;
	logic     vujo_n;
	logic     vymu_n;
	logic     vyno_n;
	logic     vyxe_n;
	logic     vyzo_n;
	logic     wanu_n;
	logic     wave_ram_bl_precharge_n;
	logic     wave_ram_rd_n;
	logic     wave_ram_wldrv_precharge_n;
	logic     wave_ram_wr_n;
	logic     wewy_n;
	logic     wexu_n;
	logic     win_reset_n;
	logic     wobo_n;
	logic     wody_n;
	logic     woky_n;
	logic     wone_n;
	logic     wosu_n;
	logic     wr_in_n;
	logic     wuvu_n;
	logic     wx_rst_n;
	logic     wyka_n;
	logic     wyko_n;
	logic     wymo_n;
	logic     wyno_n;
	logic     wyso_n;
	logic     wyte_n;
	logic     xabo_n;
	logic     xadu_n;
	logic     xafo_n;
	logic     xafu_n;
	logic     xaku_n;
	logic     xave_n;
	logic     xazy_n;
	logic     xecu_n;
	logic     xedy_n;
	logic     xefe_n;
	logic     xege_n;
	logic     xegu_n;
	logic     xeho_n;
	logic     xobe_n;
	logic     xolo_n;
	logic     xona_n;
	logic     xosy_n;
	logic     xote_n;
	logic     xotu_n;
	logic     xufo_n;
	logic     xuso_n;
	logic     xute_n;
	logic     xyfe_n;
	logic     xygo_n;
	logic     xyju_n;
	logic     xyky_n;
	logic     xylo_n;
	logic     xymo_n;
	logic     xyna_n;
	logic     xynu_n;
	logic     yber_n;
	logic     ybog_n;
	logic     yceb_n;
	logic     yduf_n;
	logic     ydyv_n;
	logic     yfel_n;
	logic     ygum_n;
	logic     ygus_n;
	logic     yjex_n;
	logic     ykuk_n;
	logic     ylor_n;
	logic     ylov_n;
	logic     yrum_n;
	logic     yses_n;
	logic     ysex_n;
	logic     ysok_n;
	logic     yvel_n;
	logic     ywak_n;
	logic     yzab_n;
	logic     yzep_n;
	logic     yzor_n;
	logic     zafu_n;
	logic     zaxe_n;
	logic     zeca_n;
	logic     zene_n;
	logic     zexo_n;
	logic     zezy_n;
	logic     zony_n;
	logic     zube_n;
	logic     zuca_n;
	logic     zumy_n;
	logic     zuro_n;
	logic     zury_n;
	logic     zuve_n;
	logic     zuze_n;
	logic     zylu_n;
	logic     zyty_n;
	logic     zyve_n;
	logic     \16384hz ;
	logic     \16hz ;
	logic     \262144hz ;
	logic     \4096hz ;
	logic     \512hz ;
	logic     \65536hz ;
	logic     \8192hz ;
	tri logic a0;
	tri logic a1;
	tri logic a10;
	tri logic a11;
	tri logic a12;
	tri logic a13;
	tri logic a14;
	tri logic a15;
	tri logic a2;
	tri logic a3;
	tri logic a4;
	tri logic a5;
	tri logic a6;
	tri logic a7;
	tri logic a8;
	tri logic a9;
	logic     abaf;
	logic     abak;
	logic     abel;
	logic     abez;
	logic     abod;
	logic     abod_c;
	logic     abon;
	logic     abov;
	logic     abub;
	logic     abuf;
	logic     abup;
	logic     abur;
	logic     acc_d0;
	logic     acc_d1;
	logic     acc_d10;
	logic     acc_d2;
	logic     acc_d3;
	logic     acc_d4;
	logic     acc_d5;
	logic     acc_d6;
	logic     acc_d7;
	logic     acc_d8;
	logic     acc_d9;
	logic     acef;
	logic     acen;
	logic     acol;
	logic     acom;
	logic     acor;
	logic     acul;
	logic     acup;
	logic     acyj;
	logic     adah;
	logic     adak;
	logic     adar;
	logic     addr_latch;
	logic     adeh;
	logic     adok;
	logic     adyk;
	logic     adyk_p5n5_drain_poly;
	logic     adyr;
	logic     afar;
	logic     afas;
	logic     afec;
	logic     afeg;
	logic     afep;
	logic     afob;
	logic     afop;
	logic     afug;
	logic     afur;
	logic     afur_p5n5_drain_poly;
	logic     afux;
	logic     afyr;
	logic     agem;
	logic     aget;
	logic     agez;
	logic     agor;
	logic     agut;
	logic     agyn;
	logic     ahoc;
	logic     ahof;
	logic     ahyc;
	logic     ajas;
	logic     ajav;
	logic     ajax;
	logic     ajep;
	logic     ajer;
	logic     ajoj;
	logic     ajon;
	logic     ajuj;
	logic     ajux;
	logic     akaf;
	logic     akol;
	logic     akug;
	logic     alef;
	logic     alef_p5n5_drain_poly;
	logic     ales;
	logic     alop;
	logic     alor;
	logic     alyp;
	logic     alyr;
	logic     amab;
	logic     amac;
	logic     amer;
	logic     amet;
	logic     amp_en;
	logic     amun;
	logic     amus;
	logic     amyg;
	logic     anel;
	logic     anos;
	logic     anyp;
	logic     apag;
	logic     apaj;
	logic     apam;
	logic     apat;
	logic     apef;
	logic     aper;
	logic     apet;
	logic     apok;
	logic     apu_4mhz;
	logic     apu_phi;
	logic     apu_reset;
	logic     apu_wr;
	logic     apug;
	logic     apuk;
	logic     apuk_p5n5_drain_poly;
	logic     apur;
	logic     apuv;
	logic     apyh_c;
	logic     apys;
	logic     ares;
	logic     aret;
	logic     arev;
	logic     aror;
	logic     aros;
	logic     arov;
	logic     aruc;
	logic     arur;
	logic     aryf;
	logic     aryl;
	logic     arym;
	logic     arys;
	logic     asad;
	logic     asen;
	logic     asop;
	logic     asul;
	logic     asur;
	logic     asyp;
	logic     asys;
	logic     asyt;
	logic     atad_c;
	logic     ataf;
	logic     atag;
	logic     atal_4mhz;
	logic     atar;
	logic     atat;
	logic     atec;
	logic     atef;
	logic     ateg;
	logic     atej;
	logic     atem;
	logic     atep;
	logic     atev;
	logic     atez;
	logic     atol;
	logic     atov;
	logic     atup;
	logic     atur;
	logic     atus;
	logic     atuv;
	logic     atyn;
	logic     atyp;
	logic     atyr;
	logic     aver;
	logic     avet;
	logic     avog;
	logic     avok;
	logic     avor;
	logic     avuf;
	logic     avun;
	logic     avys;
	logic     awet;
	logic     awod;
	logic     awoh;
	logic     axad;
	logic     axyn;
	logic     azac;
	logic     azar;
	logic     azeg;
	logic     azet;
	logic     azof;
	logic     azor;
	logic     azug;
	logic     azul;
	logic     azus;
	logic     azyb;
	logic     babe;
	logic     babe_c;
	logic     baca;
	logic     bacu;
	logic     bacy;
	logic     badu;
	logic     bafu;
	logic     bafy;
	logic     bage;
	logic     bagu;
	logic     bagy;
	logic     bahu;
	logic     baja;
	logic     bajo;
	logic     baky;
	logic     bala;
	logic     bale;
	logic     balu;
	logic     baly;
	logic     bama;
	logic     bamu;
	logic     bane;
	logic     bano;
	logic     bapu;
	logic     bapy;
	logic     bare;
	logic     baru;
	logic     base;
	logic     baso;
	logic     basu;
	logic     bata;
	logic     bate;
	logic     batu;
	logic     bave;
	logic     bawa;
	logic     baxy;
	logic     baza;
	logic     baze;
	logic     bazy;
	logic     beba;
	logic     bebu;
	logic     becy;
	logic     bede;
	logic     bedy;
	logic     befa;
	logic     befu;
	logic     bege;
	logic     bego;
	logic     behu_c;
	logic     beja;
	logic     beje;
	logic     beju;
	logic     beka;
	logic     beku;
	logic     bela;
	logic     bele;
	logic     belo;
	logic     belu;
	logic     bena;
	logic     beno;
	logic     beny;
	logic     bepe;
	logic     bero;
	logic     beru;
	logic     bese;
	logic     beso;
	logic     beta;
	logic     bevo;
	logic     bewo;
	logic     bewy;
	logic     bewy_c;
	logic     bexa;
	logic     bexu;
	logic     beze;
	logic     bg_px_a;
	logic     bg_px_b;
	logic     bg_tile0;
	logic     bg_tile1;
	logic     bg_tile2;
	logic     bg_tile3;
	logic     bg_tile4;
	logic     bg_tile5;
	logic     bg_tile6;
	logic     bg_tile7;
	logic     bgp_d0;
	logic     bgp_d1;
	logic     bgp_d2;
	logic     bgp_d3;
	logic     bgp_d4;
	logic     bgp_d5;
	logic     bgp_d6;
	logic     bgp_d7;
	logic     bgpx;
	logic     boba;
	logic     bodo;
	logic     bofe;
	logic     bofo;
	logic     bofu;
	logic     bofy;
	logic     boge;
	logic     bojo;
	logic     boka;
	logic     boke;
	logic     boku;
	logic     boky;
	logic     bola;
	logic     bone;
	logic     bono;
	logic     bonu;
	logic     boot_sel;
	logic     bootrom_a0_n;
	logic     bootrom_a1_n;
	logic     bootrom_a1_na0_n;
	logic     bootrom_a1_na0;
	logic     bootrom_a2_n;
	logic     bootrom_a3_n;
	logic     bootrom_a4_n;
	logic     bootrom_a5_n;
	logic     bootrom_a5_na4_n;
	logic     bootrom_a5_na4;
	logic     bootrom_a6_n;
	logic     bootrom_a7_n;
	logic     bootrom_oe_n_wl_precharge;
	logic     bootrom_a1a0_n;
	logic     bootrom_a1a0;
	logic     bootrom_a5a4_n;
	logic     bootrom_a5a4;
	logic     bootrom_na1_na0_n;
	logic     bootrom_na1_na0;
	logic     bootrom_na1a0_n;
	logic     bootrom_na1a0;
	logic     bootrom_oe_bl_precharge_n;
	logic     bopo;
	logic     bopy;
	logic     bore;
	logic     boro;
	logic     boru;
	logic     bory;
	logic     bosu;
	logic     boto;
	logic     boty;
	logic     bovu;
	logic     bovy;
	logic     bowe;
	logic     bowy;
	logic     boxe;
	logic     boxo;
	logic     boxu;
	logic     boxy;
	logic     bp_cy;
	logic     bp_sel;
	logic     bubu;
	logic     buco;
	logic     bucy;
	logic     buda;
	logic     budo;
	logic     budu;
	logic     bufe;
	logic     bufo;
	logic     bufy_256hz;
	logic     bugo;
	logic     bugu;
	logic     bugy;
	logic     buka;
	logic     buko;
	logic     buku;
	logic     bule;
	logic     bumy;
	logic     buno;
	logic     bupo;
	logic     bure;
	logic     bury;
	logic     busa;
	logic     buto;
	logic     buty;
	logic     buva;
	logic     buvo;
	logic     buvu;
	logic     buvy;
	logic     buwa;
	logic     buwe;
	logic     buwy;
	logic     buxo;
	logic     buxu;
	logic     buze;
	logic     buzy;
	logic     byba;
	logic     byby;
	logic     byca;
	logic     byca_c;
	logic     bycu;
	logic     byfa;
	logic     byfe_128hz;
	logic     byfu;
	logic     bygo;
	logic     byha;
	logic     byho;
	logic     byjo;
	logic     byju;
	logic     byko;
	logic     byla;
	logic     byle;
	logic     bylo;
	logic     byma;
	logic     bymo;
	logic     bymy;
	logic     byra;
	logic     byru;
	logic     byry;
	logic     bysu;
	logic     byva;
	logic     byvy;
	logic     byxo;
	logic     byzo;
	logic     caba;
	logic     cabe;
	logic     caby;
	logic     caca;
	logic     cacu;
	logic     cado;
	logic     cage;
	logic     cagy;
	logic     caho;
	logic     caja;
	logic     cake;
	logic     cala;
	logic     cale;
	logic     calu;
	logic     cama;
	logic     camu;
	logic     camy;
	logic     cano;
	logic     canu;
	logic     cape;
	logic     capy;
	logic     care;
	logic     caro;
	logic     cate_128hz;
	logic     cato;
	logic     caty;
	logic     cava;
	logic     cave;
	logic     cavo;
	logic     cavy;
	logic     caxo;
	logic     caxu;
	logic     caxy;
	logic     caza;
	logic     caze;
	logic     cazo;
	logic     cecu;
	logic     cede;
	logic     cedy;
	logic     cege;
	logic     cegu;
	logic     ceha;
	logic     cehe;
	logic     ceko;
	logic     cela;
	logic     celo;
	logic     cely;
	logic     cemy;
	logic     cenu;
	logic     cepu;
	logic     cepy;
	logic     cera;
	logic     cero;
	logic     ceso;
	logic     ceto;
	logic     ceva;
	logic     cevu;
	logic     cexe;
	logic     cexo;
	logic     cexu;
	logic     ch1_1mhz;
	logic     ch1_eg_stop;
	logic     ch1_eg_tick;
	logic     ch1_env0;
	logic     ch1_env1;
	logic     ch1_env2;
	logic     ch1_env3;
	logic     ch1_fdis;
	logic     ch1_freq_upd1;
	logic     ch1_freq_upd2;
	logic     ch1_frst;
	logic     ch1_ftick;
	logic     ch1_ld_sum;
	logic     ch1_len_timer_stop;
	logic     ch1_pwm;
	logic     ch1_restart;
	logic     ch1_restart_dly;
	logic     ch1_shift_clk;
	logic     ch1_start;
	logic     ch1_stop;
	logic     ch2_1mhz;
	logic     ch2_eg_stop;
	logic     ch2_env0;
	logic     ch2_env1;
	logic     ch2_env2;
	logic     ch2_env3;
	logic     ch2_fdis;
	logic     ch2_frst;
	logic     ch2_ftick;
	logic     ch2_len_timer_stop;
	logic     ch2_pwm;
	logic     ch2_restart;
	logic     ch2_start;
	logic     ch2_stop;
	logic     ch3_2mhz;
	logic     ch3_active;
	logic     ch3_fdis;
	logic     ch3_frst;
	logic     ch3_ftick;
	logic     ch3_len_timer_stop;
	logic     ch3_restart;
	logic     ch4_1mhz;
	logic     ch4_active;
	logic     ch4_eg_disable;
	logic     ch4_eg_stop;
	logic     ch4_eg_test;
	logic     ch4_eg_tick;
	logic     ch4_env0;
	logic     ch4_env1;
	logic     ch4_env2;
	logic     ch4_env3;
	logic     ch4_fdis;
	logic     ch4_len_timer_stop;
	logic     ch4_lfsr_clk1;
	logic     ch4_lfsr_clk2;
	logic     ch4_lfsr_clk3;
	logic     ch4_restart;
	logic     ch4_start;
	logic     clk_1mhz;
	logic     clk_ena;
	tri logic clk_t4;
	logic     clk4;
	logic     clk5;
	logic     clkpipe;
	logic     coba;
	logic     codo;
	logic     cofe;
	logic     cofu;
	logic     cogo;
	logic     cogu;
	logic     cohy;
	logic     coju;
	logic     coke;
	logic     cola;
	logic     colo;
	logic     colu;
	logic     como;
	logic     comy;
	logic     cone;
	tri logic const0;
	logic     conu;
	logic     cony;
	logic     copa;
	logic     copy;
	logic     coro;
	logic     coru_c;
	logic     cory;
	logic     cosa;
	logic     coso;
	logic     cota;
	logic     cotu;
	logic     coty;
	logic     covu;
	logic     cowe;
	logic     coze;
	logic     cozy;
	logic     cpu_ext_cs_en;
	logic     cpu_irq_ack0;
	logic     cpu_irq_ack1;
	logic     cpu_irq_ack2;
	logic     cpu_irq_ack3;
	logic     cpu_irq_ack4;
	logic     cpu_irq_ack5;
	logic     cpu_irq_ack6;
	logic     cpu_irq_ack7;
	logic     cpu_irq0;
	logic     cpu_irq1;
	logic     cpu_irq2;
	logic     cpu_irq3;
	logic     cpu_irq4;
	logic     cpu_rd;
	logic     cpu_sys_reset;
	logic     cpu_vram_oam_rd;
	logic     cpu_wakeup;
	logic     cpu_wr;
	logic     cpu_wr_sync;
	logic     cuba;
	logic     cufe;
	logic     cufu;
	logic     cugo;
	logic     cugu;
	logic     cule;
	logic     culo;
	logic     culu;
	logic     cuna;
	logic     cupe;
	logic     cupo;
	logic     cura;
	logic     cure;
	logic     curu;
	logic     cuso;
	logic     cusy;
	logic     cuto;
	logic     cuty;
	logic     cuva;
	logic     cuvy;
	logic     cuwa;
	logic     cuxy;
	logic     cybe;
	logic     cybo;
	logic     cyfa;
	logic     cygu;
	logic     cyho;
	logic     cyka;
	logic     cyke;
	logic     cyky;
	logic     cyla;
	logic     cyle;
	logic     cylu;
	logic     cymu;
	logic     cyne;
	logic     cypu;
	logic     cypy;
	logic     cyra;
	logic     cyre;
	logic     cyse;
	logic     cyte;
	logic     cyto;
	logic     cyvu;
	logic     cywe;
	logic     cywu;
	tri logic d0;
	tri logic d1;
	tri logic d2;
	tri logic d3;
	tri logic d4;
	tri logic d5;
	tri logic d6;
	tri logic d7;
	logic     daba;
	logic     daba_c;
	logic     dace;
	logic     daco;
	logic     dacu;
	logic     dado;
	logic     dafa;
	logic     dafo;
	logic     dafy;
	logic     daga;
	logic     dagu;
	logic     dajo;
	logic     daju;
	logic     dake;
	logic     dako;
	logic     daku;
	logic     dale;
	logic     damy;
	logic     dane;
	logic     dano;
	logic     dany;
	logic     dape;
	logic     dapu;
	logic     dapy;
	logic     dare;
	logic     daro;
	logic     dary;
	logic     dasa;
	tri logic data_phase;
	logic     dato;
	logic     datu;
	logic     dawa;
	logic     dawe;
	logic     dawu;
	logic     daxa;
	logic     daxu;
	logic     daza;
	logic     dazo;
	logic     debo;
	logic     deby;
	logic     decu;
	logic     decy;
	logic     defa;
	logic     defy;
	logic     dega;
	logic     dego;
	logic     degu;
	logic     deho;
	logic     dejy;
	logic     deke;
	logic     deko;
	logic     dela;
	logic     dele;
	logic     deme;
	logic     demo;
	logic     dena;
	logic     deno;
	logic     depu;
	logic     depy;
	logic     dera;
	logic     dere;
	logic     dero;
	logic     deru;
	logic     dery;
	logic     deso;
	logic     desu;
	logic     deta;
	logic     dete;
	logic     dety;
	logic     deva;
	logic     dewa;
	logic     dewy;
	logic     dexe;
	logic     dezo;
	logic     dezy;
	logic     dma_a0;
	logic     dma_a1;
	logic     dma_a10;
	logic     dma_a11;
	logic     dma_a12;
	logic     dma_a13;
	logic     dma_a14;
	logic     dma_a15;
	logic     dma_a2;
	logic     dma_a3;
	logic     dma_a4;
	logic     dma_a5;
	logic     dma_a6;
	logic     dma_a7;
	logic     dma_a8;
	logic     dma_a9;
	logic     dma_addr_ext;
	logic     dma_phi;
	logic     dma_phi2;
	logic     dma_run;
	logic     doba;
	logic     doca;
	logic     docu;
	logic     doda;
	logic     dody;
	logic     dofa;
	logic     dofy;
	logic     doge;
	logic     dogo;
	logic     dogu;
	logic     dojo;
	logic     doju;
	logic     doka;
	logic     doke;
	logic     doky;
	logic     dola;
	logic     dole;
	logic     doly;
	logic     dome;
	logic     domo;
	logic     dona;
	logic     done;
	logic     dopu;
	logic     dora;
	logic     dore;
	logic     doru;
	logic     dory;
	logic     dosa;
	logic     dose;
	logic     doso;
	logic     dota;
	logic     doto;
	logic     doto_c;
	logic     dotu;
	logic     dove;
	logic     dovo;
	logic     dovu;
	logic     doxa;
	logic     dozo;
	logic     dozy;
	logic     dubo;
	logic     dubu;
	logic     duce;
	logic     ducu;
	logic     dudu;
	logic     dufe;
	logic     duge;
	logic     duhy;
	logic     duju;
	logic     duka;
	logic     duke;
	logic     duko;
	logic     dula;
	logic     dule_c;
	logic     dulo;
	logic     dulu;
	logic     dumo;
	logic     duno;
	logic     dupa;
	logic     dupe;
	logic     dupo;
	logic     dupy;
	logic     dura;
	logic     dure;
	logic     duru;
	logic     dury;
	logic     duse;
	logic     duso;
	logic     duvo;
	logic     duvu;
	logic     duwo;
	logic     duze;
	logic     dyba;
	logic     dybe;
	logic     dybo;
	logic     dyby;
	logic     dydu;
	logic     dyfu;
	logic     dyge;
	logic     dyhu;
	logic     dyka;
	logic     dyke;
	logic     dyky;
	logic     dyla;
	logic     dylu;
	logic     dyly;
	logic     dyme;
	logic     dymo;
	logic     dymu;
	logic     dynu;
	logic     dypu;
	logic     dyra;
	logic     dyro;
	logic     dyru;
	logic     dyta;
	logic     dyte;
	logic     dyve;
	logic     dywe;
	logic     dyxe_c;
	logic     dyze;
	logic     ebef;
	logic     eboj;
	logic     ebos;
	logic     ebow;
	logic     ecab;
	logic     ecab_c;
	logic     eced;
	logic     edel;
	logic     eden;
	logic     edep;
	logic     eder;
	logic     edok;
	logic     edyf;
	logic     edym;
	logic     efak;
	logic     efal;
	logic     efef;
	logic     efev;
	logic     efex;
	logic     efop;
	logic     efor;
	logic     efot;
	logic     efug;
	logic     efuz;
	logic     efyk;
	logic     efyk_c;
	logic     efyl;
	logic     egad;
	logic     egav;
	logic     egen;
	logic     eget;
	logic     egog;
	logic     egom;
	logic     eguv;
	logic     egyp;
	logic     ehor;
	logic     ehuj;
	logic     ehyn;
	logic     ejab;
	logic     ejaw;
	logic     ejex;
	logic     ejok;
	logic     ejot;
	logic     ejuf;
	logic     ejyb;
	logic     ejyf;
	logic     ekag;
	logic     ekem;
	logic     ekud;
	logic     elaf;
	logic     elar;
	logic     elas;
	logic     eler;
	logic     elok;
	logic     eluf;
	logic     elux;
	logic     elyg;
	logic     elyx;
	logic     emar;
	logic     emax;
	logic     emet;
	logic     emof;
	logic     emol;
	logic     emos;
	logic     emus;
	logic     emut;
	logic     emux;
	logic     emux_c;
	logic     emyb;
	logic     emyr;
	logic     enad;
	logic     enec;
	logic     enef;
	logic     enef_c;
	logic     enek;
	logic     enob;
	logic     enok;
	logic     enor;
	logic     enuf;
	logic     enur;
	logic     enut;
	logic     epek;
	logic     epor;
	logic     epuk;
	logic     epum;
	logic     epyk;
	logic     epyr;
	logic     epyt;
	logic     epyx;
	logic     erat;
	logic     eraz;
	logic     ereg;
	logic     erod;
	logic     erog;
	logic     erol;
	logic     eros;
	logic     eruc;
	logic     eruc_c;
	logic     erum;
	logic     erus;
	logic     erut;
	logic     eryc;
	logic     eryf;
	logic     esaj;
	logic     esel;
	logic     esep;
	logic     esot;
	logic     esur;
	logic     esut;
	logic     etam;
	logic     etam_c;
	logic     etan;
	logic     etap;
	logic     etar;
	logic     etat;
	logic     etef;
	logic     etek_c;
	logic     eter;
	logic     etok;
	logic     etol;
	logic     etov;
	logic     etuc;
	logic     etuf;
	logic     etuk;
	logic     etup;
	logic     etuv;
	logic     etyr;
	logic     evaj;
	logic     evak;
	logic     ever;
	logic     evof;
	logic     evol;
	logic     evug;
	logic     evur;
	logic     evyf;
	logic     ewok;
	logic     ewot;
	logic     ewud;
	logic     exac;
	logic     exap;
	logic     exat;
	logic     exec_phase;
	logic     exel;
	logic     exuc;
	logic     exuk;
	logic     exuq;
	logic     ezag;
	logic     ezas;
	logic     ezef;
	logic     ezof;
	logic     ezoz;
	logic     ezuf;
	logic     ezuk;
	logic     ezul;
	logic     fabo;
	logic     fabu;
	logic     fafo;
	logic     fafo_c;
	logic     faja;
	logic     faju;
	logic     faka;
	logic     fako;
	logic     fale;
	logic     falu;
	logic     fape;
	logic     fare;
	logic     faru;
	logic     fasy;
	logic     fave;
	logic     favo;
	logic     favy;
	logic     faxa;
	logic     faxe;
	logic     faxo;
	logic     fazo;
	logic     fazu;
	logic     feby;
	logic     feco;
	logic     feco_c;
	logic     fede;
	logic     fedo;
	logic     fedy;
	logic     fefo;
	logic     fefy;
	logic     fega;
	logic     fego_c;
	logic     fegy;
	logic     feka;
	logic     felo;
	logic     femo;
	logic     femy;
	logic     fene;
	logic     fepu;
	logic     fery;
	logic     feso;
	logic     fesy;
	logic     fety;
	logic     feva;
	logic     feve;
	logic     fevo;
	logic     fewa;
	logic     fexo;
	logic     fexu;
	logic     fexx;
	logic     fexx_ffxx;
	logic     ff00_ff03;
	logic     ff00_ff20_ff40_ff60;
	logic     ff00rd;
	logic     ff04_ff07;
	logic     ff10;
	logic     ff11;
	logic     ff11_d6;
	logic     ff11_d7;
	logic     ff12;
	logic     ff12_d0;
	logic     ff12_d1;
	logic     ff12_d2;
	logic     ff12_d3;
	logic     ff12_d4;
	logic     ff12_d5;
	logic     ff12_d6;
	logic     ff12_d7;
	logic     ff13;
	logic     ff14;
	logic     ff14_d6;
	logic     ff16;
	logic     ff16_d6;
	logic     ff16_d7;
	logic     ff17;
	logic     ff17_d0;
	logic     ff17_d1;
	logic     ff17_d2;
	logic     ff17_d3;
	logic     ff17_d4;
	logic     ff17_d5;
	logic     ff17_d6;
	logic     ff17_d7;
	logic     ff18;
	logic     ff19;
	logic     ff19_d6;
	logic     ff1a;
	logic     ff1a_rd;
	logic     ff1b;
	logic     ff1c;
	logic     ff1c_d5;
	logic     ff1c_d6;
	logic     ff1d;
	logic     ff1e;
	logic     ff1e_d6;
	logic     ff20;
	logic     ff21;
	logic     ff21_d0;
	logic     ff21_d1;
	logic     ff21_d2;
	logic     ff21_d3;
	logic     ff21_d4;
	logic     ff21_d5;
	logic     ff21_d6;
	logic     ff21_d7;
	logic     ff22;
	logic     ff22_d3;
	logic     ff22_d4;
	logic     ff22_d5;
	logic     ff22_d6;
	logic     ff22_d7;
	logic     ff23;
	logic     ff23_d6;
	logic     ff24;
	logic     ff25;
	logic     ff26;
	logic     ff26_d4;
	logic     ff26_d4_b;
	logic     ff2x;
	logic     ff3x;
	logic     ff40;
	logic     ff40_d0;
	logic     ff40_d1;
	logic     ff40_d2;
	logic     ff40_d3;
	logic     ff40_d4;
	logic     ff40_d5;
	logic     ff40_d6;
	logic     ff40_d7;
	logic     ff41;
	logic     ff42;
	logic     ff42_d0;
	logic     ff42_d1;
	logic     ff42_d2;
	logic     ff42_d3;
	logic     ff42_d4;
	logic     ff42_d5;
	logic     ff42_d6;
	logic     ff42_d7;
	logic     ff43;
	logic     ff43_d0;
	logic     ff43_d1;
	logic     ff43_d2;
	logic     ff43_d3;
	logic     ff43_d4;
	logic     ff43_d5;
	logic     ff43_d6;
	logic     ff43_d7;
	logic     ff44;
	logic     ff45;
	logic     ff46;
	logic     ff47;
	logic     ff48;
	logic     ff49;
	logic     ff4a;
	logic     ff4a_d0;
	logic     ff4a_d1;
	logic     ff4a_d2;
	logic     ff4a_d3;
	logic     ff4a_d4;
	logic     ff4a_d5;
	logic     ff4a_d6;
	logic     ff4a_d7;
	logic     ff4b;
	logic     ff4b_d0;
	logic     ff4b_d1;
	logic     ff4b_d2;
	logic     ff4b_d3;
	logic     ff4b_d4;
	logic     ff4b_d5;
	logic     ff4b_d6;
	logic     ff4b_d7;
	logic     ff4x;
	logic     ff60_d0;
	logic     ff60_d1;
	logic     ffxx;
	logic     foba;
	logic     foco;
	logic     fofa;
	logic     fofe;
	logic     foge;
	logic     fohy;
	logic     foka;
	logic     foke;
	logic     foko;
	logic     foku;
	logic     foky;
	logic     fole;
	logic     fome;
	logic     fone;
	logic     fono;
	logic     fopu;
	logic     fopy;
	logic     fora;
	logic     foro;
	logic     fory;
	logic     foto;
	logic     fova;
	logic     fove;
	logic     fovo;
	logic     foxa;
	logic     foxe;
	logic     fozu;
	logic     fozy;
	logic     fuby;
	logic     fude;
	logic     fufo;
	logic     fugo;
	logic     fujy;
	logic     fuke;
	logic     fuky;
	logic     fule;
	logic     fulo;
	logic     fuma;
	logic     fume;
	logic     fupa;
	logic     fura;
	logic     fure;
	logic     furu;
	logic     fury;
	logic     fusa;
	logic     futy;
	logic     fuva;
	logic     fuve;
	logic     fuvo;
	logic     fuwa;
	logic     fuwa_c;
	logic     fuxo;
	logic     fuxu;
	logic     fuzu;
	logic     fyca;
	logic     fycu;
	logic     fygo;
	logic     fylo;
	logic     fyne;
	logic     fyno;
	logic     fyre;
	logic     fyry;
	logic     fyty;
	logic     fyva;
	logic     fyxo;
	logic     gaba;
	logic     gabu;
	logic     gace;
	logic     gade;
	logic     gado;
	logic     gady;
	logic     gafa;
	logic     gafe;
	logic     gafu;
	logic     gago;
	logic     gaja;
	logic     gajy;
	logic     gake;
	logic     gala;
	logic     gale;
	logic     galo;
	logic     galu;
	logic     gamo;
	logic     gano;
	logic     gany;
	logic     gape;
	logic     gapy;
	logic     gary;
	logic     gaso;
	logic     gasu;
	logic     gato;
	logic     gatu;
	logic     gaty;
	logic     gava;
	logic     gavu;
	logic     gavy;
	logic     gawa;
	logic     gaxe;
	logic     gaxu;
	logic     gaza;
	logic     gaze;
	logic     gebu;
	logic     gecy;
	logic     gede;
	logic     gedo;
	logic     gefe;
	logic     gega;
	logic     gege;
	logic     gejo;
	logic     gejy;
	logic     geka;
	logic     geke;
	logic     geku;
	logic     gela;
	logic     gele;
	logic     gemo;
	logic     gemy;
	logic     geno;
	logic     genu;
	logic     geny;
	logic     gepa;
	logic     gepo;
	logic     gepu;
	logic     gepy;
	logic     gere;
	logic     geta;
	logic     geto;
	logic     getu;
	logic     geva_c;
	logic     geve;
	logic     gevo;
	logic     gewy;
	logic     gexa;
	logic     gexe;
	logic     gexy;
	logic     geze;
	logic     gnd;
	logic     goca;
	logic     goda;
	logic     gofu;
	logic     goga;
	logic     goge;
	logic     goho;
	logic     goju;
	logic     goju_c;
	logic     goka;
	logic     goko;
	logic     gola;
	logic     golo;
	logic     goly;
	logic     goma;
	logic     gono;
	logic     gony;
	logic     gopa;
	logic     gope;
	logic     gopo;
	logic     gopu;
	logic     gopu_c;
	logic     gora;
	logic     goro;
	logic     gory;
	logic     gota;
	logic     gote;
	logic     gove;
	logic     govo;
	logic     govu;
	logic     goxo;
	logic     goxu;
	logic     gucy;
	logic     guda;
	logic     gude;
	logic     gufa;
	logic     gufo;
	logic     gufy;
	logic     gugo;
	logic     guko;
	logic     guky;
	logic     gulo;
	logic     gulu;
	logic     gumu;
	logic     gumy;
	logic     guna;
	logic     gunu;
	logic     guny;
	logic     gupo;
	logic     gupu;
	logic     gure;
	logic     guro;
	logic     guru;
	logic     gusa;
	logic     gusu;
	logic     gute;
	logic     gutu;
	logic     guva;
	logic     guve;
	logic     guvu;
	logic     guxa_c;
	logic     guxe;
	logic     guza;
	logic     guze;
	logic     guzo;
	logic     guzu;
	logic     guzy;
	logic     gyba;
	logic     gyda;
	logic     gyfo;
	logic     gyfu;
	logic     gyfy;
	logic     gyga;
	logic     gygu;
	logic     gyko;
	logic     gyky;
	logic     gyky_c;
	logic     gylo;
	logic     gylu;
	logic     gyme;
	logic     gypa;
	logic     gypu;
	logic     gyra;
	logic     gyre;
	logic     gyry;
	logic     gyta;
	logic     gyte;
	logic     gyvo;
	logic     h_reset;
	logic     h0;
	logic     h1;
	logic     h2;
	logic     h3;
	logic     h4;
	logic     h5;
	logic     h6;
	logic     h7;
	logic     hafe;
	logic     hafu;
	logic     haga;
	logic     hake;
	logic     halu_c;
	logic     hama_512khz;
	logic     hamy;
	logic     hano;
	logic     hape;
	logic     hapo;
	logic     hapu;
	logic     hasu;
	logic     hato;
	logic     hawu;
	logic     hawy;
	logic     haxe;
	logic     hclk;
	logic     hecy;
	logic     hefa;
	logic     hefo;
	logic     hefy;
	logic     heky;
	logic     hele;
	logic     helu;
	logic     hema;
	logic     heno;
	logic     henu;
	logic     hepa;
	logic     hepo;
	logic     hepu;
	logic     hera;
	logic     hery;
	logic     hesu;
	logic     heto;
	logic     hevy;
	logic     hexo_c;
	logic     heze;
	logic     hezu;
	logic     hobu;
	logic     hocu;
	logic     hofo;
	logic     hoga;
	logic     hola;
	logic     holy;
	logic     homu;
	logic     hony;
	logic     hopa;
	logic     hora;
	logic     horu_512hz;
	logic     hory;
	logic     hoso;
	logic     hota;
	logic     hova;
	logic     hovo;
	logic     hoxa;
	logic     hoxe;
	logic     hozu;
	logic     hram_a1_na0_n;
	logic     hram_a1_na0;
	logic     hram_a2_n;
	logic     hram_a3_n;
	logic     hram_a4_n;
	logic     hram_a5_n;
	logic     hram_a6_n;
	logic     hram_oe_n;
	logic     hram_a1a0_n;
	logic     hram_a1a0;
	logic     hram_oe;
	logic     hram_wldrv_ena;
	logic     hram_wr;
	logic     huce;
	logic     huda;
	logic     hude;
	logic     hufa;
	logic     hufu;
	logic     huma;
	logic     humo;
	logic     huno;
	logic     huny;
	logic     hupa;
	logic     hury;
	logic     hyfe;
	logic     hyfo;
	logic     hyke;
	logic     hyle;
	logic     hyly;
	logic     hyne;
	logic     hyno;
	logic     hypa;
	logic     hypo;
	logic     hyro;
	logic     hyto;
	logic     hyvu;
	logic     in_window;
	logic     int_hbl_en;
	logic     int_jp;
	logic     int_oam;
	logic     int_oam_en;
	logic     int_serial;
	logic     int_stat;
	logic     int_timer;
	logic     int_vbl;
	logic     int_vbl_en;
	logic     jacy;
	logic     jade;
	logic     jado;
	logic     jafa;
	logic     jago;
	logic     jaju;
	logic     jake;
	logic     jale;
	logic     jany;
	logic     jape;
	logic     javo;
	logic     jaxa;
	logic     jeco;
	logic     jede;
	logic     jefa;
	logic     jefe;
	logic     jefu;
	logic     jehy;
	logic     jema;
	logic     jemo;
	logic     jenu;
	logic     jepe;
	logic     jera;
	logic     jeso_512k;
	logic     jete;
	logic     jety;
	logic     jeva;
	logic     jevy;
	logic     jocy;
	logic     jode;
	logic     jola;
	logic     jolu;
	logic     jona;
	logic     jone;
	logic     jopa;
	logic     jora;
	logic     jore;
	logic     jory_c;
	logic     jota;
	logic     joto;
	logic     jotu;
	logic     jova;
	logic     jove;
	logic     jovy;
	logic     jufy;
	logic     juju;
	logic     jule_c;
	logic     julo;
	logic     jupu;
	logic     jupy;
	logic     jure;
	logic     juta;
	logic     jute;
	logic     juty;
	logic     juxe;
	logic     jybu;
	logic     jyco;
	logic     jyfu;
	logic     jyja;
	logic     jyme;
	logic     jyna;
	logic     jypo;
	logic     jyre;
	logic     jyro;
	logic     jyty;
	logic     kaba;
	logic     kabu;
	logic     kado;
	logic     kafo;
	logic     kage;
	logic     kagy;
	logic     kahe;
	logic     kaju;
	logic     kake;
	logic     kale;
	logic     kaly;
	logic     kamu;
	logic     kana;
	logic     kanu;
	logic     kapa;
	logic     kape;
	logic     kapo;
	logic     kara;
	logic     kare;
	logic     karu;
	logic     kasa;
	logic     kaso;
	logic     kasy;
	logic     katy;
	logic     kavo;
	logic     kavu;
	logic     kaxy;
	logic     kaza;
	logic     kazo;
	logic     kebo;
	logic     kecy;
	logic     kede;
	logic     kedo;
	logic     kedy;
	logic     kefe;
	logic     keja;
	logic     keju;
	logic     keka;
	logic     keke;
	logic     keko;
	logic     kena;
	logic     kene;
	logic     kenu;
	logic     kepa;
	logic     kera;
	logic     kere;
	logic     keru;
	logic     kery;
	logic     kese;
	logic     keto;
	logic     ketu;
	logic     kevu;
	logic     kevy;
	logic     kexu;
	logic     keza;
	logic     kofo;
	logic     koga;
	logic     kogu;
	logic     koko;
	logic     koku;
	logic     kola;
	logic     kole;
	logic     kolo;
	logic     koma;
	logic     komu;
	logic     kony;
	logic     kopu;
	logic     kopy;
	logic     kore;
	logic     koro;
	logic     koru;
	logic     kory;
	logic     kota;
	logic     kote;
	logic     koty;
	logic     kova;
	logic     kovo;
	logic     kovu;
	logic     kuby;
	logic     kuha;
	logic     kuhu;
	logic     kujo;
	logic     kuko;
	logic     kuku;
	logic     kuly;
	logic     kunu;
	logic     kupa;
	logic     kupe;
	logic     kupo;
	logic     kura;
	logic     kury;
	logic     kuta;
	logic     kutu;
	logic     kuxu;
	logic     kuzy;
	logic     kybo;
	logic     kybu;
	logic     kydu;
	logic     kyfu;
	logic     kygu;
	logic     kygy;
	logic     kyho;
	logic     kyhu;
	logic     kyko;
	logic     kyku;
	logic     kylo;
	logic     kyme;
	logic     kymo;
	logic     kyno;
	logic     kypa;
	logic     kype;
	logic     kypu;
	logic     kyru;
	logic     kyry;
	logic     kysa;
	logic     kyto;
	logic     kyvo;
	logic     kywe;
	logic     kywy;
	logic     l_vin_en;
	logic     labe;
	logic     labu;
	logic     laca;
	logic     lady;
	logic     lafu;
	logic     lafy;
	logic     lagu;
	logic     lahe;
	logic     laky;
	logic     lala;
	logic     lalo;
	logic     lamo;
	logic     lamy;
	logic     lapa;
	logic     lara;
	logic     laru;
	logic     lase;
	logic     last_sprite;
	logic     lasy;
	logic     latch_sp_bp_a;
	logic     latch_sp_bp_b;
	logic     lavo;
	logic     lavy;
	logic     laxe;
	logic     laxu;
	logic     lcd_x0;
	logic     lcd_x1;
	logic     lcd_x2;
	logic     lcd_x3;
	logic     lcd_x4;
	logic     lcd_x5;
	logic     lcd_x6;
	logic     lebo;
	logic     lebu;
	logic     leco;
	logic     ledo;
	logic     lefa;
	logic     legu;
	logic     leho;
	logic     leja;
	logic     leka;
	logic     leke;
	logic     lela;
	logic     lepy;
	logic     leru;
	logic     lesa;
	logic     leso;
	logic     lety;
	logic     leva;
	logic     levo;
	logic     lexe;
	logic     lfsr_bit13_eq_bit14;
	logic     lfsr_out;
	logic     lmixer0;
	logic     lmixer1;
	logic     lmixer2;
	logic     lmixer3;
	logic     lobu;
	logic     lodo;
	logic     lofu;
	logic     logo;
	logic     loko;
	logic     loky;
	logic     loly;
	logic     loma;
	logic     lome;
	logic     lomy;
	logic     lonu;
	logic     lony;
	logic     lopu;
	logic     loru;
	logic     loso;
	logic     lote;
	logic     loto;
	logic     loty;
	logic     lowa;
	logic     loxa;
	logic     loxo;
	logic     loza;
	logic     loze;
	logic     lozo;
	logic     lozu;
	logic     lubo;
	logic     luby;
	logic     luce;
	logic     lufe;
	logic     lufy;
	logic     luhe;
	logic     luja;
	logic     luke;
	logic     lula;
	logic     lumo;
	logic     lumy;
	logic     luna;
	logic     luno;
	logic     lunu;
	logic     lupa;
	logic     lura;
	logic     lury;
	logic     lusu;
	logic     lutu;
	logic     luve;
	logic     luvo;
	logic     luvy;
	logic     luxa;
	logic     luxu;
	logic     luzo;
	logic     lyc_int;
	logic     lyc_int_en;
	logic     lyde;
	logic     lydu;
	logic     lyfa;
	logic     lyky;
	logic     lyle;
	logic     lyny;
	logic     lyra;
	logic     lyry;
	logic     lysa;
	logic     lyta;
	logic     lywe;
	logic     lyzu;
	logic     m1;
	logic     maby;
	logic     macu;
	logic     mada;
	logic     mady;
	logic     magu;
	logic     majo;
	logic     maka;
	logic     male;
	logic     mame;
	logic     mano;
	logic     mare;
	logic     masa;
	logic     masu;
	logic     mavu;
	tri logic md0;
	tri logic md1;
	tri logic md2;
	tri logic md3;
	tri logic md4;
	tri logic md5;
	tri logic md6;
	tri logic md7;
	logic     meco;
	logic     meda;
	logic     mefu;
	logic     mego;
	logic     megu;
	logic     mehe;
	logic     meke;
	logic     mene;
	logic     meny;
	logic     mepa;
	logic     mery;
	logic     mesu;
	logic     meta;
	logic     mete;
	logic     meve;
	logic     mewy;
	logic     mexa;
	logic     mexo;
	logic     mexu;
	logic     mezu;
	logic     moca;
	logic     moce;
	logic     moda;
	logic     mode0;
	logic     mode1;
	logic     mode2;
	logic     mode3;
	logic     modu;
	logic     mody;
	logic     mofo;
	logic     mofy;
	logic     moju;
	logic     mojy;
	logic     moka;
	logic     molu;
	logic     mory;
	logic     mosu;
	logic     mosy;
	logic     moty;
	logic     movu;
	logic     moxe;
	logic     mreq;
	logic     muce;
	logic     muda;
	logic     mude;
	logic     mufa;
	logic     mugy;
	logic     muho;
	logic     mujy;
	logic     muku;
	logic     mule;
	logic     mulo;
	logic     mume;
	logic     mumy;
	logic     mune;
	logic     mure;
	logic     muru;
	logic     muxe;
	logic     muzu;
	logic     myde;
	logic     myfa;
	logic     myfu;
	logic     myjy;
	logic     mylo;
	logic     mynu;
	logic     myny;
	logic     myre;
	logic     mysa;
	logic     myso;
	logic     myta;
	logic     myto;
	logic     mytu;
	logic     myvo;
	logic     myvy;
	logic     myxa;
	logic     myxe;
	logic     myzo;
	logic     myzu;
	logic     nabe;
	logic     nada;
	logic     nady;
	logic     nafy;
	logic     naja;
	logic     nako;
	logic     nale;
	logic     napo;
	logic     naro;
	logic     nasa;
	logic     navo;
	logic     naxy;
	logic     naze;
	logic     neda;
	logic     nefo;
	logic     nele;
	logic     nelo;
	logic     nena;
	logic     neny;
	logic     nepo;
	logic     nero;
	logic     neru;
	logic     nevu;
	logic     nevy;
	logic     nexa;
	logic     neze;
	logic     nezo;
	logic     nmi;
	logic     no_sweep;
	logic     nobo;
	logic     nocu;
	logic     nofu;
	logic     nogu;
	logic     nogy;
	logic     noise_counter_bypass;
	logic     noise_counter_clk;
	logic     nojo;
	logic     noko;
	logic     nolo;
	logic     noly;
	logic     non_vram_mreq;
	logic     nono;
	logic     nory;
	logic     nozo;
	logic     nrx4_d6_wr;
	logic     nuca;
	logic     nudu;
	logic     nufa;
	logic     nuga;
	logic     nuke;
	logic     nuly;
	logic     numa;
	logic     nunu;
	logic     nupa;
	logic     nupo;
	logic     nura;
	logic     nuta;
	logic     nute;
	logic     nuva;
	logic     nuxo;
	logic     nybe;
	logic     nyfo;
	logic     nygo;
	logic     nyha;
	logic     nyka;
	logic     nyke;
	logic     nyku;
	logic     nype;
	logic     nypo;
	logic     nyre;
	logic     nytu;
	logic     nyva;
	logic     nyxo;
	tri logic oam_a0_n_tri;
	logic     oam_a1_n;
	tri logic oam_a1_n_tri;
	logic     oam_a2_n;
	tri logic oam_a2_n_tri;
	logic     oam_a2_na1_n;
	logic     oam_a2_na1;
	logic     oam_a3_n;
	tri logic oam_a3_n_tri;
	logic     oam_a4_n;
	tri logic oam_a4_n_tri;
	logic     oam_a5_n;
	tri logic oam_a5_n_tri;
	logic     oam_a6_n;
	tri logic oam_a6_n_tri;
	logic     oam_a7_n;
	tri logic oam_a7_n_tri;
	logic     oam_oe_n;
	logic     oam_a_wr2;
	logic     oam_a1;
	logic     oam_a2;
	logic     oam_a2a1_n;
	logic     oam_a2a1;
	logic     oam_a3;
	logic     oam_a4;
	logic     oam_a5;
	logic     oam_a6;
	logic     oam_a7;
	logic     oam_b_wr2;
	logic     oam_data_latch;
	logic     oam_oe;
	logic     oam_parse_a2;
	logic     oam_parse_a3;
	logic     oam_parse_a4;
	logic     oam_parse_a5;
	logic     oam_parse_a6;
	logic     oam_parse_a7;
	logic     oam_parsing;
	tri logic oam_render_a2;
	tri logic oam_render_a3;
	tri logic oam_render_a4;
	tri logic oam_render_a5;
	tri logic oam_render_a6;
	tri logic oam_render_a7;
	logic     oam_rendering;
	logic     oam_rendering2;
	logic     obj0px;
	logic     obj1px;
	logic     obp0_d0;
	logic     obp0_d1;
	logic     obp0_d2;
	logic     obp0_d3;
	logic     obp0_d4;
	logic     obp0_d5;
	logic     obp0_d6;
	logic     obp0_d7;
	logic     obp1_d0;
	logic     obp1_d1;
	logic     obp1_d2;
	logic     obp1_d3;
	logic     obp1_d4;
	logic     obp1_d5;
	logic     obp1_d6;
	logic     obp1_d7;
	logic     osc_ena;
	logic     osc_stable;
	logic     pabe;
	logic     pafu;
	logic     paga;
	logic     pago;
	logic     pagu;
	logic     paha;
	logic     paho;
	logic     pahy;
	logic     palo;
	logic     palu;
	logic     paly;
	logic     pamo;
	logic     pamy;
	logic     pany;
	logic     pase;
	logic     paso;
	logic     pate;
	logic     paty;
	logic     pazo;
	logic     peba;
	logic     pebo;
	logic     peby;
	logic     pecu;
	logic     peda;
	logic     pedu;
	logic     pefo;
	logic     pege;
	logic     pero;
	logic     peru;
	logic     pesu_const1;
	logic     peto;
	logic     petu;
	logic     pevo;
	logic     pezo;
	logic     pobu;
	logic     pofy;
	logic     pogu;
	logic     pohu;
	logic     poka;
	logic     poky;
	logic     pola;
	logic     pome;
	logic     pomo;
	logic     pony;
	logic     popu;
	logic     pory;
	logic     pova;
	logic     povy;
	logic     powu;
	logic     ppu_4mhz;
	logic     ppu_hard_reset;
	logic     ppu_rd;
	logic     ppu_reset;
	logic     ppu_reset2;
	logic     ppu_wr;
	logic     puco;
	logic     pudu;
	logic     puhe;
	logic     puho;
	logic     puku;
	logic     puky;
	logic     pume;
	logic     pupu;
	logic     pusy;
	logic     puva;
	logic     puwu;
	logic     puxa;
	logic     puxy;
	logic     px9;
	logic     pyco;
	logic     pyga;
	logic     pygo;
	logic     pyhu;
	logic     pyma;
	logic     pynu;
	logic     pysu;
	logic     pyzu;
	logic     pyzy;
	logic     r_vin_en;
	logic     rabo;
	logic     raby;
	logic     raca;
	logic     raco;
	logic     racu;
	logic     rada;
	logic     rady;
	logic     rafy;
	logic     raga;
	logic     rage;
	logic     ragu;
	logic     raha;
	logic     rahu;
	logic     raja;
	logic     rajo;
	logic     rajy;
	logic     rake;
	logic     ralo;
	logic     ralu;
	logic     rama;
	logic     ramu;
	logic     rano;
	logic     rape;
	logic     rapu;
	logic     rare;
	logic     rasy;
	logic     rata;
	logic     rate;
	logic     rato;
	logic     ratu;
	logic     rave;
	logic     ravo;
	logic     ravu;
	logic     rawa;
	logic     raxy;
	logic     raza;
	logic     razo;
	logic     read;
	logic     reda;
	logic     redu;
	logic     refo;
	logic     refu;
	logic     rega;
	logic     rege;
	logic     reho;
	logic     rehu;
	logic     reku;
	logic     rela;
	logic     remy;
	logic     rena;
	logic     rene;
	logic     repa;
	logic     repu;
	logic     rera;
	logic     rery;
	logic     reset;
	logic     resy;
	logic     revo;
	logic     revu;
	logic     revy;
	logic     rewo;
	logic     rmixer0;
	logic     rmixer1;
	logic     rmixer2;
	logic     rmixer3;
	logic     roco;
	logic     rocy;
	logic     rodu;
	logic     rofa;
	logic     roga;
	logic     rogy;
	logic     roka;
	logic     roke;
	logic     roko;
	logic     roku;
	logic     rolu;
	logic     rome;
	logic     romo;
	logic     rona;
	logic     rone;
	logic     ronu;
	logic     rony;
	logic     rope;
	logic     ropy;
	logic     rora;
	logic     rore;
	logic     roro;
	logic     roru;
	logic     rory;
	logic     rosa;
	logic     rosu;
	logic     rosy;
	logic     rotu;
	logic     rove;
	logic     roxo;
	logic     roxu;
	logic     roxy;
	logic     roze;
	logic     rube;
	logic     rubu;
	logic     ruby;
	logic     ruca;
	logic     ruce;
	logic     ruco;
	logic     ruda;
	logic     rudu;
	logic     rugo;
	logic     rugy;
	logic     ruja;
	logic     ruju;
	logic     ruky;
	logic     rulo;
	logic     ruly;
	logic     ruma;
	logic     rumu;
	logic     runa;
	logic     rune;
	logic     runo;
	logic     runy_const1;
	logic     rupa;
	logic     rura;
	logic     rusy;
	logic     ruta;
	logic     rute;
	logic     ruto;
	logic     ruvy;
	logic     ruxa;
	logic     ruze;
	logic     ruzy;
	logic     ryba;
	logic     rybo;
	logic     ryce;
	logic     rycu;
	logic     ryda;
	logic     rydu;
	logic     rydy;
	logic     ryfa;
	logic     ryfe;
	logic     ryfu;
	logic     ryga;
	logic     ryja;
	logic     ryje;
	logic     ryju;
	logic     ryjy;
	logic     ryku;
	logic     ryky;
	logic     ryle;
	logic     rylu;
	logic     ryme;
	logic     ryno;
	logic     rypo;
	logic     rypu;
	logic     ryro;
	logic     rysa;
	logic     ryso;
	logic     ryty;
	logic     ryve;
	logic     ryvo;
	logic     ryze;
	logic     ryzy;
	logic     sabe;
	logic     sabu;
	logic     sadu;
	logic     sady;
	logic     sago;
	logic     saja;
	logic     sake;
	logic     sako;
	logic     saky;
	logic     sala;
	logic     sale;
	logic     salo;
	logic     same;
	logic     samo;
	logic     samy;
	logic     sana;
	logic     sanu;
	logic     sapa;
	logic     sapy;
	logic     sara;
	logic     sary;
	logic     sata;
	logic     sato;
	logic     save_sprite_num0;
	logic     save_sprite_num2;
	logic     save_sprite_num3;
	logic     save_sprite_num4;
	logic     save_sprite_num5;
	logic     save_sprite_num6;
	logic     save_sprite_num7;
	logic     save_sprite_num8;
	logic     save_sprite_num9;
	logic     save_sprite_x0;
	logic     save_sprite_x1;
	logic     save_sprite_x2;
	logic     save_sprite_x3;
	logic     save_sprite_x4;
	logic     save_sprite_x5;
	logic     save_sprite_x6;
	logic     save_sprite_x7;
	logic     save_sprite_x8;
	logic     save_sprite_x9;
	logic     save_sprite_y0;
	logic     save_sprite_y1;
	logic     save_sprite_y2;
	logic     save_sprite_y3;
	logic     save_sprite_y4;
	logic     save_sprite_y5;
	logic     save_sprite_y6;
	logic     save_sprite_y7;
	logic     save_sprite_y8;
	logic     save_sprite_y9;
	logic     sawu;
	logic     saza;
	logic     sazo;
	logic     sazu;
	logic     sazy;
	logic     sck_dir;
	logic     seba;
	logic     sebo;
	logic     seby;
	logic     seca;
	logic     sedo;
	logic     sedy;
	logic     sefa;
	logic     sefu;
	logic     sefy;
	logic     sega;
	logic     segu;
	logic     seja;
	logic     sejy;
	logic     seko;
	logic     sele;
	logic     selo;
	logic     selu;
	logic     sema;
	logic     seme;
	logic     semo;
	logic     semu;
	logic     semy;
	logic     seno;
	logic     sepa;
	logic     sepy;
	logic     ser_out;
	logic     sera;
	logic     sere;
	logic     sery;
	logic     seta;
	logic     setu;
	logic     sewo;
	logic     seze;
	real      so1;
	real      so2;
	logic     soba;
	logic     sobo;
	logic     sobu;
	logic     soby;
	logic     soca;
	logic     soce;
	logic     socy;
	logic     sody;
	logic     sofy;
	logic     sogo;
	logic     sogu;
	logic     sogy;
	logic     soha;
	logic     soho;
	logic     sohy;
	logic     soja;
	logic     soky;
	logic     sola;
	logic     sole;
	logic     solo;
	logic     soly;
	logic     soma;
	logic     somy;
	logic     sono;
	logic     sopu;
	logic     sora;
	logic     sore;
	logic     soro;
	logic     sose;
	logic     sota;
	logic     sovu;
	logic     sovy;
	logic     sowo;
	logic     sozu;
	logic     sp_bp_cys;
	logic     sp_d0;
	logic     sp_d1;
	logic     sp_d2;
	logic     sp_d3;
	logic     sp_d4;
	logic     sp_d5;
	logic     sp_d6;
	logic     sp_d7;
	logic     sprite_on0;
	logic     sprite_on1;
	logic     sprite_on2;
	logic     sprite_on3;
	logic     sprite_on4;
	logic     sprite_on5;
	logic     sprite_on6;
	logic     sprite_on7;
	logic     sprite_palette;
	logic     sprite_priority;
	logic     sprite_px_a0;
	logic     sprite_px_a1;
	logic     sprite_px_a2;
	logic     sprite_px_a3;
	logic     sprite_px_a4;
	logic     sprite_px_a5;
	logic     sprite_px_a6;
	logic     sprite_px_a7;
	logic     sprite_px_b0;
	logic     sprite_px_b1;
	logic     sprite_px_b2;
	logic     sprite_px_b3;
	logic     sprite_px_b4;
	logic     sprite_px_b5;
	logic     sprite_px_b6;
	logic     sprite_px_b7;
	logic     sprite_px_palette;
	logic     sprite_px_priority;
	logic     sprite_rst0;
	logic     sprite_rst1;
	logic     sprite_rst2;
	logic     sprite_rst3;
	logic     sprite_rst4;
	logic     sprite_rst5;
	logic     sprite_rst6;
	logic     sprite_rst7;
	logic     sprite_rst8;
	logic     sprite_rst9;
	logic     sprite_sel0;
	logic     sprite_sel1;
	logic     sprite_sel2;
	logic     sprite_sel3;
	logic     sprite_sel4;
	logic     sprite_sel5;
	logic     sprite_sel6;
	logic     sprite_sel7;
	logic     sprite_sel8;
	logic     sprite_sel9;
	logic     sprite_x_flip;
	logic     sprite_x_match;
	logic     sprite_x_match_h0;
	logic     sprite_x_match_h1;
	logic     sprite_x_match_h2;
	logic     sprite_x_match_h3;
	logic     sprite_x_match_h4;
	logic     sprite_x_match_h5;
	logic     sprite_x_match_h6;
	logic     sprite_x_match_h7;
	logic     sprite_x_match_h8;
	logic     sprite_x_match_h9;
	logic     sprite_x_match_l0;
	logic     sprite_x_match_l1;
	logic     sprite_x_match_l2;
	logic     sprite_x_match_l3;
	logic     sprite_x_match_l4;
	logic     sprite_x_match_l5;
	logic     sprite_x_match_l6;
	logic     sprite_x_match_l7;
	logic     sprite_x_match_l8;
	logic     sprite_x_match_l9;
	logic     sprite_y_flip;
	logic     sprite_y_match;
	tri logic sprite_y_store0;
	tri logic sprite_y_store1;
	tri logic sprite_y_store2;
	tri logic sprite_y_store3;
	logic     start_oam_parsing;
	logic     stop_mode3;
	logic     stop_oam_parsing;
	logic     subo;
	logic     subu;
	logic     suca;
	logic     suco;
	logic     sudo;
	logic     sufy;
	logic     sugy;
	logic     suha;
	logic     suke;
	logic     suko;
	logic     suky;
	logic     sulo;
	logic     sulu;
	logic     suly;
	logic     sum0;
	logic     sum1;
	logic     sum10;
	logic     sum2;
	logic     sum3;
	logic     sum4;
	logic     sum5;
	logic     sum6;
	logic     sum7;
	logic     sum8;
	logic     sum9;
	logic     sumo;
	logic     suna;
	logic     suny;
	logic     supu;
	logic     sura;
	logic     sure;
	logic     sury;
	logic     suto;
	logic     sutu;
	logic     suvu;
	logic     suze;
	logic     suzu;
	logic     sybo;
	logic     sybu;
	logic     syby;
	logic     sycu;
	logic     sycy;
	logic     syfu;
	logic     sygu;
	logic     sylo;
	logic     syma;
	logic     synu;
	logic     syny;
	logic     sypy;
	logic     syru;
	logic     syry;
	logic     sysa;
	logic     sysy;
	logic     sywe;
	logic     syzo;
	logic     t1t2_n;
	logic     taby;
	logic     taca;
	logic     tacu;
	logic     tade;
	logic     tafa;
	logic     tafu;
	logic     tafy;
	logic     tago;
	logic     tagy;
	logic     tajo;
	logic     taka;
	logic     tama;
	logic     tame;
	logic     tamu;
	logic     tape;
	logic     tapo;
	logic     tate;
	logic     tave;
	logic     tavy;
	logic     taxa;
	logic     taxy;
	logic     tazy;
	logic     tebo;
	logic     tece;
	logic     tecy;
	logic     teda;
	logic     tede;
	logic     tefa;
	logic     tefy;
	logic     tegu;
	logic     tegy;
	logic     tehe;
	logic     teka;
	logic     teke;
	logic     teko;
	logic     teky;
	logic     tena;
	logic     tenu;
	logic     tepa;
	logic     tepo;
	logic     tepu;
	logic     tepy;
	logic     tera;
	logic     tero;
	logic     teru;
	logic     tery;
	logic     tese;
	logic     teso;
	logic     tevo;
	logic     tevy;
	logic     texe;
	logic     tm_bp_cys;
	logic     tm_cy;
	logic     toba;
	logic     tobe;
	logic     tobu;
	logic     toca;
	logic     tocu;
	logic     tode;
	logic     tofe;
	logic     toga;
	logic     tola;
	logic     tole;
	logic     tolu;
	logic     tome;
	logic     tomu;
	logic     tomy;
	logic     tona;
	logic     tope;
	logic     topu;
	logic     tory;
	logic     tosa;
	logic     totu;
	logic     tovo;
	logic     tovy;
	logic     towa;
	logic     toxe;
	logic     toza;
	logic     tozo;
	logic     tozu;
	logic     tube;
	logic     tuby;
	logic     tuca;
	logic     tucy;
	logic     tuda;
	logic     tufa;
	logic     tufo;
	logic     tufu;
	logic     tuge;
	logic     tugo;
	logic     tuja;
	logic     tuju;
	logic     tujy;
	logic     tuku;
	logic     tula;
	logic     tulo;
	logic     tulu;
	logic     tuly;
	logic     tuma;
	logic     tune;
	logic     tuny;
	logic     tupe;
	logic     tuso;
	logic     tuto;
	logic     tuva;
	logic     tuvo;
	logic     tuwu;
	logic     tuxa;
	logic     tuxe;
	logic     tuxy;
	logic     tyba;
	logic     tyce;
	logic     tyde;
	logic     tyfa;
	logic     tyfo;
	logic     tyga;
	logic     tyge;
	logic     tyho;
	logic     tyju;
	logic     tyjy;
	logic     tyko;
	logic     tyku;
	logic     tyme;
	logic     tymu;
	logic     tyno;
	logic     tynu;
	logic     tyra;
	logic     tyro;
	logic     tyru;
	logic     tyso;
	logic     tytu;
	logic     tyva;
	logic     tyvy;
	logic     ubal;
	logic     ubet;
	logic     ucob;
	logic     ucom;
	logic     udor;
	logic     ufeg;
	logic     ufor;
	logic     ugac;
	logic     ugot;
	logic     ujyv;
	logic     ukap;
	logic     ulur;
	logic     umob;
	logic     unut;
	logic     upyf;
	logic     urun;
	logic     urys;
	logic     usec;
	logic     usuf;
	logic     utok;
	logic     uvar;
	logic     uver;
	logic     uwam;
	logic     v0;
	logic     v1;
	logic     v2;
	logic     v3;
	logic     v4;
	logic     v5;
	logic     v6;
	logic     v7;
	logic     vaby;
	logic     vafa;
	logic     vage;
	logic     vama;
	logic     vape;
	logic     varo;
	logic     vata;
	logic     vate;
	logic     vave;
	logic     vbl;
	logic     vclk;
	logic     vclk2;
	logic     vdd;
	logic     vefu;
	logic     veku;
	logic     vely;
	logic     vepe;
	logic     vevo;
	logic     vexu;
	logic     vezo;
	real      vin;
	logic     voby;
	logic     vode;
	logic     voga;
	logic     voku;
	logic     volo;
	logic     vomy;
	logic     vonu;
	logic     vosa;
	logic     voto;
	logic     vova;
	logic     voxu;
	logic     voze;
	logic     vram_to_oam;
	logic     vuce;
	logic     vugo;
	logic     vujo;
	logic     vume;
	logic     vumo;
	logic     vumu;
	logic     vune;
	logic     vusa;
	logic     vuso;
	logic     vuty;
	logic     vuza;
	logic     vybo;
	logic     vyco;
	logic     vycu;
	logic     vymu;
	logic     vyno;
	logic     vypo_const1;
	logic     vyre;
	logic     vyro;
	logic     vysa;
	logic     vywa;
	logic     wabe;
	logic     wacy;
	logic     wado;
	logic     wafo;
	logic     wafu;
	logic     wafy;
	logic     wage;
	logic     wago;
	logic     wajy;
	logic     wale;
	logic     walo;
	logic     waly;
	logic     wamy;
	logic     wane;
	logic     wapo;
	logic     waru;
	logic     wase;
	logic     wata;
	logic     wate;
	logic     wave_a1_na0_n;
	logic     wave_a1_na0;
	logic     wave_a2_n;
	logic     wave_a3_n;
	logic     wave_a0;
	logic     wave_a1;
	logic     wave_a1a0_n;
	logic     wave_a1a0;
	logic     wave_a2;
	logic     wave_a3;
	logic     wave_data_latch;
	logic     wave_nibble_sel;
	logic     wave_play_d0;
	logic     wave_play_d1;
	logic     wave_play_d2;
	logic     wave_play_d3;
	logic     wave_ram_bl_precharge;
	logic     wave_ram_rd;
	logic     wave_ram_wr;
	logic     wave_ram_wr2;
	logic     wave_rd_d0;
	logic     wave_rd_d1;
	logic     wave_rd_d2;
	logic     wave_rd_d3;
	logic     wave_rd_d4;
	logic     wave_rd_d5;
	logic     wave_rd_d6;
	logic     wave_rd_d7;
	logic     wavu;
	logic     waxo;
	logic     waxu;
	logic     wazo;
	logic     webo;
	logic     webu;
	logic     weco;
	logic     wede;
	logic     wedu;
	logic     wedy;
	logic     wefe_const1;
	logic     wefu;
	logic     wefy;
	logic     wega;
	logic     wego;
	logic     weja;
	logic     weka;
	logic     weko;
	logic     weku;
	logic     wele;
	logic     welo;
	logic     wema;
	logic     weme;
	logic     weny;
	logic     wepo;
	logic     wery;
	logic     wesa;
	logic     weta;
	logic     wety;
	logic     wevo;
	logic     win_start;
	logic     wobo;
	logic     wobu;
	logic     woda;
	logic     wody;
	logic     wofa;
	logic     wofe;
	logic     wofo;
	logic     wohe;
	logic     wohu;
	logic     wojo;
	logic     woju;
	logic     woka;
	logic     wolo;
	logic     woly;
	logic     womu;
	logic     womy;
	logic     \wone ;
	logic     wope;
	logic     wopo;
	logic     woru;
	logic     wosu;
	logic     wota;
	logic     wote;
	logic     woxa;
	logic     write;
	logic     wubu;
	logic     wuda;
	logic     wufa;
	logic     wufu;
	logic     wuha;
	logic     wuhu;
	logic     wuhu_c;
	logic     wuja;
	logic     wuje;
	logic     wujy;
	logic     wuko;
	logic     wuku;
	logic     wuky;
	logic     wuna;
	logic     wura;
	logic     wuru;
	logic     wury;
	logic     wuse;
	logic     wusu;
	logic     wuto;
	logic     wutu;
	logic     wuty;
	logic     wuza;
	logic     wx_clk;
	logic     wxy_match;
	logic     wy_clk;
	logic     wy_latch;
	logic     wy_match;
	logic     wybo;
	logic     wyce;
	logic     wyco;
	logic     wycy;
	logic     wyde;
	logic     wyfu;
	logic     wyja;
	logic     wyka;
	logic     wyko;
	logic     wyla;
	logic     wyle;
	logic     wylu;
	logic     wyna;
	logic     wyno;
	logic     wype;
	logic     wyru;
	logic     wyvo;
	logic     wyxo;
	logic     wyza;
	logic     wyze;
	logic     xaba;
	logic     xabe;
	logic     xado;
	logic     xafu;
	logic     xaga;
	logic     xage;
	logic     xaha;
	logic     xahy;
	logic     xajo;
	logic     xako;
	logic     xala;
	logic     xaly;
	logic     xane;
	logic     xano;
	logic     xare;
	logic     xato;
	logic     xaty;
	logic     xavu;
	logic     xebe;
	logic     xecy;
	logic     xedu;
	logic     xefy;
	logic     xega;
	logic     xegy;
	logic     xeju;
	logic     xeka;
	logic     xelo;
	logic     xely;
	logic     xena;
	logic     xeno;
	logic     xenu;
	logic     xeny;
	logic     xepa;
	logic     xepe;
	logic     xepo;
	logic     xera;
	logic     xere;
	logic     xete;
	logic     xeva;
	logic     xexa;
	logic     xexu;
	logic     xeze;
	logic     xoce;
	logic     xodo;
	logic     xofo;
	logic     xoga;
	logic     xoja;
	logic     xojo;
	logic     xola;
	logic     xole;
	logic     xolo;
	logic     xoly;
	logic     xoma;
	logic     xomy;
	logic     xono;
	logic     xora;
	logic     xosu;
	logic     xota;
	logic     xowo;
	logic     xozy;
	logic     xubo;
	logic     xuca;
	logic     xuce;
	logic     xuco;
	logic     xucy;
	logic     xudy;
	logic     xufa;
	logic     xufy;
	logic     xugu;
	logic     xuho;
	logic     xuhy;
	logic     xuja;
	logic     xujo;
	logic     xujy;
	logic     xuke;
	logic     xuku;
	logic     xula;
	logic     xuny;
	logic     xupa;
	logic     xupy;
	logic     xuqu;
	logic     xura;
	logic     xure;
	logic     xury;
	logic     xusy;
	logic     xuto;
	logic     xuvy;
	logic     xuzo;
	logic     xx00_xx07;
	logic     xyba;
	logic     xyfy;
	logic     xyha;
	logic     xyke;
	logic     xyky;
	logic     xyla;
	logic     xyle;
	logic     xyly;
	logic     xyru;
	logic     xyso;
	logic     xyva;
	logic     xyve;
	logic     yaza;
	logic     ybed;
	logic     ybez;
	logic     ybor;
	logic     ybox;
	logic     ycah;
	logic     yceb;
	logic     ycol;
	logic     ycux;
	logic     ydaj;
	logic     ydod;
	logic     ydug;
	logic     ydyv;
	logic     yfag;
	logic     yfop;
	logic     yfun;
	logic     ygaj;
	logic     ygem;
	logic     yhej;
	logic     yhok;
	logic     ylac;
	logic     ylah;
	logic     yloz;
	logic     ylyc;
	logic     ymam;
	logic     ymaw;
	logic     ymem;
	logic     ynep;
	logic     ynyc;
	logic     ynys;
	logic     ypod;
	logic     ypuk;
	logic     yrac;
	logic     yrop;
	logic     yrum;
	logic     yryv;
	logic     yses;
	logic     ysex;
	logic     ysod;
	logic     ysum;
	logic     ytyl;
	logic     ytyp;
	logic     yula;
	logic     yvac;
	logic     yvag;
	logic     yval;
	logic     yvap;
	logic     yvel;
	logic     yvuz;
	logic     ywok;
	logic     yzof;
	logic     zado;
	logic     zadu;
	logic     zaha;
	logic     zaku;
	logic     zala;
	logic     zape;
	logic     zare;
	logic     zate;
	logic     zaxe;
	logic     zaxy;
	logic     zeba;
	logic     zeca;
	logic     zecu;
	logic     zeda;
	logic     zefe;
	logic     zejo;
	logic     zemu;
	logic     zesa;
	logic     zogo;
	logic     zogy;
	logic     zoky;
	logic     zola;
	logic     zoly;
	logic     zoro;
	logic     zuca;
	logic     zufa;
	logic     zulo;
	logic     zulu;
	logic     zuru;
	logic     zuve;
	logic     zuvu;
	logic     zuza;
	logic     zuzy;
	logic     zygo;
	logic     zyjo;
	logic     zyku;
	logic     zypu;
	logic     zywu;

	dmg_pad_out #(
		) cs_n_inst (
			.o_n(tyho),
			.pad(cs_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(4464.626)
		) mcs_n_inst (
			.pdrv_n(soky),
			.ndrv(rosu),
			.i_n(mcs_in_n),
			.pad(mcs_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(4956.564)
		) mrd_n_inst (
			.pdrv_n(refo),
			.ndrv(ronu),
			.i_n(mrd_in_n),
			.pad(mrd_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(5376.783)
		) mwr_n_inst (
			.pdrv_n(sysy),
			.ndrv(ragu),
			.i_n(mwr_in_n),
			.pad(mwr_n_pad)
		);

	dmg_pad_in_pu #(
			.L_i_n(1463.859)
		) nmi_n_inst (
			.i_n(nmi),
			.pad(nmi_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(4592.924)
		) rd_n_inst (
			.pdrv_n(ugac),
			.ndrv(urun),
			.i_n(rd_in_n),
			.pad(rd_n_pad)
		);

	dmg_pad_in #(
			.L_i_n(10785.44)
		) reset_n_inst (
			.i_n(reset),
			.pad(reset_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(4909.019)
		) wr_n_inst (
			.pdrv_n(uver),
			.ndrv(usuf),
			.i_n(wr_in_n),
			.pad(wr_n_pad)
		);

	dmg_pad_bidir #(
			.L_i_n(2073.204)
		) a0_inst (
			.pdrv_n(kupo),
			.ndrv(koty),
			.i_n(a0_in_n),
			.pad(a_pad[0])
		);

	dmg_pad_bidir #(
			.L_i_n(1750.47)
		) a1_inst (
			.pdrv_n(caba),
			.ndrv(cotu),
			.i_n(a1_in_n),
			.pad(a_pad[1])
		);

	dmg_pad_bidir #(
			.L_i_n(692.7495)
		) a10_inst (
			.pdrv_n(roxu),
			.ndrv(rore),
			.i_n(a10_in_n),
			.pad(a_pad[10])
		);

	dmg_pad_bidir #(
			.L_i_n(808.2971)
		) a11_inst (
			.pdrv_n(lepy),
			.ndrv(lyny),
			.i_n(a11_in_n),
			.pad(a_pad[11])
		);

	dmg_pad_bidir #(
			.L_i_n(628.9996)
		) a12_inst (
			.pdrv_n(luce),
			.ndrv(loso),
			.i_n(a12_in_n),
			.pad(a_pad[12])
		);

	dmg_pad_bidir #(
			.L_i_n(859.0313)
		) a13_inst (
			.pdrv_n(labe),
			.ndrv(leva),
			.i_n(a13_in_n),
			.pad(a_pad[13])
		);

	dmg_pad_bidir #(
			.L_i_n(1480.594)
		) a14_inst (
			.pdrv_n(puhe),
			.ndrv(pahy),
			.i_n(a14_in_n),
			.pad(a_pad[14])
		);

	dmg_pad_bidir #(
			.L_i_n(2238.688)
		) a15_inst (
			.pdrv_n(suze),
			.ndrv(rulo),
			.i_n(a15_in_n),
			.pad(a_pad[15])
		);

	dmg_pad_bidir #(
			.L_i_n(1379.922)
		) a2_inst (
			.pdrv_n(boku),
			.ndrv(bajo),
			.i_n(a2_in_n),
			.pad(a_pad[2])
		);

	dmg_pad_bidir #(
			.L_i_n(1124.125)
		) a3_inst (
			.pdrv_n(boty),
			.ndrv(bola),
			.i_n(a3_in_n),
			.pad(a_pad[3])
		);

	dmg_pad_bidir #(
			.L_i_n(932.078)
		) a4_inst (
			.pdrv_n(byla),
			.ndrv(bevo),
			.i_n(a4_in_n),
			.pad(a_pad[4])
		);

	dmg_pad_bidir #(
			.L_i_n(1127.048)
		) a5_inst (
			.pdrv_n(badu),
			.ndrv(ajav),
			.i_n(a5_in_n),
			.pad(a_pad[5])
		);

	dmg_pad_bidir #(
			.L_i_n(1854.594)
		) a6_inst (
			.pdrv_n(cepu),
			.ndrv(cyka),
			.i_n(a6_in_n),
			.pad(a_pad[6])
		);

	dmg_pad_bidir #(
			.L_i_n(2101.095)
		) a7_inst (
			.pdrv_n(defy),
			.ndrv(colo),
			.i_n(a7_in_n),
			.pad(a_pad[7])
		);

	dmg_pad_bidir #(
			.L_i_n(1730.548)
		) a8_inst (
			.pdrv_n(myny),
			.ndrv(mego),
			.i_n(a8_in_n),
			.pad(a_pad[8])
		);

	dmg_pad_bidir #(
			.L_i_n(1347.782)
		) a9_inst (
			.pdrv_n(mune),
			.ndrv(meny),
			.i_n(a9_in_n),
			.pad(a_pad[9])
		);

	dmg_not_x1 #(
			.L_y(128.0313)
		) abaf_inst (
			.in(start_oam_parsing),
			.y(abaf)
		);

	dmg_or2 #(
			.L_y(109.4376)
		) abak_inst (
			.in1(atej),
			.in2(amyg),
			.y(abak)
		);

	dmg_not_x2 #(
			.L_y(3370.781)
		) abef_inst (
			.in(h5),
			.y(h5_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(113.1565)
		) abeg_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y5),
			.ena_n(bucy),
			.q(),
			.q_n(abeg_n)
		);

	dmg_dffr #(
			.L_q(156.9845),
			.L_q_n(72.51572)
		) abel_inst (
			.d(abel_n),
			.clk(alop),
			.r_n(boky),
			.q(abel),
			.q_n(abel_n)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) abem_inst (
			.in(xuqu),
			.ena_n(abon),
			.y(ma0_n)
		);

	dmg_not_x2 #(
			.L_y(2292.875)
		) abev_inst (
			.in(azug),
			.y(hram_bl_precharge_n)
		);

	dmg_not_x1 #(
			.L_y(1180.438)
		) abez_inst (
			.in(atar),
			.y(abez)
		);

	dmg_full_add #(
			.L_cout(150.3436),
			.L_sum(132.5468)
		) abod_inst (
			.a(h4),
			.b(ff43_d4),
			.cin(babe_c),
			.cout(abod_c),
			.sum(abod)
		);

	dmg_not_x1 #(
			.L_y(800.8602)
		) abol_inst (
			.in(clk_ena),
			.y(clk_ena_n)
		);

	dmg_not_x2 #(
			.L_y(3085.499)
		) abon_inst (
			.in(sp_bp_cys),
			.y(abon)
		);

	dmg_dlatch_ee #(
			.L_q_n(113.9527)
		) abop_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y1),
			.ena_n(ahof),
			.q(),
			.q_n(abop_n)
		);

	dmg_and2 #(
			.L_y(847.3438)
		) abov_inst (
			.in1(vclk2),
			.in2(ales),
			.y(abov)
		);

	dmg_not_x2 #(
			.L_y(1401.172)
		) abub_inst (
			.in(a2),
			.y(abub)
		);

	dmg_nand2 #(
			.L_y(32.40649)
		) abuf_inst (
			.in1(hram_wldrv_ena),
			.in2(cpu_rd),
			.y(abuf)
		);

	dmg_dlatch_ee #(
			.L_q_n(223.1246)
		) abug_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y1),
			.ena_n(ahof),
			.q(),
			.q_n(abug_n)
		);

	dmg_not_x1 #(
			.L_y(194.4375)
		) abup_inst (
			.in(a5_in_n),
			.y(abup)
		);

	dmg_not_x1 #(
			.L_y(579.594)
		) abur_inst (
			.in(pch_phase_n),
			.y(abur)
		);

	dmg_dlatch_ee #(
			.L_q_n(109.1717)
		) abux_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y5),
			.ena_n(bucy),
			.q(),
			.q_n(abux_n)
		);

	dmg_not_x3 #(
			.L_y(4663.846)
		) abuz_inst (
			.in(awod),
			.y(cpu_ext_cs_en)
		);

	dmg_not_x2 #(
			.L_y(3827.125)
		) acam_inst (
			.in(h0),
			.y(h0_n)
		);

	dmg_and4 #(
			.L_y(147.1561)
		) acat_inst (
			.in1(ff00_ff20_ff40_ff60),
			.in2(cpu_rd),
			.in3(akug),
			.in4(byko),
			.y(ff00rd)
		);

	dmg_nand2 #(
		) aced_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_dffr #(
			.L_q(237.7347)
		) acef_inst (
			.d(batu),
			.clk(clk_1mhz),
			.r_n(reset2_n),
			.q(acef),
			.q_n()
		);

	dmg_and2 #(
			.L_y(1165.032)
		) aceg_inst (
			.in1(ch1_env3),
			.in2(boto),
			.y(ch1_out[3])
		);

	dmg_and2 #(
			.L_y(349.8286)
		) acen_inst (
			.in1(tm_cy),
			.in2(axad),
			.y(acen)
		);

	dmg_dlatch_ee #(
			.L_q_n(126.7034)
		) acep_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y5),
			.ena_n(bucy),
			.q(),
			.q_n(acep_n)
		);

	dmg_not_x2 #(
			.L_y(1694.954)
		) acol_inst (
			.in(a3),
			.y(acol)
		);

	dmg_nand4 #(
			.L_y(138.922)
		) acom_inst (
			.in1(avun),
			.in2(asad),
			.in3(a5),
			.in4(a4),
			.y(acom)
		);

	dmg_not_x1 #(
			.L_y(1048.688)
		) acor_inst (
			.in(apu_reset),
			.y(acor)
		);

	dmg_not_if0 #(
			.L_y(3599.485)
		) acot_inst (
			.in(md5),
			.ena_n(azar),
			.y(oam_a_d5_n)
		);

	dmg_full_add #(
			.L_sum(155.3908)
		) acul_inst (
			.a(h7),
			.b(ff43_d7),
			.cin(byca_c),
			.cout(),
			.sum(acul)
		);

	dmg_not_x2 #(
			.L_y(596.5935)
		) acup_inst (
			.in(bono),
			.y(acup)
		);

	dmg_not_x2 #(
			.L_y(463.2505)
		) acyj_inst (
			.in(byfa),
			.y(acyj)
		);

	dmg_and2 #(
			.L_y(2222.485)
		) acyl_inst (
			.in1(boge),
			.in2(oam_parsing),
			.y(mode2)
		);

	dmg_not_x4 #(
			.L_y(4097.001)
		) adad_inst (
			.in(byte_n),
			.y(ch1_ld_sum)
		);

	dmg_not_x1 #(
			.L_y(118.9999)
		) adah_inst (
			.in(fexx),
			.y(adah)
		);

	dmg_not_x2 #(
			.L_y(1025.844)
		) adak_inst (
			.in(befu),
			.y(adak)
		);

	dmg_nand2 #(
		) adap_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(305.4686)
		) adar_inst (
			.in(adyk),
			.y(adar)
		);

	dmg_not_x2 #(
			.L_y(3774.266)
		) adaz_inst (
			.in(h6),
			.y(h6_n)
		);

	dmg_not_x1 #(
			.L_y(401.8906)
		) adeh_inst (
			.in(atal_4mhz),
			.y(adeh)
		);

	dmg_drlatch_ee #(
			.L_q_n(793.9528)
		) adek_inst (
			.d(d4),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d4_n)
		);

	dmg_not_x1 #(
			.L_y(142.6409)
		) adok_inst (
			.in(wave_rd_d3),
			.y(adok)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) adyb_inst (
			.in(axuv_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a7)
		);

	dmg_drlatch_ee #(
			.L_q(65.60931),
			.L_q_n(233.2189)
		) adyk_inst (
			.d(apuk),
			.ena(adeh),
			.ena_n(atal_4mhz),
			.r_n(test_reset_n),
			.q(adyk),
			.q_n(adyk_n)
		);

	dmg_not_x2 #(
			.L_y(72.7818)
		) adyr_inst (
			.in(axyn),
			.y(adyr)
		);

	dmg_nor2 #(
			.L_y(60.56277)
		) afar_inst (
			.in1(reset),
			.in2(alyp),
			.y(afar)
		);

	dmg_nor2 #(
			.L_y(47.28142)
		) afas_inst (
			.in1(adar),
			.in2(atyp),
			.y(afas)
		);

	dmg_not_x1 #(
			.L_y(969.5303)
		) afat_inst (
			.in(apu_reset),
			.y(apu_reset2_n)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) afeb_inst (
			.in(abod),
			.ena_n(bafy),
			.y(ma1_n)
		);

	dmg_not_x1 #(
			.L_y(462.4532)
		) afec_inst (
			.in(a4_in_n),
			.y(afec)
		);

	dmg_nand2 #(
			.L_y(265.8909)
		) afeg_inst (
			.in1(d2),
			.in2(deby),
			.y(afeg)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) afen_inst (
			.in(bado_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a4)
		);

	dmg_not_x1 #(
			.L_y(463.5166)
		) afep_inst (
			.in(alef),
			.y(afep)
		);

	dmg_dffr_cc #(
			.L_q(4024.753)
		) afer_inst (
			.d(asol_n),
			.clk(clk_1mhz),
			.clk_n(clk_1mhz_n),
			.r_n(test_reset_n),
			.q(cpu_sys_reset),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(1639.703)
		) afob_inst (
			.in(a1),
			.y(afob)
		);

	dmg_not_x2 #(
			.L_y(846.2813)
		) afop_inst (
			.in(apys),
			.y(afop)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) afox_inst (
			.in(ff10_d3_n),
			.ena_n(asop),
			.y(d3)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) afoz_inst (
			.in(byhu_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a3)
		);

	dmg_and2 #(
			.L_y(135.4689)
		) afug_inst (
			.in1(kedo),
			.in2(byru),
			.y(afug)
		);

	dmg_mux #(
			.L_y(662.734)
		) afum_inst (
			.sel(ch3_active),
			.d1(exel),
			.d0(a2),
			.y(wave_a2)
		);

	dmg_drlatch_ee #(
			.L_q(120.0626),
			.L_q_n(69.59341)
		) afur_inst (
			.d(adyk_n),
			.ena(atal_4mhz),
			.ena_n(adeh),
			.r_n(test_reset_n),
			.q(afur),
			.q_n(afur_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(77.03129)
		) afut_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y8),
			.ena_n(bymy),
			.q(),
			.q_n(afut_n)
		);

	dmg_nor2 #(
			.L_y(135.7344)
		) afux_inst (
			.in1(apu_reset),
			.in2(buvo),
			.y(afux)
		);

	dmg_dlatch_ee #(
			.L_q_n(104.9216)
		) afym_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y8),
			.ena_n(bymy),
			.q(),
			.q_n(afym_n)
		);

	dmg_and2 #(
			.L_y(80.21886)
		) afyr_inst (
			.in1(kedo),
			.in2(bojo),
			.y(afyr)
		);

	dmg_dlatch_ee #(
			.L_q_n(104.922)
		) afyx_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y8),
			.ena_n(bymy),
			.q(),
			.q_n(afyx_n)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) agag_inst (
			.in(buvy),
			.ena_n(abon),
			.y(ma3_n)
		);

	dmg_dffr #(
			.L_q(182.7493)
		) agem_inst (
			.d(acef),
			.clk(clk_1mhz),
			.r_n(reset2_n),
			.q(agem),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q_n(515.046)
		) ager_inst (
			.d(d2),
			.ena(bowe),
			.ena_n(ataf),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(rvolume2_n)
		);

	dmg_not_x1 #(
			.L_y(348.4996)
		) aget_inst (
			.in(agyn),
			.y(aget)
		);

	dmg_dffsr #(
			.L_q(852.1252)
		) agez_inst (
			.d(beku),
			.clk(becy),
			.s_n(beso),
			.r_n(afux),
			.q(agez),
			.q_n()
		);

	dmg_and2 #(
			.L_y(1068.875)
		) agof_inst (
			.in1(ch1_env2),
			.in2(boto),
			.y(ch1_out[2])
		);

	dmg_nor2 #(
			.L_y(620.5)
		) agor_inst (
			.in1(apu_reset),
			.in2(afug),
			.y(agor)
		);

	dmg_not_x1 #(
			.L_y(1897.625)
		) agur_inst (
			.in(apu_reset),
			.y(apu_reset_n)
		);

	dmg_oa21 #(
			.L_y(60.29699)
		) agut_inst (
			.in1(arov),
			.in2(ajax),
			.in3(mreq),
			.y(agut)
		);

	dmg_not_x6 #(
			.L_y(8222.952)
		) aguz_inst (
			.in(cpu_rd),
			.y(apu_rd_n)
		);

	dmg_not_if0 #(
			.L_y(4722.281)
		) agyk_inst (
			.in(md5),
			.ena_n(azar),
			.y(oam_b_d5_n)
		);

	dmg_mux #(
			.L_y(619.9687)
		) agyl_inst (
			.sel(ch3_active),
			.d1(efuz),
			.d0(a1),
			.y(wave_a1)
		);

	dmg_nand2 #(
			.L_y(583.5784)
		) agyn_inst (
			.in1(apu_wr),
			.in2(ff16),
			.y(agyn)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) ahac_inst (
			.in(afut_n),
			.ena_n(sprite_sel8),
			.y(sprite_y_store2)
		);

	dmg_not_x2 #(
			.L_y(3830.579)
		) ahal_inst (
			.in(h3),
			.y(h3_n)
		);

	dmg_not_x2 #(
			.L_y(1732.14)
		) ahoc_inst (
			.in(vram_to_oam),
			.y(ahoc)
		);

	dmg_not_x1 #(
			.L_y(707.3595)
		) ahof_inst (
			.in(buco),
			.y(ahof)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) ahum_inst (
			.in(arof_n),
			.ena_n(sprite_sel1),
			.y(sprite_y_store1)
		);

	dmg_not_x2 #(
			.L_y(692.2183)
		) ahyc_inst (
			.in(cenu),
			.y(ahyc)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) ajal_inst (
			.in(bozu_n),
			.ena_n(sprite_sel0),
			.y(sprite_y_store2)
		);

	dmg_not_if0 #(
			.L_y(4222.375)
		) ajan_inst (
			.in(acul),
			.ena_n(bafy),
			.y(ma4_n)
		);

	dmg_not_x2 #(
			.L_y(186.9998)
		) ajas_inst (
			.in(cpu_rd),
			.y(ajas)
		);

	dmg_nor2 #(
			.L_y(1197.172)
		) ajav_inst (
			.in1(t1t2_n),
			.in2(atov),
			.y(ajav)
		);

	dmg_not_x1 #(
			.L_y(46.75005)
		) ajax_inst (
			.in(atyp),
			.y(ajax)
		);

	dmg_not_if0 #(
			.L_y(38893.62),
			.W_y_p(310)
		) ajec_inst (
			.in(const0),
			.ena_n(afop),
			.y(d2)
		);

	dmg_nand2 #(
			.L_y(136.7971)
		) ajep_inst (
			.in1(mode2),
			.in2(xoce),
			.y(ajep)
		);

	dmg_dffr #(
			.L_q(3637.47),
			.L_q_n(351.9529)
		) ajer_inst (
			.d(ajer_n),
			.clk(apuv),
			.r_n(apu_reset3_n),
			.q(ajer),
			.q_n(ajer_n)
		);

	dmg_not_x1 #(
			.L_y(129.0938)
		) ajoj_inst (
			.in(a0),
			.y(ajoj)
		);

	dmg_and2 #(
			.L_y(711.0779)
		) ajom_inst (
			.in1(ajoj),
			.in2(azac),
			.y(hram_a1_na0_n)
		);

	dmg_and2 #(
			.L_y(298.0313)
		) ajon_inst (
			.in1(mode3),
			.in2(boge),
			.y(ajon)
		);

	dmg_buf_if0 #(
			.L_y(11772.77)
		) ajov_inst (
			.in(abup),
			.ena_n(ext_addr_en_n),
			.y(a5)
		);

	dmg_nor3 #(
			.L_y(160.4371)
		) ajuj_inst (
			.in1(dma_run),
			.in2(mode2),
			.in3(ajon),
			.y(ajuj)
		);

	dmg_and2 #(
			.L_y(155.9221)
		) ajux_inst (
			.in1(deby),
			.in2(byfu),
			.y(ajux)
		);

	dmg_not_x1 #(
			.L_y(115.8125)
		) akaf_inst (
			.in(wave_rd_d7),
			.y(akaf)
		);

	dmg_not_if0 #(
			.L_y(33777.41),
			.W_y_p(310)
		) akaj_inst (
			.in(const0),
			.ena_n(afop),
			.y(d5)
		);

	dmg_buf_if0 #(
			.L_y(12653.05)
		) akan_inst (
			.in(buxu),
			.ena_n(ext_addr_en_n),
			.y(a2)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) akod_inst (
			.in(rvolume0_n),
			.ena_n(adak),
			.y(d0)
		);

	dmg_and2 #(
			.L_y(1671.047)
		) akof_inst (
			.in1(ch4_env0),
			.in2(dato),
			.y(ch4_out[0])
		);

	dmg_not_x1 #(
			.L_y(786.2498)
		) akol_inst (
			.in(buka),
			.y(akol)
		);

	dmg_not_x1 #(
			.L_y(151.9379)
		) akug_inst (
			.in(a6),
			.y(akug)
		);

	dmg_nand2 #(
		) akut_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) akux_inst (
			.in(ff10_d5_n),
			.ena_n(asop),
			.y(d5)
		);

	dmg_tffnl #(
			.L_q_n(447.0467)
		) akyd_inst (
			.d(d5),
			.l(aget),
			.tclk_n(buva),
			.q(),
			.q_n(ch2_len_timer_stop)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) akyh_inst (
			.in(bexy_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a3)
		);

	dmg_drlatch_ee #(
			.L_q(132.0157)
		) alef_inst (
			.d(afur),
			.ena(adeh),
			.ena_n(atal_4mhz),
			.r_n(test_reset_n),
			.q(alef),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) alel_inst (
			.in(bewy),
			.ena_n(bafy),
			.y(ma2_n)
		);

	dmg_not_x3 #(
			.L_y(361.2502)
		) aler_inst (
			.in(atur),
			.y(wave_ram_bl_precharge)
		);

	dmg_not_x1 #(
			.L_y(96.15613)
		) ales_inst (
			.in(vbl),
			.y(ales)
		);

	dmg_not_x2 #(
			.L_y(4013.327)
		) alet_inst (
			.in(ppu_4mhz),
			.y(ppu_4mhz_n)
		);

	dmg_not_x1 #(
			.L_y(40.10943)
		) alop_inst (
			.in(byfe_128hz),
			.y(alop)
		);

	dmg_dlatch #(
			.L_q(770.3123)
		) alor_inst (
			.d(a0),
			.ena(addr_latch),
			.q(alor),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(19612.16)
		) alur_inst (
			.in(avor),
			.y(reset2_n)
		);

	dmg_not_x1 #(
			.L_y(46.48407)
		) alyp_inst (
			.in(osc_stable),
			.y(alyp)
		);

	dmg_dlatch #(
			.L_q(132.8127)
		) alyr_inst (
			.d(a2),
			.ena(addr_latch),
			.q(alyr),
			.q_n()
		);

	dmg_and2 #(
			.L_y(1135.813)
		) amab_inst (
			.in1(fexx),
			.in2(ajuj),
			.y(amab)
		);

	dmg_and2 #(
			.L_y(124.8437)
		) amac_inst (
			.in1(deby),
			.in2(bofu),
			.y(amac)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) amad_inst (
			.in(lvolume0_n),
			.ena_n(adak),
			.y(d4)
		);

	dmg_not_x2 #(
			.L_y(3460.562)
		) amel_inst (
			.in(h2),
			.y(h2_n)
		);

	dmg_mux #(
			.L_y(272.2658)
		) amer_inst (
			.sel(dma_addr_ext),
			.d1(dma_a3),
			.d0(aret),
			.y(amer)
		);

	dmg_dlatch_ee #(
			.L_q_n(127.4999)
		) ames_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y1),
			.ena_n(ahof),
			.q(),
			.q_n(ames_n)
		);

	dmg_mux #(
			.L_y(1318.828)
		) amet_inst (
			.sel(dma_addr_ext),
			.d1(dma_a0),
			.d0(alor),
			.y(amet)
		);

	dmg_and2 #(
			.L_y(1056.391)
		) amop_inst (
			.in1(ch1_env0),
			.in2(boto),
			.y(ch1_out[0])
		);

	dmg_and2 #(
			.L_y(702.313)
		) amov_inst (
			.in1(ch2_env3),
			.in2(bonu),
			.y(ch2_out[3])
		);

	dmg_not_if0 #(
			.L_y(4361.828)
		) amuh_inst (
			.in(md2),
			.ena_n(azar),
			.y(oam_b_d2_n)
		);

	dmg_not_x6 #(
			.L_y(4176.422)
		) amuk_inst (
			.in(atag),
			.y(apu_4mhz)
		);

	dmg_not_x1 #(
			.L_y(1231.171)
		) amun_inst (
			.in(arur),
			.y(amun)
		);

	dmg_nor6 #(
			.L_y(27.89071)
		) amus_inst (
			.in1(a7),
			.in2(a4),
			.in3(a3),
			.in4(a2),
			.in5(a1),
			.in6(a0),
			.y(amus)
		);

	dmg_dffr #(
			.L_q(2303.501)
		) amut_inst (
			.d(d1),
			.clk(aper),
			.r_n(reset2_n),
			.q(ff60_d1),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5085.921)
		) amuv_inst (
			.in(ff40_d3),
			.ena_n(bafy),
			.y(ma10_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) amyd_inst (
			.in(ff10_d0_n),
			.ena_n(asop),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(75.96857)
		) amyg_inst (
			.in(ppu_reset_n),
			.y(amyg)
		);

	dmg_not_x3 #(
			.L_y(446.2498)
		) amyt_inst (
			.in(wave_ram_wr),
			.y(wave_ram_wr_n)
		);

	dmg_and2 #(
			.L_y(816.2664)
		) anan_inst (
			.in1(ch2_env0),
			.in2(bonu),
			.y(ch2_out[0])
		);

	dmg_and2 #(
			.L_y(294.8443)
		) anap_inst (
			.in1(amus),
			.in2(ffxx),
			.y(ff00_ff20_ff40_ff60)
		);

	dmg_buf_if0 #(
			.L_y(13115.5)
		) anar_inst (
			.in(base),
			.ena_n(ext_addr_en_n),
			.y(a3)
		);

	dmg_drlatch_ee #(
			.L_q_n(578.266)
		) anaz_inst (
			.d(d2),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d2_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(69.85971)
		) aned_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y5),
			.ena_n(bucy),
			.q(),
			.q_n(aned_n)
		);

	dmg_dffr #(
			.L_q(146.3596)
		) anel_inst (
			.d(start_oam_parsing),
			.clk(awoh),
			.r_n(abez),
			.q(anel),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(1092.515),
			.L_q_n(107.0468)
		) anev_inst (
			.d(d0),
			.ena(bono),
			.ena_n(acup),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(rmixer0),
			.q_n(anev_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58),
			.W_y_p(310)
		) anoc_inst (
			.in(const0),
			.ena_n(afop),
			.y(d0)
		);

	dmg_nor2 #(
			.L_y(2497.672)
		) anom_inst (
			.in1(atej),
			.in2(atar),
			.y(oam_parse_reset_n)
		);

	dmg_nand2 #(
			.L_y(28.95293)
		) anos_inst (
			.in1(clk_in_n),
			.in2(avet),
			.y(anos)
		);

	dmg_and2 #(
			.L_y(1517.25)
		) anuj_inst (
			.in1(clk_t4),
			.in2(apu_wr),
			.y(nrx4_d6_wr)
		);

	dmg_not_if0 #(
			.L_y(3951.438)
		) anum_inst (
			.in(md7),
			.ena_n(azar),
			.y(oam_b_d7_n)
		);

	dmg_not_x1 #(
			.L_y(679.2035)
		) anyk_inst (
			.in(hram_oe),
			.y(hram_oe_n)
		);

	dmg_and2 #(
			.L_y(104.9218)
		) anyp_inst (
			.in1(ppu_rd),
			.in2(ff42),
			.y(anyp)
		);

	dmg_and2 #(
			.L_y(671.7655)
		) anyv_inst (
			.in1(ch2_env1),
			.in2(bonu),
			.y(ch2_out[1])
		);

	dmg_ao22 #(
			.L_y(116.6096)
		) apag_inst (
			.in1(xupa),
			.in2(amab),
			.in3(ajuj),
			.in4(adah),
			.y(apag)
		);

	dmg_nor2 #(
			.L_y(171.0626)
		) apaj_inst (
			.in1(ajux),
			.in2(apu_reset),
			.y(apaj)
		);

	dmg_not_x1 #(
			.L_y(1937.735)
		) apam_inst (
			.in(vram_to_oam),
			.y(apam)
		);

	dmg_not_x2 #(
			.L_y(2135.359)
		) apar_inst (
			.in(mode2),
			.y(oam_addr_parse_n)
		);

	dmg_not_x1 #(
			.L_y(124.5786)
		) apat_inst (
			.in(acc_d9),
			.y(apat)
		);

	dmg_not_x3 #(
			.L_y(524.8754)
		) apef_inst (
			.in(bylu_n),
			.y(apef)
		);

	dmg_drlatch_ee #(
			.L_q_n(508.1404)
		) apeg_inst (
			.d(d0),
			.ena(bowe),
			.ena_n(ataf),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(rvolume0_n)
		);

	dmg_nand5 #(
			.L_y(524.3439)
		) aper_inst (
			.in1(apet),
			.in2(a5),
			.in3(a6),
			.in4(cpu_wr),
			.in5(ff00_ff20_ff40_ff60),
			.y(aper)
		);

	dmg_or2 #(
			.L_y(561.7972)
		) apet_inst (
			.in1(t1t2_n),
			.in2(t1_nt2),
			.y(apet)
		);

	dmg_dlatch_ee #(
			.L_q_n(132.547)
		) apev_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(apev_n)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) apob_inst (
			.in(bada_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a6)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) apoc_inst (
			.in(byhe_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a2)
		);

	dmg_mux #(
			.L_y(306.5311)
		) apok_inst (
			.sel(dma_addr_ext),
			.d1(dma_a2),
			.d0(alyr),
			.y(apok)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) apon_inst (
			.in(beca_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a4)
		);

	dmg_drlatch_ee #(
			.L_q(1213.641),
			.L_q_n(166.547)
		) apos_inst (
			.d(d3),
			.ena(bowe),
			.ena_n(ataf),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(r_vin_en),
			.q_n(apos_n)
		);

	dmg_not_x3 #(
			.L_y(6961.502)
		) apov_inst (
			.in(arev),
			.y(cpu_wr_sync)
		);

	dmg_not_x2 #(
			.L_y(2364.062)
		) apow_inst (
			.in(abuf),
			.y(hram_oe)
		);

	dmg_dffr #(
			.L_q(122.1873)
		) apug_inst (
			.d(agem),
			.clk(clk_1mhz),
			.r_n(reset2_n),
			.q(apug),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(2342.282)
		) apuh_inst (
			.in(atef),
			.y(hram_wr)
		);

	dmg_drlatch_ee #(
			.L_q(129.6247),
			.L_q_n(70.12488)
		) apuk_inst (
			.d(alef),
			.ena(atal_4mhz),
			.ena_n(adeh),
			.r_n(test_reset_n),
			.q(apuk),
			.q_n(apuk_n)
		);

	dmg_and2 #(
			.L_y(646.5326)
		) apul_inst (
			.in1(a0),
			.in2(a1),
			.y(hram_a1a0)
		);

	dmg_dlatch #(
			.L_q(62.953)
		) apur_inst (
			.d(a1),
			.ena(addr_latch),
			.q(apur),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(141.8439)
		) apuv_inst (
			.in(apu_4mhz),
			.y(apuv)
		);

	dmg_not_x2 #(
			.L_y(4706.079)
		) apux_inst (
			.in(h4),
			.y(h4_n)
		);

	dmg_full_add #(
			.L_cout(504.4222)
		) apyh_inst (
			.a(h2),
			.b(ff43_d2),
			.cin(behu_c),
			.cout(apyh_c),
			.sum()
		);

	dmg_and2 #(
			.L_y(1719.657)
		) apyr_inst (
			.in1(ch4_env2),
			.in2(dato),
			.y(ch4_out[2])
		);

	dmg_nor2 #(
			.L_y(507.344)
		) apys_inst (
			.in1(t1t2_n),
			.in2(adyr),
			.y(apys)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) apyv_inst (
			.in(apev_n),
			.ena_n(sprite_sel8),
			.y(oam_render_a5)
		);

	dmg_not_x2 #(
		) araf_inst (
			.in(vdd),
			.y()
		);

	dmg_not_if0 #(
			.L_y(31397.37),
			.W_y_p(310)
		) arar_inst (
			.in(const0),
			.ena_n(afop),
			.y(d6)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) aras_inst (
			.in(bore),
			.ena_n(abon),
			.y(ma2_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(649.1868)
		) arax_inst (
			.d(d1),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d1_n)
		);

	dmg_nor2 #(
			.L_y(705.5008)
		) ares_inst (
			.in1(ch2_amp_en_n),
			.in2(apu_reset),
			.y(ares)
		);

	dmg_dlatch #(
			.L_q(124.0464)
		) aret_inst (
			.d(a3),
			.ena(addr_latch),
			.q(aret),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(50.46889)
		) arev_inst (
			.in1(afas),
			.in2(write),
			.y(arev)
		);

	dmg_dlatch_ee #(
			.L_q_n(119.2658)
		) arof_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y1),
			.ena_n(ahof),
			.q(),
			.q_n(arof_n)
		);

	dmg_not_x1 #(
			.L_y(3520.062)
		) arop_inst (
			.in(sprite_x_flip),
			.y(sprite_x5_n)
		);

	dmg_and2 #(
			.L_y(2960.125)
		) aror_inst (
			.in1(oam_rendering2),
			.in2(ff40_d1),
			.y(aror)
		);

	dmg_dlatch #(
			.L_q(287.1406)
		) aros_inst (
			.d(a6),
			.ena(addr_latch),
			.q(aros),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(612.0001)
		) arov_inst (
			.in(apuk_n),
			.y(arov)
		);

	dmg_not_x1 #(
			.L_y(40.37491)
		) aruc_inst (
			.in(apu_4mhz),
			.y(aruc)
		);

	dmg_and2 #(
			.L_y(124.047)
		) arur_inst (
			.in1(ff43),
			.in2(ppu_wr),
			.y(arur)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) arux_inst (
			.in(lvolume1_n),
			.ena_n(adak),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(73.84332)
		) aryf_inst (
			.in(apu_4mhz),
			.y(aryf)
		);

	dmg_not_x3 #(
			.L_y(2354.5)
		) aryl_inst (
			.in(ff10_d3_n),
			.y(aryl)
		);

	dmg_dlatch #(
			.L_q(130.422)
		) arym_inst (
			.d(a7),
			.ena(addr_latch),
			.q(arym),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3380.61)
		) aryn_inst (
			.in(md4),
			.ena_n(azar),
			.y(oam_a_d4_n)
		);

	dmg_not_x1 #(
			.L_y(37.7188)
		) arys_inst (
			.in(clk_in_n),
			.y(arys)
		);

	dmg_not_x1 #(
			.L_y(169.2036)
		) asad_inst (
			.in(a6),
			.y(asad)
		);

	dmg_not_x2 #(
			.L_y(3969.5)
		) asah_inst (
			.in(h7),
			.y(h7_n)
		);

	dmg_or3 #(
			.L_y(1170.343)
		) asam_inst (
			.in1(mode2),
			.in2(mode3),
			.in3(dma_run),
			.y(oam_addr_cpu_n)
		);

	dmg_or2 #(
			.L_y(872.0472)
		) asen_inst (
			.in1(atar),
			.in2(stop_oam_parsing),
			.y(asen)
		);

	dmg_and2 #(
			.L_y(682.3907)
		) asog_inst (
			.in1(ch2_env2),
			.in2(bonu),
			.y(ch2_out[2])
		);

	dmg_and2 #(
			.L_y(2273.219)
		) asok_inst (
			.in1(apug),
			.in2(batu),
			.y(int_jp)
		);

	dmg_nor_latch #(
			.L_q_n(137.3281)
		) asol_inst (
			.s(afar),
			.r(reset),
			.q(),
			.q_n(asol_n)
		);

	dmg_and2 #(
			.L_y(1090.125)
		) ason_inst (
			.in1(ch1_env1),
			.in2(boto),
			.y(ch1_out[1])
		);

	dmg_not_x2 #(
			.L_y(589.1553)
		) asop_inst (
			.in(atyn),
			.y(asop)
		);

	dmg_not_x4 #(
			.L_y(7496.47)
		) asot_inst (
			.in(ajas),
			.y(ppu_rd)
		);

	dmg_not_if0 #(
			.L_y(2654.923)
		) asox_inst (
			.in(md2),
			.ena_n(azar),
			.y(oam_a_d2_n)
		);

	dmg_and2 #(
			.L_y(282.0938)
		) asul_inst (
			.in1(axad),
			.in2(bp_cy),
			.y(asul)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) asum_inst (
			.in(bp_sel),
			.ena_n(beje),
			.y(ma0_n)
		);

	dmg_mux #(
			.L_y(586.7657)
		) asur_inst (
			.sel(dma_addr_ext),
			.d1(dma_a7),
			.d0(arym),
			.y(asur)
		);

	dmg_not_if0 #(
			.L_y(33977.16),
			.W_y_p(310)
		) asuz_inst (
			.in(const0),
			.ena_n(afop),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(106.7814)
		) asyp_inst (
			.in(agyn),
			.y(asyp)
		);

	dmg_not_x1 #(
			.L_y(1068.078)
		) asys_inst (
			.in(buco),
			.y(asys)
		);

	dmg_and3 #(
			.L_y(141.5782)
		) asyt_inst (
			.in1(ajep),
			.in2(xuja),
			.in3(cpu_oam_rd_n),
			.y(asyt)
		);

	dmg_half_add #(
			.L_cout(141.8441)
		) atad_inst (
			.a(h0),
			.b(ff43_d0),
			.cout(atad_c),
			.sum()
		);

	dmg_not_x2 #(
			.L_y(470.6871)
		) ataf_inst (
			.in(bowe),
			.y(ataf)
		);

	dmg_not_x1 #(
			.L_y(336.0155)
		) atag_inst (
			.in(azof),
			.y(atag)
		);

	dmg_not_if0 #(
			.L_y(35163.97),
			.W_y_p(310)
		) ataj_inst (
			.in(const0),
			.ena_n(afop),
			.y(d1)
		);

	dmg_not_x2 #(
			.L_y(485.0308)
		) atal_inst (
			.in(avet),
			.y(atal_4mhz)
		);

	dmg_not_x1 #(
			.L_y(296.7031)
		) atar_inst (
			.in(ppu_reset_n),
			.y(atar)
		);

	dmg_nor2 #(
			.L_y(240.9217)
		) atat_inst (
			.in1(apu_reset),
			.in2(bexa),
			.y(atat)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) atax_inst (
			.in(ff10_d1_n),
			.ena_n(asop),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(134.6717)
		) atec_inst (
			.in(wave_rd_d2),
			.y(atec)
		);

	dmg_nand2 #(
			.L_y(32.40649)
		) atef_inst (
			.in1(hram_wldrv_ena),
			.in2(cpu_wr),
			.y(atef)
		);

	dmg_or4 #(
			.L_y(125.6405)
		) ateg_inst (
			.in1(atup),
			.in2(a5),
			.in3(a6),
			.in4(a7),
			.y(ateg)
		);

	dmg_not_x2 #(
			.L_y(2015.032)
		) atej_inst (
			.in(byha),
			.y(atej)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) atel_inst (
			.in(befa),
			.ena_n(bagu),
			.y(d0)
		);

	dmg_mux #(
			.L_y(338.406)
		) atem_inst (
			.sel(dma_addr_ext),
			.d1(dma_a4),
			.d0(avys),
			.y(atem)
		);

	dmg_dffr #(
			.L_q(184.0777),
			.L_q_n(78.3596)
		) atep_inst (
			.d(atep_n),
			.clk(azeg),
			.r_n(buwe),
			.q(atep),
			.q_n(atep_n)
		);

	dmg_not_if0 #(
			.L_y(3733.094)
		) ater_inst (
			.in(md7),
			.ena_n(azar),
			.y(oam_a_d7_n)
		);

	dmg_dlatch #(
			.L_q(149.0158)
		) atev_inst (
			.d(a5),
			.ena(addr_latch),
			.q(atev),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(128.0309)
		) atez_inst (
			.in(osc_ena),
			.y(atez)
		);

	dmg_not_x3 #(
			.L_y(251.5467)
		) atok_inst (
			.in(beno),
			.y(wave_ram_rd_n)
		);

	dmg_mux #(
			.L_y(503.8909)
		) atol_inst (
			.sel(dma_addr_ext),
			.d1(dma_a1),
			.d0(apur),
			.y(atol)
		);

	dmg_mux #(
			.L_y(908.438)
		) atov_inst (
			.sel(dma_addr_ext),
			.d1(dma_a5),
			.d0(atev),
			.y(atov)
		);

	dmg_nand4 #(
			.L_y(2996.782)
		) atoz_inst (
			.in1(byko),
			.in2(akug),
			.in3(cpu_wr),
			.in4(ff00_ff20_ff40_ff60),
			.y(ff00wr_n)
		);

	dmg_drlatch_ee #(
			.L_q(1290.406),
			.L_q_n(123.7809)
		) atuf_inst (
			.d(d3),
			.ena(bono),
			.ena_n(acup),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(rmixer3),
			.q_n(atuf_n)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) atum_inst (
			.in(bedu_n),
			.ena_n(adak),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(173.9836)
		) atup_inst (
			.in(a4),
			.y(atup)
		);

	dmg_mux #(
			.L_y(102.797)
		) atur_inst (
			.sel(ch3_active),
			.d1(boru),
			.d0(buku),
			.y(atur)
		);

	dmg_not_x1 #(
			.L_y(571.0942)
		) atus_inst (
			.in(apu_reset),
			.y(atus)
		);

	dmg_and2 #(
			.L_y(120.063)
		) atuv_inst (
			.in1(bexa),
			.in2(ch1_sum_ovfl_n),
			.y(atuv)
		);

	dmg_dffr #(
			.L_q_n(239.8593)
		) atyk_inst (
			.d(atyk_n),
			.clk(aryf),
			.r_n(bopo),
			.q(),
			.q_n(atyk_n)
		);

	dmg_nor2 #(
			.L_y(73.57824)
		) atyn_inst (
			.in1(apu_rd_n),
			.in2(buze),
			.y(atyn)
		);

	dmg_not_x1 #(
			.L_y(730.4692)
		) atyp_inst (
			.in(afur_n),
			.y(atyp)
		);

	dmg_mux #(
			.L_y(1209.391)
		) atyr_inst (
			.sel(dma_addr_ext),
			.d1(dma_a6),
			.d0(aros),
			.y(atyr)
		);

	dmg_or2 #(
			.L_y(762.3437)
		) atys_inst (
			.in1(byle),
			.in2(aryl),
			.y(ch1_sum_ovfl_n)
		);

	dmg_not_x1 #(
			.L_y(444.6574)
		) atyv_inst (
			.in(apu_reset),
			.y(apu_reset3_n)
		);

	tri logic [2:0] audio_port_rvolume_n;
	assign audio_port_rvolume_n[0] = rvolume0_n;
	assign audio_port_rvolume_n[1] = rvolume1_n;
	assign audio_port_rvolume_n[2] = rvolume2_n;
	tri logic [2:0] audio_port_lvolume_n;
	assign audio_port_lvolume_n[0] = lvolume0_n;
	assign audio_port_lvolume_n[1] = lvolume1_n;
	assign audio_port_lvolume_n[2] = lvolume2_n;
	dmg_audio #(
			.L_rout(2543.891),
			.L_lout(2538.313)
		) audio_inst (
			.ena(amp_en),
			.ena_n(amp_en_n),
			.ch1_ena_n(ch1_amp_en_n),
			.ch2_ena_n(ch2_amp_en_n),
			.ch3_ena_n(ch3_amp_en_n),
			.ch4_ena_n(ch4_amp_en_n),
			.r_vin_ena(r_vin_en),
			.rmixer0(rmixer0),
			.rmixer1(rmixer1),
			.rmixer2(rmixer2),
			.rmixer3(rmixer3),
			.l_vin_ena(l_vin_en),
			.lmixer0(lmixer0),
			.lmixer1(lmixer1),
			.lmixer2(lmixer2),
			.lmixer3(lmixer3),
			.rout(so1),
			.lout(so2),
			.vin(vin),
			.ch1(ch1_out),
			.ch2(ch2_out),
			.ch3(ch3_out),
			.ch4(ch4_out),
			.rvolume_n(audio_port_rvolume_n),
			.lvolume_n(audio_port_lvolume_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(450.2343)
		) avaf_inst (
			.d(d3),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d3_n)
		);

	dmg_not_x2 #(
			.L_y(2900.891)
		) avap_inst (
			.in(bebu),
			.y(stop_oam_parsing)
		);

	dmg_not_if0 #(
			.L_y(4158.359)
		) aveb_inst (
			.in(md1),
			.ena_n(azar),
			.y(oam_b_d1_n)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) avek_inst (
			.in(ff10_d4_n),
			.ena_n(asop),
			.y(d4)
		);

	dmg_nand2 #(
			.L_y(177.1716)
		) aver_inst (
			.in1(mode2),
			.in2(xyso),
			.y(aver)
		);

	dmg_nand2 #(
			.L_y(71.98455)
		) avet_inst (
			.in1(anos),
			.in2(arys),
			.y(avet)
		);

	dmg_and2 #(
			.L_y(109.4372)
		) avog_inst (
			.in1(ff43),
			.in2(ppu_rd),
			.y(avog)
		);

	dmg_dffr #(
			.L_q(210.6404),
			.L_q_n(164.1561)
		) avok_inst (
			.d(avok_n),
			.clk(atyk_n),
			.r_n(bopo),
			.q(avok),
			.q_n(avok_n)
		);

	dmg_or2 #(
			.L_y(52.06248)
		) avor_inst (
			.in1(cpu_sys_reset),
			.in2(asol_n),
			.y(avor)
		);

	dmg_not_x1 #(
			.L_y(511.3279)
		) avoz_inst (
			.in(akol),
			.y(save_sprite_num8)
		);

	dmg_and2 #(
			.L_y(667.5158)
		) avub_inst (
			.in1(ajoj),
			.in2(a1),
			.y(hram_a1a0_n)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) avud_inst (
			.in(rvolume2_n),
			.ena_n(adak),
			.y(d2)
		);

	dmg_nor2 #(
			.L_y(128.8283)
		) avuf_inst (
			.in1(apu_reset),
			.in2(afyr),
			.y(avuf)
		);

	dmg_not_x1 #(
			.L_y(151.406)
		) avun_inst (
			.in(a7),
			.y(avun)
		);

	dmg_dlatch #(
			.L_q(229.2339)
		) avys_inst (
			.d(a4),
			.ena(addr_latch),
			.q(avys),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) awat_inst (
			.in(aned_n),
			.ena_n(sprite_sel5),
			.y(sprite_y_store3)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) awed_inst (
			.in(rvolume1_n),
			.ena_n(adak),
			.y(d1)
		);

	dmg_or4 #(
			.L_y(206.1253)
		) awet_inst (
			.in1(a4),
			.in2(boxy),
			.in3(a6),
			.in4(a7),
			.y(awet)
		);

	dmg_dlatch #(
			.L_q(4575.127)
		) awob_inst (
			.d(kery),
			.ena(clk_1mhz),
			.q(cpu_wakeup),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(50.46869)
		) awod_inst (
			.in1(t1t2_n),
			.in2(agut),
			.y(awod)
		);

	dmg_not_x1 #(
			.L_y(116.6089)
		) awoh_inst (
			.in(xupy),
			.y(awoh)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) awos_inst (
			.in(ff10_d6_n),
			.ena_n(asop),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(177.4373)
		) axad_inst (
			.in(in_window),
			.y(axad)
		);

	dmg_dffsr #(
			.L_q(1019.734)
		) axan_inst (
			.d(sum10),
			.clk(ch1_freq_upd1),
			.s_n(afeg),
			.r_n(apaj),
			.q(acc_d10),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) axec_inst (
			.in(boxa_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a7)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) axem_inst (
			.in(apos_n),
			.ena_n(adak),
			.y(d3)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) axep_inst (
			.in(babe),
			.ena_n(bafy),
			.y(ma0_n)
		);

	dmg_not_if0 #(
			.L_y(2693.172)
		) axer_inst (
			.in(md1),
			.ena_n(azar),
			.y(oam_a_d1_n)
		);

	dmg_mux #(
			.L_y(583.3125)
		) axol_inst (
			.sel(ch3_active),
			.d1(efal),
			.d0(a3),
			.y(wave_a3)
		);

	dmg_dlatch_ee #(
			.L_q_n(126.7026)
		) axuv_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(axuv_n)
		);

	dmg_and2 #(
			.L_y(689.2968)
		) axyc_inst (
			.in1(azac),
			.in2(a0),
			.y(hram_a1_na0)
		);

	dmg_not_x1 #(
			.L_y(630.5938)
		) axyn_inst (
			.in(exec_phase),
			.y(axyn)
		);

	dmg_not_x1 #(
			.L_y(82.87527)
		) azac_inst (
			.in(a1),
			.y(azac)
		);

	dmg_dlatch_ee #(
			.L_q_n(117.6715)
		) azap_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y8),
			.ena_n(bymy),
			.q(),
			.q_n(azap_n)
		);

	dmg_not_x2 #(
			.L_y(2476.422)
		) azar_inst (
			.in(vram_to_oam),
			.y(azar)
		);

	dmg_not_x1 #(
			.L_y(107.8436)
		) azeg_inst (
			.in(apu_4mhz),
			.y(azeg)
		);

	dmg_and2 #(
			.L_y(170.7967)
		) azem_inst (
			.in1(byjo),
			.in2(mode3),
			.y(oam_rendering2)
		);

	dmg_dffr #(
			.L_q(184.344)
		) azet_inst (
			.d(azus),
			.clk(aruc),
			.r_n(bama),
			.q(azet),
			.q_n()
		);

	dmg_not_x6 #(
			.L_y(4521.47)
		) azof_inst (
			.in(atal_4mhz),
			.y(azof)
		);

	dmg_not_x1 #(
			.L_y(125.6405)
		) azor_inst (
			.in(beta),
			.y(azor)
		);

	dmg_not_if0 #(
			.L_y(4506.33)
		) azoz_inst (
			.in(md4),
			.ena_n(azar),
			.y(oam_b_d4_n)
		);

	dmg_not_x2 #(
			.L_y(4121.969)
		) azub_inst (
			.in(h1),
			.y(h1_n)
		);

	dmg_nor3 #(
			.L_y(26.03114)
		) azug_inst (
			.in1(pch_phase_n),
			.in2(hram_wr),
			.in3(hram_oe),
			.y(azug)
		);

	dmg_not_x2 #(
			.L_y(2599.672)
		) azul_inst (
			.in(apag),
			.y(azul)
		);

	dmg_not_x2 #(
		) azup_inst (
			.in(vdd),
			.y()
		);

	dmg_dffr #(
			.L_q(335.4841),
			.L_q_n(211.9688)
		) azus_inst (
			.d(bano),
			.clk(apu_4mhz),
			.r_n(bama),
			.q(azus),
			.q_n(azus_n)
		);

	dmg_buf_if0 #(
			.L_y(12300.83)
		) azuv_inst (
			.in(afec),
			.ena_n(ext_addr_en_n),
			.y(a4)
		);

	dmg_not_x1 #(
			.L_y(1162.906)
		) azyb_inst (
			.in(atej),
			.y(azyb)
		);

	dmg_nand2 #(
		) azym_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) azyp_inst (
			.in(ff10_d2_n),
			.ena_n(asop),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(512.1249)
		) baba_inst (
			.in(ewot),
			.y(save_sprite_y4)
		);

	dmg_full_add #(
			.L_cout(440.4059),
			.L_sum(191.2501)
		) babe_inst (
			.a(h3),
			.b(ff43_d3),
			.cin(apyh_c),
			.cout(babe_c),
			.sum(babe)
		);

	dmg_not_x1 #(
			.L_y(84.46916)
		) baca_inst (
			.in(wave_rd_d4),
			.y(baca)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) bace_inst (
			.in(acep_n),
			.ena_n(sprite_sel5),
			.y(sprite_y_store0)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) baco_inst (
			.in(abop_n),
			.ena_n(sprite_sel1),
			.y(sprite_y_store2)
		);

	dmg_and2 #(
			.L_y(247.8286)
		) bacu_inst (
			.in1(apu_wr),
			.in2(ff16),
			.y(bacu)
		);

	dmg_tffnl #(
			.L_q(159.1095)
		) bacy_inst (
			.d(d0),
			.l(bugy),
			.tclk_n(canu),
			.q(bacy),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(146.0936)
		) bada_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(bada_n)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) bade_inst (
			.in(adok),
			.ena(wave_ram_rd),
			.y(d3)
		);

	dmg_dlatch_ee #(
			.L_q_n(150.6091)
		) bado_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(bado_n)
		);

	dmg_nand2 #(
			.L_y(1006.985)
		) badu_inst (
			.in1(atov),
			.in2(ext_addr_en_n),
			.y(badu)
		);

	dmg_not_x1 #(
			.L_y(3582.75)
		) bady_inst (
			.in(sprite_priority),
			.y(sprite_x7_n)
		);

	dmg_drlatch_ee #(
			.L_q(1475.813),
			.L_q_n(92.17191)
		) bafo_inst (
			.d(d2),
			.ena(bono),
			.ena_n(acup),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(rmixer2),
			.q_n(bafo_n)
		);

	dmg_not_x1 #(
			.L_y(58.17154)
		) bafu_inst (
			.in(cpu_wr),
			.y(bafu)
		);

	dmg_not_x2 #(
			.L_y(2068.953)
		) bafy_inst (
			.in(acen),
			.y(bafy)
		);

	dmg_nand2 #(
			.L_y(107.5786)
		) bage_inst (
			.in1(nrx4_d6_wr),
			.in2(ff14),
			.y(bage)
		);

	dmg_nand2 #(
			.L_y(133.8756)
		) bagu_inst (
			.in1(ff23),
			.in2(como),
			.y(bagu)
		);

	dmg_not_x1 #(
			.L_y(475.7343)
		) bagy_inst (
			.in(balu),
			.y(bagy)
		);

	dmg_xor #(
			.L_y(64.81256)
		) bahu_inst (
			.in1(cusy),
			.in2(h7_n),
			.y(bahu)
		);

	dmg_not_x1 #(
			.L_y(90.31233)
		) baja_inst (
			.in(wave_data_latch),
			.y(baja)
		);

	dmg_nor2 #(
			.L_y(3005.282)
		) bajo_inst (
			.in1(t1t2_n),
			.in2(apok),
			.y(bajo)
		);

	dmg_drlatch_ee #(
			.L_q(236.4063),
			.L_q_n(87.12517)
		) bake_inst (
			.d(d7),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d7),
			.q_n(bake_n)
		);

	dmg_not_x1 #(
			.L_y(385.9525)
		) bako_inst (
			.in(ffxx),
			.y(ffxx_n)
		);

	dmg_and2 #(
			.L_y(87.39065)
		) baky_inst (
			.in1(cuxy),
			.in2(dybe),
			.y(baky)
		);

	dmg_not_x1 #(
			.L_y(426.0621)
		) bala_inst (
			.in(byvy),
			.y(bala)
		);

	dmg_nand2 #(
			.L_y(63.21888)
		) bale_inst (
			.in1(ff14),
			.in2(buda),
			.y(bale)
		);

	dmg_not_x1 #(
			.L_y(85.26559)
		) balu_inst (
			.in(oam_parse_reset_n),
			.y(balu)
		);

	dmg_not_x1 #(
			.L_y(717.7191)
		) baly_inst (
			.in(byju),
			.y(baly)
		);

	dmg_not_x1 #(
			.L_y(549.5778)
		) bama_inst (
			.in(apu_reset),
			.y(bama)
		);

	dmg_not_x1 #(
			.L_y(49.67215)
		) bamu_inst (
			.in(bage),
			.y(bamu)
		);

	dmg_drlatch_ee #(
			.L_q(280.234),
			.L_q_n(323.5311)
		) bamy_inst (
			.d(d7),
			.ena(bacu),
			.ena_n(budu),
			.r_n(apu_reset2_n),
			.q(ff16_d7),
			.q_n(ff16_d7_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(571.0938)
		) bana_inst (
			.d(d5),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d5_n)
		);

	dmg_not_x1 #(
			.L_y(167.078)
		) bane_inst (
			.in(beja),
			.y(bane)
		);

	dmg_dffr #(
			.L_q(164.9531)
		) bano_inst (
			.d(busa),
			.clk(cozy),
			.r_n(bama),
			.q(bano),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(2123.937)
		) banu_inst (
			.in(buno),
			.y(ff1x_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(868.0624)
		) bany_inst (
			.d(d0),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d0_n)
		);

	dmg_not_if0 #(
			.L_y(3951.438)
		) bape_inst (
			.in(syzo),
			.ena_n(cede),
			.y(oam_b_d7_n)
		);

	dmg_and2 #(
			.L_y(134.1407)
		) bapu_inst (
			.in1(kedo),
			.in2(cyky),
			.y(bapu)
		);

	dmg_nor3 #(
			.L_y(60.56247)
		) bapy_inst (
			.in1(clk_ena_n),
			.in2(arov),
			.in3(atyp),
			.y(bapy)
		);

	dmg_dffr #(
			.L_q_n(184.8748)
		) bara_inst (
			.d(\512hz ),
			.clk(coke),
			.r_n(atus),
			.q(),
			.q_n(bara_n)
		);

	dmg_nand2 #(
			.L_y(419.1566)
		) bare_inst (
			.in1(ff23),
			.in2(bylo),
			.y(bare)
		);

	dmg_nor2 #(
			.L_y(378.7813)
		) baro_inst (
			.in1(acom),
			.in2(ffxx_n),
			.y(ff3x)
		);

	dmg_not_x1 #(
			.L_y(733.9219)
		) baru_inst (
			.in(bule),
			.y(baru)
		);

	dmg_and2 #(
			.L_y(3064.25)
		) bary_inst (
			.in1(ch3_active),
			.in2(ezag),
			.y(ch3_out[0])
		);

	dmg_not_if0 #(
			.L_y(2654.923)
		) basa_inst (
			.in(sera),
			.ena_n(cede),
			.y(oam_a_d2_n)
		);

	dmg_not_x1 #(
			.L_y(660.6096)
		) base_inst (
			.in(a3_in_n),
			.y(base)
		);

	dmg_and2 #(
			.L_y(148.4839)
		) baso_inst (
			.in1(deby),
			.in2(bysu),
			.y(baso)
		);

	dmg_not_x1 #(
			.L_y(78.09392)
		) basu_inst (
			.in(bate),
			.y(basu)
		);

	dmg_not_if0 #(
			.L_y(4592.656)
		) basy_inst (
			.in(tube),
			.ena_n(cede),
			.y(oam_b_d6_n)
		);

	dmg_not_x1 #(
			.L_y(87.92181)
		) bata_inst (
			.in(ajer),
			.y(bata)
		);

	dmg_nor3 #(
			.L_y(64.2812)
		) bate_inst (
			.in1(bugo),
			.in2(arov),
			.in3(clk_ena_n),
			.y(bate)
		);

	dmg_dffr #(
			.L_q(505.2195)
		) batu_inst (
			.d(kery),
			.clk(clk_1mhz),
			.r_n(reset2_n),
			.q(batu),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) baty_inst (
			.in(atec),
			.ena(wave_ram_rd),
			.y(d2)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) bava_inst (
			.in(bero),
			.ena(wave_ram_rd),
			.y(d5)
		);

	dmg_and3 #(
			.L_y(146.6247)
		) bave_inst (
			.in1(ff10_d6_n),
			.in2(ff10_d5_n),
			.in3(ff10_d4_n),
			.y(bave)
		);

	dmg_not_x1 #(
			.L_y(1923.656)
		) bavu_inst (
			.in(avok),
			.y(ch4_1mhz)
		);

	dmg_not_x6 #(
			.L_y(4657.472),
			.W_y(350)
		) bavy_inst (
			.in(data_phase),
			.y(data_phase_n)
		);

	dmg_not_x1 #(
			.L_y(130.422)
		) bawa_inst (
			.in(abel),
			.y(bawa)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) baxe_inst (
			.in(cyvu),
			.ena_n(abon),
			.y(ma1_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(1557.094)
		) baxo_inst (
			.d(cyra),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(sprite_x_flip)
		);

	dmg_not_if0 #(
			.L_y(3380.61)
		) baxu_inst (
			.in(sysa),
			.ena_n(cede),
			.y(oam_a_d4_n)
		);

	dmg_not_x2 #(
			.L_y(643.61)
		) baxy_inst (
			.in(bosu),
			.y(baxy)
		);

	dmg_dffr #(
			.L_q(633.5159)
		) baza_inst (
			.d(bowy),
			.clk(ajer_n),
			.r_n(apu_reset3_n),
			.q(baza),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(131.4842)
		) baze_inst (
			.in(belo),
			.y(baze)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) bazu_inst (
			.in(afyx_n),
			.ena_n(sprite_sel8),
			.y(sprite_y_store1)
		);

	dmg_xor #(
			.L_y(64.54688)
		) bazy_inst (
			.in1(cywe),
			.in2(h4_n),
			.y(bazy)
		);

	dmg_not_x1 #(
			.L_y(1071.797)
		) beba_inst (
			.in(avog),
			.y(beba)
		);

	dmg_or3 #(
			.L_y(255.5309)
		) bebu_inst (
			.in1(doba),
			.in2(balu),
			.in3(byba_n),
			.y(bebu)
		);

	dmg_dlatch_ee #(
			.L_q_n(118.7342)
		) beca_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(beca_n)
		);

	dmg_not_x3 #(
			.L_y(1018.672)
		) becy_inst (
			.in(cybe),
			.y(becy)
		);

	dmg_not_if0 #(
			.L_y(31524.23),
			.W_y_p(310)
		) beda_inst (
			.in(const0),
			.ena_n(afop),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(1098.094)
		) bede_inst (
			.in(cado),
			.y(bede)
		);

	dmg_not_x6 #(
			.L_y(10232.94)
		) bedo_inst (
			.in(byxo),
			.y(exec_phase)
		);

	dmg_drlatch_ee #(
			.L_q(823.1717),
			.L_q_n(202.4065)
		) bedu_inst (
			.d(d7),
			.ena(baxy),
			.ena_n(bubu),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(l_vin_en),
			.q_n(bedu_n)
		);

	dmg_and2 #(
			.L_y(191.5156)
		) bedy_inst (
			.in1(ppu_wr),
			.in2(ff42),
			.y(bedy)
		);

	dmg_not_x1 #(
			.L_y(160.7028)
		) befa_inst (
			.in(noise_counter_clk),
			.y(befa)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) befe_inst (
			.in(abug_n),
			.ena_n(sprite_sel1),
			.y(sprite_y_store3)
		);

	dmg_drlatch_ee #(
			.L_q(810.9535),
			.L_q_n(201.3442)
		) befo_inst (
			.d(d6),
			.ena(byfa),
			.ena_n(acyj),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(lmixer2),
			.q_n(befo_n)
		);

	dmg_nor2 #(
			.L_y(1620.578)
		) befu_inst (
			.in1(apu_rd_n),
			.in2(byma),
			.y(befu)
		);

	dmg_nand2 #(
			.L_y(483.1719)
		) bege_inst (
			.in1(acc_d8),
			.in2(kedo),
			.y(bege)
		);

	dmg_dffr #(
			.L_q(182.7497),
			.L_q_n(270.6717)
		) bego_inst (
			.d(bego_n),
			.clk(cuxy_n),
			.r_n(azyb),
			.q(bego),
			.q_n(bego_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(196.8284)
		) begu_inst (
			.d(wave_rd_d3),
			.ena(wave_data_latch),
			.ena_n(coju),
			.r_n(acor),
			.q(),
			.q_n(begu_n)
		);

	dmg_not_x2 #(
		) begy_inst (
			.in(bane),
			.y()
		);

	dmg_full_add #(
			.L_cout(409.5933)
		) behu_inst (
			.a(h1),
			.b(ff43_d1),
			.cin(atad_c),
			.cout(behu_c),
			.sum()
		);

	dmg_not_x2 #(
		) behy_inst (
			.in(bane),
			.y()
		);

	dmg_nand4 #(
			.L_y(69.32814)
		) beja_inst (
			.in1(clk_t4_n),
			.in2(clk_t4_n),
			.in3(data_phase_n),
			.in4(data_phase_n),
			.y(beja)
		);

	dmg_not_x1 #(
			.L_y(1223.734)
		) beje_inst (
			.in(asul),
			.y(beje)
		);

	dmg_nand2 #(
			.L_y(244.6408)
		) beju_inst (
			.in1(acc_d10),
			.in2(kedo),
			.y(beju)
		);

	dmg_not_x1 #(
			.L_y(463.5157)
		) bejy_inst (
			.in(bucy),
			.y(save_sprite_y5)
		);

	dmg_not_x1 #(
			.L_y(153.2653)
		) beka_inst (
			.in(wave_data_latch),
			.y(beka)
		);

	dmg_not_x1 #(
			.L_y(405.6095)
		) beke_inst (
			.in(buzy),
			.y(save_sprite_num2)
		);

	dmg_not_x4 #(
			.L_y(4657.472),
			.W_y(350)
		) beko_inst (
			.in(data_phase),
			.y(data_phase_n)
		);

	dmg_dffsr #(
			.L_q(433.2347)
		) beku_inst (
			.d(const0),
			.clk(becy),
			.s_n(beju),
			.r_n(avuf),
			.q(beku),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(193.3753)
		) bela_inst (
			.in(apu_reset),
			.y(bela)
		);

	dmg_not_x1 #(
			.L_y(82.87527)
		) bele_inst (
			.in(buto),
			.y(bele)
		);

	dmg_not_x1 #(
			.L_y(128.2969)
		) belo_inst (
			.in(bane),
			.y(belo)
		);

	dmg_nor2 #(
			.L_y(54.98447)
		) belu_inst (
			.in1(atyp),
			.in2(clk_ena_n),
			.y(belu)
		);

	dmg_and2 #(
			.L_y(2755.329)
		) bely_inst (
			.in1(ch3_active),
			.in2(dore),
			.y(ch3_out[3])
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) bemo_inst (
			.in(cajy_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a7)
		);

	dmg_drlatch_ee #(
			.L_q(571.8909),
			.L_q_n(69.06287)
		) bemy_inst (
			.d(d4),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d4),
			.q_n(bemy_n)
		);

	dmg_nand2 #(
			.L_y(532.5781)
		) bena_inst (
			.in1(boke),
			.in2(ff3x),
			.y(bena)
		);

	dmg_mux #(
			.L_y(160.1718)
		) beno_inst (
			.sel(ch3_active),
			.d1(wave_data_latch),
			.d0(wave_ram_rd),
			.y(beno)
		);

	dmg_not_if0 #(
			.L_y(33882.07),
			.W_y_p(310)
		) benu_inst (
			.in(const0),
			.ena_n(afop),
			.y(d4)
		);

	dmg_nor3 #(
			.L_y(264.2966)
		) beny_inst (
			.in1(asyp),
			.in2(apu_reset),
			.in3(ch2_restart),
			.y(beny)
		);

	dmg_drlatch_ee #(
			.L_q_n(237.4686)
		) bepa_inst (
			.d(wave_rd_d7),
			.ena(wave_data_latch),
			.ena_n(coju),
			.r_n(acor),
			.q(),
			.q_n(bepa_n)
		);

	dmg_not_x1 #(
			.L_y(679.7338)
		) bepe_inst (
			.in(boro),
			.y(bepe)
		);

	dmg_drlatch_ee #(
			.L_q(812.8118),
			.L_q_n(310.2498)
		) bepu_inst (
			.d(d7),
			.ena(byfa),
			.ena_n(acyj),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(lmixer3),
			.q_n(bepu_n)
		);

	dmg_drlatch_ee #(
			.L_q(320.6098),
			.L_q_n(440.6722)
		) bera_inst (
			.d(d6),
			.ena(bacu),
			.ena_n(budu),
			.r_n(apu_reset2_n),
			.q(ff16_d6),
			.q_n(ff16_d6_n)
		);

	dmg_not_x1 #(
			.L_y(78.62477)
		) bero_inst (
			.in(wave_rd_d5),
			.y(bero)
		);

	dmg_not_x2 #(
			.L_y(195.5003)
		) beru_inst (
			.in(bapy),
			.y(beru)
		);

	dmg_or4 #(
			.L_y(250.7498)
		) bery_inst (
			.in1(bone),
			.in2(apu_reset),
			.in3(cyfa),
			.in4(ch1_amp_en_n),
			.y(ch1_stop)
		);

	dmg_dffr #(
			.L_q(297.5001),
			.L_q_n(189.6562)
		) bese_inst (
			.d(bese_n),
			.clk(cake),
			.r_n(azyb),
			.q(bese),
			.q_n(bese_n)
		);

	dmg_nand2 #(
			.L_y(223.1252)
		) beso_inst (
			.in1(acc_d9),
			.in2(kedo),
			.y(beso)
		);

	dmg_nor_latch #(
			.L_q(785.7189)
		) besu_inst (
			.s(start_oam_parsing),
			.r(asen),
			.q(oam_parsing),
			.q_n()
		);

	dmg_or3 #(
			.L_y(329.1095)
		) beta_inst (
			.in1(wave_ram_wr),
			.in2(wave_ram_rd),
			.in3(bory),
			.y(beta)
		);

	dmg_not_x1 #(
			.L_y(2317.047)
		) bete_inst (
			.in(ajon),
			.y(oam_addr_render_n)
		);

	dmg_not_if0 #(
			.L_y(4361.828)
		) betu_inst (
			.in(sera),
			.ena_n(cede),
			.y(oam_b_d2_n)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) bety_inst (
			.in(coma_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a5)
		);

	dmg_not_x6 #(
			.L_y(11854.05),
			.W_y(350)
		) beva_inst (
			.in(byry),
			.y(data_phase)
		);

	dmg_nor2 #(
			.L_y(2455.438)
		) bevo_inst (
			.in1(t1t2_n),
			.in2(atem),
			.y(bevo)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) bevy_inst (
			.in(caju_n),
			.ena_n(sprite_sel4),
			.y(sprite_y_store1)
		);

	dmg_nor2 #(
			.L_y(560.4689)
		) bewo_inst (
			.in1(apu_reset),
			.in2(bapu),
			.y(bewo)
		);

	dmg_full_add #(
			.L_cout(162.5624),
			.L_sum(100.4064)
		) bewy_inst (
			.a(h5),
			.b(ff43_d5),
			.cin(abod_c),
			.cout(bewy_c),
			.sum(bewy)
		);

	dmg_dffr #(
			.L_q(2092.329)
		) bexa_inst (
			.d(coze),
			.clk(ajer),
			.r_n(bury),
			.q(bexa),
			.q_n()
		);

	dmg_not_x2 #(
		) bexe_inst (
			.in(bane),
			.y()
		);

	dmg_nand2 #(
			.L_y(189.3906)
		) bexu_inst (
			.in1(buwa),
			.in2(ff11),
			.y(bexu)
		);

	dmg_dlatch_ee #(
			.L_q_n(141.3125)
		) bexy_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(bexy_n)
		);

	dmg_mux #(
			.L_y(182.2188)
		) beze_inst (
			.sel(ff26_d4),
			.d1(hama_512khz),
			.d0(culo),
			.y(beze)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) bezu_inst (
			.in(akaf),
			.ena(wave_ram_rd),
			.y(d7)
		);

	dmg_or2 #(
			.L_y(766.8604)
		) bezy_inst (
			.in1(awet),
			.in2(ffxx_n),
			.y(ff2x_n)
		);

	dmg_xor #(
			.L_y(82.60939)
		) boba_inst (
			.in1(ceso),
			.in2(h5_n),
			.y(boba)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) boca_inst (
			.in(atuf_n),
			.ena_n(gumu),
			.y(d3)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) bocy_inst (
			.in(lvolume2_n),
			.ena_n(adak),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(3133.045)
		) bode_inst (
			.in(asyt),
			.y(oam_data_latch)
		);

	dmg_not_x1 #(
			.L_y(64.2812)
		) bodo_inst (
			.in(caza),
			.y(bodo)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) bodu_inst (
			.in(abux_n),
			.ena_n(sprite_sel5),
			.y(sprite_y_store2)
		);

	dmg_drlatch_ee #(
			.L_q(835.3901),
			.L_q_n(201.0783)
		) bofa_inst (
			.d(d5),
			.ena(byfa),
			.ena_n(acyj),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(lmixer1),
			.q_n(bofa_n)
		);

	dmg_not_x1 #(
			.L_y(208.2503)
		) bofe_inst (
			.in(caty),
			.y(bofe)
		);

	dmg_not_x1 #(
			.L_y(1082.156)
		) bofo_inst (
			.in(amun),
			.y(bofo)
		);

	dmg_not_x1 #(
			.L_y(115.8129)
		) bofu_inst (
			.in(d1),
			.y(bofu)
		);

	dmg_not_x1 #(
			.L_y(124.0464)
		) bofy_inst (
			.in(ff21),
			.y(bofy)
		);

	dmg_not_x6 #(
			.L_y(11492)
		) boga_inst (
			.in(baly),
			.y(clk_1mhz)
		);

	dmg_not_x1 #(
			.L_y(315.2966)
		) boge_inst (
			.in(dma_run),
			.y(boge)
		);

	dmg_drlatch_ee #(
			.L_q(1454.828),
			.L_q_n(110.2342)
		) bogu_inst (
			.d(d1),
			.ena(bono),
			.ena_n(acup),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(rmixer1),
			.q_n(bogu_n)
		);

	dmg_not_x6 #(
			.L_y(10163.34)
		) bogy_inst (
			.in(bafu),
			.y(apu_wr)
		);

	dmg_tie #(
			.L_gnd(27409.06)
		) bohy_inst (
			.gnd(const0),
			.vdd()
		);

	dmg_and2 #(
			.L_y(3023.344)
		) boje_inst (
			.in1(atuv),
			.in2(no_sweep_n),
			.y(ch1_freq_upd2)
		);

	dmg_not_x1 #(
			.L_y(270.4056)
		) bojo_inst (
			.in(acc_d10),
			.y(bojo)
		);

	dmg_not_x1 #(
			.L_y(96.4216)
		) boka_inst (
			.in(boro),
			.y(boka)
		);

	dmg_not_x6 #(
			.L_y(117.4062)
		) boke_inst (
			.in(apu_rd_n),
			.y(boke)
		);

	dmg_drlatch_ee #(
			.L_q(83.40623),
			.L_q_n(426.3282)
		) boko_inst (
			.d(d6),
			.ena(bamu),
			.ena_n(bage),
			.r_n(camy),
			.q(ff14_d6),
			.q_n(ff14_d6_n)
		);

	dmg_nand2 #(
			.L_y(2711.235)
		) boku_inst (
			.in1(apok),
			.in2(ext_addr_en_n),
			.y(boku)
		);

	dmg_not_x1 #(
			.L_y(226.8438)
		) boky_inst (
			.in(apu_reset),
			.y(boky)
		);

	dmg_nor2 #(
			.L_y(2316.782)
		) bola_inst (
			.in1(t1t2_n),
			.in2(amer),
			.y(bola)
		);

	dmg_mux #(
			.L_y(995.2969)
		) bole_inst (
			.sel(ch3_active),
			.d1(erus),
			.d0(a0),
			.y(wave_a0)
		);

	dmg_not_x4 #(
			.L_y(4338.19),
			.W_y(350)
		) bolo_inst (
			.in(clk_t4),
			.y(clk_t4_n)
		);

	dmg_not_x6 #(
			.L_y(5442.395)
		) boma_inst (
			.in(clk_1mhz),
			.y(clk_1mhz_n)
		);

	dmg_not_if0 #(
			.L_y(4158.359)
		) bomo_inst (
			.in(tune),
			.ena_n(cede),
			.y(oam_b_d1_n)
		);

	dmg_not_x1 #(
			.L_y(232.4219)
		) bone_inst (
			.in(ch1_sum_ovfl_n),
			.y(bone)
		);

	dmg_not_x2 #(
			.L_y(1750.734)
		) bono_inst (
			.in(bupo),
			.y(bono)
		);

	dmg_or2 #(
			.L_y(440.1404)
		) bonu_inst (
			.in1(cyse),
			.in2(ff26_d4_b),
			.y(bonu)
		);

	dmg_boot_rom #(
			.L_d0(36878.58),
			.L_d1(35163.97),
			.L_d2(38893.62),
			.L_d3(33977.16),
			.L_d4(33882.07),
			.L_d5(33777.41),
			.L_d6(31397.37),
			.L_d7(31524.23)
		) boot_rom_inst (
			.d0(d0),
			.d1(d1),
			.d2(d2),
			.d3(d3),
			.d4(d4),
			.d5(d5),
			.d6(d6),
			.d7(d7),
			.row0_n(bootrom_na1_na0_n),
			.row1_n(bootrom_na1_na0),
			.row2_n(bootrom_na1a0_n),
			.row3_n(bootrom_na1a0),
			.col0(bootrom_a5_na4_n),
			.col1(bootrom_a5_na4),
			.col2(bootrom_a5a4_n),
			.col3(bootrom_a5a4),
			.a2(a2),
			.a2_n(bootrom_a2_n),
			.a3(a3),
			.a3_n(bootrom_a3_n),
			.a6(a6),
			.a6_n(bootrom_a6_n),
			.a7(a7),
			.a7_n(bootrom_a7_n),
			.oe_n(bootrom_oe_n_wl_precharge),
			.oe(bootrom_oe_bl_precharge_n),
			.bl_pch_n(bootrom_oe_bl_precharge_n),
			.wl_pch(bootrom_oe_n_wl_precharge),
			.wl_ena_n(bootrom_oe_n_wl_precharge)
		);

	dmg_and2 #(
			.L_y(2767.016)
		) bopa_inst (
			.in1(ch3_active),
			.in2(doky),
			.y(ch3_out[2])
		);

	dmg_not_x2 #(
		) bope_inst (
			.in(bane),
			.y()
		);

	dmg_not_x1 #(
			.L_y(425.796)
		) bopo_inst (
			.in(apu_reset),
			.y(bopo)
		);

	dmg_nand2 #(
			.L_y(52.85973)
		) bopy_inst (
			.in1(apu_wr),
			.in2(ff26),
			.y(bopy)
		);

	dmg_drlatch_ee #(
			.L_q_n(87.65593)
		) bora_inst (
			.d(wave_rd_d6),
			.ena(wave_data_latch),
			.ena_n(baja),
			.r_n(acor),
			.q(),
			.q_n(bora_n)
		);

	dmg_xor #(
			.L_y(104.6561)
		) bore_inst (
			.in1(wuky),
			.in2(sprite_y_store1),
			.y(bore)
		);

	dmg_nand2 #(
			.L_y(486.0939)
		) boro_inst (
			.in1(apu_wr),
			.in2(ff11),
			.y(boro)
		);

	dmg_not_x2 #(
			.L_y(682.9217)
		) boru_inst (
			.in(boxo),
			.y(boru)
		);

	dmg_not_x2 #(
			.L_y(600.3127)
		) bory_inst (
			.in(abur),
			.y(bory)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) boso_inst (
			.in(azap_n),
			.ena_n(sprite_sel8),
			.y(sprite_y_store0)
		);

	dmg_nand2 #(
			.L_y(1942.25)
		) bosu_inst (
			.in1(ff24),
			.in2(apu_wr),
			.y(bosu)
		);

	dmg_nand3 #(
			.L_y(1055.86)
		) bota_inst (
			.in1(bofe),
			.in2(fexx),
			.in3(ppu_rd),
			.y(cpu_oam_rd_n)
		);

	dmg_or2 #(
			.L_y(344.2502)
		) boto_inst (
			.in1(cowe),
			.in2(ff26_d4_b),
			.y(boto)
		);

	dmg_drlatch_ee #(
			.L_q_n(924.1097)
		) botu_inst (
			.d(d6),
			.ena(cenu),
			.ena_n(ahyc),
			.r_n(apu_reset_n),
			.q(),
			.q_n(ff10_d6_n)
		);

	dmg_nand2 #(
			.L_y(2086.484)
		) boty_inst (
			.in1(amer),
			.in2(ext_addr_en_n),
			.y(boty)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) bove_inst (
			.in(cono_n),
			.ena_n(sprite_sel4),
			.y(sprite_y_store2)
		);

	dmg_nor2 #(
			.L_y(424.2032)
		) bovu_inst (
			.in1(amac),
			.in2(apu_reset),
			.y(bovu)
		);

	dmg_tffnl #(
			.L_q(159.6409)
		) bovy_inst (
			.d(d2),
			.l(bugy),
			.tclk_n(cavy),
			.q(bovy),
			.q_n()
		);

	dmg_not_x6 #(
			.L_y(4292.237)
		) bowa_inst (
			.in(exec_phase),
			.y(exec_phase_n)
		);

	dmg_not_x2 #(
			.L_y(471.7503)
		) bowe_inst (
			.in(bosu),
			.y(bowe)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) bowo_inst (
			.in(ff11_d6_n),
			.ena_n(bexu),
			.y(d6)
		);

	dmg_dffr #(
			.L_q(470.9533)
		) bowy_inst (
			.d(d5),
			.clk(bopy),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(bowy),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(105.1875)
		) boxa_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(boxa_n)
		);

	dmg_or2 #(
			.L_y(432.9694)
		) boxe_inst (
			.in1(bofy),
			.in2(apu_rd_n),
			.y(boxe)
		);

	dmg_nor2 #(
			.L_y(60.29659)
		) boxo_inst (
			.in1(azus),
			.in2(azet),
			.y(boxo)
		);

	dmg_nor2 #(
			.L_y(280.7654)
		) boxu_inst (
			.in1(baso),
			.in2(apu_reset),
			.y(boxu)
		);

	dmg_not_x1 #(
			.L_y(115.8127)
		) boxy_inst (
			.in(a5),
			.y(boxy)
		);

	dmg_and2 #(
			.L_y(1884.61)
		) boza_inst (
			.in1(ch4_env3),
			.in2(dato),
			.y(ch4_out[3])
		);

	dmg_dlatch_ee #(
			.L_q_n(155.9221)
		) bozu_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y0),
			.ena_n(enob),
			.q(),
			.q_n(bozu_n)
		);

	dmg_not_if0 #(
			.L_y(2693.172)
		) bubo_inst (
			.in(tune),
			.ena_n(cede),
			.y(oam_a_d1_n)
		);

	dmg_not_x2 #(
			.L_y(575.8756)
		) bubu_inst (
			.in(baxy),
			.y(bubu)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) buce_inst (
			.in(capo_n),
			.ena_n(sprite_sel4),
			.y(sprite_y_store0)
		);

	dmg_not_x1 #(
			.L_y(396.5777)
		) buco_inst (
			.in(byby),
			.y(buco)
		);

	dmg_not_x1 #(
			.L_y(439.3438)
		) bucy_inst (
			.in(bede),
			.y(bucy)
		);

	dmg_not_x1 #(
			.L_y(100.4058)
		) buda_inst (
			.in(apu_rd_n),
			.y(buda)
		);

	dmg_not_x4 #(
			.L_y(11854.05),
			.W_y(350)
		) bude_inst (
			.in(byry),
			.y(data_phase)
		);

	dmg_nand2 #(
			.L_y(521.4216)
		) budo_inst (
			.in1(d1),
			.in2(deby),
			.y(budo)
		);

	dmg_not_x1 #(
			.L_y(121.1253)
		) budu_inst (
			.in(bacu),
			.y(budu)
		);

	dmg_drlatch_ee #(
			.L_q_n(119.5311)
		) budy_inst (
			.d(wave_rd_d2),
			.ena(wave_data_latch),
			.ena_n(baja),
			.r_n(acor),
			.q(),
			.q_n(budy_n)
		);

	dmg_not_x4 #(
			.L_y(11760.55),
			.W_y(350)
		) bufa_inst (
			.in(beru),
			.y(clk_t4)
		);

	dmg_not_x1 #(
			.L_y(245.1718)
		) bufe_inst (
			.in(wave_data_latch),
			.y(bufe)
		);

	dmg_not_x1 #(
			.L_y(77.82834)
		) bufo_inst (
			.in(atep),
			.y(bufo)
		);

	dmg_not_x3 #(
			.L_y(2819.079)
		) bufy_inst (
			.in(cofu),
			.y(bufy_256hz)
		);

	dmg_nand3 #(
			.L_y(586.5005)
		) buge_inst (
			.in1(ff10_d2_n),
			.in2(ff10_d1_n),
			.in3(ff10_d0_n),
			.y(no_sweep_n)
		);

	dmg_not_x1 #(
			.L_y(27.09386)
		) bugo_inst (
			.in(afep),
			.y(bugo)
		);

	dmg_nand2 #(
			.L_y(330.4371)
		) bugu_inst (
			.in1(d0),
			.in2(deby),
			.y(bugu)
		);

	dmg_not_x1 #(
			.L_y(511.3284)
		) bugy_inst (
			.in(boro),
			.y(bugy)
		);

	dmg_dlatch_ee #(
			.L_q_n(87.65633)
		) buhe_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(buhe_n)
		);

	dmg_not_if0 #(
			.L_y(4722.281)
		) buhu_inst (
			.in(sugy),
			.ena_n(cede),
			.y(oam_b_d5_n)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) buja_inst (
			.in(abeg_n),
			.ena_n(sprite_sel5),
			.y(sprite_y_store1)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) bujy_inst (
			.in(afym_n),
			.ena_n(sprite_sel8),
			.y(sprite_y_store3)
		);

	dmg_not_x1 #(
			.L_y(448.6408)
		) buka_inst (
			.in(caho),
			.y(buka)
		);

	dmg_not_x6 #(
			.L_y(8232.52)
		) buke_inst (
			.in(basu),
			.y(pch_phase_n)
		);

	dmg_not_x1 #(
			.L_y(157.7815)
		) buko_inst (
			.in(came_n),
			.y(buko)
		);

	dmg_not_x6 #(
			.L_y(351.4218)
		) buku_inst (
			.in(azor),
			.y(buku)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) buky_inst (
			.in(cufo_n),
			.ena_n(sprite_sel0),
			.y(sprite_y_store1)
		);

	dmg_mux #(
			.L_y(224.1876)
		) bule_inst (
			.sel(ff26_d4),
			.d1(hama_512khz),
			.d0(apef),
			.y(bule)
		);

	dmg_dlatch_ee #(
			.L_q_n(73.84392)
		) bulu_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(bulu_n)
		);

	dmg_not_if0 #(
			.L_y(4506.33)
		) buma_inst (
			.in(sysa),
			.ena_n(cede),
			.y(oam_b_d4_n)
		);

	dmg_drlatch_ee #(
			.L_q(743.4841),
			.L_q_n(128.5624)
		) bume_inst (
			.d(d4),
			.ena(byfa),
			.ena_n(acyj),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(lmixer0),
			.q_n(bume_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(1042.844)
		) bumo_inst (
			.d(d5),
			.ena(baxy),
			.ena_n(bubu),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(lvolume1_n)
		);

	dmg_xor #(
			.L_y(77.82813)
		) bumy_inst (
			.in1(cuvy),
			.in2(h7_n),
			.y(bumy)
		);

	dmg_dlatch_ee #(
			.L_q_n(68.79678)
		) buna_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(buna_n)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) bune_inst (
			.in(baca),
			.ena(wave_ram_rd),
			.y(d4)
		);

	dmg_nor2 #(
			.L_y(48.8749)
		) buno_inst (
			.in1(ffxx_n),
			.in2(ateg),
			.y(buno)
		);

	dmg_nand2 #(
			.L_y(338.9373)
		) bupo_inst (
			.in1(ff25),
			.in2(apu_wr),
			.y(bupo)
		);

	dmg_not_if0 #(
			.L_y(3599.485)
		) bupy_inst (
			.in(sugy),
			.ena_n(cede),
			.y(oam_a_d5_n)
		);

	dmg_not_x2 #(
			.L_y(516.1096)
		) bure_inst (
			.in(bara_n),
			.y(bure)
		);

	dmg_dffr #(
			.L_q(2879.642)
		) buro_inst (
			.d(d0),
			.clk(aper),
			.r_n(reset2_n),
			.q(ff60_d0),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(182.4846)
		) bury_inst (
			.in1(bave),
			.in2(apu_reset),
			.y(bury)
		);

	dmg_dffr #(
			.L_q(91.64014)
		) busa_inst (
			.d(ch3_frst),
			.clk(apu_4mhz),
			.r_n(bama),
			.q(busa),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4592.656)
		) buse_inst (
			.in(md6),
			.ena_n(azar),
			.y(oam_b_d6_n)
		);

	dmg_and3 #(
			.L_y(1116.156)
		) buso_inst (
			.in1(bexa),
			.in2(ch1_sum_ovfl_n),
			.in3(no_sweep_n),
			.y(ch1_freq_upd1)
		);

	dmg_nand_latch #(
			.L_q_n(92.1717)
		) buta_inst (
			.s_n(bodo),
			.r_n(ares),
			.q(),
			.q_n(ch2_fdis)
		);

	dmg_nand3 #(
			.L_y(55.7812)
		) buto_inst (
			.in1(afep),
			.in2(atyp),
			.in3(baze),
			.y(buto)
		);

	dmg_not_x2 #(
			.L_y(1080.296)
		) butu_inst (
			.in(azus_n),
			.y(wave_data_latch)
		);

	dmg_not_x1 #(
			.L_y(60.29678)
		) buty_inst (
			.in(clk_ena_n),
			.y(buty)
		);

	dmg_tffnl #(
			.L_q(201.3438)
		) buva_inst (
			.d(d4),
			.l(aget),
			.tclk_n(buko),
			.q(buva),
			.q_n()
		);

	dmg_not_x2 #(
		) buve_inst (
			.in(gnd),
			.y()
		);

	dmg_and2 #(
			.L_y(124.8433)
		) buvo_inst (
			.in1(kedo),
			.in2(apat),
			.y(buvo)
		);

	dmg_and2 #(
			.L_y(29.21881)
		) buvu_inst (
			.in1(baly),
			.in2(buty),
			.y(buvu)
		);

	dmg_xor #(
			.L_y(95.35928)
		) buvy_inst (
			.in1(wuky),
			.in2(sprite_y_store2),
			.y(buvy)
		);

	dmg_not_x1 #(
			.L_y(48.07846)
		) buwa_inst (
			.in(apu_rd_n),
			.y(buwa)
		);

	dmg_not_x1 #(
			.L_y(239.5937)
		) buwe_inst (
			.in(apu_reset),
			.y(buwe)
		);

	dmg_not_x1 #(
			.L_y(1496)
		) buwy_inst (
			.in(anyp),
			.y(buwy)
		);

	dmg_not_x1 #(
			.L_y(554.8909)
		) buxo_inst (
			.in(bawa),
			.y(buxo)
		);

	dmg_not_x1 #(
			.L_y(457.9378)
		) buxu_inst (
			.in(a2_in_n),
			.y(buxu)
		);

	dmg_and2 #(
			.L_y(1689.64)
		) buza_inst (
			.in1(ceno_n),
			.in2(mode3),
			.y(oam_rendering)
		);

	dmg_not_x1 #(
			.L_y(1171.407)
		) buze_inst (
			.in(ff10),
			.y(buze)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) buzu_inst (
			.in(anev_n),
			.ena_n(gumu),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(362.0461)
		) buzy_inst (
			.in(gyfo),
			.y(buzy)
		);

	dmg_dffr #(
			.L_q(283.6873),
			.L_q_n(73.84372)
		) byba_inst (
			.d(last_sprite),
			.clk(xupy),
			.r_n(bagy),
			.q(byba),
			.q_n(byba_n)
		);

	dmg_or2 #(
			.L_y(590.75)
		) byby_inst (
			.in1(sprite_save_en_n),
			.in2(cuva),
			.y(byby)
		);

	dmg_full_add #(
			.L_cout(255.5311),
			.L_sum(105.1873)
		) byca_inst (
			.a(h6),
			.b(ff43_d6),
			.cin(bewy_c),
			.cout(byca_c),
			.sum(byca)
		);

	dmg_nand3 #(
			.L_y(110.2346)
		) bycu_inst (
			.in1(cufe),
			.in2(xujy),
			.in3(aver),
			.y(bycu)
		);

	dmg_not_x6 #(
			.L_y(4338.19),
			.W_y(350)
		) byda_inst (
			.in(clk_t4),
			.y(clk_t4_n)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) bydo_inst (
			.in(cumu_n),
			.ena_n(sprite_sel4),
			.y(sprite_y_store3)
		);

	dmg_not_x1 #(
			.L_y(423.4063)
		) bydy_inst (
			.in(ahof),
			.y(save_sprite_y1)
		);

	dmg_not_x2 #(
			.L_y(1640.499)
		) byfa_inst (
			.in(bupo),
			.y(byfa)
		);

	dmg_not_x3 #(
			.L_y(1792.438)
		) byfe_inst (
			.in(baru),
			.y(byfe_128hz)
		);

	dmg_not_x1 #(
			.L_y(111.0311)
		) byfu_inst (
			.in(d2),
			.y(byfu)
		);

	dmg_drlatch_ee #(
			.L_q_n(592.3442)
		) byga_inst (
			.d(d1),
			.ena(bowe),
			.ena_n(ataf),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(rvolume1_n)
		);

	dmg_not_x1 #(
			.L_y(82.60959)
		) bygo_inst (
			.in(apu_rd_n),
			.y(bygo)
		);

	dmg_oa21 #(
			.L_y(699.9217)
		) byha_inst (
			.in1(anel),
			.in2(abaf),
			.in3(abez),
			.y(byha)
		);

	dmg_dlatch_ee #(
			.L_q_n(277.8435)
		) byhe_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num8),
			.ena_n(akol),
			.q(),
			.q_n(byhe_n)
		);

	dmg_not_x1 #(
			.L_y(169.204)
		) byho_inst (
			.in(apu_reset),
			.y(byho)
		);

	dmg_dlatch_ee #(
			.L_q_n(131.7504)
		) byhu_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num2),
			.ena_n(buzy),
			.q(),
			.q_n(byhu_n)
		);

	dmg_not_x1 #(
			.L_y(136.2655)
		) byjo_inst (
			.in(ceha),
			.y(byjo)
		);

	dmg_or2 #(
			.L_y(46.75005)
		) byju_inst (
			.in1(bele),
			.in2(atez),
			.y(byju)
		);

	dmg_and2 #(
			.L_y(2788.797)
		) byka_inst (
			.in1(ch3_active),
			.in2(evug),
			.y(ch3_out[1])
		);

	dmg_not_x1 #(
			.L_y(324.062)
		) byko_inst (
			.in(a5),
			.y(byko)
		);

	dmg_nand2 #(
			.L_y(2224.078)
		) byla_inst (
			.in1(atem),
			.in2(ext_addr_en_n),
			.y(byla)
		);

	dmg_nor2 #(
			.L_y(115.2816)
		) byle_inst (
			.in1(aryl),
			.in2(coru_c),
			.y(byle)
		);

	dmg_not_x1 #(
			.L_y(74.10879)
		) bylo_inst (
			.in(apu_rd_n),
			.y(bylo)
		);

	dmg_dffr #(
			.L_q_n(459.2658)
		) bylu_inst (
			.d(bylu_n),
			.clk(caru_n),
			.r_n(atus),
			.q(),
			.q_n(bylu_n)
		);

	dmg_not_x6 #(
			.L_y(11760.55),
			.W_y(350)
		) byly_inst (
			.in(beru),
			.y(clk_t4)
		);

	dmg_not_x1 #(
			.L_y(127.2346)
		) byma_inst (
			.in(ff24),
			.y(byma)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) byme_inst (
			.in(cana_n),
			.ena_n(sprite_sel9),
			.y(sprite_y_store0)
		);

	dmg_not_x1 #(
			.L_y(1040.983)
		) bymo_inst (
			.in(agyn),
			.y(bymo)
		);

	dmg_not_x1 #(
			.L_y(406.6718)
		) bymy_inst (
			.in(buka),
			.y(bymy)
		);

	dmg_buf_if0 #(
			.L_y(11796.68)
		) byna_inst (
			.in(cogo),
			.ena_n(ext_addr_en_n),
			.y(a7)
		);

	dmg_buf_if0 #(
			.L_y(12689.44)
		) byne_inst (
			.in(cygu),
			.ena_n(ext_addr_en_n),
			.y(a6)
		);

	dmg_not_x1 #(
			.L_y(376.9219)
		) byno_inst (
			.in(bymy),
			.y(save_sprite_y8)
		);

	dmg_not_if0 #(
			.L_y(3245.672)
		) byny_inst (
			.in(tube),
			.ena_n(cede),
			.y(oam_a_d6_n)
		);

	dmg_not_if0 #(
			.L_y(3733.094)
		) bypy_inst (
			.in(syzo),
			.ena_n(cede),
			.y(oam_a_d7_n)
		);

	dmg_tffnl #(
			.L_q(96.15612)
		) byra_inst (
			.d(ff10_d2_n),
			.l(cylu),
			.tclk_n(caja),
			.q(byra),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q_n(1036.203)
		) byre_inst (
			.d(d4),
			.ena(baxy),
			.ena_n(bubu),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(lvolume0_n)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) byro_inst (
			.in(ames_n),
			.ena_n(sprite_sel1),
			.y(sprite_y_store0)
		);

	dmg_not_x1 #(
			.L_y(374)
		) byru_inst (
			.in(acc_d8),
			.y(byru)
		);

	dmg_not_x2 #(
			.L_y(194.7033)
		) byry_inst (
			.in(belu),
			.y(byry)
		);

	dmg_not_x1 #(
			.L_y(93.76559)
		) bysu_inst (
			.in(d0),
			.y(bysu)
		);

	dmg_dffr #(
			.L_q_n(156.7186)
		) byte_inst (
			.d(copy),
			.clk(ajer),
			.r_n(atat),
			.q(),
			.q_n(byte_n)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) bytu_inst (
			.in(ff14_d6_n),
			.ena_n(bale),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(2665.015)
		) byva_inst (
			.in(abak),
			.y(byva)
		);

	dmg_not_x1 #(
			.L_y(495.3909)
		) byvy_inst (
			.in(buco),
			.y(byvy)
		);

	dmg_buf_if0 #(
			.L_y(13208.74)
		) byxe_inst (
			.in(camu),
			.ena_n(ext_addr_en_n),
			.y(a1)
		);

	dmg_not_x1 #(
			.L_y(111.2969)
		) byxo_inst (
			.in(buvu),
			.y(byxo)
		);

	dmg_and2 #(
			.L_y(595.2658)
		) byza_inst (
			.in1(apu_wr),
			.in2(ff3x),
			.y(wave_ram_wr)
		);

	dmg_not_x1 #(
			.L_y(4157.297)
		) byzo_inst (
			.in(ff00rd),
			.y(byzo)
		);

	dmg_and2 #(
			.L_y(1838.657)
		) byzy_inst (
			.in1(ch4_env1),
			.in2(dato),
			.y(ch4_out[1])
		);

	dmg_nand2 #(
			.L_y(2139.875)
		) caba_inst (
			.in1(atol),
			.in2(ext_addr_en_n),
			.y(caba)
		);

	dmg_not_x1 #(
			.L_y(80.75023)
		) cabe_inst (
			.in(apu_reset),
			.y(cabe)
		);

	dmg_drlatch_ee #(
			.L_q(405.3438),
			.L_q_n(138.1251)
		) cabu_inst (
			.d(d6),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d6),
			.q_n(cabu_n)
		);

	dmg_and2 #(
			.L_y(358.3279)
		) caby_inst (
			.in1(coba),
			.in2(reset2_n),
			.y(caby)
		);

	dmg_not_x1 #(
			.L_y(149.547)
		) caca_inst (
			.in(ff13),
			.y(caca)
		);

	dmg_not_x1 #(
			.L_y(778.0158)
		) cacu_inst (
			.in(gyfo),
			.y(cacu)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) cada_inst (
			.in(befo_n),
			.ena_n(gumu),
			.y(d6)
		);

	dmg_or2 #(
			.L_y(69.59402)
		) cado_inst (
			.in1(sprite_save_en_n),
			.in2(cugu),
			.y(cado)
		);

	dmg_dlatch_ee #(
			.L_q_n(105.9841)
		) cadu_inst (
			.d(oam_render_a2),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(cadu_n)
		);

	dmg_dffr #(
			.L_q_n(256.0623)
		) cafa_inst (
			.d(cafa_n),
			.clk(dawa),
			.r_n(caro),
			.q(),
			.q_n(cafa_n)
		);

	dmg_nor2 #(
			.L_y(879.7503)
		) cafy_inst (
			.in1(datu),
			.in2(ff2x_n),
			.y(ff24)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) caga_inst (
			.in(bafo_n),
			.ena_n(gumu),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(165.4843)
		) cage_inst (
			.in(sin_n),
			.y(cage)
		);

	dmg_dffr_cc #(
			.L_q(204.2659),
			.L_q_n(213.5629)
		) cagy_inst (
			.d(cagy_n),
			.clk(cano_n),
			.clk_n(cano),
			.r_n(apu_reset2_n),
			.q(cagy),
			.q_n(cagy_n)
		);

	dmg_or2 #(
			.L_y(82.07803)
		) caho_inst (
			.in1(sprite_save_en_n),
			.in2(dewy),
			.y(caho)
		);

	dmg_tffnl #(
			.L_q(194.1722)
		) caja_inst (
			.d(ff10_d1_n),
			.l(cylu),
			.tclk_n(copa),
			.q(caja),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(105.453)
		) caju_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y4),
			.ena_n(ewot),
			.q(),
			.q_n(caju_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(82.60959)
		) cajy_inst (
			.d(oam_render_a7),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(cajy_n)
		);

	dmg_or2 #(
			.L_y(82.34392)
		) cake_inst (
			.in1(baky),
			.in2(dezy),
			.y(cake)
		);

	dmg_not_if0 #(
			.L_y(4690.937)
		) cako_inst (
			.in(tenu),
			.ena_n(cede),
			.y(oam_b_d3_n)
		);

	dmg_not_x1 #(
			.L_y(818.9221)
		) cala_inst (
			.in(ch1_ftick),
			.y(cala)
		);

	dmg_xor #(
			.L_y(249.4218)
		) cale_inst (
			.in1(aryl),
			.in2(elux),
			.y(cale)
		);

	dmg_dffr #(
			.L_q_n(239.8593)
		) calo_inst (
			.d(calo_n),
			.clk(bata),
			.r_n(apu_reset_n),
			.q(),
			.q_n(calo_n)
		);

	dmg_not_x1 #(
			.L_y(312.9064)
		) calu_inst (
			.in(apu_reset),
			.y(calu)
		);

	dmg_dffr #(
			.L_q(3040.612),
			.L_q_n(65.07805)
		) caly_inst (
			.d(caly_n),
			.clk(cyde_n),
			.r_n(caro),
			.q(int_serial),
			.q_n(caly_n)
		);

	dmg_nor2 #(
			.L_y(154.3283)
		) cama_inst (
			.in1(ch2_1mhz),
			.in2(ch2_fdis),
			.y(cama)
		);

	dmg_tffnl #(
			.L_q_n(151.1409)
		) came_inst (
			.d(d3),
			.l(bymo),
			.tclk_n(conu),
			.q(),
			.q_n(came_n)
		);

	dmg_not_x1 #(
			.L_y(581.4533)
		) camo_inst (
			.in(asys),
			.y(save_sprite_x1)
		);

	dmg_not_x1 #(
			.L_y(156.1874)
		) camu_inst (
			.in(a1_in_n),
			.y(camu)
		);

	dmg_not_x1 #(
			.L_y(83.40582)
		) camy_inst (
			.in(apu_reset),
			.y(camy)
		);

	dmg_dlatch_ee #(
			.L_q_n(82.60959)
		) cana_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y9),
			.ena_n(faka),
			.q(),
			.q_n(cana_n)
		);

	dmg_dffr #(
			.L_q(257.6562),
			.L_q_n(162.8275)
		) cano_inst (
			.d(cano_n),
			.clk(cule),
			.r_n(apu_reset2_n),
			.q(cano),
			.q_n(cano_n)
		);

	dmg_not_x1 #(
			.L_y(228.1718)
		) canu_inst (
			.in(capy),
			.y(canu)
		);

	dmg_not_x1 #(
			.L_y(827.6872)
		) cape_inst (
			.in(bego),
			.y(cape)
		);

	dmg_dlatch_ee #(
			.L_q_n(87.92201)
		) capo_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y4),
			.ena_n(ewot),
			.q(),
			.q_n(capo_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) capu_inst (
			.in(bogu_n),
			.ena_n(gumu),
			.y(d1)
		);

	dmg_nor3 #(
			.L_y(112.6251)
		) capy_inst (
			.in1(cero),
			.in2(bufy_256hz),
			.in3(ff14_d6_n),
			.y(capy)
		);

	dmg_not_x1 #(
			.L_y(339.2024)
		) cara_inst (
			.in(cyto),
			.y(ch1_active_n)
		);

	dmg_and3 #(
			.L_y(96.95316)
		) care_inst (
			.in1(xoce),
			.in2(ceha),
			.in3(sprite_y_match),
			.y(care)
		);

	dmg_and2 #(
			.L_y(480.5154)
		) caro_inst (
			.in1(uwam),
			.in2(reset2_n),
			.y(caro)
		);

	dmg_dffr #(
			.L_q_n(317.1559)
		) caru_inst (
			.d(caru_n),
			.clk(bure),
			.r_n(atus),
			.q(),
			.q_n(caru_n)
		);

	dmg_and2 #(
			.L_y(677.8755)
		) cary_inst (
			.in1(ch4_1mhz),
			.in2(gary),
			.y(noise_counter_clk)
		);

	dmg_not_if0 #(
			.L_y(4309.501)
		) case_inst (
			.in(doto),
			.ena_n(bafy),
			.y(ma6_n)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) casy_inst (
			.in(bake_n),
			.ena_n(beba),
			.y(d7)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) cata_inst (
			.in(cuzy_n),
			.ena_n(beba),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(321.1405)
		) cate_inst (
			.in(cone),
			.y(cate_128hz)
		);

	dmg_or2 #(
			.L_y(101.7342)
		) cato_inst (
			.in1(sprite_save_en_n),
			.in2(dogu),
			.y(cato)
		);

	dmg_dffr #(
			.L_q(397.9061)
		) catu_inst (
			.d(abov),
			.clk(xupy),
			.r_n(abez),
			.q(start_oam_parsing),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1337.956)
		) caty_inst (
			.in(decy),
			.y(caty)
		);

	dmg_nor2 #(
			.L_y(144.7659)
		) cava_inst (
			.in1(ff11_d6_n),
			.in2(ff11_d7),
			.y(cava)
		);

	dmg_muxi #(
			.L_y(374.0002)
		) cave_inst (
			.sel(sck_dir),
			.d1(coty),
			.d0(sck_n),
			.y(cave)
		);

	dmg_not_x1 #(
			.L_y(1032.218)
		) cavo_inst (
			.in(bedy),
			.y(cavo)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) cavu_inst (
			.in(bume_n),
			.ena_n(gumu),
			.y(d4)
		);

	dmg_tffnl #(
			.L_q(78.89066)
		) cavy_inst (
			.d(d1),
			.l(bugy),
			.tclk_n(bacy),
			.q(cavy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) cawo_inst (
			.in(dewu_n),
			.ena_n(sprite_sel9),
			.y(sprite_y_store3)
		);

	dmg_nor2 #(
			.L_y(701.7809)
		) caxe_inst (
			.in1(ff1x_n),
			.in2(duno),
			.y(ff11)
		);

	dmg_nor2 #(
			.L_y(140.7813)
		) caxo_inst (
			.in1(ff11_d6_n),
			.in2(ff11_d7_n),
			.y(caxo)
		);

	dmg_not_x1 #(
			.L_y(1141.125)
		) caxu_inst (
			.in(dybe),
			.y(caxu)
		);

	dmg_tffnl #(
			.L_q(176.375)
		) caxy_inst (
			.d(ff10_d6_n),
			.l(cymu),
			.tclk_n(cypu),
			.q(caxy),
			.q_n()
		);

	dmg_dffr #(
			.L_q(82.07803)
		) caza_inst (
			.d(dory),
			.clk(ch2_1mhz),
			.r_n(cexe),
			.q(caza),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(1287.75)
		) caze_inst (
			.in1(apu_wr),
			.in2(ff20),
			.y(caze)
		);

	dmg_not_x1 #(
			.L_y(87.39005)
		) cazo_inst (
			.in(dulu),
			.y(cazo)
		);

	dmg_not_x3 #(
			.L_y(1756.843)
		) cazu_inst (
			.in(bena),
			.y(wave_ram_rd)
		);

	dmg_dlatch_ee #(
			.L_q_n(143.9687)
		) cebo_inst (
			.d(oam_render_a3),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(cebo_n)
		);

	dmg_or2 #(
			.L_y(115.2813)
		) cecu_inst (
			.in1(sprite_save_en_n),
			.in2(cupe),
			.y(cecu)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) cecy_inst (
			.in(ff16_d6_n),
			.ena_n(coro),
			.y(d6)
		);

	dmg_not_x2 #(
			.L_y(1727.093)
		) cede_inst (
			.in(dma_addr_ext),
			.y(cede)
		);

	dmg_tffnl #(
			.L_q_n(644.9377)
		) cedo_inst (
			.d(d3),
			.l(dotu),
			.tclk_n(dena),
			.q(),
			.q_n(cedo_n)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) cedu_inst (
			.in(bemy_n),
			.ena_n(beba),
			.y(d4)
		);

	dmg_dffr #(
			.L_q(242.7812)
		) cedy_inst (
			.d(enut),
			.clk(wuty),
			.r_n(byva),
			.q(cedy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) cega_inst (
			.in(sprite_y2_n),
			.ena_n(sprite_x_match),
			.y(sprite_y_store2)
		);

	dmg_not_x1 #(
			.L_y(817.062)
		) cege_inst (
			.in(apu_rd_n),
			.y(cege)
		);

	dmg_not_x1 #(
			.L_y(113.6873)
		) cegu_inst (
			.in(wave_rd_d1),
			.y(cegu)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) cegy_inst (
			.in(cufa_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a4)
		);

	dmg_not_x2 #(
			.L_y(362.8441)
		) ceha_inst (
			.in(ceno_n),
			.y(ceha)
		);

	dmg_not_x1 #(
			.L_y(738.9686)
		) cehe_inst (
			.in(ch1_ld_sum),
			.y(cehe)
		);

	dmg_nor4 #(
			.L_y(160.172)
		) cehu_inst (
			.in1(ceko),
			.in2(dety),
			.in3(dozo),
			.in4(cony),
			.y(sprite_x_match_h2)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) ceka_inst (
			.in(ff16_d7_n),
			.ena_n(coro),
			.y(d7)
		);

	dmg_xor #(
			.L_y(86.85928)
		) ceko_inst (
			.in1(duhy),
			.in2(h4_n),
			.y(ceko)
		);

	dmg_or2 #(
			.L_y(1626.688)
		) cela_inst (
			.in1(cofy_n),
			.in2(kura),
			.y(cela)
		);

	dmg_not_x1 #(
			.L_y(145.0314)
		) cele_inst (
			.in(no_sweep_n),
			.y(no_sweep)
		);

	dmg_not_x1 #(
			.L_y(113.6874)
		) celo_inst (
			.in(doxa),
			.y(celo)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) celu_inst (
			.in(cebo_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a3)
		);

	dmg_mux #(
			.L_y(146.3592)
		) cely_inst (
			.sel(ff26_d4_b),
			.d1(baza),
			.d0(byfe_128hz),
			.y(cely)
		);

	dmg_dffr #(
			.L_q(979.6247),
			.L_q_n(65.60911)
		) cemo_inst (
			.d(cemo_n),
			.clk(bufo),
			.r_n(byho),
			.q(ch2_1mhz),
			.q_n(cemo_n)
		);

	dmg_or2 #(
			.L_y(83.67192)
		) cemy_inst (
			.in1(sprite_save_en_n),
			.in2(dezo),
			.y(cemy)
		);

	dmg_drlatch_ee #(
			.L_q(107.8437),
			.L_q_n(200.547)
		) cena_inst (
			.d(d6),
			.ena(covu),
			.ena_n(dafo),
			.r_n(apu_reset6_n),
			.q(ff11_d6),
			.q_n(ff11_d6_n)
		);

	dmg_dffr #(
			.L_q_n(188.0623)
		) ceno_inst (
			.d(oam_parsing),
			.clk(xupy),
			.r_n(abez),
			.q(),
			.q_n(ceno_n)
		);

	dmg_and2 #(
			.L_y(1512.734)
		) cenu_inst (
			.in1(apu_wr),
			.in2(ff10),
			.y(cenu)
		);

	dmg_not_x1 #(
			.L_y(1259.86)
		) cepo_inst (
			.in(apu_reset),
			.y(apu_reset6_n)
		);

	dmg_nand2 #(
			.L_y(1303.423)
		) cepu_inst (
			.in1(atyr),
			.in2(ext_addr_en_n),
			.y(cepu)
		);

	dmg_not_x1 #(
			.L_y(182.2188)
		) cepy_inst (
			.in(ff23_d6),
			.y(cepy)
		);

	dmg_tffnl #(
			.L_q(65.07845)
		) cera_inst (
			.d(d1),
			.l(bymo),
			.tclk_n(eryc),
			.q(cera),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) cere_inst (
			.in(bepu_n),
			.ena_n(gumu),
			.y(d7)
		);

	dmg_dffr #(
			.L_q(276.5157),
			.L_q_n(103.594)
		) cero_inst (
			.d(cero_n),
			.clk(ch1_len_timer_stop),
			.r_n(cory),
			.q(cero),
			.q_n(cero_n)
		);

	dmg_dffr #(
			.L_q(880.5472),
			.L_q_n(64.81256)
		) cery_inst (
			.d(cery_n),
			.clk(cybo),
			.r_n(bela),
			.q(ch3_2mhz),
			.q_n(cery_n)
		);

	dmg_drlatch_ee #(
			.L_q(264.5625)
		) ceso_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(ceso),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q_n(117.6721)
		) cesy_inst (
			.d(wave_rd_d1),
			.ena(wave_data_latch),
			.ena_n(bufe),
			.r_n(acor),
			.q(),
			.q_n(cesy_n)
		);

	dmg_not_if0 #(
			.L_y(4338.984)
		) ceta_inst (
			.in(efyk),
			.ena_n(bafy),
			.y(ma8_n)
		);

	dmg_not_x1 #(
			.L_y(112.8906)
		) ceto_inst (
			.in(apu_rd_n),
			.y(ceto)
		);

	dmg_not_if0 #(
			.L_y(3349.267)
		) cetu_inst (
			.in(md3),
			.ena_n(azar),
			.y(oam_a_d3_n)
		);

	dmg_xor #(
			.L_y(227.9063)
		) ceva_inst (
			.in1(dury),
			.in2(h6_n),
			.y(ceva)
		);

	dmg_drlatch_ee #(
			.L_q_n(150.0784)
		) cevo_inst (
			.d(wave_rd_d5),
			.ena(wave_data_latch),
			.ena_n(bufe),
			.r_n(acor),
			.q(),
			.q_n(cevo_n)
		);

	dmg_nor2 #(
			.L_y(113.1563)
		) cevu_inst (
			.in1(ff11_d6),
			.in2(ff11_d7_n),
			.y(cevu)
		);

	dmg_not_x1 #(
			.L_y(477.329)
		) cexe_inst (
			.in(apu_reset),
			.y(cexe)
		);

	dmg_dffr #(
			.L_q(154.063),
			.L_q_n(216.4846)
		) cexo_inst (
			.d(cexo_n),
			.clk(noise_counter_clk),
			.r_n(apu_reset4_n),
			.q(cexo),
			.q_n(cexo_n)
		);

	dmg_not_x1 #(
			.L_y(954.6563)
		) cexu_inst (
			.in(buka),
			.y(cexu)
		);

	dmg_pad_xtal #(
			.L_clk_n(4052.376)
		) ck1_ck2_inst (
			.ena(osc_ena),
			.clk_n(clk_in_n),
			.in_pad(ck1_pad),
			.out_pad(ck2_pad)
		);

	dmg_not_x1 #(
			.L_y(38.25027)
		) coba_inst (
			.in(int_serial),
			.y(coba)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) coce_inst (
			.in(ff21_d1_n),
			.ena_n(boxe),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(795.8124)
		) code_inst (
			.in(cacu),
			.y(save_sprite_x2)
		);

	dmg_not_x1 #(
			.L_y(194.9685)
		) codo_inst (
			.in(ezoz),
			.y(codo)
		);

	dmg_tffnl #(
			.L_q(364.4379)
		) cofe_inst (
			.d(ff21_d1_n),
			.l(dapy),
			.tclk_n(cuna),
			.q(cofe),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4690.937)
		) cofo_inst (
			.in(md3),
			.ena_n(azar),
			.y(oam_b_d3_n)
		);

	dmg_not_x1 #(
			.L_y(201.0783)
		) cofu_inst (
			.in(beze),
			.y(cofu)
		);

	dmg_dffr #(
			.L_q_n(3048.048)
		) cofy_inst (
			.d(d5),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(),
			.q_n(cofy_n)
		);

	dmg_not_x1 #(
			.L_y(867.0001)
		) cogo_inst (
			.in(a7_in_n),
			.y(cogo)
		);

	dmg_not_x1 #(
			.L_y(1037.266)
		) cogu_inst (
			.in(duju),
			.y(cogu)
		);

	dmg_nor4 #(
			.L_y(233.2189)
		) cogy_inst (
			.in1(bazy),
			.in2(cyle),
			.in3(ceva),
			.in4(bumy),
			.y(sprite_x_match_h5)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) coho_inst (
			.in(dysy_n),
			.ena_n(sprite_sel9),
			.y(sprite_y_store2)
		);

	dmg_oa21 #(
			.L_y(132.547)
		) cohy_inst (
			.in1(urys),
			.in2(d0),
			.in3(reset2_n),
			.y(cohy)
		);

	dmg_not_x1 #(
			.L_y(242.2501)
		) coju_inst (
			.in(wave_data_latch),
			.y(coju)
		);

	dmg_not_x2 #(
			.L_y(2929.312)
		) coka_inst (
			.in(davo_n),
			.y(ch3_active)
		);

	dmg_not_x1 #(
			.L_y(192.0468)
		) coke_inst (
			.in(ajer),
			.y(coke)
		);

	dmg_xor #(
			.L_y(119.7971)
		) cola_inst (
			.in1(dake),
			.in2(h4_n),
			.y(cola)
		);

	dmg_nor2 #(
			.L_y(2342.813)
		) colo_inst (
			.in1(t1t2_n),
			.in2(asur),
			.y(colo)
		);

	dmg_xor #(
			.L_y(189.6563)
		) colu_inst (
			.in1(dyfu),
			.in2(h6_n),
			.y(colu)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) coly_inst (
			.in(byca),
			.ena_n(bafy),
			.y(ma3_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(74.1096)
		) coma_inst (
			.d(oam_render_a5),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(coma_n)
		);

	dmg_and2 #(
			.L_y(496.7194)
		) como_inst (
			.in1(noise_counter_bypass),
			.in2(cosa),
			.y(como)
		);

	dmg_dffr #(
			.L_q(298.2968),
			.L_q_n(168.672)
		) comy_inst (
			.d(comy_n),
			.clk(cala),
			.r_n(dyru),
			.q(comy),
			.q_n(comy_n)
		);

	dmg_not_x1 #(
			.L_y(410.6562)
		) cona_inst (
			.in(ff2x_n),
			.y(ff2x)
		);

	dmg_not_x1 #(
			.L_y(1537.173)
		) cone_inst (
			.in(cely),
			.y(cone)
		);

	dmg_dlatch_ee #(
			.L_q_n(100.6719)
		) cono_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y4),
			.ena_n(ewot),
			.q(),
			.q_n(cono_n)
		);

	dmg_tffnl #(
			.L_q(165.2186)
		) conu_inst (
			.d(d2),
			.l(bymo),
			.tclk_n(cera),
			.q(conu),
			.q_n()
		);

	dmg_xor #(
			.L_y(52.59404)
		) cony_inst (
			.in1(depy),
			.in2(h7_n),
			.y(cony)
		);

	dmg_tffnl #(
			.L_q(336.0155)
		) copa_inst (
			.d(ff10_d0_n),
			.l(cylu),
			.tclk_n(dapu),
			.q(copa),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1278.718)
		) cope_inst (
			.in(cyte),
			.y(ch1_frst)
		);

	dmg_muxi #(
			.L_y(285.2808)
		) copo_inst (
			.sel(wave_nibble_sel),
			.d1(begu_n),
			.d0(bepa_n),
			.y(wave_play_d3)
		);

	dmg_tffnl #(
			.L_q(264.0313),
			.L_q_n(308.9216)
		) copu_inst (
			.d(acc_d10),
			.l(dako),
			.tclk_n(evak),
			.q(ch1_ftick),
			.q_n(copu_n)
		);

	dmg_and3 #(
			.L_y(314.4999)
		) copy_inst (
			.in1(byra),
			.in2(caja),
			.in3(copa),
			.y(copy)
		);

	dmg_nor2 #(
			.L_y(1970.938)
		) cora_inst (
			.in1(dura),
			.in2(ff2x_n),
			.y(ff25)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) core_inst (
			.in(culy_n),
			.ena(ucom),
			.y(d0)
		);

	dmg_nand2 #(
			.L_y(328.3131)
		) coro_inst (
			.in1(bygo),
			.in2(ff16),
			.y(coro)
		);

	dmg_full_add #(
			.L_cout(169.4685),
			.L_sum(451.5625)
		) coru_inst (
			.a(doly),
			.b(deva),
			.cin(dule_c),
			.cout(coru_c),
			.sum(sum10)
		);

	dmg_nor3 #(
			.L_y(292.4534)
		) cory_inst (
			.in1(boka),
			.in2(apu_reset),
			.in3(ch1_restart),
			.y(cory)
		);

	dmg_not_x1 #(
			.L_y(143.7028)
		) cosa_inst (
			.in(apu_rd_n),
			.y(cosa)
		);

	dmg_not_x1 #(
			.L_y(3645.969)
		) cose_inst (
			.in(sprite_palette),
			.y(sprite_x4_n)
		);

	dmg_nor2 #(
			.L_y(145.5626)
		) coso_inst (
			.in1(ff11_d6),
			.in2(ff11_d7),
			.y(coso)
		);

	dmg_not_x2 #(
			.L_y(1485.109)
		) cota_inst (
			.in(bycu),
			.y(cota)
		);

	dmg_and2 #(
			.L_y(113.1561)
		) cote_inst (
			.in1(cepy),
			.in2(ff26_d4_b),
			.y(ch4_eg_test)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) coto_inst (
			.in(ch1_active_n),
			.ena_n(dole),
			.y(d0)
		);

	dmg_nor2 #(
			.L_y(2456.501)
		) cotu_inst (
			.in1(t1t2_n),
			.in2(atol),
			.y(cotu)
		);

	dmg_dffr #(
			.L_q(32.40608),
			.L_q_n(92.17232)
		) coty_inst (
			.d(coty_n),
			.clk(\16384hz ),
			.r_n(uwam),
			.q(coty),
			.q_n(coty_n)
		);

	dmg_not_if0 #(
			.L_y(3384.063)
		) cove_inst (
			.in(wefe_const1),
			.ena_n(bafy),
			.y(ma11_n)
		);

	dmg_nor2 #(
			.L_y(1834.938)
		) covo_inst (
			.in1(dewa),
			.in2(ff2x_n),
			.y(ff21)
		);

	dmg_and2 #(
			.L_y(330.9689)
		) covu_inst (
			.in1(apu_wr),
			.in2(ff11),
			.y(covu)
		);

	dmg_nor2 #(
			.L_y(587.5629)
		) covy_inst (
			.in1(ff1x_n),
			.in2(daza),
			.y(ff16)
		);

	dmg_and2 #(
			.L_y(87.39085)
		) cowe_inst (
			.in1(cyto),
			.in2(duwo),
			.y(cowe)
		);

	dmg_not_if0 #(
			.L_y(3221.234)
		) coxo_inst (
			.in(wefe_const1),
			.ena_n(bafy),
			.y(ma12_n)
		);

	dmg_and3 #(
			.L_y(128.5628)
		) coze_inst (
			.in1(caxy),
			.in2(cypu),
			.in3(cupo),
			.y(coze)
		);

	dmg_drlatch_ee #(
			.L_q_n(935.2657)
		) cozu_inst (
			.d(d6),
			.ena(baxy),
			.ena_n(bubu),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(),
			.q_n(lvolume2_n)
		);

	dmg_not_x1 #(
			.L_y(87.39085)
		) cozy_inst (
			.in(apu_4mhz),
			.y(cozy)
		);

	dmg_pad_out #(
		) cp_inst (
			.o_n(rypo),
			.pad(cp_pad)
		);

	dmg_pad_out #(
		) cpg_inst (
			.o_n(pogu),
			.pad(cpg_pad)
		);

	dmg_pad_out #(
		) cpl_inst (
			.o_n(kymo),
			.pad(cpl_pad)
		);

	tri logic [7:0] cpu_port_d;
	tran (cpu_port_d[0], d0);
	tran (cpu_port_d[1], d1);
	tran (cpu_port_d[2], d2);
	tran (cpu_port_d[3], d3);
	tran (cpu_port_d[4], d4);
	tran (cpu_port_d[5], d5);
	tran (cpu_port_d[6], d6);
	tran (cpu_port_d[7], d7);
	tri logic [15:0] cpu_port_a;
	tran (cpu_port_a[0], a0);
	tran (cpu_port_a[1], a1);
	tran (cpu_port_a[2], a2);
	tran (cpu_port_a[3], a3);
	tran (cpu_port_a[4], a4);
	tran (cpu_port_a[5], a5);
	tran (cpu_port_a[6], a6);
	tran (cpu_port_a[7], a7);
	tran (cpu_port_a[8], a8);
	tran (cpu_port_a[9], a9);
	tran (cpu_port_a[10], a10);
	tran (cpu_port_a[11], a11);
	tran (cpu_port_a[12], a12);
	tran (cpu_port_a[13], a13);
	tran (cpu_port_a[14], a14);
	tran (cpu_port_a[15], a15);
	tri logic [7:0] cpu_port_int;
	assign cpu_port_int[0] = cpu_irq0;
	assign cpu_port_int[1] = cpu_irq1;
	assign cpu_port_int[2] = cpu_irq2;
	assign cpu_port_int[3] = cpu_irq3;
	assign cpu_port_int[4] = cpu_irq4;
	assign cpu_port_int[5] = gnd;
	assign cpu_port_int[6] = gnd;
	assign cpu_port_int[7] = gnd;
	tri logic [7:0] cpu_port_inta;
	assign cpu_irq_ack0 = cpu_port_inta[0];
	assign cpu_irq_ack1 = cpu_port_inta[1];
	assign cpu_irq_ack2 = cpu_port_inta[2];
	assign cpu_irq_ack3 = cpu_port_inta[3];
	assign cpu_irq_ack4 = cpu_port_inta[4];
	assign cpu_irq_ack5 = cpu_port_inta[5];
	assign cpu_irq_ack6 = cpu_port_inta[6];
	assign cpu_irq_ack7 = cpu_port_inta[7];
	sm83 #(
			.L_d0(36878.58),
			.L_d1(35163.97),
			.L_d2(38893.62),
			.L_d3(33977.16),
			.L_d4(33882.07),
			.L_d5(33777.41),
			.L_d6(31397.37),
			.L_d7(31524.23),
			.L_a0(15151.52),
			.L_a1(13208.74),
			.L_a2(12653.05),
			.L_a3(13115.5),
			.L_a4(12300.83),
			.L_a5(11772.77),
			.L_a6(12689.44),
			.L_a7(11796.68),
			.L_a8(7387.566),
			.L_a9(7543.753),
			.L_a10(8718.614),
			.L_a11(7105.737),
			.L_a12(7415.191),
			.L_a13(7178.256),
			.L_a14(7592.629),
			.L_a15(6073.253),
			.L_inta0(408.2658),
			.L_inta1(366.5625),
			.L_inta2(396.3132),
			.L_inta3(468.2972),
			.L_inta4(433.4999),
			.L_inta5(96.68748),
			.L_inta6(96.68748),
			.L_inta7(98.01549),
			.L_mreq(5227.14),
			.L_stop_n(10074.1),
			.L_rd(1449.101),
			.L_halt_n(4322.784),
			.L_wr(5993.365),
			.L_m1(4155.44)
		) cpu_inst (
			.int_entry(),
			.mreq(mreq),
			.stop_n(osc_ena),
			.rd(read),
			.halt_n(clk_ena),
			.ffxx(),
			.prefix_cb(),
			.wr(write),
			.m1(m1),
			.test_freeze(gnd),
			.exec_phase_n(exec_phase_n),
			.exec_phase(exec_phase),
			.data_phase_n(data_phase_n),
			.data_phase(data_phase),
			.write_phase_n(clk_t4_n),
			.write_phase(clk_t4),
			.pch_phase_n(pch_phase_n),
			.clk_n(clk_1mhz_n),
			.clk(clk_1mhz),
			.sys_reset(cpu_sys_reset),
			.pwron_reset(reset),
			.clk_ready(osc_stable),
			.wake(cpu_wakeup),
			.nmi(nmi),
			.oe_n(t1t2_n),
			.internal_access(fexx_ffxx),
			.shadow_access(boot_sel),
			.shadow_override(t1_nt2),
			.d(cpu_port_d),
			.a(cpu_port_a),
			.\int (cpu_port_int),
			.inta(cpu_port_inta),
			.db(cpu_internal_db)
		);

	dmg_dffsr #(
			.L_q(197.8905),
			.L_q_n(74.37488)
		) cuba_inst (
			.d(cage),
			.clk(dawe),
			.s_n(cufu),
			.r_n(cohy),
			.q(cuba),
			.q_n(cuba_n)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) cube_inst (
			.in(buhe_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a2)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) cubo_inst (
			.in(cadu_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a2)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) cuca_inst (
			.in(sprite_y1_n),
			.ena_n(sprite_x_match),
			.y(sprite_y_store1)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) cucu_inst (
			.in(sprite_y0_n),
			.ena_n(sprite_x_match),
			.y(sprite_y_store0)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) cuda_inst (
			.in(ff11_d7_n),
			.ena_n(bexu),
			.y(d7)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) cudu_inst (
			.in(bofa_n),
			.ena_n(gumu),
			.y(d5)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) cudy_inst (
			.in(cofy_n),
			.ena_n(byzo),
			.y(d5)
		);

	dmg_dlatch_ee #(
			.L_q_n(67.46898)
		) cufa_inst (
			.d(oam_render_a4),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(cufa_n)
		);

	dmg_oai21 #(
			.L_y(882.4065)
		) cufe_inst (
			.in1(fexx),
			.in2(dma_run),
			.in3(dma_phi_n),
			.y(cufe)
		);

	dmg_dlatch_ee #(
			.L_q_n(91.37506)
		) cufo_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y0),
			.ena_n(enob),
			.q(),
			.q_n(cufo_n)
		);

	dmg_nand2 #(
			.L_y(239.5939)
		) cufu_inst (
			.in1(d0),
			.in2(daku),
			.y(cufu)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) cuga_inst (
			.in(cyxu_n),
			.ena_n(beba),
			.y(d2)
		);

	dmg_nor2 #(
			.L_y(3011.126)
		) cuge_inst (
			.in1(dufe),
			.in2(ff2x_n),
			.y(ff23)
		);

	dmg_not_x1 #(
			.L_y(140.5157)
		) cugo_inst (
			.in(wave_rd_d0),
			.y(cugo)
		);

	dmg_nand4 #(
			.L_y(67.20329)
		) cugu_inst (
			.in1(fycu),
			.in2(cypy),
			.in3(ekud),
			.in4(caxu),
			.y(cugu)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) cugy_inst (
			.in(cuba_n),
			.ena(ufeg),
			.y(d0)
		);

	dmg_not_if0 #(
			.L_y(3245.672)
		) cuje_inst (
			.in(md6),
			.ena_n(azar),
			.y(oam_a_d6_n)
		);

	dmg_not_x1 #(
			.L_y(142.3744)
		) cule_inst (
			.in(ch2_frst),
			.y(cule)
		);

	dmg_not_x3 #(
			.L_y(623.1561)
		) culo_inst (
			.in(caru_n),
			.y(culo)
		);

	dmg_xor #(
			.L_y(231.0937)
		) culu_inst (
			.in1(aryl),
			.in2(beku),
			.y(culu)
		);

	dmg_dffr #(
			.L_q(9347.081),
			.L_q_n(56.84353)
		) culy_inst (
			.d(d0),
			.clk(uwam),
			.r_n(reset2_n),
			.q(sck_dir),
			.q_n(culy_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(105.719)
		) cumu_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y4),
			.ena_n(ewot),
			.q(),
			.q_n(cumu_n)
		);

	dmg_tffnl #(
			.L_q(532.5784)
		) cuna_inst (
			.d(ff21_d0_n),
			.l(dapy),
			.tclk_n(buxo),
			.q(cuna),
			.q_n()
		);

	dmg_tffnl #(
			.L_q_n(142.375)
		) cuno_inst (
			.d(d3),
			.l(bugy),
			.tclk_n(bovy),
			.q(),
			.q_n(cuno_n)
		);

	dmg_not_x2 #(
			.L_y(7324.611)
		) cunu_inst (
			.in(dula),
			.y(ppu_hard_reset_n)
		);

	dmg_drlatch_ee #(
			.L_q(563.9218),
			.L_q_n(629.5317)
		) cuny_inst (
			.d(d6),
			.ena(cazo),
			.ena_n(dulu),
			.r_n(cabe),
			.q(ff23_d6),
			.q_n(ff23_d6_n)
		);

	dmg_not_x4 #(
			.L_y(8322.032)
		) cupa_inst (
			.in(dyky),
			.y(ppu_wr)
		);

	dmg_nand4 #(
			.L_y(81.81215)
		) cupe_inst (
			.in1(eden),
			.in2(cypy),
			.in3(ekud),
			.in4(caxu),
			.y(cupe)
		);

	dmg_tffnl #(
			.L_q(351.4214)
		) cupo_inst (
			.d(ff10_d4_n),
			.l(cymu),
			.tclk_n(cate_128hz),
			.q(cupo),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(310.7812)
		) cura_inst (
			.d(d4),
			.l(bepe),
			.tclk_n(cuso),
			.q(cura),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(108.6405)
		) cure_inst (
			.in(ff14),
			.y(cure)
		);

	dmg_not_x1 #(
			.L_y(122.4535)
		) curu_inst (
			.in(apu_rd_n),
			.y(curu)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) cury_inst (
			.in(ff23_d6_n),
			.ena_n(bare),
			.y(d6)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) cusa_inst (
			.in(dede_n),
			.ena_n(buwy),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(312.641)
		) cuso_inst (
			.in(cuno_n),
			.y(cuso)
		);

	dmg_drlatch_ee #(
			.L_q(227.3747)
		) cusy_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(cusy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(149.2813)
		) cuto_inst (
			.in(wave_rd_d6),
			.y(cuto)
		);

	dmg_nand5 #(
			.L_y(136.5312)
		) cuty_inst (
			.in1(ff21_d3),
			.in2(ch4_env0),
			.in3(ch4_env1),
			.in4(ch4_env2),
			.in5(ch4_env3),
			.y(cuty)
		);

	dmg_nand4 #(
			.L_y(82.60959)
		) cuva_inst (
			.in1(fycu),
			.in2(cypy),
			.in3(cape),
			.in4(caxu),
			.y(cuva)
		);

	dmg_drlatch_ee #(
			.L_q_n(149.2813)
		) cuvo_inst (
			.d(wave_rd_d4),
			.ena(wave_data_latch),
			.ena_n(beka),
			.r_n(acor),
			.q(),
			.q_n(cuvo_n)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) cuvu_inst (
			.in(bulu_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a5)
		);

	dmg_drlatch_ee #(
			.L_q(310.2502)
		) cuvy_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(cuvy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1148.297)
		) cuwa_inst (
			.in(doda),
			.y(cuwa)
		);

	dmg_dffr #(
			.L_q(206.3905),
			.L_q_n(247.0313)
		) cuxy_inst (
			.d(cuxy_n),
			.clk(bese_n),
			.r_n(azyb),
			.q(cuxy),
			.q_n(cuxy_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(105.719)
		) cuza_inst (
			.d(oam_render_a6),
			.ena(bala),
			.ena_n(byvy),
			.q(),
			.q_n(cuza_n)
		);

	dmg_muxi #(
			.L_y(439.8748)
		) cuzo_inst (
			.sel(wave_nibble_sel),
			.d1(budy_n),
			.d0(bora_n),
			.y(wave_play_d2)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) cuzu_inst (
			.in(ff21_d2_n),
			.ena_n(boxe),
			.y(d2)
		);

	dmg_drlatch_ee #(
			.L_q(703.9058),
			.L_q_n(74.37528)
		) cuzy_inst (
			.d(d5),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d5),
			.q_n(cuzy_n)
		);

	dmg_not_x1 #(
			.L_y(97.21884)
		) cybe_inst (
			.in(ejyb),
			.y(cybe)
		);

	dmg_not_x1 #(
			.L_y(189.6566)
		) cybo_inst (
			.in(apu_4mhz),
			.y(cybo)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) cyby_inst (
			.in(cuza_n),
			.ena_n(sprite_sel1),
			.y(oam_render_a6)
		);

	dmg_nor4 #(
			.L_y(296.4376)
		) cyco_inst (
			.in1(duse),
			.in2(dagu),
			.in3(dyze),
			.in4(deso),
			.y(sprite_x_match_l7)
		);

	dmg_dffr #(
			.L_q_n(256.5937)
		) cyde_inst (
			.d(cyde_n),
			.clk(cylo_n),
			.r_n(caro),
			.q(),
			.q_n(cyde_n)
		);

	dmg_and2 #(
			.L_y(237.4684)
		) cyfa_inst (
			.in1(cero),
			.in2(ff14_d6),
			.y(cyfa)
		);

	dmg_drlatch_ee #(
			.L_q_n(117.9378)
		) cyfo_inst (
			.d(wave_rd_d0),
			.ena(wave_data_latch),
			.ena_n(beka),
			.r_n(acor),
			.q(),
			.q_n(cyfo_n)
		);

	dmg_not_x1 #(
			.L_y(557.0154)
		) cygu_inst (
			.in(a6_in_n),
			.y(cygu)
		);

	dmg_not_x1 #(
			.L_y(127.2346)
		) cyho_inst (
			.in(doge),
			.y(cyho)
		);

	dmg_nor2 #(
			.L_y(1090.126)
		) cyka_inst (
			.in1(t1t2_n),
			.in2(atyr),
			.y(cyka)
		);

	dmg_not_x2 #(
			.L_y(1434.641)
		) cyke_inst (
			.in(xupy),
			.y(cyke)
		);

	dmg_not_x1 #(
			.L_y(82.60939)
		) cyky_inst (
			.in(acc_d7),
			.y(cyky)
		);

	dmg_not_x1 #(
			.L_y(1287.484)
		) cyla_inst (
			.in(bede),
			.y(cyla)
		);

	dmg_xor #(
			.L_y(65.87529)
		) cyle_inst (
			.in1(dyby),
			.in2(h5_n),
			.y(cyle)
		);

	dmg_dffr #(
			.L_q_n(265.0941)
		) cylo_inst (
			.d(cylo_n),
			.clk(cafa_n),
			.r_n(caro),
			.q(),
			.q_n(cylo_n)
		);

	dmg_not_x1 #(
			.L_y(413.5787)
		) cylu_inst (
			.in(dacu),
			.y(cylu)
		);

	dmg_not_if0 #(
			.L_y(3349.267)
		) cyme_inst (
			.in(tenu),
			.ena_n(cede),
			.y(oam_a_d3_n)
		);

	dmg_not_x1 #(
			.L_y(808.0309)
		) cymu_inst (
			.in(dafa),
			.y(cymu)
		);

	dmg_not_x1 #(
			.L_y(521.1561)
		) cyne_inst (
			.in(ch1_ld_sum),
			.y(cyne)
		);

	dmg_not_if0 #(
			.L_y(3991.015)
		) cypo_inst (
			.in(daba),
			.ena_n(bafy),
			.y(ma7_n)
		);

	dmg_tffnl #(
			.L_q(474.4063)
		) cypu_inst (
			.d(ff10_d5_n),
			.l(cymu),
			.tclk_n(cupo),
			.q(cypu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(976.1711)
		) cypy_inst (
			.in(cuxy),
			.y(cypy)
		);

	dmg_dlatch #(
			.L_q(428.7189),
			.L_q_n(365.7651)
		) cyra_inst (
			.d(oam_a_d5_n),
			.ena(oam_data_latch),
			.q(cyra),
			.q_n(cyra_n)
		);

	dmg_dffr #(
			.L_q(1006.719),
			.L_q_n(162.0312)
		) cyre_inst (
			.d(cyre_n),
			.clk(ch2_len_timer_stop),
			.r_n(beny),
			.q(cyre),
			.q_n(cyre_n)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) cyro_inst (
			.in(buna_n),
			.ena_n(sprite_sel2),
			.y(oam_render_a6)
		);

	dmg_and2 #(
			.L_y(602.4374)
		) cyse_inst (
			.in1(dane),
			.in2(dome),
			.y(cyse)
		);

	dmg_not_x1 #(
			.L_y(808.5628)
		) cyte_inst (
			.in(comy),
			.y(cyte)
		);

	dmg_nor_latch #(
			.L_q(1379.125)
		) cyto_inst (
			.s(ch1_restart),
			.r(ch1_stop),
			.q(cyto),
			.q_n()
		);

	dmg_tffnl #(
			.L_q_n(682.3911)
		) cyvo_inst (
			.d(fome),
			.l(cogu),
			.tclk_n(ezof),
			.q(),
			.q_n(cyvo_n)
		);

	dmg_xor #(
			.L_y(73.84372)
		) cyvu_inst (
			.in1(wuky),
			.in2(sprite_y_store0),
			.y(cyvu)
		);

	dmg_nor4 #(
			.L_y(440.4066)
		) cyvy_inst (
			.in1(cola),
			.in2(boba),
			.in3(colu),
			.in4(bahu),
			.y(sprite_x_match_h1)
		);

	dmg_drlatch_ee #(
			.L_q(123.7816)
		) cywe_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(cywe),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(304.406)
		) cywu_inst (
			.in(apu_reset),
			.y(cywu)
		);

	dmg_drlatch_ee #(
			.L_q(2195.125),
			.L_q_n(81.01571)
		) cyxu_inst (
			.d(d2),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d2),
			.q_n(cyxu_n)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(3177.142)
		) d0_inst (
			.pdrv_n(ruxa),
			.ndrv(rune),
			.ena_n_pu(lula),
			.i_n(d0_in_n),
			.pad(d_pad[0])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1896.032)
		) d1_inst (
			.pdrv_n(ruja),
			.ndrv(rypu),
			.ena_n_pu(lula),
			.i_n(d1_in_n),
			.pad(d_pad[1])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(2700.876)
		) d2_inst (
			.pdrv_n(raby),
			.ndrv(suly),
			.ena_n_pu(lula),
			.i_n(d2_in_n),
			.pad(d_pad[2])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(2628.094)
		) d3_inst (
			.pdrv_n(rera),
			.ndrv(seze),
			.ena_n_pu(lula),
			.i_n(d3_in_n),
			.pad(d_pad[3])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1930.562)
		) d4_inst (
			.pdrv_n(rory),
			.ndrv(resy),
			.ena_n_pu(lula),
			.i_n(d4_in_n),
			.pad(d_pad[4])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(2143.328)
		) d5_inst (
			.pdrv_n(ryvo),
			.ndrv(tamu),
			.ena_n_pu(lula),
			.i_n(d5_in_n),
			.pad(d_pad[5])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(2056.735)
		) d6_inst (
			.pdrv_n(rafy),
			.ndrv(rogy),
			.ena_n_pu(lula),
			.i_n(d6_in_n),
			.pad(d_pad[6])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1470.234)
		) d7_inst (
			.pdrv_n(ravu),
			.ndrv(ryda),
			.ena_n_pu(lula),
			.i_n(d7_in_n),
			.pad(d_pad[7])
		);

	dmg_full_add #(
			.L_cout(82.07823),
			.L_sum(70.39046)
		) daba_inst (
			.a(v5),
			.b(ff42_d5),
			.cin(doto_c),
			.cout(daba_c),
			.sum(daba)
		);

	dmg_not_x1 #(
			.L_y(61.35951)
		) dabu_inst (
			.in(feco),
			.y(sprite_y2_n)
		);

	dmg_not_x1 #(
			.L_y(70.39046)
		) daby_inst (
			.in(enef),
			.y(sprite_y1_n)
		);

	dmg_nand2 #(
			.L_y(259.2503)
		) dace_inst (
			.in1(acc_d7),
			.in2(kedo),
			.y(dace)
		);

	dmg_and2 #(
			.L_y(315.0313)
		) daco_inst (
			.in1(apu_wr),
			.in2(ff21),
			.y(daco)
		);

	dmg_nor2 #(
			.L_y(258.1874)
		) dacu_inst (
			.in1(ch1_restart),
			.in2(bexa),
			.y(dacu)
		);

	dmg_nor2 #(
			.L_y(116.6098)
		) dado_inst (
			.in1(apu_reset),
			.in2(ch1_start),
			.y(dado)
		);

	dmg_nor2 #(
			.L_y(122.4527)
		) dafa_inst (
			.in1(bexa),
			.in2(ch1_restart),
			.y(dafa)
		);

	dmg_not_if0 #(
			.L_y(4098.063)
		) dafe_inst (
			.in(ejok),
			.ena_n(bafy),
			.y(ma9_n)
		);

	dmg_not_x1 #(
			.L_y(281.5623)
		) dafo_inst (
			.in(covu),
			.y(dafo)
		);

	dmg_dlatch_ee #(
			.L_q_n(94.29695)
		) dafu_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(dafu_n)
		);

	dmg_nand4 #(
			.L_y(181.9529)
		) dafy_inst (
			.in1(duce),
			.in2(abub),
			.in3(afob),
			.in4(dyte),
			.y(dafy)
		);

	dmg_xor #(
			.L_y(64.54668)
		) daga_inst (
			.in1(enad),
			.in2(h5_n),
			.y(daga)
		);

	dmg_xor #(
			.L_y(79.6877)
		) dagu_inst (
			.in1(epum),
			.in2(h1_n),
			.y(dagu)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) dahu_inst (
			.in(emux),
			.ena_n(beje),
			.y(ma2_n)
		);

	dmg_nor4 #(
			.L_y(232.4217)
		) daje_inst (
			.in1(ejot),
			.in2(esaj),
			.in3(ducu),
			.in4(ewud),
			.y(sprite_x_match_h7)
		);

	dmg_not_x1 #(
			.L_y(207.1872)
		) dajo_inst (
			.in(ch1_frst),
			.y(dajo)
		);

	dmg_oa21 #(
			.L_y(132.5466)
		) daju_inst (
			.in1(urys),
			.in2(d3),
			.in3(reset2_n),
			.y(daju)
		);

	dmg_drlatch_ee #(
			.L_q(124.8439)
		) dake_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(dake),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(651.0479)
		) dako_inst (
			.in(epyk),
			.y(dako)
		);

	dmg_not_x1 #(
			.L_y(1595.611)
		) daku_inst (
			.in(urys),
			.y(daku)
		);

	dmg_nor_latch #(
			.L_q_n(112.3595)
		) dala_inst (
			.s(celo),
			.r(ch2_start),
			.q(),
			.q_n(dala_n)
		);

	dmg_dffr #(
			.L_q(234.8124),
			.L_q_n(240.6566)
		) dale_inst (
			.d(dale_n),
			.clk(dure_n),
			.r_n(apu_reset4_n),
			.q(dale),
			.q_n(dale_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) dalo_inst (
			.in(ekap_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a7)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) daly_inst (
			.in(etav_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a6)
		);

	dmg_nor4 #(
			.L_y(109.9687)
		) dama_inst (
			.in1(duze),
			.in2(daga),
			.in3(dawu),
			.in4(ejaw),
			.y(sprite_x_match_h8)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) dame_inst (
			.in(dovu_n),
			.ena(ufeg),
			.y(d4)
		);

	dmg_not_if0 #(
			.L_y(4222.375)
		) damu_inst (
			.in(dma_a4),
			.ena_n(ahoc),
			.y(ma4_n)
		);

	dmg_nand4 #(
			.L_y(524.3445)
		) damy_inst (
			.in1(acol),
			.in2(abub),
			.in3(dupa),
			.in4(dyte),
			.y(damy)
		);

	dmg_nor_latch #(
			.L_q(168.1407)
		) dane_inst (
			.s(ch2_restart),
			.r(ch2_stop),
			.q(dane),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(267.2183)
		) dano_inst (
			.d(d0),
			.l(dotu),
			.tclk_n(cuwa),
			.q(dano),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(1089.328)
		) danu_inst (
			.in1(dona),
			.in2(ff2x_n),
			.y(ff20)
		);

	dmg_drlatch_ee #(
			.L_q(192.047)
		) dany_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(dany),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(2994.393)
		) dapa_inst (
			.in(apu_reset),
			.y(apu_reset4_n)
		);

	dmg_dffr_cc #(
			.L_q(207.1878),
			.L_q_n(166.8123)
		) dape_inst (
			.d(dape_n),
			.clk(eros_n),
			.clk_n(eros),
			.r_n(apu_reset6_n),
			.q(dape),
			.q_n(dape_n)
		);

	dmg_not_x1 #(
			.L_y(344.7817)
		) dapu_inst (
			.in(ch1_shift_clk),
			.y(dapu)
		);

	dmg_not_x1 #(
			.L_y(1662.018)
		) dapy_inst (
			.in(enec),
			.y(dapy)
		);

	dmg_nor2 #(
			.L_y(719.8435)
		) dara_inst (
			.in1(ff1x_n),
			.in2(dafy),
			.y(ff18)
		);

	dmg_not_x1 #(
			.L_y(112.3593)
		) dare_inst (
			.in(dymu),
			.y(dare)
		);

	dmg_nor5 #(
			.L_y(111.8283)
		) daro_inst (
			.in1(ff21_d3),
			.in2(ch4_env0),
			.in3(ch4_env1),
			.in4(ch4_env2),
			.in5(ch4_env3),
			.y(daro)
		);

	dmg_ao2222 #(
			.L_y(98.28117)
		) dary_inst (
			.in1(epor),
			.in2(fura),
			.in3(ezef),
			.in4(etar),
			.in5(deko),
			.in6(ever),
			.in7(cexo),
			.in8(etov),
			.y(dary)
		);

	dmg_not_x1 #(
			.L_y(132.0154)
		) dasa_inst (
			.in(v1),
			.y(dasa)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) daso_inst (
			.in(dojo_n),
			.ena(ufeg),
			.y(d3)
		);

	dmg_muxi #(
			.L_y(134.938)
		) date_inst (
			.sel(wave_nibble_sel),
			.d1(cyfo_n),
			.d0(cuvo_n),
			.y(wave_play_d0)
		);

	dmg_or2 #(
			.L_y(502.0316)
		) dato_inst (
			.in1(ezul),
			.in2(ch4_eg_test),
			.y(dato)
		);

	dmg_nand4 #(
			.L_y(1025.844)
		) datu_inst (
			.in1(dyte),
			.in2(afob),
			.in3(deno),
			.in4(acol),
			.y(datu)
		);

	dmg_drlatch_ee #(
			.L_q(2585.062),
			.L_q_n(109.7033)
		) daty_inst (
			.d(d0),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d0),
			.q_n(daty_n)
		);

	dmg_not_if0 #(
			.L_y(4179.61)
		) dava_inst (
			.in(dma_a5),
			.ena_n(ahoc),
			.y(ma5_n)
		);

	dmg_dffr #(
			.L_q_n(191.7813)
		) davo_inst (
			.d(doru),
			.clk(ajer),
			.r_n(calu),
			.q(),
			.q_n(davo_n)
		);

	dmg_not_x1 #(
			.L_y(357.5314)
		) davu_inst (
			.in(etuk),
			.y(ch2_frst)
		);

	dmg_or2 #(
			.L_y(4025.549)
		) dawa_inst (
			.in1(cave),
			.in2(sck_en_n),
			.y(dawa)
		);

	dmg_not_x2 #(
			.L_y(670.7036)
		) dawe_inst (
			.in(deho),
			.y(dawe)
		);

	dmg_xor #(
			.L_y(185.1407)
		) dawu_inst (
			.in1(ebow),
			.in2(h6_n),
			.y(dawu)
		);

	dmg_nand2 #(
			.L_y(401.0944)
		) daxa_inst (
			.in1(cege),
			.in2(ff26_d4_b),
			.y(daxa)
		);

	dmg_not_x1 #(
			.L_y(89.78138)
		) daxu_inst (
			.in(deta),
			.y(daxu)
		);

	dmg_nand4 #(
			.L_y(158.8436)
		) daza_inst (
			.in1(acol),
			.in2(deno),
			.in3(dupa),
			.in4(dyte),
			.y(daza)
		);

	dmg_drlatch_ee #(
			.L_q(77.29697)
		) dazo_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(dazo),
			.q_n()
		);

	dmg_muxi #(
			.L_y(260.3124)
		) dazy_inst (
			.sel(wave_nibble_sel),
			.d1(cesy_n),
			.d0(cevo_n),
			.y(wave_play_d1)
		);

	dmg_dlatch_ee #(
			.L_q_n(82.07823)
		) deba_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(deba_n)
		);

	dmg_not_x1 #(
			.L_y(221.7966)
		) debo_inst (
			.in(acc_d6),
			.y(debo)
		);

	dmg_and2 #(
			.L_y(708.6874)
		) deby_inst (
			.in1(apu_wr),
			.in2(ff14),
			.y(deby)
		);

	dmg_not_x1 #(
			.L_y(886.3907)
		) dece_inst (
			.in(cexu),
			.y(save_sprite_x8)
		);

	dmg_nor2 #(
			.L_y(699.6564)
		) deco_inst (
			.in1(ff1x_n),
			.in2(etuf),
			.y(ff13)
		);

	dmg_not_x1 #(
			.L_y(522.4846)
		) decu_inst (
			.in(cato),
			.y(decu)
		);

	dmg_not_x1 #(
			.L_y(65.60921)
		) decy_inst (
			.in(clk_t4),
			.y(decy)
		);

	dmg_drlatch_ee #(
			.L_q(306.7971),
			.L_q_n(75.17192)
		) dede_inst (
			.d(d4),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d4),
			.q_n(dede_n)
		);

	dmg_dffr_cc_q #(
			.L_q(178.7655)
		) defa_inst (
			.d(cale),
			.clk(ch1_ld_sum),
			.clk_n(cyne),
			.r_n(sum_reset_n),
			.q(defa)
		);

	dmg_not_x1 #(
			.L_y(98.28117)
		) defu_inst (
			.in(dane),
			.y(ch2_active_n)
		);

	dmg_nand2 #(
			.L_y(2968.094)
		) defy_inst (
			.in1(asur),
			.in2(ext_addr_en_n),
			.y(defy)
		);

	dmg_not_x1 #(
			.L_y(997.1564)
		) dega_inst (
			.in(epyk),
			.y(dega)
		);

	dmg_not_x1 #(
			.L_y(75.17213)
		) dege_inst (
			.in(eruc),
			.y(sprite_y0_n)
		);

	dmg_nand3 #(
			.L_y(859.8284)
		) dego_inst (
			.in1(aror),
			.in2(sprite_x_match_l2),
			.in3(sprite_x_match_h2),
			.y(dego)
		);

	dmg_dffsr #(
			.L_q(273.594),
			.L_q_n(73.57824)
		) degu_inst (
			.d(cuba),
			.clk(dawe),
			.s_n(docu),
			.r_n(dumo),
			.q(degu),
			.q_n(degu_n)
		);

	dmg_not_x1 #(
			.L_y(691.4222)
		) deha_inst (
			.in(gecy),
			.y(save_sprite_x7)
		);

	dmg_not_x1 #(
			.L_y(27.89071)
		) deho_inst (
			.in(epyt),
			.y(deho)
		);

	dmg_nand4 #(
			.L_y(247.8284)
		) dejy_inst (
			.in1(duce),
			.in2(abub),
			.in3(afob),
			.in4(doso),
			.y(dejy)
		);

	dmg_not_x1 #(
			.L_y(93.76579)
		) deke_inst (
			.in(d0),
			.y(deke)
		);

	dmg_dffr #(
			.L_q(223.3911),
			.L_q_n(261.1098)
		) deko_inst (
			.d(deko_n),
			.clk(cexo_n),
			.r_n(apu_reset4_n),
			.q(deko),
			.q_n(deko_n)
		);

	dmg_nand2 #(
			.L_y(240.1252)
		) dela_inst (
			.in1(d2),
			.in2(daku),
			.y(dela)
		);

	dmg_dffr_cc_q #(
			.L_q(103.3285)
		) dele_inst (
			.d(acc_d7),
			.clk(ch1_ld_sum),
			.clk_n(cehe),
			.r_n(sum_reset_n),
			.q(dele)
		);

	dmg_nor3 #(
			.L_y(92.1713)
		) deme_inst (
			.in1(cyre),
			.in2(bufy_256hz),
			.in3(ff19_d6_n),
			.y(deme)
		);

	dmg_dffr #(
			.L_q(107.8437),
			.L_q_n(419.4227)
		) demo_inst (
			.d(demo_n),
			.clk(doke_n),
			.r_n(apu_reset4_n),
			.q(demo),
			.q_n(demo_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) demu_inst (
			.in(evak_n),
			.ena_n(dupy),
			.y(d1)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) demy_inst (
			.in(ff21_d0_n),
			.ena_n(boxe),
			.y(d0)
		);

	dmg_tffnl #(
			.L_q(403.4837)
		) dena_inst (
			.d(d2),
			.l(dotu),
			.tclk_n(favy),
			.q(dena),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(1032.485)
		) deno_inst (
			.in(abub),
			.y(deno)
		);

	dmg_not_x2 #(
			.L_y(1366.907)
		) deny_inst (
			.in(foxa),
			.y(sprite_sel8)
		);

	dmg_dlatch_ee #(
			.L_q_n(4192.626)
		) depo_inst (
			.d(eced),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(sprite_priority)
		);

	dmg_nand2 #(
			.L_y(144.5001)
		) depu_inst (
			.in1(apu_wr),
			.in2(ff13),
			.y(depu)
		);

	dmg_drlatch_ee #(
			.L_q(160.9685)
		) depy_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(depy),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(661.9375)
		) dera_inst (
			.in1(apu_reset),
			.in2(ch2_start),
			.y(dera)
		);

	dmg_dffr #(
			.L_q(257.6566),
			.L_q_n(197.6251)
		) dere_inst (
			.d(dere_n),
			.clk(dota_n),
			.r_n(apu_reset4_n),
			.q(dere),
			.q_n(dere_n)
		);

	dmg_not_x1 #(
			.L_y(121.3904)
		) dero_inst (
			.in(ch3_frst),
			.y(dero)
		);

	dmg_not_x1 #(
			.L_y(184.8748)
		) deru_inst (
			.in(ekov_n),
			.y(deru)
		);

	dmg_nand2 #(
			.L_y(611.4684)
		) dery_inst (
			.in1(apu_wr),
			.in2(ff1b),
			.y(dery)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) desa_inst (
			.in(cuto),
			.ena(wave_ram_rd),
			.y(d6)
		);

	dmg_dlatch_ee #(
			.L_q_n(149.5468)
		) dese_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(dese_n)
		);

	dmg_xor #(
			.L_y(88.18729)
		) deso_inst (
			.in1(ehyn),
			.in2(h3_n),
			.y(deso)
		);

	dmg_drlatch_ee #(
			.L_q(123.7813)
		) desu_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(desu),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) desy_inst (
			.in(cegu),
			.ena(wave_ram_rd),
			.y(d1)
		);

	dmg_nand2 #(
			.L_y(568.1716)
		) deta_inst (
			.in1(apu_wr),
			.in2(ff19),
			.y(deta)
		);

	dmg_dffr #(
			.L_q(135.2034),
			.L_q_n(217.016)
		) dete_inst (
			.d(dete_n),
			.clk(dose_n),
			.r_n(apu_reset4_n),
			.q(dete),
			.q_n(dete_n)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) detu_inst (
			.in(dyra_n),
			.ena(ufeg),
			.y(d2)
		);

	dmg_xor #(
			.L_y(111.0315)
		) dety_inst (
			.in1(ejuf),
			.in2(h5_n),
			.y(dety)
		);

	dmg_dffr_cc_q #(
			.L_q(118.4685)
		) deva_inst (
			.d(culu),
			.clk(ch1_ld_sum),
			.clk_n(homu),
			.r_n(sum_reset_n),
			.q(deva)
		);

	dmg_buf_if0 #(
			.L_y(33777.41)
		) deve_inst (
			.in(cyra_n),
			.ena_n(oam_a_rd_n),
			.y(d5)
		);

	dmg_dlatch_ee #(
			.L_q_n(96.42201)
		) devy_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(devy_n)
		);

	dmg_nand4 #(
			.L_y(893.8288)
		) dewa_inst (
			.in1(doso),
			.in2(afob),
			.in3(abub),
			.in4(acol),
			.y(dewa)
		);

	dmg_dlatch_ee #(
			.L_q_n(94.03087)
		) dewu_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y9),
			.ena_n(faka),
			.q(),
			.q_n(dewu_n)
		);

	dmg_nand4 #(
			.L_y(84.20328)
		) dewy_inst (
			.in1(eden),
			.in2(cypy),
			.in3(cape),
			.in4(elyg),
			.y(dewy)
		);

	dmg_dffr_cc_q #(
			.L_q(211.4373)
		) dexe_inst (
			.d(acc_d8),
			.clk(ch1_ld_sum),
			.clk_n(cehe),
			.r_n(sum_reset_n),
			.q(dexe)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) dexo_inst (
			.in(copu_n),
			.ena_n(dupy),
			.y(d2)
		);

	dmg_nand4 #(
			.L_y(88.45297)
		) dezo_inst (
			.in1(eden),
			.in2(cypy),
			.in3(cape),
			.in4(caxu),
			.y(dezo)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) dezu_inst (
			.in(dafu_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a7)
		);

	dmg_dffr #(
			.L_q(415.7031)
		) dezy_inst (
			.d(sprite_save_en_n),
			.clk(ppu_4mhz),
			.r_n(ppu_reset_n),
			.q(dezy),
			.q_n()
		);

	dmg_dffr #(
			.L_q(260.5782)
		) doba_inst (
			.d(byba),
			.clk(ppu_4mhz_n),
			.r_n(bagy),
			.q(doba),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) dobo_inst (
			.in(ekop_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a2)
		);

	dmg_not_x1 #(
			.L_y(634.3127)
		) doby_inst (
			.in(enob),
			.y(save_sprite_y0)
		);

	dmg_not_x1 #(
			.L_y(205.328)
		) doca_inst (
			.in(cama),
			.y(doca)
		);

	dmg_nand2 #(
			.L_y(240.125)
		) docu_inst (
			.in1(d1),
			.in2(daku),
			.y(docu)
		);

	dmg_nor3 #(
			.L_y(136.5308)
		) doda_inst (
			.in1(fugo),
			.in2(bufy_256hz),
			.in3(ff23_d6_n),
			.y(doda)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) dode_inst (
			.in(ecab),
			.ena_n(beje),
			.y(ma3_n)
		);

	dmg_nor2 #(
			.L_y(135.4689)
		) dody_inst (
			.in1(no_sweep),
			.in2(egyp),
			.y(dody)
		);

	dmg_and4 #(
			.L_y(607.4843)
		) dofa_inst (
			.in1(acol),
			.in2(abub),
			.in3(dupa),
			.in4(dyte),
			.y(dofa)
		);

	dmg_not_x1 #(
			.L_y(803.5156)
		) dofe_inst (
			.in(dymo),
			.y(save_sprite_num5)
		);

	dmg_dffr_cc_q #(
			.L_q(246.5004)
		) dofy_inst (
			.d(acc_d9),
			.clk(ch1_ld_sum),
			.clk_n(cehe),
			.r_n(sum_reset_n),
			.q(dofy)
		);

	dmg_nand2 #(
			.L_y(181.6878)
		) doge_inst (
			.in1(apu_wr),
			.in2(ff14),
			.y(doge)
		);

	dmg_tffnl #(
			.L_q(93.76559)
		) dogo_inst (
			.d(ff21_d2_n),
			.l(dapy),
			.tclk_n(cofe),
			.q(dogo),
			.q_n()
		);

	dmg_nand4 #(
			.L_y(84.20287)
		) dogu_inst (
			.in1(fycu),
			.in2(cypy),
			.in3(cape),
			.in4(elyg),
			.y(dogu)
		);

	dmg_dffsr #(
			.L_q(296.7047),
			.L_q_n(74.37488)
		) dojo_inst (
			.d(dyra),
			.clk(dawe),
			.s_n(dyge),
			.r_n(daju),
			.q(dojo),
			.q_n(dojo_n)
		);

	dmg_nor2 #(
			.L_y(112.6247)
		) doju_inst (
			.in1(ff16_d6),
			.in2(ff16_d7_n),
			.y(doju)
		);

	dmg_and2 #(
			.L_y(125.6401)
		) doka_inst (
			.in1(comy),
			.in2(ch1_1mhz),
			.y(doka)
		);

	dmg_dffr #(
			.L_q(170.7971),
			.L_q_n(280.765)
		) doke_inst (
			.d(doke_n),
			.clk(dale_n),
			.r_n(apu_reset4_n),
			.q(doke),
			.q_n(doke_n)
		);

	dmg_not_x1 #(
			.L_y(571.8904)
		) doku_inst (
			.in(efev),
			.y(sprite_rst1)
		);

	dmg_ao22 #(
			.L_y(485.5624)
		) doky_inst (
			.in1(wave_play_d2),
			.in2(gege),
			.in3(wave_play_d3),
			.in4(goka),
			.y(doky)
		);

	dmg_nand2 #(
			.L_y(239.3286)
		) dola_inst (
			.in1(d4),
			.in2(daku),
			.y(dola)
		);

	dmg_nand2 #(
			.L_y(112.8902)
		) dole_inst (
			.in1(ff26),
			.in2(ceto),
			.y(dole)
		);

	dmg_dffr_cc_q #(
			.L_q(245.4373)
		) doly_inst (
			.d(acc_d10),
			.clk(ch1_ld_sum),
			.clk_n(efex),
			.r_n(sum_reset_n),
			.q(doly)
		);

	dmg_dffr #(
			.L_q(585.4374)
		) dome_inst (
			.d(ch2_pwm),
			.clk(ch2_frst),
			.r_n(apu_reset2_n),
			.q(dome),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(121.922)
		) domo_inst (
			.in1(ff16_d6),
			.in2(ff16_d7),
			.y(domo)
		);

	dmg_nand4 #(
			.L_y(758.3594)
		) dona_inst (
			.in1(dyte),
			.in2(afob),
			.in3(abub),
			.in4(acol),
			.y(dona)
		);

	dmg_tffnl #(
			.L_q(368.9533),
			.L_q_n(279.7031)
		) done_inst (
			.d(fofe),
			.l(cogu),
			.tclk_n(doca),
			.q(done),
			.q_n(done_n)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) dony_inst (
			.in(duha_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a5)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) dopa_inst (
			.in(emus_n),
			.ena_n(dupy),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(443.5939)
		) dope_inst (
			.d(etap),
			.clk(apu_phi),
			.r_n(cywu),
			.q(ch2_start),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(339.2032)
		) dopu_inst (
			.in(cedo_n),
			.y(dopu)
		);

	dmg_and2 #(
			.L_y(148.4843)
		) dora_inst (
			.in1(cyre),
			.in2(ff19_d6),
			.y(dora)
		);

	dmg_and2 #(
			.L_y(502.8278)
		) dore_inst (
			.in1(wave_play_d3),
			.in2(gege),
			.y(dore)
		);

	dmg_not_x1 #(
			.L_y(371.6096)
		) doru_inst (
			.in(ezas),
			.y(doru)
		);

	dmg_dffr #(
			.L_q(461.3904)
		) dory_inst (
			.d(ch2_restart),
			.clk(ch2_1mhz),
			.r_n(cexe),
			.q(dory),
			.q_n()
		);

	dmg_and2 #(
			.L_y(724.8903)
		) dosa_inst (
			.in1(ff18),
			.in2(apu_wr),
			.y(dosa)
		);

	dmg_dffr #(
			.L_q(108.375),
			.L_q_n(299.6254)
		) dose_inst (
			.d(dose_n),
			.clk(demo_n),
			.r_n(apu_reset4_n),
			.q(dose),
			.q_n(dose_n)
		);

	dmg_not_x2 #(
			.L_y(763.6714)
		) doso_inst (
			.in(dyte),
			.y(doso)
		);

	dmg_not_x1 #(
			.L_y(1227.453)
		) dosy_inst (
			.in(dubu),
			.y(sprite_rst9)
		);

	dmg_dffr #(
			.L_q(184.6097),
			.L_q_n(311.0462)
		) dota_inst (
			.d(dota_n),
			.clk(erut_n),
			.r_n(apu_reset4_n),
			.q(dota),
			.q_n(dota_n)
		);

	dmg_full_add #(
			.L_cout(246.2345),
			.L_sum(93.23444)
		) doto_inst (
			.a(v4),
			.b(ff42_d4),
			.cin(etam_c),
			.cout(doto_c),
			.sum(doto)
		);

	dmg_not_x1 #(
			.L_y(931.0162)
		) dotu_inst (
			.in(caze),
			.y(dotu)
		);

	dmg_not_x4 #(
			.L_y(2785.078)
		) dova_inst (
			.in(data_phase),
			.y(apu_phi)
		);

	dmg_nor2 #(
			.L_y(139.7186)
		) dove_inst (
			.in1(ff16_d6_n),
			.in2(ff16_d7_n),
			.y(dove)
		);

	dmg_not_x1 #(
			.L_y(103.8593)
		) dovo_inst (
			.in(apu_rd_n),
			.y(dovo)
		);

	dmg_dffsr #(
			.L_q(347.7034),
			.L_q_n(72.78139)
		) dovu_inst (
			.d(dojo),
			.clk(epyt),
			.s_n(dola),
			.r_n(dyly),
			.q(dovu),
			.q_n(dovu_n)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) dowa_inst (
			.in(duny_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a4)
		);

	dmg_nor2 #(
			.L_y(352.4844)
		) doxa_inst (
			.in1(apu_reset),
			.in2(dory),
			.y(doxa)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) doxe_inst (
			.in(cabu_n),
			.ena_n(beba),
			.y(d6)
		);

	dmg_and2 #(
			.L_y(5746.531)
		) doxy_inst (
			.in1(ff2x),
			.in2(ekag),
			.y(ff26)
		);

	dmg_nor2 #(
			.L_y(2049.297)
		) doza_inst (
			.in1(ff1x_n),
			.in2(dejy),
			.y(ff19)
		);

	dmg_xor #(
			.L_y(88.45338)
		) dozo_inst (
			.in1(enor),
			.in2(h6_n),
			.y(dozo)
		);

	dmg_xor #(
			.L_y(144.2346)
		) dozy_inst (
			.in1(aryl),
			.in2(agez),
			.y(dozy)
		);

	dmg_not_x1 #(
			.L_y(98.28117)
		) dubo_inst (
			.in(cuty),
			.y(dubo)
		);

	dmg_or2 #(
			.L_y(75.70329)
		) dubu_inst (
			.in1(dyba),
			.in2(fono),
			.y(dubu)
		);

	dmg_not_x2 #(
			.L_y(1116.422)
		) duce_inst (
			.in(acol),
			.y(duce)
		);

	dmg_xor #(
			.L_y(92.1721)
		) ducu_inst (
			.in1(exuk),
			.in2(h6_n),
			.y(ducu)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) dude_inst (
			.in(degu_n),
			.ena(ufeg),
			.y(d1)
		);

	dmg_nor3 #(
			.L_y(492.2032)
		) dudu_inst (
			.in1(ff22_d6_n),
			.in2(ff22_d5),
			.in3(ff22_d4_n),
			.y(dudu)
		);

	dmg_nand4 #(
			.L_y(639.8907)
		) dufe_inst (
			.in1(doso),
			.in2(dupa),
			.in3(abub),
			.in4(acol),
			.y(dufe)
		);

	dmg_not_x2 #(
			.L_y(541.6097)
		) duga_inst (
			.in(dma_run),
			.y(oam_addr_dma_n)
		);

	dmg_not_x1 #(
			.L_y(94.56244)
		) duge_inst (
			.in(cano),
			.y(duge)
		);

	dmg_nor2 #(
			.L_y(2135.89)
		) dugo_inst (
			.in1(egen),
			.in2(ff1x_n),
			.y(ff1e)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) dugu_inst (
			.in(cugo),
			.ena(wave_ram_rd),
			.y(d0)
		);

	dmg_dlatch_ee #(
			.L_q_n(89.51509)
		) duha_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(duha_n)
		);

	dmg_not_if0 #(
			.L_y(4179.61)
		) duho_inst (
			.in(etam),
			.ena_n(bafy),
			.y(ma5_n)
		);

	dmg_drlatch_ee #(
			.L_q(179.5623)
		) duhy_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(duhy),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(1129.438)
		) duja_inst (
			.in1(ff1x_n),
			.in2(esot),
			.y(ff14)
		);

	dmg_nor2 #(
			.L_y(1370.094)
		) duju_inst (
			.in1(ch2_frst),
			.in2(ch2_restart),
			.y(duju)
		);

	dmg_not_x1 #(
			.L_y(144.2346)
		) duka_inst (
			.in(apu_reset),
			.y(duka)
		);

	dmg_not_x1 #(
			.L_y(1860.172)
		) duke_inst (
			.in(cecu),
			.y(duke)
		);

	dmg_drlatch_ee #(
			.L_q(109.9687)
		) duko_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(duko),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(97.7498)
		) dula_inst (
			.in(reset2_n),
			.y(dula)
		);

	dmg_full_add #(
			.L_cout(535.5009),
			.L_sum(811.75)
		) dule_inst (
			.a(dofy),
			.b(eter),
			.cin(dyxe_c),
			.cout(dule_c),
			.sum(sum9)
		);

	dmg_not_x1 #(
			.L_y(276.7814)
		) dulo_inst (
			.in(d7),
			.y(dulo)
		);

	dmg_nand2 #(
			.L_y(1977.844)
		) dulu_inst (
			.in1(nrx4_d6_wr),
			.in2(ff23),
			.y(dulu)
		);

	dmg_oa21 #(
			.L_y(132.8125)
		) dumo_inst (
			.in1(urys),
			.in2(d1),
			.in3(reset2_n),
			.y(dumo)
		);

	dmg_ao2222 #(
			.L_y(274.125)
		) duna_inst (
			.in1(enek),
			.in2(coso),
			.in3(ezoz),
			.in4(cava),
			.in5(dape),
			.in6(cevu),
			.in7(codo),
			.in8(caxo),
			.y(ch1_pwm)
		);

	dmg_nand4 #(
			.L_y(304.9376)
		) duno_inst (
			.in1(acol),
			.in2(abub),
			.in3(afob),
			.in4(doso),
			.y(duno)
		);

	dmg_dlatch_ee #(
			.L_q_n(168.672)
		) duny_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num3),
			.ena_n(feka),
			.q(),
			.q_n(duny_n)
		);

	dmg_not_x2 #(
			.L_y(733.1237)
		) dupa_inst (
			.in(afob),
			.y(dupa)
		);

	dmg_drlatch_ee #(
			.L_q(284.4842)
		) dupe_inst (
			.d(d7),
			.ena(cyho),
			.ena_n(doge),
			.r_n(dado),
			.q(dupe),
			.q_n()
		);

	dmg_nand4 #(
			.L_y(792.8909)
		) dupo_inst (
			.in1(acol),
			.in2(abub),
			.in3(afob),
			.in4(dyte),
			.y(dupo)
		);

	dmg_or2 #(
			.L_y(228.4369)
		) dupy_inst (
			.in1(cure),
			.in2(daxa),
			.y(dupy)
		);

	dmg_nand4 #(
			.L_y(530.9845)
		) dura_inst (
			.in1(doso),
			.in2(afob),
			.in3(deno),
			.in4(acol),
			.y(dura)
		);

	dmg_dffr #(
			.L_q(311.8441),
			.L_q_n(251.5465)
		) dure_inst (
			.d(dure_n),
			.clk(epor_n),
			.r_n(apu_reset4_n),
			.q(dure),
			.q_n(dure_n)
		);

	dmg_nand2 #(
			.L_y(180.8906)
		) duru_inst (
			.in1(ff26),
			.in2(curu),
			.y(duru)
		);

	dmg_drlatch_ee #(
			.L_q(415.1721)
		) dury_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(dury),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(106.2498)
		) dusa_inst (
			.in1(emax),
			.in2(ff1x_n),
			.y(ff1b)
		);

	dmg_xor #(
			.L_y(75.17213)
		) duse_inst (
			.in1(eraz),
			.in2(h0_n),
			.y(duse)
		);

	dmg_not_x1 #(
			.L_y(103.8595)
		) duso_inst (
			.in(evyf),
			.y(duso)
		);

	dmg_nor2 #(
			.L_y(827.1559)
		) dutu_inst (
			.in1(ff1x_n),
			.in2(duvu),
			.y(ff17)
		);

	dmg_not_if0 #(
			.L_y(4098.063)
		) duve_inst (
			.in(dma_a9),
			.ena_n(ahoc),
			.y(ma9_n)
		);

	dmg_not_x1 #(
			.L_y(98.54705)
		) duvo_inst (
			.in(esut),
			.y(duvo)
		);

	dmg_nand4 #(
			.L_y(173.9845)
		) duvu_inst (
			.in1(acol),
			.in2(deno),
			.in3(dupa),
			.in4(doso),
			.y(duvu)
		);

	dmg_dffr #(
			.L_q(771.1094)
		) duwo_inst (
			.d(ch1_pwm),
			.clk(ch1_frst),
			.r_n(apu_reset6_n),
			.q(duwo),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) duza_inst (
			.in(ebex_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a5)
		);

	dmg_xor #(
			.L_y(73.57803)
		) duze_inst (
			.in1(ezuf),
			.in2(h4_n),
			.y(duze)
		);

	dmg_drlatch_ee #(
			.L_q(2542.296),
			.L_q_n(90.8435)
		) duzu_inst (
			.d(d1),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d1),
			.q_n(duzu_n)
		);

	dmg_not_x1 #(
			.L_y(1640.766)
		) dyba_inst (
			.in(byva),
			.y(dyba)
		);

	dmg_dffr #(
			.L_q(328.8437),
			.L_q_n(117.1403)
		) dybe_inst (
			.d(dybe_n),
			.clk(bego_n),
			.r_n(azyb),
			.q(dybe),
			.q_n(dybe_n)
		);

	dmg_oa21 #(
			.L_y(132.5472)
		) dybo_inst (
			.in1(urys),
			.in2(d2),
			.in3(reset2_n),
			.y(dybo)
		);

	dmg_drlatch_ee #(
			.L_q(474.6719)
		) dyby_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(dyby),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(274.1254),
			.L_q_n(296.9695)
		) dyca_inst (
			.d(d7),
			.ena(covu),
			.ena_n(dafo),
			.r_n(apu_reset6_n),
			.q(ff11_d7),
			.q_n(ff11_d7_n)
		);

	dmg_not_x2 #(
			.L_y(1034.078)
		) dydo_inst (
			.in(enut),
			.y(sprite_sel1)
		);

	dmg_nand3 #(
			.L_y(388.0781)
		) dydu_inst (
			.in1(aror),
			.in2(sprite_x_match_l1),
			.in3(sprite_x_match_h1),
			.y(dydu)
		);

	dmg_not_x2 #(
			.L_y(1719.923)
		) dyfa_inst (
			.in(calo_n),
			.y(ch1_1mhz)
		);

	dmg_drlatch_ee #(
			.L_q(274.3911)
		) dyfu_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x1),
			.ena_n(asys),
			.r_n(sprite_rst1),
			.q(dyfu),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(239.5941)
		) dyge_inst (
			.in1(d3),
			.in2(daku),
			.y(dyge)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) dygo_inst (
			.in(dese_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a3)
		);

	dmg_dffsr #(
			.L_q(1470.235)
		) dygy_inst (
			.d(sum8),
			.clk(ch1_freq_upd1),
			.s_n(bugu),
			.r_n(boxu),
			.q(acc_d8),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(668.313)
		) dyhu_inst (
			.in(cemy),
			.y(dyhu)
		);

	dmg_nand3 #(
			.L_y(612.7971)
		) dyka_inst (
			.in1(aror),
			.in2(sprite_x_match_l7),
			.in3(sprite_x_match_h7),
			.y(dyka)
		);

	dmg_not_x1 #(
			.L_y(370.5464)
		) dyke_inst (
			.in(daco),
			.y(dyke)
		);

	dmg_not_x2 #(
			.L_y(415.4377)
		) dyky_inst (
			.in(cpu_wr),
			.y(dyky)
		);

	dmg_not_x2 #(
			.L_y(3954.094)
		) dyla_inst (
			.in(depu),
			.y(dyla)
		);

	dmg_not_x1 #(
			.L_y(111.8281)
		) dylu_inst (
			.in(d6),
			.y(dylu)
		);

	dmg_oa21 #(
			.L_y(132.8123)
		) dyly_inst (
			.in1(urys),
			.in2(d4),
			.in3(reset2_n),
			.y(dyly)
		);

	dmg_xor #(
			.L_y(121.9218)
		) dyme_inst (
			.in1(aryl),
			.in2(exac),
			.y(dyme)
		);

	dmg_not_x1 #(
			.L_y(791.0313)
		) dymo_inst (
			.in(bede),
			.y(dymo)
		);

	dmg_and2 #(
			.L_y(338.4064)
		) dymu_inst (
			.in1(dyve),
			.in2(cagy),
			.y(dymu)
		);

	dmg_not_x1 #(
			.L_y(1529.735)
		) dyna_inst (
			.in(dywe),
			.y(sprite_rst0)
		);

	dmg_tffnl #(
			.L_q(316.3597),
			.L_q_n(289.5315)
		) dynu_inst (
			.d(fova),
			.l(cogu),
			.tclk_n(done),
			.q(dynu),
			.q_n(dynu_n)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) dyny_inst (
			.in(etym_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a3)
		);

	dmg_nor2 #(
			.L_y(281.0313)
		) dypu_inst (
			.in1(caca),
			.in2(daxa),
			.y(dypu)
		);

	dmg_dffsr #(
			.L_q(283.4218),
			.L_q_n(73.84372)
		) dyra_inst (
			.d(degu),
			.clk(dawe),
			.s_n(dela),
			.r_n(dybo),
			.q(dyra),
			.q_n(dyra_n)
		);

	dmg_not_x1 #(
			.L_y(970.3284)
		) dyro_inst (
			.in(deme),
			.y(dyro)
		);

	dmg_nor3 #(
			.L_y(252.6092)
		) dyru_inst (
			.in1(apu_reset),
			.in2(ch1_restart),
			.in3(doka),
			.y(dyru)
		);

	dmg_and2 #(
			.L_y(460.3279)
		) dyry_inst (
			.in1(ff23_d6),
			.in2(ff26_d4_b),
			.y(noise_counter_bypass)
		);

	dmg_not_if0 #(
			.L_y(3221.234)
		) dyso_inst (
			.in(const0),
			.ena_n(abon),
			.y(ma12_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(88.98434)
		) dysy_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y9),
			.ena_n(faka),
			.q(),
			.q_n(dysy_n)
		);

	dmg_nor2 #(
			.L_y(148.7502)
		) dyta_inst (
			.in1(ff16_d6_n),
			.in2(ff16_d7),
			.y(dyta)
		);

	dmg_not_x2 #(
			.L_y(1296.516)
		) dyte_inst (
			.in(a0),
			.y(dyte)
		);

	dmg_not_x2 #(
			.L_y(3588.86)
		) dyty_inst (
			.in(care),
			.y(sprite_save_en_n)
		);

	dmg_nor2 #(
			.L_y(1480.063)
		) dyva_inst (
			.in1(ff1x_n),
			.in2(dupo),
			.y(ff10)
		);

	dmg_dffr_cc #(
			.L_q(209.0468),
			.L_q_n(92.17191)
		) dyve_inst (
			.d(dyve_n),
			.clk(cagy_n),
			.clk_n(cagy),
			.r_n(apu_reset2_n),
			.q(dyve),
			.q_n(dyve_n)
		);

	dmg_or2 #(
			.L_y(42.23428)
		) dywe_inst (
			.in1(dyba),
			.in2(eboj),
			.y(dywe)
		);

	dmg_full_add #(
			.L_cout(330.4377),
			.L_sum(579.8594)
		) dyxe_inst (
			.a(dexe),
			.b(defa),
			.cin(etek_c),
			.cout(dyxe_c),
			.sum(sum8)
		);

	dmg_xor #(
			.L_y(147.9533)
		) dyze_inst (
			.in1(erol),
			.in2(h2_n),
			.y(dyze)
		);

	dmg_not_x1 #(
			.L_y(634.5783)
		) ebeb_inst (
			.in(feka),
			.y(save_sprite_num3)
		);

	dmg_xor #(
			.L_y(119.2658)
		) ebef_inst (
			.in1(desu),
			.in2(h2_n),
			.y(ebef)
		);

	dmg_dlatch_ee #(
			.L_q_n(119.0001)
		) ebex_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(ebex_n)
		);

	dmg_dffr #(
			.L_q(114.75)
		) eboj_inst (
			.d(guva),
			.clk(wuty),
			.r_n(byva),
			.q(eboj),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(214.0939)
		) ebos_inst (
			.in(v0),
			.y(ebos)
		);

	dmg_drlatch_ee #(
			.L_q(114.7498)
		) ebow_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(ebow),
			.q_n()
		);

	dmg_full_add #(
			.L_cout(166.5466),
			.L_sum(96.15612)
		) ecab_inst (
			.a(v2),
			.b(ff42_d2),
			.cin(emux_c),
			.cout(ecab_c),
			.sum(ecab)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) ecal_inst (
			.in(dma_a0),
			.ena_n(ahoc),
			.y(ma0_n)
		);

	dmg_dlatch #(
			.L_q(91.37486),
			.L_q_n(745.6098)
		) eced_inst (
			.d(oam_a_d7_n),
			.ena(oam_data_latch),
			.q(eced),
			.q_n(eced_n)
		);

	dmg_nor2 #(
			.L_y(1311.656)
		) edaf_inst (
			.in1(ff1x_n),
			.in2(damy),
			.y(ff12)
		);

	dmg_not_x6 #(
			.L_y(4951.516)
		) edek_inst (
			.in(fero_n),
			.y(ff26_d4_b)
		);

	dmg_nand2 #(
			.L_y(240.6562)
		) edel_inst (
			.in1(d6),
			.in2(daku),
			.y(edel)
		);

	dmg_not_x1 #(
			.L_y(1001.406)
		) eden_inst (
			.in(bese),
			.y(eden)
		);

	dmg_not_x1 #(
			.L_y(201.0781)
		) edep_inst (
			.in(cyvo_n),
			.y(edep)
		);

	dmg_dffsr #(
			.L_q(206.6562),
			.L_q_n(74.37528)
		) eder_inst (
			.d(erod),
			.clk(epyt),
			.s_n(efef),
			.r_n(eguv),
			.q(eder),
			.q_n(eder_n)
		);

	dmg_dffr_cc_q #(
			.L_q(430.3129)
		) edok_inst (
			.d(dyme),
			.clk(ch1_ld_sum),
			.clk_n(cyne),
			.r_n(sum_reset_n),
			.q(edok)
		);

	dmg_not_if0 #(
			.L_y(1939.86)
		) edol_inst (
			.in(dma_a5),
			.ena_n(oam_addr_dma_n),
			.y(oam_a5_n_tri)
		);

	dmg_tffnl #(
			.L_q_n(214.625)
		) edop_inst (
			.d(d5),
			.l(epek),
			.tclk_n(fylo),
			.q(),
			.q_n(ch4_len_timer_stop)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) edos_inst (
			.in(daty_n),
			.ena_n(beba),
			.y(d0)
		);

	dmg_dffsr #(
			.L_q(1604.109)
		) edul_inst (
			.d(sum3),
			.clk(ch1_freq_upd2),
			.s_n(gope),
			.r_n(gamo),
			.q(acc_d3),
			.q_n()
		);

	dmg_ao22 #(
			.L_y(178.2346)
		) edyf_inst (
			.in1(ff21_d3),
			.in2(ch4_env1),
			.in3(faty_n),
			.in4(ff21_d3_n),
			.y(edyf)
		);

	dmg_not_x1 #(
			.L_y(134.1407)
		) edyl_inst (
			.in(dawa),
			.y(serial_tick_n)
		);

	dmg_xor #(
			.L_y(98.01589)
		) edym_inst (
			.in1(dany),
			.in2(h0_n),
			.y(edym)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) efab_inst (
			.in(erod_n),
			.ena(ufeg),
			.y(d6)
		);

	dmg_oa21 #(
			.L_y(133.3437)
		) efak_inst (
			.in1(urys),
			.in2(d6),
			.in3(reset2_n),
			.y(efak)
		);

	dmg_dffr #(
			.L_q(606.6878),
			.L_q_n(634.0471)
		) efal_inst (
			.d(efal_n),
			.clk(exel_n),
			.r_n(etan),
			.q(efal),
			.q_n(efal_n)
		);

	dmg_dffr #(
			.L_q(730.7339),
			.L_q_n(293.5159)
		) efar_inst (
			.d(efar_n),
			.clk(dero),
			.r_n(etan),
			.q(wave_nibble_sel),
			.q_n(efar_n)
		);

	dmg_nand2 #(
			.L_y(241.9844)
		) efef_inst (
			.in1(d7),
			.in2(daku),
			.y(efef)
		);

	dmg_or2 #(
			.L_y(91.37466)
		) efev_inst (
			.in1(dyba),
			.in2(cedy),
			.y(efev)
		);

	dmg_not_x1 #(
			.L_y(564.7191)
		) efex_inst (
			.in(ch1_ld_sum),
			.y(efex)
		);

	dmg_and2 #(
			.L_y(110.2344)
		) efop_inst (
			.in1(d4),
			.in2(t1t2_n),
			.y(efop)
		);

	dmg_nor2 #(
			.L_y(1580.203)
		) efor_inst (
			.in1(ejyf),
			.in2(apu_reset),
			.y(efor)
		);

	dmg_and2 #(
			.L_y(133.078)
		) efot_inst (
			.in1(ff23_d6),
			.in2(fugo),
			.y(efot)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) efud_inst (
			.in(deba_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a6)
		);

	dmg_not_x2 #(
			.L_y(394.4529)
		) efug_inst (
			.in(getu),
			.y(efug)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) efus_inst (
			.in(ch2_active_n),
			.ena_n(duru),
			.y(d1)
		);

	dmg_dffr #(
			.L_q(574.2811),
			.L_q_n(277.3128)
		) efuz_inst (
			.d(efuz_n),
			.clk(erus_n),
			.r_n(etan),
			.q(efuz),
			.q_n(efuz_n)
		);

	dmg_full_add #(
			.L_cout(220.7347),
			.L_sum(188.5937)
		) efyk_inst (
			.a(v6),
			.b(ff42_d6),
			.cin(daba_c),
			.cout(efyk_c),
			.sum(efyk)
		);

	dmg_nand3 #(
			.L_y(727.0158)
		) efyl_inst (
			.in1(aror),
			.in2(sprite_x_match_l8),
			.in3(sprite_x_match_h8),
			.y(efyl)
		);

	dmg_nand2 #(
			.L_y(602.9689)
		) egad_inst (
			.in1(dovo),
			.in2(ff26_d4_b),
			.y(egad)
		);

	dmg_dffr #(
			.L_q(119.531)
		) egav_inst (
			.d(emol),
			.clk(wuty),
			.r_n(byva),
			.q(egav),
			.q_n()
		);

	dmg_nand4 #(
			.L_y(202.6718)
		) egen_inst (
			.in1(dyte),
			.in2(dupa),
			.in3(deno),
			.in4(duce),
			.y(egen)
		);

	dmg_nor2 #(
			.L_y(281.8281)
		) eget_inst (
			.in1(apu_reset),
			.in2(fare),
			.y(eget)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) egez_inst (
			.in(dma_a1),
			.ena_n(ahoc),
			.y(ma1_n)
		);

	dmg_and2 #(
			.L_y(29.2183)
		) egog_inst (
			.in1(dymu),
			.in2(duge),
			.y(egog)
		);

	dmg_nand3 #(
			.L_y(313.4378)
		) egom_inst (
			.in1(aror),
			.in2(sprite_x_match_l5),
			.in3(sprite_x_match_h5),
			.y(egom)
		);

	dmg_not_x3 #(
			.L_y(891.1723)
		) egor_inst (
			.in(dody),
			.y(ch1_shift_clk)
		);

	dmg_oa21 #(
			.L_y(132.547)
		) eguv_inst (
			.in1(urys),
			.in2(d7),
			.in3(reset2_n),
			.y(eguv)
		);

	dmg_nor2 #(
			.L_y(143.9691)
		) egyp_inst (
			.in1(femu_n),
			.in2(ch1_1mhz),
			.y(egyp)
		);

	dmg_not_x1 #(
			.L_y(467.2341)
		) ehen_inst (
			.in(faka),
			.y(save_sprite_y9)
		);

	dmg_not_x1 #(
			.L_y(978.5628)
		) ehor_inst (
			.in(cavo),
			.y(ehor)
		);

	dmg_oa21 #(
			.L_y(133.0782)
		) ehuj_inst (
			.in1(urys),
			.in2(d5),
			.in3(reset2_n),
			.y(ehuj)
		);

	dmg_drlatch_ee #(
			.L_q(127.7658)
		) ehyn_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(ehyn),
			.q_n()
		);

	dmg_dffsr #(
			.L_q(192.3124),
			.L_q_n(73.31236)
		) ejab_inst (
			.d(dovu),
			.clk(epyt),
			.s_n(elok),
			.r_n(ehuj),
			.q(ejab),
			.q_n(ejab_n)
		);

	dmg_not_x1 #(
			.L_y(1005.657)
		) ejad_inst (
			.in(feve),
			.y(sprite_rst5)
		);

	dmg_xor #(
			.L_y(114.4843)
		) ejaw_inst (
			.in1(fyca),
			.in2(h7_n),
			.y(ejaw)
		);

	dmg_and3 #(
			.L_y(1225.86)
		) ejex_inst (
			.in1(dogo),
			.in2(cofe),
			.in3(cuna),
			.y(ejex)
		);

	dmg_full_add #(
			.L_sum(95.89084)
		) ejok_inst (
			.a(v7),
			.b(ff42_d7),
			.cin(efyk_c),
			.cout(),
			.sum(ejok)
		);

	dmg_xor #(
			.L_y(91.90663)
		) ejot_inst (
			.in1(fazu),
			.in2(h4_n),
			.y(ejot)
		);

	dmg_drlatch_ee #(
			.L_q(295.906)
		) ejuf_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(ejuf),
			.q_n()
		);

	dmg_not_x3 #(
			.L_y(1463.328)
		) ejyb_inst (
			.in(faja),
			.y(ejyb)
		);

	dmg_and2 #(
			.L_y(77.82793)
		) ejyf_inst (
			.in1(dyla),
			.in2(deke),
			.y(ejyf)
		);

	dmg_and4 #(
			.L_y(452.8904)
		) ekag_inst (
			.in1(acol),
			.in2(deno),
			.in3(dupa),
			.in4(dyte),
			.y(ekag)
		);

	dmg_dlatch_ee #(
			.L_q_n(228.4374)
		) ekap_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(ekap_n)
		);

	dmg_nand2 #(
			.L_y(552.2342)
		) ekem_inst (
			.in1(acc_d6),
			.in2(juju),
			.y(ekem)
		);

	dmg_nor4 #(
			.L_y(164.6874)
		) ekes_inst (
			.in1(fuzu),
			.in2(feso),
			.in3(foky),
			.in4(fyva),
			.y(sprite_x_match_l2)
		);

	dmg_and2 #(
			.L_y(3803.485)
		) ekez_inst (
			.in1(ff2x),
			.in2(dofa),
			.y(ff22)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) ekob_inst (
			.in(duzu_n),
			.ena_n(beba),
			.y(d1)
		);

	dmg_dlatch_ee #(
			.L_q_n(96.15612)
		) ekop_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(ekop_n)
		);

	dmg_tffnl #(
			.L_q_n(298.0313)
		) ekov_inst (
			.d(acc_d7),
			.l(dega),
			.tclk_n(feva),
			.q(),
			.q_n(ekov_n)
		);

	dmg_not_x1 #(
			.L_y(849.9994)
		) ekud_inst (
			.in(cape),
			.y(ekud)
		);

	dmg_ao22 #(
			.L_y(141.3123)
		) elaf_inst (
			.in1(ff21_d3),
			.in2(ch4_env2),
			.in3(feru_n),
			.in4(ff21_d3_n),
			.y(elaf)
		);

	dmg_nor3 #(
			.L_y(107.5782)
		) elar_inst (
			.in1(ff22_d6_n),
			.in2(ff22_d5_n),
			.in3(ff22_d4),
			.y(elar)
		);

	dmg_not_x2 #(
			.L_y(714.7968)
		) elas_inst (
			.in(enuf),
			.y(elas)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) elep_inst (
			.in(fefa_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a4)
		);

	dmg_nand2 #(
			.L_y(442.2653)
		) eler_inst (
			.in1(d6),
			.in2(dyla),
			.y(eler)
		);

	dmg_nand2 #(
			.L_y(240.9219)
		) elok_inst (
			.in1(d5),
			.in2(daku),
			.y(elok)
		);

	dmg_dffr #(
			.L_q(4098.595)
		) elox_inst (
			.d(dala_n),
			.clk(ch2_1mhz),
			.r_n(doxa),
			.q(ch2_restart),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(486.3595)
		) eluf_inst (
			.in1(etok),
			.in2(apu_reset),
			.y(eluf)
		);

	dmg_not_if0 #(
			.L_y(1643.156)
		) elug_inst (
			.in(dma_a4),
			.ena_n(oam_addr_dma_n),
			.y(oam_a4_n_tri)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) eluv_inst (
			.in(sck_en_n),
			.ena(ucom),
			.y(d7)
		);

	dmg_dffsr #(
			.L_q(435.6248)
		) elux_inst (
			.d(agez),
			.clk(becy),
			.s_n(bege),
			.r_n(agor),
			.q(elux),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) elyc_inst (
			.in(foxy_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a6)
		);

	dmg_not_x1 #(
			.L_y(222.328)
		) elyg_inst (
			.in(caxu),
			.y(elyg)
		);

	dmg_dffr #(
			.L_q(195.7659),
			.L_q_n(248.3591)
		) elyn_inst (
			.d(elyn_n),
			.clk(goso_n),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a5),
			.q_n(elyn_n)
		);

	dmg_dffr #(
			.L_q(2996.25)
		) elys_inst (
			.d(eder),
			.clk(serial_tick_n),
			.r_n(reset2_n),
			.q(ser_out),
			.q_n()
		);

	dmg_ao2222 #(
			.L_y(330.703)
		) elyx_inst (
			.in1(demo),
			.in2(emof),
			.in3(doke),
			.in4(elar),
			.in5(dale),
			.in6(dudu),
			.in7(dure),
			.in8(etat),
			.y(elyx)
		);

	dmg_and2 #(
			.L_y(110.4997)
		) emar_inst (
			.in1(dyla),
			.in2(dulo),
			.y(emar)
		);

	dmg_nand4 #(
			.L_y(484.2344)
		) emax_inst (
			.in1(doso),
			.in2(dupa),
			.in3(abub),
			.in4(duce),
			.y(emax)
		);

	dmg_drlatch_ee #(
			.L_q(139.1877),
			.L_q_n(568.7028)
		) emer_inst (
			.d(d6),
			.ena(duso),
			.ena_n(evyf),
			.r_n(fazo),
			.q(ff19_d6),
			.q_n(ff19_d6_n)
		);

	dmg_nor2 #(
			.L_y(159.1091)
		) emet_inst (
			.in1(ch4_restart),
			.in2(apu_reset),
			.y(emet)
		);

	dmg_nor3 #(
			.L_y(137.3285)
		) emof_inst (
			.in1(ff22_d6_n),
			.in2(ff22_d5_n),
			.in3(ff22_d4_n),
			.y(emof)
		);

	dmg_drlatch_ee #(
			.L_q(132.5466),
			.L_q_n(417.5625)
		) emok_inst (
			.d(d0),
			.ena(daco),
			.ena_n(dyke),
			.r_n(fexo),
			.q(ff21_d0),
			.q_n(ff21_d0_n)
		);

	dmg_nor2 #(
			.L_y(301.2186)
		) emol_inst (
			.in1(dego),
			.in2(fuma),
			.y(emol)
		);

	dmg_nor2 #(
			.L_y(860.8911)
		) emor_inst (
			.in1(ff1x_n),
			.in2(exat),
			.y(ff1a)
		);

	dmg_nand4 #(
			.L_y(123.7809)
		) emos_inst (
			.in1(doso),
			.in2(afob),
			.in3(deno),
			.in4(duce),
			.y(emos)
		);

	dmg_tffnl #(
			.L_q(271.9998),
			.L_q_n(153.7971)
		) emus_inst (
			.d(acc_d8),
			.l(dako),
			.tclk_n(deru),
			.q(emus),
			.q_n(emus_n)
		);

	dmg_not_x1 #(
			.L_y(752.2505)
		) emut_inst (
			.in(dery),
			.y(emut)
		);

	dmg_full_add #(
			.L_cout(146.6247),
			.L_sum(132.8125)
		) emux_inst (
			.a(v1),
			.b(ff42_d1),
			.cin(fafo_c),
			.cout(emux_c),
			.sum(emux)
		);

	dmg_xor #(
			.L_y(82.60939)
		) emyb_inst (
			.in1(duko),
			.in2(h1_n),
			.y(emyb)
		);

	dmg_nor5 #(
			.L_y(269.609)
		) emyr_inst (
			.in1(ff17_d3),
			.in2(ch2_env0),
			.in3(ch2_env1),
			.in4(ch2_env2),
			.in5(ch2_env3),
			.y(emyr)
		);

	dmg_drlatch_ee #(
			.L_q(278.9064)
		) enad_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(enad),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) enap_inst (
			.in(devy_n),
			.ena_n(sprite_sel3),
			.y(oam_render_a2)
		);

	dmg_nor2 #(
			.L_y(94.03107)
		) enec_inst (
			.in1(ch4_restart),
			.in2(ch4_eg_tick),
			.y(enec)
		);

	dmg_full_add #(
			.L_cout(132.2811),
			.L_sum(100.9374)
		) enef_inst (
			.a(dasa),
			.b(xegu_n),
			.cin(eruc_c),
			.cout(enef_c),
			.sum(enef)
		);

	dmg_and2 #(
			.L_y(139.4533)
		) enek_inst (
			.in1(ezoz),
			.in2(duvo),
			.y(enek)
		);

	dmg_not_x1 #(
			.L_y(634.3124)
		) enob_inst (
			.in(dyhu),
			.y(enob)
		);

	dmg_nor2 #(
			.L_y(604.2969)
		) enok_inst (
			.in1(apu_reset),
			.in2(ereg),
			.y(enok)
		);

	dmg_drlatch_ee #(
			.L_q(223.3905)
		) enor_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(enor),
			.q_n()
		);

	dmg_and2 #(
			.L_y(803.2502)
		) enuf_inst (
			.in1(ff17),
			.in2(apu_wr),
			.y(enuf)
		);

	dmg_or2 #(
			.L_y(350.6249)
		) enur_inst (
			.in1(apu_reset),
			.in2(ch4_restart),
			.y(enur)
		);

	dmg_nor2 #(
			.L_y(419.1564)
		) enut_inst (
			.in1(dydu),
			.in2(geze),
			.y(enut)
		);

	dmg_not_x1 #(
			.L_y(355.1401)
		) epek_inst (
			.in(caze),
			.y(epek)
		);

	dmg_dffr #(
			.L_q(507.8752),
			.L_q_n(159.3746)
		) epor_inst (
			.d(epor_n),
			.clk(ezef_n),
			.r_n(apu_reset4_n),
			.q(epor),
			.q_n(epor_n)
		);

	dmg_nor2 #(
			.L_y(119.2654)
		) epuk_inst (
			.in1(apu_reset),
			.in2(ch1_ld_sum),
			.y(epuk)
		);

	dmg_drlatch_ee #(
			.L_q(91.10938)
		) epum_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(epum),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(571.6251)
		) epyk_inst (
			.in1(ch1_frst),
			.in2(ch1_restart),
			.y(epyk)
		);

	dmg_dffr_cc_q #(
			.L_q(373.4687)
		) epyr_inst (
			.d(fure),
			.clk(ch1_ld_sum),
			.clk_n(cyne),
			.r_n(sum_reset_n),
			.q(epyr)
		);

	dmg_not_x2 #(
			.L_y(1037.532)
		) epyt_inst (
			.in(serial_tick_n),
			.y(epyt)
		);

	dmg_nand2 #(
			.L_y(551.1716)
		) epyx_inst (
			.in1(apu_wr),
			.in2(ff1e),
			.y(epyx)
		);

	dmg_not_if0 #(
			.L_y(5085.921)
		) eraf_inst (
			.in(dma_a10),
			.ena_n(ahoc),
			.y(ma10_n)
		);

	dmg_tffnl #(
			.L_q_n(700.453)
		) eram_inst (
			.d(d5),
			.l(bepe),
			.tclk_n(cura),
			.q(),
			.q_n(ch1_len_timer_stop)
		);

	dmg_nand5 #(
			.L_y(119.7969)
		) erat_inst (
			.in1(ff17_d3),
			.in2(ch2_env0),
			.in3(ch2_env1),
			.in4(ch2_env2),
			.in5(ch2_env3),
			.y(erat)
		);

	dmg_drlatch_ee #(
			.L_q(109.703)
		) eraz_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(eraz),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(150.0782)
		) ered_inst (
			.in(ch3_active),
			.y(ch3_active_n)
		);

	dmg_and2 #(
			.L_y(384.6245)
		) ereg_inst (
			.in1(juju),
			.in2(debo),
			.y(ereg)
		);

	dmg_not_if0 #(
			.L_y(3991.015)
		) erew_inst (
			.in(dma_a7),
			.ena_n(ahoc),
			.y(ma7_n)
		);

	dmg_dffsr #(
			.L_q(192.5779),
			.L_q_n(73.04707)
		) erod_inst (
			.d(ejab),
			.clk(epyt),
			.s_n(edel),
			.r_n(efak),
			.q(erod),
			.q_n(erod_n)
		);

	dmg_not_x1 #(
			.L_y(681.5934)
		) erog_inst (
			.in(duju),
			.y(erog)
		);

	dmg_drlatch_ee #(
			.L_q(118.4685)
		) erol_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(erol),
			.q_n()
		);

	dmg_dffr_cc #(
			.L_q(307.3277),
			.L_q_n(273.0623)
		) eros_inst (
			.d(eros_n),
			.clk(esut_n),
			.clk_n(esut),
			.r_n(apu_reset6_n),
			.q(eros),
			.q_n(eros_n)
		);

	dmg_nor_latch #(
			.L_q(173.4531)
		) erox_inst (
			.s(fyno),
			.r(enur),
			.q(ch4_eg_stop),
			.q_n()
		);

	dmg_full_add #(
			.L_cout(221.0002),
			.L_sum(114.4845)
		) eruc_inst (
			.a(ebos),
			.b(xuso_n),
			.cin(const0),
			.cout(eruc_c),
			.sum(eruc)
		);

	dmg_not_x1 #(
			.L_y(277.3126)
		) erum_inst (
			.in(apu_reset),
			.y(erum)
		);

	dmg_dffr #(
			.L_q(564.7186),
			.L_q_n(269.6092)
		) erus_inst (
			.d(erus_n),
			.clk(efar_n),
			.r_n(etan),
			.q(erus),
			.q_n(erus_n)
		);

	dmg_dffr #(
			.L_q(96.68788),
			.L_q_n(221.5312)
		) erut_inst (
			.d(erut_n),
			.clk(dete_n),
			.r_n(apu_reset4_n),
			.q(erut),
			.q_n(erut_n)
		);

	dmg_tffnl #(
			.L_q(563.6566)
		) eryc_inst (
			.d(d0),
			.l(bymo),
			.tclk_n(dyro),
			.q(eryc),
			.q_n()
		);

	dmg_or2 #(
			.L_y(291.1252)
		) eryf_inst (
			.in1(dary),
			.in2(elyx),
			.y(eryf)
		);

	dmg_xor #(
			.L_y(159.906)
		) esaj_inst (
			.in1(faxe),
			.in2(h5_n),
			.y(esaj)
		);

	dmg_nor2 #(
			.L_y(423.1406)
		) esel_inst (
			.in1(emar),
			.in2(apu_reset),
			.y(esel)
		);

	dmg_dffr #(
			.L_q(251.0155),
			.L_q_n(125.6405)
		) esep_inst (
			.d(esep_n),
			.clk(dere_n),
			.r_n(apu_reset4_n),
			.q(esep),
			.q_n(esep_n)
		);

	dmg_nand4 #(
			.L_y(915.6095)
		) esot_inst (
			.in1(acol),
			.in2(deno),
			.in3(afob),
			.in4(dyte),
			.y(esot)
		);

	dmg_not_x2 #(
			.L_y(411.7188)
		) esur_inst (
			.in(dosa),
			.y(esur)
		);

	dmg_dffr #(
			.L_q(295.1096),
			.L_q_n(314.2344)
		) esut_inst (
			.d(esut_n),
			.clk(dajo),
			.r_n(apu_reset6_n),
			.q(esut),
			.q_n(esut_n)
		);

	dmg_or3 #(
			.L_y(139.4535)
		) esyk_inst (
			.in1(apu_reset),
			.in2(dora),
			.in3(ch2_amp_en_n),
			.y(ch2_stop)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) etad_inst (
			.in(fysu_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a5)
		);

	dmg_dffr #(
			.L_q_n(215.9531)
		) etaf_inst (
			.d(d7),
			.clk(uwam),
			.r_n(caby),
			.q(),
			.q_n(sck_en_n)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) etak_inst (
			.in(eder_n),
			.ena(ufeg),
			.y(d7)
		);

	dmg_full_add #(
			.L_cout(118.2028),
			.L_sum(122.9845)
		) etam_inst (
			.a(v3),
			.b(ff42_d3),
			.cin(ecab_c),
			.cout(etam_c),
			.sum(etam)
		);

	dmg_nor2 #(
			.L_y(1139.265)
		) etan_inst (
			.in1(ch3_restart),
			.in2(fety),
			.y(etan)
		);

	dmg_drlatch_ee #(
			.L_q(638.0312)
		) etap_inst (
			.d(d7),
			.ena(daxu),
			.ena_n(deta),
			.r_n(dera),
			.q(etap),
			.q_n()
		);

	dmg_nor3 #(
			.L_y(207.9844)
		) etar_inst (
			.in1(ff22_d6),
			.in2(ff22_d5_n),
			.in3(ff22_d4),
			.y(etar)
		);

	dmg_nor3 #(
			.L_y(531.7814)
		) etat_inst (
			.in1(ff22_d6_n),
			.in2(ff22_d5),
			.in3(ff22_d4),
			.y(etat)
		);

	dmg_dlatch_ee #(
			.L_q_n(115.0155)
		) etav_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(etav_n)
		);

	dmg_ao22 #(
			.L_y(127.766)
		) etef_inst (
			.in1(ff21_d3),
			.in2(ch4_env0),
			.in3(feko_n),
			.in4(ff21_d3_n),
			.y(etef)
		);

	dmg_not_if0 #(
			.L_y(4309.501)
		) eteg_inst (
			.in(dma_a6),
			.ena_n(ahoc),
			.y(ma6_n)
		);

	dmg_full_add #(
			.L_cout(239.8593),
			.L_sum(1415.782)
		) etek_inst (
			.a(dele),
			.b(edok),
			.cin(fego_c),
			.cout(etek_c),
			.sum(sum7)
		);

	dmg_dffr_cc_q #(
			.L_q(98.28157)
		) eter_inst (
			.d(dozy),
			.clk(ch1_ld_sum),
			.clk_n(cyne),
			.r_n(sum_reset_n),
			.q(eter)
		);

	dmg_and2 #(
			.L_y(137.8592)
		) etok_inst (
			.in1(dyla),
			.in2(dylu),
			.y(etok)
		);

	dmg_nand2 #(
			.L_y(445.1876)
		) etol_inst (
			.in1(d7),
			.in2(dyla),
			.y(etol)
		);

	dmg_nor3 #(
			.L_y(218.3434)
		) etov_inst (
			.in1(ff22_d6),
			.in2(ff22_d5),
			.in3(ff22_d4),
			.y(etov)
		);

	dmg_and2 #(
			.L_y(233.4844)
		) etuc_inst (
			.in1(apu_wr),
			.in2(ff26),
			.y(etuc)
		);

	dmg_nand4 #(
			.L_y(507.0781)
		) etuf_inst (
			.in1(acol),
			.in2(abub),
			.in3(dupa),
			.in4(doso),
			.y(etuf)
		);

	dmg_not_x1 #(
			.L_y(524.3439)
		) etuk_inst (
			.in(gyko),
			.y(etuk)
		);

	dmg_ao22 #(
			.L_y(128.2969)
		) etup_inst (
			.in1(ff17_d3),
			.in2(ch2_env1),
			.in3(fete_n),
			.in4(ff17_d3_n),
			.y(etup)
		);

	dmg_not_x1 #(
			.L_y(119.2658)
		) etuv_inst (
			.in(d3),
			.y(etuv)
		);

	dmg_drlatch_ee #(
			.L_q(155.6563),
			.L_q_n(631.9221)
		) etyj_inst (
			.d(d1),
			.ena(daco),
			.ena_n(dyke),
			.r_n(fexo),
			.q(ff21_d1),
			.q_n(ff21_d1_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(100.6719)
		) etym_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(etym_n)
		);

	dmg_ao222222 #(
			.L_y(191.7809)
		) etyr_inst (
			.in1(esep),
			.in2(dudu),
			.in3(dere),
			.in4(etat),
			.in5(dota),
			.in6(fura),
			.in7(erut),
			.in8(etar),
			.in9(dete),
			.in10(ever),
			.in11(dose),
			.in12(etov),
			.y(etyr)
		);

	dmg_dffsr #(
			.L_q(1497.063)
		) evab_inst (
			.d(sum9),
			.clk(ch1_freq_upd1),
			.s_n(budo),
			.r_n(bovu),
			.q(acc_d9),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) evad_inst (
			.in(fafo),
			.ena_n(beje),
			.y(ma1_n)
		);

	dmg_not_x2 #(
			.L_y(1318.828)
		) evaj_inst (
			.in(dypu),
			.y(evaj)
		);

	dmg_tffnl #(
			.L_q(387.8127),
			.L_q_n(185.1402)
		) evak_inst (
			.d(acc_d9),
			.l(dako),
			.tclk_n(emus),
			.q(evak),
			.q_n(evak_n)
		);

	dmg_not_if0 #(
			.L_y(4338.984)
		) evax_inst (
			.in(dma_a8),
			.ena_n(ahoc),
			.y(ma8_n)
		);

	dmg_nor3 #(
			.L_y(210.3754)
		) ever_inst (
			.in1(ff22_d6),
			.in2(ff22_d5),
			.in3(ff22_d4_n),
			.y(ever)
		);

	dmg_and2 #(
			.L_y(79.15654)
		) evof_inst (
			.in1(juju),
			.in2(fohy),
			.y(evof)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) evok_inst (
			.in(ejab_n),
			.ena(ufeg),
			.y(d5)
		);

	dmg_nor2 #(
			.L_y(155.1249)
		) evol_inst (
			.in1(bexa),
			.in2(ch1_restart_dly),
			.y(evol)
		);

	dmg_ao222 #(
			.L_y(577.7344)
		) evug_inst (
			.in1(wave_play_d1),
			.in2(gege),
			.in3(wave_play_d2),
			.in4(goka),
			.in5(wave_play_d3),
			.in6(gemy),
			.y(evug)
		);

	dmg_or2 #(
			.L_y(564.4531)
		) evur_inst (
			.in1(daro),
			.in2(dubo),
			.y(evur)
		);

	dmg_nand2 #(
			.L_y(110.4997)
		) evyf_inst (
			.in1(nrx4_d6_wr),
			.in2(ff19),
			.y(evyf)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) evyt_inst (
			.in(fuzo_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a7)
		);

	dmg_nor4 #(
			.L_y(101.2033)
		) ewam_inst (
			.in1(edym),
			.in2(emyb),
			.in3(ebef),
			.in4(ewok),
			.y(sprite_x_match_l1)
		);

	dmg_xor #(
			.L_y(130.422)
		) ewok_inst (
			.in1(dazo),
			.in2(h3_n),
			.y(ewok)
		);

	dmg_not_x1 #(
			.L_y(861.422)
		) ewot_inst (
			.in(duke),
			.y(ewot)
		);

	dmg_xor #(
			.L_y(78.09381)
		) ewud_inst (
			.in1(fede),
			.in2(h7_n),
			.y(ewud)
		);

	dmg_dffsr #(
			.L_q(357.2656)
		) exac_inst (
			.d(elux),
			.clk(becy),
			.s_n(dace),
			.r_n(bewo),
			.q(exac),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(223.1252)
		) exap_inst (
			.d(acc_d6),
			.clk(ch1_ld_sum),
			.clk_n(cehe),
			.r_n(sum_reset_n),
			.q(exap)
		);

	dmg_nand4 #(
			.L_y(140.2498)
		) exat_inst (
			.in1(duce),
			.in2(abub),
			.in3(dupa),
			.in4(dyte),
			.y(exat)
		);

	dmg_dffr #(
			.L_q(615.4531),
			.L_q_n(252.6092)
		) exel_inst (
			.d(exel_n),
			.clk(efuz_n),
			.r_n(etan),
			.q(exel),
			.q_n(exel_n)
		);

	dmg_ao2222 #(
			.L_y(188.8596)
		) exes_inst (
			.in1(egog),
			.in2(domo),
			.in3(dymu),
			.in4(dyta),
			.in5(dyve),
			.in6(doju),
			.in7(dare),
			.in8(dove),
			.y(ch2_pwm)
		);

	dmg_and2 #(
			.L_y(609.8751)
		) exuc_inst (
			.in1(ff18),
			.in2(apu_wr),
			.y(exuc)
		);

	dmg_drlatch_ee #(
			.L_q(122.9841)
		) exuk_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(exuk),
			.q_n()
		);

	dmg_dffr #(
			.L_q(283.6873)
		) exuq_inst (
			.d(foxa),
			.clk(wuty),
			.r_n(byva),
			.q(exuq),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3221.234)
		) exyf_inst (
			.in(dma_a12),
			.ena_n(ahoc),
			.y(ma12_n)
		);

	dmg_not_x1 #(
			.L_y(1341.407)
		) exyr_inst (
			.in(cyla),
			.y(save_sprite_x5)
		);

	dmg_ao222 #(
			.L_y(401.8908)
		) ezag_inst (
			.in1(wave_play_d0),
			.in2(gege),
			.in3(wave_play_d1),
			.in4(goka),
			.in5(wave_play_d2),
			.in6(gemy),
			.y(ezag)
		);

	dmg_not_x1 #(
			.L_y(230.5625)
		) ezas_inst (
			.in(fozu),
			.y(ezas)
		);

	dmg_dffr #(
			.L_q(434.828)
		) ezec_inst (
			.d(dupe),
			.clk(apu_phi),
			.r_n(duka),
			.q(ch1_start),
			.q_n()
		);

	dmg_dffr #(
			.L_q(243.8436),
			.L_q_n(480.516)
		) ezef_inst (
			.d(ezef_n),
			.clk(deko_n),
			.r_n(apu_reset4_n),
			.q(ezef),
			.q_n(ezef_n)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) ezoc_inst (
			.in(fogo_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a4)
		);

	dmg_tffnl #(
			.L_q(374.2659),
			.L_q_n(273.5938)
		) ezof_inst (
			.d(fedy),
			.l(cogu),
			.tclk_n(dynu),
			.q(ezof),
			.q_n(ezof_n)
		);

	dmg_and2 #(
			.L_y(543.734)
		) ezoz_inst (
			.in1(dape),
			.in2(eros),
			.y(ezoz)
		);

	dmg_drlatch_ee #(
			.L_q(282.6246)
		) ezuf_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(ezuf),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(201.0783)
		) ezuk_inst (
			.in1(apu_reset),
			.in2(evof),
			.y(ezuk)
		);

	dmg_mux #(
			.L_y(111.8283)
		) ezul_inst (
			.sel(noise_counter_bypass),
			.d1(ch4_lfsr_clk1),
			.d0(lfsr_out),
			.y(ezul)
		);

	dmg_drlatch_ee #(
			.L_q(115.547),
			.L_q_n(470.6875)
		) ezyk_inst (
			.d(d2),
			.ena(daco),
			.ena_n(dyke),
			.r_n(fexo),
			.q(ff21_d2),
			.q_n(ff21_d2_n)
		);

	dmg_not_x1 #(
			.L_y(412.7813)
		) fabo_inst (
			.in(ch3_2mhz),
			.y(fabo)
		);

	dmg_dffsr #(
			.L_q(156.4535)
		) fabu_inst (
			.d(jefa),
			.clk(ch1_shift_clk),
			.s_n(hozu),
			.r_n(jado),
			.q(fabu),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(1643.156)
		) faby_inst (
			.in(oam_render_a4),
			.ena_n(oam_addr_render_n),
			.y(oam_a4_n_tri)
		);

	dmg_not_if0 #(
			.L_y(1939.86)
		) faco_inst (
			.in(oam_render_a5),
			.ena_n(oam_addr_render_n),
			.y(oam_a5_n_tri)
		);

	dmg_not_x2 #(
			.L_y(2096.579)
		) fado_inst (
			.in(guze),
			.y(sprite_sel9)
		);

	dmg_half_add #(
			.L_cout(164.1565),
			.L_sum(86.59381)
		) fafo_inst (
			.a(v0),
			.b(ff42_d0),
			.cout(fafo_c),
			.sum(fafo)
		);

	dmg_not_if0 #(
			.L_y(1315.906)
		) fago_inst (
			.in(dma_a2),
			.ena_n(oam_addr_dma_n),
			.y(oam_a2_n_tri)
		);

	dmg_dffr #(
			.L_q(184.0779),
			.L_q_n(426.328)
		) faha_inst (
			.d(faha_n),
			.clk(elyn_n),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a6),
			.q_n(faha_n)
		);

	dmg_not_x1 #(
			.L_y(137.3281)
		) faja_inst (
			.in(ch1_shift_clk),
			.y(faja)
		);

	dmg_not_x1 #(
			.L_y(101.4688)
		) faju_inst (
			.in(gyra),
			.y(faju)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) fajy_inst (
			.in(dynu_n),
			.ena_n(futy),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(477.8597)
		) faka_inst (
			.in(decu),
			.y(faka)
		);

	dmg_nor2 #(
			.L_y(106.2504)
		) fako_inst (
			.in1(apu_reset),
			.in2(foba),
			.y(fako)
		);

	dmg_not_if0 #(
			.L_y(1939.86)
		) faku_inst (
			.in(oam_parse_a5),
			.ena_n(oam_addr_parse_n),
			.y(oam_a5_n_tri)
		);

	dmg_nor2 #(
			.L_y(436.1566)
		) fale_inst (
			.in1(apu_reset),
			.in2(gora),
			.y(fale)
		);

	dmg_not_x1 #(
			.L_y(329.3748)
		) falu_inst (
			.in(gapo_n),
			.y(falu)
		);

	dmg_not_x2 #(
			.L_y(2459.687)
		) fame_inst (
			.in(emol),
			.y(sprite_sel2)
		);

	dmg_not_if0 #(
			.L_y(4222.375)
		) famu_inst (
			.in(gejy),
			.ena_n(abon),
			.y(ma4_n)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) fana_inst (
			.in(exel_n),
			.ena_n(geno),
			.y(d3)
		);

	dmg_nand2 #(
			.L_y(2725.578)
		) fape_inst (
			.in1(foge),
			.in2(ff26_d4_b),
			.y(fape)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) fapy_inst (
			.in(efar_n),
			.ena_n(geno),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(453.953)
		) fare_inst (
			.d(ch1_restart),
			.clk(ch1_1mhz),
			.r_n(erum),
			.q(fare),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) faro_inst (
			.in(erus_n),
			.ena_n(geno),
			.y(d1)
		);

	dmg_ao22 #(
			.L_y(122.7186)
		) faru_inst (
			.in1(ff17_d3),
			.in2(ch2_env0),
			.in3(feno_n),
			.in4(ff17_d3_n),
			.y(faru)
		);

	dmg_nand2 #(
			.L_y(125.1093)
		) fasy_inst (
			.in1(ff1a_rd),
			.in2(ff1a),
			.y(fasy)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) fate_inst (
			.in(ch3_active_n),
			.ena_n(fewa),
			.y(d2)
		);

	dmg_tffnl #(
			.L_q(782.2655),
			.L_q_n(192.3122)
		) faty_inst (
			.d(ff21_d5),
			.l(ch4_restart),
			.tclk_n(etef),
			.q(ch4_env1),
			.q_n(faty_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) fava_inst (
			.in(done_n),
			.ena_n(futy),
			.y(d0)
		);

	dmg_tffnl #(
			.L_q(246.4998)
		) fave_inst (
			.d(d6),
			.l(emut),
			.tclk_n(foro),
			.q(fave),
			.q_n()
		);

	dmg_or2 #(
			.L_y(374.5314)
		) favo_inst (
			.in1(gyte),
			.in2(wyla),
			.y(favo)
		);

	dmg_tffnl #(
			.L_q(266.9532)
		) favy_inst (
			.d(d1),
			.l(dotu),
			.tclk_n(dano),
			.q(favy),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(133.6093)
		) faxa_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(faxa),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(100.9378)
		) faxe_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(faxe),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(120.8595)
		) faxo_inst (
			.d(acc_d5),
			.clk(ch1_ld_sum),
			.clk_n(efex),
			.r_n(sum_reset_n),
			.q(faxo)
		);

	dmg_not_x1 #(
			.L_y(146.3592)
		) fazo_inst (
			.in(apu_reset),
			.y(fazo)
		);

	dmg_drlatch_ee #(
			.L_q(91.64055)
		) fazu_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(fazu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(281.8282)
		) feby_inst (
			.in(apu_reset),
			.y(feby)
		);

	dmg_full_add #(
			.L_cout(239.0629),
			.L_sum(286.3439)
		) feco_inst (
			.a(fuky),
			.b(yjex_n),
			.cin(enef_c),
			.cout(feco_c),
			.sum(feco)
		);

	dmg_drlatch_ee #(
			.L_q(91.10918)
		) fede_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x7),
			.ena_n(gecy),
			.r_n(sprite_rst7),
			.q(fede),
			.q_n()
		);

	dmg_dffsr #(
			.L_q(378.7819)
		) fedo_inst (
			.d(exac),
			.clk(ejyb),
			.s_n(ekem),
			.r_n(enok),
			.q(fedo),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(219.1408)
		) fedy_inst (
			.d(d2),
			.ena(dosa),
			.ena_n(esur),
			.r_n(hude),
			.q(fedy),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(91.90602)
		) fefa_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(fefa_n)
		);

	dmg_not_x1 #(
			.L_y(526.7344)
		) fefo_inst (
			.in(gyvo),
			.y(fefo)
		);

	dmg_nand5 #(
			.L_y(241.9846)
		) fefy_inst (
			.in1(xage),
			.in2(yloz),
			.in3(dego),
			.in4(dydu),
			.in5(ydug),
			.y(fefy)
		);

	dmg_and2 #(
			.L_y(93.23463)
		) fega_inst (
			.in1(dyla),
			.in2(etuv),
			.y(fega)
		);

	dmg_full_add #(
			.L_cout(178.2346),
			.L_sum(1630.672)
		) fego_inst (
			.a(exap),
			.b(epyr),
			.cin(geva_c),
			.cout(fego_c),
			.sum(sum6)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) fegu_inst (
			.in(ezof_n),
			.ena_n(futy),
			.y(d2)
		);

	dmg_or3 #(
			.L_y(242.7812)
		) fegy_inst (
			.in1(apu_reset),
			.in2(efot),
			.in3(ch4_amp_en_n),
			.y(fegy)
		);

	dmg_nor4 #(
			.L_y(109.4374)
		) feha_inst (
			.in1(goho),
			.in2(gasu),
			.in3(gabu),
			.in4(gafe),
			.y(sprite_x_match_l8)
		);

	dmg_not_x1 #(
			.L_y(1152.547)
		) feka_inst (
			.in(gusa),
			.y(feka)
		);

	dmg_tffnl #(
			.L_q(1046.296),
			.L_q_n(173.4535)
		) feko_inst (
			.d(ff21_d4),
			.l(ch4_restart),
			.tclk_n(fole),
			.q(ch4_env0),
			.q_n(feko_n)
		);

	dmg_dffr #(
			.L_q(4484.812)
		) feku_inst (
			.d(fyfo_n),
			.clk(ch1_1mhz),
			.r_n(eget),
			.q(ch1_restart),
			.q_n()
		);

	dmg_or3 #(
			.L_y(283.6869)
		) felo_inst (
			.in1(ch4_eg_tick),
			.in2(ch4_eg_disable),
			.in3(ch4_eg_stop),
			.y(felo)
		);

	dmg_dffsr #(
			.L_q(1761.624)
		) fely_inst (
			.d(sum4),
			.clk(ch1_freq_upd2),
			.s_n(kovu),
			.r_n(kapo),
			.q(acc_d4),
			.q_n()
		);

	dmg_mux #(
			.L_y(2411.61)
		) feme_inst (
			.sel(ff22_d7),
			.d1(etyr),
			.d0(eryf),
			.y(ch4_lfsr_clk1)
		);

	dmg_not_x1 #(
			.L_y(151.6721)
		) femo_inst (
			.in(v6),
			.y(femo)
		);

	dmg_nand_latch #(
			.L_q_n(110.5001)
		) femu_inst (
			.s_n(evol),
			.r_n(epuk),
			.q(),
			.q_n(femu_n)
		);

	dmg_nor2 #(
			.L_y(138.3904)
		) femy_inst (
			.in1(ch1_amp_en_n),
			.in2(apu_reset),
			.y(femy)
		);

	dmg_tffnl #(
			.L_q(2101.094)
		) fena_inst (
			.d(ff17_d7),
			.l(ch2_restart),
			.tclk_n(fopy),
			.q(ch2_env3),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(88.71906)
		) fene_inst (
			.in(epyx),
			.y(fene)
		);

	dmg_tffnl #(
			.L_q(1809.969),
			.L_q_n(148.7493)
		) feno_inst (
			.d(ff17_d4),
			.l(ch2_restart),
			.tclk_n(gafa),
			.q(ch2_env0),
			.q_n(feno_n)
		);

	dmg_nor2 #(
			.L_y(770.8436)
		) feny_inst (
			.in1(emos),
			.in2(ff1x_n),
			.y(ff1d)
		);

	dmg_or2 #(
			.L_y(2886.016)
		) fepo_inst (
			.in1(fefy),
			.in2(fove),
			.y(sprite_x_match)
		);

	dmg_not_x1 #(
			.L_y(142.6407)
		) fepu_inst (
			.in(v4),
			.y(fepu)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) fera_inst (
			.in(efal_n),
			.ena_n(geno),
			.y(d4)
		);

	dmg_drlatch_ee #(
			.L_q(3224.422),
			.L_q_n(250.7501)
		) fero_inst (
			.d(efop),
			.ena(etuc),
			.ena_n(foku),
			.r_n(ff24_ff25_ff26_reset_n),
			.q(ff26_d4),
			.q_n(fero_n)
		);

	dmg_tffnl #(
			.L_q(751.1879),
			.L_q_n(146.6247)
		) feru_inst (
			.d(ff21_d6),
			.l(ch4_restart),
			.tclk_n(edyf),
			.q(ch4_env2),
			.q_n(feru_n)
		);

	dmg_not_x1 #(
			.L_y(97.21905)
		) fery_inst (
			.in(ff18),
			.y(fery)
		);

	dmg_not_if0 #(
			.L_y(936.8593)
		) fesa_inst (
			.in(dma_a1),
			.ena_n(oam_addr_dma_n),
			.y(oam_a1_n_tri)
		);

	dmg_xor #(
			.L_y(109.9687)
		) feso_inst (
			.in1(fyty),
			.in2(h1_n),
			.y(feso)
		);

	dmg_drlatch_ee #(
			.L_q(265.625)
		) fesy_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(fesy),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(488.7498),
			.L_q_n(706.828)
		) feta_inst (
			.d(d4),
			.ena(getu),
			.ena_n(efug),
			.r_n(apu_reset4_n),
			.q(ff22_d4),
			.q_n(ff22_d4_n)
		);

	dmg_tffnl #(
			.L_q(1886.734),
			.L_q_n(232.953)
		) fete_inst (
			.d(ff17_d5),
			.l(ch2_restart),
			.tclk_n(faru),
			.q(ch2_env1),
			.q_n(fete_n)
		);

	dmg_and4 #(
			.L_y(1046.828)
		) feto_inst (
			.in1(oam_parse_a2),
			.in2(oam_parse_a3),
			.in3(oam_parse_a7),
			.in4(oam_parse_a4),
			.y(last_sprite)
		);

	dmg_not_if0 #(
			.L_y(1592.953)
		) fetu_inst (
			.in(dma_a7),
			.ena_n(oam_addr_dma_n),
			.y(oam_a7_n_tri)
		);

	dmg_dffr #(
			.L_q(227.375),
			.L_q_n(156.7188)
		) fety_inst (
			.d(fety_n),
			.clk(efal_n),
			.r_n(gyry),
			.q(fety),
			.q_n(fety_n)
		);

	dmg_tffnl #(
			.L_q(150.8752),
			.L_q_n(151.9375)
		) feva_inst (
			.d(acc_d6),
			.l(dega),
			.tclk_n(hyke),
			.q(feva),
			.q_n(feva_n)
		);

	dmg_or2 #(
			.L_y(105.7186)
		) feve_inst (
			.in1(dyba),
			.in2(wafy),
			.y(feve)
		);

	dmg_not_x1 #(
			.L_y(574.5477)
		) fevo_inst (
			.in(guxe),
			.y(fevo)
		);

	dmg_not_if0 #(
			.L_y(1643.156)
		) fevu_inst (
			.in(a4),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a4_n_tri)
		);

	dmg_nand2 #(
			.L_y(216.4844)
		) fewa_inst (
			.in1(ff26),
			.in2(ff1a_rd),
			.y(fewa)
		);

	dmg_not_x1 #(
			.L_y(2670.063)
		) fexo_inst (
			.in(apu_reset),
			.y(fexo)
		);

	dmg_dffr #(
			.L_q(512.6563),
			.L_q_n(65.07764)
		) fexu_inst (
			.d(fexu_n),
			.clk(ch3_len_timer_stop),
			.r_n(guda),
			.q(fexu),
			.q_n(fexu_n)
		);

	dmg_drlatch_ee #(
			.L_q(259.7812),
			.L_q_n(138.1249)
		) fezu_inst (
			.d(d2),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d2),
			.q_n(fezu_n)
		);

	dmg_dffr #(
			.L_q(170.7965)
		) foba_inst (
			.d(gavu),
			.clk(apu_phi),
			.r_n(goma),
			.q(foba),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(503.3601)
		) fobo_inst (
			.in(fefo),
			.y(save_sprite_num7)
		);

	dmg_not_if0 #(
			.L_y(1592.953)
		) foby_inst (
			.in(a7),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a7_n_tri)
		);

	dmg_nand4 #(
			.L_y(370.5464)
		) foco_inst (
			.in1(fycu),
			.in2(fone),
			.in3(cape),
			.in4(caxu),
			.y(foco)
		);

	dmg_not_if0 #(
			.L_y(336.2813)
		) fodo_inst (
			.in(dma_a0),
			.ena_n(oam_addr_dma_n),
			.y(oam_a0_n_tri)
		);

	dmg_not_x1 #(
			.L_y(105.4534)
		) fofa_inst (
			.in(v5),
			.y(fofa)
		);

	dmg_drlatch_ee #(
			.L_q(542.9377)
		) fofe_inst (
			.d(d0),
			.ena(dosa),
			.ena_n(esur),
			.r_n(hude),
			.q(fofe),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(92.96875)
		) fofo_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y9),
			.ena_n(faka),
			.q(),
			.q_n(fofo_n)
		);

	dmg_not_x1 #(
			.L_y(41.9688)
		) foge_inst (
			.in(apu_rd_n),
			.y(foge)
		);

	dmg_dlatch_ee #(
			.L_q_n(109.4376)
		) fogo_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(fogo_n)
		);

	dmg_drlatch_ee #(
			.L_q(255.0002),
			.L_q_n(106.5155)
		) foha_inst (
			.d(d6),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d6),
			.q_n(foha_n)
		);

	dmg_not_x1 #(
			.L_y(178.5)
		) fohy_inst (
			.in(acc_d5),
			.y(fohy)
		);

	dmg_drlatch_ee #(
			.L_q(262.4374)
		) foka_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(foka),
			.q_n()
		);

	dmg_and2 #(
			.L_y(283.9536)
		) foke_inst (
			.in1(dyla),
			.in2(fule),
			.y(foke)
		);

	dmg_or2 #(
			.L_y(441.7341)
		) foko_inst (
			.in1(dyba),
			.in2(egav),
			.y(foko)
		);

	dmg_not_x1 #(
			.L_y(134.4066)
		) foku_inst (
			.in(etuc),
			.y(foku)
		);

	dmg_xor #(
			.L_y(132.5464)
		) foky_inst (
			.in1(fuby),
			.in2(h2_n),
			.y(foky)
		);

	dmg_ao22 #(
			.L_y(194.4373)
		) fole_inst (
			.in1(ff21_d3),
			.in2(felo),
			.in3(felo),
			.in4(ff21_d3_n),
			.y(fole)
		);

	dmg_drlatch_ee #(
			.L_q(563.6563)
		) fome_inst (
			.d(d3),
			.ena(dosa),
			.ena_n(esur),
			.r_n(hude),
			.q(fome),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(2207.876),
			.L_q_n(247.5625)
		) fomy_inst (
			.d(ff17_d6),
			.l(ch2_restart),
			.tclk_n(etup),
			.q(ch2_env2),
			.q_n(fomy_n)
		);

	dmg_not_x1 #(
			.L_y(359.6563)
		) fone_inst (
			.in(cypy),
			.y(fone)
		);

	dmg_dffr #(
			.L_q(241.4532)
		) fono_inst (
			.d(guze),
			.clk(wuty),
			.r_n(byva),
			.q(fono),
			.q_n()
		);

	dmg_dffr #(
			.L_q(320.8752),
			.L_q_n(72.78139)
		) fony_inst (
			.d(fony_n),
			.clk(faha_n),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a7),
			.q_n(fony_n)
		);

	dmg_and2 #(
			.L_y(270.4061)
		) fopu_inst (
			.in1(dyla),
			.in2(gulu),
			.y(fopu)
		);

	dmg_ao22 #(
			.L_y(136.5316)
		) fopy_inst (
			.in1(ff17_d3),
			.in2(ch2_env2),
			.in3(fomy_n),
			.in4(ff17_d3_n),
			.y(fopy)
		);

	dmg_drlatch_ee #(
			.L_q(225.5162)
		) fora_inst (
			.d(d4),
			.ena(dosa),
			.ena_n(esur),
			.r_n(hude),
			.q(fora),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(832.4689),
			.L_q_n(657.9531)
		) fore_inst (
			.d(d3),
			.ena(enuf),
			.ena_n(elas),
			.r_n(jybu),
			.q(ff17_d3),
			.q_n(ff17_d3_n)
		);

	dmg_tffnl #(
			.L_q(242.2501)
		) foro_inst (
			.d(d5),
			.l(emut),
			.tclk_n(gemo),
			.q(foro),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) foru_inst (
			.in(gaxe_n),
			.ena_n(evaj),
			.y(d0)
		);

	dmg_tffnl #(
			.L_q(170.7967)
		) fory_inst (
			.d(d1),
			.l(gajy),
			.tclk_n(gevo),
			.q(fory),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) fose_inst (
			.in(cyvo_n),
			.ena_n(futy),
			.y(d3)
		);

	dmg_dffr #(
			.L_q(816.2655)
		) fosy_inst (
			.d(ejex),
			.clk(horu_512hz),
			.r_n(gopa),
			.q(ch4_eg_tick),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) fote_inst (
			.in(efuz_n),
			.ena_n(geno),
			.y(d2)
		);

	dmg_and2 #(
			.L_y(97.48463)
		) foto_inst (
			.in1(fety),
			.in2(ch3_frst),
			.y(foto)
		);

	dmg_drlatch_ee #(
			.L_q(209.0473),
			.L_q_n(115.8125)
		) foty_inst (
			.d(d5),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d5),
			.q_n(foty_n)
		);

	dmg_drlatch_ee #(
			.L_q(393.656)
		) fova_inst (
			.d(d1),
			.ena(dosa),
			.ena_n(esur),
			.r_n(hude),
			.q(fova),
			.q_n()
		);

	dmg_nand5 #(
			.L_y(69.06246)
		) fove_inst (
			.in1(ygem),
			.in2(efyl),
			.in3(dyka),
			.in4(ybez),
			.in5(egom),
			.y(fove)
		);

	dmg_nand2 #(
			.L_y(263.7654)
		) fovo_inst (
			.in1(nrx4_d6_wr),
			.in2(ff1e),
			.y(fovo)
		);

	dmg_nor3 #(
			.L_y(1853.266)
		) fowa_inst (
			.in1(ff21_d0),
			.in2(ff21_d1),
			.in3(ff21_d2),
			.y(ch4_eg_disable)
		);

	dmg_nor2 #(
			.L_y(422.8749)
		) foxa_inst (
			.in1(efyl),
			.in2(favo),
			.y(foxa)
		);

	dmg_nand2 #(
			.L_y(236.9379)
		) foxe_inst (
			.in1(apu_wr),
			.in2(ff23),
			.y(foxe)
		);

	dmg_dlatch_ee #(
			.L_q_n(91.64054)
		) foxy_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(foxy_n)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) foze_inst (
			.in(ekov_n),
			.ena_n(evaj),
			.y(d7)
		);

	dmg_nor_latch #(
			.L_q(872.8438)
		) fozu_inst (
			.s(ch3_restart),
			.r(fygo),
			.q(fozu),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(161.2346)
		) fozy_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(fozy),
			.q_n()
		);

	dmg_pad_out #(
		) fr_inst (
			.o_n(kofo),
			.pad(fr_pad)
		);

	dmg_drlatch_ee #(
			.L_q(212.2345)
		) fuby_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(fuby),
			.q_n()
		);

	dmg_dffsr #(
			.L_q(543.4689)
		) fude_inst (
			.d(fedo),
			.clk(ejyb),
			.s_n(govo),
			.r_n(ezuk),
			.q(fude),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(102.0001)
		) fufo_inst (
			.in(ff40_d2),
			.y(fufo)
		);

	dmg_dffr #(
			.L_q(662.2034),
			.L_q_n(85.26581)
		) fugo_inst (
			.d(fugo_n),
			.clk(ch4_len_timer_stop),
			.r_n(gapy),
			.q(fugo),
			.q_n(fugo_n)
		);

	dmg_not_if0 #(
			.L_y(1481.125)
		) fugu_inst (
			.in(oam_render_a6),
			.ena_n(oam_addr_render_n),
			.y(oam_a6_n_tri)
		);

	dmg_not_if0 #(
			.L_y(4179.61)
		) fugy_inst (
			.in(xegu_n),
			.ena_n(abon),
			.y(ma5_n)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) fuhe_inst (
			.in(dma_a2),
			.ena_n(ahoc),
			.y(ma2_n)
		);

	dmg_drlatch_ee #(
			.L_q(263.7656),
			.L_q_n(97.7498)
		) fujo_inst (
			.d(d3),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d3),
			.q_n(fujo_n)
		);

	dmg_and2 #(
			.L_y(346.6407)
		) fujy_inst (
			.in1(gyko),
			.in2(ch2_1mhz),
			.y(fujy)
		);

	dmg_not_x1 #(
			.L_y(681.8594)
		) fuke_inst (
			.in(gyfo),
			.y(fuke)
		);

	dmg_not_x1 #(
			.L_y(95.62536)
		) fuky_inst (
			.in(v2),
			.y(fuky)
		);

	dmg_not_x1 #(
			.L_y(1441.015)
		) fule_inst (
			.in(d2),
			.y(fule)
		);

	dmg_nor2 #(
			.L_y(96.95296)
		) fulo_inst (
			.in1(ch1_1mhz),
			.in2(ch1_fdis),
			.y(fulo)
		);

	dmg_or2 #(
			.L_y(324.5938)
		) fuma_inst (
			.in1(gaja),
			.in2(geze),
			.y(fuma)
		);

	dmg_not_x1 #(
			.L_y(888.5164)
		) fume_inst (
			.in(epyk),
			.y(fume)
		);

	dmg_drlatch_ee #(
			.L_q(118.7344),
			.L_q_n(124.578)
		) funy_inst (
			.d(d7),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d7),
			.q_n(funy_n)
		);

	dmg_not_x2 #(
			.L_y(448.1084)
		) fupa_inst (
			.in(goko),
			.y(fupa)
		);

	dmg_nor3 #(
			.L_y(412.7811)
		) fura_inst (
			.in1(ff22_d6),
			.in2(ff22_d5_n),
			.in3(ff22_d4_n),
			.y(fura)
		);

	dmg_xor #(
			.L_y(110.5001)
		) fure_inst (
			.in1(aryl),
			.in2(fedo),
			.y(fure)
		);

	dmg_not_x2 #(
			.L_y(1812.359)
		) furo_inst (
			.in(guva),
			.y(sprite_sel0)
		);

	dmg_not_x1 #(
			.L_y(133.8748)
		) furu_inst (
			.in(caze),
			.y(furu)
		);

	dmg_nor2 #(
			.L_y(483.4376)
		) fury_inst (
			.in1(apu_reset),
			.in2(gyta),
			.y(fury)
		);

	dmg_drlatch_ee #(
			.L_q(193.375)
		) fusa_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x5),
			.ena_n(cyla),
			.r_n(sprite_rst5),
			.q(fusa),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3384.063)
		) fusy_inst (
			.in(dma_a11),
			.ena_n(ahoc),
			.y(ma11_n)
		);

	dmg_nor5 #(
			.L_y(4097.531)
		) fute_inst (
			.in1(ff17_d3),
			.in2(ff17_d4),
			.in3(ff17_d5),
			.in4(ff17_d6),
			.in5(ff17_d7),
			.y(ch2_amp_en_n)
		);

	dmg_not_if0 #(
			.L_y(1643.156)
		) futo_inst (
			.in(oam_parse_a4),
			.ena_n(oam_addr_parse_n),
			.y(oam_a4_n_tri)
		);

	dmg_not_x2 #(
			.L_y(1687.25)
		) futy_inst (
			.in(guza),
			.y(futy)
		);

	dmg_or2 #(
			.L_y(1095.438)
		) fuva_inst (
			.in1(gunu),
			.in2(egad),
			.y(fuva)
		);

	dmg_not_x1 #(
			.L_y(160.7036)
		) fuve_inst (
			.in(v3),
			.y(fuve)
		);

	dmg_nor2 #(
			.L_y(914.8121)
		) fuvo_inst (
			.in1(ch3_amp_en_n),
			.in2(apu_reset),
			.y(fuvo)
		);

	dmg_full_add #(
			.L_cout(560.7346),
			.L_sum(256.3279)
		) fuwa_inst (
			.a(fofa),
			.b(wyso_n),
			.cin(gopu_c),
			.cout(fuwa_c),
			.sum(fuwa)
		);

	dmg_tffnl #(
			.L_q(151.9373),
			.L_q_n(633.2501)
		) fuxo_inst (
			.d(fora),
			.l(erog),
			.tclk_n(edep),
			.q(fuxo),
			.q_n(fuxo_n)
		);

	dmg_not_x1 #(
			.L_y(1138.203)
		) fuxu_inst (
			.in(dyhu),
			.y(fuxu)
		);

	dmg_dlatch_ee #(
			.L_q_n(87.65613)
		) fuzo_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(fuzo_n)
		);

	dmg_xor #(
			.L_y(114.4841)
		) fuzu_inst (
			.in1(foka),
			.in2(h0_n),
			.y(fuzu)
		);

	dmg_drlatch_ee #(
			.L_q(114.4843)
		) fyca_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(fyca),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(848.4063)
		) fycu_inst (
			.in(eden),
			.y(fycu)
		);

	dmg_not_if0 #(
			.L_y(1481.125)
		) fydu_inst (
			.in(dma_a6),
			.ena_n(oam_addr_dma_n),
			.y(oam_a6_n_tri)
		);

	dmg_nor_latch #(
			.L_q_n(121.9214)
		) fyfo_inst (
			.s(gefe),
			.r(ch1_start),
			.q(),
			.q_n(fyfo_n)
		);

	dmg_or3 #(
			.L_y(74.10899)
		) fygo_inst (
			.in1(apu_reset),
			.in2(gedo),
			.in3(ch3_amp_en_n),
			.y(fygo)
		);

	dmg_dlatch_ee #(
			.L_q_n(111.0311)
		) fyhy_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y0),
			.ena_n(enob),
			.q(),
			.q_n(fyhy_n)
		);

	dmg_not_if0 #(
			.L_y(1592.953)
		) fyke_inst (
			.in(oam_render_a7),
			.ena_n(oam_addr_render_n),
			.y(oam_a7_n_tri)
		);

	dmg_not_if0 #(
			.L_y(764.4689)
		) fyky_inst (
			.in(dma_a3),
			.ena_n(oam_addr_dma_n),
			.y(oam_a3_n_tri)
		);

	dmg_tffnl #(
			.L_q(173.9845)
		) fylo_inst (
			.d(d4),
			.l(epek),
			.tclk_n(dopu),
			.q(fylo),
			.q_n()
		);

	dmg_nor4 #(
			.L_y(140.7813)
		) fyma_inst (
			.in1(guzo),
			.in2(gola),
			.in3(geve),
			.in4(gude),
			.y(sprite_x_match_l5)
		);

	dmg_drlatch_ee #(
			.L_q(304.9376),
			.L_q_n(129.0938)
		) fymo_inst (
			.d(d1),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d1),
			.q_n(fymo_n)
		);

	dmg_not_x3 #(
			.L_y(487.9537)
		) fyne_inst (
			.in(bure),
			.y(fyne)
		);

	dmg_dffr #(
			.L_q(141.5782)
		) fyno_inst (
			.d(evur),
			.clk(ch4_eg_tick),
			.r_n(emet),
			.q(fyno),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(31524.23)
		) fyra_inst (
			.in(eced_n),
			.ena_n(oam_a_rd_n),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(93.23443)
		) fyre_inst (
			.in(erat),
			.y(fyre)
		);

	dmg_tffnl #(
			.L_q(691.6877)
		) fyro_inst (
			.d(ff21_d7),
			.l(ch4_restart),
			.tclk_n(elaf),
			.q(ch4_env3),
			.q_n()
		);

	dmg_tffnl #(
			.L_q_n(47.28122)
		) fyru_inst (
			.d(d7),
			.l(emut),
			.tclk_n(fave),
			.q(),
			.q_n(ch3_len_timer_stop)
		);

	dmg_not_x1 #(
			.L_y(115.8125)
		) fyry_inst (
			.in(ff17),
			.y(fyry)
		);

	dmg_dlatch_ee #(
			.L_q_n(105.4532)
		) fysu_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(fysu_n)
		);

	dmg_dffr #(
			.L_q(1070.469)
		) fyte_inst (
			.d(fare),
			.clk(ch1_1mhz),
			.r_n(erum),
			.q(ch1_restart_dly),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(395.2497),
			.L_q_n(737.6404)
		) fyto_inst (
			.d(d5),
			.ena(getu),
			.ena_n(efug),
			.r_n(apu_reset4_n),
			.q(ff22_d5),
			.q_n(ff22_d5_n)
		);

	dmg_drlatch_ee #(
			.L_q(159.375)
		) fyty_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(fyty),
			.q_n()
		);

	dmg_xor #(
			.L_y(91.64054)
		) fyva_inst (
			.in1(goxu),
			.in2(h3_n),
			.y(fyva)
		);

	dmg_not_x1 #(
			.L_y(239.0619)
		) fyxo_inst (
			.in(exuc),
			.y(fyxo)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) fyzy_inst (
			.in(dma_a3),
			.ena_n(ahoc),
			.y(ma3_n)
		);

	dmg_not_x1 #(
			.L_y(149.0154)
		) gaba_inst (
			.in(egom),
			.y(gaba)
		);

	dmg_dlatch_ee #(
			.L_q_n(93.76539)
		) gabo_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(gabo_n)
		);

	dmg_xor #(
			.L_y(120.3281)
		) gabu_inst (
			.in1(gady),
			.in2(h2_n),
			.y(gabu)
		);

	dmg_not_x1 #(
			.L_y(117.9374)
		) gace_inst (
			.in(gopu),
			.y(gace)
		);

	dmg_dlatch_ee #(
			.L_q_n(108.6405)
		) gacy_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(gacy_n)
		);

	dmg_not_x1 #(
			.L_y(95.094)
		) gade_inst (
			.in(jopa),
			.y(gade)
		);

	dmg_not_x1 #(
			.L_y(109.4376)
		) gado_inst (
			.in(apu_rd_n),
			.y(gado)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) gadu_inst (
			.in(goca_n),
			.ena_n(futy),
			.y(d6)
		);

	dmg_drlatch_ee #(
			.L_q(153.5312)
		) gady_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(gady),
			.q_n()
		);

	dmg_ao22 #(
			.L_y(146.8908)
		) gafa_inst (
			.in1(ff17_d3),
			.in2(hofo),
			.in3(hofo),
			.in4(ff17_d3_n),
			.y(gafa)
		);

	dmg_xor #(
			.L_y(97.21864)
		) gafe_inst (
			.in1(gaza),
			.in2(h3_n),
			.y(gafe)
		);

	dmg_drlatch_ee #(
			.L_q(138.3908),
			.L_q_n(150.078)
		) gafo_inst (
			.d(d7),
			.ena(getu),
			.ena_n(efug),
			.r_n(apu_reset4_n),
			.q(ff22_d7),
			.q_n(gafo_n)
		);

	dmg_nor3 #(
			.L_y(193.9056)
		) gafu_inst (
			.in1(apu_reset),
			.in2(ch3_restart),
			.in3(hupa),
			.y(gafu)
		);

	dmg_not_x1 #(
			.L_y(713.2031)
		) gafy_inst (
			.in(guky),
			.y(sprite_rst7)
		);

	dmg_drlatch_ee #(
			.L_q(415.7036),
			.L_q_n(91.37466)
		) gage_inst (
			.d(d7),
			.ena(enuf),
			.ena_n(elas),
			.r_n(jybu),
			.q(ff17_d7),
			.q_n(gage_n)
		);

	dmg_not_x1 #(
			.L_y(94.82791)
		) gago_inst (
			.in(ff12),
			.y(gago)
		);

	dmg_not_x1 #(
			.L_y(97.48413)
		) gaja_inst (
			.in(dydu),
			.y(gaja)
		);

	dmg_not_x1 #(
			.L_y(773.5016)
		) gajy_inst (
			.in(dery),
			.y(gajy)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) gaka_inst (
			.in(ff22_d6_n),
			.ena_n(heze),
			.y(d6)
		);

	dmg_or2 #(
			.L_y(199.2188)
		) gake_inst (
			.in1(dyba),
			.in2(gota),
			.y(gake)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) gaky_inst (
			.in(gano_n),
			.ena_n(futy),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(181.9531)
		) gala_inst (
			.in(gane_n),
			.y(gala)
		);

	dmg_mux #(
			.L_y(182.7501)
		) gale_inst (
			.sel(ff26_d4),
			.d1(hama_512khz),
			.d0(fyne),
			.y(gale)
		);

	dmg_dffr_cc_q #(
			.L_q(338.6711)
		) galo_inst (
			.d(acc_d0),
			.clk(ch1_ld_sum),
			.clk_n(kede),
			.r_n(sum_reset_n),
			.q(galo)
		);

	dmg_not_x1 #(
			.L_y(144.5005)
		) galu_inst (
			.in(ch2_ftick),
			.y(galu)
		);

	dmg_not_if0 #(
			.L_y(1481.125)
		) gama_inst (
			.in(oam_parse_a6),
			.ena_n(oam_addr_parse_n),
			.y(oam_a6_n_tri)
		);

	dmg_and2 #(
			.L_y(264.5627)
		) game_inst (
			.in1(ch4_active),
			.in2(hezu),
			.y(lfsr_out)
		);

	dmg_nor2 #(
			.L_y(355.6719)
		) gamo_inst (
			.in1(fega),
			.in2(apu_reset),
			.y(gamo)
		);

	dmg_not_x1 #(
			.L_y(830.3439)
		) gamy_inst (
			.in(foko),
			.y(sprite_rst2)
		);

	dmg_tffnl #(
			.L_q_n(905.5163)
		) gane_inst (
			.d(gupu),
			.l(erog),
			.tclk_n(goca),
			.q(),
			.q_n(gane_n)
		);

	dmg_tffnl #(
			.L_q(41.17216),
			.L_q_n(591.2811)
		) gano_inst (
			.d(goda),
			.l(erog),
			.tclk_n(fuxo),
			.q(gano),
			.q_n(gano_n)
		);

	dmg_nand4 #(
			.L_y(123.5155)
		) gany_inst (
			.in1(dyte),
			.in2(afob),
			.in3(deno),
			.in4(duce),
			.y(gany)
		);

	dmg_or2 #(
			.L_y(46.21869)
		) gape_inst (
			.in1(sprite_save_en_n),
			.in2(guna),
			.y(gape)
		);

	dmg_tffnl #(
			.L_q_n(155.9221)
		) gapo_inst (
			.d(d3),
			.l(gajy),
			.tclk_n(gatu),
			.q(),
			.q_n(gapo_n)
		);

	dmg_nor3 #(
			.L_y(192.5781)
		) gapy_inst (
			.in1(furu),
			.in2(apu_reset),
			.in3(ch4_restart),
			.y(gapy)
		);

	dmg_dffr #(
			.L_q(2536.454)
		) gara_inst (
			.d(gofy_n),
			.clk(fabo),
			.r_n(fury),
			.q(ch3_restart),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(336.2813)
		) garo_inst (
			.in(a0),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a0_n_tri)
		);

	dmg_drlatch_ee #(
			.L_q(358.062),
			.L_q_n(99.60978)
		) garu_inst (
			.d(d4),
			.ena(goko),
			.ena_n(fupa),
			.r_n(fexo),
			.q(ff21_d4),
			.q_n(garu_n)
		);

	dmg_dffr #(
			.L_q(783.5941)
		) gary_inst (
			.d(hyno),
			.clk(gyba),
			.r_n(guny),
			.q(gary),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(937.1251)
		) gase_inst (
			.in(hema),
			.y(ch3_frst)
		);

	dmg_not_x1 #(
			.L_y(294.5784)
		) gaso_inst (
			.in(apu_reset),
			.y(gaso)
		);

	dmg_xor #(
			.L_y(242.5157)
		) gasu_inst (
			.in1(gypu),
			.in2(h1_n),
			.y(gasu)
		);

	dmg_drlatch_ee #(
			.L_q(558.078),
			.L_q_n(108.9064)
		) gata_inst (
			.d(d4),
			.ena(enuf),
			.ena_n(elas),
			.r_n(jybu),
			.q(ff17_d4),
			.q_n(gata_n)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) gate_inst (
			.in(fofo_n),
			.ena_n(sprite_sel9),
			.y(sprite_y_store1)
		);

	dmg_nor2 #(
			.L_y(238.5311)
		) gato_inst (
			.in1(fopu),
			.in2(apu_reset),
			.y(gato)
		);

	dmg_tffnl #(
			.L_q(260.0467)
		) gatu_inst (
			.d(d2),
			.l(gajy),
			.tclk_n(fory),
			.q(gatu),
			.q_n()
		);

	dmg_dffr #(
			.L_q(209.0467)
		) gaty_inst (
			.d(gora),
			.clk(hama_512khz),
			.r_n(feby),
			.q(gaty),
			.q_n()
		);

	dmg_or2 #(
			.L_y(328.8435)
		) gava_inst (
			.in1(last_sprite),
			.in2(xupy),
			.y(gava)
		);

	dmg_drlatch_ee #(
			.L_q(528.8595),
			.L_q_n(118.203)
		) gave_inst (
			.d(d0),
			.ena(ehor),
			.ena_n(cavo),
			.r_n(ppu_hard_reset_n),
			.q(ff42_d0),
			.q_n(gave_n)
		);

	dmg_not_if0 #(
			.L_y(4309.501)
		) gavo_inst (
			.in(yjex_n),
			.ena_n(abon),
			.y(ma6_n)
		);

	dmg_drlatch_ee #(
			.L_q(173.9843)
		) gavu_inst (
			.d(d7),
			.ena(fene),
			.ena_n(epyx),
			.r_n(fako),
			.q(gavu),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(357.2657)
		) gavy_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(gavy),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(104.6563)
		) gawa_inst (
			.in1(ff1e),
			.in2(gory),
			.y(gawa)
		);

	dmg_tffnl #(
			.L_q(235.6092),
			.L_q_n(142.6409)
		) gaxe_inst (
			.d(acc_d0),
			.l(fume),
			.tclk_n(geku),
			.q(gaxe),
			.q_n(gaxe_n)
		);

	dmg_not_x1 #(
			.L_y(741.6254)
		) gaxo_inst (
			.in(apu_rd_n),
			.y(ff1a_rd)
		);

	dmg_and2 #(
			.L_y(828.7505)
		) gaxu_inst (
			.in1(ff12),
			.in2(apu_wr),
			.y(gaxu)
		);

	dmg_drlatch_ee #(
			.L_q(139.9841)
		) gaza_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(gaza),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(400.5623)
		) gaze_inst (
			.in(apu_reset),
			.y(gaze)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) gazo_inst (
			.in(gane_n),
			.ena_n(futy),
			.y(d7)
		);

	dmg_nand4 #(
			.L_y(85.79716)
		) gebu_inst (
			.in1(eden),
			.in2(fone),
			.in3(cape),
			.in4(caxu),
			.y(gebu)
		);

	dmg_not_if0 #(
			.L_y(336.2813)
		) geca_inst (
			.in(wefe_const1),
			.ena_n(oam_addr_render_n),
			.y(oam_a0_n_tri)
		);

	dmg_dlatch_ee #(
			.L_q_n(154.3279)
		) gecu_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(gecu_n)
		);

	dmg_not_x1 #(
			.L_y(980.422)
		) gecy_inst (
			.in(gyvo),
			.y(gecy)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) geda_inst (
			.in(ff22_d4_n),
			.ena_n(heze),
			.y(d4)
		);

	dmg_or2 #(
			.L_y(381.1716)
		) gede_inst (
			.in1(gupo),
			.in2(fuma),
			.y(gede)
		);

	dmg_and2 #(
			.L_y(183.547)
		) gedo_inst (
			.in1(fexu),
			.in2(ff1e_d6),
			.y(gedo)
		);

	dmg_drlatch_ee #(
			.L_q(523.5466),
			.L_q_n(144.7655)
		) gedu_inst (
			.d(d7),
			.ena(goko),
			.ena_n(fupa),
			.r_n(fexo),
			.q(ff21_d7),
			.q_n(gedu_n)
		);

	dmg_not_x1 #(
			.L_y(137.594)
		) gefe_inst (
			.in(eget),
			.y(gefe)
		);

	dmg_nor2 #(
			.L_y(404.547)
		) gefo_inst (
			.in1(gany),
			.in2(ff1x_n),
			.y(ff1c)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) gefu_inst (
			.in(hyfe_n),
			.ena_n(evaj),
			.y(d1)
		);

	dmg_not_if0 #(
			.L_y(336.2813)
		) gefy_inst (
			.in(const0),
			.ena_n(oam_addr_parse_n),
			.y(oam_a0_n_tri)
		);

	dmg_nor2 #(
			.L_y(244.6408)
		) gega_inst (
			.in1(egom),
			.in2(xyla),
			.y(gega)
		);

	dmg_nor2 #(
			.L_y(554.0935)
		) gege_inst (
			.in1(ff1c_d6),
			.in2(ff1c_d5_n),
			.y(gege)
		);

	dmg_not_if0 #(
			.L_y(5085.921)
		) gegu_inst (
			.in(xote_n),
			.ena_n(abon),
			.y(ma10_n)
		);

	dmg_or2 #(
		) gehy_inst (
			.in1(wobu),
			.in2(gyga),
			.y()
		);

	dmg_and2 #(
			.L_y(598.7186)
		) gejo_inst (
			.in1(ff1a),
			.in2(apu_wr),
			.y(gejo)
		);

	dmg_ao22 #(
			.L_y(119.5314)
		) gejy_inst (
			.in1(xuso_n),
			.in2(fufo),
			.in3(ff40_d2),
			.in4(wago),
			.y(gejy)
		);

	dmg_not_x1 #(
			.L_y(387.0156)
		) geka_inst (
			.in(oam_a0_n_tri),
			.y(geka)
		);

	dmg_not_x1 #(
			.L_y(47.01574)
		) geke_inst (
			.in(efyl),
			.y(geke)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) geko_inst (
			.in(fevo),
			.ena_n(fasy),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(218.6093)
		) geku_inst (
			.in(fulo),
			.y(geku)
		);

	dmg_drlatch_ee #(
			.L_q(1132.359),
			.L_q_n(890.3759)
		) geky_inst (
			.d(d3),
			.ena(goko),
			.ena_n(fupa),
			.r_n(fexo),
			.q(ff21_d3),
			.q_n(ff21_d3_n)
		);

	dmg_xor #(
			.L_y(122.719)
		) gela_inst (
			.in1(aryl),
			.in2(jefa),
			.y(gela)
		);

	dmg_dffr_cc_q #(
			.L_q(120.8591)
		) gele_inst (
			.d(goly),
			.clk(ch1_ld_sum),
			.clk_n(homu),
			.r_n(sum_reset_n),
			.q(gele)
		);

	dmg_not_if0 #(
			.L_y(764.4689)
		) gema_inst (
			.in(oam_parse_a3),
			.ena_n(oam_addr_parse_n),
			.y(oam_a3_n_tri)
		);

	dmg_tffnl #(
			.L_q(142.375)
		) gemo_inst (
			.d(d4),
			.l(emut),
			.tclk_n(falu),
			.q(gemo),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(336.8131)
		) gemy_inst (
			.in1(ff1c_d6_n),
			.in2(ff1c_d5_n),
			.y(gemy)
		);

	dmg_nor_latch #(
			.L_q(343.9843)
		) gena_inst (
			.s(ch4_restart),
			.r(fegy),
			.q(ch4_active),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) gene_inst (
			.in(ff17_d3_n),
			.ena_n(guru),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(487.9536)
		) geno_inst (
			.in(hony),
			.y(geno)
		);

	dmg_not_x1 #(
			.L_y(211.969)
		) genu_inst (
			.in(gepy),
			.y(genu)
		);

	dmg_not_x1 #(
			.L_y(886.1251)
		) geny_inst (
			.in(dyhu),
			.y(geny)
		);

	dmg_not_x1 #(
			.L_y(1389.219)
		) gepa_inst (
			.in(ff25),
			.y(gepa)
		);

	dmg_or2 #(
			.L_y(133.8752)
		) gepo_inst (
			.in1(ch4_restart),
			.in2(apu_reset),
			.y(gepo)
		);

	dmg_not_x1 #(
			.L_y(51.26583)
		) gepu_inst (
			.in(ch1_restart_dly),
			.y(gepu)
		);

	dmg_nor3 #(
			.L_y(126.7028)
		) gepy_inst (
			.in1(fexu),
			.in2(bufy_256hz),
			.in3(ff1e_d6_n),
			.y(gepy)
		);

	dmg_not_if0 #(
			.L_y(1939.86)
		) gera_inst (
			.in(a5),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a5_n_tri)
		);

	dmg_and2 #(
			.L_y(741.3593)
		) gere_inst (
			.in1(apu_wr),
			.in2(ff17),
			.y(gere)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) gero_inst (
			.in(fuxo_n),
			.ena_n(futy),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(1164.5)
		) gery_inst (
			.in(fuxu),
			.y(save_sprite_x0)
		);

	dmg_not_x1 #(
			.L_y(455.812)
		) gese_inst (
			.in(wota),
			.y(sprite_y_match)
		);

	dmg_dlatch_ee #(
			.L_q_n(89.78138)
		) gesy_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(gesy_n)
		);

	dmg_nand2 #(
			.L_y(313.4372)
		) geta_inst (
			.in1(d1),
			.in2(dyla),
			.y(geta)
		);

	dmg_not_x1 #(
			.L_y(148.7494)
		) geto_inst (
			.in(dery),
			.y(geto)
		);

	dmg_and2 #(
			.L_y(455.0157)
		) getu_inst (
			.in1(apu_wr),
			.in2(ff22),
			.y(getu)
		);

	dmg_full_add #(
			.L_cout(101.4689),
			.L_sum(122.4531)
		) geva_inst (
			.a(faxo),
			.b(gele),
			.cin(hexo_c),
			.cout(geva_c),
			.sum(sum5)
		);

	dmg_xor #(
			.L_y(119.5315)
		) geve_inst (
			.in1(fozy),
			.in2(h2_n),
			.y(geve)
		);

	dmg_tffnl #(
			.L_q(269.8751)
		) gevo_inst (
			.d(d0),
			.l(gajy),
			.tclk_n(genu),
			.q(gevo),
			.q_n()
		);

	dmg_nor5 #(
			.L_y(6122.392)
		) gevy_inst (
			.in1(ff21_d3),
			.in2(ff21_d4),
			.in3(ff21_d5),
			.in4(ff21_d6),
			.in5(ff21_d7),
			.y(ch4_amp_en_n)
		);

	dmg_not_x1 #(
			.L_y(417.5623)
		) gewy_inst (
			.in(wuhu),
			.y(gewy)
		);

	dmg_or2 #(
			.L_y(1000.078)
		) gexa_inst (
			.in1(gure),
			.in2(apu_rd_n),
			.y(gexa)
		);

	dmg_not_x1 #(
			.L_y(108.6405)
		) gexe_inst (
			.in(ch4_eg_tick),
			.y(gexe)
		);

	dmg_nand_latch #(
			.L_q_n(128.5624)
		) gexu_inst (
			.s_n(gepu),
			.r_n(femy),
			.q(),
			.q_n(ch1_fdis)
		);

	dmg_not_x1 #(
			.L_y(290.0624)
		) gexy_inst (
			.in(gale),
			.y(gexy)
		);

	dmg_or2 #(
			.L_y(242.5156)
		) geze_inst (
			.in1(wefu),
			.in2(const0),
			.y(geze)
		);

	dmg_ggnmos #(
		) ggnmos_ne_inst (
		);

	dmg_ggnmos #(
		) ggnmos_nw_inst (
		);

	dmg_ggnmos #(
		) ggnmos_se_inst (
		);

	dmg_ggnmos #(
		) ggnmos_sw_inst (
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) goba_inst (
			.in(fymo_n),
			.ena_n(buwy),
			.y(d1)
		);

	dmg_not_if0 #(
			.L_y(1592.953)
		) goby_inst (
			.in(oam_parse_a7),
			.ena_n(oam_addr_parse_n),
			.y(oam_a7_n_tri)
		);

	dmg_tffnl #(
			.L_q(309.4534),
			.L_q_n(146.0944)
		) goca_inst (
			.d(gumy),
			.l(erog),
			.tclk_n(gano),
			.q(goca),
			.q_n(goca_n)
		);

	dmg_drlatch_ee #(
			.L_q(366.8276)
		) goda_inst (
			.d(d5),
			.ena(exuc),
			.ena_n(fyxo),
			.r_n(hude),
			.q(goda),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) gode_inst (
			.in(hyke_n),
			.ena_n(evaj),
			.y(d5)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) godo_inst (
			.in(fujo_n),
			.ena_n(buwy),
			.y(d3)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) godu_inst (
			.in(goky_n),
			.ena_n(hasu),
			.y(d5)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) gofo_inst (
			.in(fyhy_n),
			.ena_n(sprite_sel0),
			.y(sprite_y_store0)
		);

	dmg_nor2 #(
			.L_y(99.60896)
		) gofu_inst (
			.in1(ch4_restart),
			.in2(gary),
			.y(gofu)
		);

	dmg_nor_latch #(
			.L_q_n(166.8125)
		) gofy_inst (
			.s(gulo),
			.r(foba),
			.q(),
			.q_n(gofy_n)
		);

	dmg_dffsr #(
			.L_q(402.9531)
		) goga_inst (
			.d(jolu),
			.clk(ch1_shift_clk),
			.s_n(hawy),
			.r_n(hyvu),
			.q(goga),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(3011.924)
		) goge_inst (
			.in(gepo),
			.y(goge)
		);

	dmg_drlatch_ee #(
			.L_q(371.6099),
			.L_q_n(728.0782)
		) gogo_inst (
			.d(d6),
			.ena(getu),
			.ena_n(efug),
			.r_n(apu_reset4_n),
			.q(ff22_d6),
			.q_n(ff22_d6_n)
		);

	dmg_xor #(
			.L_y(110.4999)
		) goho_inst (
			.in1(gavy),
			.in2(h0_n),
			.y(goho)
		);

	dmg_dlatch_ee #(
			.L_q_n(86.85928)
		) gohu_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num6),
			.ena_n(wuse),
			.q(),
			.q_n(gohu_n)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) goje_inst (
			.in(feva_n),
			.ena_n(evaj),
			.y(d6)
		);

	dmg_full_add #(
			.L_cout(167.3436),
			.L_sum(112.3593)
		) goju_inst (
			.a(femo),
			.b(xote_n),
			.cin(fuwa_c),
			.cout(goju_c),
			.sum(goju)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) gojy_inst (
			.in(ff19_d6_n),
			.ena_n(huma),
			.y(d6)
		);

	dmg_nor2 #(
			.L_y(513.4531)
		) goka_inst (
			.in1(ff1c_d6_n),
			.in2(ff1c_d5),
			.y(goka)
		);

	dmg_and2 #(
			.L_y(1892.844)
		) goko_inst (
			.in1(ff21),
			.in2(apu_wr),
			.y(goko)
		);

	dmg_drlatch_ee #(
			.L_q(391.7968),
			.L_q_n(159.6405)
		) goky_inst (
			.d(d5),
			.ena(goko),
			.ena_n(fupa),
			.r_n(fexo),
			.q(ff21_d5),
			.q_n(goky_n)
		);

	dmg_xor #(
			.L_y(155.9218)
		) gola_inst (
			.in1(faxa),
			.in2(h1_n),
			.y(gola)
		);

	dmg_nand2 #(
			.L_y(338.1409)
		) golo_inst (
			.in1(d2),
			.in2(dyla),
			.y(golo)
		);

	dmg_xor #(
			.L_y(91.64095)
		) goly_inst (
			.in1(aryl),
			.in2(fude),
			.y(goly)
		);

	dmg_not_x1 #(
			.L_y(189.6564)
		) goma_inst (
			.in(apu_reset),
			.y(goma)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) gome_inst (
			.in(ff21_d3_n),
			.ena_n(hasu),
			.y(d3)
		);

	dmg_dlatch_ee #(
			.L_q_n(5967.267)
		) gomo_inst (
			.d(wyno),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(sprite_palette)
		);

	dmg_dffr #(
			.L_q(2499)
		) gone_inst (
			.d(hazo_n),
			.clk(hama_512khz),
			.r_n(fale),
			.q(ch4_restart),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(906.5779)
		) gono_inst (
			.in1(xage),
			.in2(wuto),
			.y(gono)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) gonu_inst (
			.in(fezu_n),
			.ena_n(buwy),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(1361.594)
		) gony_inst (
			.in(ff21),
			.y(gony)
		);

	dmg_nor4 #(
			.L_y(185.4061)
		) gopa_inst (
			.in1(hury),
			.in2(ch4_eg_disable),
			.in3(ch4_restart),
			.in4(apu_reset),
			.y(gopa)
		);

	dmg_nand2 #(
			.L_y(376.3906)
		) gope_inst (
			.in1(d3),
			.in2(dyla),
			.y(gope)
		);

	dmg_xor #(
			.L_y(222.3284)
		) gopo_inst (
			.in1(aryl),
			.in2(goga),
			.y(gopo)
		);

	dmg_full_add #(
			.L_cout(184.3438),
			.L_sum(62.15615)
		) gopu_inst (
			.a(fepu),
			.b(ybog_n),
			.cin(gyky_c),
			.cout(gopu_c),
			.sum(gopu)
		);

	dmg_dffr #(
			.L_q(169.4689)
		) gora_inst (
			.d(ch4_restart),
			.clk(hama_512khz),
			.r_n(feby),
			.q(gora),
			.q_n()
		);

	dmg_or2 #(
			.L_y(466.703)
		) goro_inst (
			.in1(dyba),
			.in2(exuq),
			.y(goro)
		);

	dmg_dlatch_ee #(
			.L_q_n(94.82832)
		) goru_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num5),
			.ena_n(dymo),
			.q(),
			.q_n(goru_n)
		);

	dmg_not_x1 #(
			.L_y(32.67136)
		) gory_inst (
			.in(apu_rd_n),
			.y(gory)
		);

	dmg_not_if0 #(
			.L_y(1315.906)
		) gose_inst (
			.in(a2),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a2_n_tri)
		);

	dmg_dffr #(
			.L_q(183.2811),
			.L_q_n(389.672)
		) goso_inst (
			.d(goso_n),
			.clk(wewy_n),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a4),
			.q_n(goso_n)
		);

	dmg_dffr #(
			.L_q(109.9689)
		) gota_inst (
			.d(gyfy),
			.clk(wuty),
			.r_n(byva),
			.q(gota),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(108.9058)
		) gote_inst (
			.in(ff19),
			.y(gote)
		);

	dmg_not_if0 #(
			.L_y(4098.063)
		) gotu_inst (
			.in(wyso_n),
			.ena_n(abon),
			.y(ma9_n)
		);

	dmg_not_x1 #(
			.L_y(99.34349)
		) gove_inst (
			.in(apu_reset),
			.y(gove)
		);

	dmg_nand2 #(
			.L_y(212.2345)
		) govo_inst (
			.in1(acc_d5),
			.in2(juju),
			.y(govo)
		);

	dmg_or2 #(
			.L_y(322.7342)
		) govu_inst (
			.in1(ff40_d2),
			.in2(gyky),
			.y(govu)
		);

	dmg_not_x2 #(
			.L_y(1444.735)
		) gowo_inst (
			.in(gono),
			.y(sprite_sel4)
		);

	dmg_not_x1 #(
			.L_y(104.3908)
		) goxo_inst (
			.in(foxe),
			.y(goxo)
		);

	dmg_drlatch_ee #(
			.L_q(265.625)
		) goxu_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x2),
			.ena_n(cacu),
			.r_n(sprite_rst2),
			.q(goxu),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(581.4535),
			.L_q_n(131.2188)
		) gozo_inst (
			.d(d6),
			.ena(goko),
			.ena_n(fupa),
			.r_n(fexo),
			.q(ff21_d6),
			.q_n(gozo_n)
		);

	dmg_drlatch_ee #(
			.L_q(1101.016),
			.L_q_n(85.79697)
		) gubo_inst (
			.d(d3),
			.ena(bofo),
			.ena_n(amun),
			.r_n(ppu_hard_reset_n),
			.q(ff43_d3),
			.q_n(gubo_n)
		);

	dmg_not_x1 #(
			.L_y(60.29659)
		) gucy_inst (
			.in(gejo),
			.y(gucy)
		);

	dmg_nor3 #(
			.L_y(463.7812)
		) guda_inst (
			.in1(geto),
			.in2(apu_reset),
			.in3(ch3_restart),
			.y(guda)
		);

	dmg_xor #(
			.L_y(107.8439)
		) gude_inst (
			.in1(fesy),
			.in2(h3_n),
			.y(gude)
		);

	dmg_not_x1 #(
			.L_y(67.2035)
		) gufa_inst (
			.in(ch4_lfsr_clk1),
			.y(gufa)
		);

	dmg_drlatch_ee #(
			.L_q(311.3125),
			.L_q_n(135.4689)
		) gufe_inst (
			.d(d5),
			.ena(enuf),
			.ena_n(elas),
			.r_n(jybu),
			.q(ff17_d5),
			.q_n(gufe_n)
		);

	dmg_not_x1 #(
			.L_y(362.5782)
		) gufo_inst (
			.in(hapo),
			.y(gufo)
		);

	dmg_or2 #(
			.L_y(1252.422)
		) gufy_inst (
			.in1(emyr),
			.in2(fyre),
			.y(gufy)
		);

	dmg_not_x1 #(
			.L_y(145.0314)
		) gugo_inst (
			.in(ff22),
			.y(gugo)
		);

	dmg_nand_latch #(
			.L_q_n(95.0937)
		) gugu_inst (
			.s_n(faju),
			.r_n(fuvo),
			.q(),
			.q_n(ch3_fdis)
		);

	dmg_not_x2 #(
			.L_y(2440.563)
		) gugy_inst (
			.in(gutu),
			.y(sprite_sel7)
		);

	dmg_and3 #(
			.L_y(81.0155)
		) guko_inst (
			.in1(wafo),
			.in2(amab),
			.in3(cpu_vram_oam_rd),
			.y(guko)
		);

	dmg_or2 #(
			.L_y(95.35928)
		) guky_inst (
			.in1(dyba),
			.in2(wapo),
			.y(guky)
		);

	dmg_dlatch_ee #(
			.L_q_n(99.60957)
		) gule_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(gule_n)
		);

	dmg_not_x1 #(
			.L_y(113.9529)
		) gulo_inst (
			.in(fury),
			.y(gulo)
		);

	dmg_not_x1 #(
			.L_y(102.5313)
		) gulu_inst (
			.in(d1),
			.y(gulu)
		);

	dmg_not_x2 #(
			.L_y(1268.891)
		) gumu_inst (
			.in(hefa),
			.y(gumu)
		);

	dmg_drlatch_ee #(
			.L_q(491.1406)
		) gumy_inst (
			.d(d6),
			.ena(exuc),
			.ena_n(fyxo),
			.r_n(hude),
			.q(gumy),
			.q_n()
		);

	dmg_nand4 #(
			.L_y(863.8132)
		) guna_inst (
			.in1(fycu),
			.in2(fone),
			.in3(ekud),
			.in4(caxu),
			.y(guna)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) gune_inst (
			.in(foha_n),
			.ena_n(buwy),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(337.6093)
		) gunu_inst (
			.in(ff1e),
			.y(gunu)
		);

	dmg_nor2 #(
			.L_y(261.1098)
		) guny_inst (
			.in1(apu_reset),
			.in2(ch4_restart),
			.y(guny)
		);

	dmg_not_x1 #(
			.L_y(111.5622)
		) gupo_inst (
			.in(dego),
			.y(gupo)
		);

	dmg_drlatch_ee #(
			.L_q(326.719)
		) gupu_inst (
			.d(d7),
			.ena(exuc),
			.ena_n(fyxo),
			.r_n(hude),
			.q(gupu),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(289.2656),
			.L_q_n(117.6719)
		) gura_inst (
			.d(d6),
			.ena(enuf),
			.ena_n(elas),
			.r_n(jybu),
			.q(ff17_d6),
			.q_n(gura_n)
		);

	dmg_not_x1 #(
			.L_y(26.82818)
		) gure_inst (
			.in(ff17),
			.y(gure)
		);

	dmg_not_x1 #(
			.L_y(181.4217)
		) guro_inst (
			.in(apu_reset),
			.y(guro)
		);

	dmg_or2 #(
			.L_y(717.9831)
		) guru_inst (
			.in1(fyry),
			.in2(apu_rd_n),
			.y(guru)
		);

	dmg_not_x1 #(
			.L_y(756.7654)
		) gusa_inst (
			.in(guve),
			.y(gusa)
		);

	dmg_not_if0 #(
			.L_y(1315.906)
		) guse_inst (
			.in(oam_parse_a2),
			.ena_n(oam_addr_parse_n),
			.y(oam_a2_n_tri)
		);

	dmg_not_x1 #(
			.L_y(152.9998)
		) gusu_inst (
			.in(v7),
			.y(gusu)
		);

	dmg_nor2 #(
			.L_y(268.2812)
		) gute_inst (
			.in1(hoxa),
			.in2(egad),
			.y(gute)
		);

	dmg_nor2 #(
			.L_y(332.2971)
		) gutu_inst (
			.in1(dyka),
			.in2(wyla),
			.y(gutu)
		);

	dmg_nor2 #(
			.L_y(979.0943)
		) guva_inst (
			.in1(ydug),
			.in2(const0),
			.y(guva)
		);

	dmg_or2 #(
			.L_y(1110.844)
		) guve_inst (
			.in1(sprite_save_en_n),
			.in2(foco),
			.y(guve)
		);

	dmg_not_x1 #(
			.L_y(104.3902)
		) guvu_inst (
			.in(fuwa),
			.y(guvu)
		);

	dmg_full_add #(
			.L_cout(118.7348),
			.L_sum(126.9687)
		) guxa_inst (
			.a(galo),
			.b(hora),
			.cin(aryl),
			.cout(guxa_c),
			.sum(sum0)
		);

	dmg_drlatch_ee #(
			.L_q(228.9686),
			.L_q_n(4558.923)
		) guxe_inst (
			.d(d7),
			.ena(gejo),
			.ena_n(gucy),
			.r_n(gove),
			.q(guxe),
			.q_n(ch3_amp_en_n)
		);

	dmg_nor2 #(
			.L_y(274.1252)
		) guza_inst (
			.in1(fery),
			.in2(fape),
			.y(guza)
		);

	dmg_nor2 #(
			.L_y(1052.141)
		) guze_inst (
			.in1(ygem),
			.in2(gyga),
			.y(guze)
		);

	dmg_xor #(
			.L_y(146.6247)
		) guzo_inst (
			.in1(fusa),
			.in2(h0_n),
			.y(guzo)
		);

	dmg_not_x1 #(
			.L_y(276.25)
		) guzu_inst (
			.in(haga),
			.y(guzu)
		);

	dmg_nor2 #(
			.L_y(172.3908)
		) guzy_inst (
			.in1(apu_reset),
			.in2(ch4_start),
			.y(guzy)
		);

	dmg_not_x1 #(
			.L_y(183.2811)
		) gyba_inst (
			.in(ch4_1mhz),
			.y(gyba)
		);

	dmg_not_if0 #(
			.L_y(1315.906)
		) gybu_inst (
			.in(oam_render_a2),
			.ena_n(oam_addr_render_n),
			.y(oam_a2_n_tri)
		);

	dmg_not_x1 #(
			.L_y(376.1252)
		) gyda_inst (
			.in(goju),
			.y(gyda)
		);

	dmg_not_x1 #(
			.L_y(1180.438)
		) gyfo_inst (
			.in(wyxo),
			.y(gyfo)
		);

	dmg_nor2 #(
			.L_y(194.4377)
		) gyfu_inst (
			.in1(foke),
			.in2(apu_reset),
			.y(gyfu)
		);

	dmg_nor2 #(
			.L_y(384.3594)
		) gyfy_inst (
			.in1(yloz),
			.in2(gede),
			.y(gyfy)
		);

	dmg_or2 #(
			.L_y(425.5317)
		) gyga_inst (
			.in1(geke),
			.in2(favo),
			.y(gyga)
		);

	dmg_not_x1 #(
			.L_y(94.82811)
		) gygu_inst (
			.in(fovo),
			.y(gygu)
		);

	dmg_not_x2 #(
			.L_y(2316.515)
		) gygy_inst (
			.in(gega),
			.y(sprite_sel5)
		);

	dmg_dlatch_ee #(
			.L_q_n(108.906)
		) gyho_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y0),
			.ena_n(enob),
			.q(),
			.q_n(gyho_n)
		);

	dmg_not_if0 #(
			.L_y(764.4689)
		) gyka_inst (
			.in(oam_render_a3),
			.ena_n(oam_addr_render_n),
			.y(oam_a3_n_tri)
		);

	dmg_dffr #(
			.L_q(867.7966),
			.L_q_n(139.7186)
		) gyko_inst (
			.d(gyko_n),
			.clk(galu),
			.r_n(gyre),
			.q(gyko),
			.q_n(gyko_n)
		);

	dmg_full_add #(
			.L_cout(230.0309),
			.L_sum(142.9066)
		) gyky_inst (
			.a(fuve),
			.b(xyju_n),
			.cin(feco_c),
			.cout(gyky_c),
			.sum(gyky)
		);

	dmg_xor #(
			.L_y(263.2345)
		) gylo_inst (
			.in1(aryl),
			.in2(fabu),
			.y(gylo)
		);

	dmg_nand2 #(
			.L_y(515.3132)
		) gylu_inst (
			.in1(d0),
			.in2(dyla),
			.y(gylu)
		);

	dmg_not_x2 #(
			.L_y(2086.22)
		) gyma_inst (
			.in(gyfy),
			.y(sprite_sel3)
		);

	dmg_dffr_cc_q #(
			.L_q(154.0626)
		) gyme_inst (
			.d(acc_d4),
			.clk(ch1_ld_sum),
			.clk_n(efex),
			.r_n(sum_reset_n),
			.q(gyme)
		);

	dmg_dlatch_ee #(
			.L_q_n(104.125)
		) gyno_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num7),
			.ena_n(fefo),
			.q(),
			.q_n(gyno_n)
		);

	dmg_not_x1 #(
			.L_y(491.4065)
		) gypa_inst (
			.in(duju),
			.y(gypa)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) gype_inst (
			.in(ff22_d5_n),
			.ena_n(heze),
			.y(d5)
		);

	dmg_drlatch_ee #(
			.L_q(150.875)
		) gypu_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x8),
			.ena_n(cexu),
			.r_n(sprite_rst8),
			.q(gypu),
			.q_n()
		);

	dmg_dffr #(
			.L_q(228.4376)
		) gyra_inst (
			.d(gyta),
			.clk(ch3_2mhz),
			.r_n(gaze),
			.q(gyra),
			.q_n()
		);

	dmg_nor3 #(
			.L_y(215.4223)
		) gyre_inst (
			.in1(apu_reset),
			.in2(ch2_restart),
			.in3(fujy),
			.y(gyre)
		);

	dmg_nor3 #(
			.L_y(199.2186)
		) gyry_inst (
			.in1(apu_reset),
			.in2(ch3_restart),
			.in3(foto),
			.y(gyry)
		);

	dmg_not_x1 #(
			.L_y(103.8589)
		) gysa_inst (
			.in(gyky),
			.y(sprite_y3_n)
		);

	dmg_not_x1 #(
			.L_y(599.2504)
		) gyse_inst (
			.in(wuse),
			.y(save_sprite_num6)
		);

	dmg_dffr #(
			.L_q(1205.673)
		) gysu_inst (
			.d(hoga),
			.clk(apu_phi),
			.r_n(gaso),
			.q(ch4_start),
			.q_n()
		);

	dmg_dffr #(
			.L_q(234.5467)
		) gyta_inst (
			.d(ch3_restart),
			.clk(fabo),
			.r_n(gaze),
			.q(gyta),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(93.23443)
		) gyte_inst (
			.in(dyka),
			.y(gyte)
		);

	dmg_not_x1 #(
			.L_y(948.282)
		) gyve_inst (
			.in(gufa),
			.y(ch4_lfsr_clk2)
		);

	dmg_not_x1 #(
			.L_y(1258.797)
		) gyvo_inst (
			.in(gape),
			.y(gyvo)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) gyza_inst (
			.in(funy_n),
			.ena_n(buwy),
			.y(d7)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) gyzo_inst (
			.in(foty_n),
			.ena_n(buwy),
			.y(d5)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) haca_inst (
			.in(ff1e_d6_n),
			.ena_n(gawa),
			.y(d6)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) hacu_inst (
			.in(gedu_n),
			.ena_n(hasu),
			.y(d7)
		);

	dmg_dffr #(
			.L_q_n(914.8126)
		) hada_inst (
			.d(d7),
			.clk(hawu),
			.r_n(gufo),
			.q(),
			.q_n(hada_n)
		);

	dmg_nor4 #(
			.L_y(178.2346)
		) hafe_inst (
			.in1(holy),
			.in2(jupu),
			.in3(ch2_restart),
			.in4(apu_reset),
			.y(hafe)
		);

	dmg_tffnl #(
			.L_q(2099.5),
			.L_q_n(200.812)
		) hafo_inst (
			.d(ff12_d4),
			.l(ch1_restart),
			.tclk_n(jufy),
			.q(ch1_env0),
			.q_n(hafo_n)
		);

	dmg_and2 #(
			.L_y(567.1091)
		) hafu_inst (
			.in1(apu_wr),
			.in2(ff12),
			.y(hafu)
		);

	dmg_and2 #(
			.L_y(280.4995)
		) haga_inst (
			.in1(apu_wr),
			.in2(ff1c),
			.y(haga)
		);

	dmg_not_x1 #(
			.L_y(85.53128)
		) hake_inst (
			.in(hufu),
			.y(hake)
		);

	dmg_full_add #(
			.L_cout(825.0314),
			.L_sum(761.282)
		) halu_inst (
			.a(jode),
			.b(hopa),
			.cin(guxa_c),
			.cout(halu_c),
			.sum(sum1)
		);

	dmg_not_x4 #(
			.L_y(1856.453)
		) hama_inst (
			.in(jeso_n),
			.y(hama_512khz)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) hamu_inst (
			.in(ff1c_d5_n),
			.ena_n(henu),
			.y(d5)
		);

	dmg_or2 #(
			.L_y(465.3749)
		) hamy_inst (
			.in1(haxe),
			.in2(apu_rd_n),
			.y(hamy)
		);

	dmg_nor5 #(
			.L_y(391.2655)
		) hano_inst (
			.in1(ff12_d3),
			.in2(ch1_env0),
			.in3(ch1_env1),
			.in4(ch1_env2),
			.in5(ch1_env3),
			.y(hano)
		);

	dmg_dffr #(
			.L_q(166.547)
		) hape_inst (
			.d(jaju),
			.clk(ch4_lfsr_clk2),
			.r_n(goge),
			.q(hape),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(660.3433)
		) hapo_inst (
			.in(reset2_n),
			.y(hapo)
		);

	dmg_not_x1 #(
			.L_y(102.7971)
		) hapu_inst (
			.in(gaty),
			.y(hapu)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) hapy_inst (
			.in(gafo_n),
			.ena_n(heze),
			.y(d7)
		);

	dmg_or2 #(
			.L_y(601.6412)
		) hasu_inst (
			.in1(gony),
			.in2(apu_rd_n),
			.y(hasu)
		);

	dmg_not_x1 #(
			.L_y(1394.531)
		) hato_inst (
			.in(apu_reset),
			.y(hato)
		);

	dmg_drlatch_ee #(
			.L_q(113.1561),
			.L_q_n(674.4217)
		) hava_inst (
			.d(d2),
			.ena(gere),
			.ena_n(jede),
			.r_n(jybu),
			.q(ff17_d2),
			.q_n(ff17_d2_n)
		);

	dmg_dffsr #(
			.L_q(1626.953)
		) havo_inst (
			.d(sum2),
			.clk(ch1_freq_upd2),
			.s_n(golo),
			.r_n(gyfu),
			.q(acc_d2),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) havu_inst (
			.in(ff17_d2_n),
			.ena_n(gexa),
			.y(d2)
		);

	dmg_nand2 #(
			.L_y(85.26581)
		) hawu_inst (
			.in1(ff26),
			.in2(apu_wr),
			.y(hawu)
		);

	dmg_nand2 #(
			.L_y(228.1718)
		) hawy_inst (
			.in1(acc_d2),
			.in2(kape),
			.y(hawy)
		);

	dmg_not_x1 #(
			.L_y(119.7965)
		) haxe_inst (
			.in(ff12),
			.y(haxe)
		);

	dmg_nor_latch #(
			.L_q_n(172.6563)
		) hazo_inst (
			.s(helu),
			.r(ch4_start),
			.q(),
			.q_n(hazo_n)
		);

	dmg_not_x1 #(
			.L_y(629.5317)
		) hecy_inst (
			.in(ch1_ld_sum),
			.y(hecy)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) heda_inst (
			.in(garu_n),
			.ena_n(hasu),
			.y(d4)
		);

	dmg_nor2 #(
			.L_y(244.6404)
		) hefa_inst (
			.in1(apu_rd_n),
			.in2(gepa),
			.y(hefa)
		);

	dmg_nor2 #(
			.L_y(80.21887)
		) hefo_inst (
			.in1(ch3_2mhz),
			.in2(ch3_fdis),
			.y(hefo)
		);

	dmg_xor #(
			.L_y(439.0781)
		) hefy_inst (
			.in1(aryl),
			.in2(jolu),
			.y(hefy)
		);

	dmg_not_x1 #(
			.L_y(371.875)
		) heky_inst (
			.in(apu_reset),
			.y(heky)
		);

	dmg_dffr_cc_q #(
			.L_q(770.5786)
		) hele_inst (
			.d(gopo),
			.clk(ch1_ld_sum),
			.clk_n(hecy),
			.r_n(sum_reset_n),
			.q(hele)
		);

	dmg_not_x1 #(
			.L_y(112.0934)
		) helu_inst (
			.in(fale),
			.y(helu)
		);

	dmg_not_x1 #(
			.L_y(104.3903)
		) hema_inst (
			.in(huno),
			.y(hema)
		);

	dmg_tffnl #(
			.L_q(1455.89),
			.L_q_n(179.8286)
		) hemy_inst (
			.d(ff12_d5),
			.l(ch1_restart),
			.tclk_n(hyto),
			.q(ch1_env1),
			.q_n(hemy_n)
		);

	dmg_dffr #(
			.L_q(150.6089)
		) heno_inst (
			.d(hory),
			.clk(ch4_lfsr_clk1),
			.r_n(goge),
			.q(heno),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(274.6559)
		) henu_inst (
			.in1(ff1c),
			.in2(jotu),
			.y(henu)
		);

	dmg_dffr #(
			.L_q(209.5785)
		) hepa_inst (
			.d(javo),
			.clk(ch4_lfsr_clk1),
			.r_n(goge),
			.q(hepa),
			.q_n()
		);

	dmg_dffr #(
			.L_q(180.6253)
		) hepo_inst (
			.d(gufy),
			.clk(jopa),
			.r_n(hypa),
			.q(hepo),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(34.26545),
			.L_q_n(112.6254)
		) hepu_inst (
			.d(jany),
			.l(gypa),
			.tclk_n(hevy),
			.q(hepu),
			.q_n(hepu_n)
		);

	dmg_nor2 #(
			.L_y(496.7189)
		) hera_inst (
			.in1(ch3_frst),
			.in2(ch3_restart),
			.y(hera)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) here_inst (
			.in(gufe_n),
			.ena_n(guru),
			.y(d5)
		);

	dmg_tffnl #(
			.L_q(163.3594),
			.L_q_n(103.3279)
		) hero_inst (
			.d(jupy),
			.l(gypa),
			.tclk_n(hepu),
			.q(ch2_ftick),
			.q_n(hero_n)
		);

	dmg_nor2 #(
			.L_y(85.00032)
		) hery_inst (
			.in1(ch4_amp_en_n),
			.in2(apu_reset),
			.y(hery)
		);

	dmg_ao22 #(
			.L_y(83.14035)
		) hesu_inst (
			.in1(ff12_d3),
			.in2(ch1_env2),
			.in3(hoko_n),
			.in4(ff12_d3_n),
			.y(hesu)
		);

	dmg_ao22 #(
			.L_y(264.8278)
		) heto_inst (
			.in1(ff12_d3),
			.in2(ch1_env1),
			.in3(hemy_n),
			.in4(ff12_d3_n),
			.y(heto)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) heve_inst (
			.in(jena_n),
			.ena_n(hocu),
			.y(d6)
		);

	dmg_tffnl #(
			.L_q(1729.219)
		) hevo_inst (
			.d(ff12_d7),
			.l(ch1_restart),
			.tclk_n(hesu),
			.q(ch1_env3),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(114.2188),
			.L_q_n(200.8122)
		) hevy_inst (
			.d(jefu),
			.l(gypa),
			.tclk_n(gala),
			.q(hevy),
			.q_n(hevy_n)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) hewa_inst (
			.in(jaxo_n),
			.ena_n(hocu),
			.y(d5)
		);

	dmg_full_add #(
			.L_cout(132.0157),
			.L_sum(255.2657)
		) hexo_inst (
			.a(gyme),
			.b(jete),
			.cin(jory_c),
			.cout(hexo_c),
			.sum(sum4)
		);

	dmg_or2 #(
			.L_y(615.9844)
		) heze_inst (
			.in1(gugo),
			.in2(apu_rd_n),
			.y(heze)
		);

	dmg_dffr #(
			.L_q(228.4369)
		) hezu_inst (
			.d(hyro),
			.clk(ch4_lfsr_clk1),
			.r_n(goge),
			.q(hezu),
			.q_n()
		);

	dmg_high_ram #(
			.L_d0(31524.23),
			.L_d1(31397.37),
			.L_d2(33777.41),
			.L_d3(33882.07),
			.L_d4(33977.16),
			.L_d5(38893.62),
			.L_d6(35163.97),
			.L_d7(36878.58)
		) high_ram_inst (
			.d0(d7),
			.d1(d6),
			.d2(d5),
			.d3(d4),
			.d4(d3),
			.d5(d2),
			.d6(d1),
			.d7(d0),
			.col0(hram_a1_na0_n),
			.col1(hram_a1_na0),
			.col2(hram_a1a0_n),
			.col3(hram_a1a0),
			.a2(a2),
			.a2_n(hram_a2_n),
			.a3(a3),
			.a3_n(hram_a3_n),
			.a4(a4),
			.a4_n(hram_a4_n),
			.a5(a5),
			.a5_n(hram_a5_n),
			.a6(a6),
			.a6_n(hram_a6_n),
			.oe_n(hram_oe_n),
			.oe(hram_oe),
			.wr(hram_wr),
			.bl_pch_n(hram_bl_precharge_n),
			.wldrv_pch_n(hram_wldrv_precharge_n),
			.wldrv_ena(hram_wldrv_ena)
		);

	dmg_nor2 #(
			.L_y(289.797)
		) hobu_inst (
			.in1(apu_reset),
			.in2(jocy),
			.y(hobu)
		);

	dmg_nor5 #(
			.L_y(3792.063)
		) hoca_inst (
			.in1(ff12_d3),
			.in2(ff12_d4),
			.in3(ff12_d5),
			.in4(ff12_d6),
			.in5(ff12_d7),
			.y(ch1_amp_en_n)
		);

	dmg_or2 #(
			.L_y(818.3901)
		) hocu_inst (
			.in1(gago),
			.in2(apu_rd_n),
			.y(hocu)
		);

	dmg_drlatch_ee #(
			.L_q(325.922),
			.L_q_n(480.2498)
		) hody_inst (
			.d(d5),
			.ena(haga),
			.ena_n(guzu),
			.r_n(guro),
			.q(ff1c_d5),
			.q_n(ff1c_d5_n)
		);

	dmg_or3 #(
			.L_y(1376.469)
		) hofo_inst (
			.in1(jopa),
			.in2(jupu),
			.in3(ch2_eg_stop),
			.y(hofo)
		);

	dmg_drlatch_ee #(
			.L_q(1302.625)
		) hoga_inst (
			.d(d7),
			.ena(goxo),
			.ena_n(foxe),
			.r_n(guzy),
			.q(hoga),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) hoge_inst (
			.in(gozo_n),
			.ena_n(hasu),
			.y(d6)
		);

	dmg_tffnl #(
			.L_q(1692.296),
			.L_q_n(163.891)
		) hoko_inst (
			.d(ff12_d6),
			.l(ch1_restart),
			.tclk_n(heto),
			.q(ch1_env2),
			.q_n(hoko_n)
		);

	dmg_nand2 #(
			.L_y(160.7036)
		) hola_inst (
			.in1(acc_d1),
			.in2(kape),
			.y(hola)
		);

	dmg_dffsr #(
			.L_q(1323.344)
		) holu_inst (
			.d(sum5),
			.clk(ch1_freq_upd2),
			.s_n(kypa),
			.r_n(kaju),
			.q(acc_d5),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(76.49992)
		) holy_inst (
			.in1(horu_512hz),
			.in2(gade),
			.y(holy)
		);

	dmg_not_x1 #(
			.L_y(749.3282)
		) homu_inst (
			.in(ch1_ld_sum),
			.y(homu)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) hono_inst (
			.in(ff12_d3_n),
			.ena_n(hocu),
			.y(d3)
		);

	dmg_and3 #(
			.L_y(925.9688)
		) hony_inst (
			.in1(ff26_d4_b),
			.in2(jeco),
			.in3(ff1c),
			.y(hony)
		);

	dmg_dffr_cc_q #(
			.L_q(168.672)
		) hopa_inst (
			.d(gela),
			.clk(ch1_ld_sum),
			.clk_n(hecy),
			.r_n(sum_reset_n),
			.q(hopa)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) hope_inst (
			.in(hada_n),
			.ena_n(jure),
			.y(d7)
		);

	dmg_dffsr #(
			.L_q(1898.422)
		) hopo_inst (
			.d(sum7),
			.clk(ch1_freq_upd2),
			.s_n(etol),
			.r_n(esel),
			.q(acc_d7),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(413.0467)
		) hora_inst (
			.d(gylo),
			.clk(ch1_ld_sum),
			.clk_n(hecy),
			.r_n(sum_reset_n),
			.q(hora)
		);

	dmg_drlatch_ee #(
			.L_q(80.48454),
			.L_q_n(442.7964)
		) hore_inst (
			.d(d1),
			.ena(gere),
			.ena_n(jede),
			.r_n(jybu),
			.q(ff17_d1),
			.q_n(ff17_d1_n)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) horo_inst (
			.in(gura_n),
			.ena_n(guru),
			.y(d6)
		);

	dmg_not_x3 #(
			.L_y(3962.064)
		) horu_inst (
			.in(gexy),
			.y(horu_512hz)
		);

	dmg_dffr #(
			.L_q(287.406)
		) hory_inst (
			.d(hepa),
			.clk(ch4_lfsr_clk1),
			.r_n(goge),
			.q(hory),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(257.9217)
		) hoso_inst (
			.in1(ff22),
			.in2(apu_wr),
			.y(hoso)
		);

	dmg_not_x1 #(
			.L_y(120.8593)
		) hota_inst (
			.in(byfe_128hz),
			.y(hota)
		);

	dmg_drlatch_ee #(
			.L_q(104.125),
			.L_q_n(367.6249)
		) hoto_inst (
			.d(d6),
			.ena(gygu),
			.ena_n(fovo),
			.r_n(heky),
			.q(ff1e_d6),
			.q_n(ff1e_d6_n)
		);

	dmg_not_x2 #(
			.L_y(435.8911)
		) hova_inst (
			.in(humo),
			.y(hova)
		);

	dmg_not_x2 #(
			.L_y(1243.656)
		) hovo_inst (
			.in(gute),
			.y(hovo)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) howu_inst (
			.in(jaty_n),
			.ena_n(hocu),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(113.422)
		) hoxa_inst (
			.in(ff1d),
			.y(hoxa)
		);

	dmg_not_x1 #(
			.L_y(80.48476)
		) hoxe_inst (
			.in(acc_d1),
			.y(hoxe)
		);

	dmg_nand2 #(
			.L_y(371.8758)
		) hozu_inst (
			.in1(acc_d0),
			.in2(kape),
			.y(hozu)
		);

	dmg_not_x1 #(
			.L_y(424.7337)
		) huce_inst (
			.in(gofu),
			.y(huce)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) huco_inst (
			.in(ff1c_d6_n),
			.ena_n(henu),
			.y(d6)
		);

	dmg_and2 #(
			.L_y(851.5935)
		) huda_inst (
			.in1(ff1e),
			.in2(apu_wr),
			.y(huda)
		);

	dmg_not_x1 #(
			.L_y(1404.891)
		) hude_inst (
			.in(apu_reset),
			.y(hude)
		);

	dmg_not_x1 #(
			.L_y(204.531)
		) hufa_inst (
			.in(huda),
			.y(hufa)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) hufo_inst (
			.in(japu_n),
			.ena_n(fuva),
			.y(d2)
		);

	dmg_nand5 #(
			.L_y(323.0001)
		) hufu_inst (
			.in1(ff12_d3),
			.in2(ch1_env0),
			.in3(ch1_env1),
			.in4(ch1_env2),
			.in5(ch1_env3),
			.y(hufu)
		);

	dmg_drlatch_ee #(
			.L_q(362.5784),
			.L_q_n(608.8132)
		) huky_inst (
			.d(d6),
			.ena(haga),
			.ena_n(guzu),
			.r_n(guro),
			.q(ff1c_d6),
			.q_n(ff1c_d6_n)
		);

	dmg_nand2 #(
			.L_y(154.5935)
		) huma_inst (
			.in1(ff19),
			.in2(gado),
			.y(huma)
		);

	dmg_and2 #(
			.L_y(275.7189)
		) humo_inst (
			.in1(apu_wr),
			.in2(ff22),
			.y(humo)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) huna_inst (
			.in(hevy_n),
			.ena_n(hypo),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(277.8436),
			.L_q_n(78.62457)
		) huno_inst (
			.d(huno_n),
			.clk(hyfo),
			.r_n(gafu),
			.q(huno),
			.q_n(huno_n)
		);

	dmg_not_x1 #(
			.L_y(80.75023)
		) huny_inst (
			.in(acc_d2),
			.y(huny)
		);

	dmg_and2 #(
			.L_y(104.3908)
		) hupa_inst (
			.in1(huno),
			.in2(ch3_2mhz),
			.y(hupa)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) hupe_inst (
			.in(gata_n),
			.ena_n(guru),
			.y(d4)
		);

	dmg_xnor #(
			.L_y(334.6881)
		) hura_inst (
			.in1(hyro),
			.in2(hezu),
			.y(lfsr_bit13_eq_bit14)
		);

	dmg_nor2 #(
			.L_y(181.6874)
		) hury_inst (
			.in1(horu_512hz),
			.in2(gexe),
			.y(hury)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) huvu_inst (
			.in(ff17_d0_n),
			.ena_n(gexa),
			.y(d0)
		);

	dmg_tffnl #(
			.L_q(130.9529),
			.L_q_n(236.141)
		) hyfe_inst (
			.d(acc_d1),
			.l(fume),
			.tclk_n(gaxe),
			.q(hyfe),
			.q_n(hyfe_n)
		);

	dmg_not_x1 #(
			.L_y(128.2969)
		) hyfo_inst (
			.in(ch3_ftick),
			.y(hyfo)
		);

	dmg_drlatch_ee #(
			.L_q(176.1091),
			.L_q_n(338.6719)
		) hyfu_inst (
			.d(d0),
			.ena(gere),
			.ena_n(jede),
			.r_n(jybu),
			.q(ff17_d0),
			.q_n(ff17_d0_n)
		);

	dmg_dffsr #(
			.L_q(1056.922)
		) hyka_inst (
			.d(sum0),
			.clk(ch1_freq_upd2),
			.s_n(gylu),
			.r_n(efor),
			.q(acc_d0),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(272.7974),
			.L_q_n(159.375)
		) hyke_inst (
			.d(acc_d5),
			.l(dega),
			.tclk_n(jema),
			.q(hyke),
			.q_n(hyke_n)
		);

	dmg_or2 #(
			.L_y(240.1249)
		) hyle_inst (
			.in1(apu_reset),
			.in2(ch2_restart),
			.y(hyle)
		);

	dmg_nor2 #(
			.L_y(171.3282)
		) hyly_inst (
			.in1(ch2_restart),
			.in2(jopa),
			.y(hyly)
		);

	dmg_not_x1 #(
			.L_y(94.56244)
		) hyne_inst (
			.in(apu_reset),
			.y(hyne)
		);

	dmg_and3 #(
			.L_y(135.7344)
		) hyno_inst (
			.in1(jyfu),
			.in2(jyre),
			.in3(jyco),
			.y(hyno)
		);

	dmg_nor2 #(
			.L_y(323.5316)
		) hypa_inst (
			.in1(ch2_restart),
			.in2(apu_reset),
			.y(hypa)
		);

	dmg_or2 #(
			.L_y(901.5314)
		) hypo_inst (
			.in1(gote),
			.in2(fape),
			.y(hypo)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) hyre_inst (
			.in(ff17_d1_n),
			.ena_n(gexa),
			.y(d1)
		);

	dmg_dffr #(
			.L_q(259.2502)
		) hyro_inst (
			.d(heno),
			.clk(ch4_lfsr_clk1),
			.r_n(goge),
			.q(hyro),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) hyry_inst (
			.in(gage_n),
			.ena_n(guru),
			.y(d7)
		);

	dmg_ao22 #(
			.L_y(638.5627)
		) hyto_inst (
			.in1(ff12_d3),
			.in2(ch1_env0),
			.in3(hafo_n),
			.in4(ff12_d3_n),
			.y(hyto)
		);

	dmg_nor2 #(
			.L_y(276.7812)
		) hyvu_inst (
			.in1(apu_reset),
			.in2(jehy),
			.y(hyvu)
		);

	dmg_dffsr #(
			.L_q(2008.391)
		) hyxu_inst (
			.d(sum6),
			.clk(ch1_freq_upd2),
			.s_n(eler),
			.r_n(eluf),
			.q(acc_d6),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) jaca_inst (
			.in(ff12_d1_n),
			.ena_n(hamy),
			.y(d1)
		);

	dmg_drlatch_ee #(
			.L_q(576.9374)
		) jacy_inst (
			.d(d2),
			.ena(huda),
			.ena_n(hufa),
			.r_n(kopy),
			.q(jacy),
			.q_n()
		);

	dmg_or2 #(
			.L_y(296.7031)
		) jade_inst (
			.in1(hano),
			.in2(hake),
			.y(jade)
		);

	dmg_nor2 #(
			.L_y(783.3282)
		) jado_inst (
			.in1(apu_reset),
			.in2(koko),
			.y(jado)
		);

	dmg_and2 #(
			.L_y(598.1879)
		) jafa_inst (
			.in1(ff1d),
			.in2(apu_wr),
			.y(jafa)
		);

	dmg_drlatch_ee #(
			.L_q(1156.797),
			.L_q_n(1009.374)
		) jafy_inst (
			.d(d3),
			.ena(gaxu),
			.ena_n(kagy),
			.r_n(hato),
			.q(ff12_d3),
			.q_n(ff12_d3_n)
		);

	dmg_not_x1 #(
			.L_y(115.2812)
		) jago_inst (
			.in(sck_dir),
			.y(jago)
		);

	dmg_dffr #(
			.L_q(153.5312)
		) jaju_inst (
			.d(kywy),
			.clk(ch4_lfsr_clk2),
			.r_n(goge),
			.q(jaju),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1164.5)
		) jake_inst (
			.in(hyly),
			.y(jake)
		);

	dmg_drlatch_ee #(
			.L_q_n(744.2817)
		) jaky_inst (
			.d(d2),
			.ena(humo),
			.ena_n(hova),
			.r_n(apu_reset5_n),
			.q(),
			.q_n(ff22_d2_n)
		);

	dmg_dffr #(
			.L_q(986.7969)
		) jale_inst (
			.d(d2),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(jale),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(133.078),
			.L_q_n(208.7809)
		) jamy_inst (
			.d(d3),
			.ena(kuhu),
			.ena_n(hoso),
			.r_n(hyne),
			.q(ff22_d3),
			.q_n(ff22_d3_n)
		);

	dmg_drlatch_ee #(
			.L_q(391.5312)
		) jany_inst (
			.d(d1),
			.ena(jenu),
			.ena_n(kysa),
			.r_n(kypu),
			.q(jany),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(370.8127)
		) jape_inst (
			.d(hefy),
			.clk(ch1_ld_sum),
			.clk_n(hecy),
			.r_n(sum_reset_n),
			.q(jape)
		);

	dmg_tffnl #(
			.L_q(139.7191),
			.L_q_n(167.3434)
		) japu_inst (
			.d(jacy),
			.l(jera),
			.tclk_n(keza),
			.q(ch3_ftick),
			.q_n(japu_n)
		);

	dmg_drlatch_ee #(
			.L_q_n(553.031)
		) jare_inst (
			.d(d0),
			.ena(humo),
			.ena_n(hova),
			.r_n(apu_reset5_n),
			.q(),
			.q_n(ff22_d0_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) jaro_inst (
			.in(hepu_n),
			.ena_n(hypo),
			.y(d1)
		);

	dmg_drlatch_ee #(
			.L_q(507.078),
			.L_q_n(181.1563)
		) jaty_inst (
			.d(d4),
			.ena(gaxu),
			.ena_n(kagy),
			.r_n(hato),
			.q(ff12_d4),
			.q_n(jaty_n)
		);

	dmg_dffr #(
			.L_q(365.7654)
		) javo_inst (
			.d(jepe),
			.clk(ch4_lfsr_clk2),
			.r_n(goge),
			.q(javo),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(343.1879)
		) jaxa_inst (
			.d(d2),
			.ena(jafa),
			.ena_n(kuly),
			.r_n(kuha),
			.q(jaxa),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(802.7192),
			.L_q_n(281.0311)
		) jaxo_inst (
			.d(d5),
			.ena(gaxu),
			.ena_n(kagy),
			.r_n(hato),
			.q(ff12_d5),
			.q_n(jaxo_n)
		);

	dmg_not_x1 #(
			.L_y(107.8437)
		) jeco_inst (
			.in(apu_rd_n),
			.y(jeco)
		);

	dmg_not_x1 #(
			.L_y(284.2191)
		) jede_inst (
			.in(gere),
			.y(jede)
		);

	dmg_dffsr #(
			.L_q(589.1569)
		) jefa_inst (
			.d(goga),
			.clk(ch1_shift_clk),
			.s_n(hola),
			.r_n(hobu),
			.q(jefa),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(576.9373)
		) jefe_inst (
			.d(d3),
			.ena(jafa),
			.ena_n(kuly),
			.r_n(kuha),
			.q(jefe),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(189.3912)
		) jefu_inst (
			.d(d0),
			.ena(jenu),
			.ena_n(kysa),
			.r_n(kypu),
			.q(jefu),
			.q_n()
		);

	dmg_and2 #(
			.L_y(94.56284)
		) jehy_inst (
			.in1(kape),
			.in2(huny),
			.y(jehy)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) jeke_inst (
			.in(hero_n),
			.ena_n(hypo),
			.y(d2)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) jeku_inst (
			.in(kolo),
			.ena_n(byzo),
			.y(d3)
		);

	dmg_tffnl #(
			.L_q(167.0779),
			.L_q_n(156.1876)
		) jema_inst (
			.d(acc_d4),
			.l(dega),
			.tclk_n(kype),
			.q(jema),
			.q_n(jema_n)
		);

	dmg_nor_latch #(
			.L_q(189.9221)
		) jeme_inst (
			.s(hepo),
			.r(hyle),
			.q(ch2_eg_stop),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(293.781)
		) jemo_inst (
			.d(d0),
			.ena(huda),
			.ena_n(hufa),
			.r_n(kopy),
			.q(jemo),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(632.4526),
			.L_q_n(98.54665)
		) jena_inst (
			.d(d6),
			.ena(gaxu),
			.ena_n(kagy),
			.r_n(hato),
			.q(ff12_d6),
			.q_n(jena_n)
		);

	dmg_and2 #(
			.L_y(829.8122)
		) jenu_inst (
			.in1(ff19),
			.in2(apu_wr),
			.y(jenu)
		);

	dmg_dffr #(
			.L_q(294.8439)
		) jepe_inst (
			.d(kavu),
			.clk(ch4_lfsr_clk2),
			.r_n(goge),
			.q(jepe),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(536.5621)
		) jera_inst (
			.in(hera),
			.y(jera)
		);

	dmg_drlatch_ee #(
			.L_q_n(728.3438)
		) jero_inst (
			.d(d1),
			.ena(humo),
			.ena_n(hova),
			.r_n(apu_reset5_n),
			.q(),
			.q_n(ff22_d1_n)
		);

	dmg_nand_latch #(
			.L_q_n(142.6409)
		) jery_inst (
			.s_n(hapu),
			.r_n(hery),
			.q(),
			.q_n(ch4_fdis)
		);

	dmg_dffr #(
			.L_q(124.3127),
			.L_q_n(191.5158)
		) jeso_inst (
			.d(jeso_n),
			.clk(ch4_1mhz),
			.r_n(apu_reset5_n),
			.q(jeso_512k),
			.q_n(jeso_n)
		);

	dmg_dffr_cc_q #(
			.L_q(125.9064)
		) jete_inst (
			.d(kefe),
			.clk(ch1_ld_sum),
			.clk_n(homu),
			.r_n(sum_reset_n),
			.q(jete)
		);

	dmg_drlatch_ee #(
			.L_q(346.1094)
		) jety_inst (
			.d(d1),
			.ena(huda),
			.ena_n(hufa),
			.r_n(kopy),
			.q(jety),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(137.8594)
		) jeva_inst (
			.in(ff60_d0),
			.y(jeva)
		);

	dmg_tffnl #(
			.L_q(160.703)
		) jevy_inst (
			.d(ff17_d2_n),
			.l(jake),
			.tclk_n(jona),
			.q(jevy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) jeza_inst (
			.in(kepa_n),
			.ena_n(hovo),
			.y(d5)
		);

	dmg_and2 #(
			.L_y(80.48475)
		) jocy_inst (
			.in1(kape),
			.in2(hoxe),
			.y(jocy)
		);

	dmg_dffr_cc_q #(
			.L_q(270.9374)
		) jode_inst (
			.d(acc_d1),
			.clk(ch1_ld_sum),
			.clk_n(kede),
			.r_n(sum_reset_n),
			.q(jode)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) jofo_inst (
			.in(kutu_n),
			.ena_n(hovo),
			.y(d0)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) joku_inst (
			.in(ff12_d2_n),
			.ena_n(hamy),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(264.5619)
		) jola_inst (
			.in(kere),
			.y(jola)
		);

	dmg_dffsr #(
			.L_q(260.844)
		) jolu_inst (
			.d(jota),
			.clk(ejyb),
			.s_n(kyry),
			.r_n(keto),
			.q(jolu),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(156.4531),
			.L_q_n(375.3281)
		) joma_inst (
			.d(d2),
			.ena(hafu),
			.ena_n(kygy),
			.r_n(hato),
			.q(ff12_d2),
			.q_n(ff12_d2_n)
		);

	dmg_tffnl #(
			.L_q(227.1095)
		) jona_inst (
			.d(ff17_d1_n),
			.l(jake),
			.tclk_n(jore),
			.q(jona),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(119.2658)
		) jone_inst (
			.in(byfe_128hz),
			.y(jone)
		);

	dmg_dffr #(
			.L_q(484.5)
		) jopa_inst (
			.d(kyvo),
			.clk(horu_512hz),
			.r_n(hafe),
			.q(jopa),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(439.8753),
			.L_q_n(102.7967)
		) jopu_inst (
			.d(d7),
			.ena(gaxu),
			.ena_n(kagy),
			.r_n(hato),
			.q(ff12_d7),
			.q_n(jopu_n)
		);

	dmg_nand2 #(
			.L_y(115.0157)
		) jora_inst (
			.in1(kage),
			.in2(ff22),
			.y(jora)
		);

	dmg_tffnl #(
			.L_q(314.5003)
		) jore_inst (
			.d(ff17_d0_n),
			.l(jake),
			.tclk_n(kene),
			.q(jore),
			.q_n()
		);

	dmg_full_add #(
			.L_cout(144.2346),
			.L_sum(534.4374)
		) jory_inst (
			.a(jyme),
			.b(jape),
			.cin(jule_c),
			.cout(jory_c),
			.sum(sum3)
		);

	dmg_dffsr #(
			.L_q(342.1255)
		) jota_inst (
			.d(fude),
			.clk(ejyb),
			.s_n(kola),
			.r_n(kybo),
			.q(jota),
			.q_n()
		);

	dmg_dffr #(
			.L_q(342.3902)
		) joto_inst (
			.d(lfsr_bit13_eq_bit14),
			.clk(jyja),
			.r_n(goge),
			.q(joto),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(262.7031)
		) jotu_inst (
			.in(apu_rd_n),
			.y(jotu)
		);

	dmg_tffnl #(
			.L_q(241.7187)
		) jova_inst (
			.d(ff12_d0_n),
			.l(kuxu),
			.tclk_n(jola),
			.q(jova),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(995.0316)
		) jove_inst (
			.d(d5),
			.ena(kota),
			.ena_n(kyho),
			.r_n(kuha),
			.q(jove),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(309.9845)
		) jovy_inst (
			.d(d1),
			.ena(jafa),
			.ena_n(kuly),
			.r_n(kuha),
			.q(jovy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) jude_inst (
			.in(kemu_n),
			.ena_n(hovo),
			.y(d3)
		);

	dmg_ao22 #(
			.L_y(85.79676)
		) jufy_inst (
			.in1(ff12_d3),
			.in2(kake),
			.in3(kake),
			.in4(ff12_d3_n),
			.y(jufy)
		);

	dmg_not_x1 #(
			.L_y(2145.719)
		) juju_inst (
			.in(ch1_ld_shift_n),
			.y(juju)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) juke_inst (
			.in(kygu_n),
			.ena_n(hovo),
			.y(d4)
		);

	dmg_full_add #(
			.L_cout(144.7651),
			.L_sum(112.3597)
		) jule_inst (
			.a(kare),
			.b(hele),
			.cin(halu_c),
			.cout(jule_c),
			.sum(sum2)
		);

	dmg_not_x1 #(
			.L_y(119.2654)
		) julo_inst (
			.in(d5),
			.y(julo)
		);

	dmg_nor3 #(
			.L_y(841.5)
		) jupu_inst (
			.in1(ff17_d0),
			.in2(ff17_d1),
			.in3(ff17_d2),
			.y(jupu)
		);

	dmg_drlatch_ee #(
			.L_q(489.0157)
		) jupy_inst (
			.d(d2),
			.ena(jenu),
			.ena_n(kysa),
			.r_n(kypu),
			.q(jupy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) jura_inst (
			.in(keza_n),
			.ena_n(fuva),
			.y(d1)
		);

	dmg_nand2 #(
			.L_y(180.8906)
		) jure_inst (
			.in1(kydu),
			.in2(ff26),
			.y(jure)
		);

	dmg_drlatch_ee #(
			.L_q(201.6093),
			.L_q_n(604.0318)
		) jusa_inst (
			.d(d0),
			.ena(hafu),
			.ena_n(kygy),
			.r_n(hato),
			.q(ff12_d0),
			.q_n(ff12_d0_n)
		);

	dmg_not_x1 #(
			.L_y(138.9218)
		) juta_inst (
			.in(acc_d0),
			.y(juta)
		);

	dmg_dffr #(
			.L_q(732.328)
		) jute_inst (
			.d(d0),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(jute),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(854.5154)
		) juty_inst (
			.in(hefo),
			.y(juty)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) juvy_inst (
			.in(keju_n),
			.ena_n(fuva),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(191.7813)
		) juwa_inst (
			.in(ch4_active),
			.y(ch4_active_n)
		);

	dmg_dffr #(
			.L_q(550.9064)
		) juxe_inst (
			.d(hape),
			.clk(ch4_lfsr_clk2),
			.r_n(goge),
			.q(juxe),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(124.0468),
			.L_q_n(388.6091)
		) juzy_inst (
			.d(d1),
			.ena(hafu),
			.ena_n(kygy),
			.r_n(hato),
			.q(ff12_d1),
			.q_n(ff12_d1_n)
		);

	dmg_not_x1 #(
			.L_y(958.9054)
		) jybu_inst (
			.in(apu_reset),
			.y(jybu)
		);

	dmg_tffnl #(
			.L_q(285.8123)
		) jyco_inst (
			.d(ff22_d0_n),
			.l(huce),
			.tclk_n(kanu),
			.q(jyco),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(81.54666)
		) jyfu_inst (
			.d(ff22_d2_n),
			.l(huce),
			.tclk_n(jyre),
			.q(jyfu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(53.92144)
		) jyja_inst (
			.in(ch4_lfsr_clk1),
			.y(jyja)
		);

	dmg_dffsr #(
			.L_q(1297.578)
		) jyka_inst (
			.d(sum1),
			.clk(ch1_freq_upd2),
			.s_n(geta),
			.r_n(gato),
			.q(acc_d1),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(243.5781)
		) jyme_inst (
			.d(acc_d3),
			.clk(ch1_ld_sum),
			.clk_n(kede),
			.r_n(sum_reset_n),
			.q(jyme)
		);

	dmg_dffr #(
			.L_q(188.0628),
			.L_q_n(220.4688)
		) jyna_inst (
			.d(jyna_n),
			.clk(hota),
			.r_n(katy),
			.q(jyna),
			.q_n(jyna_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) jyne_inst (
			.in(ff12_d0_n),
			.ena_n(hamy),
			.y(d0)
		);

	dmg_drlatch_ee #(
			.L_q(904.188)
		) jypo_inst (
			.d(d4),
			.ena(jafa),
			.ena_n(kuly),
			.r_n(kuha),
			.q(jypo),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(289.2652)
		) jyre_inst (
			.d(ff22_d1_n),
			.l(huce),
			.tclk_n(jyco),
			.q(jyre),
			.q_n()
		);

	dmg_or2 #(
			.L_y(1635.453)
		) jyro_inst (
			.in1(hada_n),
			.in2(hapo),
			.y(jyro)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) jyse_inst (
			.in(jopu_n),
			.ena_n(hocu),
			.y(d7)
		);

	dmg_tffnl #(
			.L_q(173.984),
			.L_q_n(228.4377)
		) jyty_inst (
			.d(acc_d2),
			.l(fume),
			.tclk_n(hyfe),
			.q(jyty),
			.q_n(jyty_n)
		);

	dmg_or2 #(
			.L_y(106.7814)
		) kaba_inst (
			.in1(apu_reset),
			.in2(ch1_restart),
			.y(kaba)
		);

	dmg_nor2 #(
			.L_y(1286.688)
		) kabu_inst (
			.in1(kecy),
			.in2(kura),
			.y(kabu)
		);

	dmg_not_x1 #(
			.L_y(182.2182)
		) kado_inst (
			.in(apu_reset),
			.y(kado)
		);

	dmg_tffnl #(
			.L_q(295.9066),
			.L_q_n(112.8908)
		) kafo_inst (
			.d(kana),
			.l(kaso),
			.tclk_n(kepa),
			.q(kafo),
			.q_n(kafo_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) kafu_inst (
			.in(kupe_n),
			.ena_n(hovo),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(119.7971)
		) kage_inst (
			.in(apu_rd_n),
			.y(kage)
		);

	dmg_not_x2 #(
			.L_y(565.5151)
		) kagy_inst (
			.in(gaxu),
			.y(kagy)
		);

	dmg_ao22 #(
			.L_y(27.09386)
		) kahe_inst (
			.in1(ff40_d7),
			.in2(kasa),
			.in3(kedy),
			.in4(umob),
			.y(kahe)
		);

	dmg_nor2 #(
			.L_y(507.6094)
		) kaju_inst (
			.in1(kyfu),
			.in2(apu_reset),
			.y(kaju)
		);

	dmg_or3 #(
			.L_y(1166.093)
		) kake_inst (
			.in1(ch1_eg_tick),
			.in2(koma),
			.in3(ch1_eg_stop),
			.y(kake)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) kaku_inst (
			.in(ff22_d1_n),
			.ena_n(keka),
			.y(d1)
		);

	dmg_nor2 #(
			.L_y(384.6249)
		) kala_inst (
			.in1(bexa),
			.in2(ch1_restart),
			.y(ch1_ld_shift_n)
		);

	dmg_nor2 #(
			.L_y(2334.578)
		) kale_inst (
			.in1(kyme),
			.in2(kura),
			.y(kale)
		);

	dmg_dffr #(
			.L_q(102.7967),
			.L_q_n(121.1249)
		) kaly_inst (
			.d(kaly_n),
			.clk(jone),
			.r_n(kado),
			.q(kaly),
			.q_n(kaly_n)
		);

	dmg_not_x1 #(
			.L_y(654.5)
		) kame_inst (
			.in(apu_reset),
			.y(apu_reset5_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) kamo_inst (
			.in(ff22_d0_n),
			.ena_n(keka),
			.y(d0)
		);

	dmg_nand2 #(
			.L_y(151.6721)
		) kamu_inst (
			.in1(ff26),
			.in2(kazo),
			.y(kamu)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) kamy_inst (
			.in(keno_n),
			.ena_n(hovo),
			.y(d7)
		);

	dmg_drlatch_ee #(
			.L_q(950.4066)
		) kana_inst (
			.d(d6),
			.ena(kota),
			.ena_n(kyho),
			.r_n(kuha),
			.q(kana),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(265.8905)
		) kanu_inst (
			.in(kony),
			.y(kanu)
		);

	dmg_dlatch #(
			.L_q(107.8433)
		) kapa_inst (
			.d(p11_in_n),
			.ena(byzo),
			.q(kapa),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1309.531)
		) kape_inst (
			.in(ch1_ld_shift_n),
			.y(kape)
		);

	dmg_nor2 #(
			.L_y(580.3907)
		) kapo_inst (
			.in1(kavo),
			.in2(apu_reset),
			.y(kapo)
		);

	dmg_not_x1 #(
			.L_y(171.328)
		) kara_inst (
			.in(ch4_lfsr_clk2),
			.y(kara)
		);

	dmg_dffr_cc_q #(
			.L_q(378.2501)
		) kare_inst (
			.d(acc_d2),
			.clk(ch1_ld_sum),
			.clk_n(kede),
			.r_n(sum_reset_n),
			.q(kare)
		);

	dmg_or2 #(
			.L_y(2379.735)
		) karu_inst (
			.in1(kely_n),
			.in2(kura),
			.y(karu)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) kary_inst (
			.in(jema_n),
			.ena_n(evaj),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(41.43764)
		) kasa_inst (
			.in(vclk_n),
			.y(kasa)
		);

	dmg_not_x1 #(
			.L_y(745.078)
		) kaso_inst (
			.in(hera),
			.y(kaso)
		);

	dmg_nor2 #(
			.L_y(1258.266)
		) kasy_inst (
			.in1(jale),
			.in2(kura),
			.y(kasy)
		);

	dmg_not_x1 #(
			.L_y(222.8594)
		) katy_inst (
			.in(apu_reset),
			.y(katy)
		);

	dmg_and2 #(
			.L_y(1304.219)
		) kavo_inst (
			.in1(dyla),
			.in2(kopu),
			.y(kavo)
		);

	dmg_ao22 #(
			.L_y(724.0937)
		) kavu_inst (
			.in1(joto),
			.in2(ff22_d3),
			.in3(ff22_d3_n),
			.in4(juxe),
			.y(kavu)
		);

	dmg_and2 #(
			.L_y(53.12541)
		) kaxy_inst (
			.in1(juju),
			.in2(keke),
			.y(kaxy)
		);

	dmg_nor2 #(
			.L_y(108.3746)
		) kaza_inst (
			.in1(ch1_restart),
			.in2(ch1_eg_tick),
			.y(kaza)
		);

	dmg_not_x1 #(
			.L_y(82.87487)
		) kazo_inst (
			.in(apu_rd_n),
			.y(kazo)
		);

	dmg_not_x6 #(
			.L_y(21189.17)
		) keba_inst (
			.in(kuby),
			.y(apu_reset)
		);

	dmg_not_x1 #(
			.L_y(42.50016)
		) kebo_inst (
			.in(meco),
			.y(kebo)
		);

	dmg_dffr #(
			.L_q(340.5306)
		) kecy_inst (
			.d(d1),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(kecy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(640.4219)
		) kede_inst (
			.in(ch1_ld_sum),
			.y(kede)
		);

	dmg_not_x1 #(
			.L_y(2065.766)
		) kedo_inst (
			.in(ch1_ld_shift_n),
			.y(kedo)
		);

	dmg_not_x1 #(
			.L_y(139.4531)
		) kedy_inst (
			.in(ff40_d7),
			.y(kedy)
		);

	dmg_xor #(
			.L_y(323.7969)
		) kefe_inst (
			.in1(aryl),
			.in2(jota),
			.y(kefe)
		);

	dmg_dlatch #(
			.L_q(101.7344)
		) keja_inst (
			.d(p12_in_n),
			.ena(byzo),
			.q(keja),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(15151.52)
		) kejo_inst (
			.in(kova),
			.ena_n(ext_addr_en_n),
			.y(a0)
		);

	dmg_tffnl #(
			.L_q(85.79758),
			.L_q_n(160.9689)
		) keju_inst (
			.d(jemo),
			.l(jera),
			.tclk_n(kese),
			.q(keju),
			.q_n(keju_n)
		);

	dmg_or2 #(
			.L_y(265.3599)
		) keka_inst (
			.in1(koku),
			.in2(apu_rd_n),
			.y(keka)
		);

	dmg_not_x1 #(
			.L_y(83.14075)
		) keke_inst (
			.in(acc_d3),
			.y(keke)
		);

	dmg_or2 #(
			.L_y(320.3437)
		) keko_inst (
			.in1(apu_reset),
			.in2(ch1_restart),
			.y(keko)
		);

	dmg_not_x1 #(
		) kelu_inst (
			.in(gnd),
			.y()
		);

	dmg_dffr #(
			.L_q_n(3032.109)
		) kely_inst (
			.d(d4),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(),
			.q_n(kely_n)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) kema_inst (
			.in(kevu),
			.ena_n(byzo),
			.y(d0)
		);

	dmg_tffnl #(
			.L_q_n(594.7344)
		) kemu_inst (
			.d(jefe),
			.l(kyko),
			.tclk_n(kunu),
			.q(),
			.q_n(kemu_n)
		);

	dmg_muxi #(
			.L_y(926.234)
		) kena_inst (
			.sel(ff60_d0),
			.d1(kuko),
			.d0(ser_out),
			.y(kena)
		);

	dmg_not_x1 #(
			.L_y(332.5626)
		) kene_inst (
			.in(kylo),
			.y(kene)
		);

	dmg_tffnl #(
			.L_q_n(250.4852)
		) keno_inst (
			.d(kogu),
			.l(kaso),
			.tclk_n(kafo),
			.q(),
			.q_n(keno_n)
		);

	dmg_tffnl #(
			.L_q(156.4525)
		) kenu_inst (
			.d(ff12_d1_n),
			.l(kuxu),
			.tclk_n(jova),
			.q(kenu),
			.q_n()
		);

	dmg_dffr_cc #(
		) keny_inst (
			.d(gnd),
			.clk(gnd),
			.clk_n(vdd),
			.r_n(gnd),
			.q(),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(251.2818),
			.L_q_n(119.5315)
		) kepa_inst (
			.d(jove),
			.l(kaso),
			.tclk_n(kygu),
			.q(kepa),
			.q_n(kepa_n)
		);

	dmg_not_x3 #(
			.L_y(6555.094)
		) kepy_inst (
			.in(jyro),
			.y(ff24_ff25_ff26_reset_n)
		);

	dmg_tffnl #(
			.L_q(166.8125)
		) kera_inst (
			.d(ff12_d2_n),
			.l(kuxu),
			.tclk_n(kenu),
			.q(kera),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(215.4221)
		) kere_inst (
			.in(kaly),
			.y(kere)
		);

	dmg_dffr #(
			.L_q(122.4535)
		) keru_inst (
			.d(d7),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(keru),
			.q_n()
		);

	dmg_or4 #(
			.L_y(2272.953)
		) kery_inst (
			.in1(p13_in_n),
			.in2(p12_in_n),
			.in3(p11_in_n),
			.in4(p10_in_n),
			.y(kery)
		);

	dmg_not_x1 #(
			.L_y(89.78118)
		) kese_inst (
			.in(keno_n),
			.y(kese)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) kesy_inst (
			.in(kunu_n),
			.ena_n(hovo),
			.y(d2)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) keta_inst (
			.in(ff22_d3_n),
			.ena_n(jora),
			.y(d3)
		);

	dmg_nor2 #(
			.L_y(215.1564)
		) keto_inst (
			.in1(apu_reset),
			.in2(kaxy),
			.y(keto)
		);

	dmg_dffr #(
			.L_q(166.5466)
		) ketu_inst (
			.d(komu),
			.clk(ch4_lfsr_clk3),
			.r_n(goge),
			.q(ketu),
			.q_n()
		);

	dmg_dlatch #(
			.L_q(107.8437)
		) kevu_inst (
			.d(p10_in_n),
			.ena(byzo),
			.q(kevu),
			.q_n()
		);

	dmg_and2 #(
			.L_y(207.1872)
		) kevy_inst (
			.in1(juju),
			.in2(kovo),
			.y(kevy)
		);

	dmg_nand2 #(
			.L_y(1251.625)
		) kexu_inst (
			.in1(dawa),
			.in2(sck_dir),
			.y(kexu)
		);

	dmg_tffnl #(
			.L_q(215.6878),
			.L_q_n(187.7967)
		) keza_inst (
			.d(jety),
			.l(jera),
			.tclk_n(keju),
			.q(keza),
			.q_n(keza_n)
		);

	dmg_nor_latch #(
			.L_q(220.9994)
		) kezu_inst (
			.s(kyno),
			.r(keko),
			.q(ch1_eg_stop),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) koce_inst (
			.in(kely_n),
			.ena_n(byzo),
			.y(d4)
		);

	dmg_not_x3 #(
			.L_y(3069.829)
		) kofo_inst (
			.in(kupa),
			.y(kofo)
		);

	dmg_drlatch_ee #(
			.L_q(523.5464)
		) koga_inst (
			.d(d0),
			.ena(jafa),
			.ena_n(kuly),
			.r_n(kuha),
			.q(koga),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) koge_inst (
			.in(ch4_active_n),
			.ena_n(kamu),
			.y(d3)
		);

	dmg_drlatch_ee #(
			.L_q(1083.219)
		) kogu_inst (
			.d(d7),
			.ena(kota),
			.ena_n(kyho),
			.r_n(kuha),
			.q(kogu),
			.q_n()
		);

	dmg_and2 #(
			.L_y(137.8594)
		) koko_inst (
			.in1(kape),
			.in2(juta),
			.y(koko)
		);

	dmg_not_x1 #(
			.L_y(78.09341)
		) koku_inst (
			.in(ff22),
			.y(koku)
		);

	dmg_nand2 #(
			.L_y(217.0164)
		) kola_inst (
			.in1(acc_d4),
			.in2(juju),
			.y(kola)
		);

	dmg_nand2 #(
			.L_y(884.7965)
		) kole_inst (
			.in1(jute),
			.in2(ff60_d0),
			.y(kole)
		);

	dmg_dlatch #(
			.L_q(205.8594)
		) kolo_inst (
			.d(p13_in_n),
			.ena(byzo),
			.q(kolo),
			.q_n()
		);

	dmg_nor3 #(
			.L_y(1478.203)
		) koma_inst (
			.in1(ff12_d0),
			.in2(ff12_d1),
			.in3(ff12_d2),
			.y(koma)
		);

	dmg_dffr #(
			.L_q(255.2656)
		) komu_inst (
			.d(joto),
			.clk(ch4_lfsr_clk3),
			.r_n(goge),
			.q(komu),
			.q_n()
		);

	dmg_not_x1 #(
		) konu_inst (
			.in(gnd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(94.03148)
		) kony_inst (
			.in(kyku),
			.y(kony)
		);

	dmg_not_x1 #(
			.L_y(657.6874)
		) kopa_inst (
			.in(kara),
			.y(ch4_lfsr_clk3)
		);

	dmg_not_x1 #(
			.L_y(89.78057)
		) kopu_inst (
			.in(d4),
			.y(kopu)
		);

	dmg_not_x1 #(
			.L_y(399.5002)
		) kopy_inst (
			.in(apu_reset),
			.y(kopy)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) kora_inst (
			.in(kafo_n),
			.ena_n(hovo),
			.y(d6)
		);

	dmg_nand2 #(
			.L_y(1052.141)
		) kore_inst (
			.in1(keru),
			.in2(ff60_d0),
			.y(kore)
		);

	dmg_nor4 #(
			.L_y(400.2962)
		) koro_inst (
			.in1(kuku),
			.in2(koma),
			.in3(ch1_restart),
			.in4(apu_reset),
			.y(koro)
		);

	dmg_nor2 #(
			.L_y(227.9063)
		) koru_inst (
			.in1(ch1_restart),
			.in2(apu_reset),
			.y(koru)
		);

	dmg_nand2 #(
			.L_y(2129.515)
		) kory_inst (
			.in1(kyme),
			.in2(ff60_d0),
			.y(kory)
		);

	dmg_and2 #(
			.L_y(363.9062)
		) kota_inst (
			.in1(ff1d),
			.in2(apu_wr),
			.y(kota)
		);

	dmg_and3 #(
			.L_y(1135.281)
		) kote_inst (
			.in1(kera),
			.in2(kenu),
			.in3(jova),
			.y(kote)
		);

	dmg_nor2 #(
			.L_y(2658.906)
		) koty_inst (
			.in1(t1t2_n),
			.in2(amet),
			.y(koty)
		);

	dmg_not_x1 #(
			.L_y(170.5306)
		) kova_inst (
			.in(a0_in_n),
			.y(kova)
		);

	dmg_not_x1 #(
			.L_y(65.87529)
		) kovo_inst (
			.in(acc_d4),
			.y(kovo)
		);

	dmg_nand2 #(
			.L_y(651.5781)
		) kovu_inst (
			.in1(d4),
			.in2(dyla),
			.y(kovu)
		);

	dmg_dffr #(
			.L_q(528.8591)
		) kozy_inst (
			.d(kote),
			.clk(horu_512hz),
			.r_n(koro),
			.q(ch1_eg_tick),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(75.70288)
		) kuby_inst (
			.in(jyro),
			.y(kuby)
		);

	dmg_not_x1 #(
			.L_y(925.9683)
		) kuha_inst (
			.in(apu_reset),
			.y(kuha)
		);

	dmg_not_x1 #(
			.L_y(124.5782)
		) kuhu_inst (
			.in(hoso),
			.y(kuhu)
		);

	dmg_nor2 #(
			.L_y(1516.719)
		) kujo_inst (
			.in1(jago),
			.in2(dawa),
			.y(kujo)
		);

	dmg_dffr #(
			.L_q(158.0474)
		) kuko_inst (
			.d(d6),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(kuko),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(112.8906)
		) kuku_inst (
			.in1(horu_512hz),
			.in2(kury),
			.y(kuku)
		);

	dmg_not_x2 #(
			.L_y(593.4059)
		) kuly_inst (
			.in(jafa),
			.y(kuly)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) kumo_inst (
			.in(kyna_n),
			.ena_n(evaj),
			.y(d3)
		);

	dmg_not_x1 #(
		) kuno_inst (
			.in(gnd),
			.y()
		);

	dmg_tffnl #(
			.L_q(210.1095),
			.L_q_n(210.1091)
		) kunu_inst (
			.d(jaxa),
			.l(kyko),
			.tclk_n(kupe),
			.q(kunu),
			.q_n(kunu_n)
		);

	dmg_ao22 #(
			.L_y(28.15619)
		) kupa_inst (
			.in1(ff40_d7),
			.in2(kebo),
			.in3(kedy),
			.in4(usec),
			.y(kupa)
		);

	dmg_tffnl #(
			.L_q(258.7187),
			.L_q_n(214.0937)
		) kupe_inst (
			.d(jovy),
			.l(kyko),
			.tclk_n(kutu),
			.q(kupe),
			.q_n(kupe_n)
		);

	dmg_nand2 #(
			.L_y(3005.016)
		) kupo_inst (
			.in1(amet),
			.in2(ext_addr_en_n),
			.y(kupo)
		);

	dmg_dffr_cc #(
		) kupy_inst (
			.d(gnd),
			.clk(gnd),
			.clk_n(vdd),
			.r_n(gnd),
			.q(),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(3094.266)
		) kura_inst (
			.in(ff60_d0),
			.y(kura)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) kuro_inst (
			.in(kapa),
			.ena_n(byzo),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(121.1249)
		) kury_inst (
			.in(ch1_eg_tick),
			.y(kury)
		);

	dmg_dffr #(
			.L_q(183.0152)
		) kuta_inst (
			.d(ketu),
			.clk(ch4_lfsr_clk3),
			.r_n(goge),
			.q(kuta),
			.q_n()
		);

	dmg_tffnl #(
			.L_q(391.5313),
			.L_q_n(319.2809)
		) kutu_inst (
			.d(koga),
			.l(kyko),
			.tclk_n(juty),
			.q(kutu),
			.q_n(kutu_n)
		);

	dmg_dffr_cc #(
		) kuty_inst (
			.d(gnd),
			.clk(gnd),
			.clk_n(vdd),
			.r_n(gnd),
			.q(),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) kuve_inst (
			.in(keja),
			.ena_n(byzo),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(1432.516)
		) kuxu_inst (
			.in(kaza),
			.y(kuxu)
		);

	dmg_dffr #(
			.L_q(193.3746)
		) kuzy_inst (
			.d(kuta),
			.clk(ch4_lfsr_clk3),
			.r_n(goge),
			.q(kuzy),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(233.4846)
		) kybo_inst (
			.in1(apu_reset),
			.in2(kevy),
			.y(kybo)
		);

	dmg_nor2 #(
			.L_y(1117.749)
		) kybu_inst (
			.in1(jute),
			.in2(kura),
			.y(kybu)
		);

	dmg_not_x1 #(
			.L_y(128.2969)
		) kydu_inst (
			.in(apu_rd_n),
			.y(kydu)
		);

	dmg_and2 #(
			.L_y(593.4057)
		) kyfu_inst (
			.in1(dyla),
			.in2(julo),
			.y(kyfu)
		);

	dmg_tffnl #(
			.L_q(253.672),
			.L_q_n(188.0623)
		) kygu_inst (
			.d(jypo),
			.l(kaso),
			.tclk_n(kyru),
			.q(kygu),
			.q_n(kygu_n)
		);

	dmg_not_x1 #(
			.L_y(372.1407)
		) kygy_inst (
			.in(hafu),
			.y(kygy)
		);

	dmg_not_x1 #(
			.L_y(307.5938)
		) kyho_inst (
			.in(kota),
			.y(kyho)
		);

	dmg_nand2 #(
			.L_y(1089.328)
		) kyhu_inst (
			.in1(jale),
			.in2(ff60_d0),
			.y(kyhu)
		);

	dmg_not_x1 #(
			.L_y(1256.407)
		) kyko_inst (
			.in(hera),
			.y(kyko)
		);

	dmg_or2 #(
			.L_y(618.6405)
		) kyku_inst (
			.in1(ch4_fdis),
			.in2(jeso_512k),
			.y(kyku)
		);

	dmg_not_x1 #(
			.L_y(194.1712)
		) kylo_inst (
			.in(jyna),
			.y(kylo)
		);

	dmg_dffr #(
			.L_q(370.8119)
		) kyme_inst (
			.d(d3),
			.clk(ff00wr_n),
			.r_n(reset2_n),
			.q(kyme),
			.q_n()
		);

	dmg_not_x3 #(
			.L_y(2921.345)
		) kymo_inst (
			.in(kahe),
			.y(kymo)
		);

	dmg_tffnl #(
			.L_q_n(340.2652)
		) kyna_inst (
			.d(acc_d3),
			.l(fume),
			.tclk_n(jyty),
			.q(),
			.q_n(kyna_n)
		);

	dmg_dffr #(
			.L_q(279.1717)
		) kyno_inst (
			.d(jade),
			.clk(ch1_eg_tick),
			.r_n(koru),
			.q(kyno),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(4190.501)
		) kyny_inst (
			.in(kaba),
			.y(sum_reset_n)
		);

	dmg_nand2 #(
			.L_y(520.0934)
		) kypa_inst (
			.in1(d5),
			.in2(dyla),
			.y(kypa)
		);

	dmg_not_x1 #(
			.L_y(133.0784)
		) kype_inst (
			.in(kyna_n),
			.y(kype)
		);

	dmg_not_x1 #(
			.L_y(334.1559)
		) kypu_inst (
			.in(apu_reset),
			.y(kypu)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) kyro_inst (
			.in(ff22_d2_n),
			.ena_n(keka),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(83.14137)
		) kyru_inst (
			.in(kemu_n),
			.y(kyru)
		);

	dmg_nand2 #(
			.L_y(222.5943)
		) kyry_inst (
			.in1(acc_d3),
			.in2(juju),
			.y(kyry)
		);

	dmg_not_x1 #(
			.L_y(362.5775)
		) kysa_inst (
			.in(jenu),
			.y(kysa)
		);

	dmg_nand2 #(
			.L_y(994.2347)
		) kyto_inst (
			.in1(kecy),
			.in2(ff60_d0),
			.y(kyto)
		);

	dmg_and3 #(
			.L_y(610.1412)
		) kyvo_inst (
			.in1(jevy),
			.in2(jona),
			.in3(jore),
			.y(kyvo)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) kyvu_inst (
			.in(jyty_n),
			.ena_n(evaj),
			.y(d2)
		);

	dmg_nor2 #(
			.L_y(1122.798)
		) kywe_inst (
			.in1(jeva),
			.in2(keru),
			.y(kywe)
		);

	dmg_dffr #(
			.L_q(220.2034)
		) kywy_inst (
			.d(kuzy),
			.clk(ch4_lfsr_clk3),
			.r_n(goge),
			.q(kywy),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(866.4687)
		) labe_inst (
			.in1(muce),
			.in2(ext_addr_en_n),
			.y(labe)
		);

	dmg_not_x2 #(
			.L_y(1102.078)
		) labu_inst (
			.in(luve),
			.y(labu)
		);

	dmg_not_x2 #(
			.L_y(465.3751)
		) laca_inst (
			.in(myre),
			.y(laca)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) lace_inst (
			.in(bgp_d4_n),
			.ena_n(tepy),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(105.1876)
		) lady_inst (
			.in(sprite_palette),
			.y(lady)
		);

	dmg_dffr #(
			.L_q(4091.952),
			.L_q_n(71.71861)
		) lafo_inst (
			.d(lafo_n),
			.clk(mato_n),
			.r_n(v_reset_n),
			.q(v7),
			.q_n(lafo_n)
		);

	dmg_nand2 #(
			.L_y(248.625)
		) lafu_inst (
			.in1(lome),
			.in2(poka),
			.y(lafu)
		);

	dmg_not_x1 #(
			.L_y(107.8437)
		) lafy_inst (
			.in(sprite_palette),
			.y(lafy)
		);

	dmg_ao21 #(
			.L_y(103.5936)
		) lagu_inst (
			.in1(read),
			.in2(levo),
			.in3(write),
			.y(lagu)
		);

	dmg_not_x1 #(
			.L_y(161.5)
		) lahe_inst (
			.in(a12_in_n),
			.y(lahe)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) laju_inst (
			.in(obp1_d0_n),
			.ena_n(lote),
			.y(d0)
		);

	dmg_nand2 #(
			.L_y(378.25)
		) laky_inst (
			.in1(loze),
			.in2(legu),
			.y(laky)
		);

	dmg_not_x1 #(
			.L_y(85.26545)
		) lala_inst (
			.in(megu),
			.y(lala)
		);

	dmg_not_x2 #(
			.L_y(1347.781)
		) lalo_inst (
			.in(mysa),
			.y(lalo)
		);

	dmg_dffsr #(
			.L_q(866.2033)
		) lalu_inst (
			.d(pesu_const1),
			.clk(int_stat),
			.s_n(mody),
			.r_n(movu),
			.q(cpu_irq1),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(1157.063)
		) lama_inst (
			.in1(myta),
			.in2(ppu_reset),
			.y(v_reset_n)
		);

	dmg_not_x1 #(
			.L_y(865.6716)
		) lamo_inst (
			.in(cpu_irq_ack4),
			.y(lamo)
		);

	dmg_nand2 #(
			.L_y(204.0001)
		) lamy_inst (
			.in1(sprite_palette),
			.in2(sprite_on7),
			.y(lamy)
		);

	dmg_not_x1 #(
			.L_y(1362.391)
		) lapa_inst (
			.in(loko),
			.y(lapa)
		);

	dmg_not_x1 #(
			.L_y(2058.859)
		) lape_inst (
			.in(ppu_4mhz_n),
			.y(clk4)
		);

	dmg_nand3 #(
			.L_y(43.297)
		) lara_inst (
			.in1(loky),
			.in2(myte_n),
			.in3(ppu_hard_reset_n),
			.y(lara)
		);

	dmg_and3 #(
			.L_y(395.2498)
		) laru_inst (
			.in1(lozo),
			.in2(maby),
			.in3(obj1px),
			.y(laru)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) lary_inst (
			.in(bgp_d7_n),
			.ena_n(tepy),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(48.34364)
		) lase_inst (
			.in(mofo),
			.y(lase)
		);

	dmg_not_x1 #(
			.L_y(91.90623)
		) lasy_inst (
			.in(loxo),
			.y(lasy)
		);

	dmg_not_x1 #(
			.L_y(1188.406)
		) lava_inst (
			.in(lafu),
			.y(obj0px)
		);

	dmg_nand3 #(
			.L_y(5652.768)
		) lavo_inst (
			.in1(read),
			.in2(non_vram_mreq),
			.in3(clk_t4),
			.y(lavo)
		);

	dmg_and2 #(
			.L_y(204.7973)
		) lavy_inst (
			.in1(ppu_wr),
			.in2(ff46),
			.y(lavy)
		);

	dmg_dlatch_ee #(
			.L_q(1339.282),
			.L_q_n(194.1719)
		) lawo_inst (
			.d(d1),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d1),
			.q_n(obp1_d1_n)
		);

	dmg_not_x1 #(
			.L_y(99.87506)
		) laxe_inst (
			.in(laxu),
			.y(laxe)
		);

	dmg_dffr #(
			.L_q(310.5155),
			.L_q_n(223.3903)
		) laxu_inst (
			.d(laxu_n),
			.clk(lebo),
			.r_n(bg_cy_rst_n),
			.q(laxu),
			.q_n(laxu_n)
		);

	dmg_pad_out #(
		) ld0_inst (
			.o_n(remy),
			.pad(ld_pad[0])
		);

	dmg_pad_out #(
		) ld1_inst (
			.o_n(ravo),
			.pad(ld_pad[1])
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) leba_inst (
			.in(obp1_d6_n),
			.ena_n(lote),
			.y(d6)
		);

	dmg_dffr #(
			.L_q_n(78.3596)
		) lebe_inst (
			.d(lebe_n),
			.clk(luca_n),
			.r_n(ppu_reset2_n),
			.q(),
			.q_n(lebe_n)
		);

	dmg_nand2 #(
			.L_y(130.1561)
		) lebo_inst (
			.in1(ppu_4mhz_n),
			.in2(moce),
			.y(lebo)
		);

	dmg_not_x1 #(
			.L_y(100.4062)
		) lebu_inst (
			.in(dma_a15),
			.y(lebu)
		);

	dmg_nor2 #(
			.L_y(737.1088)
		) leco_inst (
			.in1(exec_phase),
			.in2(t1t2_n),
			.y(leco)
		);

	dmg_and3 #(
			.L_y(431.9066)
		) ledo_inst (
			.in1(lozo),
			.in2(lyle),
			.in3(obj1px),
			.y(ledo)
		);

	dmg_not_x2 #(
			.L_y(1582.063)
		) lefa_inst (
			.in(mewy),
			.y(lefa)
		);

	dmg_dffsr #(
			.L_q(391.797)
		) lefe_inst (
			.d(sprite_px_b1),
			.clk(clkpipe),
			.s_n(lela),
			.r_n(lyde),
			.q(sprite_px_b2),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(7178.256)
		) lefy_inst (
			.in(lura),
			.ena_n(ext_addr_en_n),
			.y(a13)
		);

	dmg_dlatch_ee_q #(
			.L_q(190.9844)
		) legu_inst (
			.d(md0),
			.ena(luna),
			.ena_n(loma),
			.q(legu)
		);

	dmg_not_x1 #(
			.L_y(866.2034)
		) leho_inst (
			.in(myxe),
			.y(leho)
		);

	dmg_not_x1 #(
			.L_y(224.9844)
		) leja_inst (
			.in(cpu_irq_ack1),
			.y(leja)
		);

	dmg_nand2 #(
			.L_y(296.4378)
		) leka_inst (
			.in1(sprite_px_palette),
			.in2(poka),
			.y(leka)
		);

	dmg_not_x1 #(
			.L_y(86.32797)
		) leke_inst (
			.in(muku),
			.y(leke)
		);

	dmg_not_x2 #(
			.L_y(3447.813)
		) leko_inst (
			.in(mynu),
			.y(cpu_vram_oam_rd)
		);

	dmg_nand2 #(
			.L_y(280.4998)
		) lela_inst (
			.in1(mofo),
			.in2(sprite_on2),
			.y(lela)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) lelu_inst (
			.in(obp1_d7_n),
			.ena_n(lote),
			.y(d7)
		);

	dmg_dffr #(
			.L_q(4114.266),
			.L_q_n(197.094)
		) lema_inst (
			.d(lema_n),
			.clk(lovu_n),
			.r_n(v_reset_n),
			.q(v5),
			.q_n(lema_n)
		);

	dmg_not_x2 #(
			.L_y(1641.562)
		) lena_inst (
			.in(lusu),
			.y(tm_bp_cys)
		);

	dmg_dffr #(
			.L_q_n(146.6249)
		) lene_inst (
			.d(luvy),
			.clk(dma_phi_n),
			.r_n(ppu_hard_reset_n),
			.q(),
			.q_n(lene_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) lepa_inst (
			.in(obp1_d1_n),
			.ena_n(lote),
			.y(d1)
		);

	dmg_dlatch_ee #(
			.L_q(1502.641),
			.L_q_n(69.06261)
		) lepu_inst (
			.d(d6),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d6),
			.q_n(obp1_d6_n)
		);

	dmg_nand2 #(
			.L_y(781.7344)
		) lepy_inst (
			.in1(male),
			.in2(ext_addr_en_n),
			.y(lepy)
		);

	dmg_nand2 #(
			.L_y(167.0782)
		) leru_inst (
			.in1(loxa),
			.in2(loze),
			.y(leru)
		);

	dmg_not_x1 #(
			.L_y(674.9529)
		) lesa_inst (
			.in(cpu_irq_ack2),
			.y(lesa)
		);

	dmg_not_x1 #(
			.L_y(142.9063)
		) leso_inst (
			.in(clk_bg_bp_b_n),
			.y(leso)
		);

	dmg_dffsr #(
			.L_q(1153.875)
		) lesu_inst (
			.d(sprite_px_b2),
			.clk(clkpipe),
			.s_n(mame),
			.r_n(lufy),
			.q(sprite_px_b3),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1949.688)
		) lesy_inst (
			.in(mefu),
			.y(sprite_on0)
		);

	dmg_not_x1 #(
			.L_y(157.25)
		) lety_inst (
			.in(cpu_irq_ack0),
			.y(lety)
		);

	dmg_nor2 #(
			.L_y(615.9849)
		) leva_inst (
			.in1(t1t2_n),
			.in2(muce),
			.y(leva)
		);

	dmg_not_x1 #(
			.L_y(85.26559)
		) levo_inst (
			.in(non_vram_mreq),
			.y(levo)
		);

	dmg_dffr #(
			.L_q(3830.58),
			.L_q_n(156.7188)
		) lexa_inst (
			.d(lexa_n),
			.clk(myro_n),
			.r_n(v_reset_n),
			.q(v2),
			.q_n(lexa_n)
		);

	dmg_not_x2 #(
			.L_y(549.5783)
		) lexe_inst (
			.in(myfu),
			.y(lexe)
		);

	dmg_not_x1 #(
			.L_y(4233.798)
		) lexy_inst (
			.in(m1),
			.y(m1_n)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) lobe_inst (
			.in(bgp_d3_n),
			.ena_n(tepy),
			.y(d3)
		);

	dmg_dlatch #(
			.L_q(99.34389)
		) lobu_inst (
			.d(a12),
			.ena(addr_latch),
			.q(lobu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(436.6874)
		) loby_inst (
			.in(mode3),
			.y(mode3_n)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) lode_inst (
			.in(obp1_d2_n),
			.ena_n(lote),
			.y(d2)
		);

	dmg_nand2 #(
			.L_y(185.6718)
		) lodo_inst (
			.in1(loze),
			.in2(myjy),
			.y(lodo)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) lody_inst (
			.in(bgp_d6_n),
			.ena_n(tepy),
			.y(d6)
		);

	dmg_buf_if0 #(
			.L_y(7387.566)
		) lofa_inst (
			.in(mujy),
			.ena_n(ext_addr_en_n),
			.y(a8)
		);

	dmg_not_x1 #(
			.L_y(39.57807)
		) lofu_inst (
			.in(vclk),
			.y(lofu)
		);

	dmg_not_x1 #(
			.L_y(104.125)
		) logo_inst (
			.in(muda),
			.y(logo)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) loka_inst (
			.in(ff4a_d3_n),
			.ena_n(vomy),
			.y(d3)
		);

	dmg_nand2 #(
			.L_y(228.1718)
		) loko_inst (
			.in1(lene_n),
			.in2(ppu_hard_reset_n),
			.y(loko)
		);

	dmg_nand2 #(
			.L_y(376.922)
		) loky_inst (
			.in1(lara),
			.in2(lene_n),
			.y(loky)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) lole_inst (
			.in(ff4b_d3_n),
			.ena_n(vycu),
			.y(d3)
		);

	dmg_not_x2 #(
			.L_y(1657.5)
		) loly_inst (
			.in(mepa),
			.y(loly)
		);

	dmg_not_x1 #(
			.L_y(1135.812)
		) loma_inst (
			.in(mete),
			.y(loma)
		);

	dmg_not_x1 #(
			.L_y(91.37486)
		) lome_inst (
			.in(sprite_px_palette),
			.y(lome)
		);

	dmg_not_x1 #(
			.L_y(84.20308)
		) lomy_inst (
			.in(luzo),
			.y(lomy)
		);

	dmg_dlatch #(
			.L_q(76.7654)
		) lonu_inst (
			.d(a13),
			.ena(addr_latch),
			.q(lonu),
			.q_n()
		);

	dmg_nand_latch #(
			.L_q(423.9375)
		) lony_inst (
			.s_n(bg_cy_rst_n),
			.r_n(lury),
			.q(lony),
			.q_n()
		);

	dmg_dffsr #(
			.L_q(605.3594)
		) lope_inst (
			.d(pesu_const1),
			.clk(int_vbl),
			.s_n(myzu),
			.r_n(lyta),
			.q(cpu_irq0),
			.q_n()
		);

	dmg_and3 #(
			.L_y(451.5628)
		) lopu_inst (
			.in1(mexa),
			.in2(maby),
			.in3(obj1px),
			.y(lopu)
		);

	dmg_buf_if0 #(
			.L_y(7105.737)
		) lora_inst (
			.in(mady),
			.ena_n(ext_addr_en_n),
			.y(a11)
		);

	dmg_not_x1 #(
			.L_y(1137.938)
		) loru_inst (
			.in(lavy),
			.y(loru)
		);

	dmg_dlatch_ee #(
			.L_q(1384.438),
			.L_q_n(125.6404)
		) lose_inst (
			.d(d3),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d3),
			.q_n(obp1_d3_n)
		);

	dmg_nor2 #(
			.L_y(771.1092)
		) loso_inst (
			.in1(t1t2_n),
			.in2(mojy),
			.y(loso)
		);

	dmg_not_x1 #(
			.L_y(1848.485)
		) lota_inst (
			.in(meve),
			.y(sprite_on1)
		);

	dmg_not_x1 #(
			.L_y(949.8749)
		) lote_inst (
			.in(mumy),
			.y(lote)
		);

	dmg_nand2 #(
			.L_y(155.6563)
		) loto_inst (
			.in1(loze),
			.in2(muku),
			.y(loto)
		);

	dmg_nand2 #(
			.L_y(430.3123)
		) loty_inst (
			.in1(luhe),
			.in2(loze),
			.y(loty)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) lova_inst (
			.in(ff4b_d0_n),
			.ena_n(vycu),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(3919.563),
			.L_q_n(188.0625)
		) lovu_inst (
			.d(lovu_n),
			.clk(lydo_n),
			.r_n(v_reset_n),
			.q(v4),
			.q_n(lovu_n)
		);

	dmg_dffr #(
			.L_q_n(167.3435)
		) lovy_inst (
			.d(lyry),
			.clk(myvo),
			.r_n(bg_cy_rst_n),
			.q(),
			.q_n(lovy_n)
		);

	dmg_nand2 #(
			.L_y(131.2189)
		) lowa_inst (
			.in1(lady),
			.in2(sprite_on6),
			.y(lowa)
		);

	dmg_not_x1 #(
			.L_y(112.6251)
		) loxa_inst (
			.in(myjy),
			.y(loxa)
		);

	dmg_ao21 #(
			.L_y(82.87507)
		) loxo_inst (
			.in1(mule),
			.in2(non_vram_mreq),
			.in3(t1_nt2),
			.y(loxo)
		);

	dmg_not_x1 #(
			.L_y(104.3908)
		) loza_inst (
			.in(pefo),
			.y(loza)
		);

	dmg_not_x2 #(
			.L_y(1490.157)
		) loze_inst (
			.in(bg_cy_rst_n),
			.y(loze)
		);

	dmg_not_x1 #(
			.L_y(123.5156)
		) lozo_inst (
			.in(mexa),
			.y(lozo)
		);

	dmg_not_x2 #(
			.L_y(853.453)
		) lozu_inst (
			.in(masa),
			.y(lozu)
		);

	dmg_not_x1 #(
			.L_y(48.07816)
		) lubo_inst (
			.in(pudu),
			.y(lubo)
		);

	dmg_not_x2 #(
			.L_y(2469.781)
		) luby_inst (
			.in(mume),
			.y(luby)
		);

	dmg_dffr #(
			.L_q_n(312.1093)
		) luca_inst (
			.d(luca_n),
			.clk(lofu),
			.r_n(ppu_reset2_n),
			.q(),
			.q_n(luca_n)
		);

	dmg_nand2 #(
			.L_y(694.8749)
		) luce_inst (
			.in1(mojy),
			.in2(ext_addr_en_n),
			.y(luce)
		);

	dmg_not_x1 #(
			.L_y(4835.172)
		) lufa_inst (
			.in(muho),
			.y(vram_to_oam)
		);

	dmg_not_x1 #(
			.L_y(1205.407)
		) lufe_inst (
			.in(cpu_irq_ack3),
			.y(lufe)
		);

	dmg_nand2 #(
			.L_y(110.7654)
		) lufy_inst (
			.in1(lubo),
			.in2(sprite_on3),
			.y(lufy)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) luga_inst (
			.in(obp1_d5_n),
			.ena_n(lote),
			.y(d5)
		);

	dmg_dlatch_ee #(
			.L_q(1630.141),
			.L_q_n(119.2654)
		) lugu_inst (
			.d(d5),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d5),
			.q_n(obp1_d5_n)
		);

	dmg_not_x1 #(
			.L_y(55.24995)
		) luhe_inst (
			.in(legu),
			.y(luhe)
		);

	dmg_nand2 #(
			.L_y(140.5157)
		) luja_inst (
			.in1(lomy),
			.in2(loze),
			.y(luja)
		);

	dmg_nand2 #(
			.L_y(158.8437)
		) luke_inst (
			.in1(sprite_palette),
			.in2(sprite_on6),
			.y(luke)
		);

	dmg_not_x1 #(
			.L_y(437.2184)
		) luku_inst (
			.in(leka),
			.y(obj1px)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) luky_inst (
			.in(obp1_d4_n),
			.ena_n(lote),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(8491.238)
		) lula_inst (
			.in(roru),
			.y(lula)
		);

	dmg_not_x1 #(
			.L_y(11329.97)
		) luma_inst (
			.in(mory),
			.y(dma_addr_ext)
		);

	dmg_not_x1 #(
			.L_y(90.84391)
		) lumo_inst (
			.in(mytu),
			.y(lumo)
		);

	dmg_dlatch #(
			.L_q(118.7342)
		) lumy_inst (
			.d(a11),
			.ena(addr_latch),
			.q(lumy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(968.4686)
		) luna_inst (
			.in(loma),
			.y(luna)
		);

	dmg_dlatch_ee #(
			.L_q(1325.469),
			.L_q_n(124.3123)
		) lune_inst (
			.d(d4),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d4),
			.q_n(obp1_d4_n)
		);

	dmg_dlatch #(
			.L_q(77.82793)
		) luno_inst (
			.d(a8),
			.ena(addr_latch),
			.q(luno),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(164.6873)
		) lunu_inst (
			.in1(lafy),
			.in2(sprite_on7),
			.y(lunu)
		);

	dmg_nor2 #(
			.L_y(173.7188)
		) lupa_inst (
			.in1(lavy),
			.in2(lyxe_n),
			.y(lupa)
		);

	dmg_not_x1 #(
			.L_y(233.2185)
		) lura_inst (
			.in(a13_in_n),
			.y(lura)
		);

	dmg_and2 #(
			.L_y(144.5)
		) lury_inst (
			.in1(lovy_n),
			.in2(mode3),
			.y(lury)
		);

	dmg_not_x1 #(
			.L_y(168.9374)
		) lusu_inst (
			.in(lony),
			.y(lusu)
		);

	dmg_nand2 #(
			.L_y(122.4531)
		) lutu_inst (
			.in1(leke),
			.in2(loze),
			.y(lutu)
		);

	dmg_not_x2 #(
			.L_y(1233.562)
		) luve_inst (
			.in(leso),
			.y(luve)
		);

	dmg_not_x2 #(
			.L_y(701.2499)
		) luvo_inst (
			.in(mavu),
			.y(luvo)
		);

	dmg_dffr #(
			.L_q(223.9219)
		) luvy_inst (
			.d(lupa),
			.clk(dma_phi),
			.r_n(ppu_hard_reset_n),
			.q(luvy),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(1842.109)
		) luxa_inst (
			.in(bg_cy_rst_n),
			.y(luxa)
		);

	dmg_dlatch_ee #(
			.L_q(1493.875),
			.L_q_n(69.85935)
		) luxo_inst (
			.d(d7),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d7),
			.q_n(obp1_d7_n)
		);

	dmg_not_x1 #(
			.L_y(788.3748)
		) luxu_inst (
			.in(leho),
			.y(luxu)
		);

	dmg_dlatch_ee_q #(
			.L_q(248.3594)
		) luzo_inst (
			.d(md3),
			.ena(luna),
			.ena_n(loma),
			.q(luzo)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) lyco_inst (
			.in(myfa),
			.ena_n(varo),
			.y(d2)
		);

	dmg_nand2 #(
			.L_y(165.2187)
		) lyde_inst (
			.in1(lase),
			.in2(sprite_on2),
			.y(lyde)
		);

	dmg_dffr #(
			.L_q(3873.61),
			.L_q_n(175.578)
		) lydo_inst (
			.d(lydo_n),
			.clk(lexa_n),
			.r_n(v_reset_n),
			.q(v3),
			.q_n(lydo_n)
		);

	dmg_nand2 #(
			.L_y(186.4688)
		) lydu_inst (
			.in1(loze),
			.in2(luzo),
			.y(lydu)
		);

	dmg_not_x1 #(
			.L_y(664.5936)
		) lyfa_inst (
			.in(tepo),
			.y(lyfa)
		);

	dmg_not_x1 #(
			.L_y(2509.359)
		) lyfe_inst (
			.in(ppu_reset),
			.y(ppu_reset2_n)
		);

	dmg_not_x1 #(
			.L_y(594.2036)
		) lyha_inst (
			.in(ppu_reset_n),
			.y(ppu_reset)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) lyka_inst (
			.in(bgp_d5_n),
			.ena_n(tepy),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(1684.594)
		) lyku_inst (
			.in(myzo),
			.y(sprite_on2)
		);

	dmg_and3 #(
			.L_y(456.8752)
		) lyky_inst (
			.in1(mexa),
			.in2(lyle),
			.in3(obj1px),
			.y(lyky)
		);

	dmg_not_x1 #(
			.L_y(83.9376)
		) lyle_inst (
			.in(maby),
			.y(lyle)
		);

	dmg_dffsr #(
			.L_q(331.4998)
		) lyme_inst (
			.d(moda),
			.clk(clkpipe),
			.s_n(lamy),
			.r_n(lunu),
			.q(sprite_px_palette),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(7415.191)
		) lyna_inst (
			.in(lahe),
			.ena_n(ext_addr_en_n),
			.y(a12)
		);

	dmg_nor2 #(
			.L_y(984.6721)
		) lyny_inst (
			.in1(t1t2_n),
			.in2(male),
			.y(lyny)
		);

	dmg_nand2 #(
			.L_y(5137.986)
		) lyra_inst (
			.in1(t1t2_n),
			.in2(roru),
			.y(lyra)
		);

	dmg_not_x1 #(
			.L_y(1106.859)
		) lyry_inst (
			.in(moce),
			.y(lyry)
		);

	dmg_dlatch #(
			.L_q(86.06244)
		) lysa_inst (
			.d(a9),
			.ena(addr_latch),
			.q(lysa),
			.q_n()
		);

	dmg_and3 #(
			.L_y(217.0156)
		) lyta_inst (
			.in1(muxe),
			.in2(lety),
			.in3(reset2_n),
			.y(lyta)
		);

	dmg_not_x1 #(
			.L_y(82.60939)
		) lywe_inst (
			.in(lagu),
			.y(lywe)
		);

	dmg_nor_latch #(
			.L_q_n(78.3593)
		) lyxe_inst (
			.s(lavy),
			.r(loko),
			.q(),
			.q_n(lyxe_n)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) lyza_inst (
			.in(obp1_d3_n),
			.ena_n(lote),
			.y(d3)
		);

	dmg_dffr #(
			.L_q(113.4218)
		) lyzu_inst (
			.d(laxu),
			.clk(ppu_4mhz_n),
			.r_n(mode3),
			.q(lyzu),
			.q_n()
		);

	dmg_pad_out #(
		) m1_inst (
			.o_n(m1_n),
			.pad(m1_pad)
		);

	dmg_pad_out #(
		) ma0_inst (
			.o_n(lexe),
			.pad(ma_pad[0])
		);

	dmg_pad_out #(
		) ma1_inst (
			.o_n(lozu),
			.pad(ma_pad[1])
		);

	dmg_pad_out #(
		) ma10_inst (
			.o_n(nuva),
			.pad(ma_pad[10])
		);

	dmg_pad_out #(
		) ma11_inst (
			.o_n(pedu),
			.pad(ma_pad[11])
		);

	dmg_pad_out #(
		) ma12_inst (
			.o_n(pony),
			.pad(ma_pad[12])
		);

	dmg_pad_out #(
		) ma2_inst (
			.o_n(laca),
			.pad(ma_pad[2])
		);

	dmg_pad_out #(
		) ma3_inst (
			.o_n(luvo),
			.pad(ma_pad[3])
		);

	dmg_pad_out #(
		) ma4_inst (
			.o_n(loly),
			.pad(ma_pad[4])
		);

	dmg_pad_out #(
		) ma5_inst (
			.o_n(lalo),
			.pad(ma_pad[5])
		);

	dmg_pad_out #(
		) ma6_inst (
			.o_n(lefa),
			.pad(ma_pad[6])
		);

	dmg_pad_out #(
		) ma7_inst (
			.o_n(luby),
			.pad(ma_pad[7])
		);

	dmg_pad_out #(
		) ma8_inst (
			.o_n(tujy),
			.pad(ma_pad[8])
		);

	dmg_pad_out #(
		) ma9_inst (
			.o_n(tago),
			.pad(ma_pad[9])
		);

	dmg_not_x1 #(
			.L_y(326.1873)
		) maby_inst (
			.in(xula),
			.y(maby)
		);

	dmg_dffsr #(
			.L_q(122.4534)
		) macu_inst (
			.d(moju),
			.clk(clkpipe),
			.s_n(lydu),
			.r_n(luja),
			.q(macu),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(146.8904)
		) mada_inst (
			.in1(nuca),
			.in2(sprite_on1),
			.y(mada)
		);

	dmg_not_x1 #(
			.L_y(340)
		) mady_inst (
			.in(a11_in_n),
			.y(mady)
		);

	dmg_xor #(
			.L_y(604.2969)
		) magu_inst (
			.in1(napo),
			.in2(luca_n),
			.y(magu)
		);

	dmg_nand2 #(
			.L_y(127.7657)
		) majo_inst (
			.in1(lumo),
			.in2(sprite_on2),
			.y(majo)
		);

	dmg_dffr #(
			.L_q(65.6096)
		) maka_inst (
			.d(caty),
			.clk(ppu_4mhz),
			.r_n(ppu_hard_reset_n),
			.q(maka),
			.q_n()
		);

	dmg_mux #(
			.L_y(434.2971)
		) male_inst (
			.sel(dma_addr_ext),
			.d1(dma_a11),
			.d0(lumy),
			.y(male)
		);

	dmg_nand2 #(
			.L_y(290.8594)
		) mame_inst (
			.in1(pudu),
			.in2(sprite_on3),
			.y(mame)
		);

	dmg_mux #(
			.L_y(534.1719)
		) mano_inst (
			.sel(dma_addr_ext),
			.d1(dma_a8),
			.d0(luno),
			.y(mano)
		);

	dmg_buf_if0 #(
			.L_y(7543.753)
		) mapu_inst (
			.in(nena),
			.ena_n(ext_addr_en_n),
			.y(a9)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) mara_inst (
			.in(ff4b_d7_n),
			.ena_n(vycu),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(724.8903)
		) mare_inst (
			.in(voxu),
			.y(mare)
		);

	dmg_dlatch_ee #(
			.L_q(4024.22),
			.L_q_n(73.84392)
		) maru_inst (
			.d(d7),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a15),
			.q_n(dma_a15_n)
		);

	dmg_not_x1 #(
			.L_y(126.9688)
		) masa_inst (
			.in(ma1_n),
			.y(masa)
		);

	dmg_dffsr #(
			.L_q(476)
		) maso_inst (
			.d(sprite_px_b0),
			.clk(clkpipe),
			.s_n(myto),
			.r_n(mada),
			.q(sprite_px_b1),
			.q_n()
		);

	dmg_mux #(
			.L_y(624.7501)
		) masu_inst (
			.sel(dma_addr_ext),
			.d1(dma_a9),
			.d0(lysa),
			.y(masu)
		);

	dmg_not_x1 #(
			.L_y(4474.189)
		) mate_inst (
			.in(lasy),
			.y(addr_latch)
		);

	dmg_dffr #(
			.L_q(3520.594),
			.L_q_n(171.5937)
		) mato_inst (
			.d(mato_n),
			.clk(lema_n),
			.r_n(v_reset_n),
			.q(v6),
			.q_n(mato_n)
		);

	dmg_dffr #(
			.L_q(2542.033)
		) matu_inst (
			.d(loky),
			.clk(dma_phi),
			.r_n(ppu_hard_reset_n),
			.q(dma_run),
			.q_n()
		);

	dmg_dlatch #(
			.L_q_n(74.37508)
		) maty_inst (
			.d(cpu_irq0),
			.ena(ff0f_rd_n),
			.q(),
			.q_n(maty_n)
		);

	dmg_not_x1 #(
			.L_y(85.53108)
		) mavu_inst (
			.in(ma3_n),
			.y(mavu)
		);

	dmg_dlatch_ee #(
			.L_q(589.4219),
			.L_q_n(163.0939)
		) maxy_inst (
			.d(d3),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d3),
			.q_n(bgp_d3_n)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1952.875)
		) md0_inst (
			.pdrv_n(rege),
			.ndrv(rura),
			.ena_n_pu(rofa),
			.i_n(md0_in_n),
			.pad(md_pad[0])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1736.656)
		) md1_inst (
			.pdrv_n(ryky),
			.ndrv(ruly),
			.ena_n_pu(rofa),
			.i_n(md1_in_n),
			.pad(md_pad[1])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1425.875)
		) md2_inst (
			.pdrv_n(razo),
			.ndrv(rare),
			.ena_n_pu(rofa),
			.i_n(md2_in_n),
			.pad(md_pad[2])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1107.125)
		) md3_inst (
			.pdrv_n(rada),
			.ndrv(rodu),
			.ena_n_pu(rofa),
			.i_n(md3_in_n),
			.pad(md_pad[3])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(742.156)
		) md4_inst (
			.pdrv_n(ryro),
			.ndrv(rube),
			.ena_n_pu(rofa),
			.i_n(md4_in_n),
			.pad(md_pad[4])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(670.7032)
		) md5_inst (
			.pdrv_n(revu),
			.ndrv(rumu),
			.ena_n_pu(rofa),
			.i_n(md5_in_n),
			.pad(md_pad[5])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(504.6873)
		) md6_inst (
			.pdrv_n(reku),
			.ndrv(ryty),
			.ena_n_pu(rofa),
			.i_n(md6_in_n),
			.pad(md_pad[6])
		);

	dmg_pad_bidir_pu #(
			.L_i_n(689.8281)
		) md7_inst (
			.pdrv_n(ryze),
			.ndrv(rady),
			.ena_n_pu(rofa),
			.i_n(md7_in_n),
			.pad(md_pad[7])
		);

	dmg_drlatch_ee #(
			.L_q(100.1408),
			.L_q_n(144.7656)
		) meby_inst (
			.d(d3),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d3),
			.q_n(ff4b_d3_n)
		);

	dmg_not_x3 #(
			.L_y(1603.313)
		) meco_inst (
			.in(magu),
			.y(meco)
		);

	dmg_dffr #(
			.L_q(960.766)
		) meda_inst (
			.d(neru),
			.clk(nype_n),
			.r_n(ppu_reset2_n),
			.q(meda),
			.q_n()
		);

	dmg_or3 #(
			.L_y(131.75)
		) mefu_inst (
			.in1(xefy),
			.in2(sprite_px_a0),
			.in3(sprite_px_b0),
			.y(mefu)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) mega_inst (
			.in(ff4a_d4_n),
			.ena_n(vomy),
			.y(d4)
		);

	dmg_nor2 #(
			.L_y(1807.048)
		) mego_inst (
			.in1(t1t2_n),
			.in2(mano),
			.y(mego)
		);

	dmg_dlatch_ee_q #(
			.L_q(552.2344)
		) megu_inst (
			.d(md4),
			.ena(luna),
			.ena_n(loma),
			.q(megu)
		);

	dmg_not_x1 #(
			.L_y(90.57837)
		) mehe_inst (
			.in(ppu_4mhz_n),
			.y(mehe)
		);

	dmg_not_x1 #(
			.L_y(50.99995)
		) meke_inst (
			.in(int_timer),
			.y(meke)
		);

	dmg_drlatch_ee #(
			.L_q(104.3906),
			.L_q_n(167.6094)
		) mela_inst (
			.d(d3),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d3),
			.q_n(ff4a_d3_n)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) mele_inst (
			.in(ff4b_d4_n),
			.ena_n(vycu),
			.y(d4)
		);

	dmg_dlatch_ee #(
			.L_q(358.328),
			.L_q_n(333.0936)
		) mena_inst (
			.d(d7),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d7),
			.q_n(bgp_d7_n)
		);

	dmg_nand2 #(
			.L_y(226.047)
		) mene_inst (
			.in1(sprite_palette),
			.in2(sprite_on5),
			.y(mene)
		);

	dmg_nor2 #(
			.L_y(1612.611)
		) meny_inst (
			.in1(t1t2_n),
			.in2(masu),
			.y(meny)
		);

	dmg_not_x1 #(
			.L_y(122.4533)
		) mepa_inst (
			.in(ma4_n),
			.y(mepa)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) mera_inst (
			.in(ff4a_d7_n),
			.ena_n(vomy),
			.y(d7)
		);

	dmg_nor2 #(
			.L_y(112.6247)
		) mery_inst (
			.in1(nuga),
			.in2(nydu_n),
			.y(mery)
		);

	dmg_dffr #(
			.L_q(271.4687),
			.L_q_n(285.0155)
		) mesu_inst (
			.d(mesu_n),
			.clk(laxu_n),
			.r_n(bg_cy_rst_n),
			.q(mesu),
			.q_n(mesu_n)
		);

	dmg_and2 #(
			.L_y(78.62518)
		) meta_inst (
			.in1(dma_phi),
			.in2(loky),
			.y(meta)
		);

	dmg_not_x1 #(
			.L_y(127.2346)
		) mete_inst (
			.in(latch_bg_bp_a_n),
			.y(mete)
		);

	dmg_or3 #(
			.L_y(140.7811)
		) meve_inst (
			.in1(xefy),
			.in2(sprite_px_a1),
			.in3(sprite_px_b1),
			.y(meve)
		);

	dmg_not_x1 #(
			.L_y(506.0158)
		) mewy_inst (
			.in(ma6_n),
			.y(mewy)
		);

	dmg_not_x1 #(
			.L_y(261.1093)
		) mexa_inst (
			.in(woxa),
			.y(mexa)
		);

	dmg_not_x1 #(
			.L_y(70.65635)
		) mexo_inst (
			.in(cpu_wr_sync),
			.y(mexo)
		);

	dmg_nand3 #(
			.L_y(1392.14)
		) mexu_inst (
			.in1(muzu),
			.in2(reset2_n),
			.in3(meke),
			.y(mexu)
		);

	dmg_nand2 #(
			.L_y(169.7343)
		) mezu_inst (
			.in1(pefo),
			.in2(sprite_on0),
			.y(mezu)
		);

	dmg_dffr #(
			.L_q(321.4062)
		) moba_inst (
			.d(mery),
			.clk(clk_1mhz),
			.r_n(reset2_n),
			.q(int_timer),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(166.2811)
		) moca_inst (
			.in1(non_vram_mreq),
			.in2(t1_nt2),
			.y(moca)
		);

	dmg_nand3 #(
			.L_y(171.3281)
		) moce_inst (
			.in1(nyva),
			.in2(bg_cy_rst_n),
			.in3(laxu),
			.y(moce)
		);

	dmg_dffsr #(
			.L_q(258.7187)
		) moda_inst (
			.d(nuke),
			.clk(clkpipe),
			.s_n(luke),
			.r_n(lowa),
			.q(moda),
			.q_n()
		);

	dmg_dffsr #(
			.L_q(121.9219)
		) modu_inst (
			.d(nepo),
			.clk(clkpipe),
			.s_n(lodo),
			.r_n(leru),
			.q(modu),
			.q_n()
		);

	dmg_nand3 #(
			.L_y(220.7345)
		) mody_inst (
			.in1(rotu),
			.in2(leja),
			.in3(d1),
			.y(mody)
		);

	dmg_dlatch_ee_q #(
			.L_q(197.6251)
		) mofo_inst (
			.d(sp_d2),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(mofo)
		);

	dmg_and2 #(
			.L_y(644.4065)
		) mofu_inst (
			.in1(nako),
			.in2(myso),
			.y(clk_bg_bp_b_n)
		);

	dmg_nand2 #(
			.L_y(149.0155)
		) mofy_inst (
			.in1(loza),
			.in2(sprite_on0),
			.y(mofy)
		);

	dmg_dlatch_ee #(
			.L_q(217.8126),
			.L_q_n(81.8125)
		) mogy_inst (
			.d(d6),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d6),
			.q_n(bgp_d6_n)
		);

	dmg_dffsr #(
			.L_q(377.7186)
		) moju_inst (
			.d(nozo),
			.clk(clkpipe),
			.s_n(loto),
			.r_n(lutu),
			.q(moju),
			.q_n()
		);

	dmg_mux #(
			.L_y(345.8436)
		) mojy_inst (
			.sel(dma_addr_ext),
			.d1(dma_a12),
			.d0(lobu),
			.y(mojy)
		);

	dmg_ao2222 #(
			.L_y(242.25)
		) moka_inst (
			.in1(obp1_d7),
			.in2(ledo),
			.in3(obp1_d5),
			.in4(laru),
			.in5(obp1_d3),
			.in6(lyky),
			.in7(obp1_d1),
			.in8(lopu),
			.y(moka)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) moko_inst (
			.in(ff4b_d2_n),
			.ena_n(vycu),
			.y(d2)
		);

	dmg_and2 #(
			.L_y(74.37488)
		) molu_inst (
			.in1(ff46),
			.in2(ppu_rd),
			.y(molu)
		);

	dmg_not_x2 #(
			.L_y(4267.532)
		) mopa_inst (
			.in(dma_phi),
			.y(dma_phi_n)
		);

	dmg_dlatch #(
			.L_q_n(83.67192)
		) mopo_inst (
			.d(cpu_irq1),
			.ena(ff0f_rd_n),
			.q(),
			.q_n(mopo_n)
		);

	dmg_dlatch_ee #(
			.L_q(415.172),
			.L_q_n(324.0625)
		) moru_inst (
			.d(d5),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d5),
			.q_n(bgp_d5_n)
		);

	dmg_nand2 #(
			.L_y(91.90643)
		) mory_inst (
			.in1(dma_run),
			.in2(logo),
			.y(mory)
		);

	dmg_dlatch_ee #(
			.L_q(1677.953),
			.L_q_n(100.1408)
		) mosa_inst (
			.d(d2),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d2),
			.q_n(obp1_d2_n)
		);

	dmg_not_x2 #(
			.L_y(118.7341)
		) mosu_inst (
			.in(nyfo),
			.y(mosu)
		);

	dmg_nand2 #(
			.L_y(158.8438)
		) mosy_inst (
			.in1(lala),
			.in2(loze),
			.y(mosy)
		);

	dmg_or2 #(
			.L_y(719.0471)
		) moty_inst (
			.in1(moca),
			.in2(lywe),
			.y(moty)
		);

	dmg_and3 #(
			.L_y(177.1718)
		) movu_inst (
			.in1(nabe),
			.in2(leja),
			.in3(reset2_n),
			.y(movu)
		);

	dmg_not_x1 #(
			.L_y(85.79727)
		) moxe_inst (
			.in(ppu_4mhz_n),
			.y(moxe)
		);

	dmg_dlatch_ee #(
			.L_q(1708.5),
			.L_q_n(86.06244)
		) moxy_inst (
			.d(d0),
			.ena(luxu),
			.ena_n(leho),
			.q(obp1_d0),
			.q_n(obp1_d0_n)
		);

	dmg_mux #(
			.L_y(540.5471)
		) muce_inst (
			.sel(dma_addr_ext),
			.d1(dma_a13),
			.d0(lonu),
			.y(muce)
		);

	dmg_nor3 #(
			.L_y(455.0164)
		) muda_inst (
			.in1(dma_a13),
			.in2(dma_a14),
			.in3(lebu),
			.y(muda)
		);

	dmg_nor2 #(
			.L_y(1696.813)
		) mude_inst (
			.in1(vclk),
			.in2(ppu_reset),
			.y(mude)
		);

	dmg_ao2222 #(
			.L_y(211.7035)
		) mufa_inst (
			.in1(ledo),
			.in2(obp1_d6),
			.in3(laru),
			.in4(obp1_d4),
			.in5(lyky),
			.in6(obp1_d2),
			.in7(lopu),
			.in8(obp1_d0),
			.y(mufa)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) mufe_inst (
			.in(ff4b_d5_n),
			.ena_n(vycu),
			.y(d5)
		);

	dmg_dffr #(
			.L_q(3450.736),
			.L_q_n(115.2814)
		) mugu_inst (
			.d(dma_a7_n),
			.clk(dma_a6_n),
			.r_n(lapa),
			.q(dma_a7),
			.q_n(dma_a7_n)
		);

	dmg_not_x1 #(
			.L_y(247.8279)
		) mugy_inst (
			.in(mexu),
			.y(mugy)
		);

	dmg_nand2 #(
			.L_y(73.31255)
		) muho_inst (
			.in1(dma_run),
			.in2(muda),
			.y(muho)
		);

	dmg_not_x1 #(
			.L_y(297.5)
		) mujy_inst (
			.in(a8_in_n),
			.y(mujy)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) muka_inst (
			.in(ff4b_d1_n),
			.ena_n(vycu),
			.y(d1)
		);

	dmg_dlatch_ee #(
			.L_q(354.0784),
			.L_q_n(312.906)
		) muke_inst (
			.d(d4),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d4),
			.q_n(bgp_d4_n)
		);

	dmg_dlatch_ee_q #(
			.L_q(210.1094)
		) muku_inst (
			.d(md2),
			.ena(luna),
			.ena_n(loma),
			.q(muku)
		);

	dmg_not_x1 #(
			.L_y(72.24983)
		) mule_inst (
			.in(t1_nt2),
			.y(mule)
		);

	dmg_not_x1 #(
			.L_y(1053.734)
		) mulo_inst (
			.in(reset2_n),
			.y(mulo)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) muly_inst (
			.in(ff4b_d6_n),
			.ena_n(vycu),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(99.0778)
		) mume_inst (
			.in(ma7_n),
			.y(mume)
		);

	dmg_and2 #(
			.L_y(168.1405)
		) mumy_inst (
			.in1(ppu_rd),
			.in2(ff49),
			.y(mumy)
		);

	dmg_nand2 #(
			.L_y(1400.641)
		) mune_inst (
			.in1(masu),
			.in2(ext_addr_en_n),
			.y(mune)
		);

	dmg_not_x3 #(
			.L_y(4607.268)
		) mure_inst (
			.in(meda),
			.y(mure)
		);

	dmg_dffr #(
			.L_q(156.1872),
			.L_q_n(120.3281)
		) muru_inst (
			.d(d2),
			.clk(tyju),
			.r_n(reset2_n),
			.q(muru),
			.q_n(muru_n)
		);

	dmg_dffr #(
			.L_q(4062.737),
			.L_q_n(146.0939)
		) muty_inst (
			.d(dma_a3_n),
			.clk(dma_a2_n),
			.r_n(lapa),
			.q(dma_a3),
			.q_n(dma_a3_n)
		);

	dmg_not_x1 #(
			.L_y(575.3438)
		) muve_inst (
			.in(poka),
			.y(bgpx)
		);

	dmg_drlatch_ee #(
			.L_q(154.3283),
			.L_q_n(176.1096)
		) muvo_inst (
			.d(d6),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d6),
			.q_n(ff4b_d6_n)
		);

	dmg_dffr #(
			.L_q(3040.875),
			.L_q_n(306.2658)
		) muwy_inst (
			.d(muwy_n),
			.clk(vclk),
			.r_n(v_reset_n),
			.q(v0),
			.q_n(muwy_n)
		);

	dmg_or2 #(
			.L_y(68.79678)
		) muxe_inst (
			.in1(d0),
			.in2(ff0f_wr_n),
			.y(muxe)
		);

	dmg_or2 #(
			.L_y(56.31237)
		) muzu_inst (
			.in1(clk_t4),
			.in2(tope),
			.y(muzu)
		);

	dmg_drlatch_ee #(
			.L_q(117.1407),
			.L_q_n(93.23458)
		) myce_inst (
			.d(d5),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d5),
			.q_n(ff4b_d5_n)
		);

	dmg_dffsr #(
			.L_q(254.7344)
		) myde_inst (
			.d(const0),
			.clk(clkpipe),
			.s_n(laky),
			.r_n(loty),
			.q(myde),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(181.4219)
		) myfa_inst (
			.in(v2),
			.y(myfa)
		);

	dmg_not_x1 #(
			.L_y(104.3906)
		) myfu_inst (
			.in(ma0_n),
			.y(myfu)
		);

	dmg_dlatch_ee_q #(
			.L_q(180.3593)
		) myjy_inst (
			.d(md5),
			.ena(luna),
			.ena_n(loma),
			.q(myjy)
		);

	dmg_xnor #(
			.L_y(254.203)
		) mylo_inst (
			.in1(h0),
			.in2(ff4b_d0),
			.y(mylo)
		);

	dmg_not_x1 #(
			.L_y(486.8906)
		) myma_inst (
			.in(lony),
			.y(tm_bp_cys_n)
		);

	dmg_nand2 #(
			.L_y(304.6725)
		) mynu_inst (
			.in1(ppu_rd),
			.in2(caty),
			.y(mynu)
		);

	dmg_nand2 #(
			.L_y(1592.423)
		) myny_inst (
			.in1(mano),
			.in2(ext_addr_en_n),
			.y(myny)
		);

	dmg_drlatch_ee #(
			.L_q(105.719),
			.L_q_n(94.82802)
		) mypa_inst (
			.d(d0),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d0),
			.q_n(ff4b_d0_n)
		);

	dmg_drlatch_ee #(
			.L_q(172.9217),
			.L_q_n(103.8594)
		) mypu_inst (
			.d(d4),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d4),
			.q_n(ff4b_d4_n)
		);

	dmg_not_x1 #(
			.L_y(130.9533)
		) myre_inst (
			.in(ma2_n),
			.y(myre)
		);

	dmg_dffr #(
			.L_q(2827.579),
			.L_q_n(241.9842)
		) myro_inst (
			.d(myro_n),
			.clk(muwy_n),
			.r_n(v_reset_n),
			.q(v1),
			.q_n(myro_n)
		);

	dmg_not_x1 #(
			.L_y(448.9062)
		) mysa_inst (
			.in(ma5_n),
			.y(mysa)
		);

	dmg_nor3 #(
			.L_y(179.5628)
		) myso_inst (
			.in1(mode3_n),
			.in2(laxe),
			.in3(lyzu),
			.y(myso)
		);

	dmg_dffr #(
			.L_q(163.3594)
		) myta_inst (
			.d(noko),
			.clk(nype_n),
			.r_n(ppu_reset2_n),
			.q(myta),
			.q_n()
		);

	dmg_dffr #(
			.L_q_n(145.2969)
		) myte_inst (
			.d(nolo),
			.clk(dma_phi_n),
			.r_n(lapa),
			.q(),
			.q_n(myte_n)
		);

	dmg_nand2 #(
			.L_y(223.3905)
		) myto_inst (
			.in1(peba),
			.in2(sprite_on1),
			.y(myto)
		);

	dmg_dlatch_ee_q #(
			.L_q(668.3123)
		) mytu_inst (
			.d(sp_d2),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(mytu)
		);

	dmg_not_x1 #(
			.L_y(1287.75)
		) myvo_inst (
			.in(ppu_4mhz_n),
			.y(myvo)
		);

	dmg_nand2 #(
			.L_y(180.6249)
		) myvy_inst (
			.in1(loze),
			.in2(megu),
			.y(myvy)
		);

	dmg_nand2 #(
			.L_y(172.922)
		) myxa_inst (
			.in1(mytu),
			.in2(sprite_on2),
			.y(myxa)
		);

	dmg_and2 #(
			.L_y(136)
		) myxe_inst (
			.in1(ppu_wr),
			.in2(ff49),
			.y(myxe)
		);

	dmg_or3 #(
			.L_y(117.9376)
		) myzo_inst (
			.in1(xefy),
			.in2(sprite_px_a2),
			.in3(sprite_px_b2),
			.y(myzo)
		);

	dmg_nand3 #(
			.L_y(206.3905)
		) myzu_inst (
			.in1(rotu),
			.in2(lety),
			.in3(d0),
			.y(myzu)
		);

	dmg_or2 #(
			.L_y(87.92201)
		) nabe_inst (
			.in1(d1),
			.in2(ff0f_wr_n),
			.y(nabe)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) nabo_inst (
			.in(mopo_n),
			.ena(pola),
			.y(d1)
		);

	dmg_nor2 #(
			.L_y(176.1096)
		) nada_inst (
			.in1(mulo),
			.in2(nyku),
			.y(nada)
		);

	dmg_nand2 #(
			.L_y(130.953)
		) nady_inst (
			.in1(nobo),
			.in2(loze),
			.y(nady)
		);

	dmg_dlatch_ee #(
			.L_q(2340.954),
			.L_q_n(109.1719)
		) nafa_inst (
			.d(d0),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a8),
			.q_n(dma_a8_n)
		);

	dmg_drlatch_ee #(
			.L_q(130.6875),
			.L_q_n(99.87465)
		) nafu_inst (
			.d(d7),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d7),
			.q_n(ff4a_d7_n)
		);

	dmg_nor2 #(
			.L_y(316.0936)
		) nafy_inst (
			.in1(mode3_n),
			.in2(mosu),
			.y(nafy)
		);

	dmg_drlatch_ee #(
			.L_q(85.26581),
			.L_q_n(103.5937)
		) naga_inst (
			.d(d2),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d2),
			.q_n(ff4a_d2_n)
		);

	dmg_nand2 #(
			.L_y(157.2501)
		) naja_inst (
			.in1(loze),
			.in2(nefo),
			.y(naja)
		);

	dmg_not_x1 #(
			.L_y(145.2967)
		) nako_inst (
			.in(mesu),
			.y(nako)
		);

	dmg_dffr #(
			.L_q(3992.08),
			.L_q_n(350.8906)
		) naky_inst (
			.d(dma_a0_n),
			.clk(meta),
			.r_n(lapa),
			.q(dma_a0),
			.q_n(dma_a0_n)
		);

	dmg_not_x1 #(
			.L_y(186.4685)
		) nale_inst (
			.in(vyco),
			.y(nale)
		);

	dmg_dffr #(
			.L_q(253.9372),
			.L_q_n(96.68748)
		) napo_inst (
			.d(napo_n),
			.clk(popu),
			.r_n(ppu_reset2_n),
			.q(napo),
			.q_n(napo_n)
		);

	dmg_not_x1 #(
			.L_y(98.81243)
		) naro_inst (
			.in(sprite_palette),
			.y(naro)
		);

	dmg_dlatch_ee_q #(
			.L_q(269.0779)
		) nasa_inst (
			.d(md6),
			.ena(luna),
			.ena_n(loma),
			.q(nasa)
		);

	dmg_dffsr #(
			.L_q(293.5158)
		) naty_inst (
			.d(sprite_px_a1),
			.clk(clkpipe),
			.s_n(myxa),
			.r_n(majo),
			.q(sprite_px_a2),
			.q_n()
		);

	dmg_nand6 #(
			.L_y(224.1876)
		) navo_inst (
			.in1(dma_a0),
			.in2(dma_a1),
			.in3(dma_a2),
			.in4(dma_a3),
			.in5(dma_a4),
			.in6(dma_a7),
			.y(navo)
		);

	dmg_nor2 #(
			.L_y(87.12517)
		) naxy_inst (
			.in1(dma_phi),
			.in2(maka),
			.y(naxy)
		);

	dmg_xnor #(
			.L_y(294.3123)
		) naze_inst (
			.in1(ff4a_d0),
			.in2(v0),
			.y(naze)
		);

	dmg_dffsr #(
			.L_q(298.2969)
		) neda_inst (
			.d(modu),
			.clk(clkpipe),
			.s_n(nute),
			.r_n(nyha),
			.q(neda),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(7592.629)
		) nefe_inst (
			.in(pevo),
			.ena_n(ext_addr_en_n),
			.y(a14)
		);

	dmg_dlatch_ee_q #(
			.L_q(290.0623)
		) nefo_inst (
			.d(md7),
			.ena(luna),
			.ena_n(loma),
			.q(nefo)
		);

	dmg_dffr #(
			.L_q(3522.719),
			.L_q_n(264.8284)
		) nefy_inst (
			.d(dma_a2_n),
			.clk(dma_a1_n),
			.r_n(lapa),
			.q(dma_a2),
			.q_n(dma_a2_n)
		);

	dmg_dlatch #(
			.L_q_n(95.62495)
		) nejy_inst (
			.d(cpu_irq3),
			.ena(ff0f_rd_n),
			.q(),
			.q_n(nejy_n)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) nela_inst (
			.in(maty_n),
			.ena(pola),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(103.3283)
		) nele_inst (
			.in(palo),
			.y(nele)
		);

	dmg_ao2222 #(
			.L_y(452.6247)
		) nelo_inst (
			.in1(nypo),
			.in2(bgp_d6),
			.in3(numa),
			.in4(bgp_d4),
			.in5(nuxo),
			.in6(bgp_d2),
			.in7(pobu),
			.in8(bgp_d0),
			.y(nelo)
		);

	dmg_not_x1 #(
			.L_y(189.3904)
		) nena_inst (
			.in(a9_in_n),
			.y(nena)
		);

	dmg_drlatch_ee #(
			.L_q(189.6562),
			.L_q_n(103.0625)
		) nene_inst (
			.d(d5),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d5),
			.q_n(ff4a_d5_n)
		);

	dmg_not_x1 #(
			.L_y(89.5155)
		) neny_inst (
			.in(nogu),
			.y(neny)
		);

	dmg_dffsr #(
			.L_q(177.4375)
		) nepo_inst (
			.d(macu),
			.clk(clkpipe),
			.s_n(myvy),
			.r_n(mosy),
			.q(nepo),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(157.7809)
		) nero_inst (
			.in1(mulo),
			.in2(petu),
			.y(nero)
		);

	dmg_nor8 #(
			.L_y(227.1094)
		) neru_inst (
			.in1(v7),
			.in2(v4),
			.in3(v3),
			.in4(v0),
			.in5(v1),
			.in6(v2),
			.in7(v5),
			.in8(v6),
			.y(neru)
		);

	dmg_drlatch_ee #(
			.L_q(133.0783),
			.L_q_n(212.4997)
		) neso_inst (
			.d(d0),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d0),
			.q_n(ff4a_d0_n)
		);

	dmg_and2 #(
			.L_y(3561.234)
		) neta_inst (
			.in1(nogu),
			.in2(tm_bp_cys),
			.y(bp_cy)
		);

	dmg_xnor #(
			.L_y(258.1872)
		) nevu_inst (
			.in1(ff4a_d3),
			.in2(v3),
			.y(nevu)
		);

	dmg_or2 #(
			.L_y(108.9062)
		) nevy_inst (
			.in1(mexo),
			.in2(moca),
			.y(nevy)
		);

	dmg_nand2 #(
			.L_y(127.4999)
		) nexa_inst (
			.in1(noly),
			.in2(loze),
			.y(nexa)
		);

	dmg_not_x1 #(
			.L_y(101.7346)
		) neze_inst (
			.in(nasa),
			.y(neze)
		);

	dmg_xnor #(
			.L_y(143.9685)
		) nezo_inst (
			.in1(h4),
			.in2(ff4b_d4),
			.y(nezo)
		);

	dmg_not_x1 #(
			.L_y(55.78141)
		) nobo_inst (
			.in(nefo),
			.y(nobo)
		);

	dmg_not_x1 #(
			.L_y(116.6094)
		) nocu_inst (
			.in(pynu),
			.y(nocu)
		);

	dmg_drlatch_ee #(
			.L_q(189.3904),
			.L_q_n(263.2347)
		) nofe_inst (
			.d(d1),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d1),
			.q_n(ff4b_d1_n)
		);

	dmg_not_x1 #(
			.L_y(1108.984)
		) nofu_inst (
			.in(nyva),
			.y(nofu)
		);

	dmg_nand2 #(
			.L_y(133.0781)
		) nogu_inst (
			.in1(nako),
			.in2(nofu),
			.y(nogu)
		);

	dmg_nand5 #(
			.L_y(67.73405)
		) nogy_inst (
			.in1(nufa),
			.in2(mylo),
			.in3(puwu),
			.in4(puho),
			.in5(nytu),
			.y(nogy)
		);

	dmg_xnor #(
			.L_y(93.76559)
		) nojo_inst (
			.in1(ff4a_d4),
			.in2(v4),
			.y(nojo)
		);

	dmg_drlatch_ee #(
			.L_q(98.28117),
			.L_q_n(90.8436)
		) noke_inst (
			.d(d2),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d2),
			.q_n(ff4b_d2_n)
		);

	dmg_and4 #(
			.L_y(267.7502)
		) noko_inst (
			.in1(v7),
			.in2(v4),
			.in3(v3),
			.in4(v0),
			.y(noko)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) nola_inst (
			.in(muru_n),
			.ena(tuby),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(73.84372)
		) nolo_inst (
			.in(navo),
			.y(nolo)
		);

	dmg_not_x1 #(
			.L_y(68.79678)
		) noly_inst (
			.in(nudu),
			.y(noly)
		);

	dmg_xnor #(
			.L_y(126.7031)
		) nono_inst (
			.in1(h6),
			.in2(ff4b_d6),
			.y(nono)
		);

	dmg_dffr #(
			.L_q_n(133.0786)
		) nopa_inst (
			.d(pynu),
			.clk(ppu_4mhz_n),
			.r_n(ppu_reset_n),
			.q(),
			.q_n(nopa_n)
		);

	dmg_xnor #(
			.L_y(103.3282)
		) nory_inst (
			.in1(h5),
			.in2(ff4b_d5),
			.y(nory)
		);

	dmg_dffsr #(
			.L_q(126.9689)
		) nozo_inst (
			.d(myde),
			.clk(clkpipe),
			.s_n(nyxo),
			.r_n(nexa),
			.q(nozo),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(99.87506)
		) nuca_inst (
			.in(peba),
			.y(nuca)
		);

	dmg_dlatch_ee_q #(
			.L_q(210.6403)
		) nudu_inst (
			.d(md1),
			.ena(luna),
			.ena_n(loma),
			.q(nudu)
		);

	dmg_not_x1 #(
			.L_y(113.9529)
		) nufa_inst (
			.in(puky),
			.y(nufa)
		);

	dmg_tffnl #(
			.L_q(147.1562),
			.L_q_n(263.2343)
		) nuga_inst (
			.d(pagu),
			.l(mexu),
			.tclk_n(peda),
			.q(nuga),
			.q_n(nuga_n)
		);

	dmg_drlatch_ee #(
			.L_q(171.328),
			.L_q_n(112.8903)
		) nuka_inst (
			.d(d6),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d6),
			.q_n(ff4a_d6_n)
		);

	dmg_dffsr #(
			.L_q(249.6877)
		) nuke_inst (
			.d(palu),
			.clk(clkpipe),
			.s_n(mene),
			.r_n(pazo),
			.q(nuke),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(246.7655)
		) nuko_inst (
			.in(nogy),
			.y(wxy_match)
		);

	dmg_drlatch_ee #(
			.L_q(116.6094),
			.L_q_n(99.87506)
		) nuku_inst (
			.d(d7),
			.ena(mare),
			.ena_n(voxu),
			.r_n(win_reset_n),
			.q(ff4b_d7),
			.q_n(ff4b_d7_n)
		);

	dmg_drlatch_ee #(
			.L_q(149.2811),
			.L_q_n(158.8434)
		) nulo_inst (
			.d(d4),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d4),
			.q_n(ff4a_d4_n)
		);

	dmg_nor2 #(
			.L_y(922.2501)
		) nuly_inst (
			.in1(woxa),
			.in2(xula),
			.y(nuly)
		);

	dmg_and3 #(
			.L_y(509.4685)
		) numa_inst (
			.in1(nale),
			.in2(soba),
			.in3(bgpx),
			.y(numa)
		);

	dmg_dffr #(
			.L_q(99.07811)
		) nunu_inst (
			.d(pyco),
			.clk(mehe),
			.r_n(ppu_reset_n),
			.q(nunu),
			.q_n()
		);

	dmg_and2 #(
			.L_y(454.7502)
		) nuny_inst (
			.in1(pynu),
			.in2(nopa_n),
			.y(win_start)
		);

	dmg_xnor #(
			.L_y(221.2657)
		) nupa_inst (
			.in1(ff4a_d7),
			.in2(v7),
			.y(nupa)
		);

	dmg_not_x1 #(
			.L_y(115.2815)
		) nupo_inst (
			.in(soba),
			.y(nupo)
		);

	dmg_ao2222 #(
			.L_y(353.5466)
		) nura_inst (
			.in1(bgp_d7),
			.in2(nypo),
			.in3(bgp_d5),
			.in4(numa),
			.in5(bgp_d3),
			.in6(nuxo),
			.in7(bgp_d1),
			.in8(pobu),
			.y(nura)
		);

	dmg_dffsr #(
			.L_q(329.3751)
		) nuro_inst (
			.d(const0),
			.clk(clkpipe),
			.s_n(pabe),
			.r_n(pyzu),
			.q(sprite_px_b0),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q(300.6876),
			.L_q_n(121.3906)
		) nusy_inst (
			.d(d1),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d1),
			.q_n(bgp_d1_n)
		);

	dmg_not_x1 #(
			.L_y(773.7657)
		) nuta_inst (
			.in(vefu),
			.y(nuta)
		);

	dmg_nand2 #(
			.L_y(274.9217)
		) nute_inst (
			.in1(loze),
			.in2(nasa),
			.y(nute)
		);

	dmg_dffr #(
			.L_q(3934.174),
			.L_q_n(175.5783)
		) nuto_inst (
			.d(dma_a6_n),
			.clk(dma_a5_n),
			.r_n(lapa),
			.q(dma_a6),
			.q_n(dma_a6_n)
		);

	dmg_dlatch #(
			.L_q_n(122.9841)
		) nuty_inst (
			.d(cpu_irq4),
			.ena(ff0f_rd_n),
			.q(),
			.q_n(nuty_n)
		);

	dmg_not_x2 #(
			.L_y(856.9067)
		) nuva_inst (
			.in(ruky),
			.y(nuva)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) nuvy_inst (
			.in(dma_a15_n),
			.ena(pusy),
			.y(d7)
		);

	dmg_and3 #(
			.L_y(459.2657)
		) nuxo_inst (
			.in1(vyco),
			.in2(nupo),
			.in3(bgpx),
			.y(nuxo)
		);

	dmg_not_x1 #(
			.L_y(81.0154)
		) nybe_inst (
			.in(peby),
			.y(nybe)
		);

	dmg_dffsr #(
			.L_q(1423.219)
		) nybo_inst (
			.d(pesu_const1),
			.clk(int_timer),
			.s_n(pyhu),
			.r_n(pyga),
			.q(cpu_irq2),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q(2448.266),
			.L_q_n(95.89044)
		) nydo_inst (
			.d(d3),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a11),
			.q_n(dma_a11_n)
		);

	dmg_dffr #(
			.L_q_n(60.29679)
		) nydu_inst (
			.d(nuga),
			.clk(clk_1mhz),
			.r_n(mugy),
			.q(),
			.q_n(nydu_n)
		);

	dmg_nand3 #(
			.L_y(140.7811)
		) nydy_inst (
			.in1(myso),
			.in2(mesu),
			.in3(nofu),
			.y(latch_bg_bp_a_n)
		);

	dmg_not_x1 #(
			.L_y(99.60938)
		) nyfo_inst (
			.in(win_start),
			.y(nyfo)
		);

	dmg_not_x1 #(
			.L_y(109.4376)
		) nygo_inst (
			.in(molu),
			.y(nygo)
		);

	dmg_dlatch_ee #(
			.L_q(1993.517),
			.L_q_n(95.62516)
		) nygy_inst (
			.d(d4),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a12),
			.q_n(dma_a12_n)
		);

	dmg_nand2 #(
			.L_y(59.76603)
		) nyha_inst (
			.in1(neze),
			.in2(loze),
			.y(nyha)
		);

	dmg_dffr #(
			.L_q(420.4842)
		) nyka_inst (
			.d(lyry),
			.clk(ppu_4mhz_n),
			.r_n(nafy),
			.q(nyka),
			.q_n()
		);

	dmg_dffr #(
			.L_q(160.1718),
			.L_q_n(104.3906)
		) nyke_inst (
			.d(d1),
			.clk(tyju),
			.r_n(reset2_n),
			.q(nyke),
			.q_n(nyke_n)
		);

	dmg_dffr #(
			.L_q(3364.142),
			.L_q_n(202.1406)
		) nyko_inst (
			.d(dma_a4_n),
			.clk(dma_a3_n),
			.r_n(lapa),
			.q(dma_a4),
			.q_n(dma_a4_n)
		);

	dmg_muxi #(
			.L_y(358.5937)
		) nyku_inst (
			.sel(tope),
			.d1(muru),
			.d0(d2),
			.y(nyku)
		);

	dmg_dffsr #(
			.L_q(322.2032)
		) nylu_inst (
			.d(const0),
			.clk(clkpipe),
			.s_n(mezu),
			.r_n(mofy),
			.q(sprite_px_a0),
			.q_n()
		);

	dmg_dffr #(
			.L_q(112.3594),
			.L_q_n(340.2657)
		) nype_inst (
			.d(vclk),
			.clk(hclk),
			.r_n(ppu_reset2_n),
			.q(nype),
			.q_n(nype_n)
		);

	dmg_and3 #(
			.L_y(563.1248)
		) nypo_inst (
			.in1(nale),
			.in2(nupo),
			.in3(bgpx),
			.y(nypo)
		);

	dmg_dlatch #(
			.L_q(135.7346)
		) nyre_inst (
			.d(a14),
			.ena(addr_latch),
			.q(nyre),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(89.51529),
			.L_q_n(113.1563)
		) nyro_inst (
			.d(d1),
			.ena(nuta),
			.ena_n(vefu),
			.r_n(win_reset_n),
			.q(ff4a_d1),
			.q_n(ff4a_d1_n)
		);

	dmg_xnor #(
			.L_y(56.57775)
		) nytu_inst (
			.in1(h3),
			.in2(ff4b_d3),
			.y(nytu)
		);

	dmg_dffr #(
			.L_q(151.1407),
			.L_q_n(146.6253)
		) nyva_inst (
			.d(nyva_n),
			.clk(mesu_n),
			.r_n(bg_cy_rst_n),
			.q(nyva),
			.q_n(nyva_n)
		);

	dmg_nand2 #(
			.L_y(243.5784)
		) nyxo_inst (
			.in1(loze),
			.in2(nudu),
			.y(nyxo)
		);

	dmg_nor3 #(
			.L_y(1159.453)
		) nyxu_inst (
			.in1(stop_oam_parsing),
			.in2(mosu),
			.in3(tevo),
			.y(bg_cy_rst_n)
		);

	dmg_dffr #(
			.L_q_n(143.7031)
		) nyze_inst (
			.d(puxa),
			.clk(moxe),
			.r_n(mode3),
			.q(),
			.q_n(nyze_n)
		);

	dmg_oam #(
			.L_d0(3733.094),
			.L_d1(3245.672),
			.L_d2(3599.485),
			.L_d3(3380.61),
			.L_d4(3349.267),
			.L_d5(2654.923),
			.L_d6(2693.172),
			.L_d7(1790.578)
		) oam_a_inst (
			.d0(oam_a_d7_n),
			.d1(oam_a_d6_n),
			.d2(oam_a_d5_n),
			.d3(oam_a_d4_n),
			.d4(oam_a_d3_n),
			.d5(oam_a_d2_n),
			.d6(oam_a_d1_n),
			.d7(oam_a_d0_n),
			.col0(oam_a2_na1_n),
			.col1(oam_a2_na1),
			.col2(oam_a2a1_n),
			.col3(oam_a2a1),
			.a2(oam_a3),
			.a2_n(oam_a3_n),
			.a3(oam_a4),
			.a3_n(oam_a4_n),
			.a4(oam_a5),
			.a4_n(oam_a5_n),
			.a5(oam_a6),
			.a5_n(oam_a6_n),
			.a6(oam_a7),
			.a6_n(oam_a7_n),
			.oe_n(oam_oe_n),
			.oe(oam_oe),
			.wr(oam_a_wr2),
			.bl_pch_n(oam_bl_precharge_n),
			.wldrv_pch_n(oam_wldrv_precharge_n)
		);

	dmg_oam #(
			.L_d0(3915.844),
			.L_d1(4158.359),
			.L_d2(4361.828),
			.L_d3(4690.937),
			.L_d4(4506.33),
			.L_d5(4722.281),
			.L_d6(4592.656),
			.L_d7(3951.438)
		) oam_b_inst (
			.d0(oam_b_d0_n),
			.d1(oam_b_d1_n),
			.d2(oam_b_d2_n),
			.d3(oam_b_d3_n),
			.d4(oam_b_d4_n),
			.d5(oam_b_d5_n),
			.d6(oam_b_d6_n),
			.d7(oam_b_d7_n),
			.col0(oam_a2_na1_n),
			.col1(oam_a2_na1),
			.col2(oam_a2a1_n),
			.col3(oam_a2a1),
			.a2(oam_a3),
			.a2_n(oam_a3_n),
			.a3(oam_a4),
			.a3_n(oam_a4_n),
			.a4(oam_a5),
			.a4_n(oam_a5_n),
			.a5(oam_a6),
			.a5_n(oam_a6_n),
			.a6(oam_a7),
			.a6_n(oam_a7_n),
			.oe_n(oam_oe_n),
			.oe(oam_oe),
			.wr(oam_b_wr2),
			.bl_pch_n(oam_bl_precharge_n),
			.wldrv_pch_n(oam_wldrv_precharge_n)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(835.1254)
		) p10_inst (
			.pdrv_n(kole),
			.ndrv(kybu),
			.ena_n_pu(const0),
			.i_n(p10_in_n),
			.pad(p10_pad)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1097.828)
		) p11_inst (
			.pdrv_n(kyto),
			.ndrv(kabu),
			.ena_n_pu(const0),
			.i_n(p11_in_n),
			.pad(p11_pad)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(1348.578)
		) p12_inst (
			.pdrv_n(kyhu),
			.ndrv(kasy),
			.ena_n_pu(const0),
			.i_n(p12_in_n),
			.pad(p12_pad)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(2300.579)
		) p13_inst (
			.pdrv_n(kory),
			.ndrv(kale),
			.ena_n_pu(const0),
			.i_n(p13_in_n),
			.pad(p13_pad)
		);

	dmg_pad_out_diff #(
		) p14_inst (
			.pdrv_n(karu),
			.ndrv(kely_n),
			.pad(p14_pad)
		);

	dmg_pad_out_diff #(
		) p15_inst (
			.pdrv_n(cela),
			.ndrv(cofy_n),
			.pad(p15_pad)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) paba_inst (
			.in(bgp_d1_n),
			.ena_n(tepy),
			.y(d1)
		);

	dmg_nand2 #(
			.L_y(202.6714)
		) pabe_inst (
			.in1(rewo),
			.in2(sprite_on0),
			.y(pabe)
		);

	dmg_mux #(
			.L_y(1705.578)
		) pacy_inst (
			.sel(xono),
			.d1(md3),
			.d0(md4),
			.y(sp_d4)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) pado_inst (
			.in(nejy_n),
			.ena(pola),
			.y(d3)
		);

	dmg_nand5 #(
			.L_y(137.8592)
		) pafu_inst (
			.in1(nele),
			.in2(naze),
			.in3(pebo),
			.in4(pomo),
			.in5(nevu),
			.y(pafu)
		);

	dmg_xnor #(
			.L_y(109.9686)
		) paga_inst (
			.in1(ff4a_d5),
			.in2(v5),
			.y(paga)
		);

	dmg_or2 #(
			.L_y(228.7029)
		) pago_inst (
			.in1(lyc_stat_reset_n),
			.in2(ryju),
			.y(pago)
		);

	dmg_nor2 #(
			.L_y(339.4689)
		) pagu_inst (
			.in1(mulo),
			.in2(rato),
			.y(pagu)
		);

	dmg_not_x1 #(
			.L_y(206.922)
		) paha_inst (
			.in(mode3),
			.y(paha)
		);

	dmg_dffr #(
			.L_q(220.2032)
		) paho_inst (
			.d(h3),
			.clk(roxo),
			.r_n(mode3),
			.q(paho),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(1277.391)
		) pahy_inst (
			.in1(t1t2_n),
			.in2(pege),
			.y(pahy)
		);

	dmg_nand5 #(
			.L_y(112.3597)
		) palo_inst (
			.in1(ff40_d5),
			.in2(nojo),
			.in3(paga),
			.in4(pezo),
			.in5(nupa),
			.y(palo)
		);

	dmg_dffsr #(
			.L_q(655.0313)
		) palu_inst (
			.d(somy),
			.clk(clkpipe),
			.s_n(rora),
			.r_n(rudu),
			.q(palu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(151.672)
		) paly_inst (
			.in(rape),
			.y(paly)
		);

	dmg_nand2 #(
			.L_y(383.5623)
		) pamo_inst (
			.in1(sprite_palette),
			.in2(sprite_on2),
			.y(pamo)
		);

	dmg_mux #(
			.L_y(377.4534)
		) pamy_inst (
			.sel(dma_addr_ext),
			.d1(dma_a10),
			.d0(pate),
			.y(pamy)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) pane_inst (
			.in(dma_a11_n),
			.ena(pusy),
			.y(d3)
		);

	dmg_nor2 #(
			.L_y(419.953)
		) pany_inst (
			.in1(roze),
			.in2(wxy_match),
			.y(pany)
		);

	dmg_dlatch_ee #(
			.L_q(1655.109),
			.L_q_n(93.49991)
		) para_inst (
			.d(d2),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a10),
			.q_n(dma_a10_n)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) pare_inst (
			.in(dma_a12_n),
			.ena(pusy),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(1121.735)
		) paru_inst (
			.in(popu_n),
			.y(mode1)
		);

	dmg_xnor #(
			.L_y(123.7813)
		) pase_inst (
			.in1(h7),
			.in2(ff4b_d7),
			.y(pase)
		);

	dmg_nor2 #(
			.L_y(653.9689)
		) paso_inst (
			.in1(paha),
			.in2(tevo),
			.y(paso)
		);

	dmg_dlatch #(
			.L_q(99.34369)
		) pate_inst (
			.d(a10),
			.ena(addr_latch),
			.q(pate),
			.q_n()
		);

	dmg_or3 #(
			.L_y(355.4063)
		) paty_inst (
			.in1(nura),
			.in2(wufu),
			.in3(moka),
			.y(paty)
		);

	dmg_dlatch_ee #(
			.L_q(248.3596),
			.L_q_n(102.0003)
		) pavo_inst (
			.d(d0),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d0),
			.q_n(bgp_d0_n)
		);

	dmg_dlatch #(
			.L_q_n(107.3125)
		) pavy_inst (
			.d(cpu_irq2),
			.ena(ff0f_rd_n),
			.q(),
			.q_n(pavy_n)
		);

	dmg_mux #(
			.L_y(1721.25)
		) pawe_inst (
			.sel(xono),
			.d1(md1),
			.d0(md6),
			.y(sp_d6)
		);

	dmg_nand2 #(
			.L_y(139.453)
		) pazo_inst (
			.in1(ryfe),
			.in2(sprite_on5),
			.y(pazo)
		);

	dmg_dlatch_ee_q #(
			.L_q(857.4375)
		) peba_inst (
			.d(sp_d1),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(peba)
		);

	dmg_xnor #(
			.L_y(141.8439)
		) pebo_inst (
			.in1(ff4a_d1),
			.in2(v1),
			.y(pebo)
		);

	dmg_not_x1 #(
			.L_y(79.95319)
		) peby_inst (
			.in(raca),
			.y(peby)
		);

	dmg_nand2 #(
			.L_y(111.2968)
		) pecu_inst (
			.in1(roxo),
			.in2(roze),
			.y(pecu)
		);

	dmg_tffnl #(
			.L_q(100.4064),
			.L_q_n(333.8904)
		) peda_inst (
			.d(pyma),
			.l(mexu),
			.tclk_n(rage),
			.q(peda),
			.q_n(peda_n)
		);

	dmg_not_x2 #(
			.L_y(1222.406)
		) pedu_inst (
			.in(ruma),
			.y(pedu)
		);

	dmg_dlatch_ee_q #(
			.L_q(451.8279)
		) pefo_inst (
			.d(sp_d0),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(pefo)
		);

	dmg_dffsr #(
			.L_q(529.3904)
		) pefu_inst (
			.d(sprite_px_a0),
			.clk(clkpipe),
			.s_n(rusy),
			.r_n(ruca),
			.q(sprite_px_a1),
			.q_n()
		);

	dmg_mux #(
			.L_y(398.1726)
		) pege_inst (
			.sel(dma_addr_ext),
			.d1(dma_a14),
			.d0(nyre),
			.y(pege)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) pegy_inst (
			.in(nuty_n),
			.ena(pola),
			.y(d4)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) pela_inst (
			.in(ff4a_d5_n),
			.ena_n(vomy),
			.y(d5)
		);

	dmg_mux #(
			.L_y(1798.547)
		) pelo_inst (
			.sel(xono),
			.d1(md6),
			.d0(md1),
			.y(sp_d1)
		);

	dmg_or3 #(
			.L_y(347.7031)
		) pero_inst (
			.in1(nelo),
			.in2(waly),
			.in3(mufa),
			.y(pero)
		);

	dmg_tffnl #(
			.L_q(147.6874),
			.L_q_n(417.8278)
		) peru_inst (
			.d(nada),
			.l(mexu),
			.tclk_n(povy),
			.q(peru),
			.q_n(peru_n)
		);

	dmg_tie #(
			.L_gnd(27409.06),
			.L_vdd(2081.703)
		) pesu_inst (
			.gnd(const0),
			.vdd(pesu_const1)
		);

	dmg_dffr #(
			.L_q(138.3906),
			.L_q_n(74.64036)
		) peto_inst (
			.d(d6),
			.clk(tyju),
			.r_n(reset2_n),
			.q(peto),
			.q_n(peto_n)
		);

	dmg_muxi #(
			.L_y(418.0936)
		) petu_inst (
			.sel(tope),
			.d1(nyke),
			.d0(d1),
			.y(petu)
		);

	dmg_not_x1 #(
			.L_y(159.1092)
		) pevo_inst (
			.in(a14_in_n),
			.y(pevo)
		);

	dmg_xnor #(
			.L_y(143.9687)
		) pezo_inst (
			.in1(ff4a_d6),
			.in2(v6),
			.y(pezo)
		);

	dmg_pad_out #(
		) phi_inst (
			.o_n(data_phase),
			.pad(phi_pad)
		);

	dmg_mux #(
			.L_y(1567.719)
		) pobe_inst (
			.sel(xono),
			.d1(md4),
			.d0(md3),
			.y(sp_d3)
		);

	dmg_and3 #(
			.L_y(182.4842)
		) pobu_inst (
			.in1(vyco),
			.in2(soba),
			.in3(bgpx),
			.y(pobu)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) poda_inst (
			.in(ff4a_d1_n),
			.ena_n(vomy),
			.y(d1)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) pofo_inst (
			.in(rufo_n),
			.ena_n(vave),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(1413.922)
		) pofy_inst (
			.in(ruju),
			.y(pofy)
		);

	dmg_not_x2 #(
			.L_y(3082.58)
		) pogu_inst (
			.in(ryno),
			.y(pogu)
		);

	dmg_not_x1 #(
			.L_y(98.54715)
		) pohu_inst (
			.in(rone),
			.y(pohu)
		);

	dmg_dffr_cc_q #(
			.L_q(448.1096)
		) poju_inst (
			.d(md5),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile5)
		);

	dmg_nor3 #(
			.L_y(1009.64)
		) poka_inst (
			.in1(nuly),
			.in2(ruta),
			.in3(ryfu),
			.y(poka)
		);

	dmg_dlatch_ee #(
			.L_q(665.1252),
			.L_q_n(98.81233)
		) poku_inst (
			.d(d6),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a14),
			.q_n(dma_a14_n)
		);

	dmg_nor_latch #(
			.L_q(395.5154)
		) poky_inst (
			.s(pygo),
			.r(mode3_n),
			.q(poky),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(462.1875)
		) pola_inst (
			.in(ff0f_rd_n),
			.y(pola)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) polo_inst (
			.in(ff4a_d6_n),
			.ena_n(vomy),
			.y(d6)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) poly_inst (
			.in(dma_a8_n),
			.ena(pusy),
			.y(d0)
		);

	dmg_nor2 #(
			.L_y(106.25)
		) pome_inst (
			.in1(stop_oam_parsing),
			.in2(pofy),
			.y(pome)
		);

	dmg_xnor #(
			.L_y(71.71887)
		) pomo_inst (
			.in1(ff4a_d2),
			.in2(v2),
			.y(pomo)
		);

	dmg_mux #(
			.L_y(1962.703)
		) pono_inst (
			.sel(xono),
			.d1(md5),
			.d0(md2),
			.y(sp_d2)
		);

	dmg_not_x2 #(
			.L_y(569.7657)
		) pony_inst (
			.in(reho),
			.y(pony)
		);

	dmg_dffr #(
			.L_q(98.81254),
			.L_q_n(207.1874)
		) popu_inst (
			.d(vbl),
			.clk(nype),
			.r_n(ppu_reset2_n),
			.q(popu),
			.q_n(popu_n)
		);

	dmg_not_x2 #(
			.L_y(3035.032)
		) pore_inst (
			.in(nocu),
			.y(in_window)
		);

	dmg_dffr #(
			.L_q(636.7031)
		) pory_inst (
			.d(nyka),
			.clk(myvo),
			.r_n(nafy),
			.q(pory),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) pote_inst (
			.in(rugu_n),
			.ena_n(vave),
			.y(d6)
		);

	dmg_and2 #(
			.L_y(2489.437)
		) potu_inst (
			.in1(neny),
			.in2(tm_bp_cys),
			.y(tm_cy)
		);

	dmg_and2 #(
			.L_y(263.2344)
		) pova_inst (
			.in1(nyze_n),
			.in2(puxa),
			.y(pova)
		);

	dmg_tffnl #(
			.L_q(27.09386),
			.L_q_n(356.4687)
		) povy_inst (
			.d(nero),
			.l(mexu),
			.tclk_n(rega),
			.q(povy),
			.q_n(povy_n)
		);

	dmg_and2 #(
			.L_y(842.5624)
		) powu_inst (
			.in1(dma_run),
			.in2(naxy),
			.y(powu)
		);

	dmg_dffr_cc_q #(
			.L_q(599.7809)
		) powy_inst (
			.d(md6),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile6)
		);

	dmg_dffr_cc_q #(
			.L_q(610.4059)
		) poxa_inst (
			.d(md3),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile3)
		);

	dmg_dffr_cc_q #(
			.L_q(363.3745)
		) pozo_inst (
			.d(md1),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile1)
		);

	dmg_not_x1 #(
			.L_y(1127.844)
		) puco_inst (
			.in(nybe),
			.y(puco)
		);

	dmg_dlatch_ee_q #(
			.L_q(781.2032)
		) pudu_inst (
			.d(sp_d3),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(pudu)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) pufy_inst (
			.in(raha_n),
			.ena_n(weku),
			.y(d7)
		);

	dmg_mux #(
			.L_y(1618.453)
		) pugu_inst (
			.sel(xono),
			.d1(md2),
			.d0(md5),
			.y(sp_d5)
		);

	dmg_nand2 #(
			.L_y(1536.641)
		) puhe_inst (
			.in1(pege),
			.in2(ext_addr_en_n),
			.y(puhe)
		);

	dmg_xnor #(
			.L_y(121.3907)
		) puho_inst (
			.in1(h2),
			.in2(ff4b_d2),
			.y(puho)
		);

	dmg_nor2 #(
			.L_y(98.28137)
		) puku_inst (
			.in1(win_start),
			.in2(rydy),
			.y(puku)
		);

	dmg_nand5 #(
			.L_y(116.8748)
		) puky_inst (
			.in1(wy_latch),
			.in2(nezo),
			.in3(nory),
			.in4(nono),
			.in5(pase),
			.y(puky)
		);

	dmg_dlatch_ee #(
			.L_q(611.2031),
			.L_q_n(101.4683)
		) pula_inst (
			.d(d5),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a13),
			.q_n(dma_a13_n)
		);

	dmg_dffr_cc_q #(
			.L_q(543.7343)
		) pulo_inst (
			.d(md4),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile4)
		);

	dmg_mux #(
			.L_y(1775.172)
		) puly_inst (
			.sel(xono),
			.d1(md0),
			.d0(md7),
			.y(sp_d7)
		);

	dmg_nand2 #(
			.L_y(284.75)
		) pume_inst (
			.in1(sprite_palette),
			.in2(sprite_on0),
			.y(pume)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) punu_inst (
			.in(ff4a_d0_n),
			.ena_n(vomy),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(413.3125)
		) pupu_inst (
			.in(ryve),
			.y(pupu)
		);

	dmg_not_x3 #(
			.L_y(1768.266)
		) pure_inst (
			.in(vclk),
			.y(vclk_n)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) puso_inst (
			.in(nuga_n),
			.ena(teda),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(943.7656)
		) pusy_inst (
			.in(nygo),
			.y(pusy)
		);

	dmg_mux #(
			.L_y(1830.688)
		) pute_inst (
			.sel(xono),
			.d1(md7),
			.d0(md0),
			.y(sp_d0)
		);

	dmg_or2 #(
			.L_y(683.9846)
		) puva_inst (
			.in1(nevy),
			.in2(dma_addr_ext),
			.y(puva)
		);

	dmg_xnor #(
			.L_y(139.7187)
		) puwu_inst (
			.in1(h1),
			.in2(ff4b_d1),
			.y(puwu)
		);

	dmg_dffr #(
			.L_q(336.2816)
		) puxa_inst (
			.d(pohu),
			.clk(roxo),
			.r_n(mode3),
			.q(puxa),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(163.8904)
		) puxy_inst (
			.in1(mulo),
			.in2(roke),
			.y(puxy)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) puzo_inst (
			.in(roxe_n),
			.ena_n(vave),
			.y(d3)
		);

	dmg_dffsr #(
			.L_q(765.2657)
		) pybo_inst (
			.d(neda),
			.clk(clkpipe),
			.s_n(naja),
			.r_n(nady),
			.q(bg_px_a),
			.q_n()
		);

	dmg_dffr #(
			.L_q(553.0314)
		) pyco_inst (
			.d(wxy_match),
			.clk(roco),
			.r_n(ppu_reset_n),
			.q(pyco),
			.q_n()
		);

	dmg_and3 #(
			.L_y(127.5001)
		) pyga_inst (
			.in1(rake),
			.in2(lesa),
			.in3(reset2_n),
			.y(pyga)
		);

	dmg_dffr #(
			.L_q(287.672)
		) pygo_inst (
			.d(pory),
			.clk(ppu_4mhz_n),
			.r_n(mode3),
			.q(pygo),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) pygu_inst (
			.in(ff4a_d2_n),
			.ena_n(vomy),
			.y(d2)
		);

	dmg_nand3 #(
			.L_y(214.0937)
		) pyhu_inst (
			.in1(rotu),
			.in2(lesa),
			.in3(d2),
			.y(pyhu)
		);

	dmg_dffsr #(
			.L_q(751.7186)
		) pyjo_inst (
			.d(sprite_px_a2),
			.clk(clkpipe),
			.s_n(rano),
			.r_n(rehu),
			.q(sprite_px_a3),
			.q_n()
		);

	dmg_dffr_cc_q #(
			.L_q(909.2339)
		) pyju_inst (
			.d(md7),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile7)
		);

	dmg_dffr #(
			.L_q(3583.55),
			.L_q_n(417.8278)
		) pylo_inst (
			.d(dma_a5_n),
			.clk(dma_a4_n),
			.r_n(lapa),
			.q(dma_a5),
			.q_n(dma_a5_n)
		);

	dmg_dlatch_ee #(
			.L_q(181.1563),
			.L_q_n(120.5937)
		) pylu_inst (
			.d(d2),
			.ena(lyfa),
			.ena_n(tepo),
			.q(bgp_d2),
			.q_n(bgp_d2_n)
		);

	dmg_nor2 #(
			.L_y(181.6876)
		) pyma_inst (
			.in1(mulo),
			.in2(refu),
			.y(pyma)
		);

	dmg_dlatch_ee #(
			.L_q(2447.47),
			.L_q_n(98.54685)
		) pyne_inst (
			.d(d1),
			.ena(pysu),
			.ena_n(loru),
			.q(dma_a9),
			.q_n(dma_a9_n)
		);

	dmg_nor_latch #(
			.L_q(344.5156)
		) pynu_inst (
			.s(nunu),
			.r(xofo),
			.q(pynu),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) pyre_inst (
			.in(nyke_n),
			.ena(tuby),
			.y(d1)
		);

	dmg_dffr #(
			.L_q(3978.002),
			.L_q_n(329.6407)
		) pyro_inst (
			.d(dma_a1_n),
			.clk(dma_a0_n),
			.r_n(lapa),
			.q(dma_a1),
			.q_n(dma_a1_n)
		);

	dmg_not_x1 #(
			.L_y(284.7499)
		) pyry_inst (
			.in(ppu_reset_n),
			.y(ppu_reset2)
		);

	dmg_not_x1 #(
			.L_y(947.4848)
		) pysu_inst (
			.in(loru),
			.y(pysu)
		);

	dmg_dffr_cc_q #(
			.L_q(574.2813)
		) pyzo_inst (
			.d(md2),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile2)
		);

	dmg_nand2 #(
			.L_y(125.9061)
		) pyzu_inst (
			.in1(rata),
			.in2(sprite_on0),
			.y(pyzu)
		);

	dmg_nand2 #(
			.L_y(125.1095)
		) pyzy_inst (
			.in1(naro),
			.in2(sprite_on2),
			.y(pyzy)
		);

	dmg_not_x1 #(
			.L_y(72.51551)
		) rabo_inst (
			.in(md6),
			.y(rabo)
		);

	dmg_nand2 #(
			.L_y(1222.673)
		) raby_inst (
			.in1(d2),
			.in2(lula),
			.y(raby)
		);

	dmg_and2 #(
			.L_y(430.5779)
		) raca_inst (
			.in1(vonu),
			.in2(sycu),
			.y(raca)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) race_inst (
			.in(sota_n),
			.ena_n(weku),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(397.6408)
		) raco_inst (
			.in(tuto),
			.y(raco)
		);

	dmg_and4 #(
			.L_y(177.4375)
		) racu_inst (
			.in1(rylu),
			.in2(rawa),
			.in3(tm_bp_cys_n),
			.in4(apam),
			.y(racu)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) racy_inst (
			.in(povy_n),
			.ena(teda),
			.y(d1)
		);

	dmg_not_x2 #(
			.L_y(1190.266)
		) rada_inst (
			.in(suna),
			.y(rada)
		);

	dmg_not_x2 #(
			.L_y(889.0469)
		) rady_inst (
			.in(sawu),
			.y(rady)
		);

	dmg_nand2 #(
			.L_y(735.5156)
		) rafy_inst (
			.in1(d6),
			.in2(lula),
			.y(rafy)
		);

	dmg_nand2 #(
			.L_y(304.1406)
		) raga_inst (
			.in1(luxa),
			.in2(bg_tile7),
			.y(raga)
		);

	dmg_tffnl #(
			.L_q(261.3751),
			.L_q_n(131.2188)
		) rage_inst (
			.d(rugy),
			.l(mexu),
			.tclk_n(ruby),
			.q(rage),
			.q_n(rage_n)
		);

	dmg_not_x2 #(
			.L_y(5273.455)
		) ragu_inst (
			.in(sofy),
			.y(ragu)
		);

	dmg_drlatch_ee #(
			.L_q(213.0309),
			.L_q_n(165.4845)
		) raha_inst (
			.d(d7),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(raha),
			.q_n(raha_n)
		);

	dmg_not_x3 #(
			.L_y(1597.203)
		) rahu_inst (
			.in(rocy),
			.y(rahu)
		);

	dmg_nand2 #(
			.L_y(248.6249)
		) raja_inst (
			.in1(luxa),
			.in2(bg_tile5),
			.y(raja)
		);

	dmg_nand2 #(
			.L_y(222.0623)
		) rajo_inst (
			.in1(luxa),
			.in2(bg_tile6),
			.y(rajo)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) raju_inst (
			.in(runo),
			.ena(seby),
			.y(d3)
		);

	dmg_and2 #(
			.L_y(1289.344)
		) rajy_inst (
			.in1(bg_px_a),
			.in2(ff40_d0),
			.y(rajy)
		);

	dmg_or2 #(
			.L_y(107.3125)
		) rake_inst (
			.in1(d2),
			.in2(ff0f_wr_n),
			.y(rake)
		);

	dmg_not_if1 #(
			.L_y(5019.783)
		) raku_inst (
			.in(md7_in_n),
			.ena(rena),
			.y(md7)
		);

	dmg_buf_if0 #(
			.L_y(8718.614)
		) rala_inst (
			.in(sura),
			.ena_n(ext_addr_en_n),
			.y(a10)
		);

	dmg_not_x1 #(
			.L_y(3310.485)
		) ralo_inst (
			.in(d0_in_n),
			.y(ralo)
		);

	dmg_dffsr #(
			.L_q(131.4844)
		) ralu_inst (
			.d(setu),
			.clk(clkpipe),
			.s_n(rajo),
			.r_n(supu),
			.q(ralu),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) raly_inst (
			.in(dma_a13_n),
			.ena(pusy),
			.y(d5)
		);

	dmg_dlatch_ee_q #(
			.L_q(277.0464)
		) rama_inst (
			.d(sp_d6),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(rama)
		);

	dmg_dlatch_ee_q #(
			.L_q(651.3126)
		) ramu_inst (
			.d(sp_d3),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(ramu)
		);

	dmg_nand2 #(
			.L_y(207.1873)
		) rano_inst (
			.in1(ramu),
			.in2(sprite_on3),
			.y(rano)
		);

	dmg_nand2 #(
			.L_y(496.1877)
		) rape_inst (
			.in1(subo),
			.in2(sovu),
			.y(rape)
		);

	dmg_not_x1 #(
			.L_y(185.6718)
		) rapu_inst (
			.in(bg_tile6),
			.y(rapu)
		);

	dmg_not_x2 #(
			.L_y(983.6097)
		) rare_inst (
			.in(roko),
			.y(rare)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) raro_inst (
			.in(bgp_d0_n),
			.ena_n(tepy),
			.y(d0)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) raru_inst (
			.in(const0),
			.ena(leco),
			.y(d7)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) rase_inst (
			.in(const0),
			.ena(leco),
			.y(d3)
		);

	dmg_xor #(
			.L_y(136.7969)
		) rasy_inst (
			.in1(v3),
			.in2(salo),
			.y(rasy)
		);

	dmg_not_x1 #(
			.L_y(107.5781)
		) rata_inst (
			.in(rewo),
			.y(rata)
		);

	dmg_tffnl #(
			.L_q(328.047),
			.L_q_n(264.5628)
		) rate_inst (
			.d(repa),
			.l(mexu),
			.tclk_n(peru),
			.q(rate),
			.q_n(rate_n)
		);

	dmg_muxi #(
			.L_y(225.7812)
		) rato_inst (
			.sel(tope),
			.d1(seta),
			.d0(d7),
			.y(rato)
		);

	dmg_not_x1 #(
			.L_y(127.5)
		) ratu_inst (
			.in(d5_in_n),
			.y(ratu)
		);

	dmg_not_x1 #(
			.L_y(57.90626)
		) rave_inst (
			.in(sola),
			.y(rave)
		);

	dmg_not_x2 #(
			.L_y(2285.174)
		) ravo_inst (
			.in(paty),
			.y(ravo)
		);

	dmg_nand2 #(
			.L_y(460.8592)
		) ravu_inst (
			.in1(d7),
			.in2(lula),
			.y(ravu)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) ravy_inst (
			.in(peru_n),
			.ena(teda),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(889.0471)
		) rawa_inst (
			.in(soho),
			.y(rawa)
		);

	dmg_dffr_cc_q #(
			.L_q(450.4999)
		) rawu_inst (
			.d(md0),
			.clk(labu),
			.clk_n(luve),
			.r_n(vypo_const1),
			.q(bg_tile0)
		);

	dmg_dlatch #(
			.L_q(106.2502)
		) raxy_inst (
			.d(d2_in_n),
			.ena(lavo),
			.q(raxy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(362.5782)
		) raza_inst (
			.in(a15_in_n),
			.y(raza)
		);

	dmg_not_x2 #(
			.L_y(1464.391)
		) razo_inst (
			.in(sefu),
			.y(razo)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) razu_inst (
			.in(sedy_n),
			.ena_n(weku),
			.y(d2)
		);

	dmg_not_if1 #(
			.L_y(4801.705)
		) reba_inst (
			.in(md1_in_n),
			.ena(rena),
			.y(md1)
		);

	dmg_xor #(
			.L_y(299.8905)
		) reda_inst (
			.in1(v2),
			.in2(sedy),
			.y(reda)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) redo_inst (
			.in(bgp_d2_n),
			.ena_n(tepy),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(87.92181)
		) redu_inst (
			.in(cpu_rd),
			.y(redu)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) redy_inst (
			.in(salo_n),
			.ena_n(weku),
			.y(d3)
		);

	dmg_nand4 #(
			.L_y(1677.687)
		) refa_inst (
			.in1(semy),
			.in2(sapa),
			.in3(ffxx),
			.in4(cpu_wr),
			.y(ff0f_wr_n)
		);

	dmg_drlatch_ee #(
			.L_q(208.5158),
			.L_q_n(117.6719)
		) refe_inst (
			.d(d5),
			.ena(pupu),
			.ena_n(ryve),
			.r_n(lyc_stat_reset_n),
			.q(int_oam_en),
			.q_n(refe_n)
		);

	dmg_not_x2 #(
			.L_y(4750.704)
		) refo_inst (
			.in(sema),
			.y(refo)
		);

	dmg_muxi #(
			.L_y(261.3749)
		) refu_inst (
			.sel(tope),
			.d1(peto),
			.d0(d6),
			.y(refu)
		);

	dmg_tffnl #(
			.L_q(220.4686),
			.L_q_n(122.4533)
		) rega_inst (
			.d(puxy),
			.l(mexu),
			.tclk_n(sogu),
			.q(rega),
			.q_n(rega_n)
		);

	dmg_not_x2 #(
			.L_y(2314.125)
		) rege_inst (
			.in(sefa),
			.y(rege)
		);

	dmg_not_x1 #(
			.L_y(1373.282)
		) reho_inst (
			.in(ma12_n),
			.y(reho)
		);

	dmg_nand2 #(
			.L_y(93.23463)
		) rehu_inst (
			.in1(solo),
			.in2(sprite_on3),
			.y(rehu)
		);

	dmg_nor_latch #(
			.L_q(228.9688)
		) rejo_inst (
			.s(sary),
			.r(repu),
			.q(wy_latch),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) rejy_inst (
			.in(const0),
			.ena(leco),
			.y(d2)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) reka_inst (
			.in(const0),
			.ena(leco),
			.y(d4)
		);

	dmg_not_x2 #(
			.L_y(677.3438)
		) reku_inst (
			.in(samo),
			.y(reku)
		);

	dmg_or2 #(
			.L_y(68.5313)
		) rela_inst (
			.in1(revo),
			.in2(sazo),
			.y(rela)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) rema_inst (
			.in(dma_a10_n),
			.ena(pusy),
			.y(d2)
		);

	dmg_not_if1 #(
			.L_y(5594.862)
		) remo_inst (
			.in(md3_in_n),
			.ena(rena),
			.y(md3)
		);

	dmg_not_x2 #(
			.L_y(2478.548)
		) remy_inst (
			.in(pero),
			.y(remy)
		);

	dmg_not_x1 #(
			.L_y(1095.172)
		) rena_inst (
			.in(rela),
			.y(rena)
		);

	dmg_dffr #(
			.L_q(154.3284)
		) rene_inst (
			.d(ryfa),
			.clk(ppu_4mhz_n),
			.r_n(mode3),
			.q(rene),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(156.4533)
		) repa_inst (
			.in1(mulo),
			.in2(soce),
			.y(repa)
		);

	dmg_or2 #(
			.L_y(632.4534)
		) repu_inst (
			.in1(mode1),
			.in2(ppu_reset2),
			.y(repu)
		);

	dmg_nand2 #(
			.L_y(1056.923)
		) rera_inst (
			.in1(d3),
			.in2(lula),
			.y(rera)
		);

	dmg_not_x1 #(
			.L_y(62.68752)
		) rery_inst (
			.in(md0),
			.y(rery)
		);

	dmg_not_if0 #(
			.L_y(4098.063)
		) rese_inst (
			.in(a9),
			.ena_n(xedu),
			.y(ma9_n)
		);

	dmg_not_if1 #(
			.L_y(4098.063)
		) reso_inst (
			.in(bg_tile5),
			.ena(bp_cy),
			.y(ma9_n)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) resu_inst (
			.in(dma_a14_n),
			.ena(pusy),
			.y(d6)
		);

	dmg_nor2 #(
			.L_y(1039.656)
		) resy_inst (
			.in1(roru),
			.in2(d4),
			.y(resy)
		);

	dmg_not_if1 #(
			.L_y(5240.784)
		) reta_inst (
			.in(md6_in_n),
			.ena(rena),
			.y(md6)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) retu_inst (
			.in(syry_n),
			.ena_n(weku),
			.y(d0)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) reva_inst (
			.in(peto_n),
			.ena(tuby),
			.y(d6)
		);

	dmg_not_x1 #(
			.L_y(97.74995)
		) revo_inst (
			.in(ryje),
			.y(revo)
		);

	dmg_not_x2 #(
			.L_y(953.0624)
		) revu_inst (
			.in(sazu),
			.y(revu)
		);

	dmg_not_x1 #(
			.L_y(126.9686)
		) revy_inst (
			.in(bg_tile3),
			.y(revy)
		);

	dmg_dlatch_ee_q #(
			.L_q(364.9689)
		) rewo_inst (
			.d(sp_d0),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(rewo)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) rexu_inst (
			.in(roro),
			.ena(seby),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(1708.5)
		) roby_inst (
			.in(ruda),
			.y(sprite_on3)
		);

	dmg_not_if1 #(
			.L_y(5441.064)
		) roce_inst (
			.in(md4_in_n),
			.ena(rena),
			.y(md4)
		);

	dmg_not_x1 #(
			.L_y(120.0624)
		) roco_inst (
			.in(segu),
			.y(roco)
		);

	dmg_and2 #(
			.L_y(91.37511)
		) rocy_inst (
			.in1(sazo),
			.in2(revo),
			.y(rocy)
		);

	dmg_not_x2 #(
			.L_y(853.7186)
		) rodu_inst (
			.in(sybu),
			.y(rodu)
		);

	dmg_not_if1 #(
			.L_y(6606.36)
		) rody_inst (
			.in(md0_in_n),
			.ena(rena),
			.y(md0)
		);

	dmg_not_x2 #(
			.L_y(5219.798)
		) rofa_inst (
			.in(rena),
			.y(rofa)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) rofo_inst (
			.in(dma_a9_n),
			.ena(pusy),
			.y(d1)
		);

	dmg_dffr #(
			.L_q(193.9063),
			.L_q_n(282.6253)
		) roga_inst (
			.d(roga_n),
			.clk(ryku_n),
			.r_n(paso),
			.q(roga),
			.q_n(roga_n)
		);

	dmg_not_x1 #(
			.L_y(185.4063)
		) roge_inst (
			.in(pafu),
			.y(wy_match)
		);

	dmg_nor2 #(
			.L_y(1035.672)
		) rogy_inst (
			.in1(roru),
			.in2(d6),
			.y(rogy)
		);

	dmg_not_if1 #(
			.L_y(4338.984)
		) roha_inst (
			.in(bg_tile4),
			.ena(bp_cy),
			.y(ma8_n)
		);

	dmg_dlatch_ee_q #(
			.L_q(290.3285)
		) roka_inst (
			.d(sp_d1),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(roka)
		);

	dmg_muxi #(
			.L_y(88.45317)
		) roke_inst (
			.sel(tope),
			.d1(sabu),
			.d0(d0),
			.y(roke)
		);

	dmg_or2 #(
			.L_y(78.35939)
		) roko_inst (
			.in1(rahu),
			.in2(md2),
			.y(roko)
		);

	dmg_xor #(
			.L_y(194.7031)
		) roku_inst (
			.in1(h7),
			.in2(sury),
			.y(roku)
		);

	dmg_nand4 #(
			.L_y(1176.985)
		) rolo_inst (
			.in1(semy),
			.in2(sapa),
			.in3(ffxx),
			.in4(cpu_rd),
			.y(ff0f_rd_n)
		);

	dmg_nor2 #(
			.L_y(119.2652)
		) rolu_inst (
			.in1(mulo),
			.in2(sala),
			.y(rolu)
		);

	dmg_not_x1 #(
			.L_y(122.9845)
		) rome_inst (
			.in(d2_in_n),
			.y(rome)
		);

	dmg_not_x1 #(
			.L_y(144.7656)
		) romo_inst (
			.in(poky),
			.y(romo)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) romy_inst (
			.in(const0),
			.ena(leco),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(65.60931)
		) rona_inst (
			.in(md2),
			.y(rona)
		);

	dmg_nand4 #(
			.L_y(88.18749)
		) rone_inst (
			.in1(roxy),
			.in2(suha),
			.in3(syby),
			.in4(sozu),
			.y(rone)
		);

	dmg_not_x2 #(
			.L_y(4584.688)
		) ronu_inst (
			.in(rute),
			.y(ronu)
		);

	dmg_dlatch #(
			.L_q(52.06253)
		) rony_inst (
			.d(d1_in_n),
			.ena(lavo),
			.q(rony),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(31524.23)
		) ropa_inst (
			.in(ryba),
			.ena_n(lyra),
			.y(d7)
		);

	dmg_nand2 #(
			.L_y(380.3748)
		) rope_inst (
			.in1(soha),
			.in2(rycu),
			.y(rope)
		);

	dmg_dffr #(
			.L_q(398.7029)
		) ropo_inst (
			.d(paly),
			.clk(hclk),
			.r_n(lyc_stat_reset_n),
			.q(lyc_int),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(4442.845)
		) ropu_inst (
			.in(md5_in_n),
			.ena(rena),
			.y(md5)
		);

	dmg_not_x1 #(
			.L_y(116.875)
		) ropy_inst (
			.in(mode3),
			.y(ropy)
		);

	dmg_nand2 #(
			.L_y(191.5157)
		) rora_inst (
			.in1(sprite_palette),
			.in2(sprite_on4),
			.y(rora)
		);

	dmg_nor2 #(
			.L_y(1964.031)
		) rore_inst (
			.in1(t1t2_n),
			.in2(pamy),
			.y(rore)
		);

	dmg_not_x1 #(
			.L_y(62.42188)
		) roro_inst (
			.in(md5),
			.y(roro)
		);

	dmg_mux #(
			.L_y(6176.314)
		) roru_inst (
			.sel(t1t2_n),
			.d1(redu),
			.d0(moty),
			.y(roru)
		);

	dmg_nand2 #(
			.L_y(798.9999)
		) rory_inst (
			.in1(d4),
			.in2(lula),
			.y(rory)
		);

	dmg_dffsr #(
			.L_q(163.6252)
		) rosa_inst (
			.d(sata),
			.clk(clkpipe),
			.s_n(pamo),
			.r_n(pyzy),
			.q(rosa),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(4115.594)
		) rosu_inst (
			.in(sewo),
			.y(rosu)
		);

	dmg_not_x1 #(
			.L_y(118.4689)
		) rosy_inst (
			.in(ppu_reset_n),
			.y(rosy)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) rota_inst (
			.in(runa),
			.ena(seby),
			.y(d1)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) rote_inst (
			.in(samy_n),
			.ena(sora),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(1541.953)
		) rotu_inst (
			.in(ff0f_wr_n),
			.y(rotu)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) rova_inst (
			.in(pavy_n),
			.ena(pola),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(552.7654)
		) rove_inst (
			.in(rahu),
			.y(rove)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) rowe_inst (
			.in(const0),
			.ena(leco),
			.y(d5)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) rowu_inst (
			.in(peda_n),
			.ena(teda),
			.y(d6)
		);

	dmg_drlatch_ee #(
			.L_q(126.4375),
			.L_q_n(278.9062)
		) roxe_inst (
			.d(d3),
			.ena(pupu),
			.ena_n(ryve),
			.r_n(lyc_stat_reset_n),
			.q(int_hbl_en),
			.q_n(roxe_n)
		);

	dmg_not_x1 #(
			.L_y(605.3593)
		) roxo_inst (
			.in(segu),
			.y(roxo)
		);

	dmg_nand2 #(
			.L_y(1458.812)
		) roxu_inst (
			.in1(pamy),
			.in2(ext_addr_en_n),
			.y(roxu)
		);

	dmg_nor_latch #(
			.L_q(316.8905)
		) roxy_inst (
			.s(paha),
			.r(pova),
			.q(roxy),
			.q_n()
		);

	dmg_nand3 #(
			.L_y(149.5469)
		) roze_inst (
			.in1(rubu),
			.in2(roga),
			.in3(ryku),
			.y(roze)
		);

	dmg_not_x1 #(
			.L_y(968.2029)
		) rozo_inst (
			.in(puco),
			.y(latch_sp_bp_a)
		);

	dmg_not_x2 #(
			.L_y(565.5155)
		) rube_inst (
			.in(sako),
			.y(rube)
		);

	dmg_dffr #(
			.L_q(306.7968),
			.L_q_n(220.2032)
		) rubu_inst (
			.d(rubu_n),
			.clk(roga_n),
			.r_n(paso),
			.q(rubu),
			.q_n(rubu_n)
		);

	dmg_tffnl #(
			.L_q(64.81297),
			.L_q_n(54.45321)
		) ruby_inst (
			.d(rolu),
			.l(mexu),
			.tclk_n(rate),
			.q(ruby),
			.q_n(ruby_n)
		);

	dmg_nand2 #(
			.L_y(106.2501)
		) ruca_inst (
			.in1(sybo),
			.in2(sprite_on1),
			.y(ruca)
		);

	dmg_nand2 #(
			.L_y(186.7343)
		) ruce_inst (
			.in1(luxa),
			.in2(bg_tile2),
			.y(ruce)
		);

	dmg_not_x1 #(
			.L_y(113.422)
		) ruco_inst (
			.in(bg_tile1),
			.y(ruco)
		);

	dmg_or3 #(
			.L_y(311.5783)
		) ruda_inst (
			.in1(xefy),
			.in2(sprite_px_a3),
			.in3(sprite_px_b3),
			.y(ruda)
		);

	dmg_nand2 #(
			.L_y(267.7502)
		) rudu_inst (
			.in1(ryzy),
			.in2(sprite_on4),
			.y(rudu)
		);

	dmg_drlatch_ee #(
			.L_q(149.0154),
			.L_q_n(115.547)
		) rufo_inst (
			.d(d4),
			.ena(pupu),
			.ena_n(ryve),
			.r_n(lyc_stat_reset_n),
			.q(int_vbl_en),
			.q_n(rufo_n)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) ruga_inst (
			.in(rery),
			.ena(seby),
			.y(d0)
		);

	dmg_dffsr #(
			.L_q(126.7029)
		) rugo_inst (
			.d(const0),
			.clk(clkpipe),
			.s_n(pume),
			.r_n(suco),
			.q(rugo),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(136),
			.L_q_n(280.7653)
		) rugu_inst (
			.d(d6),
			.ena(pupu),
			.ena_n(ryve),
			.r_n(lyc_stat_reset_n),
			.q(lyc_int_en),
			.q_n(rugu_n)
		);

	dmg_nor2 #(
			.L_y(300.9532)
		) rugy_inst (
			.in1(mulo),
			.in2(syru),
			.y(rugy)
		);

	dmg_nand2 #(
			.L_y(1608.891)
		) ruja_inst (
			.in1(d1),
			.in2(lula),
			.y(ruja)
		);

	dmg_buf_if0 #(
			.L_y(4442.845)
		) rujo_inst (
			.in(d5),
			.ena_n(rahu),
			.y(md5)
		);

	dmg_or3 #(
			.L_y(319.8123)
		) ruju_inst (
			.in1(paho),
			.in2(h_reset),
			.in3(pome),
			.y(ruju)
		);

	dmg_not_x1 #(
			.L_y(1266.5)
		) ruky_inst (
			.in(ma10_n),
			.y(ruky)
		);

	dmg_nor2 #(
			.L_y(2637.127)
		) rulo_inst (
			.in1(tazy),
			.in2(t1t2_n),
			.y(rulo)
		);

	dmg_not_x2 #(
			.L_y(1628.813)
		) ruly_inst (
			.in(syma),
			.y(ruly)
		);

	dmg_not_x1 #(
			.L_y(2130.313)
		) ruma_inst (
			.in(ma11_n),
			.y(ruma)
		);

	dmg_not_if0 #(
			.L_y(3221.234)
		) rumo_inst (
			.in(a12),
			.ena_n(xedu),
			.y(ma12_n)
		);

	dmg_not_x2 #(
			.L_y(653.4376)
		) rumu_inst (
			.in(sejy),
			.y(rumu)
		);

	dmg_not_x1 #(
			.L_y(114.4845)
		) runa_inst (
			.in(md1),
			.y(runa)
		);

	dmg_nor2 #(
			.L_y(2089.142)
		) rune_inst (
			.in1(roru),
			.in2(d0),
			.y(rune)
		);

	dmg_not_x1 #(
			.L_y(42.50006)
		) runo_inst (
			.in(md3),
			.y(runo)
		);

	dmg_tie #(
			.L_gnd(27409.06),
			.L_vdd(851.5941)
		) runy_inst (
			.gnd(const0),
			.vdd(runy_const1)
		);

	dmg_dlatch #(
			.L_q(68.53125)
		) rupa_inst (
			.d(d6_in_n),
			.ena(lavo),
			.q(rupa),
			.q_n()
		);

	dmg_nor_latch #(
			.L_q_n(108.6406)
		) rupo_inst (
			.s(lyc_int),
			.r(pago),
			.q(),
			.q_n(rupo_n)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) rupy_inst (
			.in(rabo),
			.ena(seby),
			.y(d6)
		);

	dmg_not_x2 #(
			.L_y(2109.86)
		) rura_inst (
			.in(synu),
			.y(rura)
		);

	dmg_not_if1 #(
			.L_y(3991.015)
		) rusa_inst (
			.in(bg_tile3),
			.ena(bp_cy),
			.y(ma7_n)
		);

	dmg_not_if0 #(
			.L_y(5085.921)
		) ruse_inst (
			.in(a10),
			.ena_n(xedu),
			.y(ma10_n)
		);

	dmg_nand2 #(
			.L_y(215.4219)
		) rusy_inst (
			.in1(roka),
			.in2(sprite_on1),
			.y(rusy)
		);

	dmg_and2 #(
			.L_y(508.1411)
		) ruta_inst (
			.in1(tade),
			.in2(sprite_px_priority),
			.y(ruta)
		);

	dmg_or2 #(
			.L_y(48.60932)
		) rute_inst (
			.in1(tuto),
			.in2(racu),
			.y(rute)
		);

	dmg_nand2 #(
			.L_y(197.8906)
		) ruto_inst (
			.in1(luxa),
			.in2(bg_tile4),
			.y(ruto)
		);

	dmg_dffr #(
			.L_q(1668.657)
		) rutu_inst (
			.d(sanu),
			.clk(sono),
			.r_n(ppu_reset2_n),
			.q(vclk),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) ruvo_inst (
			.in(rony),
			.ena_n(lavo),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(87.39059)
		) ruvy_inst (
			.in(sale),
			.y(ruvy)
		);

	dmg_nand2 #(
			.L_y(1816.876)
		) ruxa_inst (
			.in1(d0),
			.in2(lula),
			.y(ruxa)
		);

	dmg_not_x3 #(
			.L_y(3526.44)
		) ruze_inst (
			.in(pofy),
			.y(ruze)
		);

	dmg_not_x1 #(
			.L_y(112.0937)
		) ruzy_inst (
			.in(d1_in_n),
			.y(ruzy)
		);

	dmg_not_x1 #(
			.L_y(121.1249)
		) ryba_inst (
			.in(d7_in_n),
			.y(ryba)
		);

	dmg_xor #(
			.L_y(131.2187)
		) rybo_inst (
			.in1(h1),
			.in2(h0),
			.y(rybo)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) rybu_inst (
			.in(rona),
			.ena(seby),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(237.2033)
		) ryca_inst (
			.in(t1t2_n),
			.y(ext_a15_en_n)
		);

	dmg_and2 #(
			.L_y(313.1719)
		) ryce_inst (
			.in1(suda_n),
			.in2(sobu),
			.y(ryce)
		);

	dmg_not_x1 #(
			.L_y(1454.031)
		) rycu_inst (
			.in(fexx_ffxx_n),
			.y(rycu)
		);

	dmg_nor2 #(
			.L_y(746.4062)
		) ryda_inst (
			.in1(roru),
			.in2(d7),
			.y(ryda)
		);

	dmg_not_if1 #(
			.L_y(5284.081)
		) rydo_inst (
			.in(md2_in_n),
			.ena(rena),
			.y(md2)
		);

	dmg_dlatch_ee_q #(
			.L_q(267.4843)
		) rydu_inst (
			.d(sp_d7),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(rydu)
		);

	dmg_nor3 #(
			.L_y(596.8593)
		) rydy_inst (
			.in1(puku),
			.in2(pory),
			.in3(ppu_reset2),
			.y(rydy)
		);

	dmg_dffr #(
			.L_q(319.8126),
			.L_q_n(176.9059)
		) ryfa_inst (
			.d(pany),
			.clk(segu),
			.r_n(mode3),
			.q(ryfa),
			.q_n(ryfa_n)
		);

	dmg_not_x1 #(
			.L_y(147.4218)
		) ryfe_inst (
			.in(sprite_palette),
			.y(ryfe)
		);

	dmg_and3 #(
			.L_y(1078.438)
		) ryfo_inst (
			.in1(a2),
			.in2(xx00_xx07),
			.in3(ffxx),
			.y(ff04_ff07)
		);

	dmg_and2 #(
			.L_y(593.6719)
		) ryfu_inst (
			.in1(rajy),
			.in2(sprite_px_priority),
			.y(ryfu)
		);

	dmg_not_x1 #(
			.L_y(112.8906)
		) ryga_inst (
			.in(bg_tile4),
			.y(ryga)
		);

	dmg_nand2 #(
			.L_y(255.5312)
		) ryja_inst (
			.in1(luxa),
			.in2(bg_tile3),
			.y(ryja)
		);

	dmg_not_x1 #(
			.L_y(45.15612)
		) ryje_inst (
			.in(sazo),
			.y(ryje)
		);

	dmg_not_x1 #(
			.L_y(322.9999)
		) ryju_inst (
			.in(sepa),
			.y(ryju)
		);

	dmg_nand2 #(
			.L_y(136)
		) ryjy_inst (
			.in1(soja),
			.in2(luxa),
			.y(ryjy)
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) ryke_inst (
			.in(const0),
			.ena(leco),
			.y(d6)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) ryko_inst (
			.in(raxy),
			.ena_n(lavo),
			.y(d2)
		);

	dmg_dffr #(
			.L_q(296.4376),
			.L_q_n(302.0155)
		) ryku_inst (
			.d(ryku_n),
			.clk(pecu),
			.r_n(paso),
			.q(ryku),
			.q_n(ryku_n)
		);

	dmg_not_x2 #(
			.L_y(1775.704)
		) ryky_inst (
			.in(sogo),
			.y(ryky)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) ryla_inst (
			.in(sopu_n),
			.ena(sora),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(122.453)
		) ryle_inst (
			.in(bg_tile5),
			.y(ryle)
		);

	dmg_nand2 #(
			.L_y(113.1563)
		) rylu_inst (
			.in1(sale),
			.in2(ropy),
			.y(rylu)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) ryma_inst (
			.in(soma),
			.ena_n(lavo),
			.y(d0)
		);

	dmg_xor #(
			.L_y(122.7185)
		) ryme_inst (
			.in1(v0),
			.in2(syry),
			.y(ryme)
		);

	dmg_not_if0 #(
			.L_y(3384.063)
		) ryna_inst (
			.in(a11),
			.ena_n(xedu),
			.y(ma11_n)
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) ryne_inst (
			.in(const0),
			.ena(leco),
			.y(d1)
		);

	dmg_or2 #(
			.L_y(621.0318)
		) ryno_inst (
			.in1(sygu),
			.in2(vclk),
			.y(ryno)
		);

	dmg_not_x3 #(
			.L_y(5024.298)
		) rypo_inst (
			.in(semu),
			.y(rypo)
		);

	dmg_nor2 #(
			.L_y(1841.58)
		) rypu_inst (
			.in1(roru),
			.in2(d1),
			.y(rypu)
		);

	dmg_not_x2 #(
			.L_y(1160.516)
		) ryro_inst (
			.in(sumo),
			.y(ryro)
		);

	dmg_dffsr #(
			.L_q(150.0784)
		) rysa_inst (
			.d(sady),
			.clk(clkpipe),
			.s_n(ryja),
			.r_n(sebo),
			.q(rysa),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(80.75043)
		) ryso_inst (
			.in(subu),
			.y(ryso)
		);

	dmg_not_if0 #(
			.L_y(4338.984)
		) rysu_inst (
			.in(a8),
			.ena_n(xedu),
			.y(ma8_n)
		);

	dmg_not_x2 #(
			.L_y(487.1565)
		) ryty_inst (
			.in(sedo),
			.y(ryty)
		);

	dmg_not_x1 #(
			.L_y(332.2969)
		) ryve_inst (
			.in(sepa),
			.y(ryve)
		);

	dmg_nand2 #(
			.L_y(558.3448)
		) ryvo_inst (
			.in1(d5),
			.in2(lula),
			.y(ryvo)
		);

	dmg_not_x2 #(
			.L_y(616.7813)
		) ryze_inst (
			.in(suke),
			.y(ryze)
		);

	dmg_not_x1 #(
			.L_y(28.68775)
		) ryzy_inst (
			.in(sprite_palette),
			.y(ryzy)
		);

	dmg_pad_out #(
		) s_inst (
			.o_n(mure),
			.pad(s_pad)
		);

	dmg_nand2 #(
			.L_y(192.0468)
		) sabe_inst (
			.in1(clk4),
			.in2(tame),
			.y(sabe)
		);

	dmg_dffr #(
			.L_q_n(371.0784)
		) sabo_inst (
			.d(d2),
			.clk(sara),
			.r_n(reset2_n),
			.q(),
			.q_n(sabo_n)
		);

	dmg_dffr #(
			.L_q(162.8279),
			.L_q_n(169.9998)
		) sabu_inst (
			.d(d0),
			.clk(tyju),
			.r_n(reset2_n),
			.q(sabu),
			.q_n(sabu_n)
		);

	dmg_or2 #(
			.L_y(11709.55)
		) sacu_inst (
			.in1(segu),
			.in2(roxy),
			.y(clkpipe)
		);

	dmg_nor2 #(
			.L_y(114.4842)
		) sadu_inst (
			.in1(mode3),
			.in2(mode1),
			.y(sadu)
		);

	dmg_dffsr #(
			.L_q(289.2656)
		) sady_inst (
			.d(taca),
			.clk(clkpipe),
			.s_n(ruce),
			.r_n(sure),
			.q(sady),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) safo_inst (
			.in(sago),
			.ena_n(lavo),
			.y(d5)
		);

	dmg_dlatch #(
			.L_q(92.43749)
		) sago_inst (
			.d(d5_in_n),
			.ena(lavo),
			.q(sago),
			.q_n()
		);

	dmg_dlatch_ee_q #(
			.L_q(479.9845)
		) saja_inst (
			.d(sp_d4),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(saja)
		);

	dmg_buf_if0 #(
			.L_y(33777.41)
		) sajo_inst (
			.in(ratu),
			.ena_n(lyra),
			.y(d5)
		);

	dmg_xor #(
			.L_y(114.75)
		) sake_inst (
			.in1(h5),
			.in2(h4),
			.y(sake)
		);

	dmg_or2 #(
			.L_y(73.04688)
		) sako_inst (
			.in1(rahu),
			.in2(md4),
			.y(sako)
		);

	dmg_nor2 #(
			.L_y(83.40633)
		) saky_inst (
			.in1(tuly),
			.in2(vonu),
			.y(saky)
		);

	dmg_muxi #(
			.L_y(62.953)
		) sala_inst (
			.sel(tope),
			.d1(tyru),
			.d0(d4),
			.y(sala)
		);

	dmg_mux #(
			.L_y(135.469)
		) sale_inst (
			.sel(tuto),
			.d1(tavy),
			.d0(tegu),
			.y(sale)
		);

	dmg_drlatch_ee #(
			.L_q(162.5622),
			.L_q_n(176.3752)
		) salo_inst (
			.d(d3),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(salo),
			.q_n(salo_n)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) salu_inst (
			.in(tyva_n),
			.ena(tuby),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(96.95317)
		) same_inst (
			.in(md7),
			.y(same)
		);

	dmg_and2 #(
			.L_y(154.8594)
		) samo_inst (
			.in1(md6),
			.in2(rove),
			.y(samo)
		);

	dmg_dffr #(
			.L_q(181.9533),
			.L_q_n(94.56223)
		) samy_inst (
			.d(d1),
			.clk(sara),
			.r_n(reset2_n),
			.q(samy),
			.q_n(samy_n)
		);

	dmg_not_x1 #(
			.L_y(96.95306)
		) sana_inst (
			.in(md4),
			.y(sana)
		);

	dmg_and3 #(
			.L_y(1008.579)
		) sano_inst (
			.in1(sefy),
			.in2(xx00_xx07),
			.in3(ffxx),
			.y(ff00_ff03)
		);

	dmg_and4 #(
			.L_y(439.6093)
		) sanu_inst (
			.in1(lcd_x6),
			.in2(lcd_x5),
			.in3(lcd_x4),
			.in4(lcd_x0),
			.y(sanu)
		);

	dmg_and4 #(
			.L_y(96.68748)
		) sapa_inst (
			.in1(a0),
			.in2(a1),
			.in3(a2),
			.in4(a3),
			.y(sapa)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) sapu_inst (
			.in(seta_n),
			.ena(tuby),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(118.203)
		) sapy_inst (
			.in(tofe),
			.y(sapy)
		);

	dmg_nand4 #(
			.L_y(302.8123)
		) sara_inst (
			.in1(a0),
			.in2(a1),
			.in3(cpu_wr),
			.in4(ff04_ff07),
			.y(sara)
		);

	dmg_nor5 #(
			.L_y(246.7654)
		) sare_inst (
			.in1(a7),
			.in2(a6),
			.in3(a5),
			.in4(a4),
			.in5(a3),
			.y(xx00_xx07)
		);

	dmg_not_x2 #(
			.L_y(3093.735)
		) saro_inst (
			.in(rope),
			.y(fexx)
		);

	dmg_dffr #(
			.L_q(576.4064)
		) sary_inst (
			.d(wy_match),
			.clk(hclk),
			.r_n(ppu_reset_n),
			.q(sary),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) sasy_inst (
			.in(refe_n),
			.ena_n(vave),
			.y(d5)
		);

	dmg_dffsr #(
			.L_q(204.5315)
		) sata_inst (
			.d(rugo),
			.clk(clkpipe),
			.s_n(soro),
			.r_n(tafa),
			.q(sata),
			.q_n()
		);

	dmg_or2 #(
			.L_y(318.4846)
		) sato_inst (
			.in1(d0),
			.in2(tepu),
			.y(sato)
		);

	dmg_dffr #(
			.L_q(2281.719)
		) savy_inst (
			.d(rybo),
			.clk(clkpipe),
			.r_n(h_reset_n),
			.q(h1),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(31397.37)
		) sawa_inst (
			.in(ryso),
			.ena(tagy),
			.y(d6)
		);

	dmg_or2 #(
			.L_y(78.09396)
		) sawu_inst (
			.in1(rahu),
			.in2(md7),
			.y(sawu)
		);

	dmg_dffr #(
			.L_q(761.5469),
			.L_q_n(200.281)
		) saxo_inst (
			.d(saxo_n),
			.clk(hclk),
			.r_n(mude),
			.q(lcd_x0),
			.q_n(saxo_n)
		);

	dmg_not_x1 #(
			.L_y(135.2031)
		) saza_inst (
			.in(d3_in_n),
			.y(saza)
		);

	dmg_and2 #(
			.L_y(231.0938)
		) sazo_inst (
			.in1(sere),
			.in2(ruvy),
			.y(sazo)
		);

	dmg_and2 #(
			.L_y(250.4846)
		) sazu_inst (
			.in1(md5),
			.in2(rove),
			.y(sazu)
		);

	dmg_dlatch #(
			.L_q(124.0468)
		) sazy_inst (
			.d(d7_in_n),
			.ena(lavo),
			.q(sazy),
			.q_n()
		);

	dmg_pad_bidir_pu_latch #(
			.L_i_n(5778.408)
		) sck_inst (
			.pdrv_n(kexu),
			.ndrv(kujo),
			.ena_n_pu(sck_dir),
			.i_n(sck_n),
			.pad(sck_pad)
		);

	dmg_dffr #(
			.L_q(110.2347)
		) seba_inst (
			.d(vonu),
			.clk(clk4),
			.r_n(mode3),
			.q(seba),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(227.1095)
		) sebo_inst (
			.in1(revy),
			.in2(luxa),
			.y(sebo)
		);

	dmg_not_x1 #(
			.L_y(710.0158)
		) seby_inst (
			.in(tyvy),
			.y(seby)
		);

	dmg_nor3 #(
			.L_y(1033.813)
		) seca_inst (
			.in1(ryce),
			.in2(rosy),
			.in3(atej),
			.y(seca)
		);

	dmg_or2 #(
			.L_y(163.6249)
		) sedo_inst (
			.in1(rahu),
			.in2(md6),
			.y(sedo)
		);

	dmg_buf_if0 #(
			.L_y(38893.62)
		) sedu_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d2)
		);

	dmg_drlatch_ee #(
			.L_q(121.9217),
			.L_q_n(176.3749)
		) sedy_inst (
			.d(d2),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(sedy),
			.q_n(sedy_n)
		);

	dmg_and2 #(
			.L_y(318.7499)
		) sefa_inst (
			.in1(md0),
			.in2(rove),
			.y(sefa)
		);

	dmg_and2 #(
			.L_y(68.5314)
		) sefu_inst (
			.in1(md2),
			.in2(rove),
			.y(sefu)
		);

	dmg_not_x1 #(
			.L_y(83.40582)
		) sefy_inst (
			.in(a2),
			.y(sefy)
		);

	dmg_dlatch_ee_q #(
			.L_q(443.8596)
		) sega_inst (
			.d(sp_d7),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(sega)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) sego_inst (
			.in(rupo_n),
			.ena(tobe),
			.y(d2)
		);

	dmg_not_x4 #(
			.L_y(746.9376)
		) segu_inst (
			.in(tyfa),
			.y(segu)
		);

	dmg_nand2 #(
			.L_y(119.0002)
		) seja_inst (
			.in1(tosa),
			.in2(luxa),
			.y(seja)
		);

	dmg_or2 #(
			.L_y(213.8282)
		) sejy_inst (
			.in1(rahu),
			.in2(md5),
			.y(sejy)
		);

	dmg_buf_if0 #(
			.L_y(5441.064)
		) seke_inst (
			.in(d4),
			.ena_n(rahu),
			.y(md4)
		);

	dmg_nor2 #(
			.L_y(109.7031)
		) seko_inst (
			.in1(ryfa_n),
			.in2(rene),
			.y(seko)
		);

	dmg_not_x2 #(
			.L_y(1768.797)
		) sela_inst (
			.in(vclk_n),
			.y(vclk2)
		);

	dmg_dlatch_ee_q #(
			.L_q(420.2184)
		) sele_inst (
			.d(sp_d4),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(sele)
		);

	dmg_dlatch #(
			.L_q(82.07813)
		) selo_inst (
			.d(d3_in_n),
			.ena(lavo),
			.q(selo),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(78.89046)
		) selu_inst (
			.in(rydu),
			.y(selu)
		);

	dmg_and2 #(
			.L_y(72.7811)
		) sema_inst (
			.in1(racu),
			.in2(raco),
			.y(sema)
		);

	dmg_or2 #(
			.L_y(105.1875)
		) seme_inst (
			.in1(d4),
			.in2(ff0f_wr_n),
			.y(seme)
		);

	dmg_dlatch_ee_q #(
			.L_q(133.344)
		) semo_inst (
			.d(sp_d6),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(semo)
		);

	dmg_or2 #(
			.L_y(126.9688)
		) semu_inst (
			.in1(toba),
			.in2(pova),
			.y(semu)
		);

	dmg_nor4 #(
			.L_y(178.2344)
		) semy_inst (
			.in1(a7),
			.in2(a6),
			.in3(a5),
			.in4(a4),
			.y(semy)
		);

	dmg_nand2 #(
			.L_y(83.93759)
		) seno_inst (
			.in1(ruco),
			.in2(luxa),
			.y(seno)
		);

	dmg_and2 #(
			.L_y(189.6564)
		) sepa_inst (
			.in1(ppu_wr),
			.in2(ff41),
			.y(sepa)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) sepu_inst (
			.in(rave),
			.ena(tagy),
			.y(d5)
		);

	dmg_nand2 #(
			.L_y(261.1095)
		) sepy_inst (
			.in1(cpu_ext_cs_en),
			.in2(soby),
			.y(sepy)
		);

	dmg_not_x1 #(
			.L_y(2486.252)
		) sera_inst (
			.in(d2_in_n),
			.y(sera)
		);

	dmg_and2 #(
			.L_y(415.9686)
		) sere_inst (
			.in1(tole),
			.in2(ropy),
			.y(sere)
		);

	dmg_not_x1 #(
			.L_y(87.92201)
		) sery_inst (
			.in(rama),
			.y(sery)
		);

	dmg_dffr #(
			.L_q(108.906),
			.L_q_n(112.8906)
		) seta_inst (
			.d(d7),
			.clk(tyju),
			.r_n(reset2_n),
			.q(seta),
			.q_n(seta_n)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) sete_inst (
			.in(sabu_n),
			.ena(tuby),
			.y(d0)
		);

	dmg_dffsr #(
			.L_q(254.4686)
		) setu_inst (
			.d(sobo),
			.clk(clkpipe),
			.s_n(raja),
			.r_n(sywe),
			.q(setu),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) sevu_inst (
			.in(rupa),
			.ena_n(lavo),
			.y(d6)
		);

	dmg_or2 #(
			.L_y(82.60924)
		) sewo_inst (
			.in1(tuto),
			.in2(sutu),
			.y(sewo)
		);

	dmg_nor2 #(
			.L_y(1157.065)
		) seze_inst (
			.in1(roru),
			.in2(d3),
			.y(seze)
		);

	dmg_not_if1 #(
			.L_y(4179.61)
		) sezu_inst (
			.in(bg_tile1),
			.ena(bp_cy),
			.y(ma5_n)
		);

	dmg_pad_bidir_pu #(
			.L_i_n(5299.22)
		) sin_inst (
			.pdrv_n(kore),
			.ndrv(kywe),
			.ena_n_pu(ff60_d0),
			.i_n(sin_n),
			.pad(sin_pad)
		);

	dmg_pad_pass #(
		) so1_inst (
			.a(so1),
			.pad(so1_pad)
		);

	dmg_pad_pass #(
		) so2_inst (
			.a(so2),
			.pad(so2_pad)
		);

	dmg_not_x1 #(
			.L_y(1059.046)
		) soba_inst (
			.in(rajy),
			.y(soba)
		);

	dmg_dffsr #(
			.L_q(513.9846)
		) sobo_inst (
			.d(rysa),
			.clk(clkpipe),
			.s_n(ruto),
			.r_n(suca),
			.q(sobo),
			.q_n()
		);

	dmg_dffr #(
			.L_q(278.3749)
		) sobu_inst (
			.d(teky),
			.clk(clk5),
			.r_n(vypo_const1),
			.q(sobu),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(55.78121)
		) soby_inst (
			.in1(a15),
			.in2(boot_sel),
			.y(soby)
		);

	dmg_not_x1 #(
			.L_y(262.7031)
		) soca_inst (
			.in(d6_in_n),
			.y(soca)
		);

	dmg_muxi #(
			.L_y(177.7031)
		) soce_inst (
			.sel(tope),
			.d1(tyva),
			.d0(d3),
			.y(soce)
		);

	dmg_not_x1 #(
			.L_y(105.7187)
		) socy_inst (
			.in(tomu),
			.y(socy)
		);

	dmg_dlatch #(
			.L_q(123.7813)
		) sody_inst (
			.d(d4_in_n),
			.ena(lavo),
			.q(sody),
			.q_n()
		);

	dmg_or2 #(
			.L_y(77.56261)
		) sofy_inst (
			.in1(tuto),
			.in2(sohy),
			.y(sofy)
		);

	dmg_and2 #(
			.L_y(90.57813)
		) sogo_inst (
			.in1(md1),
			.in2(rove),
			.y(sogo)
		);

	dmg_nor2 #(
			.L_y(455.5463)
		) sogu_inst (
			.in1(tecy),
			.in2(sabo_n),
			.y(sogu)
		);

	dmg_not_x1 #(
			.L_y(73.84372)
		) sogy_inst (
			.in(a14),
			.y(sogy)
		);

	dmg_not_x1 #(
			.L_y(108.9062)
		) soha_inst (
			.in(ffxx),
			.y(soha)
		);

	dmg_and2 #(
			.L_y(113.4221)
		) soho_inst (
			.in1(tacu),
			.in2(sp_bp_cys),
			.y(soho)
		);

	dmg_dffsr #(
			.L_q(514.5156)
		) sohu_inst (
			.d(ralu),
			.clk(clkpipe),
			.s_n(raga),
			.r_n(ryjy),
			.q(bg_px_b),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(211.9686)
		) sohy_inst (
			.in1(tyjy),
			.in2(sere),
			.y(sohy)
		);

	dmg_not_x1 #(
			.L_y(148.7502)
		) soja_inst (
			.in(bg_tile7),
			.y(soja)
		);

	dmg_not_x1 #(
			.L_y(1051.61)
		) soka_inst (
			.in(tory),
			.y(sprite_on6)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) soku_inst (
			.in(rega_n),
			.ena(teda),
			.y(d0)
		);

	dmg_not_x2 #(
			.L_y(4286.922)
		) soky_inst (
			.in(tode),
			.y(soky)
		);

	dmg_dffr #(
			.L_q(94.29696),
			.L_q_n(216.4844)
		) sola_inst (
			.d(sola_n),
			.clk(teru_n),
			.r_n(reset_div_n),
			.q(sola),
			.q_n(sola_n)
		);

	dmg_not_x2 #(
			.L_y(871.2501)
		) sole_inst (
			.in(tuso),
			.y(sole)
		);

	dmg_not_x1 #(
			.L_y(144.7657)
		) solo_inst (
			.in(ramu),
			.y(solo)
		);

	dmg_nand2 #(
			.L_y(330.1716)
		) soly_inst (
			.in1(luxa),
			.in2(bg_tile1),
			.y(soly)
		);

	dmg_dlatch #(
			.L_q(67.73435)
		) soma_inst (
			.d(d0_in_n),
			.ena(lavo),
			.q(soma),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) somu_inst (
			.in(ruby_n),
			.ena(teda),
			.y(d4)
		);

	dmg_dffsr #(
			.L_q(462.7187)
		) somy_inst (
			.d(rosa),
			.clk(clkpipe),
			.s_n(suky),
			.r_n(towa),
			.q(somy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(227.3749)
		) sono_inst (
			.in(hclk),
			.y(sono)
		);

	dmg_dffr #(
			.L_q(360.9843),
			.L_q_n(237.4686)
		) sopu_inst (
			.d(d0),
			.clk(sara),
			.r_n(reset2_n),
			.q(sopu),
			.q_n(sopu_n)
		);

	dmg_and4 #(
			.L_y(469.8909)
		) sora_inst (
			.in1(ff04_ff07),
			.in2(cpu_rd),
			.in3(a1),
			.in4(a0),
			.y(sora)
		);

	dmg_not_x1 #(
			.L_y(78.62498)
		) sore_inst (
			.in(a15),
			.y(sore)
		);

	dmg_nand2 #(
			.L_y(174.5157)
		) soro_inst (
			.in1(sprite_palette),
			.in2(sprite_on1),
			.y(soro)
		);

	dmg_buf_if0 #(
			.L_y(35163.97)
		) sosa_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d1)
		);

	dmg_and2 #(
			.L_y(233.2188)
		) sose_inst (
			.in1(a15),
			.in2(tefa),
			.y(sose)
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) sosy_inst (
			.in(rate_n),
			.ena(teda),
			.y(d3)
		);

	dmg_drlatch_ee #(
			.L_q(133.0782),
			.L_q_n(195.2342)
		) sota_inst (
			.d(d4),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(sota),
			.q_n(sota_n)
		);

	dmg_buf_if0 #(
			.L_y(5594.862)
		) sote_inst (
			.in(d3),
			.ena_n(rahu),
			.y(md3)
		);

	dmg_dffr #(
			.L_q_n(158.5783)
		) soto_inst (
			.d(soto_n),
			.clk(sycy),
			.r_n(ppu_hard_reset_n),
			.q(),
			.q_n(soto_n)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) sotu_inst (
			.in(sufy_n),
			.ena(tuby),
			.y(d5)
		);

	dmg_pad_out #(
		) sout_inst (
			.o_n(kena),
			.pad(sout_pad)
		);

	dmg_nor4 #(
			.L_y(121.9216)
		) sovu_inst (
			.in1(syfu),
			.in2(tery),
			.in3(tucy),
			.in4(tyku),
			.y(sovu)
		);

	dmg_dffr #(
			.L_q(179.0312)
		) sovy_inst (
			.d(rydy),
			.clk(ppu_4mhz_n),
			.r_n(ppu_reset_n),
			.q(sovy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(77.82823)
		) sowo_inst (
			.in(taka),
			.y(sowo)
		);

	dmg_xnor #(
			.L_y(185.9376)
		) sozu_inst (
			.in1(ff43_d2),
			.in2(rubu),
			.y(sozu)
		);

	dmg_pad_out #(
		) st_inst (
			.o_n(ruze),
			.pad(st_pad)
		);

	dmg_nor4 #(
			.L_y(149.5468)
		) subo_inst (
			.in1(rasy),
			.in2(reda),
			.in3(tyde),
			.in4(ryme),
			.y(subo)
		);

	dmg_dffr #(
			.L_q(117.1403),
			.L_q_n(639.6251)
		) subu_inst (
			.d(subu_n),
			.clk(sola_n),
			.r_n(reset_div_n),
			.q(subu),
			.q_n(subu_n)
		);

	dmg_nand2 #(
			.L_y(194.9691)
		) suca_inst (
			.in1(ryga),
			.in2(luxa),
			.y(suca)
		);

	dmg_nand2 #(
			.L_y(176.3747)
		) suco_inst (
			.in1(sypy),
			.in2(sprite_on0),
			.y(suco)
		);

	dmg_dffr #(
			.L_q_n(141.0466)
		) suda_inst (
			.d(sobu),
			.clk(clk4),
			.r_n(vypo_const1),
			.q(),
			.q_n(suda_n)
		);

	dmg_dffr #(
			.L_q(251.8124),
			.L_q_n(312.6409)
		) sude_inst (
			.d(sude_n),
			.clk(telu_n),
			.r_n(mude),
			.q(lcd_x4),
			.q_n(sude_n)
		);

	dmg_not_x1 #(
			.L_y(92.96886)
		) sudo_inst (
			.in(mwr_in_n),
			.y(sudo)
		);

	dmg_dffr #(
			.L_q(289.7973),
			.L_q_n(100.4062)
		) sufy_inst (
			.d(d5),
			.clk(tyju),
			.r_n(reset2_n),
			.q(sufy),
			.q_n(sufy_n)
		);

	dmg_buf_if0 #(
			.L_y(38893.62)
		) sugu_inst (
			.in(rome),
			.ena_n(lyra),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(2351.313)
		) sugy_inst (
			.in(d5_in_n),
			.y(sugy)
		);

	dmg_xnor #(
			.L_y(168.1406)
		) suha_inst (
			.in1(ff43_d0),
			.in2(ryku),
			.y(suha)
		);

	dmg_and2 #(
			.L_y(86.59361)
		) suke_inst (
			.in1(md7),
			.in2(rove),
			.y(suke)
		);

	dmg_ao2222 #(
			.L_y(931.8125)
		) suko_inst (
			.in1(lyc_int_en),
			.in2(lyc_int),
			.in3(int_oam_en),
			.in4(int_oam),
			.in5(int_vbl_en),
			.in6(mode1),
			.in7(int_hbl_en),
			.in8(mode0),
			.y(suko)
		);

	dmg_nand2 #(
			.L_y(153)
		) suky_inst (
			.in1(sprite_palette),
			.in2(sprite_on3),
			.y(suky)
		);

	dmg_or2 #(
			.L_y(112.8904)
		) sulo_inst (
			.in1(d3),
			.in2(ff0f_wr_n),
			.y(sulo)
		);

	dmg_not_x1 #(
			.L_y(87.12486)
		) sulu_inst (
			.in(semo),
			.y(sulu)
		);

	dmg_nor2 #(
			.L_y(1354.422)
		) suly_inst (
			.in1(roru),
			.in2(d2),
			.y(suly)
		);

	dmg_and2 #(
			.L_y(411.1875)
		) sumo_inst (
			.in1(md4),
			.in2(rove),
			.y(sumo)
		);

	dmg_and2 #(
			.L_y(82.60929)
		) suna_inst (
			.in1(md3),
			.in2(rove),
			.y(suna)
		);

	dmg_dlatch_ee_q #(
			.L_q(448.1091)
		) suny_inst (
			.d(sp_d5),
			.ena(latch_sp_bp_b),
			.ena_n(xado),
			.q(suny)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) supe_inst (
			.in(sabo_n),
			.ena(sora),
			.y(d2)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) supo_inst (
			.in(tyru_n),
			.ena(tuby),
			.y(d4)
		);

	dmg_tie #(
			.L_gnd(235053.1),
			.L_vdd(227846.5)
		) supply_inst (
			.gnd(gnd),
			.vdd(vdd)
		);

	dmg_nand2 #(
			.L_y(131.4841)
		) supu_inst (
			.in1(rapu),
			.in2(luxa),
			.y(supu)
		);

	dmg_not_x1 #(
			.L_y(865.1415)
		) sura_inst (
			.in(a10_in_n),
			.y(sura)
		);

	dmg_nand2 #(
			.L_y(151.9375)
		) sure_inst (
			.in1(tyce),
			.in2(luxa),
			.y(sure)
		);

	dmg_not_if1 #(
			.L_y(33777.41)
		) suro_inst (
			.in(rage_n),
			.ena(teda),
			.y(d5)
		);

	dmg_and2 #(
			.L_y(139.9844)
		) sury_inst (
			.in1(tyba),
			.in2(h6),
			.y(sury)
		);

	dmg_not_x1 #(
			.L_y(1259.594)
		) suse_inst (
			.in(xado),
			.y(latch_sp_bp_b)
		);

	dmg_dlatch_ee_q #(
			.L_q(411.4532)
		) suto_inst (
			.d(sp_d5),
			.ena(latch_sp_bp_a),
			.ena_n(puco),
			.q(suto)
		);

	dmg_nor4 #(
			.L_y(162.0313)
		) sutu_inst (
			.in1(tm_bp_cys),
			.in2(vram_to_oam),
			.in3(sp_bp_cys),
			.in4(sere),
			.y(sutu)
		);

	dmg_not_if1 #(
			.L_y(5085.921)
		) suvo_inst (
			.in(bg_tile6),
			.ena(bp_cy),
			.y(ma10_n)
		);

	dmg_nand4 #(
			.L_y(146.6247)
		) suvu_inst (
			.in1(mode3),
			.in2(romo),
			.in3(nyka),
			.in4(pory),
			.y(suvu)
		);

	dmg_buf_if0 #(
			.L_y(5019.783)
		) suza_inst (
			.in(d7),
			.ena_n(rahu),
			.y(md7)
		);

	dmg_nand2 #(
			.L_y(2249.845)
		) suze_inst (
			.in1(tazy),
			.in2(ext_a15_en_n),
			.y(suze)
		);

	dmg_not_x2 #(
			.L_y(154.8595)
		) suzu_inst (
			.in(tuxy),
			.y(suzu)
		);

	dmg_dffr #(
			.L_q(2675.11)
		) sybe_inst (
			.d(roku),
			.clk(toca),
			.r_n(h_reset_n),
			.q(h7),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(112.8908)
		) sybo_inst (
			.in(roka),
			.y(sybo)
		);

	dmg_or2 #(
			.L_y(73.57829)
		) sybu_inst (
			.in1(rahu),
			.in2(md3),
			.y(sybu)
		);

	dmg_xnor #(
			.L_y(135.4687)
		) syby_inst (
			.in1(ff43_d1),
			.in2(roga),
			.y(syby)
		);

	dmg_nor3 #(
			.L_y(422.6096)
		) sycu_inst (
			.in1(tytu),
			.in2(tepa),
			.in3(tyfo),
			.y(sycu)
		);

	dmg_not_x1 #(
			.L_y(75.70303)
		) sycy_inst (
			.in(t1t2_n),
			.y(sycy)
		);

	dmg_xor #(
			.L_y(109.9688)
		) syfu_inst (
			.in1(v7),
			.in2(raha),
			.y(syfu)
		);

	dmg_dffr #(
			.L_q(122.7184)
		) sygu_inst (
			.d(tegy),
			.clk(sono),
			.r_n(ppu_reset2_n),
			.q(sygu),
			.q_n()
		);

	dmg_nor2 #(
			.L_y(9851.238)
		) syke_inst (
			.in1(tona),
			.in2(fexx_ffxx_n),
			.y(ffxx)
		);

	dmg_not_x1 #(
			.L_y(145.0313)
		) sylo_inst (
			.in(rydy),
			.y(sylo)
		);

	dmg_or2 #(
			.L_y(104.6561)
		) syma_inst (
			.in1(rahu),
			.in2(md1),
			.y(syma)
		);

	dmg_or2 #(
			.L_y(313.7033)
		) synu_inst (
			.in1(rahu),
			.in2(md0),
			.y(synu)
		);

	dmg_not_x1 #(
			.L_y(1922.328)
		) syny_inst (
			.in(repu),
			.y(syny)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) sypu_inst (
			.in(tepu_n),
			.ena(texe),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(40.90627)
		) sypy_inst (
			.in(sprite_palette),
			.y(sypy)
		);

	dmg_not_x1 #(
			.L_y(3869.576)
		) syro_inst (
			.in(fexx_ffxx_n),
			.y(fexx_ffxx)
		);

	dmg_muxi #(
			.L_y(72.78119)
		) syru_inst (
			.sel(tope),
			.d1(sufy),
			.d0(d5),
			.y(syru)
		);

	dmg_drlatch_ee #(
			.L_q(235.6093),
			.L_q_n(194.9688)
		) syry_inst (
			.d(d0),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(syry),
			.q_n(syry_n)
		);

	dmg_not_x1 #(
			.L_y(2464.469)
		) sysa_inst (
			.in(d4_in_n),
			.y(sysa)
		);

	dmg_not_x2 #(
			.L_y(5304.533)
		) sysy_inst (
			.in(taxy),
			.y(sysy)
		);

	dmg_buf_if0 #(
			.L_y(35163.97)
		) sywa_inst (
			.in(ruzy),
			.ena_n(lyra),
			.y(d1)
		);

	dmg_nand2 #(
			.L_y(137.8595)
		) sywe_inst (
			.in1(ryle),
			.in2(luxa),
			.y(sywe)
		);

	dmg_not_x1 #(
			.L_y(2774.72)
		) syzo_inst (
			.in(d7_in_n),
			.y(syzo)
		);

	dmg_buf_if0 #(
			.L_y(6073.253)
		) syzu_inst (
			.in(raza),
			.ena_n(ext_a15_en_n),
			.y(a15)
		);

	dmg_pad_in #(
			.L_i_n(5453.019)
		) t1_inst (
			.i_n(t1_n),
			.pad(t1_pad)
		);

	dmg_pad_in #(
			.L_i_n(5913.877)
		) t2_inst (
			.i_n(t2_n),
			.pad(t2_pad)
		);

	dmg_or3 #(
			.L_y(4444.442)
		) taba_inst (
			.in1(t1t2_n),
			.in2(t1_nt2),
			.in3(unut),
			.y(osc_stable)
		);

	dmg_nor2 #(
		) tabu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
			.L_y(98.28117)
		) taby_inst (
			.in1(sery),
			.in2(sprite_on6),
			.y(taby)
		);

	dmg_dffsr #(
			.L_q(364.4377)
		) taca_inst (
			.d(tomy),
			.clk(clkpipe),
			.s_n(soly),
			.r_n(seno),
			.q(taca),
			.q_n()
		);

	dmg_and4 #(
			.L_y(3549.016)
		) tace_inst (
			.in1(ch1_amp_en_n),
			.in2(ch2_amp_en_n),
			.in3(ch3_amp_en_n),
			.in4(ch4_amp_en_n),
			.y(amp_en_n)
		);

	dmg_nand2 #(
			.L_y(2114.641)
		) tacu_inst (
			.in1(tytu),
			.in2(tyfo),
			.y(tacu)
		);

	dmg_and2 #(
			.L_y(1560.281)
		) tade_inst (
			.in1(bg_px_b),
			.in2(ff40_d0),
			.y(tade)
		);

	dmg_nor2 #(
			.L_y(2385.578)
		) tady_inst (
			.in1(atej),
			.in2(h_reset),
			.y(h_reset_n)
		);

	dmg_nand2 #(
			.L_y(178.2343)
		) tafa_inst (
			.in1(totu),
			.in2(sprite_on1),
			.y(tafa)
		);

	dmg_nand2 #(
		) tafo_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(65.07794)
		) tafu_inst (
			.in(sprite_priority),
			.y(tafu)
		);

	dmg_not_x1 #(
			.L_y(358.3283)
		) tafy_inst (
			.in(lcd_x5),
			.y(tafy)
		);

	dmg_not_x2 #(
			.L_y(1769.063)
		) tago_inst (
			.in(vode),
			.y(tago)
		);

	dmg_and4 #(
			.L_y(1206.204)
		) tagy_inst (
			.in1(ff04_ff07),
			.in2(cpu_rd),
			.in3(tola),
			.in4(tovy),
			.y(tagy)
		);

	dmg_dffr #(
			.L_q(426.8593),
			.L_q_n(335.7501)
		) taha_inst (
			.d(taha_n),
			.clk(sude_n),
			.r_n(mude),
			.q(lcd_x5),
			.q_n(taha_n)
		);

	dmg_buf_if0 #(
			.L_y(33882.07)
		) tahy_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(77.29677)
		) tajo_inst (
			.in(sprite_priority),
			.y(tajo)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) taju_inst (
			.in(sazy),
			.ena_n(lavo),
			.y(d7)
		);

	dmg_nand2 #(
		) tajy_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand_latch #(
			.L_q(92.43759)
		) taka_inst (
			.s_n(seca),
			.r_n(veku),
			.q(taka),
			.q_n()
		);

	dmg_dffr #(
			.L_q(2826.516)
		) tako_inst (
			.d(tyge),
			.clk(toca),
			.r_n(h_reset_n),
			.q(h6),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) taku_inst (
			.in(\4096hz ),
			.ena(tagy),
			.y(d1)
		);

	dmg_not_x4 #(
			.L_y(1165.828)
		) talu_inst (
			.in(vena_n),
			.y(hclk)
		);

	dmg_dffr #(
			.L_q(176.3752),
			.L_q_n(738.9691)
		) tama_inst (
			.d(tama_n),
			.clk(unyk_n),
			.r_n(reset_div_n),
			.q(tama),
			.q_n(tama_n)
		);

	dmg_nand2 #(
			.L_y(78.89055)
		) tame_inst (
			.in1(tese),
			.in2(toxe),
			.y(tame)
		);

	dmg_nor2 #(
			.L_y(561.5321)
		) tamu_inst (
			.in1(roru),
			.in2(d5),
			.y(tamu)
		);

	dmg_not_x1 #(
		) tane_inst (
			.in(vdd),
			.y()
		);

	dmg_and2 #(
			.L_y(73.84372)
		) tapa_inst (
			.in1(tolu),
			.in2(vclk2),
			.y(int_oam)
		);

	dmg_and4 #(
			.L_y(130.6873)
		) tape_inst (
			.in1(ff04_ff07),
			.in2(cpu_wr),
			.in3(tola),
			.in4(tovy),
			.y(tape)
		);

	dmg_nand2 #(
			.L_y(210.1095)
		) tapo_inst (
			.in1(rama),
			.in2(sprite_on6),
			.y(tapo)
		);

	dmg_not_x3 #(
			.L_y(8158.145)
		) tapu_inst (
			.in(ubal),
			.y(cpu_wr)
		);

	dmg_and2 #(
			.L_y(936.5934)
		) taru_inst (
			.in1(stop_mode3),
			.in2(tolu),
			.y(mode0)
		);

	dmg_not_x1 #(
		) tasu_inst (
			.in(vdd),
			.y()
		);

	dmg_dffr #(
			.L_q(149.0154),
			.L_q_n(322.2029)
		) tate_inst (
			.d(tate_n),
			.clk(tozo_n),
			.r_n(syny),
			.q(tate),
			.q_n(tate_n)
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) tatu_inst (
			.in(udor),
			.ena(tagy),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(339.7343)
		) tava_inst (
			.in(clk4),
			.y(clk5)
		);

	dmg_not_x1 #(
			.L_y(175.8434)
		) tave_inst (
			.in(suvu),
			.y(tave)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) tavo_inst (
			.in(selo),
			.ena_n(lavo),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(205.8594)
		) tavy_inst (
			.in(mrd_in_n),
			.y(tavy)
		);

	dmg_buf_if0 #(
			.L_y(33977.16)
		) tawo_inst (
			.in(saza),
			.ena_n(lyra),
			.y(d3)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) tawu_inst (
			.in(\8192hz ),
			.ena(tagy),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(153),
			.L_q_n(346.1096)
		) taxa_inst (
			.d(taxa_n),
			.clk(tufu_n),
			.r_n(syny),
			.q(taxa),
			.q_n(taxa_n)
		);

	dmg_buf_if0 #(
			.L_y(33977.16)
		) taxo_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d3)
		);

	dmg_and2 #(
			.L_y(101.2032)
		) taxy_inst (
			.in1(sohy),
			.in2(raco),
			.y(taxy)
		);

	dmg_buf_if0 #(
			.L_y(31397.37)
		) tazu_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d6)
		);

	dmg_mux #(
			.L_y(436.4218)
		) tazy_inst (
			.sel(dma_addr_ext),
			.d1(dma_a15),
			.d0(sepy),
			.y(tazy)
		);

	dmg_nand7 #(
			.L_y(94.03117)
		) tebo_inst (
			.in1(lcd_x6),
			.in2(tafy),
			.in3(lcd_x4),
			.in4(vate),
			.in5(vuty),
			.in6(lcd_x1),
			.in7(lcd_x0),
			.y(tebo)
		);

	dmg_not_if1 #(
			.L_y(36878.58)
		) teby_inst (
			.in(sadu),
			.ena(tobe),
			.y(d0)
		);

	dmg_nor2 #(
		) teca_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand7 #(
			.L_y(90.04686)
		) tece_inst (
			.in1(tuju),
			.in2(lcd_x5),
			.in3(tuda),
			.in4(lcd_x3),
			.in5(lcd_x2),
			.in6(vepe),
			.in7(lcd_x0),
			.y(tece)
		);

	dmg_nand2 #(
		) teco_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_muxi #(
			.L_y(96.15633)
		) tecy_inst (
			.sel(samy),
			.d1(ukap),
			.d0(teko),
			.y(tecy)
		);

	dmg_and4 #(
			.L_y(1190.796)
		) teda_inst (
			.in1(ff04_ff07),
			.in2(cpu_rd),
			.in3(tola),
			.in4(a0),
			.y(teda)
		);

	dmg_nand2 #(
			.L_y(298.2968)
		) tede_inst (
			.in1(sprite_priority),
			.in2(sprite_on0),
			.y(tede)
		);

	dmg_not_x3 #(
			.L_y(9374.175)
		) tedo_inst (
			.in(ujyv),
			.y(cpu_rd)
		);

	dmg_nor2 #(
			.L_y(165.2187)
		) tefa_inst (
			.in1(fexx_ffxx),
			.in2(non_vram_mreq),
			.y(tefa)
		);

	dmg_not_x1 #(
			.L_y(192.0468)
		) tefy_inst (
			.in(mcs_in_n),
			.y(tefy)
		);

	dmg_not_x2 #(
			.L_y(704.7032)
		) tego_inst (
			.in(vama),
			.y(ff49)
		);

	dmg_nand2 #(
			.L_y(623.6882)
		) tegu_inst (
			.in1(sose),
			.in2(write),
			.y(tegu)
		);

	dmg_nand4 #(
			.L_y(382.5003)
		) tegy_inst (
			.in1(voku),
			.in2(tozu),
			.in3(tece),
			.in4(tebo),
			.y(tegy)
		);

	dmg_not_x1 #(
			.L_y(237.4687)
		) tehe_inst (
			.in(d4_in_n),
			.y(tehe)
		);

	dmg_nor2 #(
		) teho_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
		) teja_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_dffr #(
			.L_q(343.7192),
			.L_q_n(205.594)
		) teka_inst (
			.d(teka_n),
			.clk(subu_n),
			.r_n(reset_div_n),
			.q(teka),
			.q_n(teka_n)
		);

	dmg_dffr #(
			.L_q(98.54685),
			.L_q_n(137.5938)
		) teke_inst (
			.d(teke_n),
			.clk(tate_n),
			.r_n(syny),
			.q(teke),
			.q_n(teke_n)
		);

	dmg_muxi #(
			.L_y(201.6095)
		) teko_inst (
			.sel(sopu),
			.d1(\262144hz ),
			.d0(\4096hz ),
			.y(teko)
		);

	dmg_and4 #(
			.L_y(90.8437)
		) teky_inst (
			.in1(sprite_x_match),
			.in2(tuku),
			.in3(lyry),
			.in4(sowo),
			.y(teky)
		);

	dmg_dffr #(
			.L_q(251.0155),
			.L_q_n(146.6247)
		) telu_inst (
			.d(telu_n),
			.clk(vyzo_n),
			.r_n(mude),
			.q(lcd_x3),
			.q_n(telu_n)
		);

	dmg_buf_if0 #(
			.L_y(6606.36)
		) teme_inst (
			.in(d0),
			.ena_n(rahu),
			.y(md0)
		);

	dmg_not_if1 #(
			.L_y(38893.62)
		) temu_inst (
			.in(utok),
			.ena(tagy),
			.y(d2)
		);

	dmg_buf_if0 #(
			.L_y(31397.37)
		) temy_inst (
			.in(soca),
			.ena_n(lyra),
			.y(d6)
		);

	dmg_nand2 #(
			.L_y(444.3906)
		) tena_inst (
			.in1(tafu),
			.in2(sprite_on6),
			.y(tena)
		);

	dmg_not_x1 #(
			.L_y(2011.048)
		) tenu_inst (
			.in(d3_in_n),
			.y(tenu)
		);

	dmg_not_x1 #(
			.L_y(465.9065)
		) tepa_inst (
			.in(mode3),
			.y(tepa)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) tepe_inst (
			.in(sody),
			.ena_n(lavo),
			.y(d4)
		);

	dmg_not_x1 #(
			.L_y(1283.5)
		) tepo_inst (
			.in(vely),
			.y(tepo)
		);

	dmg_dffr #(
			.L_q(500.4376),
			.L_q_n(255.2664)
		) tepu_inst (
			.d(sato),
			.clk(tuge),
			.r_n(reset2_n),
			.q(tepu),
			.q_n(tepu_n)
		);

	dmg_not_x1 #(
			.L_y(1415.781)
		) tepy_inst (
			.in(vuso),
			.y(tepy)
		);

	dmg_not_x1 #(
			.L_y(271.7345)
		) tera_inst (
			.in(tepu),
			.y(tera)
		);

	dmg_dffr #(
			.L_q(311.0471),
			.L_q_n(516.3752)
		) tero_inst (
			.d(tero_n),
			.clk(uner_n),
			.r_n(reset_div_n),
			.q(tero),
			.q_n(tero_n)
		);

	dmg_dffr #(
			.L_q(548.7816),
			.L_q_n(274.6559)
		) teru_inst (
			.d(teru_n),
			.clk(tofe_n),
			.r_n(reset_div_n),
			.q(teru),
			.q_n(teru_n)
		);

	dmg_xor #(
			.L_y(87.12497)
		) tery_inst (
			.in1(v6),
			.in2(vevo),
			.y(tery)
		);

	dmg_dffr #(
			.L_q(388.875),
			.L_q_n(125.9062)
		) tese_inst (
			.d(tese_n),
			.clk(tuly_n),
			.r_n(seca),
			.q(tese),
			.q_n(tese_n)
		);

	dmg_nand2 #(
			.L_y(242.2499)
		) teso_inst (
			.in1(rydu),
			.in2(sprite_on7),
			.y(teso)
		);

	dmg_buf_if0 #(
			.L_y(33777.41)
		) tesu_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d5)
		);

	dmg_not_x1 #(
		) tesy_inst (
			.in(vdd),
			.y()
		);

	dmg_nand2 #(
		) tete_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_or3 #(
			.L_y(1165.829)
		) tevo_inst (
			.in1(seko),
			.in2(suzu),
			.in3(tave),
			.y(tevo)
		);

	dmg_or3 #(
			.L_y(192.3124)
		) tevy_inst (
			.in1(a13),
			.in2(a14),
			.in3(sore),
			.y(tevy)
		);

	dmg_buf_if0 #(
			.L_y(31524.23)
		) tewa_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d7)
		);

	dmg_buf_if0 #(
			.L_y(4801.705)
		) tewu_inst (
			.in(d1),
			.ena_n(rahu),
			.y(md1)
		);

	dmg_and4 #(
			.L_y(101.2031)
		) texe_inst (
			.in1(cpu_rd),
			.in2(ffxx),
			.in3(tufa),
			.in4(tyro),
			.y(texe)
		);

	dmg_and2 #(
			.L_y(3988.361)
		) texo_inst (
			.in1(mreq),
			.in2(tevy),
			.y(non_vram_mreq)
		);

	dmg_not_x2 #(
			.L_y(4437.532)
		) texy_inst (
			.in(tyso),
			.y(sp_bp_cys)
		);

	dmg_and2 #(
			.L_y(73.31245)
		) toba_inst (
			.in1(px9),
			.in2(clkpipe),
			.y(toba)
		);

	dmg_and2 #(
			.L_y(476.7973)
		) tobe_inst (
			.in1(ppu_rd),
			.in2(ff41),
			.y(tobe)
		);

	dmg_not_if1 #(
			.L_y(3384.063)
		) tobo_inst (
			.in(bg_tile7),
			.ena(bp_cy),
			.y(ma11_n)
		);

	dmg_dffr #(
			.L_q(129.6249)
		) tobu_inst (
			.d(tuly),
			.clk(clk5),
			.r_n(mode3),
			.q(tobu),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(491.6718)
		) toca_inst (
			.in(h3),
			.y(toca)
		);

	dmg_not_x1 #(
			.L_y(193.906)
		) tocu_inst (
			.in(lcd_x0),
			.y(tocu)
		);

	dmg_and2 #(
			.L_y(96.68748)
		) tode_inst (
			.in1(sutu),
			.in2(raco),
			.y(tode)
		);

	dmg_buf_if0 #(
			.L_y(5240.784)
		) tofa_inst (
			.in(d6),
			.ena_n(rahu),
			.y(md6)
		);

	dmg_dffr #(
			.L_q(222.8589),
			.L_q_n(282.0932)
		) tofe_inst (
			.d(tofe_n),
			.clk(tugo_n),
			.r_n(reset_div_n),
			.q(tofe),
			.q_n(tofe_n)
		);

	dmg_not_x1 #(
			.L_y(1228.781)
		) tofu_inst (
			.in(ppu_reset_n),
			.y(h_reset)
		);

	dmg_nand3 #(
			.L_y(217.5467)
		) toga_inst (
			.in1(rotu),
			.in2(lamo),
			.in3(d4),
			.y(toga)
		);

	dmg_nand2 #(
		) togu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
		) tohu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nor2 #(
		) toko_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_if1 #(
			.L_y(31524.23)
		) toku_inst (
			.in(same),
			.ena(seby),
			.y(d7)
		);

	dmg_not_x1 #(
			.L_y(415.1728)
		) tola_inst (
			.in(a1),
			.y(tola)
		);

	dmg_mux #(
			.L_y(137.3281)
		) tole_inst (
			.sel(tuto),
			.d1(tefy),
			.d0(tuca),
			.y(tole)
		);

	dmg_nor2 #(
		) tolo_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(2001.484)
		) tolu_inst (
			.in(mode1),
			.y(tolu)
		);

	dmg_nor2 #(
		) toly_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand3 #(
			.L_y(291.1254)
		) tome_inst (
			.in1(rotu),
			.in2(lufe),
			.in3(d3),
			.y(tome)
		);

	dmg_not_x1 #(
			.L_y(305.7345)
		) tomu_inst (
			.in(sylo),
			.y(tomu)
		);

	dmg_dffsr #(
			.L_q(351.4218)
		) tomy_inst (
			.d(const0),
			.clk(clkpipe),
			.s_n(tuxe),
			.r_n(seja),
			.q(tomy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(74.1094)
		) tona_inst (
			.in(a8),
			.y(tona)
		);

	dmg_nor2 #(
		) tonu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nor2 #(
		) tony_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
		) topa_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand4 #(
			.L_y(1513.531)
		) tope_inst (
			.in1(a0),
			.in2(tola),
			.in3(cpu_wr),
			.in4(ff04_ff07),
			.y(tope)
		);

	dmg_and2 #(
			.L_y(825.2971)
		) topu_inst (
			.in1(tuly),
			.in2(sycu),
			.y(topu)
		);

	dmg_or3 #(
			.L_y(141.5781)
		) tory_inst (
			.in1(xefy),
			.in2(sprite_px_a6),
			.in3(sprite_px_b6),
			.y(tory)
		);

	dmg_not_x1 #(
			.L_y(95.62486)
		) tosa_inst (
			.in(bg_tile0),
			.y(tosa)
		);

	dmg_nand2 #(
		) tosu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(258.9846)
		) totu_inst (
			.in(sprite_palette),
			.y(totu)
		);

	dmg_not_x1 #(
			.L_y(10487.68)
		) tova_inst (
			.in(t1t2_n),
			.y(ext_addr_en_n)
		);

	dmg_not_x1 #(
			.L_y(850.2659)
		) tovo_inst (
			.in(d0_in_n),
			.y(tovo)
		);

	dmg_buf_if0 #(
			.L_y(36878.58)
		) tovu_inst (
			.in(runy_const1),
			.ena_n(sole),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(326.7188)
		) tovy_inst (
			.in(a0),
			.y(tovy)
		);

	dmg_nand2 #(
			.L_y(86.5937)
		) towa_inst (
			.in1(vage),
			.in2(sprite_on3),
			.y(towa)
		);

	dmg_nor2 #(
		) towu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_dffr #(
			.L_q(821.8437),
			.L_q_n(214.8907)
		) toxe_inst (
			.d(toxe_n),
			.clk(sabe),
			.r_n(seca),
			.q(toxe),
			.q_n(toxe_n)
		);

	dmg_and3 #(
			.L_y(306.5314)
		) toza_inst (
			.in1(tynu),
			.in2(cpu_ext_cs_en),
			.in3(fexx_ffxx_n),
			.y(toza)
		);

	dmg_dffr #(
			.L_q(103.3282),
			.L_q_n(310.2498)
		) tozo_inst (
			.d(tozo_n),
			.clk(taxa_n),
			.r_n(syny),
			.q(tozo),
			.q_n(tozo_n)
		);

	dmg_nand7 #(
			.L_y(136.0002)
		) tozu_inst (
			.in1(tuju),
			.in2(tafy),
			.in3(tuda),
			.in4(vate),
			.in5(lcd_x2),
			.in6(lcd_x1),
			.in7(lcd_x0),
			.y(tozu)
		);

	dmg_not_x1 #(
			.L_y(1963.235)
		) tube_inst (
			.in(d6_in_n),
			.y(tube)
		);

	dmg_nor_latch #(
			.L_q_n(89.78148)
		) tubo_inst (
			.s(clk_ena),
			.r(upyf),
			.q(),
			.q_n(tubo_n)
		);

	dmg_and4 #(
			.L_y(1469.969)
		) tuby_inst (
			.in1(ff04_ff07),
			.in2(cpu_rd),
			.in3(a1),
			.in4(tovy),
			.y(tuby)
		);

	dmg_and2 #(
			.L_y(531.2501)
		) tuca_inst (
			.in1(sose),
			.in2(cpu_ext_cs_en),
			.y(tuca)
		);

	dmg_xor #(
			.L_y(82.87518)
		) tucy_inst (
			.in1(v5),
			.in2(vafa),
			.y(tucy)
		);

	dmg_not_x1 #(
			.L_y(249.1563)
		) tuda_inst (
			.in(lcd_x4),
			.y(tuda)
		);

	dmg_and2 #(
			.L_y(223.6563)
		) tufa_inst (
			.in1(a4),
			.in2(a6),
			.y(tufa)
		);

	dmg_nand2 #(
			.L_y(189.3905)
		) tufo_inst (
			.in1(tajo),
			.in2(sprite_on2),
			.y(tufo)
		);

	dmg_dffr #(
			.L_q(130.156),
			.L_q_n(303.0778)
		) tufu_inst (
			.d(tufu_n),
			.clk(vymu_n),
			.r_n(syny),
			.q(tufu),
			.q_n(tufu_n)
		);

	dmg_nand4 #(
			.L_y(156.1876)
		) tuge_inst (
			.in1(tyro),
			.in2(tufa),
			.in3(ffxx),
			.in4(cpu_wr),
			.y(tuge)
		);

	dmg_dffr #(
			.L_q(90.04666),
			.L_q_n(358.859)
		) tugo_inst (
			.d(tugo_n),
			.clk(tulu_n),
			.r_n(reset_div_n),
			.q(tugo),
			.q_n(tugo_n)
		);

	dmg_nor2 #(
		) tugy_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
		) tuhe_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_dffr #(
			.L_q(2640.844),
			.L_q_n(195.7655)
		) tuhu_inst (
			.d(tuhu_n),
			.clk(toca),
			.r_n(h_reset_n),
			.q(h4),
			.q_n(tuhu_n)
		);

	dmg_and2 #(
			.L_y(534.4382)
		) tuja_inst (
			.in1(sose),
			.in2(cpu_wr_sync),
			.y(tuja)
		);

	dmg_not_x1 #(
			.L_y(260.8436)
		) tuju_inst (
			.in(lcd_x6),
			.y(tuju)
		);

	dmg_not_x2 #(
			.L_y(1979.437)
		) tujy_inst (
			.in(vova),
			.y(tujy)
		);

	dmg_not_x1 #(
			.L_y(120.0624)
		) tuku_inst (
			.in(tomu),
			.y(tuku)
		);

	dmg_dffr #(
			.L_q(2253.032)
		) tuky_inst (
			.d(sake),
			.clk(toca),
			.r_n(h_reset_n),
			.q(h5),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(157.5158)
		) tula_inst (
			.in1(selu),
			.in2(sprite_on7),
			.y(tula)
		);

	dmg_nor8 #(
			.L_y(235.0781)
		) tulo_inst (
			.in1(a15),
			.in2(a14),
			.in3(a13),
			.in4(a12),
			.in5(a11),
			.in6(a10),
			.in7(a9),
			.in8(a8),
			.y(tulo)
		);

	dmg_dffr #(
			.L_q(135.9997),
			.L_q_n(143.4373)
		) tulu_inst (
			.d(tulu_n),
			.clk(ugot_n),
			.r_n(reset_div_n),
			.q(tulu),
			.q_n(tulu_n)
		);

	dmg_dffr #(
			.L_q(1264.375),
			.L_q_n(249.6871)
		) tuly_inst (
			.d(tuly_n),
			.clk(toxe_n),
			.r_n(seca),
			.q(tuly),
			.q_n(tuly_n)
		);

	dmg_and3 #(
			.L_y(201.0782)
		) tuma_inst (
			.in1(a13),
			.in2(sogy),
			.in3(a15),
			.y(tuma)
		);

	dmg_nand2 #(
		) tume_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nor2 #(
		) tumy_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand7 #(
			.L_y(847.3447)
		) tuna_inst (
			.in1(a15),
			.in2(a14),
			.in3(a13),
			.in4(a12),
			.in5(a11),
			.in6(a10),
			.in7(a9),
			.y(fexx_ffxx_n)
		);

	dmg_not_x1 #(
			.L_y(3653.142)
		) tune_inst (
			.in(d1_in_n),
			.y(tune)
		);

	dmg_and3 #(
			.L_y(70.65655)
		) tuny_inst (
			.in1(sulo),
			.in2(lufe),
			.in3(reset2_n),
			.y(tuny)
		);

	dmg_nand2 #(
			.L_y(162.2968)
		) tupe_inst (
			.in1(sulu),
			.in2(sprite_on6),
			.y(tupe)
		);

	dmg_nor2 #(
		) tury_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_if1 #(
			.L_y(33977.16)
		) tuse_inst (
			.in(sapy),
			.ena(tagy),
			.y(d3)
		);

	dmg_nor2 #(
			.L_y(119.2656)
		) tuso_inst (
			.in1(t1t2_n),
			.in2(exec_phase),
			.y(tuso)
		);

	dmg_buf_if0 #(
			.L_y(33882.07)
		) tute_inst (
			.in(tehe),
			.ena_n(lyra),
			.y(d4)
		);

	dmg_and2 #(
			.L_y(744.2813)
		) tuto_inst (
			.in1(t1t2_n),
			.in2(soto_n),
			.y(tuto)
		);

	dmg_and2 #(
			.L_y(6693.649)
		) tutu_inst (
			.in1(tera),
			.in2(tulo),
			.y(boot_sel)
		);

	dmg_buf_if0 #(
			.L_y(36878.58)
		) tuty_inst (
			.in(tovo),
			.ena_n(lyra),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(1033.547)
		) tuva_inst (
			.in(suko),
			.y(tuva)
		);

	dmg_nor2 #(
		) tuve_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nor3 #(
			.L_y(966.6096)
		) tuvo_inst (
			.in1(tepa),
			.in2(tuly),
			.in3(tese),
			.y(tuvo)
		);

	dmg_nand2 #(
			.L_y(525.1409)
		) tuwu_inst (
			.in1(sprite_priority),
			.in2(sprite_on7),
			.y(tuwu)
		);

	dmg_nand2 #(
			.L_y(188.5937)
		) tuxa_inst (
			.in1(semo),
			.in2(sprite_on6),
			.y(tuxa)
		);

	dmg_nand2 #(
			.L_y(250.4841)
		) tuxe_inst (
			.in1(luxa),
			.in2(bg_tile0),
			.y(tuxe)
		);

	dmg_nand2 #(
			.L_y(178.5001)
		) tuxy_inst (
			.in1(sovy),
			.in2(sylo),
			.y(tuxy)
		);

	dmg_and2 #(
			.L_y(264.8281)
		) tyba_inst (
			.in1(h4),
			.in2(h5),
			.y(tyba)
		);

	dmg_not_x1 #(
			.L_y(101.4689)
		) tyce_inst (
			.in(bg_tile2),
			.y(tyce)
		);

	dmg_not_x1 #(
			.L_y(1694.156)
		) tyco_inst (
			.in(vysa),
			.y(sprite_on5)
		);

	dmg_xor #(
			.L_y(123.7813)
		) tyde_inst (
			.in1(v1),
			.in2(vuce),
			.y(tyde)
		);

	dmg_and3 #(
			.L_y(145.8282)
		) tyfa_inst (
			.in1(socy),
			.in2(poky),
			.in3(vybo),
			.y(tyfa)
		);

	dmg_dffr #(
			.L_q(268.2814),
			.L_q_n(803.7812)
		) tyfo_inst (
			.d(toxe),
			.clk(clk4),
			.r_n(vypo_const1),
			.q(tyfo),
			.q_n(tyfo_n)
		);

	dmg_nand2 #(
			.L_y(192.3127)
		) tyga_inst (
			.in1(sele),
			.in2(sprite_on4),
			.y(tyga)
		);

	dmg_xor #(
			.L_y(183.0158)
		) tyge_inst (
			.in1(h6),
			.in2(tyba),
			.y(tyge)
		);

	dmg_buf_if0 #(
			.L_y(5284.081)
		) tygo_inst (
			.in(d2),
			.ena_n(rahu),
			.y(md2)
		);

	dmg_not_x1 #(
			.L_y(3551.141)
		) tygu_inst (
			.in(amp_en_n),
			.y(amp_en)
		);

	dmg_mux #(
			.L_y(6901.474)
		) tyho_inst (
			.sel(dma_addr_ext),
			.d1(dma_a15),
			.d0(toza),
			.y(tyho)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) tyja_inst (
			.in(sana),
			.ena(seby),
			.y(d4)
		);

	dmg_nand4 #(
			.L_y(1457.22)
		) tyju_inst (
			.in1(tovy),
			.in2(a1),
			.in3(cpu_wr),
			.in4(ff04_ff07),
			.y(tyju)
		);

	dmg_mux #(
			.L_y(92.17191)
		) tyjy_inst (
			.sel(tuto),
			.d1(sudo),
			.d0(tuja),
			.y(tyjy)
		);

	dmg_nor2 #(
		) tyke_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
			.L_y(425.7972)
		) tyko_inst (
			.in1(sprite_priority),
			.in2(sprite_on6),
			.y(tyko)
		);

	dmg_xor #(
			.L_y(123.5156)
		) tyku_inst (
			.in1(v4),
			.in2(sota),
			.y(tyku)
		);

	dmg_and3 #(
			.L_y(298.5628)
		) tyme_inst (
			.in1(seme),
			.in2(lamo),
			.in3(reset2_n),
			.y(tyme)
		);

	dmg_nor2 #(
			.L_y(107.3123)
		) tymu_inst (
			.in1(dma_addr_ext),
			.in2(moty),
			.y(tymu)
		);

	dmg_nor2 #(
		) tyne_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand3 #(
			.L_y(116.8749)
		) tyno_inst (
			.in1(toxe),
			.in2(seba),
			.in3(vonu),
			.y(tyno)
		);

	dmg_ao21 #(
			.L_y(112.625)
		) tynu_inst (
			.in1(a15),
			.in2(a14),
			.in3(tuma),
			.y(tynu)
		);

	dmg_dffr #(
			.L_q(669.3753),
			.L_q_n(412.2501)
		) typo_inst (
			.d(typo_n),
			.clk(saxo_n),
			.r_n(mude),
			.q(lcd_x1),
			.q_n(typo_n)
		);

	dmg_nor2 #(
		) typy_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_nand2 #(
			.L_y(201.8752)
		) tyra_inst (
			.in1(sprite_priority),
			.in2(sprite_on2),
			.y(tyra)
		);

	dmg_nor6 #(
			.L_y(296.4377)
		) tyro_inst (
			.in1(a7),
			.in2(a5),
			.in3(a3),
			.in4(a2),
			.in5(a1),
			.in6(a0),
			.y(tyro)
		);

	dmg_dffr #(
			.L_q(141.578),
			.L_q_n(77.82834)
		) tyru_inst (
			.d(d4),
			.clk(tyju),
			.r_n(reset2_n),
			.q(tyru),
			.q_n(tyru_n)
		);

	dmg_dffr #(
			.L_q(586.2345),
			.L_q_n(195.5002)
		) tyry_inst (
			.d(tyry_n),
			.clk(taha_n),
			.r_n(mude),
			.q(lcd_x6),
			.q_n(tyry_n)
		);

	dmg_or2 #(
			.L_y(1492.282)
		) tyso_inst (
			.in1(saky),
			.in2(tepa),
			.y(tyso)
		);

	dmg_not_x1 #(
			.L_y(1385.234)
		) tyta_inst (
			.in(voto),
			.y(sprite_on4)
		);

	dmg_not_x1 #(
			.L_y(118.7345)
		) tytu_inst (
			.in(toxe),
			.y(tytu)
		);

	dmg_dffr #(
			.L_q(141.3121),
			.L_q_n(105.7186)
		) tyva_inst (
			.d(d3),
			.clk(tyju),
			.r_n(reset2_n),
			.q(tyva),
			.q_n(tyva_n)
		);

	dmg_nand2 #(
			.L_y(151.4061)
		) tyvy_inst (
			.in1(sere),
			.in2(cpu_vram_oam_rd),
			.y(tyvy)
		);

	dmg_nand2 #(
		) tywu_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_not_x1 #(
		) tyxu_inst (
			.in(vdd),
			.y()
		);

	dmg_muxi #(
			.L_y(94.56243)
		) ubal_inst (
			.sel(t1t2_n),
			.d1(wr_in_n),
			.d0(cpu_wr_sync),
			.y(ubal)
		);

	dmg_not_x1 #(
			.L_y(211.7034)
		) ubet_inst (
			.in(t1_n),
			.y(ubet)
		);

	dmg_not_x1 #(
			.L_y(190.1876)
		) ubot_inst (
			.in(ufor),
			.y(\262144hz )
		);

	dmg_dffsr #(
			.L_q(1786.328)
		) ubul_inst (
			.d(pesu_const1),
			.clk(int_serial),
			.s_n(tome),
			.r_n(tuny),
			.q(cpu_irq3),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(58.7027)
		) ucob_inst (
			.in(osc_ena),
			.y(ucob)
		);

	dmg_and4 #(
			.L_y(1594.018)
		) ucom_inst (
			.in1(ff00_ff03),
			.in2(cpu_rd),
			.in3(a1),
			.in4(tovy),
			.y(ucom)
		);

	dmg_not_x1 #(
			.L_y(113.1559)
		) udor_inst (
			.in(teka),
			.y(udor)
		);

	dmg_and4 #(
			.L_y(2872.472)
		) ufeg_inst (
			.in1(ff00_ff03),
			.in2(cpu_rd),
			.in3(tola),
			.in4(a0),
			.y(ufeg)
		);

	dmg_nor3 #(
			.L_y(2893.72)
		) ufol_inst (
			.in1(ucob),
			.in2(reset),
			.in3(tape),
			.y(reset_div_n)
		);

	dmg_dffr #(
			.L_q(179.5628),
			.L_q_n(802.1879)
		) ufor_inst (
			.d(ufor_n),
			.clk(ukup_n),
			.r_n(reset_div_n),
			.q(ufor),
			.q_n(ufor_n)
		);

	dmg_nand2 #(
			.L_y(4613.377)
		) ugac_inst (
			.in1(tymu),
			.in2(ext_addr_en_n),
			.y(ugac)
		);

	dmg_dffr #(
			.L_q(173.9843),
			.L_q_n(369.2184)
		) ugot_inst (
			.d(ugot_n),
			.clk(ulur),
			.r_n(reset_div_n),
			.q(ugot),
			.q_n(ugot_n)
		);

	dmg_muxi #(
			.L_y(76.76561)
		) ujyv_inst (
			.sel(t1t2_n),
			.d1(rd_in_n),
			.d0(read),
			.y(ujyv)
		);

	dmg_muxi #(
			.L_y(67.46898)
		) ukap_inst (
			.sel(sopu),
			.d1(\16384hz ),
			.d0(\65536hz ),
			.y(ukap)
		);

	dmg_dffr #(
			.L_q_n(324.8591)
		) uket_inst (
			.d(uket_n),
			.clk(teka_n),
			.r_n(reset_div_n),
			.q(),
			.q_n(uket_n)
		);

	dmg_dffr #(
			.L_q_n(223.9219)
		) ukup_inst (
			.d(ukup_n),
			.clk(clk_1mhz),
			.r_n(reset_div_n),
			.q(),
			.q_n(ukup_n)
		);

	dmg_dffsr #(
			.L_q(1687.516)
		) ulak_inst (
			.d(pesu_const1),
			.clk(int_jp),
			.s_n(toga),
			.r_n(tyme),
			.q(cpu_irq4),
			.q_n()
		);

	dmg_mux #(
			.L_y(248.8913)
		) ulur_inst (
			.sel(ff60_d1),
			.d1(clk_1mhz),
			.d0(tama_n),
			.y(ulur)
		);

	dmg_not_x1 #(
			.L_y(138.3908)
		) umek_inst (
			.in(ugot),
			.y(\8192hz )
		);

	dmg_not_x1 #(
			.L_y(3706)
		) umer_inst (
			.in(teru),
			.y(\512hz )
		);

	dmg_not_x1 #(
			.L_y(4919.644)
		) umob_inst (
			.in(\8192hz ),
			.y(umob)
		);

	dmg_and2 #(
			.L_y(8850.168)
		) umut_inst (
			.in1(t1_n),
			.in2(uvar),
			.y(t1_nt2)
		);

	dmg_dffr #(
			.L_q_n(156.9841)
		) uner_inst (
			.d(uner_n),
			.clk(ufor_n),
			.r_n(reset_div_n),
			.q(),
			.q_n(uner_n)
		);

	dmg_and2 #(
			.L_y(20570.96)
		) unor_inst (
			.in1(t2_n),
			.in2(ubet),
			.y(t1t2_n)
		);

	dmg_and2 #(
			.L_y(62.42183)
		) unut_inst (
			.in1(tubo_n),
			.in2(\16hz ),
			.y(unut)
		);

	dmg_dffr #(
			.L_q_n(334.1559)
		) unyk_inst (
			.d(unyk_n),
			.clk(tero_n),
			.r_n(reset_div_n),
			.q(),
			.q_n(unyk_n)
		);

	dmg_dffr #(
			.L_q(203.469),
			.L_q_n(127.7657)
		) upof_inst (
			.d(upof_n),
			.clk(uket_n),
			.r_n(reset_div_n),
			.q(\16hz ),
			.q_n(upof_n)
		);

	dmg_nand3 #(
			.L_y(2302.704)
		) upoj_inst (
			.in1(ubet),
			.in2(uvar),
			.in3(reset),
			.y(test_reset_n)
		);

	dmg_not_if1 #(
			.L_y(33882.07)
		) upug_inst (
			.in(\512hz ),
			.ena(tagy),
			.y(d4)
		);

	dmg_or2 #(
			.L_y(602.4374)
		) upyf_inst (
			.in1(reset),
			.in2(ucob),
			.y(upyf)
		);

	dmg_not_x1 #(
			.L_y(533.3758)
		) urek_inst (
			.in(tulu),
			.y(\4096hz )
		);

	dmg_nor2 #(
			.L_y(4728.394)
		) urun_inst (
			.in1(t1t2_n),
			.in2(tymu),
			.y(urun)
		);

	dmg_nand4 #(
			.L_y(2019.283)
		) urys_inst (
			.in1(a0),
			.in2(tola),
			.in3(cpu_wr),
			.in4(ff00_ff03),
			.y(urys)
		);

	dmg_not_x1 #(
			.L_y(4974.628)
		) usec_inst (
			.in(\4096hz ),
			.y(usec)
		);

	dmg_nor2 #(
			.L_y(4990.299)
		) usuf_inst (
			.in1(t1t2_n),
			.in2(puva),
			.y(usuf)
		);

	dmg_not_x1 #(
			.L_y(66.93761)
		) utok_inst (
			.in(tugo),
			.y(utok)
		);

	dmg_not_x1 #(
			.L_y(167.8756)
		) uvar_inst (
			.in(t2_n),
			.y(uvar)
		);

	dmg_nand2 #(
			.L_y(4874.486)
		) uver_inst (
			.in1(puva),
			.in2(ext_addr_en_n),
			.y(uver)
		);

	dmg_not_x1 #(
			.L_y(1139.266)
		) uvyn_inst (
			.in(tama),
			.y(\16384hz )
		);

	dmg_not_x1 #(
			.L_y(36.92146)
		) uvyr_inst (
			.in(tero),
			.y(\65536hz )
		);

	dmg_not_x2 #(
			.L_y(1013.359)
		) uvyt_inst (
			.in(data_phase),
			.y(dma_phi)
		);

	dmg_nand4 #(
			.L_y(1808.642)
		) uwam_inst (
			.in1(tovy),
			.in2(a1),
			.in3(cpu_wr),
			.in4(ff00_ff03),
			.y(uwam)
		);

	dmg_nand2 #(
			.L_y(370.8127)
		) vaby_inst (
			.in1(suny),
			.in2(sprite_on5),
			.y(vaby)
		);

	dmg_not_if0 #(
			.L_y(3991.015)
		) vace_inst (
			.in(tozo),
			.ena_n(wuko),
			.y(ma7_n)
		);

	dmg_drlatch_ee #(
			.L_q(478.391),
			.L_q_n(223.6563)
		) vafa_inst (
			.d(d5),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(vafa),
			.q_n(vafa_n)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) vafe_inst (
			.in(vevo_n),
			.ena_n(weku),
			.y(d6)
		);

	dmg_dffsr #(
			.L_q(589.4221)
		) vafo_inst (
			.d(sprite_px_b5),
			.clk(clkpipe),
			.s_n(tuxa),
			.r_n(tupe),
			.q(sprite_px_b6),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(98.28117)
		) vage_inst (
			.in(sprite_palette),
			.y(vage)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) vaha_inst (
			.in(woky_n),
			.ena_n(wyce),
			.y(d6)
		);

	dmg_nand5 #(
			.L_y(166.547)
		) vama_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(xeno),
			.in4(xusy),
			.in5(wepo),
			.y(vama)
		);

	dmg_dffsr #(
			.L_q(291.125)
		) vanu_inst (
			.d(sprite_px_a5),
			.clk(clkpipe),
			.s_n(tapo),
			.r_n(taby),
			.q(sprite_px_a6),
			.q_n()
		);

	dmg_and2 #(
			.L_y(272.2661)
		) vape_inst (
			.in1(tacu),
			.in2(tuvo),
			.y(vape)
		);

	dmg_not_if1 #(
			.L_y(4222.375)
		) vapy_inst (
			.in(bg_tile0),
			.ena(bp_cy),
			.y(ma4_n)
		);

	dmg_dffsr #(
			.L_q(532.5779)
		) vare_inst (
			.d(sprite_px_a3),
			.clk(clkpipe),
			.s_n(tyga),
			.r_n(waxo),
			.q(sprite_px_a4),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(1562.406)
		) varo_inst (
			.in(wafu),
			.y(varo)
		);

	dmg_not_x2 #(
			.L_y(1388.422)
		) vary_inst (
			.in(wofa),
			.y(ff41)
		);

	dmg_and3 #(
			.L_y(241.1873)
		) vata_inst (
			.in1(wyru),
			.in2(wele),
			.in3(obj0px),
			.y(vata)
		);

	dmg_not_x1 #(
			.L_y(515.5782)
		) vate_inst (
			.in(lcd_x3),
			.y(vate)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) vato_inst (
			.in(wymo_n),
			.ena_n(wyce),
			.y(d5)
		);

	dmg_dffsr #(
			.L_q(494.0627)
		) vava_inst (
			.d(vumo),
			.clk(clkpipe),
			.s_n(tuwu),
			.r_n(wubu),
			.q(sprite_px_priority),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(704.7032)
		) vave_inst (
			.in(tobe),
			.y(vave)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) vazu_inst (
			.in(vafa_n),
			.ena_n(weku),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(1671.313)
		) vefu_inst (
			.in(weko),
			.y(vefu)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) vega_inst (
			.in(wury),
			.ena_n(varo),
			.y(d0)
		);

	dmg_not_if0 #(
			.L_y(4309.501)
		) veha_inst (
			.in(taxa),
			.ena_n(wuko),
			.y(ma6_n)
		);

	dmg_not_if1 #(
			.L_y(4309.501)
		) vejy_inst (
			.in(bg_tile2),
			.ena(bp_cy),
			.y(ma6_n)
		);

	dmg_nor2 #(
			.L_y(152.7342)
		) veku_inst (
			.in1(wuty),
			.in2(tave),
			.y(veku)
		);

	dmg_and2 #(
			.L_y(956.7818)
		) vely_inst (
			.in1(ppu_wr),
			.in2(ff47),
			.y(vely)
		);

	dmg_dffr #(
			.L_q_n(742.6877)
		) vena_inst (
			.d(vena_n),
			.clk(wuvu_n),
			.r_n(ppu_reset_n),
			.q(),
			.q_n(vena_n)
		);

	dmg_not_x1 #(
			.L_y(147.953)
		) vepe_inst (
			.in(lcd_x1),
			.y(vepe)
		);

	dmg_and2 #(
			.L_y(345.8435)
		) vetu_inst (
			.in1(tevo),
			.in2(in_window),
			.y(wx_clk)
		);

	dmg_drlatch_ee #(
			.L_q(461.6567),
			.L_q_n(241.453)
		) vevo_inst (
			.d(d6),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(vevo),
			.q_n(vevo_n)
		);

	dmg_not_if0 #(
			.L_y(5085.921)
		) vevy_inst (
			.in(ff40_d6),
			.ena_n(wuko),
			.y(ma10_n)
		);

	dmg_nand2 #(
			.L_y(321.1404)
		) vexu_inst (
			.in1(saja),
			.in2(sprite_on4),
			.y(vexu)
		);

	dmg_not_if0 #(
			.L_y(3384.063)
		) veza_inst (
			.in(vypo_const1),
			.ena_n(wuko),
			.y(ma11_n)
		);

	dmg_dffsr #(
			.L_q(518.7659)
		) vezo_inst (
			.d(vypo_const1),
			.clk(clkpipe),
			.s_n(tede),
			.r_n(woka),
			.q(vezo),
			.q_n()
		);

	dmg_pad_pass_tg #(
			.L_a(3006.344)
		) vin_inst (
			.a(vin),
			.pad(vin_pad)
		);

	dmg_not_x1 #(
			.L_y(96.68779)
		) voby_inst (
			.in(sele),
			.y(voby)
		);

	dmg_not_x2 #(
			.L_y(684.7814)
		) voca_inst (
			.in(woru),
			.y(ff40)
		);

	dmg_not_x1 #(
			.L_y(1132.891)
		) vode_inst (
			.in(ma9_n),
			.y(vode)
		);

	dmg_dffr #(
			.L_q(132.2809)
		) voga_inst (
			.d(stop_mode3),
			.clk(ppu_4mhz_n),
			.r_n(h_reset_n),
			.q(voga),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3221.234)
		) vogu_inst (
			.in(vypo_const1),
			.ena_n(wuko),
			.y(ma12_n)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) vojo_inst (
			.in(vuce_n),
			.ena_n(weku),
			.y(d1)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) voke_inst (
			.in(wexu_n),
			.ena_n(wyce),
			.y(d4)
		);

	dmg_nand7 #(
			.L_y(134.6717)
		) voku_inst (
			.in1(tuju),
			.in2(tafy),
			.in3(tuda),
			.in4(vate),
			.in5(vuty),
			.in6(vepe),
			.in7(tocu),
			.y(voku)
		);

	dmg_and3 #(
			.L_y(429.5156)
		) volo_inst (
			.in1(vumu),
			.in2(wolo),
			.in3(obj0px),
			.y(volo)
		);

	dmg_not_x1 #(
			.L_y(1845.297)
		) vomy_inst (
			.in(waxu),
			.y(vomy)
		);

	dmg_dffr #(
			.L_q(1546.469),
			.L_q_n(639.6249)
		) vonu_inst (
			.d(tobu),
			.clk(clk5),
			.r_n(mode3),
			.q(vonu),
			.q_n(vonu_n)
		);

	dmg_dffsr #(
			.L_q(450.2346)
		) vosa_inst (
			.d(wuru),
			.clk(clkpipe),
			.s_n(tyra),
			.r_n(tufo),
			.q(vosa),
			.q_n()
		);

	dmg_or3 #(
			.L_y(89.25002)
		) voto_inst (
			.in1(xefy),
			.in2(sprite_px_a4),
			.in3(sprite_px_b4),
			.y(voto)
		);

	dmg_not_x3 #(
			.L_y(2213.985)
		) voty_inst (
			.in(tuva),
			.y(int_stat)
		);

	dmg_not_x1 #(
			.L_y(1573.297)
		) vova_inst (
			.in(ma8_n),
			.y(vova)
		);

	dmg_not_if0 #(
			.L_y(4338.984)
		) vovo_inst (
			.in(tate),
			.ena_n(wuko),
			.y(ma8_n)
		);

	dmg_not_x1 #(
			.L_y(1614.203)
		) voxu_inst (
			.in(wuza),
			.y(voxu)
		);

	dmg_not_x1 #(
			.L_y(865.6719)
		) voze_inst (
			.in(wane),
			.y(voze)
		);

	dmg_drlatch_ee #(
			.L_q(275.453),
			.L_q_n(264.2966)
		) vuce_inst (
			.d(d1),
			.ena(voze),
			.ena_n(wane),
			.r_n(lyc_stat_reset_n),
			.q(vuce),
			.q_n(vuce_n)
		);

	dmg_and3 #(
			.L_y(301.2189)
		) vugo_inst (
			.in1(vumu),
			.in2(wele),
			.in3(obj0px),
			.y(vugo)
		);

	dmg_dffr #(
			.L_q(91.64095),
			.L_q_n(100.1405)
		) vujo_inst (
			.d(vujo_n),
			.clk(vyno_n),
			.r_n(syny),
			.q(vujo),
			.q_n(vujo_n)
		);

	dmg_not_if0 #(
			.L_y(4098.063)
		) vulo_inst (
			.in(teke),
			.ena_n(wuko),
			.y(ma9_n)
		);

	dmg_nand2 #(
			.L_y(380.9057)
		) vume_inst (
			.in1(suto),
			.in2(sprite_on5),
			.y(vume)
		);

	dmg_dffsr #(
			.L_q(251.8126)
		) vumo_inst (
			.d(woda),
			.clk(clkpipe),
			.s_n(tyko),
			.r_n(tena),
			.q(vumo),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(357.7967)
		) vumu_inst (
			.in(woxa),
			.y(vumu)
		);

	dmg_not_x2 #(
			.L_y(450.7654)
		) vumy_inst (
			.in(wage),
			.y(ff4b)
		);

	dmg_nand2 #(
			.L_y(164.9532)
		) vune_inst (
			.in1(sega),
			.in2(sprite_on7),
			.y(vune)
		);

	dmg_dffsr #(
			.L_q(158.3128)
		) vupy_inst (
			.d(sprite_px_a6),
			.clk(clkpipe),
			.s_n(teso),
			.r_n(tula),
			.q(sprite_px_a7),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(3221.234)
		) vury_inst (
			.in(vuza),
			.ena(bp_cy),
			.y(ma12_n)
		);

	dmg_or2 #(
			.L_y(159.3748)
		) vusa_inst (
			.in1(tyfo_n),
			.in2(tyno),
			.y(vusa)
		);

	dmg_and2 #(
			.L_y(869.6564)
		) vuso_inst (
			.in1(ppu_rd),
			.in2(ff47),
			.y(vuso)
		);

	dmg_not_x1 #(
			.L_y(309.4529)
		) vuty_inst (
			.in(lcd_x2),
			.y(vuty)
		);

	dmg_nor2 #(
			.L_y(91.10908)
		) vuza_inst (
			.in1(bg_tile7),
			.in2(ff40_d4),
			.y(vuza)
		);

	dmg_nor3 #(
			.L_y(103.3283)
		) vybo_inst (
			.in1(sprite_x_match),
			.in2(stop_mode3),
			.in3(myvo),
			.y(vybo)
		);

	dmg_not_x1 #(
			.L_y(2101.891)
		) vyco_inst (
			.in(tade),
			.y(vyco)
		);

	dmg_not_x1 #(
			.L_y(1524.422)
		) vycu_inst (
			.in(wyze),
			.y(vycu)
		);

	dmg_not_x2 #(
			.L_y(721.1719)
		) vyga_inst (
			.in(wyvo),
			.y(ff4a)
		);

	dmg_dffr #(
			.L_q(114.7502),
			.L_q_n(187.2659)
		) vymu_inst (
			.d(vymu_n),
			.clk(vujo_n),
			.r_n(syny),
			.q(vymu),
			.q_n(vymu_n)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) vyne_inst (
			.in(wata),
			.ena_n(varo),
			.y(d4)
		);

	dmg_dffr #(
			.L_q(258.7186),
			.L_q_n(306.2657)
		) vyno_inst (
			.d(vyno_n),
			.clk(wy_clk),
			.r_n(syny),
			.q(vyno),
			.q_n(vyno_n)
		);

	dmg_tie #(
			.L_gnd(27409.06),
			.L_vdd(3466.406)
		) vypo_inst (
			.gnd(const0),
			.vdd(vypo_const1)
		);

	dmg_not_x3 #(
			.L_y(2331.392)
		) vypu_inst (
			.in(tolu),
			.y(int_vbl)
		);

	dmg_and2 #(
			.L_y(109.9686)
		) vyre_inst (
			.in1(ff40),
			.in2(ppu_rd),
			.y(vyre)
		);

	dmg_and3 #(
			.L_y(190.453)
		) vyro_inst (
			.in1(wyru),
			.in2(wolo),
			.in3(obj0px),
			.y(vyro)
		);

	dmg_or3 #(
			.L_y(103.3284)
		) vysa_inst (
			.in1(xefy),
			.in2(sprite_px_a5),
			.in3(sprite_px_b5),
			.y(vysa)
		);

	dmg_not_if0 #(
			.L_y(4179.61)
		) vyto_inst (
			.in(tufu),
			.ena_n(wuko),
			.y(ma5_n)
		);

	dmg_not_x1 #(
			.L_y(101.2032)
		) vywa_inst (
			.in(topu),
			.y(vywa)
		);

	dmg_drlatch_ee #(
			.L_q(591.0159),
			.L_q_n(96.68748)
		) vyxe_inst (
			.d(d0),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d0),
			.q_n(vyxe_n)
		);

	dmg_dffr #(
			.L_q(345.5781),
			.L_q_n(164.4217)
		) vyzo_inst (
			.d(vyzo_n),
			.clk(typo_n),
			.r_n(mude),
			.q(lcd_x2),
			.q_n(vyzo_n)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) waba_inst (
			.in(gesy_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a6)
		);

	dmg_not_x1 #(
			.L_y(532.5782)
		) wabe_inst (
			.in(gyvo),
			.y(wabe)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) wabo_inst (
			.in(gohu_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a5)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) wabu_inst (
			.in(xaku_n),
			.ena_n(sprite_sel7),
			.y(sprite_y_store2)
		);

	dmg_not_if0 #(
			.L_y(936.8593)
		) wacu_inst (
			.in(a1),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a1_n_tri)
		);

	dmg_or2 #(
			.L_y(86.8597)
		) wacy_inst (
			.in1(dyba),
			.in2(womy),
			.y(wacy)
		);

	dmg_not_x1 #(
			.L_y(1828.828)
		) wade_inst (
			.in(oam_a6),
			.y(oam_a6_n)
		);

	dmg_not_x1 #(
			.L_y(530.1874)
		) wado_inst (
			.in(xola),
			.y(wado)
		);

	dmg_not_x1 #(
			.L_y(1801.204)
		) wadu_inst (
			.in(oam_a3),
			.y(oam_a3_n)
		);

	dmg_not_x1 #(
			.L_y(757.0317)
		) wady_inst (
			.in(a5),
			.y(hram_a5_n)
		);

	dmg_and2 #(
			.L_y(3417.001)
		) wafa_inst (
			.in1(oam_a1_n),
			.in2(oam_a2_n),
			.y(oam_a2_na1_n)
		);

	dmg_not_x1 #(
			.L_y(365.2344)
		) wafo_inst (
			.in(geka),
			.y(wafo)
		);

	dmg_and2 #(
			.L_y(82.60939)
		) wafu_inst (
			.in1(ppu_rd),
			.in2(ff44),
			.y(wafu)
		);

	dmg_dffr #(
			.L_q(259.2496)
		) wafy_inst (
			.d(gega),
			.clk(wuty),
			.r_n(byva),
			.q(wafy),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) waga_inst (
			.in(goru_n),
			.ena_n(sprite_sel5),
			.y(oam_render_a4)
		);

	dmg_nand5 #(
			.L_y(105.1874)
		) wage_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(wesa),
			.in4(xusy),
			.in5(wepo),
			.y(wage)
		);

	dmg_xor #(
			.L_y(108.3748)
		) wago_inst (
			.in1(wuky),
			.in2(sprite_y_store3),
			.y(wago)
		);

	dmg_not_x3 #(
			.L_y(3023.079)
		) wahe_inst (
			.in(wujy),
			.y(oam_wldrv_precharge_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) waja_inst (
			.in(xynu_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a7)
		);

	dmg_not_x1 #(
			.L_y(1363.719)
		) wajy_inst (
			.in(xega),
			.y(wajy)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) wako_inst (
			.in(gule_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a2)
		);

	dmg_nand7 #(
			.L_y(34.53133)
		) wale_inst (
			.in1(a0),
			.in2(a1),
			.in3(a2),
			.in4(a3),
			.in5(a4),
			.in6(a5),
			.in7(a6),
			.y(wale)
		);

	dmg_not_x1 #(
			.L_y(720.9066)
		) walo_inst (
			.in(xusy),
			.y(walo)
		);

	dmg_not_x2 #(
			.L_y(2310.406)
		) walu_inst (
			.in(ppu_hard_reset),
			.y(win_reset_n)
		);

	dmg_ao2222 #(
			.L_y(774.2963)
		) waly_inst (
			.in1(vyro),
			.in2(obp0_d6),
			.in3(vata),
			.in4(obp0_d4),
			.in5(volo),
			.in6(obp0_d2),
			.in7(vugo),
			.in8(obp0_d0),
			.y(waly)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) wama_inst (
			.in(xaga),
			.ena_n(varo),
			.y(d5)
		);

	dmg_not_x2 #(
			.L_y(3255.235)
		) wame_inst (
			.in(oam_oe),
			.y(oam_oe_n)
		);

	dmg_not_x1 #(
			.L_y(149.547)
		) wamy_inst (
			.in(sega),
			.y(wamy)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) wana_inst (
			.in(xygo_n),
			.ena_n(sprite_sel7),
			.y(sprite_y_store3)
		);

	dmg_not_x1 #(
			.L_y(1136.078)
		) wane_inst (
			.in(xufa),
			.y(wane)
		);

	dmg_dlatch_ee #(
			.L_q_n(148.2188)
		) wanu_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(wanu_n)
		);

	dmg_not_if0 #(
			.L_y(764.4689)
		) wape_inst (
			.in(a3),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a3_n_tri)
		);

	dmg_dffr #(
			.L_q(185.4059)
		) wapo_inst (
			.d(gutu),
			.clk(wuty),
			.r_n(byva),
			.q(wapo),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(549.5779)
		) wara_inst (
			.in(wufa),
			.y(save_sprite_num9)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) ware_inst (
			.in(gave_n),
			.ena_n(buwy),
			.y(d0)
		);

	dmg_and2 #(
			.L_y(772.9688)
		) waru_inst (
			.in1(ff40),
			.in2(ppu_wr),
			.y(waru)
		);

	dmg_not_if0 #(
			.L_y(1790.578)
		) wasa_inst (
			.in(ralo),
			.ena_n(cede),
			.y(oam_a_d0_n)
		);

	dmg_not_x1 #(
			.L_y(42.49976)
		) wase_inst (
			.in(ybez),
			.y(wase)
		);

	dmg_not_x1 #(
			.L_y(164.4219)
		) wata_inst (
			.in(v4),
			.y(wata)
		);

	dmg_nand5 #(
			.L_y(540.8125)
		) wate_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(wesa),
			.in4(walo),
			.in5(xera),
			.y(wate)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) wato_inst (
			.in(gabo_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a2)
		);

	dmg_wave_ram #(
			.L_dout0(1325.203),
			.L_dout1(1272.875),
			.L_dout2(1180.703),
			.L_dout3(1069.141),
			.L_dout4(1927.11),
			.L_dout5(2392.75),
			.L_dout6(1824.844),
			.L_dout7(1343.531)
		) wave_ram_inst (
			.din0(d0),
			.din1(d1),
			.din2(d2),
			.din3(d3),
			.din4(d4),
			.din5(d5),
			.din6(d6),
			.din7(d7),
			.dout0(wave_rd_d0),
			.dout1(wave_rd_d1),
			.dout2(wave_rd_d2),
			.dout3(wave_rd_d3),
			.dout4(wave_rd_d4),
			.dout5(wave_rd_d5),
			.dout6(wave_rd_d6),
			.dout7(wave_rd_d7),
			.col0(wave_a1_na0_n),
			.col1(wave_a1_na0),
			.col2(wave_a1a0_n),
			.col3(wave_a1a0),
			.a2(wave_a2),
			.a2_n(wave_a2_n),
			.a3(wave_a3),
			.a3_n(wave_a3_n),
			.wr(wave_ram_wr2),
			.bl_pch_n(wave_ram_bl_precharge_n),
			.wldrv_pch_n(wave_ram_wldrv_precharge_n)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) wavo_inst (
			.in(xuce),
			.ena_n(varo),
			.y(d6)
		);

	dmg_nand5 #(
			.L_y(163.6253)
		) wavu_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(wesa),
			.in4(xusy),
			.in5(xera),
			.y(wavu)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) wawe_inst (
			.in(vujo),
			.ena_n(xucy),
			.y(ma2_n)
		);

	dmg_not_x1 #(
			.L_y(1810.5)
		) wawy_inst (
			.in(oam_a4),
			.y(oam_a4_n)
		);

	dmg_not_if0 #(
			.L_y(1481.125)
		) waxa_inst (
			.in(a6),
			.ena_n(oam_addr_cpu_n),
			.y(oam_a6_n_tri)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) waxe_inst (
			.in(xyna_n),
			.ena_n(sprite_sel7),
			.y(sprite_y_store0)
		);

	dmg_nand2 #(
			.L_y(163.8905)
		) waxo_inst (
			.in1(voby),
			.in2(sprite_on4),
			.y(waxo)
		);

	dmg_and2 #(
			.L_y(155.3904)
		) waxu_inst (
			.in1(ppu_rd),
			.in2(ff4a),
			.y(waxu)
		);

	dmg_or3 #(
			.L_y(112.8906)
		) wazo_inst (
			.in1(wusu),
			.in2(wofe),
			.in3(wohe),
			.y(wazo)
		);

	dmg_and2 #(
			.L_y(3391.236)
		) wazu_inst (
			.in1(oam_a1),
			.in2(oam_a2),
			.y(oam_a2a1)
		);

	dmg_not_x1 #(
			.L_y(282.0937)
		) wazy_inst (
			.in(in_window),
			.y(wy_clk)
		);

	dmg_dffsr #(
			.L_q(227.9063)
		) weba_inst (
			.d(sprite_px_a4),
			.clk(clkpipe),
			.s_n(vume),
			.r_n(xole),
			.q(sprite_px_a5),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(751.9849)
		) webe_inst (
			.in(a3),
			.y(hram_a3_n)
		);

	dmg_not_x1 #(
			.L_y(91.90602)
		) webo_inst (
			.in(yloz),
			.y(webo)
		);

	dmg_nand5 #(
			.L_y(193.9061)
		) webu_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(wesa),
			.in4(xusy),
			.in5(xera),
			.y(webu)
		);

	dmg_drlatch_ee #(
			.L_q(90.57782)
		) weco_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(weco),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(168.9373)
		) wede_inst (
			.in1(xura),
			.in2(sprite_on1),
			.y(wede)
		);

	dmg_drlatch_ee #(
			.L_q(113.1561)
		) wedu_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(wedu),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(204.2653)
		) wedy_inst (
			.in1(xyke),
			.in2(sprite_on4),
			.y(wedy)
		);

	dmg_tie #(
			.L_gnd(27409.06),
			.L_vdd(2281.719)
		) wefe_inst (
			.gnd(const0),
			.vdd(wefe_const1)
		);

	dmg_not_x1 #(
			.L_y(86.32792)
		) wefu_inst (
			.in(ydug),
			.y(wefu)
		);

	dmg_and2 #(
			.L_y(154.5938)
		) wefy_inst (
			.in1(tuvo),
			.in2(tyfo_n),
			.y(wefy)
		);

	dmg_nand2 #(
			.L_y(112.6247)
		) wega_inst (
			.in1(oam_wldrv_precharge_n),
			.in2(wofe),
			.y(wega)
		);

	dmg_or2 #(
			.L_y(354.6097)
		) wego_inst (
			.in1(h_reset),
			.in2(voga),
			.y(wego)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) wehe_inst (
			.in(gyho_n),
			.ena_n(sprite_sel0),
			.y(sprite_y_store3)
		);

	dmg_not_x1 #(
			.L_y(747.4688)
		) wehu_inst (
			.in(a2),
			.y(hram_a2_n)
		);

	dmg_or2 #(
			.L_y(192.5781)
		) weja_inst (
			.in1(gaba),
			.in2(xyla),
			.y(weja)
		);

	dmg_not_if0 #(
			.L_y(3915.844)
		) wejo_inst (
			.in(ralo),
			.ena_n(cede),
			.y(oam_b_d0_n)
		);

	dmg_not_x1 #(
			.L_y(755.9686)
		) weju_inst (
			.in(a6),
			.y(hram_a6_n)
		);

	dmg_not_x2 #(
			.L_y(1315.376)
		) wejy_inst (
			.in(wega),
			.y(oam_a_wr2)
		);

	dmg_not_x1 #(
			.L_y(1642.625)
		) weka_inst (
			.in(xujo),
			.y(weka)
		);

	dmg_and2 #(
			.L_y(155.3908)
		) weko_inst (
			.in1(ppu_wr),
			.in2(ff4a),
			.y(weko)
		);

	dmg_not_x1 #(
			.L_y(1001.671)
		) weku_inst (
			.in(xyly),
			.y(weku)
		);

	dmg_not_x1 #(
			.L_y(557.8119)
		) wele_inst (
			.in(xula),
			.y(wele)
		);

	dmg_drlatch_ee #(
			.L_q(152.7346)
		) welo_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(welo),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(111.8283)
		) wema_inst (
			.in1(oam_wldrv_precharge_n),
			.in2(wohe),
			.y(wema)
		);

	dmg_not_x1 #(
			.L_y(1577.813)
		) weme_inst (
			.in(decu),
			.y(weme)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) wenu_inst (
			.in(sprite_y3_n),
			.ena_n(sprite_x_match),
			.y(sprite_y_store3)
		);

	dmg_not_x1 #(
			.L_y(144.4999)
		) weny_inst (
			.in(vywa),
			.y(weny)
		);

	dmg_not_x1 #(
			.L_y(494.3285)
		) wepo_inst (
			.in(xera),
			.y(wepo)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) wepy_inst (
			.in(xefe_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a3)
		);

	dmg_not_x2 #(
			.L_y(191.5158)
		) wera_inst (
			.in(wybo),
			.y(ff47)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) were_inst (
			.in(xosy_n),
			.ena_n(sprite_sel2),
			.y(sprite_y_store1)
		);

	dmg_not_x2 #(
			.L_y(1134.485)
		) wero_inst (
			.in(wutu),
			.y(ff4x)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) weru_inst (
			.in(wanu_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a4)
		);

	dmg_not_x1 #(
			.L_y(136.0001)
		) wery_inst (
			.in(saja),
			.y(wery)
		);

	dmg_not_x1 #(
			.L_y(976.4384)
		) wesa_inst (
			.in(xeno),
			.y(wesa)
		);

	dmg_not_x2 #(
			.L_y(1917.016)
		) wesy_inst (
			.in(ppu_hard_reset),
			.y(lyc_stat_reset_n)
		);

	dmg_nand5 #(
			.L_y(1519.109)
		) weta_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(xeno),
			.in4(xusy),
			.in5(wepo),
			.y(weta)
		);

	dmg_not_x1 #(
			.L_y(616.5152)
		) wetu_inst (
			.in(yfag),
			.y(save_sprite_x3)
		);

	dmg_nand5 #(
			.L_y(131.219)
		) wety_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(xeno),
			.in4(walo),
			.in5(xera),
			.y(wety)
		);

	dmg_not_x1 #(
			.L_y(715.8599)
		) weva_inst (
			.in(wofo),
			.y(save_sprite_x4)
		);

	dmg_nand2 #(
			.L_y(266.6877)
		) wevo_inst (
			.in1(xenu),
			.in2(sprite_on3),
			.y(wevo)
		);

	dmg_not_x2 #(
			.L_y(1291.468)
		) wewu_inst (
			.in(wuku),
			.y(oam_a_rd_n)
		);

	dmg_dffr #(
			.L_q(855.3126),
			.L_q_n(158.8436)
		) wewy_inst (
			.d(wewy_n),
			.clk(yfel_n),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a3),
			.q_n(wewy_n)
		);

	dmg_not_x2 #(
			.L_y(2537.251)
		) wexa_inst (
			.in(wema),
			.y(oam_b_wr2)
		);

	dmg_and2 #(
			.L_y(3397.345)
		) wexe_inst (
			.in1(oam_a1_n),
			.in2(oam_a2),
			.y(oam_a2a1_n)
		);

	dmg_drlatch_ee #(
			.L_q(550.3749),
			.L_q_n(124.0469)
		) wexu_inst (
			.d(d4),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d4),
			.q_n(wexu_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) weza_inst (
			.in(xecu_n),
			.ena_n(oam_rendering),
			.y(oam_render_a7)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) weze_inst (
			.in(xowo),
			.ena_n(varo),
			.y(d7)
		);

	dmg_dffr #(
			.L_q(132.0159),
			.L_q_n(464.8433)
		) wobo_inst (
			.d(wobo_n),
			.clk(wody_n),
			.r_n(wx_rst_n),
			.q(wobo),
			.q_n(wobo_n)
		);

	dmg_not_x1 #(
			.L_y(76.76561)
		) wobu_inst (
			.in(ygem),
			.y(wobu)
		);

	dmg_not_x1 #(
			.L_y(750.9216)
		) woce_inst (
			.in(a4),
			.y(hram_a4_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) wocy_inst (
			.in(gecu_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a7)
		);

	dmg_dffsr #(
			.L_q(164.6871)
		) woda_inst (
			.d(xete),
			.clk(clkpipe),
			.s_n(xely),
			.r_n(wuja),
			.q(woda),
			.q_n()
		);

	dmg_and2 #(
			.L_y(515.8437)
		) wodu_inst (
			.in1(xena),
			.in2(xano),
			.y(stop_mode3)
		);

	dmg_dffr #(
			.L_q(181.9531),
			.L_q_n(410.3904)
		) wody_inst (
			.d(wody_n),
			.clk(wyka_n),
			.r_n(wx_rst_n),
			.q(wody),
			.q_n(wody_n)
		);

	dmg_nand5 #(
			.L_y(128.2969)
		) wofa_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(xeno),
			.in4(xusy),
			.in5(xera),
			.y(wofa)
		);

	dmg_not_x1 #(
			.L_y(526.734)
		) wofe_inst (
			.in(oam_a_wr_n),
			.y(wofe)
		);

	dmg_not_x1 #(
			.L_y(826.8906)
		) wofo_inst (
			.in(duke),
			.y(wofo)
		);

	dmg_not_x1 #(
			.L_y(532.8441)
		) wohe_inst (
			.in(oam_b_wr_n),
			.y(wohe)
		);

	dmg_or2 #(
			.L_y(255.2654)
		) wohu_inst (
			.in1(dyba),
			.in2(xudy),
			.y(wohu)
		);

	dmg_nor2 #(
			.L_y(162.8282)
		) wojo_inst (
			.in1(wosu_n),
			.in2(wuvu_n),
			.y(wojo)
		);

	dmg_xor #(
			.L_y(85.79697)
		) woju_inst (
			.in1(welo),
			.in2(h4_n),
			.y(woju)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) wojy_inst (
			.in(xuhy),
			.ena_n(varo),
			.y(d3)
		);

	dmg_nand2 #(
			.L_y(101.2032)
		) woka_inst (
			.in1(xoga),
			.in2(sprite_on0),
			.y(woka)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) woko_inst (
			.in(wyte_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a4)
		);

	dmg_not_x1 #(
			.L_y(257.9221)
		) woku_inst (
			.in(oam_a1),
			.y(oam_a1_n)
		);

	dmg_drlatch_ee #(
			.L_q(522.7501),
			.L_q_n(123.5157)
		) woky_inst (
			.d(d6),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d6),
			.q_n(woky_n)
		);

	dmg_not_x1 #(
			.L_y(271.7343)
		) wola_inst (
			.in(oam_a2),
			.y(oam_a2_n)
		);

	dmg_not_x1 #(
			.L_y(187.2657)
		) wolo_inst (
			.in(wele),
			.y(wolo)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) wolu_inst (
			.in(vymu),
			.ena_n(xucy),
			.y(ma3_n)
		);

	dmg_nand3 #(
			.L_y(33.99997)
		) woly_inst (
			.in1(wale),
			.in2(a7),
			.in3(ffxx),
			.y(woly)
		);

	dmg_not_x1 #(
			.L_y(486.0942)
		) wome_inst (
			.in(wabe),
			.y(save_sprite_y7)
		);

	dmg_nand4 #(
			.L_y(158.3123)
		) womu_inst (
			.in1(eden),
			.in2(fone),
			.in3(ekud),
			.in4(caxu),
			.y(womu)
		);

	dmg_dffr #(
			.L_q(77.56265)
		) womy_inst (
			.d(xoja),
			.clk(wuty),
			.r_n(byva),
			.q(womy),
			.q_n()
		);

	dmg_dlatch #(
			.L_q(476.2656),
			.L_q_n(497.5155)
		) wone_inst (
			.d(oam_b_d3_n),
			.ena(oam_data_latch),
			.q(\wone ),
			.q_n(wone_n)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) wony_inst (
			.in(gubo_n),
			.ena_n(beba),
			.y(d3)
		);

	dmg_or3 #(
			.L_y(167.3434)
		) wope_inst (
			.in1(xefy),
			.in2(sprite_px_a7),
			.in3(sprite_px_b7),
			.y(wope)
		);

	dmg_nand2 #(
			.L_y(34.26504)
		) wopo_inst (
			.in1(wype),
			.in2(hram_bl_precharge_n),
			.y(wopo)
		);

	dmg_dffsr #(
			.L_q(249.4219)
		) wora_inst (
			.d(sprite_px_b4),
			.clk(clkpipe),
			.s_n(vaby),
			.r_n(xexu),
			.q(sprite_px_b5),
			.q_n()
		);

	dmg_nand5 #(
			.L_y(87.65643)
		) woru_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(xeno),
			.in4(xusy),
			.in5(xera),
			.y(woru)
		);

	dmg_not_x2 #(
			.L_y(3334.656)
		) wory_inst (
			.in(wycy),
			.y(oam_oe)
		);

	dmg_not_x1 #(
			.L_y(1819.532)
		) woso_inst (
			.in(oam_a5),
			.y(oam_a5_n)
		);

	dmg_dffr #(
			.L_q(254.4688),
			.L_q_n(213.8286)
		) wosu_inst (
			.d(wuvu_n),
			.clk(xyfy),
			.r_n(ppu_reset_n),
			.q(wosu),
			.q_n(wosu_n)
		);

	dmg_nand6 #(
			.L_y(77.03109)
		) wota_inst (
			.in1(gace),
			.in2(guvu),
			.in3(gyda),
			.in4(gewy),
			.in5(wuhu_c),
			.in6(govu),
			.y(wota)
		);

	dmg_drlatch_ee #(
			.L_q(148.4843)
		) wote_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(wote),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(7651.332)
		) wovu_inst (
			.in(cota),
			.y(oam_bl_precharge_n)
		);

	dmg_not_if0 #(
			.L_y(3915.844)
		) wowa_inst (
			.in(md0),
			.ena_n(azar),
			.y(oam_b_d0_n)
		);

	dmg_and2 #(
			.L_y(1673.171)
		) woxa_inst (
			.in1(ff40_d1),
			.in2(sprite_px_a7),
			.y(woxa)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) woxy_inst (
			.in(xege_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a6)
		);

	dmg_nand2 #(
			.L_y(259.5154)
		) wubu_inst (
			.in1(xuho),
			.in2(sprite_on7),
			.y(wubu)
		);

	dmg_not_x1 #(
			.L_y(1837.859)
		) wuca_inst (
			.in(oam_a7),
			.y(oam_a7_n)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) wuco_inst (
			.in(yduf_n),
			.ena_n(oam_rendering),
			.y(oam_render_a6)
		);

	dmg_not_x2 #(
			.L_y(775.0933)
		) wuda_inst (
			.in(cyke),
			.y(wuda)
		);

	dmg_not_x1 #(
			.L_y(605.0937)
		) wude_inst (
			.in(wylu),
			.y(save_sprite_num4)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) wudo_inst (
			.in(vyno),
			.ena_n(xucy),
			.y(ma1_n)
		);

	dmg_not_x1 #(
			.L_y(620.2339)
		) wufa_inst (
			.in(decu),
			.y(wufa)
		);

	dmg_ao2222 #(
			.L_y(697.0001)
		) wufu_inst (
			.in1(obp0_d7),
			.in2(vyro),
			.in3(obp0_d5),
			.in4(vata),
			.in5(obp0_d3),
			.in6(volo),
			.in7(obp0_d1),
			.in8(vugo),
			.y(wufu)
		);

	dmg_dffsr #(
			.L_q(269.3439)
		) wufy_inst (
			.d(sprite_px_b6),
			.clk(clkpipe),
			.s_n(vune),
			.r_n(xyve),
			.q(sprite_px_b7),
			.q_n()
		);

	dmg_not_if1 #(
			.L_y(35163.97)
		) wuga_inst (
			.in(xaty),
			.ena(tobe),
			.y(d1)
		);

	dmg_drlatch_ee #(
			.L_q(99.07822)
		) wuha_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(wuha),
			.q_n()
		);

	dmg_full_add #(
			.L_cout(359.6567),
			.L_sum(104.1248)
		) wuhu_inst (
			.a(gusu),
			.b(yzab_n),
			.cin(goju_c),
			.cout(wuhu_c),
			.sum(wuhu)
		);

	dmg_nand2 #(
			.L_y(253.4061)
		) wuja_inst (
			.in1(xaba),
			.in2(sprite_on5),
			.y(wuja)
		);

	dmg_nor_latch #(
			.L_q(154.3283)
		) wuje_inst (
			.s(dma_phi2),
			.r(xuto),
			.q(wuje),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4222.375)
		) wuju_inst (
			.in(xolo),
			.ena_n(wuko),
			.y(ma4_n)
		);

	dmg_nand2 #(
			.L_y(111.5624)
		) wujy_inst (
			.in1(wazo),
			.in2(oam_bl_precharge_n),
			.y(wujy)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) wuka_inst (
			.in(xafo_n),
			.ena_n(wyce),
			.y(d3)
		);

	dmg_not_x2 #(
			.L_y(1559.484)
		) wuko_inst (
			.in(xeze),
			.y(wuko)
		);

	dmg_and3 #(
			.L_y(200.547)
		) wuku_inst (
			.in1(cpu_vram_oam_rd),
			.in2(amab),
			.in3(geka),
			.y(wuku)
		);

	dmg_not_x1 #(
			.L_y(1128.109)
		) wuky_inst (
			.in(sprite_y_flip),
			.y(wuky)
		);

	dmg_not_if0 #(
			.L_y(2654.923)
		) wule_inst (
			.in(d2),
			.ena_n(azul),
			.y(oam_a_d2_n)
		);

	dmg_not_x2 #(
			.L_y(1612.876)
		) wuly_inst (
			.in(wopo),
			.y(hram_wldrv_precharge_n)
		);

	dmg_not_x1 #(
			.L_y(416.7653)
		) wuma_inst (
			.in(fuke),
			.y(save_sprite_y2)
		);

	dmg_not_x2 #(
			.L_y(737.3757)
		) wume_inst (
			.in(guko),
			.y(oam_b_rd_n)
		);

	dmg_not_x1 #(
			.L_y(90.31274)
		) wuna_inst (
			.in(xage),
			.y(wuna)
		);

	dmg_not_if0 #(
			.L_y(4338.984)
		) wune_inst (
			.in(ybog_n),
			.ena_n(abon),
			.y(ma8_n)
		);

	dmg_not_x1 #(
			.L_y(798.9999)
		) wunu_inst (
			.in(wohu),
			.y(sprite_rst4)
		);

	dmg_not_x1 #(
			.L_y(657.6877)
		) wupa_inst (
			.in(gake),
			.y(sprite_rst3)
		);

	dmg_not_x1 #(
			.L_y(139.9845)
		) wura_inst (
			.in(suny),
			.y(wura)
		);

	dmg_dffsr #(
			.L_q(128.2969)
		) wuru_inst (
			.d(vezo),
			.clk(clkpipe),
			.s_n(xala),
			.r_n(wede),
			.q(wuru),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(146.6252)
		) wury_inst (
			.in(v0),
			.y(wury)
		);

	dmg_nor_latch #(
			.L_q(229.5001)
		) wusa_inst (
			.s(xajo),
			.r(wego),
			.q(px9),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(565.2506)
		) wuse_inst (
			.in(weka),
			.y(wuse)
		);

	dmg_not_x1 #(
			.L_y(513.1875)
		) wusu_inst (
			.in(oam_rd_n),
			.y(wusu)
		);

	dmg_not_x2 #(
			.L_y(1034.077)
		) wuta_inst (
			.in(woly),
			.y(hram_wldrv_ena)
		);

	dmg_or2 #(
			.L_y(266.1562)
		) wuto_inst (
			.in1(webo),
			.in2(gede),
			.y(wuto)
		);

	dmg_nand3 #(
			.L_y(139.1877)
		) wutu_inst (
			.in1(ffxx),
			.in2(a6),
			.in3(xaly),
			.y(wutu)
		);

	dmg_not_x2 #(
			.L_y(3918.765)
		) wuty_inst (
			.in(vusa),
			.y(wuty)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) wuva_inst (
			.in(xepo),
			.ena_n(varo),
			.y(d1)
		);

	dmg_dffr #(
			.L_q_n(456.3436)
		) wuvu_inst (
			.d(wuvu_n),
			.clk(xota),
			.r_n(ppu_reset_n),
			.q(),
			.q_n(wuvu_n)
		);

	dmg_not_if0 #(
			.L_y(936.8593)
		) wuwe_inst (
			.in(const0),
			.ena_n(oam_addr_parse_n),
			.y(oam_a1_n_tri)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) wuxe_inst (
			.in(xazy_n),
			.ena_n(sprite_sel2),
			.y(sprite_y_store2)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) wuxu_inst (
			.in(xave_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a2)
		);

	dmg_and2 #(
			.L_y(191.2498)
		) wuza_inst (
			.in1(ppu_wr),
			.in2(ff4b),
			.y(wuza)
		);

	dmg_not_x1 #(
			.L_y(1041.25)
		) wuzo_inst (
			.in(goro),
			.y(sprite_rst8)
		);

	dmg_not_if0 #(
			.L_y(1790.578)
		) wuzu_inst (
			.in(md0),
			.ena_n(azar),
			.y(oam_a_d0_n)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) wuzy_inst (
			.in(xadu_n),
			.ena_n(oam_rendering),
			.y(oam_render_a2)
		);

	dmg_nand5 #(
			.L_y(391.0002)
		) wybo_inst (
			.in1(ff4x),
			.in2(wado),
			.in3(wesa),
			.in4(walo),
			.in5(xera),
			.y(wybo)
		);

	dmg_not_x1 #(
			.L_y(980.4217)
		) wyce_inst (
			.in(vyre),
			.y(wyce)
		);

	dmg_not_x1 #(
			.L_y(198.9529)
		) wyco_inst (
			.in(suto),
			.y(wyco)
		);

	dmg_nand2 #(
			.L_y(112.6247)
		) wycy_inst (
			.in1(wusu),
			.in2(oam_wldrv_precharge_n),
			.y(wycy)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) wyda_inst (
			.in(xobe_n),
			.ena_n(oam_rendering),
			.y(oam_render_a5)
		);

	dmg_drlatch_ee #(
			.L_q(104.1252)
		) wyde_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(wyde),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(936.8593)
		) wydu_inst (
			.in(wefe_const1),
			.ena_n(oam_addr_render_n),
			.y(oam_a1_n_tri)
		);

	dmg_dffsr #(
			.L_q(176.6407)
		) wyfu_inst (
			.d(vosa),
			.clk(clkpipe),
			.s_n(xyru),
			.r_n(wevo),
			.q(wyfu),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3991.015)
		) wyga_inst (
			.in(xyju_n),
			.ena_n(abon),
			.y(ma7_n)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) wygo_inst (
			.in(gyno_n),
			.ena_n(sprite_sel7),
			.y(oam_render_a3)
		);

	dmg_dffsr #(
			.L_q(394.1873)
		) wyho_inst (
			.d(sprite_px_b3),
			.clk(clkpipe),
			.s_n(vexu),
			.r_n(xato),
			.q(sprite_px_b4),
			.q_n()
		);

	dmg_ao21 #(
			.L_y(410.1248)
		) wyja_inst (
			.in1(amab),
			.in2(ppu_wr),
			.in3(powu),
			.y(wyja)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) wyju_inst (
			.in(xymo_n),
			.ena_n(wyce),
			.y(d2)
		);

	dmg_dffr #(
			.L_q(176.6407),
			.L_q_n(444.3903)
		) wyka_inst (
			.d(wyka_n),
			.clk(wx_clk),
			.r_n(wx_rst_n),
			.q(wyka),
			.q_n(wyka_n)
		);

	dmg_dffr #(
			.L_q(172.9217),
			.L_q_n(284.4843)
		) wyko_inst (
			.d(wyko_n),
			.clk(wobo_n),
			.r_n(wx_rst_n),
			.q(wyko),
			.q_n(wyko_n)
		);

	dmg_not_if0 #(
			.L_y(4361.828)
		) wyky_inst (
			.in(d2),
			.ena_n(azul),
			.y(oam_b_d2_n)
		);

	dmg_or2 #(
			.L_y(481.8439)
		) wyla_inst (
			.in1(wase),
			.in2(weja),
			.y(wyla)
		);

	dmg_nand5 #(
			.L_y(145.5622)
		) wyle_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(xeno),
			.in4(walo),
			.in5(xera),
			.y(wyle)
		);

	dmg_not_x1 #(
			.L_y(796.6093)
		) wylu_inst (
			.in(duke),
			.y(wylu)
		);

	dmg_drlatch_ee #(
			.L_q(1436.234),
			.L_q_n(146.3593)
		) wymo_inst (
			.d(d5),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d5),
			.q_n(wymo_n)
		);

	dmg_drlatch_ee #(
			.L_q(245.7033)
		) wyna_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(wyna),
			.q_n()
		);

	dmg_dlatch #(
			.L_q(466.9685),
			.L_q_n(364.1723)
		) wyno_inst (
			.d(oam_a_d4_n),
			.ena(oam_data_latch),
			.q(wyno),
			.q_n(wyno_n)
		);

	dmg_or2 #(
			.L_y(33.73409)
		) wype_inst (
			.in1(hram_oe),
			.in2(hram_wr),
			.y(wype)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) wypo_inst (
			.in(vyxe_n),
			.ena_n(wyce),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(196.2967)
		) wyru_inst (
			.in(vumu),
			.y(wyru)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) wyse_inst (
			.in(xedy_n),
			.ena_n(oam_rendering),
			.y(oam_render_a3)
		);

	dmg_dlatch_ee #(
			.L_q_n(495.3902)
		) wyso_inst (
			.d(xafu),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(wyso_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(84.73484)
		) wyte_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(wyte_n)
		);

	dmg_nand5 #(
			.L_y(100.9376)
		) wyvo_inst (
			.in1(ff4x),
			.in2(xola),
			.in3(wesa),
			.in4(xusy),
			.in5(wepo),
			.y(wyvo)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) wywy_inst (
			.in(gacy_n),
			.ena_n(sprite_sel6),
			.y(oam_render_a3)
		);

	dmg_not_x1 #(
			.L_y(809.6248)
		) wyxa_inst (
			.in(weme),
			.y(save_sprite_x9)
		);

	dmg_or2 #(
			.L_y(389.6718)
		) wyxo_inst (
			.in1(sprite_save_en_n),
			.in2(gebu),
			.y(wyxo)
		);

	dmg_and2 #(
			.L_y(3405.314)
		) wyxy_inst (
			.in1(oam_a1),
			.in2(oam_a2_n),
			.y(oam_a2_na1)
		);

	dmg_xor #(
			.L_y(113.1563)
		) wyza_inst (
			.in1(wote),
			.in2(h6_n),
			.y(wyza)
		);

	dmg_and2 #(
			.L_y(123.7814)
		) wyze_inst (
			.in1(ppu_rd),
			.in2(ff4b),
			.y(wyze)
		);

	dmg_not_x1 #(
			.L_y(703.9061)
		) xaba_inst (
			.in(sprite_priority),
			.y(xaba)
		);

	dmg_drlatch_ee #(
			.L_q(113.1561)
		) xabe_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(xabe),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(146.6251)
		) xabo_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(xabo_n)
		);

	dmg_buf_if0 #(
			.L_y(31397.37)
		) xabu_inst (
			.in(yses_n),
			.ena_n(oam_b_rd_n),
			.y(d6)
		);

	dmg_buf_if0 #(
			.L_y(36878.58)
		) xaca_inst (
			.in(xyky_n),
			.ena_n(oam_a_rd_n),
			.y(d0)
		);

	dmg_not_x1 #(
			.L_y(1452.703)
		) xaco_inst (
			.in(xofo),
			.y(wx_rst_n)
		);

	dmg_not_x1 #(
			.L_y(2448.797)
		) xado_inst (
			.in(weny),
			.y(xado)
		);

	dmg_dffr_cc #(
			.L_q_n(126.9685)
		) xadu_inst (
			.d(oam_a2),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(xadu_n)
		);

	dmg_drlatch_ee #(
			.L_q(442.0002),
			.L_q_n(173.1874)
		) xafo_inst (
			.d(d3),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d3),
			.q_n(xafo_n)
		);

	dmg_dlatch #(
			.L_q(113.4218),
			.L_q_n(850.266)
		) xafu_inst (
			.d(oam_b_d5_n),
			.ena(oam_data_latch),
			.q(xafu),
			.q_n(xafu_n)
		);

	dmg_not_x1 #(
			.L_y(240.3909)
		) xaga_inst (
			.in(v5),
			.y(xaga)
		);

	dmg_nand3 #(
			.L_y(639.3597)
		) xage_inst (
			.in1(aror),
			.in2(sprite_x_match_l4),
			.in3(sprite_x_match_h4),
			.y(xage)
		);

	dmg_buf_if0 #(
			.L_y(35163.97)
		) xagu_inst (
			.in(yrum_n),
			.ena_n(oam_a_rd_n),
			.y(d1)
		);

	dmg_xor #(
			.L_y(117.9376)
		) xaha_inst (
			.in1(wyde),
			.in2(h6_n),
			.y(xaha)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) xahe_inst (
			.in(wobo),
			.ena_n(wuko),
			.y(ma2_n)
		);

	dmg_not_x1 #(
			.L_y(961.0315)
		) xaho_inst (
			.in(wacy),
			.y(sprite_rst6)
		);

	dmg_not_x1 #(
			.L_y(33.20313)
		) xahy_inst (
			.in(atej),
			.y(xahy)
		);

	dmg_and2 #(
			.L_y(140.25)
		) xajo_inst (
			.in1(h0),
			.in2(h3),
			.y(xajo)
		);

	dmg_not_if0 #(
			.L_y(33882.07)
		) xaju_inst (
			.in(obp0_d4_n),
			.ena_n(xozy),
			.y(d4)
		);

	dmg_drlatch_ee #(
			.L_q(141.0466)
		) xako_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(xako),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(776.1567)
		) xaku_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y7),
			.ena_n(wabe),
			.q(),
			.q_n(xaku_n)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) xaky_inst (
			.in(a0),
			.ena_n(xedu),
			.y(ma0_n)
		);

	dmg_nand2 #(
			.L_y(592.3436)
		) xala_inst (
			.in1(sprite_priority),
			.in2(sprite_on1),
			.y(xala)
		);

	dmg_dlatch_ee #(
			.L_q(213.2968),
			.L_q_n(162.0314)
		) xalo_inst (
			.d(d3),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d3),
			.q_n(obp0_d3_n)
		);

	dmg_nor3 #(
			.L_y(171.5935)
		) xaly_inst (
			.in1(a7),
			.in2(a5),
			.in3(a4),
			.y(xaly)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) xamo_inst (
			.in(wody),
			.ena_n(wuko),
			.y(ma1_n)
		);

	dmg_dlatch_ee #(
			.L_q(276.2502),
			.L_q_n(168.6718)
		) xana_inst (
			.d(d7),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d7),
			.q_n(obp0_d7_n)
		);

	dmg_nor2 #(
			.L_y(147.9537)
		) xane_inst (
			.in1(vram_to_oam),
			.in2(mode3),
			.y(xane)
		);

	dmg_not_x1 #(
			.L_y(135.9999)
		) xano_inst (
			.in(xugu),
			.y(xano)
		);

	dmg_not_x2 #(
			.L_y(5868.453)
		) xapo_inst (
			.in(xodo),
			.y(ppu_reset_n)
		);

	dmg_not_x1 #(
			.L_y(1556.297)
		) xare_inst (
			.in(ppu_hard_reset),
			.y(xare)
		);

	dmg_not_x2 #(
			.L_y(623.6874)
		) xaro_inst (
			.in(webu),
			.y(ff42)
		);

	dmg_not_if0 #(
			.L_y(36878.58)
		) xary_inst (
			.in(obp0_d0_n),
			.ena_n(xozy),
			.y(d0)
		);

	dmg_nand2 #(
			.L_y(218.0779)
		) xato_inst (
			.in1(wery),
			.in2(sprite_on4),
			.y(xato)
		);

	dmg_not_x1 #(
			.L_y(3082.048)
		) xatu_inst (
			.in(sprite_y_flip),
			.y(sprite_x6_n)
		);

	dmg_nor2 #(
			.L_y(149.5468)
		) xaty_inst (
			.in1(mode2),
			.in2(mode3),
			.y(xaty)
		);

	dmg_dlatch_ee #(
			.L_q_n(122.4533)
		) xave_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(xave_n)
		);

	dmg_xor #(
			.L_y(162.5628)
		) xavu_inst (
			.in1(wyna),
			.in2(h6_n),
			.y(xavu)
		);

	dmg_not_x2 #(
			.L_y(749.5936)
		) xavy_inst (
			.in(wavu),
			.y(ff43)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) xawo_inst (
			.in(obp0_d7_n),
			.ena_n(xozy),
			.y(d7)
		);

	dmg_not_if0 #(
			.L_y(31397.37)
		) xaxa_inst (
			.in(obp0_d6_n),
			.ena_n(xozy),
			.y(d6)
		);

	dmg_not_x2 #(
			.L_y(243.0467)
		) xayo_inst (
			.in(weta),
			.y(ff48)
		);

	dmg_not_x2 #(
			.L_y(750.6559)
		) xayu_inst (
			.in(wety),
			.y(ff45)
		);

	dmg_dlatch_ee #(
			.L_q_n(99.87506)
		) xazy_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y2),
			.ena_n(fuke),
			.q(),
			.q_n(xazy_n)
		);

	dmg_nor4 #(
			.L_y(135.9997)
		) xeba_inst (
			.in1(woju),
			.in2(yfun),
			.in3(wyza),
			.in4(ypuk),
			.y(sprite_x_match_h0)
		);

	dmg_not_x1 #(
			.L_y(160.4373)
		) xebe_inst (
			.in(ppu_hard_reset),
			.y(xebe)
		);

	dmg_not_if0 #(
			.L_y(31524.23)
		) xebu_inst (
			.in(xona_n),
			.ena_n(wyce),
			.y(d7)
		);

	dmg_not_if0 #(
			.L_y(4222.375)
		) xeca_inst (
			.in(a4),
			.ena_n(xedu),
			.y(ma4_n)
		);

	dmg_dffr_cc #(
			.L_q_n(108.6405)
		) xecu_inst (
			.d(oam_a7),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(xecu_n)
		);

	dmg_drlatch_ee #(
			.L_q(242.5154)
		) xecy_inst (
			.d(d7),
			.ena(waru),
			.ena_n(xuca),
			.r_n(xebe),
			.q(xecy),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(1750.735)
		) xeda_inst (
			.in(wate),
			.y(ff46)
		);

	dmg_not_x2 #(
			.L_y(2083.827)
		) xedu_inst (
			.in(xane),
			.y(xedu)
		);

	dmg_dffr_cc #(
			.L_q_n(126.9685)
		) xedy_inst (
			.d(oam_a3),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(xedy_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(90.57802)
		) xefe_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(xefe_n)
		);

	dmg_not_x1 #(
			.L_y(2468.187)
		) xefy_inst (
			.in(wuty),
			.y(xefy)
		);

	dmg_not_x1 #(
			.L_y(1463.328)
		) xega_inst (
			.in(cota),
			.y(xega)
		);

	dmg_dlatch_ee #(
			.L_q_n(94.56223)
		) xege_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(xege_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(907.1093)
		) xegu_inst (
			.d(yceb),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(xegu_n)
		);

	dmg_xor #(
			.L_y(182.2192)
		) xegy_inst (
			.in1(h2),
			.in2(xuke),
			.y(xegy)
		);

	dmg_not_if0 #(
			.L_y(3384.063)
		) xehe_inst (
			.in(yzab_n),
			.ena_n(abon),
			.y(ma11_n)
		);

	dmg_dffr #(
			.L_q(3134.907),
			.L_q_n(176.9063)
		) xeho_inst (
			.d(xeho_n),
			.clk(clkpipe),
			.r_n(h_reset_n),
			.q(h0),
			.q_n(xeho_n)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) xeja_inst (
			.in(wyka),
			.ena_n(wuko),
			.y(ma0_n)
		);

	dmg_xor #(
			.L_y(354.0782)
		) xeju_inst (
			.in1(wedu),
			.in2(h0_n),
			.y(xeju)
		);

	dmg_drlatch_ee #(
			.L_q(172.656)
		) xeka_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(xeka),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(35163.97)
		) xele_inst (
			.in(yceb_n),
			.ena_n(oam_b_rd_n),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(1282.704)
		) xelo_inst (
			.in(xoma),
			.y(xelo)
		);

	dmg_nand2 #(
			.L_y(352.2188)
		) xely_inst (
			.in1(sprite_priority),
			.in2(sprite_on5),
			.y(xely)
		);

	dmg_not_x1 #(
			.L_y(2646.953)
		) xemu_inst (
			.in(oam_a6_n_tri),
			.y(oam_a6)
		);

	dmg_not_x1 #(
			.L_y(167.344)
		) xena_inst (
			.in(sprite_x_match),
			.y(xena)
		);

	dmg_not_x1 #(
			.L_y(979.6257)
		) xeno_inst (
			.in(a1),
			.y(xeno)
		);

	dmg_not_x1 #(
			.L_y(130.9531)
		) xenu_inst (
			.in(sprite_priority),
			.y(xenu)
		);

	dmg_xor #(
			.L_y(140.5157)
		) xeny_inst (
			.in1(wuha),
			.in2(h5_n),
			.y(xeny)
		);

	dmg_drlatch_ee #(
			.L_q(237.2029)
		) xepa_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(xepa),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(255.2656)
		) xepe_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(xepe),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(131.75)
		) xepo_inst (
			.in(v1),
			.y(xepo)
		);

	dmg_buf_if0 #(
			.L_y(38893.62)
		) xepu_inst (
			.in(ysex_n),
			.ena_n(oam_a_rd_n),
			.y(d2)
		);

	dmg_not_x1 #(
			.L_y(1320.953)
		) xera_inst (
			.in(a3),
			.y(xera)
		);

	dmg_drlatch_ee #(
			.L_q(663.0007)
		) xere_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(xere),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) xero_inst (
			.in(xylo_n),
			.ena_n(wyce),
			.y(d1)
		);

	dmg_dlatch_ee #(
			.L_q(576.4061),
			.L_q_n(162.2969)
		) xeru_inst (
			.d(d4),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d4),
			.q_n(obp0_d4_n)
		);

	dmg_dffsr #(
			.L_q(1099.156)
		) xete_inst (
			.d(wyfu),
			.clk(clkpipe),
			.s_n(xuku),
			.r_n(wedy),
			.q(xete),
			.q_n()
		);

	dmg_xor #(
			.L_y(86.32832)
		) xeva_inst (
			.in1(weco),
			.in2(h7_n),
			.y(xeva)
		);

	dmg_drlatch_ee #(
			.L_q(848.4067)
		) xexa_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(xexa),
			.q_n()
		);

	dmg_nand2 #(
			.L_y(208.5154)
		) xexu_inst (
			.in1(wura),
			.in2(sprite_on5),
			.y(xexu)
		);

	dmg_and2 #(
			.L_y(130.422)
		) xeze_inst (
			.in1(tm_cy),
			.in2(in_window),
			.y(xeze)
		);

	dmg_not_if0 #(
			.L_y(4179.61)
		) xoba_inst (
			.in(a5),
			.ena_n(xedu),
			.y(ma5_n)
		);

	dmg_dffr_cc #(
			.L_q_n(122.9845)
		) xobe_inst (
			.d(oam_a5),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(xobe_n)
		);

	dmg_not_if0 #(
			.L_y(33777.41)
		) xobo_inst (
			.in(obp0_d5_n),
			.ena_n(xozy),
			.y(d5)
		);

	dmg_not_x2 #(
			.L_y(1226.39)
		) xoce_inst (
			.in(wosu),
			.y(xoce)
		);

	dmg_nand2 #(
			.L_y(211.9686)
		) xodo_inst (
			.in1(ff40_d7),
			.in2(xebe),
			.y(xodo)
		);

	dmg_dffr #(
			.L_q(1824.046)
		) xodu_inst (
			.d(xegy),
			.clk(clkpipe),
			.r_n(h_reset_n),
			.q(h2),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) xody_inst (
			.in(a3),
			.ena_n(xedu),
			.y(ma3_n)
		);

	dmg_nand3 #(
			.L_y(1258.001)
		) xofo_inst (
			.in1(ff40_d5),
			.in2(xahy),
			.in3(ppu_reset_n),
			.y(xofo)
		);

	dmg_not_x1 #(
			.L_y(135.4685)
		) xoga_inst (
			.in(sprite_priority),
			.y(xoga)
		);

	dmg_not_x2 #(
			.L_y(571.8913)
		) xogy_inst (
			.in(wyle),
			.y(ff44)
		);

	dmg_nor2 #(
			.L_y(432.703)
		) xoja_inst (
			.in1(ybez),
			.in2(weja),
			.y(xoja)
		);

	dmg_not_x1 #(
			.L_y(1167.422)
		) xojo_inst (
			.in(xelo),
			.y(xojo)
		);

	dmg_not_if0 #(
			.L_y(35163.97)
		) xoke_inst (
			.in(obp0_d1_n),
			.ena_n(xozy),
			.y(d1)
		);

	dmg_not_x1 #(
			.L_y(1012.828)
		) xola_inst (
			.in(a0),
			.y(xola)
		);

	dmg_nand2 #(
			.L_y(285.5471)
		) xole_inst (
			.in1(wyco),
			.in2(sprite_on5),
			.y(xole)
		);

	dmg_dffr #(
			.L_q(453.6877),
			.L_q_n(175.0472)
		) xolo_inst (
			.d(xolo_n),
			.clk(wyko_n),
			.r_n(wx_rst_n),
			.q(xolo),
			.q_n(xolo_n)
		);

	dmg_drlatch_ee #(
			.L_q(231.0937)
		) xoly_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(xoly),
			.q_n()
		);

	dmg_and2 #(
			.L_y(180.3598)
		) xoma_inst (
			.in1(ppu_wr),
			.in2(ff48),
			.y(xoma)
		);

	dmg_drlatch_ee #(
			.L_q(103.5938)
		) xomy_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(xomy),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(2020.078),
			.L_q_n(193.375)
		) xona_inst (
			.d(d7),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d7),
			.q_n(xona_n)
		);

	dmg_and2 #(
			.L_y(1356.282)
		) xono_inst (
			.in1(sprite_x_flip),
			.in2(sp_bp_cys),
			.y(xono)
		);

	dmg_not_if0 #(
			.L_y(3824.736)
		) xonu_inst (
			.in(bp_sel),
			.ena_n(xucy),
			.y(ma0_n)
		);

	dmg_not_if0 #(
			.L_y(4309.501)
		) xopo_inst (
			.in(a6),
			.ena_n(xedu),
			.y(ma6_n)
		);

	dmg_xor #(
			.L_y(175.8436)
		) xora_inst (
			.in1(h3),
			.in2(xyle),
			.y(xora)
		);

	dmg_not_x2 #(
			.L_y(1590.829)
		) xore_inst (
			.in(ppu_hard_reset_n),
			.y(ppu_hard_reset)
		);

	dmg_xor #(
			.L_y(186.4689)
		) xosu_inst (
			.in1(ycol),
			.in2(h0_n),
			.y(xosu)
		);

	dmg_dlatch_ee #(
			.L_q_n(144.766)
		) xosy_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y2),
			.ena_n(fuke),
			.q(),
			.q_n(xosy_n)
		);

	dmg_not_x1 #(
			.L_y(430.3126)
		) xota_inst (
			.in(xyva),
			.y(xota)
		);

	dmg_dlatch_ee #(
			.L_q_n(309.9841)
		) xote_inst (
			.d(yses),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(xote_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(129.6249)
		) xotu_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(xotu_n)
		);

	dmg_dlatch_ee #(
			.L_q(203.9998),
			.L_q_n(83.40623)
		) xova_inst (
			.d(d2),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d2),
			.q_n(obp0_d2_n)
		);

	dmg_not_x1 #(
			.L_y(1798.547)
		) xovu_inst (
			.in(wope),
			.y(sprite_on7)
		);

	dmg_not_x1 #(
			.L_y(276.7816)
		) xowo_inst (
			.in(v7),
			.y(xowo)
		);

	dmg_not_x1 #(
			.L_y(1209.657)
		) xozy_inst (
			.in(xufy),
			.y(xozy)
		);

	dmg_not_x1 #(
			.L_y(855.5782)
		) xubo_inst (
			.in(waru),
			.y(xubo)
		);

	dmg_not_if0 #(
			.L_y(33977.16)
		) xuby_inst (
			.in(obp0_d3_n),
			.ena_n(xozy),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(139.187)
		) xuca_inst (
			.in(waru),
			.y(xuca)
		);

	dmg_not_x1 #(
			.L_y(339.9999)
		) xuce_inst (
			.in(v6),
			.y(xuce)
		);

	dmg_xor #(
			.L_y(135.4685)
		) xuco_inst (
			.in1(ymem),
			.in2(h2_n),
			.y(xuco)
		);

	dmg_nand2 #(
			.L_y(410.3905)
		) xucy_inst (
			.in1(bp_cy),
			.in2(in_window),
			.y(xucy)
		);

	dmg_dffr #(
			.L_q(279.9688)
		) xudy_inst (
			.d(gono),
			.clk(wuty),
			.r_n(byva),
			.q(xudy),
			.q_n()
		);

	dmg_and2 #(
			.L_y(126.4376)
		) xufa_inst (
			.in1(ppu_wr),
			.in2(ff45),
			.y(xufa)
		);

	dmg_dlatch_ee #(
			.L_q_n(90.31213)
		) xufo_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(xufo_n)
		);

	dmg_dlatch_ee #(
			.L_q(168.4062),
			.L_q_n(172.656)
		) xufu_inst (
			.d(d0),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d0),
			.q_n(obp0_d0_n)
		);

	dmg_and2 #(
			.L_y(162.2971)
		) xufy_inst (
			.in1(ppu_rd),
			.in2(ff48),
			.y(xufy)
		);

	dmg_nand5 #(
			.L_y(484.2347)
		) xugu_inst (
			.in1(h0),
			.in2(h1),
			.in3(h2),
			.in4(h5),
			.in5(h7),
			.y(xugu)
		);

	dmg_not_x1 #(
			.L_y(1351.5)
		) xuha_inst (
			.in(nofu),
			.y(bp_sel)
		);

	dmg_not_x1 #(
			.L_y(135.7344)
		) xuho_inst (
			.in(sprite_priority),
			.y(xuho)
		);

	dmg_not_x1 #(
			.L_y(221.797)
		) xuhy_inst (
			.in(v3),
			.y(xuhy)
		);

	dmg_not_x1 #(
			.L_y(1007.25)
		) xuja_inst (
			.in(wefy),
			.y(xuja)
		);

	dmg_or2 #(
			.L_y(172.1249)
		) xujo_inst (
			.in1(sprite_save_en_n),
			.in2(womu),
			.y(xujo)
		);

	dmg_not_x1 #(
			.L_y(592.0782)
		) xujy_inst (
			.in(vape),
			.y(xujy)
		);

	dmg_and2 #(
			.L_y(129.6249)
		) xuke_inst (
			.in1(h0),
			.in2(h1),
			.y(xuke)
		);

	dmg_nand2 #(
			.L_y(291.3908)
		) xuku_inst (
			.in1(sprite_priority),
			.in2(sprite_on4),
			.y(xuku)
		);

	dmg_dlatch_ee #(
			.L_q(603.7655),
			.L_q_n(118.4687)
		) xuky_inst (
			.d(d1),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d1),
			.q_n(obp0_d1_n)
		);

	dmg_and2 #(
			.L_y(1767.734)
		) xula_inst (
			.in1(ff40_d1),
			.in2(sprite_px_b7),
			.y(xula)
		);

	dmg_not_if0 #(
			.L_y(4579.906)
		) xulo_inst (
			.in(wyko),
			.ena_n(wuko),
			.y(ma3_n)
		);

	dmg_buf_if0 #(
			.L_y(33882.07)
		) xuna_inst (
			.in(wyno_n),
			.ena_n(oam_a_rd_n),
			.y(d4)
		);

	dmg_not_if0 #(
			.L_y(38893.62)
		) xuno_inst (
			.in(obp0_d2_n),
			.ena_n(xozy),
			.y(d2)
		);

	dmg_drlatch_ee #(
			.L_q(213.0312)
		) xuny_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(xuny),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(1829.359)
		) xupa_inst (
			.in(wuje),
			.y(xupa)
		);

	dmg_dlatch_ee #(
			.L_q(480.7811),
			.L_q_n(137.0624)
		) xupo_inst (
			.d(d6),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d6),
			.q_n(obp0_d6_n)
		);

	dmg_not_x2 #(
			.L_y(2186.891)
		) xupy_inst (
			.in(wuvu_n),
			.y(xupy)
		);

	dmg_not_x2 #(
			.L_y(397.1095)
		) xuqu_inst (
			.in(vonu_n),
			.y(xuqu)
		);

	dmg_not_x1 #(
			.L_y(131.7498)
		) xura_inst (
			.in(sprite_priority),
			.y(xura)
		);

	dmg_not_x1 #(
			.L_y(1043.641)
		) xure_inst (
			.in(xubo),
			.y(xure)
		);

	dmg_drlatch_ee #(
			.L_q(384.8907)
		) xury_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(xury),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(1002.469)
		) xuso_inst (
			.d(ydyv),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(xuso_n)
		);

	dmg_not_x1 #(
			.L_y(928.3592)
		) xusy_inst (
			.in(a2),
			.y(xusy)
		);

	dmg_dlatch_ee #(
			.L_q_n(171.8592)
		) xute_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(xute_n)
		);

	dmg_and2 #(
			.L_y(130.9529)
		) xuto_inst (
			.in1(fexx),
			.in2(ppu_wr),
			.y(xuto)
		);

	dmg_dffr #(
		) xuva_inst (
			.d(xecy),
			.clk(dma_phi2),
			.r_n(xare),
			.q(),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(33977.16)
		) xuvo_inst (
			.in(wone_n),
			.ena_n(oam_b_rd_n),
			.y(d3)
		);

	dmg_drlatch_ee #(
			.L_q(712.1408)
		) xuvy_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(xuvy),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(781.2035)
		) xuxa_inst (
			.in(geny),
			.y(save_sprite_num0)
		);

	dmg_not_if0 #(
			.L_y(3796.843)
		) xuxu_inst (
			.in(a1),
			.ena_n(xedu),
			.y(ma1_n)
		);

	dmg_drlatch_ee #(
			.L_q(705.7661)
		) xuzo_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(xuzo),
			.q_n()
		);

	dmg_drlatch_ee #(
			.L_q(108.9062)
		) xyba_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x3),
			.ena_n(yfag),
			.r_n(sprite_rst3),
			.q(xyba),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3991.015)
		) xybo_inst (
			.in(a7),
			.ena_n(xedu),
			.y(ma7_n)
		);

	dmg_dffr #(
			.L_q(3179.532)
		) xydo_inst (
			.d(xora),
			.clk(clkpipe),
			.r_n(h_reset_n),
			.q(h3),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(240.1248)
		) xyfe_inst (
			.d(oam_render_a4),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(xyfe_n)
		);

	dmg_not_x1 #(
			.L_y(140.2498)
		) xyfy_inst (
			.in(xota),
			.y(xyfy)
		);

	dmg_dlatch_ee #(
			.L_q_n(86.06224)
		) xygo_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y7),
			.ena_n(wabe),
			.q(),
			.q_n(xygo_n)
		);

	dmg_buf_if0 #(
			.L_y(33977.16)
		) xygu_inst (
			.in(yvel_n),
			.ena_n(oam_a_rd_n),
			.y(d3)
		);

	dmg_not_x1 #(
			.L_y(420.4844)
		) xyha_inst (
			.in(gusa),
			.y(xyha)
		);

	dmg_dlatch_ee #(
			.L_q_n(465.6406)
		) xyju_inst (
			.d(\wone ),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(xyju_n)
		);

	dmg_not_x1 #(
			.L_y(145.031)
		) xyke_inst (
			.in(sprite_priority),
			.y(xyke)
		);

	dmg_dlatch #(
			.L_q(559.1411),
			.L_q_n(191.7813)
		) xyky_inst (
			.d(oam_a_d0_n),
			.ena(oam_data_latch),
			.q(xyky),
			.q_n(xyky_n)
		);

	dmg_or2 #(
			.L_y(307.0624)
		) xyla_inst (
			.in1(wuna),
			.in2(wuto),
			.y(xyla)
		);

	dmg_and2 #(
			.L_y(421.5466)
		) xyle_inst (
			.in1(xuke),
			.in2(h2),
			.y(xyle)
		);

	dmg_drlatch_ee #(
			.L_q(1590.828),
			.L_q_n(98.54706)
		) xylo_inst (
			.d(d1),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d1),
			.q_n(xylo_n)
		);

	dmg_and2 #(
			.L_y(131.2188)
		) xyly_inst (
			.in1(ppu_rd),
			.in2(ff45),
			.y(xyly)
		);

	dmg_not_x2 #(
			.L_y(2054.345)
		) xyme_inst (
			.in(xoja),
			.y(sprite_sel6)
		);

	dmg_drlatch_ee #(
			.L_q(1344.063),
			.L_q_n(149.2811)
		) xymo_inst (
			.d(d2),
			.ena(xure),
			.ena_n(xubo),
			.r_n(xare),
			.q(ff40_d2),
			.q_n(xymo_n)
		);

	dmg_nor_latch #(
			.L_q_n(10643.86)
		) xymu_inst (
			.s(wego),
			.r(stop_oam_parsing),
			.q(),
			.q_n(mode3)
		);

	dmg_dlatch_ee #(
			.L_q_n(90.31255)
		) xyna_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y7),
			.ena_n(wabe),
			.q(),
			.q_n(xyna_n)
		);

	dmg_not_if0 #(
			.L_y(4384.408)
		) xyne_inst (
			.in(a2),
			.ena_n(xedu),
			.y(ma2_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(94.56244)
		) xynu_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num4),
			.ena_n(wylu),
			.q(),
			.q_n(xynu_n)
		);

	dmg_not_x1 #(
			.L_y(448.6408)
		) xyny_inst (
			.in(dma_phi_n),
			.y(dma_phi2)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) xyra_inst (
			.in(xotu_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a5)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) xyre_inst (
			.in(xabo_n),
			.ena_n(sprite_sel4),
			.y(oam_render_a5)
		);

	dmg_nand2 #(
			.L_y(279.4372)
		) xyru_inst (
			.in1(sprite_priority),
			.in2(sprite_on3),
			.y(xyru)
		);

	dmg_not_x1 #(
			.L_y(1198.234)
		) xyso_inst (
			.in(wojo),
			.y(xyso)
		);

	dmg_not_if0 #(
			.L_y(4592.656)
		) xyto_inst (
			.in(d6),
			.ena_n(azul),
			.y(oam_b_d6_n)
		);

	dmg_not_x1 #(
			.L_y(48.34374)
		) xyva_inst (
			.in(ppu_4mhz),
			.y(xyva)
		);

	dmg_nand2 #(
			.L_y(217.5465)
		) xyve_inst (
			.in1(wamy),
			.in2(sprite_on7),
			.y(xyve)
		);

	dmg_and2 #(
			.L_y(1700)
		) xyvo_inst (
			.in1(v4),
			.in2(v7),
			.y(vbl)
		);

	dmg_dlatch_ee #(
			.L_q(358.5933),
			.L_q_n(169.203)
		) xyze_inst (
			.d(d5),
			.ena(xojo),
			.ena_n(xelo),
			.q(obp0_d5),
			.q_n(obp0_d5_n)
		);

	dmg_not_x1 #(
		) yaza_inst (
			.in(t1_nt2),
			.y(yaza)
		);

	dmg_drlatch_ee #(
			.L_q(170.2655)
		) ybed_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(ybed),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(105.9843)
		) yber_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(yber_n)
		);

	dmg_nand3 #(
			.L_y(733.6563)
		) ybez_inst (
			.in1(aror),
			.in2(sprite_x_match_l6),
			.in3(sprite_x_match_h6),
			.y(ybez)
		);

	dmg_dlatch_ee #(
			.L_q_n(469.0936)
		) ybog_inst (
			.d(zaxe),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(ybog_n)
		);

	dmg_not_x1 #(
			.L_y(1665.47)
		) ybor_inst (
			.in(wave_ram_rd_n),
			.y(ybor)
		);

	dmg_xor #(
			.L_y(69.32835)
		) ybox_inst (
			.in1(xury),
			.in2(h3_n),
			.y(ybox)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) ybuk_inst (
			.in(zumy_n),
			.ena_n(sprite_sel6),
			.y(sprite_y_store0)
		);

	dmg_eco_nand2 #(
		) ybyw_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_xor #(
			.L_y(129.0938)
		) ycah_inst (
			.in1(xyba),
			.in2(h1_n),
			.y(ycah)
		);

	dmg_eco_nand2 #(
		) ycaw_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_dlatch #(
			.L_q(503.6252),
			.L_q_n(485.031)
		) yceb_inst (
			.d(oam_b_d1_n),
			.ena(oam_data_latch),
			.q(yceb),
			.q_n(yceb_n)
		);

	dmg_drlatch_ee #(
			.L_q(135.9999)
		) ycol_inst (
			.d(sprite_x0_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(ycol),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(67.46898)
		) ycux_inst (
			.in(ch3_active),
			.y(ycux)
		);

	dmg_dffsr #(
		) ycym_inst (
			.d(vdd),
			.clk(vdd),
			.s_n(vdd),
			.r_n(gnd),
			.q(),
			.q_n()
		);

	dmg_xor #(
			.L_y(129.3592)
		) ydaj_inst (
			.in1(xabe),
			.in2(h2_n),
			.y(ydaj)
		);

	dmg_not_x1 #(
			.L_y(1108.719)
		) ydez_inst (
			.in(wave_ram_wr_n),
			.y(wave_ram_wr2)
		);

	dmg_not_x1 #(
			.L_y(81.01591)
		) ydod_inst (
			.in(wave_a0),
			.y(ydod)
		);

	dmg_eco_nand2 #(
		) ydos_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_nor4 #(
			.L_y(461.9217)
		) ydot_inst (
			.in1(xosu),
			.in2(zuvu),
			.in3(xuco),
			.in4(zulo),
			.y(sprite_x_match_l6)
		);

	dmg_dffr_cc #(
			.L_q_n(212.2345)
		) yduf_inst (
			.d(oam_a6),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(yduf_n)
		);

	dmg_nand3 #(
			.L_y(1199.032)
		) ydug_inst (
			.in1(aror),
			.in2(sprite_x_match_l0),
			.in3(sprite_x_match_h0),
			.y(ydug)
		);

	dmg_dlatch #(
			.L_q(508.406),
			.L_q_n(478.6559)
		) ydyv_inst (
			.d(oam_b_d0_n),
			.ena(oam_data_latch),
			.q(ydyv),
			.q_n(ydyv_n)
		);

	dmg_not_x1 #(
			.L_y(743.4841)
		) yfag_inst (
			.in(gusa),
			.y(yfag)
		);

	dmg_eco_nand2 #(
		) yfal_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_buf_if0 #(
			.L_y(36878.58)
		) yfap_inst (
			.in(ydyv_n),
			.ena_n(oam_b_rd_n),
			.y(d0)
		);

	dmg_dffr #(
			.L_q(813.3438),
			.L_q_n(305.2031)
		) yfel_inst (
			.d(yfel_n),
			.clk(gava),
			.r_n(oam_parse_reset_n),
			.q(oam_parse_a2),
			.q_n(yfel_n)
		);

	dmg_not_x1 #(
			.L_y(3056.547)
		) yfoc_inst (
			.in(oam_a3_n_tri),
			.y(oam_a3)
		);

	dmg_xor #(
			.L_y(211.9686)
		) yfop_inst (
			.in1(xuzo),
			.in2(h2_n),
			.y(yfop)
		);

	dmg_not_x1 #(
			.L_y(1583.656)
		) yfot_inst (
			.in(oam_a2_n_tri),
			.y(oam_a2)
		);

	dmg_xor #(
			.L_y(113.6875)
		) yfun_inst (
			.in1(xuny),
			.in2(h5_n),
			.y(yfun)
		);

	dmg_and2 #(
			.L_y(895.6876)
		) yfux_inst (
			.in1(ynys),
			.in2(wave_a0),
			.y(wave_a1_na0)
		);

	dmg_drlatch_ee #(
			.L_q(297.4999)
		) ygaj_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(ygaj),
			.q_n()
		);

	dmg_and2 #(
			.L_y(924.6404)
		) ygef_inst (
			.in1(wave_a1),
			.in2(ydod),
			.y(wave_a1a0_n)
		);

	dmg_nand3 #(
			.L_y(706.2972)
		) ygem_inst (
			.in1(aror),
			.in2(sprite_x_match_l9),
			.in3(sprite_x_match_h9),
			.y(ygem)
		);

	dmg_dlatch_ee #(
			.L_q_n(177.9687)
		) ygum_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y7),
			.ena_n(wabe),
			.q(),
			.q_n(ygum_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(120.3281)
		) ygus_inst (
			.d(oam_render_a7),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(ygus_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) yhal_inst (
			.in(xufo_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a7)
		);

	dmg_and2 #(
			.L_y(49.40647)
		) yhej_inst (
			.in1(wave_ram_bl_precharge_n),
			.in2(wave_ram_wr2),
			.y(yhej)
		);

	dmg_eco_nand2 #(
		) yhes_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_xor #(
			.L_y(146.8906)
		) yhok_inst (
			.in1(xoly),
			.in2(h0_n),
			.y(yhok)
		);

	dmg_dffsr #(
		) yhyb_inst (
			.d(vdd),
			.clk(vdd),
			.s_n(vdd),
			.r_n(gnd),
			.q(),
			.q_n()
		);

	dmg_eco_nand2 #(
		) yjag_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_and2 #(
			.L_y(951.9995)
		) yjej_inst (
			.in1(wave_a1),
			.in2(wave_a0),
			.y(wave_a1a0)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) yjem_inst (
			.in(zene_n),
			.ena_n(sprite_sel3),
			.y(sprite_y_store2)
		);

	dmg_dlatch_ee #(
			.L_q_n(1059.313)
		) yjex_inst (
			.d(zuca),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(yjex_n)
		);

	dmg_nor4 #(
			.L_y(231.6246)
		) ykok_inst (
			.in1(zyku),
			.in2(zypu),
			.in3(xaha),
			.in4(zefe),
			.y(sprite_x_match_h4)
		);

	dmg_eco_nand2 #(
		) ykor_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) ykoz_inst (
			.in(zafu_n),
			.ena_n(sprite_sel6),
			.y(sprite_y_store1)
		);

	dmg_dlatch_ee #(
			.L_q_n(229.7657)
		) ykuk_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y2),
			.ena_n(fuke),
			.q(),
			.q_n(ykuk_n)
		);

	dmg_eco_nand2 #(
		) ykus_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_eco_nand2 #(
		) ykyt_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_and2 #(
			.L_y(30.28144)
		) ylac_inst (
			.in1(ysod),
			.in2(ycux),
			.y(ylac)
		);

	dmg_drlatch_ee #(
			.L_q(188.3282)
		) ylah_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(ylah),
			.q_n()
		);

	dmg_nor4 #(
			.L_y(137.8594)
		) ylev_inst (
			.in1(ymam),
			.in2(ytyp),
			.in3(yfop),
			.in4(yvac),
			.y(sprite_x_match_l9)
		);

	dmg_eco_nand2 #(
		) yloh_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_dlatch_ee #(
			.L_q_n(237.7343)
		) ylor_inst (
			.d(xyky),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(ylor_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(160.9687)
		) ylov_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y2),
			.ena_n(fuke),
			.q(),
			.q_n(ylov_n)
		);

	dmg_nand3 #(
			.L_y(772.1721)
		) yloz_inst (
			.in1(aror),
			.in2(sprite_x_match_l3),
			.in3(sprite_x_match_h3),
			.y(yloz)
		);

	dmg_and2 #(
			.L_y(596.5942)
		) ylyc_inst (
			.in1(wyja),
			.in2(geka),
			.y(ylyc)
		);

	dmg_xor #(
			.L_y(213.8282)
		) ymam_inst (
			.in1(xuvy),
			.in2(h0_n),
			.y(ymam)
		);

	dmg_and2 #(
			.L_y(81.54707)
		) ymaw_inst (
			.in1(wave_ram_bl_precharge_n),
			.in2(ybor),
			.y(ymaw)
		);

	dmg_eco_nand2 #(
		) ymeb_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_drlatch_ee #(
			.L_q(95.35927)
		) ymem_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(ymem),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(2668.735)
		) ymev_inst (
			.in(oam_a5_n_tri),
			.y(oam_a5)
		);

	dmg_or2 #(
			.L_y(482.1098)
		) ymul_inst (
			.in1(ylac),
			.in2(ytyl),
			.y(wave_ram_wldrv_precharge_n)
		);

	dmg_nor4 #(
			.L_y(253.9372)
		) ynaz_inst (
			.in1(xeju),
			.in2(zate),
			.in3(zaku),
			.in4(ybox),
			.y(sprite_x_match_l4)
		);

	dmg_drlatch_ee #(
			.L_q(510.2659)
		) ynep_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(ynep),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) ynev_inst (
			.in(xyfe_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a4)
		);

	dmg_eco_nand2 #(
		) ynuj_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_not_x1 #(
			.L_y(163.3592)
		) ynur_inst (
			.in(wave_a3),
			.y(wave_a3_n)
		);

	dmg_and2 #(
			.L_y(554.8908)
		) ynyc_inst (
			.in1(wafo),
			.in2(wyja),
			.y(ynyc)
		);

	dmg_not_x1 #(
			.L_y(76.23425)
		) ynys_inst (
			.in(wave_a1),
			.y(ynys)
		);

	dmg_eco_nand2 #(
		) ynyv_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_drlatch_ee #(
			.L_q(528.3282)
		) ypod_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(ypod),
			.q_n()
		);

	dmg_buf_if0 #(
			.L_y(38893.62)
		) ypon_inst (
			.in(zuca_n),
			.ena_n(oam_b_rd_n),
			.y(d2)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) ypoz_inst (
			.in(ygum_n),
			.ena_n(sprite_sel7),
			.y(sprite_y_store1)
		);

	dmg_xor #(
			.L_y(94.82771)
		) ypuk_inst (
			.in1(xako),
			.in2(h7_n),
			.y(ypuk)
		);

	dmg_not_x1 #(
			.L_y(3396.017)
		) ypur_inst (
			.in(zyve_n),
			.y(sprite_x2_n)
		);

	dmg_drlatch_ee #(
			.L_q(111.0311)
		) yrac_inst (
			.d(sprite_x1_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(yrac),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) yrad_inst (
			.in(xute_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a6)
		);

	dmg_not_x1 #(
			.L_y(1658.033)
		) yrar_inst (
			.in(wave_ram_bl_precharge),
			.y(wave_ram_bl_precharge_n)
		);

	dmg_drlatch_ee #(
			.L_q(520.0938)
		) yrop_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(yrop),
			.q_n()
		);

	dmg_dlatch #(
			.L_q(406.1409),
			.L_q_n(280.5002)
		) yrum_inst (
			.d(oam_a_d1_n),
			.ena(oam_data_latch),
			.q(yrum),
			.q_n(yrum_n)
		);

	dmg_not_x1 #(
			.L_y(124.0472)
		) yryv_inst (
			.in(yval),
			.y(yryv)
		);

	dmg_dlatch #(
			.L_q(299.6252),
			.L_q_n(405.8752)
		) yses_inst (
			.d(oam_b_d6_n),
			.ena(oam_data_latch),
			.q(yses),
			.q_n(yses_n)
		);

	dmg_dlatch #(
			.L_q(500.9691),
			.L_q_n(277.578)
		) ysex_inst (
			.d(oam_a_d2_n),
			.ena(oam_data_latch),
			.q(ysex),
			.q_n(ysex_n)
		);

	dmg_or2 #(
			.L_y(57.64078)
		) ysod_inst (
			.in1(yhej),
			.in2(ymaw),
			.y(ysod)
		);

	dmg_dlatch_ee #(
			.L_q_n(120.8597)
		) ysok_inst (
			.d(oam_render_a6),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(ysok_n)
		);

	dmg_not_x1 #(
			.L_y(769.5157)
		) ysum_inst (
			.in(ywok),
			.y(ysum)
		);

	dmg_eco_nand2 #(
		) ytob_inst (
			.in1(vdd),
			.in2(vdd),
			.y()
		);

	dmg_eco_nand2 #(
		) ytor_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_nor4 #(
			.L_y(73.57784)
		) ytub_inst (
			.in1(zywu),
			.in2(zuza),
			.in3(zejo),
			.in4(zeda),
			.y(sprite_x_match_h9)
		);

	dmg_buf_if0 #(
			.L_y(31524.23)
		) ytux_inst (
			.in(zeca_n),
			.ena_n(oam_b_rd_n),
			.y(d7)
		);

	dmg_and2 #(
			.L_y(63.48497)
		) ytyl_inst (
			.in1(ymaw),
			.in2(ch3_active),
			.y(ytyl)
		);

	dmg_xor #(
			.L_y(203.4684)
		) ytyp_inst (
			.in1(xere),
			.in2(h1_n),
			.y(ytyp)
		);

	dmg_and3 #(
			.L_y(1900.813)
		) yula_inst (
			.in1(yaza),
			.in2(boot_sel),
			.in3(cpu_rd),
			.y(yula)
		);

	dmg_xor #(
			.L_y(117.1407)
		) yvac_inst (
			.in1(xexa),
			.in2(h3_n),
			.y(yvac)
		);

	dmg_drlatch_ee #(
			.L_q(165.7502)
		) yvag_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(yvag),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(82.87487)
		) yval_inst (
			.in(oam_data_latch),
			.y(yval)
		);

	dmg_xor #(
			.L_y(60.2974)
		) yvap_inst (
			.in1(xomy),
			.in2(h4_n),
			.y(yvap)
		);

	dmg_dlatch #(
			.L_q(673.8907),
			.L_q_n(387.8123)
		) yvel_inst (
			.d(oam_a_d3_n),
			.ena(oam_data_latch),
			.q(yvel),
			.q_n(yvel_n)
		);

	dmg_not_x1 #(
			.L_y(3289.766)
		) yvok_inst (
			.in(zezy_n),
			.y(sprite_x3_n)
		);

	dmg_not_x1 #(
			.L_y(2541.235)
		) yvom_inst (
			.in(oam_a4_n_tri),
			.y(oam_a4)
		);

	dmg_and2 #(
			.L_y(868.0634)
		) yvop_inst (
			.in1(ynys),
			.in2(ydod),
			.y(wave_a1_na0_n)
		);

	dmg_not_if0 #(
			.L_y(3245.672)
		) yvuc_inst (
			.in(d6),
			.ena_n(azul),
			.y(oam_a_d6_n)
		);

	dmg_xor #(
			.L_y(147.4218)
		) yvuz_inst (
			.in1(xeka),
			.in2(h3_n),
			.y(yvuz)
		);

	dmg_dlatch_ee #(
			.L_q_n(188.328)
		) ywak_inst (
			.d(oam_render_a2),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(ywak_n)
		);

	dmg_nor4 #(
			.L_y(173.7188)
		) ywap_inst (
			.in1(zygo),
			.in2(zemu),
			.in3(zare),
			.in4(zuzy),
			.y(sprite_x_match_h6)
		);

	dmg_not_if0 #(
			.L_y(5515.97)
		) ywav_inst (
			.in(zylu_n),
			.ena_n(sprite_sel3),
			.y(sprite_y_store1)
		);

	dmg_buf_if0 #(
			.L_y(33777.41)
		) yweg_inst (
			.in(xafu_n),
			.ena_n(oam_b_rd_n),
			.y(d5)
		);

	dmg_not_x1 #(
			.L_y(927.8282)
		) ywok_inst (
			.in(cota),
			.y(ywok)
		);

	dmg_nor4 #(
			.L_y(131.219)
		) ywos_inst (
			.in1(yvap),
			.in2(xeny),
			.in3(xavu),
			.in4(xeva),
			.y(sprite_x_match_h3)
		);

	dmg_eco_nand2 #(
		) yxaj_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_eco_nand2 #(
		) yxow_inst (
			.in1(gnd),
			.in2(gnd),
			.y()
		);

	dmg_dlatch_ee #(
			.L_q_n(247.8284)
		) yzab_inst (
			.d(zeca),
			.ena(ysum),
			.ena_n(ywok),
			.q(),
			.q_n(yzab_n)
		);

	dmg_not_x1 #(
			.L_y(163.8906)
		) yzeg_inst (
			.in(wave_a2),
			.y(wave_a2_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(111.8285)
		) yzep_inst (
			.d(oam_render_a5),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(yzep_n)
		);

	dmg_not_x1 #(
			.L_y(2712.829)
		) yzet_inst (
			.in(oam_a7_n_tri),
			.y(oam_a7)
		);

	dmg_drlatch_ee #(
			.L_q(628.2032)
		) yzof_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x9),
			.ena_n(weme),
			.r_n(sprite_rst9),
			.q(yzof),
			.q_n()
		);

	dmg_dlatch_ee #(
			.L_q_n(106.7812)
		) yzor_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num9),
			.ena_n(wufa),
			.q(),
			.q_n(yzor_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(1504.5)
		) yzos_inst (
			.d(zuve),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(sprite_y_flip)
		);

	dmg_not_x1 #(
			.L_y(1147.766)
		) zabu_inst (
			.in(a3),
			.y(bootrom_a3_n)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) zaby_inst (
			.in(ykuk_n),
			.ena_n(sprite_sel2),
			.y(sprite_y_store3)
		);

	dmg_nand2 #(
			.L_y(112.0938)
		) zado_inst (
			.in1(zufa),
			.in2(yula),
			.y(zado)
		);

	dmg_nor4 #(
			.L_y(110.7658)
		) zadu_inst (
			.in1(a11),
			.in2(a10),
			.in3(a9),
			.in4(a8),
			.y(zadu)
		);

	dmg_dlatch_ee #(
			.L_q_n(156.7188)
		) zafu_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y6),
			.ena_n(zuru),
			.q(),
			.q_n(zafu_n)
		);

	dmg_not_x1 #(
			.L_y(870.1876)
		) zage_inst (
			.in(a6),
			.y(bootrom_a6_n)
		);

	dmg_not_x1 #(
			.L_y(3645.703)
		) zago_inst (
			.in(ylor_n),
			.y(sprite_x0_n)
		);

	dmg_xor #(
			.L_y(143.9683)
		) zaha_inst (
			.in1(zola),
			.in2(h2_n),
			.y(zaha)
		);

	dmg_not_if0 #(
			.L_y(4690.937)
		) zaja_inst (
			.in(d3),
			.ena_n(azul),
			.y(oam_b_d3_n)
		);

	dmg_and2 #(
			.L_y(35.32817)
		) zaje_inst (
			.in1(bootrom_a1_n),
			.in2(a0),
			.y(bootrom_a1_na0)
		);

	dmg_nor4 #(
			.L_y(156.7192)
		) zako_inst (
			.in1(zogy),
			.in2(zeba),
			.in3(zaha),
			.in4(zoky),
			.y(sprite_x_match_l0)
		);

	dmg_xor #(
			.L_y(359.9224)
		) zaku_inst (
			.in1(zyjo),
			.in2(h2_n),
			.y(zaku)
		);

	dmg_not_if0 #(
			.L_y(2693.172)
		) zaky_inst (
			.in(d1),
			.ena_n(azul),
			.y(oam_a_d1_n)
		);

	dmg_drlatch_ee #(
			.L_q(121.1249)
		) zala_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(zala),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(3915.844)
		) zamy_inst (
			.in(d0),
			.ena_n(azul),
			.y(oam_b_d0_n)
		);

	dmg_not_x1 #(
			.L_y(676.0156)
		) zapa_inst (
			.in(bootrom_a1a0),
			.y(bootrom_na1a0)
		);

	dmg_not_x1 #(
			.L_y(726.7508)
		) zape_inst (
			.in(weka),
			.y(zape)
		);

	dmg_not_x1 #(
			.L_y(841.7661)
		) zapu_inst (
			.in(zape),
			.y(save_sprite_x6)
		);

	dmg_and2 #(
			.L_y(35.32777)
		) zapy_inst (
			.in1(a1),
			.in2(a0),
			.y(bootrom_a1a0)
		);

	dmg_xor #(
			.L_y(174.5158)
		) zare_inst (
			.in1(zoly),
			.in2(h6_n),
			.y(zare)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) zaro_inst (
			.in(yber_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a2)
		);

	dmg_xor #(
			.L_y(184.0786)
		) zate_inst (
			.in1(ygaj),
			.in2(h1_n),
			.y(zate)
		);

	dmg_not_if0 #(
			.L_y(3599.485)
		) zato_inst (
			.in(d5),
			.ena_n(azul),
			.y(oam_a_d5_n)
		);

	dmg_not_if0 #(
			.L_y(6422.547)
		) zave_inst (
			.in(yzep_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a5)
		);

	dmg_not_if0 #(
			.L_y(1790.578)
		) zaxa_inst (
			.in(d0),
			.ena_n(azul),
			.y(oam_a_d0_n)
		);

	dmg_dlatch #(
			.L_q(378.7811),
			.L_q_n(670.4378)
		) zaxe_inst (
			.d(oam_b_d4_n),
			.ena(oam_data_latch),
			.q(zaxe),
			.q_n(zaxe_n)
		);

	dmg_not_x2 #(
			.L_y(98.81254)
		) zaxy_inst (
			.in(azof),
			.y(zaxy)
		);

	dmg_xor #(
			.L_y(134.1403)
		) zeba_inst (
			.in1(ylah),
			.in2(h1_n),
			.y(zeba)
		);

	dmg_dlatch #(
			.L_q(142.375),
			.L_q_n(705.5)
		) zeca_inst (
			.d(oam_b_d7_n),
			.ena(oam_data_latch),
			.q(zeca),
			.q_n(zeca_n)
		);

	dmg_not_if0 #(
			.L_y(5001.453)
		) zece_inst (
			.in(ysok_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a6)
		);

	dmg_drlatch_ee #(
			.L_q(475.4686)
		) zecu_inst (
			.d(sprite_x4_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(zecu),
			.q_n()
		);

	dmg_xor #(
			.L_y(101.7344)
		) zeda_inst (
			.in1(yzof),
			.in2(h7_n),
			.y(zeda)
		);

	dmg_not_if0 #(
			.L_y(5476.922)
		) zedy_inst (
			.in(ywak_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a2)
		);

	dmg_xor #(
			.L_y(102.2656)
		) zefe_inst (
			.in1(xepa),
			.in2(h7_n),
			.y(zefe)
		);

	dmg_not_x1 #(
			.L_y(771.1097)
		) zefu_inst (
			.in(bootrom_a1_na0),
			.y(bootrom_na1_na0)
		);

	dmg_buf_if0 #(
			.L_y(31397.37)
		) zeha_inst (
			.in(zuve_n),
			.ena_n(oam_a_rd_n),
			.y(d6)
		);

	dmg_xor #(
			.L_y(133.3439)
		) zejo_inst (
			.in1(ynep),
			.in2(h6_n),
			.y(zejo)
		);

	dmg_not_x4 #(
			.L_y(7508.157)
		) zeme_inst (
			.in(zaxy),
			.y(ppu_4mhz)
		);

	dmg_xor #(
			.L_y(142.375)
		) zemu_inst (
			.in1(zogo),
			.in2(h5_n),
			.y(zemu)
		);

	dmg_dlatch_ee #(
			.L_q_n(151.6716)
		) zene_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y3),
			.ena_n(xyha),
			.q(),
			.q_n(zene_n)
		);

	dmg_not_x1 #(
			.L_y(116.0782)
		) zera_inst (
			.in(a5),
			.y(bootrom_a5_n)
		);

	dmg_not_x1 #(
			.L_y(1529.469)
		) zery_inst (
			.in(zado),
			.y(bootrom_oe_bl_precharge_n)
		);

	dmg_drlatch_ee #(
			.L_q(457.1408)
		) zesa_inst (
			.d(sprite_x7_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(zesa),
			.q_n()
		);

	dmg_not_x1 #(
			.L_y(262.9682)
		) zesy_inst (
			.in(xyha),
			.y(save_sprite_y3)
		);

	dmg_not_x1 #(
			.L_y(816.0002)
		) zete_inst (
			.in(bootrom_a1_na0_n),
			.y(bootrom_na1_na0_n)
		);

	dmg_not_if0 #(
			.L_y(5401.219)
		) zetu_inst (
			.in(ygus_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a7)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) zexe_inst (
			.in(zuro_n),
			.ena_n(sprite_sel3),
			.y(sprite_y_store0)
		);

	dmg_dlatch_ee #(
			.L_q_n(266.6877)
		) zexo_inst (
			.d(sprite_y_store2),
			.ena(save_sprite_y6),
			.ena_n(zuru),
			.q(),
			.q_n(zexo_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(151.4062)
		) zezy_inst (
			.d(yvel),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(zezy_n)
		);

	dmg_not_x1 #(
			.L_y(3563.36)
		) zocy_inst (
			.in(zyty_n),
			.y(sprite_x1_n)
		);

	dmg_not_x2 #(
			.L_y(626.3434)
		) zodo_inst (
			.in(yryv),
			.y(oam_rd_n)
		);

	dmg_not_x2 #(
			.L_y(725.4222)
		) zofe_inst (
			.in(ynyc),
			.y(oam_b_wr_n)
		);

	dmg_drlatch_ee #(
			.L_q(584.1099)
		) zogo_inst (
			.d(sprite_x5_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(zogo),
			.q_n()
		);

	dmg_xor #(
			.L_y(218.6097)
		) zogy_inst (
			.in1(xepe),
			.in2(h0_n),
			.y(zogy)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) zojy_inst (
			.in(yzor_n),
			.ena_n(sprite_sel9),
			.y(oam_render_a3)
		);

	dmg_not_x1 #(
			.L_y(1079.765)
		) zoke_inst (
			.in(a2),
			.y(bootrom_a2_n)
		);

	dmg_not_x1 #(
			.L_y(1108.188)
		) zoku_inst (
			.in(bootrom_oe_bl_precharge_n),
			.y(bootrom_oe_n_wl_precharge)
		);

	dmg_xor #(
			.L_y(33.20313)
		) zoky_inst (
			.in1(zulu),
			.in2(h3_n),
			.y(zoky)
		);

	dmg_drlatch_ee #(
			.L_q(229.5)
		) zola_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(zola),
			.q_n()
		);

	dmg_and2 #(
			.L_y(35.06249)
		) zole_inst (
			.in1(bootrom_a1_n),
			.in2(bootrom_a0_n),
			.y(bootrom_a1_na0_n)
		);

	dmg_drlatch_ee #(
			.L_q(535.4997)
		) zoly_inst (
			.d(sprite_x6_n),
			.ena(save_sprite_x6),
			.ena_n(zape),
			.r_n(sprite_rst6),
			.q(zoly),
			.q_n()
		);

	dmg_not_x2 #(
			.L_y(671.2352)
		) zone_inst (
			.in(ylyc),
			.y(oam_a_wr_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(149.0156)
		) zony_inst (
			.d(oam_render_a3),
			.ena(save_sprite_num0),
			.ena_n(geny),
			.q(),
			.q_n(zony_n)
		);

	dmg_not_if0 #(
			.L_y(4158.359)
		) zopu_inst (
			.in(d1),
			.ena_n(azul),
			.y(oam_b_d1_n)
		);

	dmg_nor4 #(
			.L_y(57.37469)
		) zoro_inst (
			.in1(a15),
			.in2(a14),
			.in3(a13),
			.in4(a12),
			.y(zoro)
		);

	dmg_and2 #(
			.L_y(1452.969)
		) zovy_inst (
			.in1(a5),
			.in2(bootrom_a4_n),
			.y(bootrom_a5a4_n)
		);

	dmg_not_if0 #(
			.L_y(3349.267)
		) zozo_inst (
			.in(d3),
			.ena_n(azul),
			.y(oam_a_d3_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(60.56287)
		) zube_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y6),
			.ena_n(zuru),
			.q(),
			.q_n(zube_n)
		);

	dmg_and2 #(
			.L_y(35.59345)
		) zubu_inst (
			.in1(bootrom_a0_n),
			.in2(a1),
			.y(bootrom_a1a0_n)
		);

	dmg_dlatch #(
			.L_q(111.0315),
			.L_q_n(697.5309)
		) zuca_inst (
			.d(oam_b_d2_n),
			.ena(oam_data_latch),
			.q(zuca),
			.q_n(zuca_n)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) zudo_inst (
			.in(zube_n),
			.ena_n(sprite_sel6),
			.y(sprite_y_store3)
		);

	dmg_and2 #(
			.L_y(110.7658)
		) zufa_inst (
			.in1(zadu),
			.in2(zoro),
			.y(zufa)
		);

	dmg_not_if0 #(
			.L_y(3733.094)
		) zufe_inst (
			.in(d7),
			.ena_n(azul),
			.y(oam_a_d7_n)
		);

	dmg_not_if0 #(
			.L_y(3380.61)
		) zufo_inst (
			.in(d4),
			.ena_n(azul),
			.y(oam_a_d4_n)
		);

	dmg_not_x1 #(
			.L_y(120.594)
		) zufy_inst (
			.in(a4),
			.y(bootrom_a4_n)
		);

	dmg_not_if0 #(
			.L_y(4506.33)
		) zuga_inst (
			.in(d4),
			.ena_n(azul),
			.y(oam_b_d4_n)
		);

	dmg_not_if0 #(
			.L_y(5680.392)
		) zuke_inst (
			.in(ylov_n),
			.ena_n(sprite_sel2),
			.y(sprite_y_store0)
		);

	dmg_and2 #(
			.L_y(1424.282)
		) zuko_inst (
			.in1(a5),
			.in2(a4),
			.y(bootrom_a5a4)
		);

	dmg_xor #(
			.L_y(115.5466)
		) zulo_inst (
			.in1(yvag),
			.in2(h3_n),
			.y(zulo)
		);

	dmg_drlatch_ee #(
			.L_q(164.6874)
		) zulu_inst (
			.d(sprite_x3_n),
			.ena(save_sprite_x0),
			.ena_n(fuxu),
			.r_n(sprite_rst0),
			.q(zulu),
			.q_n()
		);

	dmg_not_if0 #(
			.L_y(4722.281)
		) zumo_inst (
			.in(d5),
			.ena_n(azul),
			.y(oam_b_d5_n)
		);

	dmg_not_if0 #(
			.L_y(6041.11)
		) zumu_inst (
			.in(zony_n),
			.ena_n(sprite_sel0),
			.y(oam_render_a3)
		);

	dmg_dlatch_ee #(
			.L_q_n(138.391)
		) zumy_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y6),
			.ena_n(zuru),
			.q(),
			.q_n(zumy_n)
		);

	dmg_nor4 #(
			.L_y(201.3438)
		) zure_inst (
			.in1(yhok),
			.in2(ycah),
			.in3(ydaj),
			.in4(yvuz),
			.y(sprite_x_match_l3)
		);

	dmg_dlatch_ee #(
			.L_q_n(75.96917)
		) zuro_inst (
			.d(sprite_y_store0),
			.ena(save_sprite_y3),
			.ena_n(xyha),
			.q(),
			.q_n(zuro_n)
		);

	dmg_not_x1 #(
			.L_y(561.7967)
		) zuru_inst (
			.in(weka),
			.y(zuru)
		);

	dmg_dlatch_ee #(
			.L_q_n(54.18732)
		) zury_inst (
			.d(sprite_y_store3),
			.ena(save_sprite_y3),
			.ena_n(xyha),
			.q(),
			.q_n(zury_n)
		);

	dmg_dlatch #(
			.L_q(423.9377),
			.L_q_n(522.7494)
		) zuve_inst (
			.d(oam_a_d6_n),
			.ena(oam_data_latch),
			.q(zuve),
			.q_n(zuve_n)
		);

	dmg_xor #(
			.L_y(134.6723)
		) zuvu_inst (
			.in1(yrac),
			.in2(h1_n),
			.y(zuvu)
		);

	dmg_not_x1 #(
			.L_y(159.1093)
		) zuvy_inst (
			.in(a1),
			.y(bootrom_a1_n)
		);

	dmg_not_x1 #(
			.L_y(279.9698)
		) zuxe_inst (
			.in(zuru),
			.y(save_sprite_y6)
		);

	dmg_xor #(
			.L_y(120.0626)
		) zuza_inst (
			.in1(yrop),
			.in2(h5_n),
			.y(zuza)
		);

	dmg_dffr_cc #(
			.L_q_n(125.6409)
		) zuze_inst (
			.d(oam_a4),
			.clk(wuda),
			.clk_n(cyke),
			.r_n(wefe_const1),
			.q(),
			.q_n(zuze_n)
		);

	dmg_xor #(
			.L_y(129.3595)
		) zuzy_inst (
			.in1(zesa),
			.in2(h7_n),
			.y(zuzy)
		);

	dmg_not_x1 #(
			.L_y(167.6099)
		) zyba_inst (
			.in(a0),
			.y(bootrom_a0_n)
		);

	dmg_not_if0 #(
			.L_y(3951.438)
		) zyfa_inst (
			.in(d7),
			.ena_n(azul),
			.y(oam_b_d7_n)
		);

	dmg_not_x1 #(
			.L_y(1484.047)
		) zyfo_inst (
			.in(oam_a1_n_tri),
			.y(oam_a1)
		);

	dmg_and2 #(
			.L_y(1511.938)
		) zyga_inst (
			.in1(bootrom_a5_n),
			.in2(a4),
			.y(bootrom_a5_na4)
		);

	dmg_xor #(
			.L_y(115.2816)
		) zygo_inst (
			.in1(zecu),
			.in2(h4_n),
			.y(zygo)
		);

	dmg_drlatch_ee #(
			.L_q(155.1249)
		) zyjo_inst (
			.d(sprite_x2_n),
			.ena(save_sprite_x4),
			.ena_n(wofo),
			.r_n(sprite_rst4),
			.q(zyjo),
			.q_n()
		);

	dmg_xor #(
			.L_y(188.3282)
		) zyku_inst (
			.in1(ybed),
			.in2(h4_n),
			.y(zyku)
		);

	dmg_and2 #(
			.L_y(1522.298)
		) zyky_inst (
			.in1(bootrom_a5_n),
			.in2(bootrom_a4_n),
			.y(bootrom_a5_na4_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(147.422)
		) zylu_inst (
			.d(sprite_y_store1),
			.ena(save_sprite_y3),
			.ena_n(xyha),
			.q(),
			.q_n(zylu_n)
		);

	dmg_not_if0 #(
			.L_y(5461.781)
		) zypo_inst (
			.in(zury_n),
			.ena_n(sprite_sel3),
			.y(sprite_y_store3)
		);

	dmg_xor #(
			.L_y(120.5938)
		) zypu_inst (
			.in1(zala),
			.in2(h5_n),
			.y(zypu)
		);

	dmg_not_x1 #(
			.L_y(867.5311)
		) zyra_inst (
			.in(a7),
			.y(bootrom_a7_n)
		);

	dmg_not_x1 #(
			.L_y(725.4218)
		) zyro_inst (
			.in(bootrom_a1a0_n),
			.y(bootrom_na1a0_n)
		);

	dmg_buf_if0 #(
			.L_y(33882.07)
		) zysa_inst (
			.in(zaxe_n),
			.ena_n(oam_b_rd_n),
			.y(d4)
		);

	dmg_not_if0 #(
			.L_y(6040.048)
		) zysu_inst (
			.in(zuze_n),
			.ena_n(oam_rendering),
			.y(oam_render_a4)
		);

	dmg_not_if0 #(
			.L_y(5665.517)
		) zyto_inst (
			.in(zexo_n),
			.ena_n(sprite_sel6),
			.y(sprite_y_store2)
		);

	dmg_dlatch_ee #(
			.L_q_n(73.57824)
		) zyty_inst (
			.d(yrum),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(zyty_n)
		);

	dmg_dlatch_ee #(
			.L_q_n(269.8751)
		) zyve_inst (
			.d(ysex),
			.ena(wajy),
			.ena_n(xega),
			.q(),
			.q_n(zyve_n)
		);

	dmg_xor #(
			.L_y(170.2653)
		) zywu_inst (
			.in1(ypod),
			.in2(h4_n),
			.y(zywu)
		);

	keeper #(.N(8)) cpu_internal_db_keeper(.n(cpu_internal_db));
	keeper ma0_n_keeper(.n(ma0_n));
	keeper ma1_n_keeper(.n(ma1_n));
	keeper ma10_n_keeper(.n(ma10_n));
	keeper ma11_n_keeper(.n(ma11_n));
	keeper ma12_n_keeper(.n(ma12_n));
	keeper ma2_n_keeper(.n(ma2_n));
	keeper ma3_n_keeper(.n(ma3_n));
	keeper ma4_n_keeper(.n(ma4_n));
	keeper ma5_n_keeper(.n(ma5_n));
	keeper ma6_n_keeper(.n(ma6_n));
	keeper ma7_n_keeper(.n(ma7_n));
	keeper ma8_n_keeper(.n(ma8_n));
	keeper ma9_n_keeper(.n(ma9_n));
	keeper oam_a_d0_n_keeper(.n(oam_a_d0_n));
	keeper oam_a_d1_n_keeper(.n(oam_a_d1_n));
	keeper oam_a_d2_n_keeper(.n(oam_a_d2_n));
	keeper oam_a_d3_n_keeper(.n(oam_a_d3_n));
	keeper oam_a_d4_n_keeper(.n(oam_a_d4_n));
	keeper oam_a_d5_n_keeper(.n(oam_a_d5_n));
	keeper oam_a_d6_n_keeper(.n(oam_a_d6_n));
	keeper oam_a_d7_n_keeper(.n(oam_a_d7_n));
	keeper oam_b_d0_n_keeper(.n(oam_b_d0_n));
	keeper oam_b_d1_n_keeper(.n(oam_b_d1_n));
	keeper oam_b_d2_n_keeper(.n(oam_b_d2_n));
	keeper oam_b_d3_n_keeper(.n(oam_b_d3_n));
	keeper oam_b_d4_n_keeper(.n(oam_b_d4_n));
	keeper oam_b_d5_n_keeper(.n(oam_b_d5_n));
	keeper oam_b_d6_n_keeper(.n(oam_b_d6_n));
	keeper oam_b_d7_n_keeper(.n(oam_b_d7_n));
	keeper a0_keeper(.n(a0));
	keeper a1_keeper(.n(a1));
	keeper a10_keeper(.n(a10));
	keeper a11_keeper(.n(a11));
	keeper a12_keeper(.n(a12));
	keeper a13_keeper(.n(a13));
	keeper a14_keeper(.n(a14));
	keeper a15_keeper(.n(a15));
	keeper a2_keeper(.n(a2));
	keeper a3_keeper(.n(a3));
	keeper a4_keeper(.n(a4));
	keeper a5_keeper(.n(a5));
	keeper a6_keeper(.n(a6));
	keeper a7_keeper(.n(a7));
	keeper a8_keeper(.n(a8));
	keeper a9_keeper(.n(a9));
	keeper d0_keeper(.n(d0));
	keeper d1_keeper(.n(d1));
	keeper d2_keeper(.n(d2));
	keeper d3_keeper(.n(d3));
	keeper d4_keeper(.n(d4));
	keeper d5_keeper(.n(d5));
	keeper d6_keeper(.n(d6));
	keeper d7_keeper(.n(d7));
	keeper md0_keeper(.n(md0));
	keeper md1_keeper(.n(md1));
	keeper md2_keeper(.n(md2));
	keeper md3_keeper(.n(md3));
	keeper md4_keeper(.n(md4));
	keeper md5_keeper(.n(md5));
	keeper md6_keeper(.n(md6));
	keeper md7_keeper(.n(md7));
	keeper oam_a0_n_tri_keeper(.n(oam_a0_n_tri));
	keeper oam_a1_n_tri_keeper(.n(oam_a1_n_tri));
	keeper oam_a2_n_tri_keeper(.n(oam_a2_n_tri));
	keeper oam_a3_n_tri_keeper(.n(oam_a3_n_tri));
	keeper oam_a4_n_tri_keeper(.n(oam_a4_n_tri));
	keeper oam_a5_n_tri_keeper(.n(oam_a5_n_tri));
	keeper oam_a6_n_tri_keeper(.n(oam_a6_n_tri));
	keeper oam_a7_n_tri_keeper(.n(oam_a7_n_tri));
	keeper oam_render_a2_keeper(.n(oam_render_a2));
	keeper oam_render_a3_keeper(.n(oam_render_a3));
	keeper oam_render_a4_keeper(.n(oam_render_a4));
	keeper oam_render_a5_keeper(.n(oam_render_a5));
	keeper oam_render_a6_keeper(.n(oam_render_a6));
	keeper oam_render_a7_keeper(.n(oam_render_a7));
	keeper p14_pad_keeper(.n(p14_pad));
	keeper p15_pad_keeper(.n(p15_pad));
	keeper sprite_y_store0_keeper(.n(sprite_y_store0));
	keeper sprite_y_store1_keeper(.n(sprite_y_store1));
	keeper sprite_y_store2_keeper(.n(sprite_y_store2));
	keeper sprite_y_store3_keeper(.n(sprite_y_store3));

endmodule

`default_nettype wire
