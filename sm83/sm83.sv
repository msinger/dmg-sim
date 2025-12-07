`default_nettype none

module sm83 #(
		parameter real L_halt_n      = 1011.47,
		parameter real L_stop_n      = 1209.704,
		parameter real L_a0          = 260.5337,
		parameter real L_a1          = 258.2528,
		parameter real L_a10         = 229.7413,
		parameter real L_a11         = 227.9038,
		parameter real L_a12         = 229.8679,
		parameter real L_a13         = 218.3998,
		parameter real L_a14         = 217.1959,
		parameter real L_a15         = 232.4655,
		parameter real L_a2          = 258.443,
		parameter real L_a3          = 258.5062,
		parameter real L_a4          = 258.9496,
		parameter real L_a5          = 215.4219,
		parameter real L_a6          = 216.3722,
		parameter real L_a7          = 216.1189,
		parameter real L_a8          = 227.4602,
		parameter real L_a9          = 230.6915,
		parameter real L_m1          = 3671.805,
		parameter real L_wr          = 2644.494,
		parameter real L_prefix_cb   = 999.8112,
		parameter real L_d0          = 1679.525,
		parameter real L_d1          = 1731.002,
		parameter real L_d2          = 1782.006,
		parameter real L_d3          = 1832.241,
		parameter real L_d4          = 1883.835,
		parameter real L_d5          = 1935.394,
		parameter real L_d6          = 1986.58,
		parameter real L_d7          = 2042.786,
		parameter real L_db0         = 2837.112,
		parameter real L_db1         = 2962.755,
		parameter real L_db2         = 3090.547,
		parameter real L_db3         = 3215.205,
		parameter real L_db4         = 3346.099,
		parameter real L_db5         = 3460.447,
		parameter real L_db6         = 3577.412,
		parameter real L_db7         = 3700.271,
		parameter real L_ffxx        = 359.121,
		parameter real L_int_entry   = 852.6908,
		parameter real L_inta0       = 57.91037,
		parameter real L_inta1       = 72.03969,
		parameter real L_inta2       = 69.50525,
		parameter real L_inta3       = 74.82741,
		parameter real L_inta4       = 69.18843,
		parameter real L_inta5       = 74.13046,
		parameter real L_inta6       = 69.88539,
		parameter real L_inta7       = 75.20754,
		parameter real L_mreq        = 1402.967,
		parameter real L_rd          = 1694.611
	) (
		inout  tri logic [15:0] a,
		inout  tri logic [7:0] d,
		inout  tri logic [7:0] db,
		input      logic [7:0] \int ,
		output     logic [7:0] inta,
		input      logic clk_n,
		input      logic data_phase_n,
		input      logic exec_phase_n,
		output     logic halt_n,
		input      logic oe_n,
		input      logic pch_phase_n,
		output     logic stop_n,
		input      logic write_phase_n,
		input      logic clk,
		input      logic clk_ready,
		output     logic m1,
		output     logic wr,
		output     logic prefix_cb,
		input      logic data_phase,
		input      logic exec_phase,
		output     logic ffxx,
		output     logic int_entry,
		input      logic internal_access,
		output     logic mreq,
		input      logic nmi,
		input      logic pwron_reset,
		output     logic rd,
		input      logic shadow_access,
		input      logic shadow_override,
		input      logic sys_reset,
		input      logic test_freeze,
		input      logic wake,
		input      logic write_phase
	);

	tri logic [15:0] idu_in_n;
	logic     [7:0] irq_latch_n;
	logic     [2:0] mcyc_n;
	tri logic [7:0] new_reg_hi_n;
	tri logic [7:0] new_reg_pch_n;
	tri logic [7:0] new_reg_pcl_n;
	tri logic [7:0] new_reg_sph_n;
	tri logic [7:0] new_reg_spl_n;
	logic     [7:0] new_reg_w_n;
	logic     [7:0] new_reg_z_n;
	tri logic [2:0] next_mcyc_n;
	tri logic [7:0] op1bus_n;
	tri logic [7:0] op1dec_n;
	tri logic [7:0] op2bus_n;
	logic     [7:0] op2val_n;
	logic     [7:0] opcode_n_buf1;
	logic     [5:0] opcode_n_buf2;
	logic     [7:0] reg_ie_n;
	logic     [7:0] reg_pch_n;
	logic     [7:0] reg_pcl_n;
	logic     [7:0] reg_sph_n;
	logic     [7:0] reg_spl_n;
	logic     [7:0] alu_and;
	logic     [7:0] alu_pggen_tap_nand;
	logic     [7:0] alu_pggen_tap_xor;
	logic     [7:0] alu_pggen_y;
	logic     [7:0] gen;
	logic     [14:0] idu_chain_ena;
	tri logic [6:0] idu_chain_hi;
	tri logic [6:0] idu_chain_lo;
	logic     [15:0] idu_cpl_mask;
	logic     [15:0] idu_in;
	logic     [15:0] idu_out;
	logic     [6:0] irq_latch;
	logic     [7:0] irq_latch_gated_q_n;
	logic     [7:0] irq_nand2_nand3;
	tri logic [7:0] irq_prio_nand_b_y;
	logic     [2:0] mcyc;
	logic     [2:0] mcyc_buf;
	logic     [7:0] new_reg_hi;
	logic     [7:0] new_reg_lo;
	logic     [2:0] next_mcyc;
	logic     [7:0] op1dec;
	logic     [7:0] op1val;
	logic     [7:0] op2val;
	logic     [7:0] opcode;
	logic     [7:0] prop;
	logic     [7:0] reg_a;
	logic     [7:0] reg_b;
	logic     [7:0] reg_c;
	logic     [7:0] reg_d;
	logic     [7:0] reg_e;
	logic     [7:0] reg_h;
	logic     [7:0] reg_ie;
	logic     [7:0] reg_l;
	logic     [7:0] reg_pch;
	logic     [7:0] reg_pcl;
	logic     [7:0] reg_sph;
	logic     [7:0] reg_spl;
	logic     [7:0] reg_w;
	logic     [7:0] reg_z;
	logic     [7:0] res;
	logic     [7:0] res_carry;
	tri logic [7:0] shift;
	tri logic carry_in_n;
	tri logic ctl_alu_add_n;
	tri logic ctl_alu_and_n;
	tri logic ctl_alu_inv_cin_n;
	tri logic ctl_alu_inv_op2_n;
	tri logic ctl_alu_or_n;
	tri logic ctl_alu_to_db_en_n;
	tri logic ctl_alu_xor_n;
	logic     ctl_fetch_buf1_n;
	logic     ctl_fetch_buf2_n;
	tri logic ctl_fetch_n;
	tri logic ctl_ff_to_op1_en_n;
	tri logic ctl_flags_c_we_n;
	tri logic ctl_flags_znh_we_n;
	tri logic ctl_idu_dec_n;
	tri logic ctl_idu_inc_n;
	tri logic ctl_idu_to_reg_pc_en_n;
	tri logic ctl_idu_to_reg_sp_en_n;
	tri logic ctl_int_entry_m0_n;
	tri logic ctl_int_entry_m4_n;
	tri logic ctl_int_entry_m5_n;
	tri logic ctl_int_entry_m6_n;
	tri logic ctl_mread_n;
	tri logic ctl_mreq_n;
	tri logic ctl_mwrite_n;
	tri logic ctl_op_add_a_x_or_adc_a_x_n;
	tri logic ctl_op_add_hl_ss_m0_n;
	tri logic ctl_op_add_hl_ss_m1_n;
	tri logic ctl_op_add_or_adc_or_ldhl_exec_n;
	tri logic ctl_op_add_sp_e_m0_n;
	tri logic ctl_op_add_sp_e_m1_buf_n;
	tri logic ctl_op_add_sp_e_m1_n;
	tri logic ctl_op_add_sp_e_m2_buf_n;
	tri logic ctl_op_add_sp_e_m2_n;
	tri logic ctl_op_add_sp_e_m3_n;
	tri logic ctl_op_add_sp_e_or_ldhl_sp_e_m1_n;
	tri logic ctl_op_add_sp_e_or_ldhl_sp_e_m2_n;
	tri logic ctl_op_alu_a_hl_m0_n;
	tri logic ctl_op_alu_a_n_m0_n;
	tri logic ctl_op_alu_a_r_n;
	tri logic ctl_op_alu_or_alu_cb_or_ld_or_halt_n;
	tri logic ctl_op_alu_n;
	tri logic ctl_op_any_cc_n;
	tri logic ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n;
	tri logic ctl_op_aux_alu_m0_n;
	tri logic ctl_op_bit_b_hl_m1_n;
	tri logic ctl_op_bit_n;
	tri logic ctl_op_call_cc_nn_m1_n;
	tri logic ctl_op_call_m0_n;
	tri logic ctl_op_call_m1_n;
	tri logic ctl_op_call_m2_n;
	tri logic ctl_op_call_m3_n;
	tri logic ctl_op_call_m4_n;
	tri logic ctl_op_cb_hl_m0_n;
	tri logic ctl_op_cb_prefix_n;
	tri logic ctl_op_cb_r_n;
	tri logic ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n;
	tri logic ctl_op_cb_rxx_or_sxx_or_swap_n;
	tri logic ctl_op_cp_n;
	tri logic ctl_op_cpl_m0_n;
	tri logic ctl_op_daa_m0_n;
	tri logic ctl_op_dec_ss_m0_n;
	tri logic ctl_op_di_or_ei_n;
	tri logic ctl_op_halt_n;
	tri logic ctl_op_inc_or_dec_hl_m0_n;
	tri logic ctl_op_inc_or_dec_hl_m1_n;
	tri logic ctl_op_inc_or_dec_m_or_ld_or_halt_n;
	tri logic ctl_op_inc_or_dec_m_n;
	tri logic ctl_op_inc_or_dec_r_n;
	tri logic ctl_op_inc_or_dec_ss_m0_n;
	tri logic ctl_op_inc_ss_m0_n;
	tri logic ctl_op_jp_cc_nn_m1_n;
	tri logic ctl_op_jp_hl_n;
	tri logic ctl_op_jp_m0_n;
	tri logic ctl_op_jp_m1_n;
	tri logic ctl_op_jp_m2_n;
	tri logic ctl_op_jr_cc_e_m0_n;
	tri logic ctl_op_jr_m0_n;
	tri logic ctl_op_jr_m1_n;
	tri logic ctl_op_jr_m2_n;
	tri logic ctl_op_ld_a_c_m0_n;
	tri logic ctl_op_ld_a_n_m0_n;
	tri logic ctl_op_ld_a_n_m1_n;
	tri logic ctl_op_ld_a_n_n;
	tri logic ctl_op_ld_a_xxx_m0_n;
	tri logic ctl_op_ld_a_xxx_m1_n;
	tri logic ctl_op_ld_c_a_m0_n;
	tri logic ctl_op_ld_c_a_or_ld_a_c_m0_n;
	tri logic ctl_op_ld_dd_nn_m0_n;
	tri logic ctl_op_ld_dd_nn_m1_n;
	tri logic ctl_op_ld_dd_nn_m2_n;
	tri logic ctl_op_ld_hl_n_m1_n;
	tri logic ctl_op_ld_hl_r_m0_n;
	tri logic ctl_op_ld_hld_m0_n;
	tri logic ctl_op_ld_hli_m0_n;
	tri logic ctl_op_ld_n_a_m0_n;
	tri logic ctl_op_ld_n_a_m1_n;
	tri logic ctl_op_ld_n_a_or_ld_a_n_m1_n;
	tri logic ctl_op_ld_n_a_or_ld_c_a_exec_n;
	tri logic ctl_op_ld_nn_sp_exec_n;
	tri logic ctl_op_ld_nn_sp_m0_n;
	tri logic ctl_op_ld_nn_sp_m1_n;
	logic     ctl_op_ld_nn_sp_m2_buf_n;
	tri logic ctl_op_ld_nn_sp_m2_n;
	tri logic ctl_op_ld_nn_sp_m3_n;
	logic     ctl_op_ld_nn_sp_or_jr_exec_n;
	tri logic ctl_op_ld_nn_sp_or_ldx_exec_n;
	tri logic ctl_op_ld_or_halt_n;
	tri logic ctl_op_ld_r_hl_m0_n;
	tri logic ctl_op_ld_r_n_m2_n;
	tri logic ctl_op_ld_r_r_m0_n;
	tri logic ctl_op_ld_sp_hl_m0_n;
	tri logic ctl_op_ld_x_n_m0_n;
	tri logic ctl_op_ld_x_n_n;
	tri logic ctl_op_ld_xxx_a_m0_n;
	tri logic ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n;
	tri logic ctl_op_ldhl_sp_e_m0_n;
	tri logic ctl_op_ldhl_sp_e_m1_buf_n;
	tri logic ctl_op_ldhl_sp_e_m1_n;
	tri logic ctl_op_ldhl_sp_e_m2_buf_n;
	tri logic ctl_op_ldhl_sp_e_m2_n;
	tri logic ctl_op_ldx_a_nn_m2_n;
	tri logic ctl_op_ldx_a_nn_m3_n;
	tri logic ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n;
	tri logic ctl_op_ldx_m0_n;
	tri logic ctl_op_ldx_m1_n;
	tri logic ctl_op_ldx_nn_a_m2_n;
	tri logic ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n;
	tri logic ctl_op_m6_n;
	tri logic ctl_op_m7_n;
	tri logic ctl_op_nop_or_stop_n;
	tri logic ctl_op_or_or_set_exec_n;
	tri logic ctl_op_pop_qq_m0_n;
	tri logic ctl_op_pop_qq_m1_n;
	tri logic ctl_op_pop_qq_m2_n;
	tri logic ctl_op_push_qq_m0_n;
	tri logic ctl_op_push_qq_m1_n;
	tri logic ctl_op_push_qq_m2_n;
	tri logic ctl_op_res_b_hl_m1_n;
	tri logic ctl_op_res_b_r_m0_n;
	tri logic ctl_op_res_exec_n;
	tri logic ctl_op_res_or_set_b_hl_m0_n;
	tri logic ctl_op_ret_cc_m0_n;
	tri logic ctl_op_ret_cc_m1_n;
	tri logic ctl_op_ret_or_reti_m0_n;
	tri logic ctl_op_retx_m2_n;
	tri logic ctl_op_retx_m3_n;
	tri logic ctl_op_rl_n;
	tri logic ctl_op_rlc_n;
	tri logic ctl_op_rlx_or_slx_n;
	tri logic ctl_op_rr_n;
	tri logic ctl_op_rrc_n;
	tri logic ctl_op_rrx_or_srx_n;
	tri logic ctl_op_rst_t_m0_n;
	tri logic ctl_op_rst_t_m1_n;
	tri logic ctl_op_rst_t_m2_n;
	tri logic ctl_op_rxx_n;
	tri logic ctl_op_rxxa_or_daa_or_cpl_m0_n;
	tri logic ctl_op_rxxa_n;
	tri logic ctl_op_scf_or_ccf_m0_n;
	tri logic ctl_op_set_b_hl_m1_n;
	tri logic ctl_op_set_b_r_m0_n;
	tri logic ctl_op_set_exec_n;
	tri logic ctl_op_sra_n;
	tri logic ctl_op_sub_or_sbc_or_cp_n;
	tri logic ctl_op_sub_or_sbc_n;
	tri logic ctl_op_swap_n;
	tri logic ctl_op_sxx_or_swap_n;
	tri logic ctl_op2_to_db_en_n;
	tri logic ctl_push_or_pop_exec_n;
	tri logic ctl_reg_a_to_op2_en_n;
	logic     ctl_reg_a_we_buf_n;
	tri logic ctl_reg_a_we_n;
	tri logic ctl_reg_b_to_op2_en_n;
	logic     ctl_reg_b_we_buf_n;
	tri logic ctl_reg_b_we_n;
	tri logic ctl_reg_bc_to_idu_en_n;
	tri logic ctl_reg_c_to_op2_en_n;
	logic     ctl_reg_c_we_buf_n;
	tri logic ctl_reg_c_we_n;
	tri logic ctl_reg_d_to_op2_en_n;
	logic     ctl_reg_d_we_buf_n;
	tri logic ctl_reg_d_we_n;
	tri logic ctl_reg_de_to_idu_en_n;
	tri logic ctl_reg_e_to_op2_en_n;
	logic     ctl_reg_e_we_buf_n;
	tri logic ctl_reg_e_we_n;
	tri logic ctl_reg_h_to_op2_en_n;
	logic     ctl_reg_h_we_buf_n;
	tri logic ctl_reg_h_we_n;
	tri logic ctl_reg_hl_to_idu_en_n;
	tri logic ctl_reg_l_to_op2_en_n;
	logic     ctl_reg_l_we_buf_n;
	tri logic ctl_reg_l_we_n;
	tri logic ctl_reg_pc_to_idu_en_n;
	logic     ctl_reg_pc_we_buf_hi_n;
	logic     ctl_reg_pc_we_buf_lo_n;
	tri logic ctl_reg_pc_we_n;
	tri logic ctl_reg_pch_to_db_en_n;
	tri logic ctl_reg_pcl_to_db_en_n;
	tri logic ctl_reg_sp_to_idu_en_n;
	logic     ctl_reg_sp_we_buf_hi_n;
	logic     ctl_reg_sp_we_buf_lo_n;
	tri logic ctl_reg_sp_we_n;
	logic     ctl_reg_w_we_buf_n;
	tri logic ctl_reg_w_we_n;
	tri logic ctl_reg_wz_to_reg_gp_en_n;
	tri logic ctl_reg_wz_to_reg_pc_en_n;
	tri logic ctl_reg_wz_to_reg_sp_en_n;
	tri logic ctl_reg_z_to_op2_en_n;
	logic     ctl_reg_z_we_buf_n;
	tri logic ctl_reg_z_we_n;
	logic     data_phase_buf_n;
	tri logic dec1_y107_n;
	tri logic dec1_y49_n;
	tri logic dec1_y50_n;
	tri logic dec2_y30_n;
	tri logic dec3_y14_n;
	tri logic dec3_y37_n;
	tri logic dec3_y42_n;
	logic     flag_c_n;
	logic     flag_h_n;
	logic     flag_n_n;
	logic     flag_z_n;
	logic     ime_n;
	logic     in_intr_buf_n;
	logic     in_intr_n;
	tri logic int_vector_n3;
	tri logic int_vector_n4;
	tri logic int_vector_n5;
	tri logic new_flag_c_n;
	tri logic new_flag_h_n;
	tri logic new_flag_n_n;
	tri logic new_flag_z_n;
	logic     nmi_n;
	logic     res_carry_n;
	logic     res_hcarry_n;
	logic     reset_n;
	logic     set_mcyc7_n;
	logic     table_cb_buf_n;
	logic     table_cb_n;
	logic     alu_cond_fail;
	tri logic alu_cond_fail_n;
	logic     carry_in;
	logic     ctl_alu_add;
	logic     ctl_alu_and;
	logic     ctl_alu_inv_cin;
	logic     ctl_alu_inv_op2;
	logic     ctl_alu_or;
	logic     ctl_alu_to_db_en;
	logic     ctl_alu_to_reg_gp_en;
	logic     ctl_alu_xor;
	logic     ctl_fetch;
	logic     ctl_ff_to_op1_en;
	logic     ctl_ff_to_op2_en;
	logic     ctl_flags_c_we;
	logic     ctl_flags_to_op2_en;
	logic     ctl_flags_znh_we;
	logic     ctl_idu_dec;
	logic     ctl_idu_inc;
	logic     ctl_idu_to_reg_gp_en;
	logic     ctl_idu_to_reg_pc_en;
	logic     ctl_idu_to_reg_sp_en;
	logic     ctl_int_entry_m0;
	logic     ctl_int_entry_m4;
	logic     ctl_int_entry_m5;
	logic     ctl_int_entry_m6;
	logic     ctl_mread;
	logic     ctl_mreq;
	logic     ctl_mwrite;
	logic     ctl_op_add_a_x_or_adc_a_x;
	logic     ctl_op_add_hl_ss_m0;
	logic     ctl_op_add_hl_ss_m0_buf;
	logic     ctl_op_add_hl_ss_m1;
	logic     ctl_op_add_hl_ss_m1_buf;
	logic     ctl_op_add_or_adc_or_ldhl_exec;
	logic     ctl_op_add_sp_e_m0;
	logic     ctl_op_add_sp_e_m1;
	logic     ctl_op_add_sp_e_m1_buf;
	logic     ctl_op_add_sp_e_m2;
	logic     ctl_op_add_sp_e_m2_buf;
	logic     ctl_op_add_sp_e_m3;
	logic     ctl_op_add_sp_e_or_ldhl_sp_e_m1;
	logic     ctl_op_add_sp_e_or_ldhl_sp_e_m2;
	logic     ctl_op_alu;
	logic     ctl_op_alu_a_hl_m0;
	logic     ctl_op_alu_a_n_m0;
	logic     ctl_op_alu_a_r;
	logic     ctl_op_alu_buf;
	logic     ctl_op_alu_or_alu_cb_or_ld_or_halt;
	logic     ctl_op_any_cc;
	logic     ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec;
	logic     ctl_op_aux_alu_m0;
	logic     ctl_op_bit;
	logic     ctl_op_bit_b_hl_m1;
	logic     ctl_op_bit_buf;
	logic     ctl_op_call_cc_nn_m1;
	logic     ctl_op_call_m0;
	logic     ctl_op_call_m1;
	logic     ctl_op_call_m2;
	logic     ctl_op_call_m3;
	logic     ctl_op_call_m4;
	logic     ctl_op_cb_hl_m0;
	logic     ctl_op_cb_prefix;
	logic     ctl_op_cb_r;
	logic     ctl_op_cb_rxx_or_sxx_or_swap;
	logic     ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1;
	logic     ctl_op_cp;
	logic     ctl_op_cpl_m0;
	logic     ctl_op_daa_m0;
	logic     ctl_op_dec_ss_m0;
	logic     ctl_op_di_or_ei;
	logic     ctl_op_halt;
	logic     ctl_op_halt_delayed;
	logic     ctl_op_inc_or_dec_hl_m0;
	logic     ctl_op_inc_or_dec_hl_m1;
	logic     ctl_op_inc_or_dec_m;
	logic     ctl_op_inc_or_dec_m_buf;
	logic     ctl_op_inc_or_dec_m_or_ld_or_halt;
	logic     ctl_op_inc_or_dec_r;
	logic     ctl_op_inc_or_dec_ss_m0;
	logic     ctl_op_inc_ss_m0;
	logic     ctl_op_jp_cc_nn_m1;
	logic     ctl_op_jp_hl;
	logic     ctl_op_jp_m0;
	logic     ctl_op_jp_m1;
	logic     ctl_op_jp_m2;
	logic     ctl_op_jr_cc_e_m0;
	logic     ctl_op_jr_m0;
	logic     ctl_op_jr_m1;
	logic     ctl_op_jr_m1_buf;
	logic     ctl_op_jr_m2;
	logic     ctl_op_jr_m2_buf;
	logic     ctl_op_ld_a_c_m0;
	logic     ctl_op_ld_a_n;
	logic     ctl_op_ld_a_n_m0;
	logic     ctl_op_ld_a_n_m1;
	logic     ctl_op_ld_a_xxx_m0;
	logic     ctl_op_ld_a_xxx_m1;
	logic     ctl_op_ld_c_a_m0;
	logic     ctl_op_ld_c_a_or_ld_a_c_m0;
	logic     ctl_op_ld_dd_nn_m0;
	logic     ctl_op_ld_dd_nn_m1;
	logic     ctl_op_ld_dd_nn_m2;
	logic     ctl_op_ld_hl_n_m1;
	logic     ctl_op_ld_hl_r_m0;
	logic     ctl_op_ld_hld_m0;
	logic     ctl_op_ld_hli_m0;
	logic     ctl_op_ld_n_a_m0;
	logic     ctl_op_ld_n_a_m1;
	logic     ctl_op_ld_n_a_or_ld_a_n_m1;
	logic     ctl_op_ld_n_a_or_ld_c_a_exec;
	logic     ctl_op_ld_nn_sp_exec;
	logic     ctl_op_ld_nn_sp_m0;
	logic     ctl_op_ld_nn_sp_m1;
	logic     ctl_op_ld_nn_sp_m2;
	logic     ctl_op_ld_nn_sp_m3;
	logic     ctl_op_ld_nn_sp_or_jr_exec;
	logic     ctl_op_ld_nn_sp_or_ldx_exec;
	logic     ctl_op_ld_or_halt;
	logic     ctl_op_ld_r_hl_m0;
	logic     ctl_op_ld_r_n_m2;
	logic     ctl_op_ld_r_r_m0;
	logic     ctl_op_ld_sp_hl_m0;
	logic     ctl_op_ld_x_n;
	logic     ctl_op_ld_x_n_m0;
	logic     ctl_op_ld_xxx_a_m0;
	logic     ctl_op_ld_xxx_a_or_ld_a_xxx_m0;
	logic     ctl_op_ldhl_sp_e_m0;
	logic     ctl_op_ldhl_sp_e_m1;
	logic     ctl_op_ldhl_sp_e_m1_buf;
	logic     ctl_op_ldhl_sp_e_m2;
	logic     ctl_op_ldhl_sp_e_m2_buf;
	logic     ctl_op_ldx_a_nn_m2;
	logic     ctl_op_ldx_a_nn_m3;
	logic     ctl_op_ldx_a_nn_or_ld_a_xxx_exec;
	logic     ctl_op_ldx_m0;
	logic     ctl_op_ldx_m1;
	logic     ctl_op_ldx_nn_a_m2;
	logic     ctl_op_ldx_nn_a_or_ld_xxx_a_exec;
	logic     ctl_op_m6;
	logic     ctl_op_m7;
	logic     ctl_op_nop_or_stop;
	logic     ctl_op_or_or_set_exec;
	logic     ctl_op_pop_qq_m0;
	logic     ctl_op_pop_qq_m1;
	logic     ctl_op_pop_qq_m2;
	logic     ctl_op_push_qq_m0;
	logic     ctl_op_push_qq_m1;
	logic     ctl_op_push_qq_m2;
	logic     ctl_op_push_qq_m2_buf;
	logic     ctl_op_res_b_hl_m1;
	logic     ctl_op_res_b_r_m0;
	logic     ctl_op_res_exec;
	logic     ctl_op_res_or_set_b_hl_m0;
	logic     ctl_op_ret_cc_m0;
	logic     ctl_op_ret_cc_m1;
	logic     ctl_op_ret_or_reti_m0;
	logic     ctl_op_retx_m2;
	logic     ctl_op_retx_m3;
	logic     ctl_op_rl;
	logic     ctl_op_rlc;
	logic     ctl_op_rlx_or_slx;
	logic     ctl_op_rr;
	logic     ctl_op_rrc;
	logic     ctl_op_rrx_or_srx;
	logic     ctl_op_rst_t_m0;
	logic     ctl_op_rst_t_m1;
	logic     ctl_op_rst_t_m2;
	logic     ctl_op_rxx;
	logic     ctl_op_rxxa;
	logic     ctl_op_rxxa_or_daa_or_cpl_m0;
	logic     ctl_op_scf_or_ccf_m0;
	logic     ctl_op_set_b_hl_m1;
	logic     ctl_op_set_b_r_m0;
	logic     ctl_op_set_exec;
	logic     ctl_op_sra;
	logic     ctl_op_stop;
	logic     ctl_op_stop_delayed;
	logic     ctl_op_sub_or_sbc;
	logic     ctl_op_sub_or_sbc_or_cp;
	logic     ctl_op_swap;
	logic     ctl_op_sxx_or_swap;
	logic     ctl_op2_to_db_en;
	logic     ctl_push_or_pop_exec;
	logic     ctl_reg_a_to_op2_en;
	logic     ctl_reg_a_we;
	logic     ctl_reg_b_to_op2_en;
	logic     ctl_reg_b_we;
	logic     ctl_reg_bc_to_idu_en;
	logic     ctl_reg_c_to_op2_en;
	logic     ctl_reg_c_we;
	logic     ctl_reg_d_to_op2_en;
	logic     ctl_reg_d_we;
	logic     ctl_reg_de_to_idu_en;
	logic     ctl_reg_e_to_op2_en;
	logic     ctl_reg_e_we;
	logic     ctl_reg_h_to_op2_en;
	logic     ctl_reg_h_we;
	logic     ctl_reg_hl_to_idu_en;
	logic     ctl_reg_l_to_op2_en;
	logic     ctl_reg_l_we;
	logic     ctl_reg_pc_to_idu_en;
	logic     ctl_reg_pc_we;
	logic     ctl_reg_pch_to_db_en;
	logic     ctl_reg_pcl_to_db_en;
	logic     ctl_reg_sp_to_idu_en;
	logic     ctl_reg_sp_we;
	logic     ctl_reg_w_we;
	logic     ctl_reg_wz_to_reg_gp_en;
	logic     ctl_reg_wz_to_reg_pc_en;
	logic     ctl_reg_wz_to_reg_sp_en;
	logic     ctl_reg_z_to_op2_en;
	logic     ctl_reg_z_we;
	logic     daa_hi_ge9;
	logic     daa_hi_gt9;
	logic     daa_lo_gt9;
	logic     dec1_y107;
	logic     dec1_y49;
	logic     dec1_y50;
	logic     dec2_y30;
	logic     dec3_y14;
	logic     dec3_y37;
	logic     dec3_y42;
	tri logic dec3_y56;
	tri logic dec3_y58;
	logic     flag_c;
	logic     flag_h;
	logic     flag_n;
	logic     flag_z;
	logic     gnd;
	logic     halt;
	logic     idle;
	logic     idu_ctl_y1;
	logic     idu_dec;
	logic     idu_inc;
	logic     ie_we_n;
	logic     ie_we;
	logic     ime_state;
	logic     in_intr;
	logic     int_vector3;
	logic     int_vector4;
	logic     int_vector5;
	logic     int_vector6;
	logic     int_vector7;
	logic     irq_head_a_y;
	logic     irq_head_b_y;
	logic     irq_head_c_y;
	logic     irq_head_e_y;
	tri logic irq_prio_dist_nand_a_y;
	tri logic irq_prio_dist_nand_a_y_n1;
	tri logic irq_prio_dist_nand_a_y_n2;
	tri logic irq_prio_dist_nand_a_y_n3;
	tri logic irq_prio_dist_nand_a_y_n4;
	tri logic irq_prio_dist_nand_a_y_n5;
	tri logic irq_prio_dist_nand_a_y_n6;
	tri logic irq_prio_dist_nand_a_y_n7;
	tri logic irq_prio_dist_nand_b_y;
	tri logic irq_prio_dist_nand_b_y_n1;
	tri logic irq_prio_dist_nand_b_y_n2;
	tri logic irq_prio_dist_nand_b_y_n3;
	tri logic irq_prio_dist_nand_b_y_n4;
	tri logic irq_prio_dist_nand_b_y_n5;
	tri logic irq_prio_dist_nand_b_y_n6;
	tri logic irq_prio_dist_nand_b_y_n7;
	tri logic irq_prio_dist_nor_y;
	tri logic irq_prio_dist_nor_y_p1;
	tri logic irq_prio_dist_nor_y_p2;
	tri logic irq_prio_dist_nor_y_p3;
	tri logic irq_prio_dist_nor_y_p4;
	tri logic irq_prio_dist_nor_y_p5;
	tri logic irq_prio_dist_nor_y_p6;
	tri logic irq_prio_dist_nor_y_p7;
	tri logic irq_prio_nand_a_y;
	logic     oe;
	logic     opcode3_n_buf3;
	logic     pch_reset_n;
	logic     pcl_reset_n;
	logic     reg_z7_delayed;
	logic     res_zero;
	logic     reset;
	logic     spare_opcode7_n;
	tri logic spare_y;
	logic     stop;
	logic     table_cb;
	logic     vdd;
	logic     vequ;
	logic     vequ_tap_in1;
	logic     wafr;
	logic     ween;
	logic     werf;
	logic     wudz;
	logic     xdqf;
	logic     xogs;
	logic     xudo;
	logic     xurg;
	logic     ydxa;
	logic     ykua;
	logic     yneu;
	logic     yniu;
	logic     ynoz;
	logic     yodp;
	logic     yoii;
	logic     yolu;
	logic     zaij;
	logic     zaoc;
	logic     zaza;
	logic     zbpp;
	logic     zfex;
	logic     zgna;
	logic     ziks;
	logic     zkdu;
	logic     zkog;
	logic     zloz;
	logic     znda;
	logic     zojz;
	logic     zorp;
	logic     zowa;
	logic     zoxc;
	logic     zrby;
	logic     zrsy;
	logic     zudn;
	logic     zwlm;
	logic     zwuu;
	logic     zyoc;
	logic     zzom;

	assign m1               = ctl_fetch;
	assign wr               = ctl_mwrite;
	assign prefix_cb        = ctl_op_cb_prefix;

	sm83_and2_alu #(
			.L_y(90.6039)
		) alu_and_inst0 (
			.in1(prop[0]),
			.in2(alu_pggen_tap_nand[0]),
			.y(alu_and[0])
		);

	sm83_and2_alu #(
			.L_y(95.10242)
		) alu_and_inst1 (
			.in1(alu_pggen_tap_nand[1]),
			.in2(prop[1]),
			.y(alu_and[1])
		);

	sm83_and2_alu #(
			.L_y(116.4545)
		) alu_and_inst2 (
			.in1(alu_pggen_tap_nand[2]),
			.in2(prop[2]),
			.y(alu_and[2])
		);

	sm83_and2_alu #(
			.L_y(112.4629)
		) alu_and_inst3 (
			.in1(alu_pggen_tap_nand[3]),
			.in2(prop[3]),
			.y(alu_and[3])
		);

	sm83_and2_alu #(
			.L_y(98.65055)
		) alu_and_inst4 (
			.in1(prop[4]),
			.in2(alu_pggen_tap_nand[4]),
			.y(alu_and[4])
		);

	sm83_and2_alu #(
			.L_y(102.8322)
		) alu_and_inst5 (
			.in1(alu_pggen_tap_nand[5]),
			.in2(prop[5]),
			.y(alu_and[5])
		);

	sm83_and2_alu #(
			.L_y(110.3721)
		) alu_and_inst6 (
			.in1(alu_pggen_tap_nand[6]),
			.in2(prop[6]),
			.y(alu_and[6])
		);

	sm83_and2_alu #(
			.L_y(104.9865)
		) alu_and_inst7 (
			.in1(prop[7]),
			.in2(alu_pggen_tap_nand[7]),
			.y(alu_and[7])
		);

	sm83_alu_cgen #(
			.L_cout0(94.21536),
			.L_cout1(147.0571),
			.L_cout2(163.9741),
			.L_cout3(2732.501)
		) alu_cgen_h_inst (
			.p0(prop[4]),
			.g0(gen[4]),
			.p1(prop[5]),
			.g1(gen[5]),
			.p2(prop[6]),
			.g2(gen[6]),
			.p3(prop[7]),
			.g3(gen[7]),
			.cin(res_carry[3]),
			.cout0(res_carry[4]),
			.cout1(res_carry[5]),
			.cout2(res_carry[6]),
			.cout3(res_carry[7])
		);

	sm83_alu_cgen #(
			.L_cout0(160.1725),
			.L_cout1(70.01212),
			.L_cout2(84.0779),
			.L_cout3(1034.117)
		) alu_cgen_l_inst (
			.p0(prop[0]),
			.g0(gen[0]),
			.p1(prop[1]),
			.g1(gen[1]),
			.p2(prop[2]),
			.g2(gen[2]),
			.p3(prop[3]),
			.g3(gen[3]),
			.cin(carry_in),
			.cout0(res_carry[0]),
			.cout1(res_carry[1]),
			.cout2(res_carry[2]),
			.cout3(res_carry[3])
		);

	sm83_alu_decoder #(
			.L_y1(103.5926),
			.L_y2(204.2707),
			.L_y3(343.9147),
			.L_y4(131.3439),
			.L_y5(109.0415),
			.L_y6(120.3195),
			.L_y7(108.2812),
			.L_y8(173.0344),
			.L_y9(108.3445),
			.L_y10(98.96736),
			.L_y11(145.0929),
			.L_y12(37.19193),
			.L_y13(465.8182),
			.L_y14(142.9388)
		) alu_decoder_inst (
			.in1(op1val[0]),
			.in2(flag_h),
			.in3(flag_h_n),
			.in4(flag_c),
			.in5(flag_c_n),
			.in6(op1val[1]),
			.in7(op1val[2]),
			.in8(op1val[3]),
			.in9(op1val[4]),
			.in10(flag_n),
			.in11(flag_n_n),
			.in12(op1val[5]),
			.in13(op1val[6]),
			.in14(op1val[7]),
			.in15(flag_z_n),
			.in16(flag_z),
			.in17(alu_pggen_tap_xor[0]),
			.in18(alu_pggen_tap_xor[1]),
			.in19(alu_pggen_tap_xor[2]),
			.in20(alu_pggen_tap_xor[3]),
			.in21(alu_pggen_tap_xor[0]),
			.in22(alu_pggen_tap_xor[4]),
			.in23(alu_pggen_tap_xor[5]),
			.in24(alu_pggen_tap_xor[6]),
			.in25(alu_pggen_tap_xor[7]),
			.in26(ctl_op_rlx_or_slx),
			.in27(ctl_op_rrx_or_srx),
			.in28(res_carry[3]),
			.in29(res_carry_n),
			.in30(res_hcarry_n),
			.in31(reg_z[6]),
			.in32(reg_z[4]),
			.in33(reg_z[5]),
			.in34(ctl_op_bit_buf),
			.in35(exec_phase),
			.in36(write_phase),
			.in37(res_carry[7]),
			.in38(ctl_op_add_or_adc_or_ldhl_exec),
			.in39(ctl_op_inc_or_dec_m_buf),
			.in40(opcode_n_buf2[0]),
			.in41(ctl_op_any_cc),
			.in42(ctl_op_cp),
			.in43(opcode[5]),
			.in44(opcode_n_buf2[5]),
			.in45(opcode[4]),
			.in46(opcode_n_buf2[4]),
			.in47(opcode[3]),
			.in48(opcode_n_buf2[3]),
			.in49(ctl_op_set_exec),
			.in50(ctl_op_sub_or_sbc_or_cp),
			.in51(ctl_op_res_exec),
			.in52(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in53(res_zero),
			.in54(ctl_op_add_hl_ss_m1_buf),
			.in55(ctl_op_scf_or_ccf_m0),
			.in56(ctl_alu_inv_cin),
			.in57(ctl_op_daa_m0),
			.in58(ctl_op_sub_or_sbc),
			.in59(reg_z[7]),
			.in60(daa_lo_gt9),
			.in61(ctl_op_add_a_x_or_adc_a_x),
			.in62(ctl_op_alu_buf),
			.in63(ctl_op_add_hl_ss_m0_buf),
			.in64(daa_hi_gt9),
			.in65(ctl_op_cb_rxx_or_sxx_or_swap),
			.in66(daa_hi_ge9),
			.in67(ctl_op_cpl_m0),
			.in68(ctl_op_pop_qq_m2),
			.in69(ctl_alu_and),
			.y1(op1dec_n[0]),
			.y2(new_flag_h_n),
			.y3(new_flag_c_n),
			.y4(op1dec_n[1]),
			.y5(op1dec_n[2]),
			.y6(op1dec_n[3]),
			.y7(op1dec_n[4]),
			.y8(new_flag_n_n),
			.y9(op1dec_n[5]),
			.y10(op1dec_n[6]),
			.y11(op1dec_n[7]),
			.y12(alu_cond_fail_n),
			.y13(new_flag_z_n),
			.y14(carry_in_n)
		);

	sm83_dffn_ee_q_alu_sign #(
			.L_q(517.2026)
		) alu_dff_inst (
			.d(reg_z[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(data_phase),
			.q(reg_z7_delayed)
		);

	sm83_not_pch_x2_alu #(
			.L_in(103.5926),
			.L_y(336.5017)
		) alu_not1_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[0]),
			.y(op1dec[0])
		);

	sm83_not_pch_x2_alu #(
			.L_in(142.9388),
			.L_y(1063.551)
		) alu_not10_inst (
			.pch_n(exec_phase),
			.in(carry_in_n),
			.y(carry_in)
		);

	sm83_not_alu_a #(
			.L_y(372.2594)
		) alu_not11_inst (
			.in(res_carry[3]),
			.y(res_hcarry_n)
		);

	sm83_not_alu_b #(
			.L_y(527.9272)
		) alu_not12_inst (
			.in(res_carry[7]),
			.y(res_carry_n)
		);

	sm83_not_pch_x2_alu #(
			.L_in(131.3439),
			.L_y(363.9996)
		) alu_not2_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[1]),
			.y(op1dec[1])
		);

	sm83_not_pch_x2_alu #(
			.L_in(109.0415),
			.L_y(302.0342)
		) alu_not3_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[2]),
			.y(op1dec[2])
		);

	sm83_not_pch_x2_alu #(
			.L_in(120.3195),
			.L_y(319.268)
		) alu_not4_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[3]),
			.y(op1dec[3])
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.2812),
			.L_y(368.3715)
		) alu_not5_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[4]),
			.y(op1dec[4])
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.3445),
			.L_y(318.4442)
		) alu_not6_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[5]),
			.y(op1dec[5])
		);

	sm83_not_pch_x2_alu #(
			.L_in(98.96736),
			.L_y(370.2721)
		) alu_not7_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[6]),
			.y(op1dec[6])
		);

	sm83_not_pch_x2_alu #(
			.L_in(145.0929),
			.L_y(392.3214)
		) alu_not8_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[7]),
			.y(op1dec[7])
		);

	sm83_not_pch_x1_alu #(
			.L_in(37.19193),
			.L_y(1332.448)
		) alu_not9_inst (
			.pch_n(pch_phase_n),
			.in(alu_cond_fail_n),
			.y(alu_cond_fail)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(101.1216),
			.L_tap_xor(169.3596),
			.L_tap_nand(89.59021),
			.L_tap_and(243.2367),
			.L_tap_or(244.2504),
			.L_y(186.1498)
		) alu_pggen_inst0 (
			.xor_in1(op2val[0]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[0]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[0]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[0]),
			.tap_nand(alu_pggen_tap_nand[0]),
			.tap_and(gen[0]),
			.tap_or(prop[0]),
			.y(alu_pggen_y[0])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(127.9859),
			.L_tap_xor(131.8509),
			.L_tap_nand(77.3618),
			.L_tap_and(198.2515),
			.L_tap_or(274.1561),
			.L_y(237.2808)
		) alu_pggen_inst1 (
			.xor_in1(op2val[1]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[1]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[1]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[1]),
			.tap_nand(alu_pggen_tap_nand[1]),
			.tap_and(gen[1]),
			.tap_or(prop[1]),
			.y(alu_pggen_y[1])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(149.9083),
			.L_tap_xor(183.0452),
			.L_tap_nand(118.6721),
			.L_tap_and(163.3405),
			.L_tap_or(225.2426),
			.L_y(296.5219)
		) alu_pggen_inst2 (
			.xor_in1(op2val[2]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[2]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[2]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[2]),
			.tap_nand(alu_pggen_tap_nand[2]),
			.tap_and(gen[2]),
			.tap_or(prop[2]),
			.y(alu_pggen_y[2])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(126.2119),
			.L_tap_xor(229.4243),
			.L_tap_nand(117.9118),
			.L_tap_and(187.8606),
			.L_tap_or(246.6581),
			.L_y(185.643)
		) alu_pggen_inst3 (
			.xor_in1(op2val[3]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[3]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[3]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[3]),
			.tap_nand(alu_pggen_tap_nand[3]),
			.tap_and(gen[3]),
			.tap_or(prop[3]),
			.y(alu_pggen_y[3])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(130.0134),
			.L_tap_xor(240.6388),
			.L_tap_nand(102.3887),
			.L_tap_and(200.0255),
			.L_tap_or(249.7626),
			.L_y(167.0153)
		) alu_pggen_inst4 (
			.xor_in1(op2val[4]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[4]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[4]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[4]),
			.tap_nand(alu_pggen_tap_nand[4]),
			.tap_and(gen[4]),
			.tap_or(prop[4]),
			.y(alu_pggen_y[4])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(140.9746),
			.L_tap_xor(165.4313),
			.L_tap_nand(90.47716),
			.L_tap_and(216.0555),
			.L_tap_or(264.4621),
			.L_y(266.8697)
		) alu_pggen_inst5 (
			.xor_in1(op2val[5]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[5]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[5]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[5]),
			.tap_nand(alu_pggen_tap_nand[5]),
			.tap_and(gen[5]),
			.tap_or(prop[5]),
			.y(alu_pggen_y[5])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(100.9315),
			.L_tap_xor(219.9204),
			.L_tap_nand(104.733),
			.L_tap_and(164.1641),
			.L_tap_or(232.4655),
			.L_y(278.0209)
		) alu_pggen_inst6 (
			.xor_in1(op2val[6]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[6]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[6]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[6]),
			.tap_nand(alu_pggen_tap_nand[6]),
			.tap_and(gen[6]),
			.tap_or(prop[6]),
			.y(alu_pggen_y[6])
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(143.3189),
			.L_tap_xor(419.3757),
			.L_tap_nand(113.6033),
			.L_tap_and(181.5246),
			.L_tap_or(240.829),
			.L_y(164.4588)
		) alu_pggen_inst7 (
			.xor_in1(op2val[7]),
			.xor_in2(ctl_alu_inv_op2),
			.and_or_in2(op1dec[7]),
			.ao221_in2(ctl_alu_and),
			.ao221_in3(ctl_alu_or),
			.ao221_in5_n(shift[7]),
			.pch_n(exec_phase),
			.tap_xor(alu_pggen_tap_xor[7]),
			.tap_nand(alu_pggen_tap_nand[7]),
			.tap_and(gen[7]),
			.tap_or(prop[7]),
			.y(alu_pggen_y[7])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1448.148)
		) alu_result_inst0 (
			.in1(alu_and[0]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(carry_in),
			.in5(alu_pggen_y[0]),
			.y(res[0])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1980.822)
		) alu_result_inst1 (
			.in1(alu_and[1]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[0]),
			.in5(alu_pggen_y[1]),
			.y(res[1])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1926.701)
		) alu_result_inst2 (
			.in1(alu_and[2]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[1]),
			.in5(alu_pggen_y[2]),
			.y(res[2])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1864.478)
		) alu_result_inst3 (
			.in1(alu_and[3]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[2]),
			.in5(alu_pggen_y[3]),
			.y(res[3])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1825.224)
		) alu_result_inst4 (
			.in1(alu_and[4]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[3]),
			.in5(alu_pggen_y[4]),
			.y(res[4])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1756.737)
		) alu_result_inst5 (
			.in1(alu_and[5]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[4]),
			.in5(alu_pggen_y[5]),
			.y(res[5])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1733.387)
		) alu_result_inst6 (
			.in1(alu_and[6]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[5]),
			.in5(alu_pggen_y[6]),
			.y(res[6])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1700.332)
		) alu_result_inst7 (
			.in1(alu_and[7]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[6]),
			.in5(alu_pggen_y[7]),
			.y(res[7])
		);

	sm83_alu_shifter #(
			.L_y0(101.1216),
			.L_y1(127.9859),
			.L_y2(149.9083),
			.L_y3(126.2119),
			.L_y4(130.0134),
			.L_y5(140.9746),
			.L_y6(100.9315),
			.L_y7(143.3189)
		) alu_shifter_inst (
			.ena(exec_phase),
			.l(ctl_op_rlx_or_slx),
			.r(ctl_op_rrx_or_srx),
			.rl(ctl_op_rl),
			.rr(ctl_op_rr),
			.rlc(ctl_op_rlc),
			.rrc(ctl_op_rrc),
			.sra(ctl_op_sra),
			.swap(ctl_op_swap),
			.c(flag_c),
			.d0(op2val[0]),
			.d1(op2val[1]),
			.d2(op2val[2]),
			.d3(op2val[3]),
			.d4(op2val[4]),
			.d5(op2val[5]),
			.d6(op2val[6]),
			.d7(op2val[7]),
			.y0(shift[0]),
			.y1(shift[1]),
			.y2(shift[2]),
			.y3(shift[3]),
			.y4(shift[4]),
			.y5(shift[5]),
			.y6(shift[6]),
			.y7(shift[7])
		);

	sm83_nor8_alu #(
			.L_y(662.8661)
		) alu_zgen_inst (
			.in1(res[7]),
			.in2(res[6]),
			.in3(res[5]),
			.in4(res[4]),
			.in5(res[3]),
			.in6(res[2]),
			.in7(res[1]),
			.in8(res[0]),
			.y(res_zero)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db0),
			.L_b(L_d0)
		) dbus_bridge_inst0 (
			.a(db[0]),
			.b(d[0]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[0]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db1),
			.L_b(L_d1)
		) dbus_bridge_inst1 (
			.a(db[1]),
			.b(d[1]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[1]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db2),
			.L_b(L_d2)
		) dbus_bridge_inst2 (
			.a(db[2]),
			.b(d[2]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[2]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db3),
			.L_b(L_d3)
		) dbus_bridge_inst3 (
			.a(db[3]),
			.b(d[3]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[3]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db4),
			.L_b(L_d4)
		) dbus_bridge_inst4 (
			.a(db[4]),
			.b(d[4]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[4]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db5),
			.L_b(L_d5)
		) dbus_bridge_inst5 (
			.a(db[5]),
			.b(d[5]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[5]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db6),
			.L_b(L_d6)
		) dbus_bridge_inst6 (
			.a(db[6]),
			.b(d[6]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[6]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_b2b_wand_inj_a #(
			.L_a(L_db7),
			.L_b(L_d7)
		) dbus_bridge_inst7 (
			.a(db[7]),
			.b(d[7]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[7]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db0)
		) dbus_nand_inst0 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[0]),
			.y(db[0])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db1)
		) dbus_nand_inst1 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[1]),
			.y(db[1])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db2)
		) dbus_nand_inst2 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[2]),
			.y(db[2])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db3)
		) dbus_nand_inst3 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[3]),
			.y(db[3])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db4)
		) dbus_nand_inst4 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[4]),
			.y(db[4])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db5)
		) dbus_nand_inst5 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[5]),
			.y(db[5])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db6)
		) dbus_nand_inst6 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[6]),
			.y(db[6])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db7)
		) dbus_nand_inst7 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[7]),
			.y(db[7])
		);

	sm83_not_dbus #(
			.L_y(91.74437)
		) dbus_not_inst0 (
			.in(op2val[0]),
			.y(op2val_n[0])
		);

	sm83_not_dbus #(
			.L_y(88.38638)
		) dbus_not_inst1 (
			.in(op2val[1]),
			.y(op2val_n[1])
		);

	sm83_not_dbus #(
			.L_y(84.58473)
		) dbus_not_inst2 (
			.in(op2val[2]),
			.y(op2val_n[2])
		);

	sm83_not_dbus #(
			.L_y(80.71982)
		) dbus_not_inst3 (
			.in(op2val[3]),
			.y(op2val_n[3])
		);

	sm83_not_dbus #(
			.L_y(77.36179)
		) dbus_not_inst4 (
			.in(op2val[4]),
			.y(op2val_n[4])
		);

	sm83_not_dbus #(
			.L_y(74.06711)
		) dbus_not_inst5 (
			.in(op2val[5]),
			.y(op2val_n[5])
		);

	sm83_not_dbus #(
			.L_y(71.08923)
		) dbus_not_inst6 (
			.in(op2val[6]),
			.y(op2val_n[6])
		);

	sm83_not_dbus #(
			.L_y(66.654)
		) dbus_not_inst7 (
			.in(op2val[7]),
			.y(op2val_n[7])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(25.15366),
			.L_a_y(133.6882),
			.L_b_in(24.01319),
			.L_b_y(139.6459)
		) dec1_not1_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ldx_nn_a_m2_n),
			.a_y(ctl_op_ldx_nn_a_m2),
			.b_in(ctl_op_ldx_a_nn_m2_n),
			.b_y(ctl_op_ldx_a_nn_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.5201),
			.L_a_y(143.1289),
			.L_b_in(24.39338),
			.L_b_y(118.9889)
		) dec1_not10_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m1_n),
			.a_y(ctl_op_jr_m1),
			.b_in(ctl_op_m7_n),
			.b_y(ctl_op_m7)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77352),
			.L_a_y(112.9697),
			.L_b_in(24.4567),
			.L_b_y(73.81369)
		) dec1_not11_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m0_n),
			.a_y(ctl_op_jr_m0),
			.b_in(ctl_op_add_sp_e_m2_n),
			.b_y(ctl_op_add_sp_e_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333),
			.L_a_y(108.5346),
			.L_b_in(24.64675),
			.L_b_y(119.3057)
		) dec1_not12_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_res_b_r_m0_n),
			.a_y(ctl_op_res_b_r_m0),
			.b_in(ctl_op_ldhl_sp_e_m2_n),
			.b_y(ctl_op_ldhl_sp_e_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94989),
			.L_a_y(100.3612),
			.L_b_in(23.82309),
			.L_b_y(371.0325)
		) dec1_not13_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_res_b_hl_m1_n),
			.a_y(ctl_op_res_b_hl_m1),
			.b_in(ctl_op_rxxa_n),
			.b_y(ctl_op_rxxa)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333),
			.L_a_y(149.2746),
			.L_b_in(24.13991),
			.L_b_y(281.3156)
		) dec1_not14_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_bit_n),
			.a_y(ctl_op_bit),
			.b_in(ctl_op_ld_a_xxx_m1_n),
			.b_y(ctl_op_ld_a_xxx_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658),
			.L_a_y(232.0854),
			.L_b_in(24.20326),
			.L_b_y(117.3415)
		) dec1_not15_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_xxx_a_m0_n),
			.a_y(ctl_op_ld_xxx_a_m0),
			.b_in(ctl_op_ld_a_xxx_m0_n),
			.b_y(ctl_op_ld_a_xxx_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52005),
			.L_a_y(108.9781),
			.L_b_in(24.45675),
			.L_b_y(110.7522)
		) dec1_not16_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_n_a_m0_n),
			.a_y(ctl_op_ld_n_a_m0),
			.b_in(ctl_op_ld_c_a_m0_n),
			.b_y(ctl_op_ld_c_a_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71014),
			.L_a_y(82.11371),
			.L_b_in(23.82312),
			.L_b_y(115.3141)
		) dec1_not17_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_n_a_m1_n),
			.a_y(ctl_op_ld_n_a_m1),
			.b_in(ctl_op_ld_r_hl_m0_n),
			.b_y(ctl_op_ld_r_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88649),
			.L_a_y(144.4594),
			.L_b_in(24.01316),
			.L_b_y(409.7453)
		) dec1_not18_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_hl_ss_m0_n),
			.a_y(ctl_op_add_hl_ss_m0),
			.b_in(ctl_op_aux_alu_m0_n),
			.b_y(ctl_op_aux_alu_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993),
			.L_a_y(115.5042),
			.L_b_in(24.07649),
			.L_b_y(118.482)
		) dec1_not19_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_dec_ss_m0_n),
			.a_y(ctl_op_dec_ss_m0),
			.b_in(ctl_op_inc_ss_m0_n),
			.b_y(ctl_op_inc_ss_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45675),
			.L_a_y(150.594),
			.L_b_in(26.16745),
			.L_b_y(60.19141)
		) dec1_not2_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_alu_n),
			.a_y(ctl_op_alu),
			.b_in(ctl_op_ldx_a_nn_m3_n),
			.b_y(ctl_op_ldx_a_nn_m3)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993),
			.L_a_y(115.2507),
			.L_b_in(24.07658),
			.L_b_y(783.8822)
		) dec1_not20_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_push_qq_m0_n),
			.a_y(ctl_op_push_qq_m0),
			.b_in(ctl_op_push_qq_m1_n),
			.b_y(ctl_op_push_qq_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01321),
			.L_a_y(108.5979),
			.L_b_in(24.4567),
			.L_b_y(584.1736)
		) dec1_not21_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_r_r_m0_n),
			.a_y(ctl_op_ld_r_r_m0),
			.b_in(ctl_op_ld_or_halt_n),
			.b_y(ctl_op_ld_or_halt)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.2667),
			.L_a_y(107.9644),
			.L_b_in(23.75979),
			.L_b_y(1275.108)
		) dec1_not22_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_m0_n),
			.a_y(ctl_op_jp_m0),
			.b_in(ctl_op_cb_rxx_or_sxx_or_swap_n),
			.b_y(ctl_op_cb_rxx_or_sxx_or_swap)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64684),
			.L_a_y(108.3445),
			.L_b_in(23.82312),
			.L_b_y(108.9781)
		) dec1_not23_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_m1_n),
			.a_y(ctl_op_jp_m1),
			.b_in(ctl_op_jp_m2_n),
			.b_y(ctl_op_jp_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52015),
			.L_a_y(101.2483),
			.L_b_in(24.71022),
			.L_b_y(156.3076)
		) dec1_not24_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hl_n_m1_n),
			.a_y(ctl_op_ld_hl_n_m1),
			.b_in(ctl_op_add_hl_ss_m1_n),
			.b_y(ctl_op_add_hl_ss_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64675),
			.L_a_y(591.2065),
			.L_b_in(24.07658),
			.L_b_y(659.9194)
		) dec1_not25_inst (
			.pch_n(exec_phase),
			.a_in(dec1_y49_n),
			.a_y(dec1_y49),
			.b_in(dec1_y50_n),
			.b_y(dec1_y50)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39328),
			.L_a_y(108.788),
			.L_b_in(24.39333),
			.L_b_y(153.9634)
		) dec1_not26_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_pop_qq_m0_n),
			.a_y(ctl_op_pop_qq_m0),
			.b_in(ctl_op_push_qq_m2_n),
			.b_y(ctl_op_push_qq_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019),
			.L_a_y(108.7247),
			.L_b_in(23.56972),
			.L_b_y(101.5651)
		) dec1_not27_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_pop_qq_m1_n),
			.a_y(ctl_op_pop_qq_m1),
			.b_in(ctl_op_add_sp_e_m1_n),
			.b_y(ctl_op_add_sp_e_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.0911),
			.L_b_in(24.33),
			.L_b_y(101.4383)
		) dec1_not28_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_set_b_r_m0_n),
			.a_y(ctl_op_set_b_r_m0),
			.b_in(ctl_op_ldhl_sp_e_m1_n),
			.b_y(ctl_op_ldhl_sp_e_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71022),
			.L_a_y(106.7761),
			.L_b_in(24.45677),
			.L_b_y(107.3308)
		) dec1_not29_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_set_b_hl_m1_n),
			.a_y(ctl_op_set_b_hl_m1),
			.b_in(ctl_op_res_or_set_b_hl_m0_n),
			.b_y(ctl_op_res_or_set_b_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.20333),
			.L_a_y(65.45065),
			.L_b_in(24.5201),
			.L_b_y(77.36177)
		) dec1_not3_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_cc_nn_m1_n),
			.a_y(ctl_op_jp_cc_nn_m1),
			.b_in(ctl_op_call_cc_nn_m1_n),
			.b_y(ctl_op_call_cc_nn_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33007),
			.L_a_y(94.78561),
			.L_b_in(24.77357),
			.L_b_y(1735.794)
		) dec1_not30_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_m1_n),
			.a_y(ctl_op_ld_a_n_m1),
			.b_in(ctl_op_pop_qq_m2_n),
			.b_y(ctl_op_pop_qq_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.4567),
			.L_a_y(3036.742),
			.L_b_in(23.63305),
			.L_b_y(122.2203)
		) dec1_not31_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_nn_sp_m2_n),
			.a_y(ctl_op_ld_nn_sp_m2),
			.b_in(ctl_op_ld_nn_sp_m0_n),
			.b_y(ctl_op_ld_nn_sp_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.69642),
			.L_a_y(108.9782),
			.L_b_in(24.7101),
			.L_b_y(572.7054)
		) dec1_not32_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_sp_e_m0_n),
			.a_y(ctl_op_add_sp_e_m0),
			.b_in(ctl_op_ld_sp_hl_m0_n),
			.b_y(ctl_op_ld_sp_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01324),
			.L_a_y(539.9492),
			.L_b_in(23.94979),
			.L_b_y(119.1156)
		) dec1_not33_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_sp_e_m3_n),
			.a_y(ctl_op_add_sp_e_m3),
			.b_in(ctl_op_ldhl_sp_e_m0_n),
			.b_y(ctl_op_ldhl_sp_e_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996),
			.L_a_y(112.3995),
			.L_b_in(23.6964),
			.L_b_y(2022.321)
		) dec1_not34_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_nn_sp_m1_n),
			.a_y(ctl_op_ld_nn_sp_m1),
			.b_in(ctl_op_ld_nn_sp_m3_n),
			.b_y(ctl_op_ld_nn_sp_m3)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33),
			.L_a_y(102.8956),
			.L_b_in(23.94984),
			.L_b_y(113.2866)
		) dec1_not35_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hl_r_m0_n),
			.a_y(ctl_op_ld_hl_r_m0),
			.b_in(ctl_op_inc_or_dec_hl_m0_n),
			.b_y(ctl_op_inc_or_dec_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.82312),
			.L_a_y(88.0062),
			.L_b_in(24.39335),
			.L_b_y(113.7935)
		) dec1_not36_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_c_m0_n),
			.a_y(ctl_op_ld_a_c_m0),
			.b_in(ctl_op_inc_or_dec_hl_m1_n),
			.b_y(ctl_op_inc_or_dec_hl_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64682),
			.L_a_y(111.2591),
			.L_b_in(23.75979),
			.L_b_y(127.6691)
		) dec1_not37_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_m0_n),
			.a_y(ctl_op_ld_a_n_m0),
			.b_in(ctl_op_rst_t_m1_n),
			.b_y(ctl_op_rst_t_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63307),
			.L_a_y(115.8209),
			.L_b_in(24.52012),
			.L_b_y(125.5149)
		) dec1_not38_inst (
			.pch_n(exec_phase),
			.a_in(ctl_int_entry_m5_n),
			.a_y(ctl_int_entry_m5),
			.b_in(ctl_op_rst_t_m0_n),
			.b_y(ctl_op_rst_t_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13988),
			.L_a_y(115.3141),
			.L_b_in(23.69642),
			.L_b_y(125.4516)
		) dec1_not39_inst (
			.pch_n(exec_phase),
			.a_in(ctl_int_entry_m4_n),
			.a_y(ctl_int_entry_m4),
			.b_in(ctl_int_entry_m0_n),
			.b_y(ctl_int_entry_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.96356),
			.L_a_y(74.58278),
			.L_b_in(24.3934),
			.L_b_y(75.71906)
		) dec1_not4_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_cc_e_m0_n),
			.a_y(ctl_op_jr_cc_e_m0),
			.b_in(ctl_op_ret_cc_m0_n),
			.b_y(ctl_op_ret_cc_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.14001),
			.L_a_y(108.4713),
			.L_b_in(24.64677),
			.L_b_y(115.2507)
		) dec1_not40_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ret_or_reti_m0_n),
			.a_y(ctl_op_ret_or_reti_m0),
			.b_in(ctl_op_alu_a_r_n),
			.b_y(ctl_op_alu_a_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.1545),
			.L_b_in(24.2033),
			.L_b_y(617.0791)
		) dec1_not41_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ret_cc_m1_n),
			.a_y(ctl_op_ret_cc_m1),
			.b_in(ctl_op_jp_hl_n),
			.b_y(ctl_op_jp_hl)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88644),
			.L_a_y(356.7767),
			.L_b_in(24.64684),
			.L_b_y(119.4325)
		) dec1_not42_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_retx_m3_n),
			.a_y(ctl_op_retx_m3),
			.b_in(ctl_op_retx_m2_n),
			.b_y(ctl_op_retx_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26668),
			.L_a_y(113.4768),
			.L_b_in(23.94979),
			.L_b_y(125.8951)
		) dec1_not43_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hli_m0_n),
			.a_y(ctl_op_ld_hli_m0),
			.b_in(ctl_op_ld_hld_m0_n),
			.b_y(ctl_op_ld_hld_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984),
			.L_a_y(108.5346),
			.L_b_in(23.94991),
			.L_b_y(115.7575)
		) dec1_not44_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_dd_nn_m1_n),
			.a_y(ctl_op_ld_dd_nn_m1),
			.b_in(ctl_op_ld_dd_nn_m0_n),
			.b_y(ctl_op_ld_dd_nn_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.58345),
			.L_a_y(962.1758),
			.L_b_in(23.94981),
			.L_b_y(119.8126)
		) dec1_not45_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_dd_nn_m2_n),
			.a_y(ctl_op_ld_dd_nn_m2),
			.b_in(ctl_op_inc_or_dec_r_n),
			.b_y(ctl_op_inc_or_dec_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658),
			.L_a_y(108.8514),
			.L_b_in(24.26665),
			.L_b_y(112.2095)
		) dec1_not46_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_alu_a_n_m0_n),
			.a_y(ctl_op_alu_a_n_m0),
			.b_in(ctl_op_alu_a_hl_m0_n),
			.b_y(ctl_op_alu_a_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45668),
			.L_a_y(1867.543),
			.L_b_in(23.633),
			.L_b_y(2068.43)
		) dec1_not47_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_rst_t_m2_n),
			.a_y(ctl_op_rst_t_m2),
			.b_in(ctl_int_entry_m6_n),
			.b_y(ctl_int_entry_m6)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63312),
			.L_a_y(101.8819),
			.L_b_in(24.01319),
			.L_b_y(118.4187)
		) dec1_not48_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_cb_hl_m0_n),
			.a_y(ctl_op_cb_hl_m0),
			.b_in(ctl_op_cb_r_n),
			.b_y(ctl_op_cb_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77349),
			.L_a_y(108.4713),
			.L_b_in(24.20335),
			.L_b_y(112.4629)
		) dec1_not49_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_bit_b_hl_m1_n),
			.a_y(ctl_op_bit_b_hl_m1),
			.b_in(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n),
			.b_y(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019),
			.L_a_y(993.0952),
			.L_b_in(24.07656),
			.L_b_y(118.6721)
		) dec1_not5_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_n),
			.a_y(ctl_op_ld_a_n),
			.b_in(ctl_op_call_m0_n),
			.b_y(ctl_op_call_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996),
			.L_a_y(891.7831),
			.L_b_in(24.83691),
			.L_b_y(160.5532)
		) dec1_not50_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_di_or_ei_n),
			.a_y(ctl_op_di_or_ei),
			.b_in(ctl_op_inc_or_dec_m_n),
			.b_y(ctl_op_inc_or_dec_m)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13986),
			.L_a_y(688.7168),
			.L_b_in(24.01316),
			.L_b_y(582.8429)
		) dec1_not51_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_halt_n),
			.a_y(ctl_op_halt),
			.b_in(ctl_op_nop_or_stop_n),
			.b_y(ctl_op_nop_or_stop)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.75977),
			.L_a_y(844.9982),
			.L_b_in(25.15368),
			.L_b_y(L_prefix_cb)
		) dec1_not52_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m2_n),
			.a_y(ctl_op_jr_m2),
			.b_in(ctl_op_cb_prefix_n),
			.b_y(ctl_op_cb_prefix)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71021),
			.L_a_y(106.5705),
			.L_b_in(23.94986),
			.L_b_y(117.6584)
		) dec1_not53_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ldx_m0_n),
			.a_y(ctl_op_ldx_m0),
			.b_in(ctl_op_ldx_m1_n),
			.b_y(ctl_op_ldx_m1)
		);

	sm83_not_pch_dec1 #(
			.L_in(24.77352),
			.L_y(120.8264)
		) dec1_not54_inst (
			.pch_n(exec_phase),
			.in(dec1_y107_n),
			.y(dec1_y107)
		);

	sm83_not_dec1 #(
			.L_y(733.8287)
		) dec1_not55_inst (
			.in(in_intr),
			.y(in_intr_buf_n)
		);

	sm83_not_dec1 #(
			.L_y(775.2661)
		) dec1_not56_inst (
			.in(in_intr_n),
			.y(in_intr)
		);

	sm83_not_dec1 #(
			.L_y(733.8287)
		) dec1_not57_inst (
			.in(opcode[7]),
			.y(opcode_n_buf1[7])
		);

	sm83_not_dec1 #(
			.L_y(735.9197)
		) dec1_not58_inst (
			.in(opcode[6]),
			.y(opcode_n_buf1[6])
		);

	sm83_not_dec1 #(
			.L_y(733.7653)
		) dec1_not59_inst (
			.in(opcode[5]),
			.y(opcode_n_buf1[5])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689),
			.L_a_y(115.1874),
			.L_b_in(24.83689),
			.L_b_y(118.2286)
		) dec1_not6_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_call_m2_n),
			.a_y(ctl_op_call_m2),
			.b_in(ctl_op_call_m1_n),
			.b_y(ctl_op_call_m1)
		);

	sm83_not_dec1 #(
			.L_y(736.1731)
		) dec1_not60_inst (
			.in(opcode[4]),
			.y(opcode_n_buf1[4])
		);

	sm83_not_dec1 #(
			.L_y(733.7656)
		) dec1_not61_inst (
			.in(opcode[3]),
			.y(opcode_n_buf1[3])
		);

	sm83_not_dec1 #(
			.L_y(736.0464)
		) dec1_not62_inst (
			.in(opcode[2]),
			.y(opcode_n_buf1[2])
		);

	sm83_not_dec1 #(
			.L_y(733.5754)
		) dec1_not63_inst (
			.in(opcode[1]),
			.y(opcode_n_buf1[1])
		);

	sm83_not_dec1 #(
			.L_y(736.1732)
		) dec1_not64_inst (
			.in(opcode[0]),
			.y(opcode_n_buf1[0])
		);

	sm83_not_dec1 #(
			.L_y(1682.992)
		) dec1_not65_inst (
			.in(table_cb_n),
			.y(table_cb)
		);

	sm83_not_dec1 #(
			.L_y(807.4094)
		) dec1_not66_inst (
			.in(table_cb),
			.y(table_cb_buf_n)
		);

	sm83_not_dec1 #(
			.L_y(783.7559)
		) dec1_not67_inst (
			.in(mcyc[2]),
			.y(mcyc_n[2])
		);

	sm83_not_dec1 #(
			.L_y(898.4247)
		) dec1_not68_inst (
			.in(mcyc_n[2]),
			.y(mcyc_buf[2])
		);

	sm83_not_dec1 #(
			.L_y(790.6622)
		) dec1_not69_inst (
			.in(mcyc[1]),
			.y(mcyc_n[1])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689),
			.L_a_y(115.8209),
			.L_b_in(23.82316),
			.L_b_y(122.7271)
		) dec1_not7_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_call_m3_n),
			.a_y(ctl_op_call_m3),
			.b_in(ctl_op_call_m4_n),
			.b_y(ctl_op_call_m4)
		);

	sm83_not_dec1 #(
			.L_y(760.7565)
		) dec1_not70_inst (
			.in(mcyc_n[1]),
			.y(mcyc_buf[1])
		);

	sm83_not_dec1 #(
			.L_y(797.5051)
		) dec1_not71_inst (
			.in(mcyc[0]),
			.y(mcyc_n[0])
		);

	sm83_not_dec1 #(
			.L_y(767.8528)
		) dec1_not72_inst (
			.in(mcyc_n[0]),
			.y(mcyc_buf[0])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39335),
			.L_a_y(110.7522),
			.L_b_in(24.71017),
			.L_b_y(910.1583)
		) dec1_not8_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_x_n_m0_n),
			.a_y(ctl_op_ld_x_n_m0),
			.b_in(ctl_op_ld_x_n_n),
			.b_y(ctl_op_ld_x_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26658),
			.L_a_y(110.1186),
			.L_b_in(24.26668),
			.L_b_y(118.482)
		) dec1_not9_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_r_n_m2_n),
			.a_y(ctl_op_ld_r_n_m2),
			.b_in(ctl_op_m6_n),
			.b_y(ctl_op_m6)
		);

	sm83_buf_dec2 #(
			.L_y(2194.763)
		) dec2_buf1_inst (
			.in(ctl_op_jr_m2),
			.y(ctl_op_jr_m2_buf)
		);

	sm83_buf_dec2 #(
			.L_y(2840.086)
		) dec2_buf2_inst (
			.in(ctl_op_alu),
			.y(ctl_op_alu_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3240.817)
		) dec2_buf3_inst (
			.in(ctl_op_jr_m1),
			.y(ctl_op_jr_m1_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1319.713)
		) dec2_buf4_inst (
			.in(ctl_op_bit),
			.y(ctl_op_bit_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3914.644)
		) dec2_buf5_inst (
			.in(ctl_op_add_hl_ss_m0),
			.y(ctl_op_add_hl_ss_m0_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3451.25)
		) dec2_buf6_inst (
			.in(ctl_op_add_hl_ss_m1),
			.y(ctl_op_add_hl_ss_m1_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1653.807)
		) dec2_buf7_inst (
			.in(ctl_op_push_qq_m2),
			.y(ctl_op_push_qq_m2_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1441.553)
		) dec2_buf8_inst (
			.in(ctl_op_inc_or_dec_m),
			.y(ctl_op_inc_or_dec_m_buf)
		);

	sm83_not_x1_dec2 #(
			.L_y(449.6616)
		) dec2_not1_inst (
			.in(ctl_op_any_cc_n),
			.y(ctl_op_any_cc)
		);

	sm83_not_x1_dec2 #(
			.L_y(724.4951)
		) dec2_not10_inst (
			.in(ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n),
			.y(ctl_op_ld_xxx_a_or_ld_a_xxx_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(422.2905)
		) dec2_not11_inst (
			.in(ctl_op_ld_n_a_or_ld_c_a_exec_n),
			.y(ctl_op_ld_n_a_or_ld_c_a_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(790.9789)
		) dec2_not12_inst (
			.in(ctl_op_inc_or_dec_ss_m0_n),
			.y(ctl_op_inc_or_dec_ss_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(3157.203)
		) dec2_not13_inst (
			.in(ctl_op_ld_n_a_or_ld_a_n_m1_n),
			.y(ctl_op_ld_n_a_or_ld_a_n_m1)
		);

	sm83_not_x1_dec2 #(
			.L_y(1146.868)
		) dec2_not14_inst (
			.in(ctl_mread_n),
			.y(ctl_mread)
		);

	sm83_not_x1_dec2 #(
			.L_y(737.7572)
		) dec2_not15_inst (
			.in(next_mcyc_n[0]),
			.y(next_mcyc[0])
		);

	sm83_not_x1_dec2 #(
			.L_y(261.9276)
		) dec2_not16_inst (
			.in(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n),
			.y(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(2449.284)
		) dec2_not17_inst (
			.in(ctl_op_add_sp_e_or_ldhl_sp_e_m1_n),
			.y(ctl_op_add_sp_e_or_ldhl_sp_e_m1)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1463.207)
		) dec2_not18_inst (
			.in(ctl_op_set_exec_n),
			.y(ctl_op_set_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(1871.129)
		) dec2_not19_inst (
			.in(ctl_reg_pc_to_idu_en_n),
			.y(ctl_reg_pc_to_idu_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(1286.548)
		) dec2_not2_inst (
			.in(ctl_op_ld_nn_sp_or_ldx_exec_n),
			.y(ctl_op_ld_nn_sp_or_ldx_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(L_m1)
		) dec2_not20_inst (
			.in(ctl_fetch_n),
			.y(ctl_fetch)
		);

	sm83_not_x1_pch_dec2 #(
			.L_in(117.9752),
			.L_y(628.6649)
		) dec2_not21_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ld_nn_sp_exec_n),
			.y(ctl_op_ld_nn_sp_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(1763.355)
		) dec2_not22_inst (
			.in(ctl_reg_pch_to_db_en_n),
			.y(ctl_reg_pch_to_db_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(2388.254)
		) dec2_not23_inst (
			.in(ctl_op_ld_c_a_or_ld_a_c_m0_n),
			.y(ctl_op_ld_c_a_or_ld_a_c_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(399.1641)
		) dec2_not24_inst (
			.in(ctl_push_or_pop_exec_n),
			.y(ctl_push_or_pop_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(821.8345)
		) dec2_not25_inst (
			.in(ctl_idu_inc_n),
			.y(ctl_idu_inc)
		);

	sm83_not_x1_dec2 #(
			.L_y(410.4431)
		) dec2_not26_inst (
			.in(next_mcyc_n[2]),
			.y(next_mcyc[2])
		);

	sm83_not_x1_dec2 #(
			.L_y(385.5424)
		) dec2_not27_inst (
			.in(next_mcyc_n[1]),
			.y(next_mcyc[1])
		);

	sm83_not_x1_dec2 #(
			.L_y(1697.145)
		) dec2_not28_inst (
			.in(ctl_reg_pcl_to_db_en_n),
			.y(ctl_reg_pcl_to_db_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(805.9323)
		) dec2_not29_inst (
			.in(ctl_idu_dec_n),
			.y(ctl_idu_dec)
		);

	sm83_not_x1_dec2 #(
			.L_y(516.9491)
		) dec2_not3_inst (
			.in(ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n),
			.y(ctl_op_ldx_nn_a_or_ld_xxx_a_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(2425.271)
		) dec2_not30_inst (
			.in(ctl_reg_wz_to_reg_pc_en_n),
			.y(ctl_reg_wz_to_reg_pc_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(1099.159)
		) dec2_not31_inst (
			.in(dec2_y30_n),
			.y(dec2_y30)
		);

	sm83_not_x1_dec2 #(
			.L_y(866.6298)
		) dec2_not4_inst (
			.in(ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n),
			.y(ctl_op_ldx_a_nn_or_ld_a_xxx_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(L_wr)
		) dec2_not5_inst (
			.in(ctl_mwrite_n),
			.y(ctl_mwrite)
		);

	sm83_not_x2_dec2 #(
			.L_y(312.1717)
		) dec2_not6_inst (
			.in(opcode[7]),
			.y(spare_opcode7_n)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(3106.067)
		) dec2_not7_inst (
			.in(ctl_op_add_sp_e_or_ldhl_sp_e_m2_n),
			.y(ctl_op_add_sp_e_or_ldhl_sp_e_m2)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1466.136)
		) dec2_not8_inst (
			.in(ctl_op_res_exec_n),
			.y(ctl_op_res_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(803.7144)
		) dec2_not9_inst (
			.in(ctl_mreq_n),
			.y(ctl_mreq)
		);

	sm83_pch_dec2_a #(
			.L_y(128.7463)
		) dec2_pch1_inst (
			.pch_n(exec_phase),
			.y(ctl_op_res_exec_n)
		);

	sm83_pch_dec2_c #(
			.L_y(87.11906)
		) dec2_pch2_inst (
			.pch_n(exec_phase),
			.y(ctl_op_ld_n_a_or_ld_c_a_exec_n)
		);

	sm83_pch_dec2_c #(
			.L_y(73.30678)
		) dec2_pch3_inst (
			.pch_n(exec_phase),
			.y(ctl_op_inc_or_dec_ss_m0_n)
		);

	sm83_pch_dec2_b #(
			.L_y(135.9692)
		) dec2_pch4_inst (
			.pch_n(exec_phase),
			.y(ctl_op_set_exec_n)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(72.16634),
			.L_y(1356.144)
		) dec3_nor1_inst (
			.pch_n(exec_phase),
			.in1(dec3_y56),
			.in2(write_phase_n),
			.y(ctl_idu_to_reg_gp_en)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(183.4254),
			.L_y(1387.824)
		) dec3_nor2_inst (
			.pch_n(exec_phase),
			.in1(dec3_y58),
			.in2(data_phase_buf_n),
			.y(ctl_alu_to_reg_gp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.93494),
			.L_y(1022.494)
		) dec3_not1_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rlx_or_slx_n),
			.y(ctl_op_rlx_or_slx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.20518),
			.L_y(568.7138)
		) dec3_not10_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sra_n),
			.y(ctl_op_sra)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.2998),
			.L_y(836.1541)
		) dec3_not11_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_or_adc_or_ldhl_exec_n),
			.y(ctl_op_add_or_adc_or_ldhl_exec)
		);

	sm83_not_pch_dec3_a #(
			.L_in(119.4324),
			.L_y(641.3873)
		) dec3_not12_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sub_or_sbc_or_cp_n),
			.y(ctl_op_sub_or_sbc_or_cp)
		);

	sm83_not_pch_dec3_a #(
			.L_in(114.8705),
			.L_y(739.8479)
		) dec3_not13_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_inv_cin_n),
			.y(ctl_alu_inv_cin)
		);

	sm83_not_pch_dec3_a #(
			.L_in(198.9485),
			.L_y(529.8747)
		) dec3_not14_inst (
			.pch_n(exec_phase),
			.in(dec3_y14_n),
			.y(dec3_y14)
		);

	sm83_not_pch_dec3_a #(
			.L_in(177.6597),
			.L_y(818.6035)
		) dec3_not15_inst (
			.pch_n(exec_phase),
			.in(ctl_op_inc_or_dec_m_or_ld_or_halt_n),
			.y(ctl_op_inc_or_dec_m_or_ld_or_halt)
		);

	sm83_not_pch_dec3_b #(
			.L_in(185.5796),
			.L_y(1632.328)
		) dec3_not16_inst (
			.pch_n(data_phase),
			.in(ctl_op2_to_db_en_n),
			.y(ctl_op2_to_db_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.74487),
			.L_y(1024.712)
		) dec3_not17_inst (
			.pch_n(exec_phase),
			.in(ctl_op_swap_n),
			.y(ctl_op_swap)
		);

	sm83_not_pch_dec3_a #(
			.L_in(53.72878),
			.L_y(352.591)
		) dec3_not18_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sxx_or_swap_n),
			.y(ctl_op_sxx_or_swap)
		);

	sm83_not_pch_dec3_a #(
			.L_in(65.64032),
			.L_y(1313.319)
		) dec3_not19_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_xor_n),
			.y(ctl_alu_xor)
		);

	sm83_not_pch_dec3_a #(
			.L_in(50.81425),
			.L_y(1098.715)
		) dec3_not2_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rrx_or_srx_n),
			.y(ctl_op_rrx_or_srx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(171.007),
			.L_y(1668.44)
		) dec3_not20_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_and_n),
			.y(ctl_alu_and)
		);

	sm83_not_pch_dec3_a #(
			.L_in(143.8892),
			.L_y(346.0118)
		) dec3_not21_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rxx_n),
			.y(ctl_op_rxx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(52.39824),
			.L_y(791.6124)
		) dec3_not22_inst (
			.pch_n(exec_phase),
			.in(ctl_op_scf_or_ccf_m0_n),
			.y(ctl_op_scf_or_ccf_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.15852),
			.L_y(1072.675)
		) dec3_not23_inst (
			.pch_n(exec_phase),
			.in(ctl_op_daa_m0_n),
			.y(ctl_op_daa_m0)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(63.35942),
			.L_y(507.1284)
		) dec3_not24_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_a_x_or_adc_a_x_n),
			.y(ctl_op_add_a_x_or_adc_a_x)
		);

	sm83_not_pch_dec3_a #(
			.L_in(75.01752),
			.L_y(572.8328)
		) dec3_not25_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sub_or_sbc_n),
			.y(ctl_op_sub_or_sbc)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.53),
			.L_y(1360.96)
		) dec3_not26_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_inv_op2_n),
			.y(ctl_alu_inv_op2)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.71207),
			.L_y(991.5748)
		) dec3_not27_inst (
			.pch_n(exec_phase),
			.in(ctl_op_cpl_m0_n),
			.y(ctl_op_cpl_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.58532),
			.L_y(488.3742)
		) dec3_not28_inst (
			.pch_n(exec_phase),
			.in(ctl_op_cp_n),
			.y(ctl_op_cp)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(132.1676),
			.L_y(961.7956)
		) dec3_not29_inst (
			.pch_n(data_phase),
			.in(ctl_flags_c_we_n),
			.y(ctl_flags_c_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(74.63734),
			.L_y(203.7004)
		) dec3_not3_inst (
			.pch_n(exec_phase),
			.in(ctl_op_or_or_set_exec_n),
			.y(ctl_op_or_or_set_exec)
		);

	sm83_not_pch_dec3_b #(
			.L_in(152.8862),
			.L_y(1111.134)
		) dec3_not30_inst (
			.pch_n(data_phase),
			.in(ctl_flags_znh_we_n),
			.y(ctl_flags_znh_we)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(90.54046),
			.L_y(515.8725)
		) dec3_not31_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_sp_e_m2_buf_n),
			.y(ctl_op_add_sp_e_m2_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.90703),
			.L_y(511.4374)
		) dec3_not32_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_sp_e_m1_buf_n),
			.y(ctl_op_add_sp_e_m1_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(88.06954),
			.L_y(358.6774)
		) dec3_not33_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rxxa_or_daa_or_cpl_m0_n),
			.y(ctl_op_rxxa_or_daa_or_cpl_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.03177),
			.L_y(919.2179)
		) dec3_not34_inst (
			.pch_n(exec_phase),
			.in(ctl_ff_to_op1_en_n),
			.y(ctl_ff_to_op1_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(190.9019),
			.L_y(480.8344)
		) dec3_not35_inst (
			.pch_n(exec_phase),
			.in(ctl_op_alu_or_alu_cb_or_ld_or_halt_n),
			.y(ctl_op_alu_or_alu_cb_or_ld_or_halt)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(184.4392),
			.L_y(1651.907)
		) dec3_not36_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_a_to_op2_en_n),
			.y(ctl_reg_a_to_op2_en)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(112.9697),
			.L_y(389.0099)
		) dec3_not37_inst (
			.pch_n(exec_phase),
			.in(dec3_y37_n),
			.y(dec3_y37)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(167.2054),
			.L_y(1567.005)
		) dec3_not38_inst (
			.pch_n(data_phase),
			.in(ctl_alu_to_db_en_n),
			.y(ctl_alu_to_db_en)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(279.7949),
			.L_y(1854.719)
		) dec3_not39_inst (
			.pch_n(data_phase),
			.in(ctl_reg_a_we_n),
			.y(ctl_reg_a_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(127.7959),
			.L_y(1194.895)
		) dec3_not4_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_add_n),
			.y(ctl_alu_add)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(170.6268),
			.L_y(1573.341)
		) dec3_not40_inst (
			.pch_n(data_phase),
			.in(ctl_reg_h_we_n),
			.y(ctl_reg_h_we)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(180.7643),
			.L_y(1821.899)
		) dec3_not41_inst (
			.pch_n(data_phase),
			.in(ctl_reg_l_we_n),
			.y(ctl_reg_l_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(78.37552),
			.L_y(1076.646)
		) dec3_not42_inst (
			.pch_n(exec_phase),
			.in(dec3_y42_n),
			.y(dec3_y42)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.1959),
			.L_y(1684.031)
		) dec3_not43_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_hl_to_idu_en_n),
			.y(ctl_reg_hl_to_idu_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(184.4938),
			.L_y(1636.573)
		) dec3_not44_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_h_to_op2_en_n),
			.y(ctl_reg_h_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(178.42),
			.L_y(1716.154)
		) dec3_not45_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_l_to_op2_en_n),
			.y(ctl_reg_l_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.7169),
			.L_y(1570.806)
		) dec3_not46_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_de_to_idu_en_n),
			.y(ctl_reg_de_to_idu_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.0237),
			.L_y(1573.404)
		) dec3_not47_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_d_to_op2_en_n),
			.y(ctl_reg_d_to_op2_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(182.1582),
			.L_y(1599.255)
		) dec3_not48_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_e_to_op2_en_n),
			.y(ctl_reg_e_to_op2_en)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.8276),
			.L_y(1578.536)
		) dec3_not49_inst (
			.pch_n(data_phase),
			.in(ctl_reg_d_we_n),
			.y(ctl_reg_d_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(207.7554),
			.L_y(1009.76)
		) dec3_not5_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_or_n),
			.y(ctl_alu_or)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.0811),
			.L_y(1512.452)
		) dec3_not50_inst (
			.pch_n(data_phase),
			.in(ctl_reg_b_we_n),
			.y(ctl_reg_b_we)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.9047),
			.L_y(1648.549)
		) dec3_not51_inst (
			.pch_n(data_phase),
			.in(ctl_reg_e_we_n),
			.y(ctl_reg_e_we)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.5109),
			.L_y(1555.093)
		) dec3_not52_inst (
			.pch_n(data_phase),
			.in(ctl_reg_c_we_n),
			.y(ctl_reg_c_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.86031),
			.L_y(1531.65)
		) dec3_not53_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_bc_to_idu_en_n),
			.y(ctl_reg_bc_to_idu_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(181.2712),
			.L_y(1539.126)
		) dec3_not54_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_b_to_op2_en_n),
			.y(ctl_reg_b_to_op2_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(194.1331),
			.L_y(1562.76)
		) dec3_not55_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_c_to_op2_en_n),
			.y(ctl_reg_c_to_op2_en)
		);

	sm83_not_pch_dec3_b #(
			.L_in(81.16339),
			.L_y(1372.174)
		) dec3_not56_inst (
			.pch_n(data_phase),
			.in(ctl_reg_wz_to_reg_gp_en_n),
			.y(ctl_reg_wz_to_reg_gp_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(179.4971),
			.L_y(1530.184)
		) dec3_not57_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_z_to_op2_en_n),
			.y(ctl_reg_z_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(123.8042),
			.L_y(1390.549)
		) dec3_not58_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_w_we_n),
			.y(ctl_reg_w_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(116.898),
			.L_y(1565.547)
		) dec3_not59_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_z_we_n),
			.y(ctl_reg_z_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(60.50823),
			.L_y(873.5993)
		) dec3_not6_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rlc_n),
			.y(ctl_op_rlc)
		);

	sm83_not_pch_dec3_a #(
			.L_in(56.83332),
			.L_y(2053.921)
		) dec3_not60_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_sp_we_n),
			.y(ctl_reg_sp_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(100.9948),
			.L_y(1333.462)
		) dec3_not61_inst (
			.pch_n(exec_phase),
			.in(ctl_idu_to_reg_sp_en_n),
			.y(ctl_idu_to_reg_sp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(96.62305),
			.L_y(1364.381)
		) dec3_not62_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_wz_to_reg_sp_en_n),
			.y(ctl_reg_wz_to_reg_sp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(48.27992),
			.L_y(476.2726)
		) dec3_not63_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ldhl_sp_e_m2_buf_n),
			.y(ctl_op_ldhl_sp_e_m2_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(110.182),
			.L_y(1342.015)
		) dec3_not64_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_sp_to_idu_en_n),
			.y(ctl_reg_sp_to_idu_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.73366),
			.L_y(490.4019)
		) dec3_not65_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ldhl_sp_e_m1_buf_n),
			.y(ctl_op_ldhl_sp_e_m1_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(86.48551),
			.L_y(1248.307)
		) dec3_not66_inst (
			.pch_n(exec_phase),
			.in(ctl_idu_to_reg_pc_en_n),
			.y(ctl_idu_to_reg_pc_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(69.25186),
			.L_y(2074.956)
		) dec3_not67_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_pc_we_n),
			.y(ctl_reg_pc_we)
		);

	sm83_not_dec3 #(
			.L_y(970.2233)
		) dec3_not68_inst (
			.in(data_phase),
			.y(data_phase_buf_n)
		);

	sm83_not_p2_dec3_a #(
			.L_y(1495.029)
		) dec3_not69_inst (
			.in(opcode[0]),
			.y(opcode_n_buf2[0])
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.13102),
			.L_y(885.004)
		) dec3_not7_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rl_n),
			.y(ctl_op_rl)
		);

	sm83_not_p2_dec3_a #(
			.L_y(409.1119)
		) dec3_not70_inst (
			.in(opcode[1]),
			.y(opcode_n_buf2[1])
		);

	sm83_not_p2_dec3_b #(
			.L_y(332.6374)
		) dec3_not71_inst (
			.in(opcode[2]),
			.y(opcode_n_buf2[2])
		);

	sm83_not_p2_dec3_b #(
			.L_y(1753.847)
		) dec3_not72_inst (
			.in(opcode[5]),
			.y(opcode_n_buf2[5])
		);

	sm83_not_p2_dec3_a #(
			.L_y(1766.083)
		) dec3_not73_inst (
			.in(opcode[4]),
			.y(opcode_n_buf2[4])
		);

	sm83_not_p2_dec3_a #(
			.L_y(1726.066)
		) dec3_not74_inst (
			.in(opcode[3]),
			.y(opcode_n_buf2[3])
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.33183),
			.L_y(556.2954)
		) dec3_not8_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rrc_n),
			.y(ctl_op_rrc)
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.57453),
			.L_y(563.5817)
		) dec3_not9_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rr_n),
			.y(ctl_op_rr)
		);

	sm83_decoder1 #(
			.L_y1(25.15366),
			.L_y2(24.01319),
			.L_y3(26.16745),
			.L_y4(24.45675),
			.L_y5(24.20333),
			.L_y6(24.5201),
			.L_y7(24.3934),
			.L_y8(24.96356),
			.L_y9(24.71019),
			.L_y10(24.07656),
			.L_y11(24.83689),
			.L_y12(24.83689),
			.L_y13(24.83689),
			.L_y14(23.82316),
			.L_y15(24.71017),
			.L_y16(24.39335),
			.L_y17(24.26658),
			.L_y18(24.26668),
			.L_y19(24.39338),
			.L_y20(24.5201),
			.L_y21(24.77352),
			.L_y22(24.4567),
			.L_y23(24.64675),
			.L_y24(24.39333),
			.L_y25(23.94989),
			.L_y26(23.82309),
			.L_y27(24.13991),
			.L_y28(24.39333),
			.L_y29(24.07658),
			.L_y30(24.20326),
			.L_y31(24.45675),
			.L_y32(24.52005),
			.L_y33(24.71014),
			.L_y34(23.82312),
			.L_y35(24.01316),
			.L_y36(23.88649),
			.L_y37(24.13993),
			.L_y38(24.07649),
			.L_y39(24.07658),
			.L_y40(24.13993),
			.L_y41(24.01321),
			.L_y42(24.4567),
			.L_y43(23.75979),
			.L_y44(24.2667),
			.L_y45(24.64684),
			.L_y46(23.82312),
			.L_y47(24.71022),
			.L_y48(24.52015),
			.L_y49(24.64675),
			.L_y50(24.07658),
			.L_y51(24.39333),
			.L_y52(24.39328),
			.L_y53(24.71019),
			.L_y54(23.56972),
			.L_y55(24.33),
			.L_y56(23.94984),
			.L_y57(24.71022),
			.L_y58(24.45677),
			.L_y59(24.77357),
			.L_y60(24.33007),
			.L_y61(24.4567),
			.L_y62(23.63305),
			.L_y63(24.7101),
			.L_y64(23.69642),
			.L_y65(24.01324),
			.L_y66(23.94979),
			.L_y67(23.6964),
			.L_y68(24.13996),
			.L_y69(24.33),
			.L_y70(23.94984),
			.L_y71(24.39335),
			.L_y72(23.82312),
			.L_y73(24.64682),
			.L_y74(23.75979),
			.L_y75(24.52012),
			.L_y76(23.63307),
			.L_y77(24.13988),
			.L_y78(23.69642),
			.L_y79(24.64677),
			.L_y80(24.14001),
			.L_y81(23.94984),
			.L_y82(24.2033),
			.L_y83(24.64684),
			.L_y84(23.88644),
			.L_y85(24.26668),
			.L_y86(23.94979),
			.L_y87(23.94991),
			.L_y88(23.94984),
			.L_y89(24.58345),
			.L_y90(23.94981),
			.L_y91(24.26665),
			.L_y92(24.07658),
			.L_y93(24.45668),
			.L_y94(23.633),
			.L_y95(24.01319),
			.L_y96(23.63312),
			.L_y97(24.77349),
			.L_y98(24.20335),
			.L_y99(24.83691),
			.L_y100(24.13996),
			.L_y101(24.13986),
			.L_y102(24.01316),
			.L_y103(25.15368),
			.L_y104(23.75977),
			.L_y105(24.71021),
			.L_y106(23.94986),
			.L_y107(24.77352)
		) decoder1_inst (
			.in1(mcyc_buf[0]),
			.in2(mcyc_n[0]),
			.in3(mcyc_buf[1]),
			.in4(mcyc_n[1]),
			.in5(mcyc_buf[2]),
			.in6(mcyc_n[2]),
			.in7(opcode[0]),
			.in8(opcode_n_buf1[0]),
			.in9(opcode[1]),
			.in10(opcode_n_buf1[1]),
			.in11(opcode[2]),
			.in12(opcode_n_buf1[2]),
			.in13(opcode[3]),
			.in14(opcode_n_buf1[3]),
			.in15(opcode[4]),
			.in16(opcode_n_buf1[4]),
			.in17(opcode[5]),
			.in18(opcode_n_buf1[5]),
			.in19(opcode[6]),
			.in20(opcode_n_buf1[6]),
			.in21(opcode[7]),
			.in22(opcode_n_buf1[7]),
			.in23(table_cb),
			.in24(table_cb_buf_n),
			.in25(in_intr),
			.in26(in_intr_buf_n),
			.in27(exec_phase),
			.y1(ctl_op_ldx_nn_a_m2_n),
			.y2(ctl_op_ldx_a_nn_m2_n),
			.y3(ctl_op_ldx_a_nn_m3_n),
			.y4(ctl_op_alu_n),
			.y5(ctl_op_jp_cc_nn_m1_n),
			.y6(ctl_op_call_cc_nn_m1_n),
			.y7(ctl_op_ret_cc_m0_n),
			.y8(ctl_op_jr_cc_e_m0_n),
			.y9(ctl_op_ld_a_n_n),
			.y10(ctl_op_call_m0_n),
			.y11(ctl_op_call_m1_n),
			.y12(ctl_op_call_m2_n),
			.y13(ctl_op_call_m3_n),
			.y14(ctl_op_call_m4_n),
			.y15(ctl_op_ld_x_n_n),
			.y16(ctl_op_ld_x_n_m0_n),
			.y17(ctl_op_ld_r_n_m2_n),
			.y18(ctl_op_m6_n),
			.y19(ctl_op_m7_n),
			.y20(ctl_op_jr_m1_n),
			.y21(ctl_op_jr_m0_n),
			.y22(ctl_op_add_sp_e_m2_n),
			.y23(ctl_op_ldhl_sp_e_m2_n),
			.y24(ctl_op_res_b_r_m0_n),
			.y25(ctl_op_res_b_hl_m1_n),
			.y26(ctl_op_rxxa_n),
			.y27(ctl_op_ld_a_xxx_m1_n),
			.y28(ctl_op_bit_n),
			.y29(ctl_op_ld_xxx_a_m0_n),
			.y30(ctl_op_ld_a_xxx_m0_n),
			.y31(ctl_op_ld_c_a_m0_n),
			.y32(ctl_op_ld_n_a_m0_n),
			.y33(ctl_op_ld_n_a_m1_n),
			.y34(ctl_op_ld_r_hl_m0_n),
			.y35(ctl_op_aux_alu_m0_n),
			.y36(ctl_op_add_hl_ss_m0_n),
			.y37(ctl_op_dec_ss_m0_n),
			.y38(ctl_op_inc_ss_m0_n),
			.y39(ctl_op_push_qq_m1_n),
			.y40(ctl_op_push_qq_m0_n),
			.y41(ctl_op_ld_r_r_m0_n),
			.y42(ctl_op_ld_or_halt_n),
			.y43(ctl_op_cb_rxx_or_sxx_or_swap_n),
			.y44(ctl_op_jp_m0_n),
			.y45(ctl_op_jp_m1_n),
			.y46(ctl_op_jp_m2_n),
			.y47(ctl_op_add_hl_ss_m1_n),
			.y48(ctl_op_ld_hl_n_m1_n),
			.y49(dec1_y49_n),
			.y50(dec1_y50_n),
			.y51(ctl_op_push_qq_m2_n),
			.y52(ctl_op_pop_qq_m0_n),
			.y53(ctl_op_pop_qq_m1_n),
			.y54(ctl_op_add_sp_e_m1_n),
			.y55(ctl_op_ldhl_sp_e_m1_n),
			.y56(ctl_op_set_b_r_m0_n),
			.y57(ctl_op_set_b_hl_m1_n),
			.y58(ctl_op_res_or_set_b_hl_m0_n),
			.y59(ctl_op_pop_qq_m2_n),
			.y60(ctl_op_ld_a_n_m1_n),
			.y61(ctl_op_ld_nn_sp_m2_n),
			.y62(ctl_op_ld_nn_sp_m0_n),
			.y63(ctl_op_ld_sp_hl_m0_n),
			.y64(ctl_op_add_sp_e_m0_n),
			.y65(ctl_op_add_sp_e_m3_n),
			.y66(ctl_op_ldhl_sp_e_m0_n),
			.y67(ctl_op_ld_nn_sp_m3_n),
			.y68(ctl_op_ld_nn_sp_m1_n),
			.y69(ctl_op_ld_hl_r_m0_n),
			.y70(ctl_op_inc_or_dec_hl_m0_n),
			.y71(ctl_op_inc_or_dec_hl_m1_n),
			.y72(ctl_op_ld_a_c_m0_n),
			.y73(ctl_op_ld_a_n_m0_n),
			.y74(ctl_op_rst_t_m1_n),
			.y75(ctl_op_rst_t_m0_n),
			.y76(ctl_int_entry_m5_n),
			.y77(ctl_int_entry_m4_n),
			.y78(ctl_int_entry_m0_n),
			.y79(ctl_op_alu_a_r_n),
			.y80(ctl_op_ret_or_reti_m0_n),
			.y81(ctl_op_ret_cc_m1_n),
			.y82(ctl_op_jp_hl_n),
			.y83(ctl_op_retx_m2_n),
			.y84(ctl_op_retx_m3_n),
			.y85(ctl_op_ld_hli_m0_n),
			.y86(ctl_op_ld_hld_m0_n),
			.y87(ctl_op_ld_dd_nn_m0_n),
			.y88(ctl_op_ld_dd_nn_m1_n),
			.y89(ctl_op_ld_dd_nn_m2_n),
			.y90(ctl_op_inc_or_dec_r_n),
			.y91(ctl_op_alu_a_hl_m0_n),
			.y92(ctl_op_alu_a_n_m0_n),
			.y93(ctl_op_rst_t_m2_n),
			.y94(ctl_int_entry_m6_n),
			.y95(ctl_op_cb_r_n),
			.y96(ctl_op_cb_hl_m0_n),
			.y97(ctl_op_bit_b_hl_m1_n),
			.y98(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n),
			.y99(ctl_op_inc_or_dec_m_n),
			.y100(ctl_op_di_or_ei_n),
			.y101(ctl_op_halt_n),
			.y102(ctl_op_nop_or_stop_n),
			.y103(ctl_op_cb_prefix_n),
			.y104(ctl_op_jr_m2_n),
			.y105(ctl_op_ldx_m0_n),
			.y106(ctl_op_ldx_m1_n),
			.y107(dec1_y107_n)
		);

	sm83_decoder2 #(
			.L_y1(146.4446),
			.L_y2(80.64444),
			.L_y3(123.3607),
			.L_y4(178.7919),
			.L_y5(810.7727),
			.L_y6(128.7463),
			.L_y7(253.6498),
			.L_y8(1004.437),
			.L_y9(263.6385),
			.L_y10(87.11906),
			.L_y11(73.30678),
			.L_y12(487.9358),
			.L_y13(735.7932),
			.L_y14(787.6213),
			.L_y15(821.4548),
			.L_y16(501.0464),
			.L_y17(135.9692),
			.L_y18(939.6211),
			.L_y19(757.3352),
			.L_y20(117.9752),
			.L_y21(537.0345),
			.L_y22(561.0481),
			.L_y23(661.9796),
			.L_y24(789.7766),
			.L_y25(750.8091),
			.L_y26(800.3059),
			.L_y27(668.5049),
			.L_y28(636.3187),
			.L_y29(712.4767),
			.L_y30(798.8004)
		) decoder2_inst (
			.pch_n(exec_phase),
			.in1(ctl_op_ld_nn_sp_exec),
			.in2(ctl_op_jr_m2),
			.in3(ctl_op_jr_m1),
			.in4(ctl_op_ld_a_xxx_m1),
			.in5(ctl_op_aux_alu_m0),
			.in6(ctl_op_add_hl_ss_m0),
			.in7(ctl_op_push_qq_m1),
			.in8(ctl_op_add_hl_ss_m1),
			.in9(ctl_op_push_qq_m2),
			.in10(ctl_op_pop_qq_m2),
			.in11(ctl_op_ld_nn_sp_m2),
			.in12(ctl_op_ld_sp_hl_m0),
			.in13(ctl_op_add_sp_e_m3),
			.in14(ctl_op_ld_nn_sp_m3),
			.in15(ctl_op_jp_hl),
			.in16(ctl_op_retx_m3),
			.in17(ctl_op_ld_dd_nn_m2),
			.in18(ctl_op_rst_t_m2),
			.in19(ctl_int_entry_m6),
			.in20(ctl_op_di_or_ei),
			.in21(ctl_op_halt),
			.in22(ctl_op_nop_or_stop),
			.in23(ctl_op_cb_prefix),
			.in24(ctl_op_ldx_nn_a_m2),
			.in25(ctl_op_ldx_a_nn_m2),
			.in26(ctl_op_ldx_a_nn_m3),
			.in27(ctl_op_jp_cc_nn_m1),
			.in28(ctl_op_call_cc_nn_m1),
			.in29(ctl_op_ret_cc_m0),
			.in30(ctl_op_jr_cc_e_m0),
			.in31(ctl_op_call_m0),
			.in32(ctl_op_call_m1),
			.in33(ctl_op_call_m2),
			.in34(ctl_op_call_m3),
			.in35(ctl_op_call_m4),
			.in36(ctl_op_ld_x_n_m0),
			.in37(ctl_op_ld_r_n_m2),
			.in38(ctl_op_m6),
			.in39(ctl_op_m7),
			.in40(ctl_op_jr_m0),
			.in41(ctl_op_add_sp_e_m2),
			.in42(ctl_op_ldhl_sp_e_m2),
			.in43(ctl_op_res_b_r_m0),
			.in44(ctl_op_res_b_hl_m1),
			.in45(ctl_op_ld_xxx_a_m0),
			.in46(ctl_op_ld_a_xxx_m0),
			.in47(ctl_op_ld_c_a_m0),
			.in48(ctl_op_ld_n_a_m0),
			.in49(ctl_op_ld_n_a_m1),
			.in50(ctl_op_ld_r_hl_m0),
			.in51(ctl_op_dec_ss_m0),
			.in52(ctl_op_inc_ss_m0),
			.in53(ctl_op_push_qq_m0),
			.in54(ctl_op_ld_r_r_m0),
			.in55(ctl_op_jp_m0),
			.in56(ctl_op_jp_m1),
			.in57(ctl_op_jp_m2),
			.in58(ctl_op_ld_hl_n_m1),
			.in59(ctl_op_pop_qq_m0),
			.in60(ctl_op_pop_qq_m1),
			.in61(ctl_op_add_sp_e_m1),
			.in62(ctl_op_ldhl_sp_e_m1),
			.in63(ctl_op_set_b_r_m0),
			.in64(ctl_op_set_b_hl_m1),
			.in65(ctl_op_res_or_set_b_hl_m0),
			.in66(ctl_op_ld_a_n_m1),
			.in67(ctl_op_ld_nn_sp_m0),
			.in68(ctl_op_add_sp_e_m0),
			.in69(ctl_op_ldhl_sp_e_m0),
			.in70(ctl_op_ld_nn_sp_m1),
			.in71(ctl_op_ld_hl_r_m0),
			.in72(ctl_op_inc_or_dec_hl_m0),
			.in73(ctl_op_inc_or_dec_hl_m1),
			.in74(ctl_op_ld_a_c_m0),
			.in75(ctl_op_ld_a_n_m0),
			.in76(ctl_op_rst_t_m1),
			.in77(ctl_op_rst_t_m0),
			.in78(ctl_int_entry_m5),
			.in79(ctl_int_entry_m4),
			.in80(ctl_int_entry_m0),
			.in81(ctl_op_alu_a_r),
			.in82(ctl_op_ret_or_reti_m0),
			.in83(ctl_op_ret_cc_m1),
			.in84(ctl_op_retx_m2),
			.in85(ctl_op_ld_hli_m0),
			.in86(ctl_op_ld_hld_m0),
			.in87(ctl_op_ld_dd_nn_m0),
			.in88(ctl_op_ld_dd_nn_m1),
			.in89(ctl_op_inc_or_dec_r),
			.in90(ctl_op_alu_a_hl_m0),
			.in91(ctl_op_alu_a_n_m0),
			.in92(ctl_op_cb_r),
			.in93(ctl_op_cb_hl_m0),
			.in94(ctl_op_bit_b_hl_m1),
			.in95(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1),
			.in96(ctl_op_ldx_m0),
			.in97(ctl_op_ldx_m1),
			.y1(ctl_op_any_cc_n),
			.y2(ctl_op_ld_nn_sp_or_ldx_exec_n),
			.y3(ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n),
			.y4(ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n),
			.y5(ctl_mwrite_n),
			.y6(ctl_op_res_exec_n),
			.y7(ctl_op_add_sp_e_or_ldhl_sp_e_m2_n),
			.y8(ctl_mreq_n),
			.y9(ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n),
			.y10(ctl_op_ld_n_a_or_ld_c_a_exec_n),
			.y11(ctl_op_inc_or_dec_ss_m0_n),
			.y12(ctl_op_ld_n_a_or_ld_a_n_m1_n),
			.y13(ctl_mread_n),
			.y14(next_mcyc_n[0]),
			.y15(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n),
			.y16(ctl_op_add_sp_e_or_ldhl_sp_e_m1_n),
			.y17(ctl_op_set_exec_n),
			.y18(ctl_reg_pc_to_idu_en_n),
			.y19(ctl_fetch_n),
			.y20(ctl_op_ld_nn_sp_exec_n),
			.y21(ctl_reg_pch_to_db_en_n),
			.y22(ctl_op_ld_c_a_or_ld_a_c_m0_n),
			.y23(ctl_push_or_pop_exec_n),
			.y24(ctl_idu_inc_n),
			.y25(next_mcyc_n[2]),
			.y26(next_mcyc_n[1]),
			.y27(ctl_reg_pcl_to_db_en_n),
			.y28(ctl_idu_dec_n),
			.y29(ctl_reg_wz_to_reg_pc_en_n),
			.y30(dec2_y30_n)
		);

	sm83_decoder3 #(
			.L_y1(68.93494),
			.L_y2(50.81425),
			.L_y3(74.63734),
			.L_y4(127.7959),
			.L_y5(207.7554),
			.L_y6(60.50823),
			.L_y7(51.13102),
			.L_y8(61.33183),
			.L_y9(51.57453),
			.L_y10(61.20518),
			.L_y11(137.2998),
			.L_y12(119.4324),
			.L_y13(114.8705),
			.L_y14(198.9485),
			.L_y15(177.6597),
			.L_y16(185.5796),
			.L_y17(68.74487),
			.L_y18(53.72878),
			.L_y19(65.64032),
			.L_y20(171.007),
			.L_y21(143.8892),
			.L_y22(52.39824),
			.L_y23(53.15852),
			.L_y24(63.35942),
			.L_y25(75.01752),
			.L_y26(186.53),
			.L_y27(61.71207),
			.L_y28(61.58532),
			.L_y29(132.1676),
			.L_y30(152.8862),
			.L_y31(90.54046),
			.L_y32(89.90703),
			.L_y33(88.06954),
			.L_y34(53.03177),
			.L_y35(190.9019),
			.L_y36(184.4392),
			.L_y37(112.9697),
			.L_y38(167.2054),
			.L_y39(279.7949),
			.L_y40(170.6268),
			.L_y41(180.7643),
			.L_y42(78.37552),
			.L_y43(137.1959),
			.L_y44(184.4938),
			.L_y45(178.42),
			.L_y46(89.7169),
			.L_y47(186.0237),
			.L_y48(182.1582),
			.L_y49(180.8276),
			.L_y50(181.0811),
			.L_y51(181.9047),
			.L_y52(180.5109),
			.L_y53(81.86031),
			.L_y54(181.2712),
			.L_y55(194.1331),
			.L_y56(72.16634),
			.L_y57(81.16339),
			.L_y58(183.4254),
			.L_y59(179.4971),
			.L_y60(123.8042),
			.L_y61(116.898),
			.L_y62(56.83332),
			.L_y63(100.9948),
			.L_y64(96.62305),
			.L_y65(48.27992),
			.L_y66(110.182),
			.L_y67(81.73366),
			.L_y68(86.48551),
			.L_y69(69.25186)
		) decoder3_inst (
			.in1(ctl_op_or_or_set_exec),
			.in2(ctl_op_add_or_adc_or_ldhl_exec),
			.in3(ctl_op_sub_or_sbc_or_cp),
			.in4(dec3_y14),
			.in5(ctl_op_inc_or_dec_m_or_ld_or_halt),
			.in6(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in7(ctl_op_push_qq_m2_buf),
			.in8(ctl_op_sxx_or_swap),
			.in9(ctl_op_rxx),
			.in10(ctl_op_daa_m0),
			.in11(ctl_op_add_a_x_or_adc_a_x),
			.in12(ctl_op_sub_or_sbc),
			.in13(ctl_op_cpl_m0),
			.in14(ctl_op_cp),
			.in15(ctl_flags_c_we),
			.in16(ctl_op_add_sp_e_m2_buf),
			.in17(ctl_op_add_sp_e_m1_buf),
			.in18(ctl_op_rxxa_or_daa_or_cpl_m0),
			.in19(ctl_op_alu_buf),
			.in20(ctl_op_alu_or_alu_cb_or_ld_or_halt),
			.in21(dec3_y37),
			.in22(data_phase),
			.in23(ctl_op_add_hl_ss_m1_buf),
			.in24(ctl_op_ld_n_a_or_ld_a_n_m1),
			.in25(ctl_op_jr_m1_buf),
			.in26(ctl_op_ld_nn_sp_m2),
			.in27(ctl_idu_to_reg_sp_en),
			.in28(ctl_reg_wz_to_reg_sp_en),
			.in29(ctl_op_add_hl_ss_m0_buf),
			.in30(ctl_op_ldhl_sp_e_m2_buf),
			.in31(ctl_op_ld_c_a_or_ld_a_c_m0),
			.in32(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in33(ctl_op_ldhl_sp_e_m1_buf),
			.in34(ctl_reg_pc_to_idu_en),
			.in35(ctl_idu_to_reg_pc_en),
			.in36(ctl_reg_wz_to_reg_pc_en),
			.in37(ctl_op_ld_a_n),
			.in38(ctl_op_ld_x_n),
			.in39(ctl_op_ldx_nn_a_or_ld_xxx_a_exec),
			.in40(ctl_op_ld_n_a_or_ld_c_a_exec),
			.in41(data_phase),
			.in42(ctl_op_ldx_a_nn_or_ld_a_xxx_exec),
			.in43(ctl_op_res_exec),
			.in44(ctl_op_rxxa),
			.in45(ctl_op_aux_alu_m0),
			.in46(ctl_op_inc_or_dec_ss_m0),
			.in47(ctl_op_bit_buf),
			.in48(ctl_op_ld_or_halt),
			.in49(ctl_op_push_qq_m1),
			.in50(ctl_mread),
			.in51(ctl_op_ld_dd_nn_m2),
			.in52(ctl_op_cb_rxx_or_sxx_or_swap),
			.in53(table_cb),
			.in54(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec),
			.in55(ctl_op_set_exec),
			.in56(ctl_mwrite),
			.in57(data_phase),
			.in58(data_phase),
			.in59(ctl_op_ld_xxx_a_or_ld_a_xxx_m0),
			.in60(dec2_y30),
			.in61(ctl_op_pop_qq_m2),
			.in62(data_phase),
			.in63(ctl_op_retx_m3),
			.in64(ctl_op_jp_hl),
			.in65(data_phase),
			.in66(ctl_op_ld_dd_nn_m2),
			.in67(ctl_op_ld_sp_hl_m0),
			.in68(ctl_op_inc_or_dec_m_buf),
			.in69(ctl_push_or_pop_exec),
			.in70(ctl_op_add_sp_e_m3),
			.in71(dec2_y30),
			.in72(xdqf),
			.in73(vequ_tap_in1),
			.in74(exec_phase),
			.in75(opcode[5]),
			.in76(opcode_n_buf2[5]),
			.in77(opcode[4]),
			.in78(opcode_n_buf2[4]),
			.in79(opcode[3]),
			.in80(opcode_n_buf2[3]),
			.in81(opcode[2]),
			.in82(opcode[1]),
			.in83(opcode[0]),
			.in84(opcode_n_buf2[0]),
			.in85(exec_phase),
			.in86(ctl_op_jr_m2_buf),
			.in87(ctl_int_entry_m6),
			.in88(opcode_n_buf2[2]),
			.in89(opcode_n_buf2[1]),
			.in90(ctl_op_rst_t_m2),
			.y1(ctl_op_rlx_or_slx_n),
			.y2(ctl_op_rrx_or_srx_n),
			.y3(ctl_op_or_or_set_exec_n),
			.y4(ctl_alu_add_n),
			.y5(ctl_alu_or_n),
			.y6(ctl_op_rlc_n),
			.y7(ctl_op_rl_n),
			.y8(ctl_op_rrc_n),
			.y9(ctl_op_rr_n),
			.y10(ctl_op_sra_n),
			.y11(ctl_op_add_or_adc_or_ldhl_exec_n),
			.y12(ctl_op_sub_or_sbc_or_cp_n),
			.y13(ctl_alu_inv_cin_n),
			.y14(dec3_y14_n),
			.y15(ctl_op_inc_or_dec_m_or_ld_or_halt_n),
			.y16(ctl_op2_to_db_en_n),
			.y17(ctl_op_swap_n),
			.y18(ctl_op_sxx_or_swap_n),
			.y19(ctl_alu_xor_n),
			.y20(ctl_alu_and_n),
			.y21(ctl_op_rxx_n),
			.y22(ctl_op_scf_or_ccf_m0_n),
			.y23(ctl_op_daa_m0_n),
			.y24(ctl_op_add_a_x_or_adc_a_x_n),
			.y25(ctl_op_sub_or_sbc_n),
			.y26(ctl_alu_inv_op2_n),
			.y27(ctl_op_cpl_m0_n),
			.y28(ctl_op_cp_n),
			.y29(ctl_flags_c_we_n),
			.y30(ctl_flags_znh_we_n),
			.y31(ctl_op_add_sp_e_m2_buf_n),
			.y32(ctl_op_add_sp_e_m1_buf_n),
			.y33(ctl_op_rxxa_or_daa_or_cpl_m0_n),
			.y34(ctl_ff_to_op1_en_n),
			.y35(ctl_op_alu_or_alu_cb_or_ld_or_halt_n),
			.y36(ctl_reg_a_to_op2_en_n),
			.y37(dec3_y37_n),
			.y38(ctl_alu_to_db_en_n),
			.y39(ctl_reg_a_we_n),
			.y40(ctl_reg_h_we_n),
			.y41(ctl_reg_l_we_n),
			.y42(dec3_y42_n),
			.y43(ctl_reg_hl_to_idu_en_n),
			.y44(ctl_reg_h_to_op2_en_n),
			.y45(ctl_reg_l_to_op2_en_n),
			.y46(ctl_reg_de_to_idu_en_n),
			.y47(ctl_reg_d_to_op2_en_n),
			.y48(ctl_reg_e_to_op2_en_n),
			.y49(ctl_reg_d_we_n),
			.y50(ctl_reg_b_we_n),
			.y51(ctl_reg_e_we_n),
			.y52(ctl_reg_c_we_n),
			.y53(ctl_reg_bc_to_idu_en_n),
			.y54(ctl_reg_b_to_op2_en_n),
			.y55(ctl_reg_c_to_op2_en_n),
			.y56(dec3_y56),
			.y57(ctl_reg_wz_to_reg_gp_en_n),
			.y58(dec3_y58),
			.y59(ctl_reg_z_to_op2_en_n),
			.y60(ctl_reg_w_we_n),
			.y61(ctl_reg_z_we_n),
			.y62(ctl_reg_sp_we_n),
			.y63(ctl_idu_to_reg_sp_en_n),
			.y64(ctl_reg_wz_to_reg_sp_en_n),
			.y65(ctl_op_ldhl_sp_e_m2_buf_n),
			.y66(ctl_reg_sp_to_idu_en_n),
			.y67(ctl_op_ldhl_sp_e_m1_buf_n),
			.y68(ctl_idu_to_reg_pc_en_n),
			.y69(ctl_reg_pc_we_n)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(343.9147),
			.L_q(694.989),
			.L_q_n(1991.006)
		) flag_c_inst (
			.d(new_flag_c_n),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(ctl_flags_c_we),
			.q(flag_c_n),
			.q_n(flag_c)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(204.2707),
			.L_q(344.2949),
			.L_q_n(1505.42)
		) flag_h_inst (
			.d(new_flag_h_n),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(ctl_flags_znh_we),
			.q(flag_h_n),
			.q_n(flag_h)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(173.0344),
			.L_q(339.036),
			.L_q_n(1354.244)
		) flag_n_inst (
			.d(new_flag_n_n),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(ctl_flags_znh_we),
			.q(flag_n_n),
			.q_n(flag_n)
		);

	sm83_dffn_ee_pch_d_alu_flag #(
			.L_d(465.8182),
			.L_q(111.6392),
			.L_q_n(1257.494)
		) flag_z_inst (
			.d(new_flag_z_n),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(ctl_flags_znh_we),
			.q(flag_z_n),
			.q_n(flag_z)
		);

	sm83_idu_bit0 #(
			.L_aoi_buf_y(70.96249),
			.L_aoi_y_n(87.2458),
			.L_zero_y(70.96249),
			.L_or_y(101.9452),
			.L_buf_a_y(L_a0),
			.L_buf_b_y(L_a8),
			.L_buf_ena(628.145)
		) idu_inst0 (
			.pch_n(data_phase),
			.aoi_buf_ena(idu_chain_ena[8]),
			.aoi_buf_y(idu_chain_hi[0]),
			.aoi_in1(idu_cpl_mask[7]),
			.aoi_in2(idu_chain_ena[7]),
			.aoi_in3(idu_ctl_y1),
			.aoi_y_n(idu_cpl_mask[8]),
			.zero_ena(idu_chain_ena[0]),
			.zero_y(idu_chain_lo[0]),
			.or_in1(idu_inc),
			.or_in2(idu_dec),
			.or_y(idu_cpl_mask[0]),
			.buf_a_in(idu_in[0]),
			.buf_a_y(a[0]),
			.buf_b_in(idu_in[8]),
			.buf_b_y(a[8]),
			.buf_ena(oe),
			.buf_ena_n(oe_n)
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a1),
			.L_buf_b_y(L_a9),
			.L_chain_a_in(70.96249),
			.L_chain_a_y(70.70909),
			.L_chain_a_y_n(93.70848),
			.L_chain_b_in(70.96249),
			.L_chain_b_y(70.77242),
			.L_chain_b_y_n(85.59849)
		) idu_inst1 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[1]),
			.buf_a_y(a[1]),
			.buf_b_in(idu_in[9]),
			.buf_b_y(a[9]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[0]),
			.chain_a_ena(idu_chain_ena[1]),
			.chain_a_y(idu_chain_lo[1]),
			.chain_a_y_n(idu_cpl_mask[1]),
			.chain_b_in(idu_chain_hi[0]),
			.chain_b_ena(idu_chain_ena[9]),
			.chain_b_y(idu_chain_hi[1]),
			.chain_b_y_n(idu_cpl_mask[9])
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a2),
			.L_buf_b_y(L_a10),
			.L_chain_a_in(70.70909),
			.L_chain_a_y(71.08923),
			.L_chain_a_y_n(93.51851),
			.L_chain_b_in(70.77242),
			.L_chain_b_y(71.15256),
			.L_chain_b_y_n(85.97872)
		) idu_inst2 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[2]),
			.buf_a_y(a[2]),
			.buf_b_in(idu_in[10]),
			.buf_b_y(a[10]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[1]),
			.chain_a_ena(idu_chain_ena[2]),
			.chain_a_y(idu_chain_lo[2]),
			.chain_a_y_n(idu_cpl_mask[2]),
			.chain_b_in(idu_chain_hi[1]),
			.chain_b_ena(idu_chain_ena[10]),
			.chain_b_y(idu_chain_hi[2]),
			.chain_b_y_n(idu_cpl_mask[10])
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a3),
			.L_buf_b_y(L_a11),
			.L_chain_a_in(71.08923),
			.L_chain_a_y(73.24343),
			.L_chain_a_y_n(93.58174),
			.L_chain_b_in(71.15256),
			.L_chain_b_y(73.24343),
			.L_chain_b_y_n(86.10538)
		) idu_inst3 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[3]),
			.buf_a_y(a[3]),
			.buf_b_in(idu_in[11]),
			.buf_b_y(a[11]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[2]),
			.chain_a_ena(idu_chain_ena[3]),
			.chain_a_y(idu_chain_lo[3]),
			.chain_a_y_n(idu_cpl_mask[3]),
			.chain_b_in(idu_chain_hi[2]),
			.chain_b_ena(idu_chain_ena[11]),
			.chain_b_y(idu_chain_hi[3]),
			.chain_b_y_n(idu_cpl_mask[11])
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a4),
			.L_buf_b_y(L_a12),
			.L_chain_a_in(73.24343),
			.L_chain_a_y(73.24343),
			.L_chain_a_y_n(94.15195),
			.L_chain_b_in(73.24343),
			.L_chain_b_y(73.49692),
			.L_chain_b_y_n(86.48551)
		) idu_inst4 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[4]),
			.buf_a_y(a[4]),
			.buf_b_in(idu_in[12]),
			.buf_b_y(a[12]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[3]),
			.chain_a_ena(idu_chain_ena[4]),
			.chain_a_y(idu_chain_lo[4]),
			.chain_a_y_n(idu_cpl_mask[4]),
			.chain_b_in(idu_chain_hi[3]),
			.chain_b_ena(idu_chain_ena[12]),
			.chain_b_y(idu_chain_hi[4]),
			.chain_b_y_n(idu_cpl_mask[12])
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a5),
			.L_buf_b_y(L_a13),
			.L_chain_a_in(73.24343),
			.L_chain_a_y(73.43349),
			.L_chain_a_y_n(94.53218),
			.L_chain_b_in(73.49692),
			.L_chain_b_y(73.1801),
			.L_chain_b_y_n(86.73891)
		) idu_inst5 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[5]),
			.buf_a_y(a[5]),
			.buf_b_in(idu_in[13]),
			.buf_b_y(a[13]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[4]),
			.chain_a_ena(idu_chain_ena[5]),
			.chain_a_y(idu_chain_lo[5]),
			.chain_a_y_n(idu_cpl_mask[5]),
			.chain_b_in(idu_chain_hi[4]),
			.chain_b_ena(idu_chain_ena[13]),
			.chain_b_y(idu_chain_hi[5]),
			.chain_b_y_n(idu_cpl_mask[13])
		);

	sm83_idu_bit123456 #(
			.L_buf_a_y(L_a6),
			.L_buf_b_y(L_a14),
			.L_chain_a_in(73.43349),
			.L_chain_a_y(79.1359),
			.L_chain_a_y_n(93.13827),
			.L_chain_b_in(73.1801),
			.L_chain_b_y(45.74548),
			.L_chain_b_y_n(86.48561)
		) idu_inst6 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[6]),
			.buf_a_y(a[6]),
			.buf_b_in(idu_in[14]),
			.buf_b_y(a[14]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.chain_a_in(idu_chain_lo[5]),
			.chain_a_ena(idu_chain_ena[6]),
			.chain_a_y(idu_chain_lo[6]),
			.chain_a_y_n(idu_cpl_mask[6]),
			.chain_b_in(idu_chain_hi[5]),
			.chain_b_ena(idu_chain_ena[14]),
			.chain_b_y(idu_chain_hi[6]),
			.chain_b_y_n(idu_cpl_mask[14])
		);

	sm83_idu_bit7 #(
			.L_buf_a_y(L_a7),
			.L_buf_b_y(L_a15),
			.L_not_a_in(79.1359),
			.L_not_a_y(665.9705),
			.L_not_b_in(45.74548),
			.L_not_b_y(86.42229)
		) idu_inst7 (
			.pch_n(data_phase),
			.buf_a_in(idu_in[7]),
			.buf_a_y(a[7]),
			.buf_b_in(idu_in[15]),
			.buf_b_y(a[15]),
			.buf_ena(oe),
			.buf_ena_n(oe_n),
			.not_a_in(idu_chain_lo[6]),
			.not_a_y(idu_cpl_mask[7]),
			.not_b_in(idu_chain_hi[6]),
			.not_b_y(idu_cpl_mask[15])
		);

	sm83_idu_ctl #(
			.L_y1(167.4589),
			.L_y2(859.0264),
			.L_y3(892.8605)
		) idu_ctl_inst (
			.in1(ctl_idu_dec),
			.in2(reg_z[7]),
			.in3(ctl_op_jr_m1_buf),
			.in4(res_carry[7]),
			.in5(ctl_idu_inc),
			.y1(idu_ctl_y1),
			.y2(idu_dec),
			.y3(idu_inc)
		);

	sm83_mux_idu_h #(
			.L_y(42.07062)
		) idu_mux_h_inst0 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[8]),
			.y(idu_chain_ena[8])
		);

	sm83_mux_idu_h #(
			.L_y(42.83091)
		) idu_mux_h_inst1 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[9]),
			.y(idu_chain_ena[9])
		);

	sm83_mux_idu_h #(
			.L_y(42.32402)
		) idu_mux_h_inst2 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[10]),
			.y(idu_chain_ena[10])
		);

	sm83_mux_idu_h #(
			.L_y(42.45077)
		) idu_mux_h_inst3 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[11]),
			.y(idu_chain_ena[11])
		);

	sm83_mux_idu_h #(
			.L_y(41.75391)
		) idu_mux_h_inst4 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[12]),
			.y(idu_chain_ena[12])
		);

	sm83_mux_idu_h #(
			.L_y(41.88065)
		) idu_mux_h_inst5 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[13]),
			.y(idu_chain_ena[13])
		);

	sm83_mux_idu_h #(
			.L_y(41.94397)
		) idu_mux_h_inst6 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[14]),
			.y(idu_chain_ena[14])
		);

	sm83_mux_idu_h #(
		) idu_mux_h_inst7 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[15]),
			.y()
		);

	sm83_mux_idu_l #(
			.L_y(47.45621)
		) idu_mux_l_inst0 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[0]),
			.y(idu_chain_ena[0])
		);

	sm83_mux_idu_l #(
			.L_y(47.32937)
		) idu_mux_l_inst1 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[1]),
			.y(idu_chain_ena[1])
		);

	sm83_mux_idu_l #(
			.L_y(47.1393)
		) idu_mux_l_inst2 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[2]),
			.y(idu_chain_ena[2])
		);

	sm83_mux_idu_l #(
			.L_y(47.58295)
		) idu_mux_l_inst3 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[3]),
			.y(idu_chain_ena[3])
		);

	sm83_mux_idu_l #(
			.L_y(46.94932)
		) idu_mux_l_inst4 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[4]),
			.y(idu_chain_ena[4])
		);

	sm83_mux_idu_l #(
			.L_y(47.01265)
		) idu_mux_l_inst5 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[5]),
			.y(idu_chain_ena[5])
		);

	sm83_mux_idu_l #(
			.L_y(47.70961)
		) idu_mux_l_inst6 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[6]),
			.y(idu_chain_ena[6])
		);

	sm83_mux_idu_l #(
			.L_y(601.5339)
		) idu_mux_l_inst7 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[7]),
			.y(idu_chain_ena[7])
		);

	sm83_not2_idu #(
			.L_a_y(130.2036),
			.L_b_y(187.9238)
		) idu_not_inst0 (
			.a_in(idu_in_n[0]),
			.a_y(idu_in[0]),
			.b_in(idu_in_n[8]),
			.b_y(idu_in[8])
		);

	sm83_not2_idu #(
			.L_a_y(129.7599),
			.L_b_y(189.1277)
		) idu_not_inst1 (
			.a_in(idu_in_n[1]),
			.a_y(idu_in[1]),
			.b_in(idu_in_n[9]),
			.b_y(idu_in[9])
		);

	sm83_not2_idu #(
			.L_a_y(129.9501),
			.L_b_y(187.0369)
		) idu_not_inst2 (
			.a_in(idu_in_n[2]),
			.a_y(idu_in[2]),
			.b_in(idu_in_n[10]),
			.b_y(idu_in[10])
		);

	sm83_not2_idu #(
			.L_a_y(130.7739),
			.L_b_y(187.6071)
		) idu_not_inst3 (
			.a_in(idu_in_n[3]),
			.a_y(idu_in[3]),
			.b_in(idu_in_n[11]),
			.b_y(idu_in[11])
		);

	sm83_not2_idu #(
			.L_a_y(130.3936),
			.L_b_y(188.9376)
		) idu_not_inst4 (
			.a_in(idu_in_n[4]),
			.a_y(idu_in[4]),
			.b_in(idu_in_n[12]),
			.b_y(idu_in[12])
		);

	sm83_not2_idu #(
			.L_a_y(130.5837),
			.L_b_y(188.2408)
		) idu_not_inst5 (
			.a_in(idu_in_n[5]),
			.a_y(idu_in[5]),
			.b_in(idu_in_n[13]),
			.b_y(idu_in[13])
		);

	sm83_not2_idu #(
			.L_a_y(130.2036),
			.L_b_y(187.3537)
		) idu_not_inst6 (
			.a_in(idu_in_n[6]),
			.a_y(idu_in[6]),
			.b_in(idu_in_n[14]),
			.b_y(idu_in[14])
		);

	sm83_not2_idu #(
			.L_a_y(131.2174),
			.L_b_y(187.1001)
		) idu_not_inst7 (
			.a_in(idu_in_n[7]),
			.a_y(idu_in[7]),
			.b_in(idu_in_n[15]),
			.b_y(idu_in[15])
		);

	sm83_xor_idu_h #(
			.L_y(562.8847)
		) idu_xor_h_inst0 (
			.in1(idu_in[8]),
			.in2(idu_cpl_mask[8]),
			.y(idu_out[8])
		);

	sm83_xor_idu_h #(
			.L_y(562.8846)
		) idu_xor_h_inst1 (
			.in1(idu_in[9]),
			.in2(idu_cpl_mask[9]),
			.y(idu_out[9])
		);

	sm83_xor_idu_h #(
			.L_y(563.0115)
		) idu_xor_h_inst2 (
			.in1(idu_in[10]),
			.in2(idu_cpl_mask[10]),
			.y(idu_out[10])
		);

	sm83_xor_idu_h #(
			.L_y(564.0886)
		) idu_xor_h_inst3 (
			.in1(idu_in[11]),
			.in2(idu_cpl_mask[11]),
			.y(idu_out[11])
		);

	sm83_xor_idu_h #(
			.L_y(563.5818)
		) idu_xor_h_inst4 (
			.in1(idu_in[12]),
			.in2(idu_cpl_mask[12]),
			.y(idu_out[12])
		);

	sm83_xor_idu_h #(
			.L_y(563.9619)
		) idu_xor_h_inst5 (
			.in1(idu_in[13]),
			.in2(idu_cpl_mask[13]),
			.y(idu_out[13])
		);

	sm83_xor_idu_h #(
			.L_y(563.0748)
		) idu_xor_h_inst6 (
			.in1(idu_in[14]),
			.in2(idu_cpl_mask[14]),
			.y(idu_out[14])
		);

	sm83_xor_idu_h #(
			.L_y(563.5184)
		) idu_xor_h_inst7 (
			.in1(idu_in[15]),
			.in2(idu_cpl_mask[15]),
			.y(idu_out[15])
		);

	sm83_xor_idu_l #(
			.L_y(683.1409)
		) idu_xor_l_inst0 (
			.in1(idu_in[0]),
			.in2(idu_cpl_mask[0]),
			.y(idu_out[0])
		);

	sm83_xor_idu_l #(
			.L_y(683.0775)
		) idu_xor_l_inst1 (
			.in1(idu_in[1]),
			.in2(idu_cpl_mask[1]),
			.y(idu_out[1])
		);

	sm83_xor_idu_l #(
			.L_y(682.7608)
		) idu_xor_l_inst2 (
			.in1(idu_in[2]),
			.in2(idu_cpl_mask[2]),
			.y(idu_out[2])
		);

	sm83_xor_idu_l #(
			.L_y(684.6615)
		) idu_xor_l_inst3 (
			.in1(idu_in[3]),
			.in2(idu_cpl_mask[3]),
			.y(idu_out[3])
		);

	sm83_xor_idu_l #(
			.L_y(683.3942)
		) idu_xor_l_inst4 (
			.in1(idu_in[4]),
			.in2(idu_cpl_mask[4]),
			.y(idu_out[4])
		);

	sm83_xor_idu_l #(
			.L_y(684.6616)
		) idu_xor_l_inst5 (
			.in1(idu_in[5]),
			.in2(idu_cpl_mask[5]),
			.y(idu_out[5])
		);

	sm83_xor_idu_l #(
			.L_y(684.2812)
		) idu_xor_l_inst6 (
			.in1(idu_in[6]),
			.in2(idu_cpl_mask[6]),
			.y(idu_out[6])
		);

	sm83_xor_idu_l #(
			.L_y(684.218)
		) idu_xor_l_inst7 (
			.in1(idu_in[7]),
			.in2(idu_cpl_mask[7]),
			.y(idu_out[7])
		);

	sm83_and2_irq #(
			.L_y(863.3351)
		) irq_and_inst (
			.in1(irq_head_e_y),
			.in2(ctl_mwrite),
			.y(ie_we)
		);

	sm83_not5_irq #(
			.L_a_y(669.772),
			.L_b_y(655.7697),
			.L_c_y(1019.579),
			.L_d_y(L_ffxx),
			.L_e_y(858.076)
		) irq_head_inst (
			.a_in(irq_prio_nand_a_y),
			.a_y(irq_head_a_y),
			.b_in(zrby),
			.b_y(irq_head_b_y),
			.c_in(irq_prio_dist_nor_y),
			.c_y(irq_head_c_y),
			.d_in(irq_prio_dist_nand_b_y),
			.d_y(ffxx),
			.e_in(irq_prio_dist_nand_a_y),
			.e_y(irq_head_e_y)
		);

	sm83_dlatch_ee_irq #(
			.L_q(561.3008),
			.L_q_n(160.8694),
			.L_gated_q_n(111.069)
		) irq_latch_inst0 (
			.d(irq_nand2_nand3[0]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[0]),
			.q_n(irq_latch_n[0]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[0]),
			.gated_q_n(irq_latch_gated_q_n[0])
		);

	sm83_dlatch_ee_irq #(
			.L_q(489.1978),
			.L_q_n(161.1864),
			.L_gated_q_n(110.942)
		) irq_latch_inst1 (
			.d(irq_nand2_nand3[1]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[1]),
			.q_n(irq_latch_n[1]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[1]),
			.gated_q_n(irq_latch_gated_q_n[1])
		);

	sm83_dlatch_ee_irq #(
			.L_q(417.1582),
			.L_q_n(162.3268),
			.L_gated_q_n(111.7659)
		) irq_latch_inst2 (
			.d(irq_nand2_nand3[2]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[2]),
			.q_n(irq_latch_n[2]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[2]),
			.gated_q_n(irq_latch_gated_q_n[2])
		);

	sm83_dlatch_ee_irq #(
			.L_q(345.3086),
			.L_q_n(161.0596),
			.L_gated_q_n(111.2591)
		) irq_latch_inst3 (
			.d(irq_nand2_nand3[3]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[3]),
			.q_n(irq_latch_n[3]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[3]),
			.gated_q_n(irq_latch_gated_q_n[3])
		);

	sm83_dlatch_ee_irq #(
			.L_q(270.3546),
			.L_q_n(161.8834),
			.L_gated_q_n(111.1957)
		) irq_latch_inst4 (
			.d(irq_nand2_nand3[4]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[4]),
			.q_n(irq_latch_n[4]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[4]),
			.gated_q_n(irq_latch_gated_q_n[4])
		);

	sm83_dlatch_ee_irq #(
			.L_q(196.9843),
			.L_q_n(161.2496),
			.L_gated_q_n(112.1461)
		) irq_latch_inst5 (
			.d(irq_nand2_nand3[5]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[5]),
			.q_n(irq_latch_n[5]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[5]),
			.gated_q_n(irq_latch_gated_q_n[5])
		);

	sm83_dlatch_ee_irq #(
			.L_q(122.2202),
			.L_q_n(161.9467),
			.L_gated_q_n(117.8484)
		) irq_latch_inst6 (
			.d(irq_nand2_nand3[6]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(irq_latch[6]),
			.q_n(irq_latch_n[6]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[6]),
			.gated_q_n(irq_latch_gated_q_n[6])
		);

	sm83_dlatch_ee_irq #(
			.L_q_n(161.7565),
			.L_gated_q_n(114.7438)
		) irq_latch_inst7 (
			.d(irq_nand2_nand3[7]),
			.ena(data_phase_n),
			.ena_n(data_phase),
			.q(),
			.q_n(irq_latch_n[7]),
			.pch_n(write_phase),
			.ena_q_n(irq_prio_nand_b_y[7]),
			.gated_q_n(irq_latch_gated_q_n[7])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.19398),
			.L_b_y(L_db0)
		) irq_nand2_nand3_inst0 (
			.a_in1(reg_ie[0]),
			.a_in2(\int [0]),
			.a_y(irq_nand2_nand3[0]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[0]),
			.b_y(db[0])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.76408),
			.L_b_y(L_db1)
		) irq_nand2_nand3_inst1 (
			.a_in1(reg_ie[1]),
			.a_in2(\int [1]),
			.a_y(irq_nand2_nand3[1]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[1]),
			.b_y(db[1])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.44727),
			.L_b_y(L_db2)
		) irq_nand2_nand3_inst2 (
			.a_in1(reg_ie[2]),
			.a_in2(\int [2]),
			.a_y(irq_nand2_nand3[2]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[2]),
			.b_y(db[2])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.89084),
			.L_b_y(L_db3)
		) irq_nand2_nand3_inst3 (
			.a_in1(reg_ie[3]),
			.a_in2(\int [3]),
			.a_y(irq_nand2_nand3[3]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[3]),
			.b_y(db[3])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.13046),
			.L_b_y(L_db4)
		) irq_nand2_nand3_inst4 (
			.a_in1(reg_ie[4]),
			.a_in2(\int [4]),
			.a_y(irq_nand2_nand3[4]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[4]),
			.b_y(db[4])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.19378),
			.L_b_y(L_db5)
		) irq_nand2_nand3_inst5 (
			.a_in1(reg_ie[5]),
			.a_in2(\int [5]),
			.a_y(irq_nand2_nand3[5]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[5]),
			.b_y(db[5])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.5106),
			.L_b_y(L_db6)
		) irq_nand2_nand3_inst6 (
			.a_in1(reg_ie[6]),
			.a_in2(\int [6]),
			.a_y(irq_nand2_nand3[6]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[6]),
			.b_y(db[6])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.63734),
			.L_b_y(L_db7)
		) irq_nand2_nand3_inst7 (
			.a_in1(reg_ie[7]),
			.a_in2(\int [7]),
			.a_y(irq_nand2_nand3[7]),
			.b_in1(rd),
			.b_in2(irq_head_e_y),
			.b_in3(reg_ie_n[7]),
			.b_y(db[7])
		);

	sm83_irq_prio_bit0 #(
			.L_and_y(L_inta0),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(28.00484),
			.L_dist_nand_a_y_n(638.7894),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(711.0825),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(764.9379)
		) irq_prio_inst0 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[0]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[0]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_y(irq_prio_nand_b_y[0]),
			.dist_nand_a_in1(ffxx),
			.dist_nand_a_in2(a[0]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n1),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[8]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n1),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[0]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p1),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y)
		);

	sm83_irq_prio_bit1 #(
			.L_and_y(L_inta1),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.597758),
			.L_nand_c_y(502.3766),
			.L_dist_nand_a_y_n(25.15368),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.30141),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.70909)
		) irq_prio_inst1 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[1]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[1]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[1]),
			.nand_c_y(int_vector_n3),
			.dist_nand_a_in(a[1]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n2),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n1),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[9]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n2),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n1),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[1]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p2),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p1)
		);

	sm83_irq_prio_bit2 #(
			.L_and_y(L_inta2),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.407687),
			.L_nand_c_y(417.3482),
			.L_dist_nand_a_y_n(71.08923),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.11134),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.58234)
		) irq_prio_inst2 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[2]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[2]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[1]),
			.nand_b_in4(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[2]),
			.nand_c_y(int_vector_n4),
			.dist_nand_a_in(a[2]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n3),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n2),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[10]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n3),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n2),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[2]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p3),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p2)
		);

	sm83_irq_prio_bit3 #(
			.L_and_y(L_inta3),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.090871),
			.L_nand_c_y(417.3482),
			.L_nand_d_y(502.3766),
			.L_nand_d_y_n(404.4863),
			.L_dist_nand_a_y_n(70.58234),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(68.30141),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(70.83584)
		) irq_prio_inst3 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[3]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[3]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[2]),
			.nand_b_in4(irq_latch[1]),
			.nand_b_in5(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[3]),
			.nand_c_y(int_vector_n4),
			.nand_d_y(int_vector_n3),
			.nand_d_y_n(int_vector3),
			.dist_nand_a_in(a[3]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n4),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n3),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[11]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n4),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n3),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[3]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p4),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p3)
		);

	sm83_irq_prio_bit4 #(
			.L_and_y(L_inta4),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.661082),
			.L_nand_c_y(254.7048),
			.L_not_in(417.3482),
			.L_not_y(404.4228),
			.L_dist_nand_a_y_n(72.73654),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.58234),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(72.99004)
		) irq_prio_inst4 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[4]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[4]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[3]),
			.nand_b_in4(irq_latch[2]),
			.nand_b_in5(irq_latch[1]),
			.nand_b_in6(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[4]),
			.nand_c_y(int_vector_n5),
			.not_in(int_vector_n4),
			.not_y(int_vector4),
			.dist_nand_a_in(a[4]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n5),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n4),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[12]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n5),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n4),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[4]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p5),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p4)
		);

	sm83_irq_prio_bit5 #(
			.L_and_y(L_inta5),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.471012),
			.L_nand_c_y(254.7048),
			.L_nand_c_y_n(404.5497),
			.L_nand_d_y(502.3766),
			.L_dist_nand_a_y_n(72.86329),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.77242),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(72.79996)
		) irq_prio_inst5 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[5]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[5]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[4]),
			.nand_b_in4(irq_latch[3]),
			.nand_b_in5(irq_latch[2]),
			.nand_b_in6(irq_latch[1]),
			.nand_b_in7(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[5]),
			.nand_c_y(int_vector_n5),
			.nand_c_y_n(int_vector5),
			.nand_d_y(int_vector_n3),
			.dist_nand_a_in(a[5]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n6),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n5),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[13]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n6),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n5),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[5]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p6),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p5)
		);

	sm83_irq_prio_bit6 #(
			.L_and_a_y(L_inta6),
			.L_and_b_y(394.919),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(2.851153),
			.L_nand_c_y(254.7048),
			.L_nand_d_y(417.3482),
			.L_dist_nand_a_y_n(72.99004),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(70.51902),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(73.43349)
		) irq_prio_inst6 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_a_y(inta[6]),
			.and_b_y(int_vector6),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n[6]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[5]),
			.nand_b_in4(irq_latch[4]),
			.nand_b_in5(irq_latch[3]),
			.nand_b_in6(irq_latch[2]),
			.nand_b_in7(irq_latch[1]),
			.nand_b_in8(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[6]),
			.nand_c_y(int_vector_n5),
			.nand_d_y(int_vector_n4),
			.dist_nand_a_in(a[6]),
			.dist_nand_a_in_n(irq_prio_dist_nand_a_y_n7),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n6),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[14]),
			.dist_nand_b_in_n(irq_prio_dist_nand_b_y_n7),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n6),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in(irq_latch_n[6]),
			.dist_nor_in_p(irq_prio_dist_nor_y_p7),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p6)
		);

	sm83_irq_prio_bit7 #(
			.L_and_a_y(L_inta7),
			.L_and_b_y(394.7289),
			.L_nand_a_y(607.9968),
			.L_nand_b_y(3.041223),
			.L_nand_c_y(254.7048),
			.L_nand_d_y(417.3482),
			.L_nand_e_y(502.3766),
			.L_dist_nand_a_y_n(72.73654),
			.L_dist_nand_a_y_p(638.7894),
			.L_dist_nand_b_y_n(73.1801),
			.L_dist_nand_b_y_p(711.0825),
			.L_dist_nor_y_n(764.9379),
			.L_dist_nor_y_p(73.49692)
		) irq_prio_inst7 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_a_y(inta[7]),
			.and_b_y(int_vector7),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n[7]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(irq_head_b_y),
			.nand_b_in3(irq_latch[6]),
			.nand_b_in4(irq_latch[5]),
			.nand_b_in5(irq_latch[4]),
			.nand_b_in6(irq_latch[3]),
			.nand_b_in7(irq_latch[2]),
			.nand_b_in8(irq_latch[1]),
			.nand_b_in9(irq_latch[0]),
			.nand_b_y(irq_prio_nand_b_y[7]),
			.nand_c_y(int_vector_n5),
			.nand_d_y(int_vector_n4),
			.nand_e_y(int_vector_n3),
			.dist_nand_a_in(a[7]),
			.dist_nand_a_y_n(irq_prio_dist_nand_a_y_n7),
			.dist_nand_a_y_p(irq_prio_dist_nand_a_y),
			.dist_nand_b_in(a[15]),
			.dist_nand_b_y_n(irq_prio_dist_nand_b_y_n7),
			.dist_nand_b_y_p(irq_prio_dist_nand_b_y),
			.dist_nor_in2(irq_latch_n[7]),
			.dist_nor_y_n(irq_prio_dist_nor_y),
			.dist_nor_y_p(irq_prio_dist_nor_y_p7)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(184.6292)
		) reg_a_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[0])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(539.1253)
		) reg_a_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[1])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(460.8139)
		) reg_a_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[2])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(387.5061)
		) reg_a_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[3])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(538.6149)
		) reg_a_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[4])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(201.2294)
		) reg_a_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[5])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(390.6741)
		) reg_a_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[6])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(486.4894)
		) reg_a_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[7])
		);

	sm83_not_reg_a_we #(
			.L_y(638.3466)
		) reg_a_not_we_inst (
			.in(ctl_reg_a_we),
			.y(ctl_reg_a_we_buf_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1165.813),
			.L_b_y(1133.182)
		) reg_a_out_inst0 (
			.in(reg_a[0]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[0]),
			.b_y(op2bus_n[0])
		);

	sm83_reg_a_out #(
			.L_a_y(1165.75),
			.L_b_y(1134.133)
		) reg_a_out_inst1 (
			.in(reg_a[1]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[1]),
			.b_y(op2bus_n[1])
		);

	sm83_reg_a_out #(
			.L_a_y(1166.447),
			.L_b_y(1134.64)
		) reg_a_out_inst2 (
			.in(reg_a[2]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[2]),
			.b_y(op2bus_n[2])
		);

	sm83_reg_a_out #(
			.L_a_y(1164.292),
			.L_b_y(1133.879)
		) reg_a_out_inst3 (
			.in(reg_a[3]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[3]),
			.b_y(op2bus_n[3])
		);

	sm83_reg_a_out #(
			.L_a_y(1163.722),
			.L_b_y(1133.373)
		) reg_a_out_inst4 (
			.in(reg_a[4]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[4]),
			.b_y(op2bus_n[4])
		);

	sm83_reg_a_out #(
			.L_a_y(1163.785),
			.L_b_y(1131.472)
		) reg_a_out_inst5 (
			.in(reg_a[5]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[5]),
			.b_y(op2bus_n[5])
		);

	sm83_reg_a_out #(
			.L_a_y(1165.876),
			.L_b_y(1134.83)
		) reg_a_out_inst6 (
			.in(reg_a[6]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[6]),
			.b_y(op2bus_n[6])
		);

	sm83_reg_a_out #(
			.L_a_y(1164.609),
			.L_b_y(1134.64)
		) reg_a_out_inst7 (
			.in(reg_a[7]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[7]),
			.b_y(op2bus_n[7])
		);

	sm83_and2_reg #(
			.L_y(1850.822)
		) reg_and_inst (
			.in1(reg_a[7]),
			.in2(reg_a[4]),
			.y(daa_hi_ge9)
		);

	sm83_and2_and3_reg #(
			.L_a_y(652.0952),
			.L_b_y(644.8724)
		) reg_and2_and3_inst (
			.a_in1(reg_z7_delayed),
			.a_in2(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.a_y(ctl_ff_to_op2_en),
			.b_in1(opcode[4]),
			.b_in2(ctl_op_push_qq_m2_buf),
			.b_in3(opcode[5]),
			.b_y(ctl_flags_to_op2_en)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.45262)
		) reg_b_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(81.03665)
		) reg_b_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.27632)
		) reg_b_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.38934)
		) reg_b_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.02293)
		) reg_b_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.76939)
		) reg_b_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.26254)
		) reg_b_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.46649)
		) reg_b_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[7])
		);

	sm83_not_reg_b_we #(
			.L_y(638.8528)
		) reg_b_not_we_inst (
			.in(ctl_reg_b_we),
			.y(ctl_reg_b_we_buf_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1104.417),
			.L_b_y1(991.511),
			.L_y2(1133.182)
		) reg_bc_out_inst0 (
			.c_in(reg_c[0]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[0]),
			.b_in(reg_b[0]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[8]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[0])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.96),
			.L_b_y1(992.5247),
			.L_y2(1134.133)
		) reg_bc_out_inst1 (
			.c_in(reg_c[1]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[1]),
			.b_in(reg_b[1]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[9]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[1])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.453),
			.L_b_y1(993.0314),
			.L_y2(1134.64)
		) reg_bc_out_inst2 (
			.c_in(reg_c[2]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[2]),
			.b_in(reg_b[2]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[10]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[2])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.643),
			.L_b_y1(991.3843),
			.L_y2(1133.879)
		) reg_bc_out_inst3 (
			.c_in(reg_c[3]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[3]),
			.b_in(reg_b[3]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[11]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[3])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.489),
			.L_b_y1(991.3843),
			.L_y2(1133.373)
		) reg_bc_out_inst4 (
			.c_in(reg_c[4]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[4]),
			.b_in(reg_b[4]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[12]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[4])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.806),
			.L_b_y1(990.9408),
			.L_y2(1131.472)
		) reg_bc_out_inst5 (
			.c_in(reg_c[5]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[5]),
			.b_in(reg_b[5]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[13]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[5])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1102.39),
			.L_b_y1(1005.577),
			.L_y2(1134.83)
		) reg_bc_out_inst6 (
			.c_in(reg_c[6]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[6]),
			.b_in(reg_b[6]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[14]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[6])
		);

	sm83_reg_bc_out #(
			.L_c_y1(1100.489),
			.L_b_y1(992.0176),
			.L_y2(1134.64)
		) reg_bc_out_inst7 (
			.c_in(reg_c[7]),
			.c_ena2(ctl_reg_c_to_op2_en),
			.c_y1(idu_in_n[7]),
			.b_in(reg_b[7]),
			.b_ena2(ctl_reg_b_to_op2_en),
			.b_y1(idu_in_n[15]),
			.ena1(ctl_reg_bc_to_idu_en),
			.y2(op2bus_n[7])
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(L_db0),
			.L_b_y(1165.813),
			.L_b_y_n(516.7595),
			.L_c_y(1133.182),
			.L_c_y_n(1218.077)
		) reg_bus_pch_a_inst0 (
			.pch_n(exec_phase),
			.a_y(db[0]),
			.b_y(op1bus_n[0]),
			.b_y_n(op1val[0]),
			.c_y(op2bus_n[0]),
			.c_y_n(op2val[0]),
			.c_zero(ctl_ff_to_op2_en)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(L_db1),
			.L_b_y(1165.75),
			.L_b_y_n(699.2974),
			.L_c_y(1134.133),
			.L_c_y_n(1207.127)
		) reg_bus_pch_a_inst1 (
			.pch_n(exec_phase),
			.a_y(db[1]),
			.b_y(op1bus_n[1]),
			.b_y_n(op1val[1]),
			.c_y(op2bus_n[1]),
			.c_y_n(op2val[1]),
			.c_zero(ctl_ff_to_op2_en)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(L_db2),
			.L_b_y(1166.447),
			.L_b_y_n(772.8579),
			.L_c_y(1134.64),
			.L_c_y_n(1314.233)
		) reg_bus_pch_a_inst2 (
			.pch_n(exec_phase),
			.a_y(db[2]),
			.b_y(op1bus_n[2]),
			.b_y_n(op1val[2]),
			.c_y(op2bus_n[2]),
			.c_y_n(op2val[2]),
			.c_zero(ctl_ff_to_op2_en)
		);

	sm83_reg_bus_pch_a_bit0123 #(
			.L_a_y(L_db3),
			.L_b_y(1164.292),
			.L_b_y_n(845.4044),
			.L_c_y(1133.879),
			.L_c_y_n(1438.06)
		) reg_bus_pch_a_inst3 (
			.pch_n(exec_phase),
			.a_y(db[3]),
			.b_y(op1bus_n[3]),
			.b_y_n(op1val[3]),
			.c_y(op2bus_n[3]),
			.c_y_n(op2val[3]),
			.c_zero(ctl_ff_to_op2_en)
		);

	sm83_reg_bus_pch_a_bit4 #(
			.L_a_y(L_db4),
			.L_b_y(1163.722),
			.L_b_y_n(953.5588),
			.L_c_y(1133.373),
			.L_c_y_n(1383.86)
		) reg_bus_pch_a_inst4 (
			.pch_n(exec_phase),
			.a_y(db[4]),
			.b_y(op1bus_n[4]),
			.b_y_n(op1val[4]),
			.c_y(op2bus_n[4]),
			.c_y_n(op2val[4]),
			.c_zero_a(ctl_ff_to_op2_en),
			.c_zero_b1(ctl_flags_to_op2_en),
			.c_zero_b2(flag_c)
		);

	sm83_reg_bus_pch_a_bit5 #(
			.L_a_y(L_db5),
			.L_b_y(1163.785),
			.L_b_y_n(1066.973),
			.L_c_y(1131.472),
			.L_c_y_n(1500.013)
		) reg_bus_pch_a_inst5 (
			.pch_n(exec_phase),
			.a_y(db[5]),
			.b_y(op1bus_n[5]),
			.b_y_n(op1val[5]),
			.c_y(op2bus_n[5]),
			.c_y_n(op2val[5]),
			.c_zero_a(ctl_ff_to_op2_en),
			.c_zero_b1(ctl_flags_to_op2_en),
			.c_zero_b2(flag_h)
		);

	sm83_reg_bus_pch_a_bit6 #(
			.L_a_y(L_db6),
			.L_b_y(1165.876),
			.L_b_y_n(1160.681),
			.L_c_y(1134.83),
			.L_c_y_n(1694.116)
		) reg_bus_pch_a_inst6 (
			.pch_n(exec_phase),
			.a_y(db[6]),
			.b_y(op1bus_n[6]),
			.b_y_n(op1val[6]),
			.c_y(op2bus_n[6]),
			.c_y_n(op2val[6]),
			.c_zero_a(ctl_ff_to_op2_en),
			.c_zero_b1(ctl_flags_to_op2_en),
			.c_zero_b2(flag_n)
		);

	sm83_reg_bus_pch_a_bit7 #(
			.L_a_y(L_db7),
			.L_b_y(1164.609),
			.L_b_y_n(1232.847),
			.L_c_y(1134.64),
			.L_c_y_n(1698.424)
		) reg_bus_pch_a_inst7 (
			.pch_n(exec_phase),
			.a_y(db[7]),
			.b_y(op1bus_n[7]),
			.b_y_n(op1val[7]),
			.c_y(op2bus_n[7]),
			.c_y_n(op2val[7]),
			.c_zero_a(ctl_ff_to_op2_en),
			.c_zero_b1(ctl_flags_to_op2_en),
			.c_zero_b2(flag_z)
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1104.417),
			.L_b_y(991.511)
		) reg_bus_pch_b_inst0 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[0]),
			.b_y(idu_in_n[8])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.96),
			.L_b_y(992.5247)
		) reg_bus_pch_b_inst1 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[1]),
			.b_y(idu_in_n[9])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.453),
			.L_b_y(993.0314)
		) reg_bus_pch_b_inst2 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[2]),
			.b_y(idu_in_n[10])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.643),
			.L_b_y(991.3843)
		) reg_bus_pch_b_inst3 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[3]),
			.b_y(idu_in_n[11])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489),
			.L_b_y(991.3843)
		) reg_bus_pch_b_inst4 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[4]),
			.b_y(idu_in_n[12])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.806),
			.L_b_y(990.9408)
		) reg_bus_pch_b_inst5 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[5]),
			.b_y(idu_in_n[13])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.39),
			.L_b_y(1005.577)
		) reg_bus_pch_b_inst6 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[6]),
			.b_y(idu_in_n[14])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489),
			.L_b_y(992.0176)
		) reg_bus_pch_b_inst7 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[7]),
			.b_y(idu_in_n[15])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.07314)
		) reg_c_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.31286)
		) reg_c_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.13641)
		) reg_c_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.56615)
		) reg_c_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.50278)
		) reg_c_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.80587)
		) reg_c_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.7425)
		) reg_c_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.62962)
		) reg_c_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[7])
		);

	sm83_not_reg_we #(
			.L_y(638.7894)
		) reg_c_not_we_inst (
			.in(ctl_reg_c_we),
			.y(ctl_reg_c_we_buf_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.46407)
		) reg_d_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.2243)
		) reg_d_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.84406)
		) reg_d_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.78088)
		) reg_d_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.41447)
		) reg_d_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.09766)
		) reg_d_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.54112)
		) reg_d_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.22421)
		) reg_d_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[7])
		);

	sm83_not_reg_we #(
			.L_y(639.1063)
		) reg_d_not_we_inst (
			.in(ctl_reg_d_we),
			.y(ctl_reg_d_we_buf_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1104.417),
			.L_d_y1(991.511),
			.L_y2(1133.182)
		) reg_de_out_inst0 (
			.e_in(reg_e[0]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[0]),
			.d_in(reg_d[0]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[8]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[0])
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.96),
			.L_d_y1(992.5247),
			.L_y2(1134.133)
		) reg_de_out_inst1 (
			.e_in(reg_e[1]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[1]),
			.d_in(reg_d[1]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[9]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[1])
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.453),
			.L_d_y1(993.0314),
			.L_y2(1134.64)
		) reg_de_out_inst2 (
			.e_in(reg_e[2]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[2]),
			.d_in(reg_d[2]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[10]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[2])
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.643),
			.L_d_y1(991.3843),
			.L_y2(1133.879)
		) reg_de_out_inst3 (
			.e_in(reg_e[3]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[3]),
			.d_in(reg_d[3]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[11]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[3])
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.489),
			.L_d_y1(991.3843),
			.L_y2(1133.373)
		) reg_de_out_inst4 (
			.e_in(reg_e[4]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[4]),
			.d_in(reg_d[4]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[12]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[4])
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.806),
			.L_d_y1(990.9408),
			.L_y2(1131.472)
		) reg_de_out_inst5 (
			.e_in(reg_e[5]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[5]),
			.d_in(reg_d[5]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[13]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[5])
		);

	sm83_reg_de_out #(
			.L_e_y1(1102.39),
			.L_d_y1(1005.577),
			.L_y2(1134.83)
		) reg_de_out_inst6 (
			.e_in(reg_e[6]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[6]),
			.d_in(reg_d[6]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[14]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[6])
		);

	sm83_reg_de_out #(
			.L_e_y1(1100.489),
			.L_d_y1(992.0176),
			.L_y2(1134.64)
		) reg_de_out_inst7 (
			.e_in(reg_e[7]),
			.e_ena2(ctl_reg_e_to_op2_en),
			.e_y1(idu_in_n[7]),
			.d_in(reg_d[7]),
			.d_ena2(ctl_reg_d_to_op2_en),
			.d_y1(idu_in_n[15]),
			.d_zero1(ctl_op_ld_c_a_or_ld_a_c_m0),
			.d_zero2(ctl_op_ld_n_a_or_ld_a_n_m1),
			.ena1(ctl_reg_de_to_idu_en),
			.y2(op2bus_n[7])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(76.41145)
		) reg_e_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.8054)
		) reg_e_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.04498)
		) reg_e_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.48849)
		) reg_e_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.42517)
		) reg_e_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.55182)
		) reg_e_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(76.34798)
		) reg_e_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(75.65112)
		) reg_e_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[7])
		);

	sm83_not_reg_h_e_we #(
			.L_y(638.7262)
		) reg_e_not_we_inst (
			.in(ctl_reg_e_we),
			.y(ctl_reg_e_we_buf_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.00626)
		) reg_h_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.56268)
		) reg_h_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.06957)
		) reg_h_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.13294)
		) reg_h_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.32302)
		) reg_h_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.57643)
		) reg_h_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.87952)
		) reg_h_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.43596)
		) reg_h_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[7])
		);

	sm83_not_reg_h_e_we #(
			.L_y(638.9165)
		) reg_h_not_we_inst (
			.in(ctl_reg_h_we),
			.y(ctl_reg_h_we_buf_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1104.417),
			.L_h_y1(991.511),
			.L_y2(1133.182),
			.L_y3(1165.813)
		) reg_hl_out_inst0 (
			.l_in(reg_l[0]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[0]),
			.h_in(reg_h[0]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[8]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[0]),
			.y3(op1bus_n[0])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.96),
			.L_h_y1(992.5247),
			.L_y2(1134.133),
			.L_y3(1165.75)
		) reg_hl_out_inst1 (
			.l_in(reg_l[1]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[1]),
			.h_in(reg_h[1]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[9]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[1]),
			.y3(op1bus_n[1])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.453),
			.L_h_y1(993.0314),
			.L_y2(1134.64),
			.L_y3(1166.447)
		) reg_hl_out_inst2 (
			.l_in(reg_l[2]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[2]),
			.h_in(reg_h[2]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[10]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[2]),
			.y3(op1bus_n[2])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.643),
			.L_h_y1(991.3843),
			.L_y2(1133.879),
			.L_y3(1164.292)
		) reg_hl_out_inst3 (
			.l_in(reg_l[3]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[3]),
			.h_in(reg_h[3]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[11]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[3]),
			.y3(op1bus_n[3])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.489),
			.L_h_y1(991.3843),
			.L_y2(1133.373),
			.L_y3(1163.722)
		) reg_hl_out_inst4 (
			.l_in(reg_l[4]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[4]),
			.h_in(reg_h[4]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[12]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[4]),
			.y3(op1bus_n[4])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.806),
			.L_h_y1(990.9408),
			.L_y2(1131.472),
			.L_y3(1163.785)
		) reg_hl_out_inst5 (
			.l_in(reg_l[5]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[5]),
			.h_in(reg_h[5]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[13]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[5]),
			.y3(op1bus_n[5])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1102.39),
			.L_h_y1(1005.577),
			.L_y2(1134.83),
			.L_y3(1165.876)
		) reg_hl_out_inst6 (
			.l_in(reg_l[6]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[6]),
			.h_in(reg_h[6]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[14]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[6]),
			.y3(op1bus_n[6])
		);

	sm83_reg_hl_out #(
			.L_l_y1(1100.489),
			.L_h_y1(992.0176),
			.L_y2(1134.64),
			.L_y3(1164.609)
		) reg_hl_out_inst7 (
			.l_in(reg_l[7]),
			.l_ena2(ctl_reg_l_to_op2_en),
			.l_ena3(ctl_op_add_hl_ss_m0_buf),
			.l_y1(idu_in_n[7]),
			.h_in(reg_h[7]),
			.h_ena2(ctl_reg_h_to_op2_en),
			.h_ena3(ctl_op_add_hl_ss_m1_buf),
			.h_y1(idu_in_n[15]),
			.ena1(ctl_reg_hl_to_idu_en),
			.y2(op2bus_n[7]),
			.y3(op1bus_n[7])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(148.6413),
			.L_q_n(106.8873)
		) reg_ie_inst0 (
			.d(db[0]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[0]),
			.q_n(reg_ie_n[0])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(148.9579),
			.L_q_n(106.6971)
		) reg_ie_inst1 (
			.d(db[1]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[1]),
			.q_n(reg_ie_n[1])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(149.0212),
			.L_q_n(107.3308)
		) reg_ie_inst2 (
			.d(db[2]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[2]),
			.q_n(reg_ie_n[2])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.7319),
			.L_q_n(106.8872)
		) reg_ie_inst3 (
			.d(db[3]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[3]),
			.q_n(reg_ie_n[3])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.8588),
			.L_q_n(106.6339)
		) reg_ie_inst4 (
			.d(db[4]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[4]),
			.q_n(reg_ie_n[4])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(149.9082),
			.L_q_n(106.3804)
		) reg_ie_inst5 (
			.d(db[5]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[5]),
			.q_n(reg_ie_n[5])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.7953),
			.L_q_n(107.3941)
		) reg_ie_inst6 (
			.d(db[6]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[6]),
			.q_n(reg_ie_n[6])
		);

	sm83_dffr_cc_ee_reg_ie_bit #(
			.L_q(150.0984),
			.L_q_n(106.7606)
		) reg_ie_inst7 (
			.d(db[7]),
			.r(sys_reset),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ie_we_n),
			.clk_n(ie_we),
			.q(reg_ie[7]),
			.q_n(reg_ie_n[7])
		);

	sm83_not_reg_ie_we #(
			.L_y(636.6985)
		) reg_ie_not_we_inst (
			.in(ie_we),
			.y(ie_we_n)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2979.35)
		) reg_ir_inst0 (
			.d(db[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[0])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3077.304)
		) reg_ir_inst1 (
			.d(db[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[1])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3186.978)
		) reg_ir_inst2 (
			.d(db[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[2])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(5311.949)
		) reg_ir_inst3 (
			.d(db[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[3])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6853.198)
		) reg_ir_inst4 (
			.d(db[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[4])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6244.999)
		) reg_ir_inst5 (
			.d(db[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[5])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2623.017)
		) reg_ir_inst6 (
			.d(db[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[6])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3435.917)
		) reg_ir_inst7 (
			.d(db[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[7])
		);

	sm83_not_reg_we #(
			.L_y(639.4232)
		) reg_ir_not_we_inst (
			.in(ctl_fetch),
			.y(ctl_fetch_buf1_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.8555)
		) reg_l_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.42571)
		) reg_l_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.17229)
		) reg_l_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.7287)
		) reg_l_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.36231)
		) reg_l_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.91887)
		) reg_l_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.23564)
		) reg_l_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.10892)
		) reg_l_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[7])
		);

	sm83_not_reg_l_we #(
			.L_y(639.55)
		) reg_l_not_we_inst (
			.in(ctl_reg_l_we),
			.y(ctl_reg_l_we_buf_n)
		);

	sm83_not_reg #(
			.L_y(653.6786)
		) reg_not_inst0 (
			.in(new_reg_hi_n[0]),
			.y(new_reg_hi[0])
		);

	sm83_not_reg #(
			.L_y(654.6292)
		) reg_not_inst1 (
			.in(new_reg_hi_n[1]),
			.y(new_reg_hi[1])
		);

	sm83_not_reg #(
			.L_y(652.855)
		) reg_not_inst2 (
			.in(new_reg_hi_n[2]),
			.y(new_reg_hi[2])
		);

	sm83_not_reg #(
			.L_y(653.1085)
		) reg_not_inst3 (
			.in(new_reg_hi_n[3]),
			.y(new_reg_hi[3])
		);

	sm83_not_reg #(
			.L_y(653.6788)
		) reg_not_inst4 (
			.in(new_reg_hi_n[4]),
			.y(new_reg_hi[4])
		);

	sm83_not_reg #(
			.L_y(652.7283)
		) reg_not_inst5 (
			.in(new_reg_hi_n[5]),
			.y(new_reg_hi[5])
		);

	sm83_not_reg #(
			.L_y(652.7283)
		) reg_not_inst6 (
			.in(new_reg_hi_n[6]),
			.y(new_reg_hi[6])
		);

	sm83_not_reg #(
			.L_y(654.6926)
		) reg_not_inst7 (
			.in(new_reg_hi_n[7]),
			.y(new_reg_hi[7])
		);

	sm83_oa21_reg #(
			.L_y(1688.212)
		) reg_oa1_inst (
			.in1(reg_a[1]),
			.in2(reg_a[2]),
			.in3(reg_a[3]),
			.y(daa_lo_gt9)
		);

	sm83_oa21_reg #(
			.L_y(1712.478)
		) reg_oa2_inst (
			.in1(reg_a[5]),
			.in2(reg_a[6]),
			.in3(reg_a[7]),
			.y(daa_hi_gt9)
		);

	sm83_or2_tap_nor_tap_in1_n_reg #(
			.L_y(618.3875),
			.L_tap_nor(617.9441),
			.L_tap_in1_n(638.0291)
		) reg_or_inst (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(ctl_op_jr_m1_buf),
			.y(ctl_op_ld_nn_sp_or_jr_exec),
			.tap_nor(ctl_op_ld_nn_sp_or_jr_exec_n),
			.tap_in1_n(ctl_op_ld_nn_sp_m2_buf_n)
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(L_db0),
			.L_y2(991.511),
			.L_y3(1104.417),
			.L_y4(1165.813),
			.L_y5(67.1629),
			.L_y6(69.50525)
		) reg_pc_out_inst0 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[0]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[0]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[0]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[0]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[0]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[0]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[0]),
			.in17(idu_out[8]),
			.y1(db[0]),
			.y2(idu_in_n[8]),
			.y3(idu_in_n[0]),
			.y4(op1bus_n[0]),
			.y5(new_reg_pcl_n[0]),
			.y6(new_reg_pch_n[0])
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(L_db1),
			.L_y2(992.5247),
			.L_y3(1102.96),
			.L_y4(1165.75),
			.L_y5(66.4006),
			.L_y6(69.12511)
		) reg_pc_out_inst1 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[1]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[1]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[1]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[1]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[1]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[1]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[1]),
			.in17(idu_out[9]),
			.y1(db[1]),
			.y2(idu_in_n[9]),
			.y3(idu_in_n[1]),
			.y4(op1bus_n[1]),
			.y5(new_reg_pcl_n[1]),
			.y6(new_reg_pch_n[1])
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(L_db2),
			.L_y2(993.0314),
			.L_y3(1102.453),
			.L_y4(1166.447),
			.L_y5(66.14721),
			.L_y6(69.75874)
		) reg_pc_out_inst2 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[2]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[2]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[2]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[2]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[2]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[2]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[2]),
			.in17(idu_out[10]),
			.y1(db[2]),
			.y2(idu_in_n[10]),
			.y3(idu_in_n[2]),
			.y4(op1bus_n[2]),
			.y5(new_reg_pcl_n[2]),
			.y6(new_reg_pch_n[2])
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(L_db3),
			.L_y2(991.3843),
			.L_y3(1102.643),
			.L_y4(1164.292),
			.L_y5(66.1473),
			.L_y6(70.13888)
		) reg_pc_out_inst3 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[3]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[3]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[3]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[3]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[3]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[3]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[3]),
			.in17(idu_out[11]),
			.in18(int_vector3),
			.in19(ctl_op_rst_t_m2),
			.in20(opcode[3]),
			.y1(db[3]),
			.y2(idu_in_n[11]),
			.y3(idu_in_n[3]),
			.y4(op1bus_n[3]),
			.y5(new_reg_pcl_n[3]),
			.y6(new_reg_pch_n[3])
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(L_db4),
			.L_y2(991.3843),
			.L_y3(1100.489),
			.L_y4(1163.722),
			.L_y5(66.97082),
			.L_y6(69.31517)
		) reg_pc_out_inst4 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[4]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[4]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[4]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[4]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[4]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[4]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[4]),
			.in17(idu_out[12]),
			.in18(int_vector4),
			.in19(ctl_op_rst_t_m2),
			.in20(opcode[4]),
			.y1(db[4]),
			.y2(idu_in_n[12]),
			.y3(idu_in_n[4]),
			.y4(op1bus_n[4]),
			.y5(new_reg_pcl_n[4]),
			.y6(new_reg_pch_n[4])
		);

	sm83_reg_pc_out_bit345 #(
			.L_y1(L_db5),
			.L_y2(990.9408),
			.L_y3(1100.806),
			.L_y4(1163.785),
			.L_y5(67.35095),
			.L_y6(70.01213)
		) reg_pc_out_inst5 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[5]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[5]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[5]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[5]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[5]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[5]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[5]),
			.in17(idu_out[13]),
			.in18(int_vector5),
			.in19(ctl_op_rst_t_m2),
			.in20(opcode[5]),
			.y1(db[5]),
			.y2(idu_in_n[13]),
			.y3(idu_in_n[5]),
			.y4(op1bus_n[5]),
			.y5(new_reg_pcl_n[5]),
			.y6(new_reg_pch_n[5])
		);

	sm83_reg_pc_out_bit67 #(
			.L_y1(L_db6),
			.L_y2(1005.577),
			.L_y3(1102.39),
			.L_y4(1165.876),
			.L_y5(67.41438),
			.L_y6(69.50516)
		) reg_pc_out_inst6 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[6]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[6]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[6]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[6]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[6]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[6]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[6]),
			.in17(idu_out[14]),
			.in18(int_vector6),
			.y1(db[6]),
			.y2(idu_in_n[14]),
			.y3(idu_in_n[6]),
			.y4(op1bus_n[6]),
			.y5(new_reg_pcl_n[6]),
			.y6(new_reg_pch_n[6])
		);

	sm83_reg_pc_out_bit67 #(
			.L_y1(L_db7),
			.L_y2(992.0176),
			.L_y3(1100.489),
			.L_y4(1164.609),
			.L_y5(66.97091),
			.L_y6(70.01213)
		) reg_pc_out_inst7 (
			.in1(ctl_reg_pcl_to_db_en),
			.in2(reg_pcl_n[7]),
			.in3(ctl_reg_pch_to_db_en),
			.in4(reg_pch_n[7]),
			.in5(ctl_reg_pc_to_idu_en),
			.in6(reg_pch[7]),
			.in7(ctl_op_jr_m1_buf),
			.in8(reg_pcl[7]),
			.in9(ctl_ff_to_op1_en),
			.in10(write_phase),
			.in11(ctl_reg_wz_to_reg_pc_en),
			.in12(reg_z[7]),
			.in13(ctl_idu_to_reg_pc_en),
			.in14(idu_out[7]),
			.in15(ctl_reg_wz_to_reg_pc_en),
			.in16(reg_w[7]),
			.in17(idu_out[15]),
			.in18(int_vector7),
			.y1(db[7]),
			.y2(idu_in_n[15]),
			.y3(idu_in_n[7]),
			.y4(op1bus_n[7]),
			.y5(new_reg_pcl_n[7]),
			.y6(new_reg_pch_n[7])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.50525),
			.L_q(69.82197),
			.L_q_n(85.78866)
		) reg_pch_inst0 (
			.d(new_reg_pch_n[0]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[0]),
			.q_n(reg_pch[0])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.12511),
			.L_q(68.93504),
			.L_q_n(86.54903)
		) reg_pch_inst1 (
			.d(new_reg_pch_n[1]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[1]),
			.q_n(reg_pch[1])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.75874),
			.L_q(69.63199),
			.L_q_n(84.77469)
		) reg_pch_inst2 (
			.d(new_reg_pch_n[2]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[2]),
			.q_n(reg_pch[2])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.13888),
			.L_q(69.69522),
			.L_q_n(84.71146)
		) reg_pch_inst3 (
			.d(new_reg_pch_n[3]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[3]),
			.q_n(reg_pch[3])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.31517),
			.L_q(70.01213),
			.L_q_n(84.90154)
		) reg_pch_inst4 (
			.d(new_reg_pch_n[4]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[4]),
			.q_n(reg_pch[4])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.01213),
			.L_q(69.69531),
			.L_q_n(85.66171)
		) reg_pch_inst5 (
			.d(new_reg_pch_n[5]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[5]),
			.q_n(reg_pch[5])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(69.50516),
			.L_q(70.01213),
			.L_q_n(85.53516)
		) reg_pch_inst6 (
			.d(new_reg_pch_n[6]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[6]),
			.q_n(reg_pch[6])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(70.01213),
			.L_q(70.64567),
			.L_q_n(85.21835)
		) reg_pch_inst7 (
			.d(new_reg_pch_n[7]),
			.pch_n(pch_phase_n),
			.s_n(pch_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_hi_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pch_n[7]),
			.q_n(reg_pch[7])
		);

	sm83_not2_reg_pc_we #(
			.L_a_y(636.3182),
			.L_b_y(1277.642)
		) reg_pch_not_we_inst (
			.a_in(ctl_reg_pc_we),
			.a_y(ctl_reg_pc_we_buf_hi_n),
			.b_in(sys_reset),
			.b_y(pch_reset_n)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.1629),
			.L_q(69.63209),
			.L_q_n(84.33142)
		) reg_pcl_inst0 (
			.d(new_reg_pcl_n[0]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[0]),
			.q_n(reg_pcl[0])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.4006),
			.L_q(70.01203),
			.L_q_n(84.58472)
		) reg_pcl_inst1 (
			.d(new_reg_pcl_n[1]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[1]),
			.q_n(reg_pcl[1])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.14721),
			.L_q(70.13878),
			.L_q_n(84.33132)
		) reg_pcl_inst2 (
			.d(new_reg_pcl_n[2]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[2]),
			.q_n(reg_pcl[2])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.1473),
			.L_q(70.01213),
			.L_q_n(85.15493)
		) reg_pcl_inst3 (
			.d(new_reg_pcl_n[3]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[3]),
			.q_n(reg_pcl[3])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.97082),
			.L_q(70.26543),
			.L_q_n(84.0146)
		) reg_pcl_inst4 (
			.d(new_reg_pcl_n[4]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[4]),
			.q_n(reg_pcl[4])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.35095),
			.L_q(70.51892),
			.L_q_n(84.52139)
		) reg_pcl_inst5 (
			.d(new_reg_pcl_n[5]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[5]),
			.q_n(reg_pcl[5])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.41438),
			.L_q(70.26563),
			.L_q_n(84.52139)
		) reg_pcl_inst6 (
			.d(new_reg_pcl_n[6]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[6]),
			.q_n(reg_pcl[6])
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(66.97091),
			.L_q(70.64577),
			.L_q_n(83.69778)
		) reg_pcl_inst7 (
			.d(new_reg_pcl_n[7]),
			.pch_n(pch_phase_n),
			.s_n(pcl_reset_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_pc_we_buf_lo_n),
			.clk_n(ctl_reg_pc_we),
			.q(reg_pcl_n[7]),
			.q_n(reg_pcl[7])
		);

	sm83_not2_reg_pc_we #(
			.L_a_y(636.1281),
			.L_b_y(1276.882)
		) reg_pcl_not_we_inst (
			.a_in(ctl_reg_pc_we),
			.a_y(ctl_reg_pc_we_buf_lo_n),
			.b_in(sys_reset),
			.b_y(pcl_reset_n)
		);

	sm83_reg_sp_out #(
			.L_y1(L_db0),
			.L_y2(1165.813),
			.L_y3(1133.182),
			.L_y4(1104.417),
			.L_y5(991.511),
			.L_y6(74.32063),
			.L_y7(62.28228)
		) reg_sp_out_inst0 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[0]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[0]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[0]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[0]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[0]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[8]),
			.in19(idu_out[0]),
			.in20(reg_z[0]),
			.y1(db[0]),
			.y2(op1bus_n[0]),
			.y3(op2bus_n[0]),
			.y4(idu_in_n[0]),
			.y5(idu_in_n[8]),
			.y6(new_reg_sph_n[0]),
			.y7(new_reg_spl_n[0])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db1),
			.L_y2(1165.75),
			.L_y3(1134.133),
			.L_y4(1102.96),
			.L_y5(992.5247),
			.L_y6(73.94048),
			.L_y7(62.85249)
		) reg_sp_out_inst1 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[1]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[1]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[1]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[1]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[1]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[9]),
			.in19(idu_out[1]),
			.in20(reg_z[1]),
			.y1(db[1]),
			.y2(op1bus_n[1]),
			.y3(op2bus_n[1]),
			.y4(idu_in_n[1]),
			.y5(idu_in_n[9]),
			.y6(new_reg_sph_n[1]),
			.y7(new_reg_spl_n[1])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db2),
			.L_y2(1166.447),
			.L_y3(1134.64),
			.L_y4(1102.453),
			.L_y5(993.0314),
			.L_y6(74.63744),
			.L_y7(62.66252)
		) reg_sp_out_inst2 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[2]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[2]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[2]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[2]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[2]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[10]),
			.in19(idu_out[2]),
			.in20(reg_z[2]),
			.y1(db[2]),
			.y2(op1bus_n[2]),
			.y3(op2bus_n[2]),
			.y4(idu_in_n[2]),
			.y5(idu_in_n[10]),
			.y6(new_reg_sph_n[2]),
			.y7(new_reg_spl_n[2])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db3),
			.L_y2(1164.292),
			.L_y3(1133.879),
			.L_y4(1102.643),
			.L_y5(991.3843),
			.L_y6(73.94029),
			.L_y7(62.97924)
		) reg_sp_out_inst3 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[3]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[3]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[3]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[3]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[3]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[11]),
			.in19(idu_out[3]),
			.in20(reg_z[3]),
			.y1(db[3]),
			.y2(op1bus_n[3]),
			.y3(op2bus_n[3]),
			.y4(idu_in_n[3]),
			.y5(idu_in_n[11]),
			.y6(new_reg_sph_n[3]),
			.y7(new_reg_spl_n[3])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db4),
			.L_y2(1163.722),
			.L_y3(1133.373),
			.L_y4(1100.489),
			.L_y5(991.3843),
			.L_y6(73.75022),
			.L_y7(62.47235)
		) reg_sp_out_inst4 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[4]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[4]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[4]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[4]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[4]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[12]),
			.in19(idu_out[4]),
			.in20(reg_z[4]),
			.y1(db[4]),
			.y2(op1bus_n[4]),
			.y3(op2bus_n[4]),
			.y4(idu_in_n[4]),
			.y5(idu_in_n[12]),
			.y6(new_reg_sph_n[4]),
			.y7(new_reg_spl_n[4])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db5),
			.L_y2(1163.785),
			.L_y3(1131.472),
			.L_y4(1100.806),
			.L_y5(990.9408),
			.L_y6(74.44727),
			.L_y7(62.85259)
		) reg_sp_out_inst5 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[5]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[5]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[5]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[5]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[5]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[13]),
			.in19(idu_out[5]),
			.in20(reg_z[5]),
			.y1(db[5]),
			.y2(op1bus_n[5]),
			.y3(op2bus_n[5]),
			.y4(idu_in_n[5]),
			.y5(idu_in_n[13]),
			.y6(new_reg_sph_n[5]),
			.y7(new_reg_spl_n[5])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db6),
			.L_y2(1165.876),
			.L_y3(1134.83),
			.L_y4(1102.39),
			.L_y5(1005.577),
			.L_y6(75.65102),
			.L_y7(63.42271)
		) reg_sp_out_inst6 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[6]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[6]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[6]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[6]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[6]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[14]),
			.in19(idu_out[6]),
			.in20(reg_z[6]),
			.y1(db[6]),
			.y2(op1bus_n[6]),
			.y3(op2bus_n[6]),
			.y4(idu_in_n[6]),
			.y5(idu_in_n[14]),
			.y6(new_reg_sph_n[6]),
			.y7(new_reg_spl_n[6])
		);

	sm83_reg_sp_out #(
			.L_y1(L_db7),
			.L_y2(1164.609),
			.L_y3(1134.64),
			.L_y4(1100.489),
			.L_y5(992.0176),
			.L_y6(74.57391),
			.L_y7(63.16931)
		) reg_sp_out_inst7 (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(reg_spl_n[7]),
			.in3(ctl_op_ld_nn_sp_m3),
			.in4(reg_sph_n[7]),
			.in5(ctl_op_add_sp_e_or_ldhl_sp_e_m1),
			.in6(reg_spl[7]),
			.in7(ctl_op_add_sp_e_or_ldhl_sp_e_m2),
			.in8(reg_sph[7]),
			.in9(ctl_op_add_hl_ss_m0_buf),
			.in10(opcode[4]),
			.in11(opcode[5]),
			.in12(ctl_op_add_hl_ss_m1_buf),
			.in13(ctl_reg_sp_to_idu_en),
			.in14(write_phase),
			.in15(ctl_reg_wz_to_reg_sp_en),
			.in16(reg_w[7]),
			.in17(ctl_idu_to_reg_sp_en),
			.in18(idu_out[15]),
			.in19(idu_out[7]),
			.in20(reg_z[7]),
			.y1(db[7]),
			.y2(op1bus_n[7]),
			.y3(op2bus_n[7]),
			.y4(idu_in_n[7]),
			.y5(idu_in_n[15]),
			.y6(new_reg_sph_n[7]),
			.y7(new_reg_spl_n[7])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.32063),
			.L_q(61.96537),
			.L_q_n(85.15502)
		) reg_sph_inst0 (
			.d(new_reg_sph_n[0]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[0]),
			.q_n(reg_sph[0])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.94048),
			.L_q(62.53578),
			.L_q_n(85.15502)
		) reg_sph_inst1 (
			.d(new_reg_sph_n[1]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[1]),
			.q_n(reg_sph[1])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.63744),
			.L_q(61.90205),
			.L_q_n(85.02818)
		) reg_sph_inst2 (
			.d(new_reg_sph_n[2]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[2]),
			.q_n(reg_sph[2])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.94029),
			.L_q(62.34561),
			.L_q_n(85.66181)
		) reg_sph_inst3 (
			.d(new_reg_sph_n[3]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[3]),
			.q_n(reg_sph[3])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(73.75022),
			.L_q(62.97924),
			.L_q_n(85.28176)
		) reg_sph_inst4 (
			.d(new_reg_sph_n[4]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[4]),
			.q_n(reg_sph[4])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.44727),
			.L_q(62.91592),
			.L_q_n(85.85197)
		) reg_sph_inst5 (
			.d(new_reg_sph_n[5]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[5]),
			.q_n(reg_sph[5])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(75.65102),
			.L_q(62.47235),
			.L_q_n(85.59859)
		) reg_sph_inst6 (
			.d(new_reg_sph_n[6]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[6]),
			.q_n(reg_sph[6])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(74.57391),
			.L_q(62.15544),
			.L_q_n(85.85198)
		) reg_sph_inst7 (
			.d(new_reg_sph_n[7]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_hi_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_sph_n[7]),
			.q_n(reg_sph[7])
		);

	sm83_not_reg_sp_we #(
			.L_y(639.423)
		) reg_sph_not_we_inst (
			.in(ctl_reg_sp_we),
			.y(ctl_reg_sp_we_buf_hi_n)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.28228),
			.L_q(61.7753),
			.L_q_n(91.3008)
		) reg_spl_inst0 (
			.d(new_reg_spl_n[0]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[0]),
			.q_n(reg_spl[0])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.85249),
			.L_q(62.02889),
			.L_q_n(90.98407)
		) reg_spl_inst1 (
			.d(new_reg_spl_n[1]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[1]),
			.q_n(reg_spl[1])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.66252),
			.L_q(62.97924),
			.L_q_n(89.59016)
		) reg_spl_inst2 (
			.d(new_reg_spl_n[2]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[2]),
			.q_n(reg_spl[2])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.97924),
			.L_q(62.91582),
			.L_q_n(90.41386)
		) reg_spl_inst3 (
			.d(new_reg_spl_n[3]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[3]),
			.q_n(reg_spl[3])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.47235),
			.L_q(62.97924),
			.L_q_n(89.78033)
		) reg_spl_inst4 (
			.d(new_reg_spl_n[4]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[4]),
			.q_n(reg_spl[4])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.85259),
			.L_q(62.85249),
			.L_q_n(90.09705)
		) reg_spl_inst5 (
			.d(new_reg_spl_n[5]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[5]),
			.q_n(reg_spl[5])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(63.42271),
			.L_q(62.91592),
			.L_q_n(90.60403)
		) reg_spl_inst6 (
			.d(new_reg_spl_n[6]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[6]),
			.q_n(reg_spl[6])
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(63.16931),
			.L_q(63.23264),
			.L_q_n(89.65349)
		) reg_spl_inst7 (
			.d(new_reg_spl_n[7]),
			.pch_n(pch_phase_n),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_sp_we_buf_lo_n),
			.clk_n(ctl_reg_sp_we),
			.q(reg_spl_n[7]),
			.q_n(reg_spl[7])
		);

	sm83_not_reg_sp_we #(
			.L_y(638.7259)
		) reg_spl_not_we_inst (
			.in(ctl_reg_sp_we),
			.y(ctl_reg_sp_we_buf_lo_n)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9099)
		) reg_w_inst0 (
			.d(new_reg_w_n[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[0])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.4306)
		) reg_w_inst1 (
			.d(new_reg_w_n[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[1])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.3538)
		) reg_w_inst2 (
			.d(new_reg_w_n[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[2])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.2269)
		) reg_w_inst3 (
			.d(new_reg_w_n[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[3])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9101)
		) reg_w_inst4 (
			.d(new_reg_w_n[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[4])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.8109)
		) reg_w_inst5 (
			.d(new_reg_w_n[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[5])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.7336)
		) reg_w_inst6 (
			.d(new_reg_w_n[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[6])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.0367)
		) reg_w_inst7 (
			.d(new_reg_w_n[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[7])
		);

	sm83_not_reg_we #(
			.L_y(638.6625)
		) reg_w_not_we_inst (
			.in(ctl_reg_w_we),
			.y(ctl_reg_w_we_buf_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.5721),
			.L_aoi_b_y(76.15791),
			.L_muxi_a_y(127.4158),
			.L_muxi_b_y(167.1421),
			.L_nand_y(1133.182),
			.L_oai21_y(991.511),
			.L_oai31_y(1104.417)
		) reg_wz_out_inst0 (
			.pch_n(data_phase),
			.aoi_in1(res[0]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[0]),
			.aoi_b_in3_muxi_b_d1(idu_out[8]),
			.aoi_a_y_n(new_reg_lo[0]),
			.aoi_b_y(new_reg_hi_n[0]),
			.muxi_d0(db[0]),
			.muxi_a_y(new_reg_z_n[0]),
			.muxi_b_y(new_reg_w_n[0]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[0]),
			.oai21_in_aoi_b_in2(reg_w[0]),
			.oai21_y(idu_in_n[8]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[0]),
			.oai31_y(idu_in_n[0])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(508.2055),
			.L_aoi_b_y(75.84119),
			.L_muxi_a_y(127.6058),
			.L_muxi_b_y(167.3954),
			.L_nand_y(1134.133),
			.L_oai21_y(992.5247),
			.L_oai31_y(1102.96)
		) reg_wz_out_inst1 (
			.pch_n(data_phase),
			.aoi_in1(res[1]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[1]),
			.aoi_b_in3_muxi_b_d1(idu_out[9]),
			.aoi_a_y_n(new_reg_lo[1]),
			.aoi_b_y(new_reg_hi_n[1]),
			.muxi_d0(db[1]),
			.muxi_a_y(new_reg_z_n[1]),
			.muxi_b_y(new_reg_w_n[1]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[1]),
			.oai21_in_aoi_b_in2(reg_w[1]),
			.oai21_y(idu_in_n[9]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[1]),
			.oai31_y(idu_in_n[1])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.3184),
			.L_aoi_b_y(75.96793),
			.L_muxi_a_y(126.7188),
			.L_muxi_b_y(167.6491),
			.L_nand_y(1134.64),
			.L_oai21_y(993.0314),
			.L_oai31_y(1102.453)
		) reg_wz_out_inst2 (
			.pch_n(data_phase),
			.aoi_in1(res[2]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[2]),
			.aoi_b_in3_muxi_b_d1(idu_out[10]),
			.aoi_a_y_n(new_reg_lo[2]),
			.aoi_b_y(new_reg_hi_n[2]),
			.muxi_d0(db[2]),
			.muxi_a_y(new_reg_z_n[2]),
			.muxi_b_y(new_reg_w_n[2]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[2]),
			.oai21_in_aoi_b_in2(reg_w[2]),
			.oai21_y(idu_in_n[10]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[2]),
			.oai31_y(idu_in_n[2])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.5582),
			.L_aoi_b_y(75.84109),
			.L_muxi_a_y(127.3523),
			.L_muxi_b_y(166.5718),
			.L_nand_y(1133.879),
			.L_oai21_y(991.3843),
			.L_oai31_y(1102.643)
		) reg_wz_out_inst3 (
			.pch_n(data_phase),
			.aoi_in1(res[3]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[3]),
			.aoi_b_in3_muxi_b_d1(idu_out[11]),
			.aoi_a_y_n(new_reg_lo[3]),
			.aoi_b_y(new_reg_hi_n[3]),
			.muxi_d0(db[3]),
			.muxi_a_y(new_reg_z_n[3]),
			.muxi_b_y(new_reg_w_n[3]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[3]),
			.oai21_in_aoi_b_in2(reg_w[3]),
			.oai21_y(idu_in_n[11]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[3]),
			.oai31_y(idu_in_n[3])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.6852),
			.L_aoi_b_y(76.22133),
			.L_muxi_a_y(126.6554),
			.L_muxi_b_y(166.5718),
			.L_nand_y(1133.373),
			.L_oai21_y(991.3843),
			.L_oai31_y(1100.489)
		) reg_wz_out_inst4 (
			.pch_n(data_phase),
			.aoi_in1(res[4]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[4]),
			.aoi_b_in3_muxi_b_d1(idu_out[12]),
			.aoi_a_y_n(new_reg_lo[4]),
			.aoi_b_y(new_reg_hi_n[4]),
			.muxi_d0(db[4]),
			.muxi_a_y(new_reg_z_n[4]),
			.muxi_b_y(new_reg_w_n[4]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[4]),
			.oai21_in_aoi_b_in2(reg_w[4]),
			.oai21_y(idu_in_n[12]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[4]),
			.oai31_y(idu_in_n[4])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.3047),
			.L_aoi_b_y(76.53815),
			.L_muxi_a_y(128.0493),
			.L_muxi_b_y(167.0788),
			.L_nand_y(1131.472),
			.L_oai21_y(990.9408),
			.L_oai31_y(1100.806)
		) reg_wz_out_inst5 (
			.pch_n(data_phase),
			.aoi_in1(res[5]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[5]),
			.aoi_b_in3_muxi_b_d1(idu_out[13]),
			.aoi_a_y_n(new_reg_lo[5]),
			.aoi_b_y(new_reg_hi_n[5]),
			.muxi_d0(db[5]),
			.muxi_a_y(new_reg_z_n[5]),
			.muxi_b_y(new_reg_w_n[5]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[5]),
			.oai21_in_aoi_b_in2(reg_w[5]),
			.oai21_y(idu_in_n[13]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[5]),
			.oai31_y(idu_in_n[5])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(506.6848),
			.L_aoi_b_y(76.53804),
			.L_muxi_a_y(126.9089),
			.L_muxi_b_y(167.3322),
			.L_nand_y(1134.83),
			.L_oai21_y(1005.577),
			.L_oai31_y(1102.39)
		) reg_wz_out_inst6 (
			.pch_n(data_phase),
			.aoi_in1(res[6]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[6]),
			.aoi_b_in3_muxi_b_d1(idu_out[14]),
			.aoi_a_y_n(new_reg_lo[6]),
			.aoi_b_y(new_reg_hi_n[6]),
			.muxi_d0(db[6]),
			.muxi_a_y(new_reg_z_n[6]),
			.muxi_b_y(new_reg_w_n[6]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[6]),
			.oai21_in_aoi_b_in2(reg_w[6]),
			.oai21_y(idu_in_n[14]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[6]),
			.oai31_y(idu_in_n[6])
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.2552),
			.L_aoi_b_y(75.90461),
			.L_muxi_a_y(127.7325),
			.L_muxi_b_y(166.9519),
			.L_nand_y(1134.64),
			.L_oai21_y(992.0176),
			.L_oai31_y(1100.489)
		) reg_wz_out_inst7 (
			.pch_n(data_phase),
			.aoi_in1(res[7]),
			.aoi_ena1(ctl_alu_to_reg_gp_en),
			.aoi_ena2(ctl_reg_wz_to_reg_gp_en),
			.aoi_ena3(ctl_idu_to_reg_gp_en),
			.aoi_a_in3_muxi_a_d1(idu_out[7]),
			.aoi_b_in3_muxi_b_d1(idu_out[15]),
			.aoi_a_y_n(new_reg_lo[7]),
			.aoi_b_y(new_reg_hi_n[7]),
			.muxi_d0(db[7]),
			.muxi_a_y(new_reg_z_n[7]),
			.muxi_b_y(new_reg_w_n[7]),
			.muxi_a_sel(ctl_op_ld_nn_sp_m2),
			.muxi_a_sel_n(ctl_op_ld_nn_sp_m2_buf_n),
			.muxi_b_sel(ctl_op_ld_nn_sp_or_jr_exec),
			.muxi_b_sel_n(ctl_op_ld_nn_sp_or_jr_exec_n),
			.nand_ena(ctl_reg_z_to_op2_en),
			.nand_y(op2bus_n[7]),
			.oai21_in_aoi_b_in2(reg_w[7]),
			.oai21_y(idu_in_n[15]),
			.oai_ena1(ctl_op_jr_m2_buf),
			.oai_ena2(ctl_op_ld_nn_sp_or_ldx_exec),
			.oai_ena3(ctl_op_ld_n_a_or_ld_a_n_m1),
			.oai31_in_nand_in_aoi_a_in2(reg_z[7]),
			.oai31_y(idu_in_n[7])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.3767)
		) reg_z_inst0 (
			.d(new_reg_z_n[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[0])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(607.6166)
		) reg_z_inst1 (
			.d(new_reg_z_n[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[1])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.6303)
		) reg_z_inst2 (
			.d(new_reg_z_n[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[2])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.5669)
		) reg_z_inst3 (
			.d(new_reg_z_n[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[3])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2305.746)
		) reg_z_inst4 (
			.d(new_reg_z_n[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[4])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2264.402)
		) reg_z_inst5 (
			.d(new_reg_z_n[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[5])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2417.375)
		) reg_z_inst6 (
			.d(new_reg_z_n[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[6])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(3175.844)
		) reg_z_inst7 (
			.d(new_reg_z_n[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[7])
		);

	sm83_not_reg_we #(
			.L_y(638.8528)
		) reg_z_not_we_inst (
			.in(ctl_reg_z_we),
			.y(ctl_reg_z_we_buf_n)
		);

	sm83_nand2_spare #(
			.L_y(43.08442)
		) spare_nand_inst (
			.in1(ctl_op2_to_db_en),
			.in2(ctl_op2_to_db_en),
			.y(spare_y)
		);

	sm83_nor2_spare #(
			.L_y(43.08442)
		) spare_nor_inst (
			.in1(ctl_op2_to_db_en),
			.in2(ctl_op2_to_db_en),
			.y(spare_y)
		);

	sm83_tie #(
			.L_gnd(32487.91),
			.L_vdd(25766.37)
		) supply_inst (
			.gnd(gnd),
			.vdd(vdd)
		);

	sm83_and2_in1_n_tap_in1 #(
			.L_y(196.7943),
			.L_tap_in1(367.421)
		) vequ_inst (
			.in1_n(xdqf),
			.in2(ctl_mread),
			.y(vequ),
			.tap_in1(vequ_tap_in1)
		);

	sm83_nor2_e #(
			.L_y(27.24453)
		) wafr_inst (
			.in1(data_phase_buf_n),
			.in2(oe_n),
			.y(wafr)
		);

	sm83_nor2_d #(
			.L_y(157.0681)
		) wagr_inst (
			.in1(idle),
			.in2(alu_cond_fail),
			.y(set_mcyc7_n)
		);

	sm83_oa21 #(
			.L_y(L_rd)
		) wdin_inst (
			.in1(ctl_fetch),
			.in2(ctl_mread),
			.in3(wafr),
			.y(rd)
		);

	sm83_nand2_in1_n_b #(
			.L_y(54.61588)
		) ween_inst (
			.in1_n(next_mcyc[1]),
			.in2(set_mcyc7_n),
			.y(ween)
		);

	sm83_nand2_in1_n_a #(
			.L_y(67.28761)
		) werf_inst (
			.in1_n(next_mcyc[2]),
			.in2(set_mcyc7_n),
			.y(werf)
		);

	sm83_nand2_in1_n_c #(
			.L_y(73.1167)
		) wudz_inst (
			.in1_n(next_mcyc[0]),
			.in2(set_mcyc7_n),
			.y(wudz)
		);

	sm83_dff_cc_q #(
			.L_q(167.5223)
		) xaym_inst (
			.d(wudz),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[0])
		);

	sm83_dff_cc_q #(
			.L_q(461.0666)
		) xdqf_inst (
			.d(vequ),
			.clk(clk),
			.clk_n(clk_n),
			.q(xdqf)
		);

	sm83_dff_cc_q #(
			.L_q(184.3758)
		) xirf_inst (
			.d(ween),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[1])
		);

	sm83_ao31_in3_n #(
			.L_y(377.3053)
		) xogs_inst (
			.in1(data_phase),
			.in2(ctl_fetch),
			.in3_n(ctl_op_cb_prefix),
			.in4(idle),
			.y(xogs)
		);

	sm83_aoi21_b #(
			.L_y(167.6778)
		) xtip_inst (
			.in1(xurg),
			.in2(xudo),
			.in3(test_freeze),
			.y(table_cb_n)
		);

	sm83_not_f #(
			.L_y(29.90562)
		) xudo_inst (
			.in(mcyc_buf[2]),
			.y(xudo)
		);

	sm83_dff_cc_q_alt #(
			.L_q(164.3542)
		) xufu_inst (
			.d(werf),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[2])
		);

	sm83_dffre_cc_q #(
			.L_q(122.6638)
		) xurg_inst (
			.d(ctl_op_cb_prefix),
			.clk(ctl_fetch_buf2_n),
			.clk_n(ctl_fetch),
			.ena(write_phase),
			.r(halt),
			.q(xurg)
		);

	sm83_not_d #(
			.L_y(71.27934)
		) xuri_inst (
			.in(ctl_fetch),
			.y(ctl_fetch_buf2_n)
		);

	sm83_not_e #(
			.L_y(L_halt_n)
		) xwee_inst (
			.in(halt),
			.y(halt_n)
		);

	sm83_nor3 #(
			.L_y(58.1639)
		) xygb_inst (
			.in1(test_freeze),
			.in2(idle),
			.in3(int_entry),
			.y(in_intr_n)
		);

	sm83_or3_b #(
			.L_y(445.7336)
		) ycnf_inst (
			.in1(halt),
			.in2(sys_reset),
			.in3(test_freeze),
			.y(idle)
		);

	sm83_dff_cc_q #(
			.L_q(47.13942)
		) ydxa_inst (
			.d(nmi_n),
			.clk(clk),
			.clk_n(clk_n),
			.q(ydxa)
		);

	sm83_not_c #(
			.L_y(163.0235)
		) yepj_inst (
			.in(nmi),
			.y(nmi_n)
		);

	sm83_oai21 #(
			.L_y(163.5307)
		) ykua_inst (
			.in1(yolu),
			.in2(yoii),
			.in3(reset_n),
			.y(ykua)
		);

	sm83_aoi21_a #(
			.L_y(209.8464)
		) yneu_inst (
			.in1(zrby),
			.in2(ctl_int_entry_m6),
			.in3(sys_reset),
			.y(yneu)
		);

	sm83_nor2_c #(
			.L_y(77.86861)
		) yniu_inst (
			.in1(yodp),
			.in2(nmi_n),
			.y(yniu)
		);

	sm83_srlatch_r_n_alt #(
			.L_q(247.9886)
		) ynkw_inst (
			.s(ynoz),
			.r_n(ykua),
			.q(halt)
		);

	sm83_or3_a #(
			.L_y(29.3987)
		) ynoz_inst (
			.in1(pwron_reset),
			.in2(ctl_op_stop_delayed),
			.in3(ctl_op_halt_delayed),
			.y(ynoz)
		);

	sm83_dlatch_ee_q_n #(
			.L_q_n(60.76164)
		) yodp_inst (
			.d(ydxa),
			.ena(clk_n),
			.ena_n(clk),
			.q_n(yodp)
		);

	sm83_dff_cc_q #(
			.L_q(35.98814)
		) yoii_inst (
			.d(irq_head_c_y),
			.clk(clk),
			.clk_n(clk_n),
			.q(yoii)
		);

	sm83_nor2_in2_n #(
			.L_y(26.42095)
		) yolu_inst (
			.in1(zorp),
			.in2_n(zaza),
			.y(yolu)
		);

	sm83_dff_cc_q #(
			.L_q(40.99353)
		) ysbt_inst (
			.d(ctl_op_halt),
			.clk(clk),
			.clk_n(clk_n),
			.q(ctl_op_halt_delayed)
		);

	sm83_dff_cc_q #(
			.L_q(L_int_entry)
		) zacw_inst (
			.d(zfex),
			.clk(clk),
			.clk_n(clk_n),
			.q(int_entry)
		);

	sm83_nor4_in2_n_in4_n #(
			.L_y(91.36417)
		) zaij_inst (
			.in1(ime_n),
			.in2_n(data_phase),
			.in3(zaoc),
			.in4_n(zzom),
			.y(zaij)
		);

	sm83_nand2_c #(
			.L_y(87.43592)
		) zaoc_inst (
			.in1(irq_head_a_y),
			.in2(xogs),
			.y(zaoc)
		);

	sm83_dff_cc_q #(
			.L_q(145.093)
		) zaza_inst (
			.d(zorp),
			.clk(clk),
			.clk_n(clk_n),
			.q(zaza)
		);

	sm83_ao33_s3_tap_in1_n #(
			.L_y(4.308392),
			.L_tap_in1_n(414.3069)
		) zbpp_inst (
			.in1(opcode[3]),
			.in2(ctl_op_di_or_ei),
			.in3(data_phase),
			.in4(dec3_y42),
			.in5(zkdu),
			.y(zbpp),
			.tap_in1_n(opcode3_n_buf3)
		);

	sm83_or2_b #(
			.L_y(88.63976)
		) zfex_inst (
			.in1(zkog),
			.in2(zloz),
			.y(zfex)
		);

	sm83_not_a #(
			.L_y(79.00925)
		) zgna_inst (
			.in(zloz),
			.y(zgna)
		);

	sm83_nor2_f #(
			.L_y(360.515)
		) zhzo_inst (
			.in1(sys_reset),
			.in2(pwron_reset),
			.y(reset_n)
		);

	sm83_nand2_d #(
			.L_y(81.92373)
		) ziks_inst (
			.in1(clk_ready),
			.in2(zudn),
			.y(ziks)
		);

	sm83_and2 #(
			.L_y(113.6035)
		) ziul_inst (
			.in1(ctl_op_nop_or_stop),
			.in2(opcode[4]),
			.y(ctl_op_stop)
		);

	sm83_dff_cc_q #(
			.L_q(5.575608)
		) zivv_inst (
			.d(zoxc),
			.clk(exec_phase_n),
			.clk_n(exec_phase),
			.q(ime_n)
		);

	sm83_not_x3_p2 #(
			.L_y(L_stop_n)
		) zjbf_inst (
			.in(stop),
			.y(stop_n)
		);

	sm83_srlatch_r_n #(
			.L_q(42.89428)
		) zjje_inst (
			.s(zbpp),
			.r_n(zwuu),
			.q(ime_state)
		);

	sm83_dff_cc_q #(
			.L_q(102.0087)
		) zkai_inst (
			.d(ctl_op_stop),
			.clk(clk),
			.clk_n(clk_n),
			.q(ctl_op_stop_delayed)
		);

	sm83_dff_cc_q #(
			.L_q(531.8436)
		) zkdu_inst (
			.d(zrsy),
			.clk(clk),
			.clk_n(clk_n),
			.q(zkdu)
		);

	sm83_srlatch_r_n #(
			.L_q(13.87572)
		) zkog_inst (
			.s(zaij),
			.r_n(zowa),
			.q(zkog)
		);

	sm83_not_g #(
			.L_y(95.16583)
		) zkon_inst (
			.in(reset_n),
			.y(reset)
		);

	sm83_srlatch_r_n #(
			.L_q(520.434)
		) zloz_inst (
			.s(zyoc),
			.r_n(yneu),
			.q(zloz)
		);

	sm83_oa211_in1_n_in3_n #(
			.L_y(L_mreq)
		) zlyz_inst (
			.in1_n(shadow_access),
			.in2(shadow_override),
			.in3_n(internal_access),
			.in4(ctl_mreq),
			.y(mreq)
		);

	sm83_or2_a #(
			.L_y(11.59473)
		) znda_inst (
			.in1(sys_reset),
			.in2(dec3_y42),
			.y(znda)
		);

	sm83_srlatch_r_n #(
			.L_q(19.70688)
		) zojz_inst (
			.s(yniu),
			.r_n(yneu),
			.q(zojz)
		);

	sm83_dff_cc_q #(
			.L_q(154.9137)
		) zorp_inst (
			.d(ziks),
			.clk(clk),
			.clk_n(clk_n),
			.q(zorp)
		);

	sm83_nor2_a #(
			.L_y(60.31816)
		) zowa_inst (
			.in1(ctl_int_entry_m6),
			.in2(sys_reset),
			.y(zowa)
		);

	sm83_nand2_a #(
			.L_y(168.9161)
		) zoxc_inst (
			.in1(zrsy),
			.in2(ime_state),
			.y(zoxc)
		);

	sm83_dff_cc_q #(
			.L_q(1017.489)
		) zrby_inst (
			.d(zloz),
			.clk(clk),
			.clk_n(clk_n),
			.q(zrby)
		);

	sm83_srlatch_r_n #(
			.L_q(168.9162)
		) zrsy_inst (
			.s(znda),
			.r_n(zgna),
			.q(zrsy)
		);

	sm83_not_b #(
			.L_y(160.8068)
		) zudn_inst (
			.in(sys_reset),
			.y(zudn)
		);

	sm83_srlatch_r_n #(
			.L_q(16.22001)
		) zumn_inst (
			.s(ctl_op_stop_delayed),
			.r_n(zwlm),
			.q(stop)
		);

	sm83_nor2_b #(
			.L_y(108.4078)
		) zwlm_inst (
			.in1(wake),
			.in2(reset),
			.y(zwlm)
		);

	sm83_aoi331_s3 #(
			.L_y(113.0965)
		) zwuu_inst (
			.in1(opcode3_n_buf3),
			.in2(ctl_op_di_or_ei),
			.in3(data_phase),
			.in4(zkdu),
			.in5(int_entry),
			.in6(sys_reset),
			.y(zwuu)
		);

	sm83_and3 #(
			.L_y(40.42339)
		) zyoc_inst (
			.in1(xogs),
			.in2(zkdu),
			.in3(zojz),
			.y(zyoc)
		);

	sm83_nand2_b #(
			.L_y(47.20277)
		) zzom_inst (
			.in1(opcode3_n_buf3),
			.in2(ctl_op_di_or_ei),
			.y(zzom)
		);

	keeper #(.N(16)) idu_in_n_keeper(.n(idu_in_n));
	keeper #(.N(8)) new_reg_hi_n_keeper(.n(new_reg_hi_n));
	keeper #(.N(8)) new_reg_pch_n_keeper(.n(new_reg_pch_n));
	keeper #(.N(8)) new_reg_pcl_n_keeper(.n(new_reg_pcl_n));
	keeper #(.N(8)) new_reg_sph_n_keeper(.n(new_reg_sph_n));
	keeper #(.N(8)) new_reg_spl_n_keeper(.n(new_reg_spl_n));
	keeper #(.N(3)) next_mcyc_n_keeper(.n(next_mcyc_n));
	keeper #(.N(8)) op1bus_n_keeper(.n(op1bus_n));
	keeper #(.N(8)) op1dec_n_keeper(.n(op1dec_n));
	keeper #(.N(8)) op2bus_n_keeper(.n(op2bus_n));
	keeper #(.N(7)) idu_chain_hi_keeper(.n(idu_chain_hi));
	keeper #(.N(7)) idu_chain_lo_keeper(.n(idu_chain_lo));
	keeper #(.N(8)) irq_prio_nand_b_y_keeper(.n(irq_prio_nand_b_y));
	keeper #(.N(8)) shift_keeper(.n(shift));
	keeper carry_in_n_keeper(.n(carry_in_n));
	keeper ctl_alu_add_n_keeper(.n(ctl_alu_add_n));
	keeper ctl_alu_and_n_keeper(.n(ctl_alu_and_n));
	keeper ctl_alu_inv_cin_n_keeper(.n(ctl_alu_inv_cin_n));
	keeper ctl_alu_inv_op2_n_keeper(.n(ctl_alu_inv_op2_n));
	keeper ctl_alu_or_n_keeper(.n(ctl_alu_or_n));
	keeper ctl_alu_to_db_en_n_keeper(.n(ctl_alu_to_db_en_n));
	keeper ctl_alu_xor_n_keeper(.n(ctl_alu_xor_n));
	keeper ctl_fetch_n_keeper(.n(ctl_fetch_n));
	keeper ctl_ff_to_op1_en_n_keeper(.n(ctl_ff_to_op1_en_n));
	keeper ctl_flags_c_we_n_keeper(.n(ctl_flags_c_we_n));
	keeper ctl_flags_znh_we_n_keeper(.n(ctl_flags_znh_we_n));
	keeper ctl_idu_dec_n_keeper(.n(ctl_idu_dec_n));
	keeper ctl_idu_inc_n_keeper(.n(ctl_idu_inc_n));
	keeper ctl_idu_to_reg_pc_en_n_keeper(.n(ctl_idu_to_reg_pc_en_n));
	keeper ctl_idu_to_reg_sp_en_n_keeper(.n(ctl_idu_to_reg_sp_en_n));
	keeper ctl_int_entry_m0_n_keeper(.n(ctl_int_entry_m0_n));
	keeper ctl_int_entry_m4_n_keeper(.n(ctl_int_entry_m4_n));
	keeper ctl_int_entry_m5_n_keeper(.n(ctl_int_entry_m5_n));
	keeper ctl_int_entry_m6_n_keeper(.n(ctl_int_entry_m6_n));
	keeper ctl_mread_n_keeper(.n(ctl_mread_n));
	keeper ctl_mreq_n_keeper(.n(ctl_mreq_n));
	keeper ctl_mwrite_n_keeper(.n(ctl_mwrite_n));
	keeper ctl_op_add_a_x_or_adc_a_x_n_keeper(.n(ctl_op_add_a_x_or_adc_a_x_n));
	keeper ctl_op_add_hl_ss_m0_n_keeper(.n(ctl_op_add_hl_ss_m0_n));
	keeper ctl_op_add_hl_ss_m1_n_keeper(.n(ctl_op_add_hl_ss_m1_n));
	keeper ctl_op_add_or_adc_or_ldhl_exec_n_keeper(.n(ctl_op_add_or_adc_or_ldhl_exec_n));
	keeper ctl_op_add_sp_e_m0_n_keeper(.n(ctl_op_add_sp_e_m0_n));
	keeper ctl_op_add_sp_e_m1_buf_n_keeper(.n(ctl_op_add_sp_e_m1_buf_n));
	keeper ctl_op_add_sp_e_m1_n_keeper(.n(ctl_op_add_sp_e_m1_n));
	keeper ctl_op_add_sp_e_m2_buf_n_keeper(.n(ctl_op_add_sp_e_m2_buf_n));
	keeper ctl_op_add_sp_e_m2_n_keeper(.n(ctl_op_add_sp_e_m2_n));
	keeper ctl_op_add_sp_e_m3_n_keeper(.n(ctl_op_add_sp_e_m3_n));
	keeper ctl_op_add_sp_e_or_ldhl_sp_e_m1_n_keeper(.n(ctl_op_add_sp_e_or_ldhl_sp_e_m1_n));
	keeper ctl_op_add_sp_e_or_ldhl_sp_e_m2_n_keeper(.n(ctl_op_add_sp_e_or_ldhl_sp_e_m2_n));
	keeper ctl_op_alu_a_hl_m0_n_keeper(.n(ctl_op_alu_a_hl_m0_n));
	keeper ctl_op_alu_a_n_m0_n_keeper(.n(ctl_op_alu_a_n_m0_n));
	keeper ctl_op_alu_a_r_n_keeper(.n(ctl_op_alu_a_r_n));
	keeper ctl_op_alu_or_alu_cb_or_ld_or_halt_n_keeper(.n(ctl_op_alu_or_alu_cb_or_ld_or_halt_n));
	keeper ctl_op_alu_n_keeper(.n(ctl_op_alu_n));
	keeper ctl_op_any_cc_n_keeper(.n(ctl_op_any_cc_n));
	keeper ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n_keeper(.n(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n));
	keeper ctl_op_aux_alu_m0_n_keeper(.n(ctl_op_aux_alu_m0_n));
	keeper ctl_op_bit_b_hl_m1_n_keeper(.n(ctl_op_bit_b_hl_m1_n));
	keeper ctl_op_bit_n_keeper(.n(ctl_op_bit_n));
	keeper ctl_op_call_cc_nn_m1_n_keeper(.n(ctl_op_call_cc_nn_m1_n));
	keeper ctl_op_call_m0_n_keeper(.n(ctl_op_call_m0_n));
	keeper ctl_op_call_m1_n_keeper(.n(ctl_op_call_m1_n));
	keeper ctl_op_call_m2_n_keeper(.n(ctl_op_call_m2_n));
	keeper ctl_op_call_m3_n_keeper(.n(ctl_op_call_m3_n));
	keeper ctl_op_call_m4_n_keeper(.n(ctl_op_call_m4_n));
	keeper ctl_op_cb_hl_m0_n_keeper(.n(ctl_op_cb_hl_m0_n));
	keeper ctl_op_cb_prefix_n_keeper(.n(ctl_op_cb_prefix_n));
	keeper ctl_op_cb_r_n_keeper(.n(ctl_op_cb_r_n));
	keeper ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n_keeper(.n(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n));
	keeper ctl_op_cb_rxx_or_sxx_or_swap_n_keeper(.n(ctl_op_cb_rxx_or_sxx_or_swap_n));
	keeper ctl_op_cp_n_keeper(.n(ctl_op_cp_n));
	keeper ctl_op_cpl_m0_n_keeper(.n(ctl_op_cpl_m0_n));
	keeper ctl_op_daa_m0_n_keeper(.n(ctl_op_daa_m0_n));
	keeper ctl_op_dec_ss_m0_n_keeper(.n(ctl_op_dec_ss_m0_n));
	keeper ctl_op_di_or_ei_n_keeper(.n(ctl_op_di_or_ei_n));
	keeper ctl_op_halt_n_keeper(.n(ctl_op_halt_n));
	keeper ctl_op_inc_or_dec_hl_m0_n_keeper(.n(ctl_op_inc_or_dec_hl_m0_n));
	keeper ctl_op_inc_or_dec_hl_m1_n_keeper(.n(ctl_op_inc_or_dec_hl_m1_n));
	keeper ctl_op_inc_or_dec_m_or_ld_or_halt_n_keeper(.n(ctl_op_inc_or_dec_m_or_ld_or_halt_n));
	keeper ctl_op_inc_or_dec_m_n_keeper(.n(ctl_op_inc_or_dec_m_n));
	keeper ctl_op_inc_or_dec_r_n_keeper(.n(ctl_op_inc_or_dec_r_n));
	keeper ctl_op_inc_or_dec_ss_m0_n_keeper(.n(ctl_op_inc_or_dec_ss_m0_n));
	keeper ctl_op_inc_ss_m0_n_keeper(.n(ctl_op_inc_ss_m0_n));
	keeper ctl_op_jp_cc_nn_m1_n_keeper(.n(ctl_op_jp_cc_nn_m1_n));
	keeper ctl_op_jp_hl_n_keeper(.n(ctl_op_jp_hl_n));
	keeper ctl_op_jp_m0_n_keeper(.n(ctl_op_jp_m0_n));
	keeper ctl_op_jp_m1_n_keeper(.n(ctl_op_jp_m1_n));
	keeper ctl_op_jp_m2_n_keeper(.n(ctl_op_jp_m2_n));
	keeper ctl_op_jr_cc_e_m0_n_keeper(.n(ctl_op_jr_cc_e_m0_n));
	keeper ctl_op_jr_m0_n_keeper(.n(ctl_op_jr_m0_n));
	keeper ctl_op_jr_m1_n_keeper(.n(ctl_op_jr_m1_n));
	keeper ctl_op_jr_m2_n_keeper(.n(ctl_op_jr_m2_n));
	keeper ctl_op_ld_a_c_m0_n_keeper(.n(ctl_op_ld_a_c_m0_n));
	keeper ctl_op_ld_a_n_m0_n_keeper(.n(ctl_op_ld_a_n_m0_n));
	keeper ctl_op_ld_a_n_m1_n_keeper(.n(ctl_op_ld_a_n_m1_n));
	keeper ctl_op_ld_a_n_n_keeper(.n(ctl_op_ld_a_n_n));
	keeper ctl_op_ld_a_xxx_m0_n_keeper(.n(ctl_op_ld_a_xxx_m0_n));
	keeper ctl_op_ld_a_xxx_m1_n_keeper(.n(ctl_op_ld_a_xxx_m1_n));
	keeper ctl_op_ld_c_a_m0_n_keeper(.n(ctl_op_ld_c_a_m0_n));
	keeper ctl_op_ld_c_a_or_ld_a_c_m0_n_keeper(.n(ctl_op_ld_c_a_or_ld_a_c_m0_n));
	keeper ctl_op_ld_dd_nn_m0_n_keeper(.n(ctl_op_ld_dd_nn_m0_n));
	keeper ctl_op_ld_dd_nn_m1_n_keeper(.n(ctl_op_ld_dd_nn_m1_n));
	keeper ctl_op_ld_dd_nn_m2_n_keeper(.n(ctl_op_ld_dd_nn_m2_n));
	keeper ctl_op_ld_hl_n_m1_n_keeper(.n(ctl_op_ld_hl_n_m1_n));
	keeper ctl_op_ld_hl_r_m0_n_keeper(.n(ctl_op_ld_hl_r_m0_n));
	keeper ctl_op_ld_hld_m0_n_keeper(.n(ctl_op_ld_hld_m0_n));
	keeper ctl_op_ld_hli_m0_n_keeper(.n(ctl_op_ld_hli_m0_n));
	keeper ctl_op_ld_n_a_m0_n_keeper(.n(ctl_op_ld_n_a_m0_n));
	keeper ctl_op_ld_n_a_m1_n_keeper(.n(ctl_op_ld_n_a_m1_n));
	keeper ctl_op_ld_n_a_or_ld_a_n_m1_n_keeper(.n(ctl_op_ld_n_a_or_ld_a_n_m1_n));
	keeper ctl_op_ld_n_a_or_ld_c_a_exec_n_keeper(.n(ctl_op_ld_n_a_or_ld_c_a_exec_n));
	keeper ctl_op_ld_nn_sp_exec_n_keeper(.n(ctl_op_ld_nn_sp_exec_n));
	keeper ctl_op_ld_nn_sp_m0_n_keeper(.n(ctl_op_ld_nn_sp_m0_n));
	keeper ctl_op_ld_nn_sp_m1_n_keeper(.n(ctl_op_ld_nn_sp_m1_n));
	keeper ctl_op_ld_nn_sp_m2_n_keeper(.n(ctl_op_ld_nn_sp_m2_n));
	keeper ctl_op_ld_nn_sp_m3_n_keeper(.n(ctl_op_ld_nn_sp_m3_n));
	keeper ctl_op_ld_nn_sp_or_ldx_exec_n_keeper(.n(ctl_op_ld_nn_sp_or_ldx_exec_n));
	keeper ctl_op_ld_or_halt_n_keeper(.n(ctl_op_ld_or_halt_n));
	keeper ctl_op_ld_r_hl_m0_n_keeper(.n(ctl_op_ld_r_hl_m0_n));
	keeper ctl_op_ld_r_n_m2_n_keeper(.n(ctl_op_ld_r_n_m2_n));
	keeper ctl_op_ld_r_r_m0_n_keeper(.n(ctl_op_ld_r_r_m0_n));
	keeper ctl_op_ld_sp_hl_m0_n_keeper(.n(ctl_op_ld_sp_hl_m0_n));
	keeper ctl_op_ld_x_n_m0_n_keeper(.n(ctl_op_ld_x_n_m0_n));
	keeper ctl_op_ld_x_n_n_keeper(.n(ctl_op_ld_x_n_n));
	keeper ctl_op_ld_xxx_a_m0_n_keeper(.n(ctl_op_ld_xxx_a_m0_n));
	keeper ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n_keeper(.n(ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n));
	keeper ctl_op_ldhl_sp_e_m0_n_keeper(.n(ctl_op_ldhl_sp_e_m0_n));
	keeper ctl_op_ldhl_sp_e_m1_buf_n_keeper(.n(ctl_op_ldhl_sp_e_m1_buf_n));
	keeper ctl_op_ldhl_sp_e_m1_n_keeper(.n(ctl_op_ldhl_sp_e_m1_n));
	keeper ctl_op_ldhl_sp_e_m2_buf_n_keeper(.n(ctl_op_ldhl_sp_e_m2_buf_n));
	keeper ctl_op_ldhl_sp_e_m2_n_keeper(.n(ctl_op_ldhl_sp_e_m2_n));
	keeper ctl_op_ldx_a_nn_m2_n_keeper(.n(ctl_op_ldx_a_nn_m2_n));
	keeper ctl_op_ldx_a_nn_m3_n_keeper(.n(ctl_op_ldx_a_nn_m3_n));
	keeper ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n_keeper(.n(ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n));
	keeper ctl_op_ldx_m0_n_keeper(.n(ctl_op_ldx_m0_n));
	keeper ctl_op_ldx_m1_n_keeper(.n(ctl_op_ldx_m1_n));
	keeper ctl_op_ldx_nn_a_m2_n_keeper(.n(ctl_op_ldx_nn_a_m2_n));
	keeper ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n_keeper(.n(ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n));
	keeper ctl_op_m6_n_keeper(.n(ctl_op_m6_n));
	keeper ctl_op_m7_n_keeper(.n(ctl_op_m7_n));
	keeper ctl_op_nop_or_stop_n_keeper(.n(ctl_op_nop_or_stop_n));
	keeper ctl_op_or_or_set_exec_n_keeper(.n(ctl_op_or_or_set_exec_n));
	keeper ctl_op_pop_qq_m0_n_keeper(.n(ctl_op_pop_qq_m0_n));
	keeper ctl_op_pop_qq_m1_n_keeper(.n(ctl_op_pop_qq_m1_n));
	keeper ctl_op_pop_qq_m2_n_keeper(.n(ctl_op_pop_qq_m2_n));
	keeper ctl_op_push_qq_m0_n_keeper(.n(ctl_op_push_qq_m0_n));
	keeper ctl_op_push_qq_m1_n_keeper(.n(ctl_op_push_qq_m1_n));
	keeper ctl_op_push_qq_m2_n_keeper(.n(ctl_op_push_qq_m2_n));
	keeper ctl_op_res_b_hl_m1_n_keeper(.n(ctl_op_res_b_hl_m1_n));
	keeper ctl_op_res_b_r_m0_n_keeper(.n(ctl_op_res_b_r_m0_n));
	keeper ctl_op_res_exec_n_keeper(.n(ctl_op_res_exec_n));
	keeper ctl_op_res_or_set_b_hl_m0_n_keeper(.n(ctl_op_res_or_set_b_hl_m0_n));
	keeper ctl_op_ret_cc_m0_n_keeper(.n(ctl_op_ret_cc_m0_n));
	keeper ctl_op_ret_cc_m1_n_keeper(.n(ctl_op_ret_cc_m1_n));
	keeper ctl_op_ret_or_reti_m0_n_keeper(.n(ctl_op_ret_or_reti_m0_n));
	keeper ctl_op_retx_m2_n_keeper(.n(ctl_op_retx_m2_n));
	keeper ctl_op_retx_m3_n_keeper(.n(ctl_op_retx_m3_n));
	keeper ctl_op_rl_n_keeper(.n(ctl_op_rl_n));
	keeper ctl_op_rlc_n_keeper(.n(ctl_op_rlc_n));
	keeper ctl_op_rlx_or_slx_n_keeper(.n(ctl_op_rlx_or_slx_n));
	keeper ctl_op_rr_n_keeper(.n(ctl_op_rr_n));
	keeper ctl_op_rrc_n_keeper(.n(ctl_op_rrc_n));
	keeper ctl_op_rrx_or_srx_n_keeper(.n(ctl_op_rrx_or_srx_n));
	keeper ctl_op_rst_t_m0_n_keeper(.n(ctl_op_rst_t_m0_n));
	keeper ctl_op_rst_t_m1_n_keeper(.n(ctl_op_rst_t_m1_n));
	keeper ctl_op_rst_t_m2_n_keeper(.n(ctl_op_rst_t_m2_n));
	keeper ctl_op_rxx_n_keeper(.n(ctl_op_rxx_n));
	keeper ctl_op_rxxa_or_daa_or_cpl_m0_n_keeper(.n(ctl_op_rxxa_or_daa_or_cpl_m0_n));
	keeper ctl_op_rxxa_n_keeper(.n(ctl_op_rxxa_n));
	keeper ctl_op_scf_or_ccf_m0_n_keeper(.n(ctl_op_scf_or_ccf_m0_n));
	keeper ctl_op_set_b_hl_m1_n_keeper(.n(ctl_op_set_b_hl_m1_n));
	keeper ctl_op_set_b_r_m0_n_keeper(.n(ctl_op_set_b_r_m0_n));
	keeper ctl_op_set_exec_n_keeper(.n(ctl_op_set_exec_n));
	keeper ctl_op_sra_n_keeper(.n(ctl_op_sra_n));
	keeper ctl_op_sub_or_sbc_or_cp_n_keeper(.n(ctl_op_sub_or_sbc_or_cp_n));
	keeper ctl_op_sub_or_sbc_n_keeper(.n(ctl_op_sub_or_sbc_n));
	keeper ctl_op_swap_n_keeper(.n(ctl_op_swap_n));
	keeper ctl_op_sxx_or_swap_n_keeper(.n(ctl_op_sxx_or_swap_n));
	keeper ctl_op2_to_db_en_n_keeper(.n(ctl_op2_to_db_en_n));
	keeper ctl_push_or_pop_exec_n_keeper(.n(ctl_push_or_pop_exec_n));
	keeper ctl_reg_a_to_op2_en_n_keeper(.n(ctl_reg_a_to_op2_en_n));
	keeper ctl_reg_a_we_n_keeper(.n(ctl_reg_a_we_n));
	keeper ctl_reg_b_to_op2_en_n_keeper(.n(ctl_reg_b_to_op2_en_n));
	keeper ctl_reg_b_we_n_keeper(.n(ctl_reg_b_we_n));
	keeper ctl_reg_bc_to_idu_en_n_keeper(.n(ctl_reg_bc_to_idu_en_n));
	keeper ctl_reg_c_to_op2_en_n_keeper(.n(ctl_reg_c_to_op2_en_n));
	keeper ctl_reg_c_we_n_keeper(.n(ctl_reg_c_we_n));
	keeper ctl_reg_d_to_op2_en_n_keeper(.n(ctl_reg_d_to_op2_en_n));
	keeper ctl_reg_d_we_n_keeper(.n(ctl_reg_d_we_n));
	keeper ctl_reg_de_to_idu_en_n_keeper(.n(ctl_reg_de_to_idu_en_n));
	keeper ctl_reg_e_to_op2_en_n_keeper(.n(ctl_reg_e_to_op2_en_n));
	keeper ctl_reg_e_we_n_keeper(.n(ctl_reg_e_we_n));
	keeper ctl_reg_h_to_op2_en_n_keeper(.n(ctl_reg_h_to_op2_en_n));
	keeper ctl_reg_h_we_n_keeper(.n(ctl_reg_h_we_n));
	keeper ctl_reg_hl_to_idu_en_n_keeper(.n(ctl_reg_hl_to_idu_en_n));
	keeper ctl_reg_l_to_op2_en_n_keeper(.n(ctl_reg_l_to_op2_en_n));
	keeper ctl_reg_l_we_n_keeper(.n(ctl_reg_l_we_n));
	keeper ctl_reg_pc_to_idu_en_n_keeper(.n(ctl_reg_pc_to_idu_en_n));
	keeper ctl_reg_pc_we_n_keeper(.n(ctl_reg_pc_we_n));
	keeper ctl_reg_pch_to_db_en_n_keeper(.n(ctl_reg_pch_to_db_en_n));
	keeper ctl_reg_pcl_to_db_en_n_keeper(.n(ctl_reg_pcl_to_db_en_n));
	keeper ctl_reg_sp_to_idu_en_n_keeper(.n(ctl_reg_sp_to_idu_en_n));
	keeper ctl_reg_sp_we_n_keeper(.n(ctl_reg_sp_we_n));
	keeper ctl_reg_w_we_n_keeper(.n(ctl_reg_w_we_n));
	keeper ctl_reg_wz_to_reg_gp_en_n_keeper(.n(ctl_reg_wz_to_reg_gp_en_n));
	keeper ctl_reg_wz_to_reg_pc_en_n_keeper(.n(ctl_reg_wz_to_reg_pc_en_n));
	keeper ctl_reg_wz_to_reg_sp_en_n_keeper(.n(ctl_reg_wz_to_reg_sp_en_n));
	keeper ctl_reg_z_to_op2_en_n_keeper(.n(ctl_reg_z_to_op2_en_n));
	keeper ctl_reg_z_we_n_keeper(.n(ctl_reg_z_we_n));
	keeper dec1_y107_n_keeper(.n(dec1_y107_n));
	keeper dec1_y49_n_keeper(.n(dec1_y49_n));
	keeper dec1_y50_n_keeper(.n(dec1_y50_n));
	keeper dec2_y30_n_keeper(.n(dec2_y30_n));
	keeper dec3_y14_n_keeper(.n(dec3_y14_n));
	keeper dec3_y37_n_keeper(.n(dec3_y37_n));
	keeper dec3_y42_n_keeper(.n(dec3_y42_n));
	keeper int_vector_n_keeper3(.n(int_vector_n3));
	keeper int_vector_n_keeper4(.n(int_vector_n4));
	keeper int_vector_n_keeper5(.n(int_vector_n5));
	keeper new_flag_c_n_keeper(.n(new_flag_c_n));
	keeper new_flag_h_n_keeper(.n(new_flag_h_n));
	keeper new_flag_n_n_keeper(.n(new_flag_n_n));
	keeper new_flag_z_n_keeper(.n(new_flag_z_n));
	keeper alu_cond_fail_n_keeper(.n(alu_cond_fail_n));
	keeper dec3_y56_keeper(.n(dec3_y56));
	keeper dec3_y58_keeper(.n(dec3_y58));
	keeper irq_prio_dist_nand_a_y_keeper(.n(irq_prio_dist_nand_a_y));
	keeper irq_prio_dist_nand_a_y_n_keeper1(.n(irq_prio_dist_nand_a_y_n1));
	keeper irq_prio_dist_nand_a_y_n_keeper2(.n(irq_prio_dist_nand_a_y_n2));
	keeper irq_prio_dist_nand_a_y_n_keeper3(.n(irq_prio_dist_nand_a_y_n3));
	keeper irq_prio_dist_nand_a_y_n_keeper4(.n(irq_prio_dist_nand_a_y_n4));
	keeper irq_prio_dist_nand_a_y_n_keeper5(.n(irq_prio_dist_nand_a_y_n5));
	keeper irq_prio_dist_nand_a_y_n_keeper6(.n(irq_prio_dist_nand_a_y_n6));
	keeper irq_prio_dist_nand_a_y_n_keeper7(.n(irq_prio_dist_nand_a_y_n7));
	keeper irq_prio_dist_nand_b_y_keeper(.n(irq_prio_dist_nand_b_y));
	keeper irq_prio_dist_nand_b_y_n_keeper1(.n(irq_prio_dist_nand_b_y_n1));
	keeper irq_prio_dist_nand_b_y_n_keeper2(.n(irq_prio_dist_nand_b_y_n2));
	keeper irq_prio_dist_nand_b_y_n_keeper3(.n(irq_prio_dist_nand_b_y_n3));
	keeper irq_prio_dist_nand_b_y_n_keeper4(.n(irq_prio_dist_nand_b_y_n4));
	keeper irq_prio_dist_nand_b_y_n_keeper5(.n(irq_prio_dist_nand_b_y_n5));
	keeper irq_prio_dist_nand_b_y_n_keeper6(.n(irq_prio_dist_nand_b_y_n6));
	keeper irq_prio_dist_nand_b_y_n_keeper7(.n(irq_prio_dist_nand_b_y_n7));
	keeper irq_prio_dist_nor_y_keeper(.n(irq_prio_dist_nor_y));
	keeper irq_prio_dist_nor_y_p_keeper1(.n(irq_prio_dist_nor_y_p1));
	keeper irq_prio_dist_nor_y_p_keeper2(.n(irq_prio_dist_nor_y_p2));
	keeper irq_prio_dist_nor_y_p_keeper3(.n(irq_prio_dist_nor_y_p3));
	keeper irq_prio_dist_nor_y_p_keeper4(.n(irq_prio_dist_nor_y_p4));
	keeper irq_prio_dist_nor_y_p_keeper5(.n(irq_prio_dist_nor_y_p5));
	keeper irq_prio_dist_nor_y_p_keeper6(.n(irq_prio_dist_nor_y_p6));
	keeper irq_prio_dist_nor_y_p_keeper7(.n(irq_prio_dist_nor_y_p7));
	keeper irq_prio_nand_a_y_keeper(.n(irq_prio_nand_a_y));

endmodule

`default_nettype wire
