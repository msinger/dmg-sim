`default_nettype none

package sm83_param;

	parameter real L_clk_n                = sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_alt_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dlatch_ee_q_n_param::L_ena + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n + sm83_dff_cc_q_param::L_clk_n;
	parameter real W_gate_clk_n           = sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_alt_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dlatch_ee_q_n_param::W_gate_ena + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n + sm83_dff_cc_q_param::W_gate_clk_n;
	parameter real L_data_phase_n         = sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena + sm83_dlatch_ee_irq_param::L_ena;
	parameter real W_gate_data_phase_n    = sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_ena;
	parameter real L_exec_phase_n         = sm83_dff_cc_q_param::L_clk;
	parameter real W_gate_exec_phase_n    = sm83_dff_cc_q_param::W_gate_clk;
	parameter real L_halt_n               = sm83_not_e_param::L_y;
	parameter real L_oe_n                 = sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_b2b_wand_inj_a_param::L_oe_n + sm83_idu_bit0_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit123456_param::L_buf_ena_n + sm83_idu_bit7_param::L_buf_ena_n + sm83_nor2_e_param::L_in2;
	parameter real W_gate_oe_n            = sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_b2b_wand_inj_a_param::W_gate_oe_n + sm83_idu_bit0_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit123456_param::W_gate_buf_ena_n + sm83_idu_bit7_param::W_gate_buf_ena_n + sm83_nor2_e_param::W_gate_in2;
	parameter real L_pch_phase_n          = sm83_not_pch_x1_alu_param::L_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::L_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::L_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::L_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_pch_n;
	parameter real W_gate_pch_phase_n     = sm83_not_pch_x1_alu_param::W_gate_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_pch_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_pch_n;
	parameter real L_stop_n               = sm83_not_x3_p2_param::L_y;
	parameter real L_write_phase_n        = sm83_dffn_ee_q_alu_sign_param::L_ena_n + sm83_nor2_pch_in1_dec3_param::L_in2 + sm83_dffn_ee_pch_d_alu_flag_param::L_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::L_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::L_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena_n;
	parameter real W_gate_write_phase_n   = sm83_dffn_ee_q_alu_sign_param::W_gate_ena_n + sm83_nor2_pch_in1_dec3_param::W_gate_in2 + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena_n;
	parameter real L_a0                   = sm83_idu_bit0_param::L_buf_a_y + sm83_irq_prio_bit0_param::L_dist_nand_a_in2;
	parameter real W_gate_a0              = sm83_irq_prio_bit0_param::W_gate_dist_nand_a_in2;
	parameter real L_a1                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit1_param::L_dist_nand_a_in;
	parameter real W_gate_a1              = sm83_irq_prio_bit1_param::W_gate_dist_nand_a_in;
	parameter real L_a10                  = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit2_param::L_dist_nand_b_in;
	parameter real W_gate_a10             = sm83_irq_prio_bit2_param::W_gate_dist_nand_b_in;
	parameter real L_a11                  = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit3_param::L_dist_nand_b_in;
	parameter real W_gate_a11             = sm83_irq_prio_bit3_param::W_gate_dist_nand_b_in;
	parameter real L_a12                  = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit4_param::L_dist_nand_b_in;
	parameter real W_gate_a12             = sm83_irq_prio_bit4_param::W_gate_dist_nand_b_in;
	parameter real L_a13                  = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit5_param::L_dist_nand_b_in;
	parameter real W_gate_a13             = sm83_irq_prio_bit5_param::W_gate_dist_nand_b_in;
	parameter real L_a14                  = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit6_param::L_dist_nand_b_in;
	parameter real W_gate_a14             = sm83_irq_prio_bit6_param::W_gate_dist_nand_b_in;
	parameter real L_a15                  = sm83_idu_bit7_param::L_buf_b_y + sm83_irq_prio_bit7_param::L_dist_nand_b_in;
	parameter real W_gate_a15             = sm83_irq_prio_bit7_param::W_gate_dist_nand_b_in;
	parameter real L_a2                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit2_param::L_dist_nand_a_in;
	parameter real W_gate_a2              = sm83_irq_prio_bit2_param::W_gate_dist_nand_a_in;
	parameter real L_a3                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit3_param::L_dist_nand_a_in;
	parameter real W_gate_a3              = sm83_irq_prio_bit3_param::W_gate_dist_nand_a_in;
	parameter real L_a4                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit4_param::L_dist_nand_a_in;
	parameter real W_gate_a4              = sm83_irq_prio_bit4_param::W_gate_dist_nand_a_in;
	parameter real L_a5                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit5_param::L_dist_nand_a_in;
	parameter real W_gate_a5              = sm83_irq_prio_bit5_param::W_gate_dist_nand_a_in;
	parameter real L_a6                   = sm83_idu_bit123456_param::L_buf_a_y + sm83_irq_prio_bit6_param::L_dist_nand_a_in;
	parameter real W_gate_a6              = sm83_irq_prio_bit6_param::W_gate_dist_nand_a_in;
	parameter real L_a7                   = sm83_idu_bit7_param::L_buf_a_y + sm83_irq_prio_bit7_param::L_dist_nand_a_in;
	parameter real W_gate_a7              = sm83_irq_prio_bit7_param::W_gate_dist_nand_a_in;
	parameter real L_a8                   = sm83_idu_bit0_param::L_buf_b_y + sm83_irq_prio_bit0_param::L_dist_nand_b_in;
	parameter real W_gate_a8              = sm83_irq_prio_bit0_param::W_gate_dist_nand_b_in;
	parameter real L_a9                   = sm83_idu_bit123456_param::L_buf_b_y + sm83_irq_prio_bit1_param::L_dist_nand_b_in;
	parameter real W_gate_a9              = sm83_irq_prio_bit1_param::W_gate_dist_nand_b_in;
	parameter real L_clk                  = sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_alt_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dlatch_ee_q_n_param::L_ena_n + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk + sm83_dff_cc_q_param::L_clk;
	parameter real W_gate_clk             = sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_alt_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dlatch_ee_q_n_param::W_gate_ena_n + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk + sm83_dff_cc_q_param::W_gate_clk;
	parameter real L_clk_ready            = sm83_nand2_d_param::L_in1;
	parameter real W_gate_clk_ready       = sm83_nand2_d_param::W_gate_in1;
	parameter real L_m1                   = sm83_not_x1_dec2_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_not_reg_we_param::L_in + sm83_oa21_param::L_in1 + sm83_ao31_in3_n_param::L_in2 + sm83_dffre_cc_q_param::L_clk_n + sm83_not_d_param::L_in;
	parameter real L_wr                   = sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in56 + sm83_and2_irq_param::L_in2;
	parameter real L_prefix_cb            = sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in23 + sm83_ao31_in3_n_param::L_in3_n + sm83_dffre_cc_q_param::L_d;
	parameter real L_d0                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d0              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d1                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d1              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d2                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d2              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d3                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d3              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d4                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d4              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d5                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d5              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d6                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d6              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_d7                   = sm83_b2b_wand_inj_a_param::L_b;
	parameter real W_gate_d7              = sm83_b2b_wand_inj_a_param::W_gate_b;
	parameter real L_data_phase           = sm83_dffn_ee_q_alu_sign_param::L_clk_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b2_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b2_param::L_pch_n + sm83_not_pch_dec3_b2_param::L_pch_n + sm83_not_pch_dec3_b2_param::L_pch_n + sm83_not_pch_dec3_b2_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_pch_dec3_b_param::L_pch_n + sm83_not_dec3_param::L_in + sm83_decoder3_param::L_in22 + sm83_decoder3_param::L_in41 + sm83_decoder3_param::L_in57 + sm83_decoder3_param::L_in58 + sm83_decoder3_param::L_in62 + sm83_decoder3_param::L_in65 + sm83_idu_bit0_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit123456_param::L_pch_n + sm83_idu_bit7_param::L_pch_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_dlatch_ee_irq_param::L_ena_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_reg_wz_out_param::L_pch_n + sm83_ao31_in3_n_param::L_in1 + sm83_nor4_in2_n_in4_n_param::L_in2_n + sm83_ao33_s3_tap_in1_n_param::L_in3 + sm83_aoi331_s3_param::L_in3;
	parameter real W_gate_data_phase      = sm83_dffn_ee_q_alu_sign_param::W_gate_clk_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b2_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b2_param::W_gate_pch_n + sm83_not_pch_dec3_b2_param::W_gate_pch_n + sm83_not_pch_dec3_b2_param::W_gate_pch_n + sm83_not_pch_dec3_b2_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_pch_dec3_b_param::W_gate_pch_n + sm83_not_dec3_param::W_gate_in + sm83_decoder3_param::W_gate_in22 + sm83_decoder3_param::W_gate_in41 + sm83_decoder3_param::W_gate_in57 + sm83_decoder3_param::W_gate_in58 + sm83_decoder3_param::W_gate_in62 + sm83_decoder3_param::W_gate_in65 + sm83_idu_bit0_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit123456_param::W_gate_pch_n + sm83_idu_bit7_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_dlatch_ee_irq_param::W_gate_ena_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_reg_wz_out_param::W_gate_pch_n + sm83_ao31_in3_n_param::W_gate_in1 + sm83_nor4_in2_n_in4_n_param::W_gate_in2_n + sm83_ao33_s3_tap_in1_n_param::W_gate_in3 + sm83_aoi331_s3_param::W_gate_in3;
	parameter real L_db0                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_a_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit0123_param::L_a_y + sm83_reg_pc_out_bit012_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db0             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db1                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_b_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit0123_param::L_a_y + sm83_reg_pc_out_bit012_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db1             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db2                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_a_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit0123_param::L_a_y + sm83_reg_pc_out_bit012_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db2             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db3                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_b_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit0123_param::L_a_y + sm83_reg_pc_out_bit345_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db3             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db4                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_a_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit4_param::L_a_y + sm83_reg_pc_out_bit345_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db4             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db5                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_b_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit5_param::L_a_y + sm83_reg_pc_out_bit345_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db5             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db6                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_a_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit6_param::L_a_y + sm83_reg_pc_out_bit67_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db6             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_db7                  = sm83_b2b_wand_inj_a_param::L_a + sm83_nand2_od_b_dbus_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_y + sm83_reg_bus_pch_a_bit7_param::L_a_y + sm83_reg_pc_out_bit67_param::L_y1 + sm83_reg_sp_out_param::L_y1 + sm83_dffr_cc_ee_reg_ie_bit_param::L_d + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_reg_wz_out_param::L_muxi_d0;
	parameter real W_gate_db7             = sm83_b2b_wand_inj_a_param::W_gate_a + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_d + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_reg_wz_out_param::W_gate_muxi_d0;
	parameter real L_exec_phase           = sm83_alu_decoder_param::L_in35 + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_not_pch_x2_alu_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_pggen_param::L_pch_n + sm83_alu_shifter_param::L_ena + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_b2b_wand_inj_a_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not2_pch_dec1_param::L_pch_n + sm83_not_x1_pch_dec2_param::L_pch_n + sm83_pch_dec2_a_param::L_pch_n + sm83_pch_dec2_c_param::L_pch_n + sm83_pch_dec2_c_param::L_pch_n + sm83_pch_dec2_b_param::L_pch_n + sm83_nor2_pch_in1_dec3_param::L_pch_n + sm83_nor2_pch_in1_dec3_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_pch_dec3_a2_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a2_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_pch_dec3_a2_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_p2_pch_dec3_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_not_pch_dec3_a_param::L_pch_n + sm83_decoder1_param::L_in27 + sm83_decoder2_param::L_pch_n + sm83_decoder3_param::L_in74 + sm83_decoder3_param::L_in85 + sm83_reg_bus_pch_a_bit0123_param::L_pch_n + sm83_reg_bus_pch_a_bit0123_param::L_pch_n + sm83_reg_bus_pch_a_bit0123_param::L_pch_n + sm83_reg_bus_pch_a_bit0123_param::L_pch_n + sm83_reg_bus_pch_a_bit4_param::L_pch_n + sm83_reg_bus_pch_a_bit5_param::L_pch_n + sm83_reg_bus_pch_a_bit6_param::L_pch_n + sm83_reg_bus_pch_a_bit7_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_reg_bus_pch_b_param::L_pch_n + sm83_dff_cc_q_param::L_clk_n;
	parameter real W_gate_exec_phase      = sm83_alu_decoder_param::W_gate_in35 + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_not_pch_x2_alu_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_pggen_param::W_gate_pch_n + sm83_alu_shifter_param::W_gate_ena + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_b2b_wand_inj_a_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not2_pch_dec1_param::W_gate_pch_n + sm83_not_x1_pch_dec2_param::W_gate_pch_n + sm83_pch_dec2_a_param::W_gate_pch_n + sm83_pch_dec2_c_param::W_gate_pch_n + sm83_pch_dec2_c_param::W_gate_pch_n + sm83_pch_dec2_b_param::W_gate_pch_n + sm83_nor2_pch_in1_dec3_param::W_gate_pch_n + sm83_nor2_pch_in1_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a2_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a2_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a2_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_p2_pch_dec3_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_not_pch_dec3_a_param::W_gate_pch_n + sm83_decoder1_param::W_gate_in27 + sm83_decoder2_param::W_gate_pch_n + sm83_decoder3_param::W_gate_in74 + sm83_decoder3_param::W_gate_in85 + sm83_reg_bus_pch_a_bit0123_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit0123_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit0123_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit0123_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit4_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit5_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit6_param::W_gate_pch_n + sm83_reg_bus_pch_a_bit7_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_reg_bus_pch_b_param::W_gate_pch_n + sm83_dff_cc_q_param::W_gate_clk_n;
	parameter real L_ffxx                 = sm83_not5_irq_param::L_d_y + sm83_irq_prio_bit0_param::L_dist_nand_a_in1;
	parameter real L_int0                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int0            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int1                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int1            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int2                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int2            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int3                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int3            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int4                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int4            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int5                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int5            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int6                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int6            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int7                 = sm83_nand2_nand3_od_irq_param::L_a_in2;
	parameter real W_gate_int7            = sm83_nand2_nand3_od_irq_param::W_gate_a_in2;
	parameter real L_int_entry            = sm83_dff_cc_q_param::L_q + sm83_nor3_param::L_in3 + sm83_aoi331_s3_param::L_in5;
	parameter real L_inta0                = sm83_irq_prio_bit0_param::L_and_y;
	parameter real L_inta1                = sm83_irq_prio_bit1_param::L_and_y;
	parameter real L_inta2                = sm83_irq_prio_bit2_param::L_and_y;
	parameter real L_inta3                = sm83_irq_prio_bit3_param::L_and_y;
	parameter real L_inta4                = sm83_irq_prio_bit4_param::L_and_y;
	parameter real L_inta5                = sm83_irq_prio_bit5_param::L_and_y;
	parameter real L_inta6                = sm83_irq_prio_bit6_param::L_and_a_y;
	parameter real L_inta7                = sm83_irq_prio_bit7_param::L_and_a_y;
	parameter real L_internal_access      = sm83_oa211_in1_n_in3_n_param::L_in3_n;
	parameter real W_gate_internal_access = sm83_oa211_in1_n_in3_n_param::W_gate_in3_n;
	parameter real L_mreq                 = sm83_oa211_in1_n_in3_n_param::L_y;
	parameter real L_nmi                  = sm83_not_c_param::L_in;
	parameter real W_gate_nmi             = sm83_not_c_param::W_gate_in;
	parameter real L_pwron_reset          = sm83_or3_a_param::L_in1 + sm83_nor2_f_param::L_in2;
	parameter real W_gate_pwron_reset     = sm83_or3_a_param::W_gate_in1 + sm83_nor2_f_param::W_gate_in2;
	parameter real L_rd                   = sm83_oa21_param::L_y + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1 + sm83_nand2_nand3_od_irq_param::L_b_in1;
	parameter real L_shadow_access        = sm83_oa211_in1_n_in3_n_param::L_in1_n;
	parameter real W_gate_shadow_access   = sm83_oa211_in1_n_in3_n_param::W_gate_in1_n;
	parameter real L_shadow_override      = sm83_oa211_in1_n_in3_n_param::L_in2;
	parameter real W_gate_shadow_override = sm83_oa211_in1_n_in3_n_param::W_gate_in2;
	parameter real L_sys_reset            = sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_dffr_cc_ee_reg_ie_bit_param::L_r + sm83_not2_reg_pc_we_param::L_b_in + sm83_not2_reg_pc_we_param::L_b_in + sm83_or3_b_param::L_in2 + sm83_aoi21_a_param::L_in3 + sm83_nor2_f_param::L_in1 + sm83_or2_a_param::L_in1 + sm83_nor2_a_param::L_in2 + sm83_not_b_param::L_in + sm83_aoi331_s3_param::L_in6;
	parameter real W_gate_sys_reset       = sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_r + sm83_not2_reg_pc_we_param::W_gate_b_in + sm83_not2_reg_pc_we_param::W_gate_b_in + sm83_or3_b_param::W_gate_in2 + sm83_aoi21_a_param::W_gate_in3 + sm83_nor2_f_param::W_gate_in1 + sm83_or2_a_param::W_gate_in1 + sm83_nor2_a_param::W_gate_in2 + sm83_not_b_param::W_gate_in + sm83_aoi331_s3_param::W_gate_in6;
	parameter real L_test_freeze          = sm83_aoi21_b_param::L_in3 + sm83_nor3_param::L_in1 + sm83_or3_b_param::L_in3;
	parameter real W_gate_test_freeze     = sm83_aoi21_b_param::W_gate_in3 + sm83_nor3_param::W_gate_in1 + sm83_or3_b_param::W_gate_in3;
	parameter real L_wake                 = sm83_nor2_b_param::L_in1;
	parameter real W_gate_wake            = sm83_nor2_b_param::W_gate_in1;
	parameter real L_write_phase          = sm83_alu_decoder_param::L_in36 + sm83_dffn_ee_q_alu_sign_param::L_ena + sm83_dffn_ee_pch_d_alu_flag_param::L_ena + sm83_dffn_ee_pch_d_alu_flag_param::L_ena + sm83_dffn_ee_pch_d_alu_flag_param::L_ena + sm83_dffn_ee_pch_d_alu_flag_param::L_ena + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_dlatch_ee_irq_param::L_pch_n + sm83_irq_prio_bit0_param::L_pch_n + sm83_irq_prio_bit1_param::L_pch_n + sm83_irq_prio_bit2_param::L_pch_n + sm83_irq_prio_bit3_param::L_pch_n + sm83_irq_prio_bit4_param::L_pch_n + sm83_irq_prio_bit5_param::L_pch_n + sm83_irq_prio_bit6_param::L_pch_n + sm83_irq_prio_bit7_param::L_pch_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dffr_cc_ee_reg_ie_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::L_ena + sm83_reg_pc_out_bit012_param::L_in10 + sm83_reg_pc_out_bit012_param::L_in10 + sm83_reg_pc_out_bit012_param::L_in10 + sm83_reg_pc_out_bit345_param::L_in10 + sm83_reg_pc_out_bit345_param::L_in10 + sm83_reg_pc_out_bit345_param::L_in10 + sm83_reg_pc_out_bit67_param::L_in10 + sm83_reg_pc_out_bit67_param::L_in10 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_ena + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_reg_sp_out_param::L_in14 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_ena + sm83_dffre_cc_q_param::L_ena;
	parameter real W_gate_write_phase     = sm83_alu_decoder_param::W_gate_in36 + sm83_dffn_ee_q_alu_sign_param::W_gate_ena + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_ena + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_dlatch_ee_irq_param::W_gate_pch_n + sm83_irq_prio_bit0_param::W_gate_pch_n + sm83_irq_prio_bit1_param::W_gate_pch_n + sm83_irq_prio_bit2_param::W_gate_pch_n + sm83_irq_prio_bit3_param::W_gate_pch_n + sm83_irq_prio_bit4_param::W_gate_pch_n + sm83_irq_prio_bit5_param::W_gate_pch_n + sm83_irq_prio_bit6_param::W_gate_pch_n + sm83_irq_prio_bit7_param::W_gate_pch_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_ena + sm83_reg_pc_out_bit012_param::W_gate_in10 + sm83_reg_pc_out_bit012_param::W_gate_in10 + sm83_reg_pc_out_bit012_param::W_gate_in10 + sm83_reg_pc_out_bit345_param::W_gate_in10 + sm83_reg_pc_out_bit345_param::W_gate_in10 + sm83_reg_pc_out_bit345_param::W_gate_in10 + sm83_reg_pc_out_bit67_param::W_gate_in10 + sm83_reg_pc_out_bit67_param::W_gate_in10 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_ena + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in14 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_ena + sm83_dffre_cc_q_param::W_gate_ena;

endpackage

module sm83 #(
		parameter real L_halt_n           = sm83_param::L_halt_n,
		parameter real W_gate_halt_n      = 0,
		parameter real L_stop_n           = sm83_param::L_stop_n,
		parameter real W_gate_stop_n      = 0,
		parameter real L_a0               = sm83_param::L_a0,
		parameter real W_gate_a0          = sm83_param::W_gate_a0,
		parameter real L_a1               = sm83_param::L_a1,
		parameter real W_gate_a1          = sm83_param::W_gate_a1,
		parameter real L_a10              = sm83_param::L_a10,
		parameter real W_gate_a10         = sm83_param::W_gate_a10,
		parameter real L_a11              = sm83_param::L_a11,
		parameter real W_gate_a11         = sm83_param::W_gate_a11,
		parameter real L_a12              = sm83_param::L_a12,
		parameter real W_gate_a12         = sm83_param::W_gate_a12,
		parameter real L_a13              = sm83_param::L_a13,
		parameter real W_gate_a13         = sm83_param::W_gate_a13,
		parameter real L_a14              = sm83_param::L_a14,
		parameter real W_gate_a14         = sm83_param::W_gate_a14,
		parameter real L_a15              = sm83_param::L_a15,
		parameter real W_gate_a15         = sm83_param::W_gate_a15,
		parameter real L_a2               = sm83_param::L_a2,
		parameter real W_gate_a2          = sm83_param::W_gate_a2,
		parameter real L_a3               = sm83_param::L_a3,
		parameter real W_gate_a3          = sm83_param::W_gate_a3,
		parameter real L_a4               = sm83_param::L_a4,
		parameter real W_gate_a4          = sm83_param::W_gate_a4,
		parameter real L_a5               = sm83_param::L_a5,
		parameter real W_gate_a5          = sm83_param::W_gate_a5,
		parameter real L_a6               = sm83_param::L_a6,
		parameter real W_gate_a6          = sm83_param::W_gate_a6,
		parameter real L_a7               = sm83_param::L_a7,
		parameter real W_gate_a7          = sm83_param::W_gate_a7,
		parameter real L_a8               = sm83_param::L_a8,
		parameter real W_gate_a8          = sm83_param::W_gate_a8,
		parameter real L_a9               = sm83_param::L_a9,
		parameter real W_gate_a9          = sm83_param::W_gate_a9,
		parameter real L_m1               = sm83_param::L_m1,
		parameter real W_gate_m1          = 0,
		parameter real L_wr               = sm83_param::L_wr,
		parameter real W_gate_wr          = 0,
		parameter real L_prefix_cb        = sm83_param::L_prefix_cb,
		parameter real W_gate_prefix_cb   = 0,
		parameter real L_d0               = sm83_param::L_d0,
		parameter real W_gate_d0          = sm83_param::W_gate_d0,
		parameter real L_d1               = sm83_param::L_d1,
		parameter real W_gate_d1          = sm83_param::W_gate_d1,
		parameter real L_d2               = sm83_param::L_d2,
		parameter real W_gate_d2          = sm83_param::W_gate_d2,
		parameter real L_d3               = sm83_param::L_d3,
		parameter real W_gate_d3          = sm83_param::W_gate_d3,
		parameter real L_d4               = sm83_param::L_d4,
		parameter real W_gate_d4          = sm83_param::W_gate_d4,
		parameter real L_d5               = sm83_param::L_d5,
		parameter real W_gate_d5          = sm83_param::W_gate_d5,
		parameter real L_d6               = sm83_param::L_d6,
		parameter real W_gate_d6          = sm83_param::W_gate_d6,
		parameter real L_d7               = sm83_param::L_d7,
		parameter real W_gate_d7          = sm83_param::W_gate_d7,
		parameter real L_db0              = sm83_param::L_db0,
		parameter real W_gate_db0         = sm83_param::W_gate_db0,
		parameter real L_db1              = sm83_param::L_db1,
		parameter real W_gate_db1         = sm83_param::W_gate_db1,
		parameter real L_db2              = sm83_param::L_db2,
		parameter real W_gate_db2         = sm83_param::W_gate_db2,
		parameter real L_db3              = sm83_param::L_db3,
		parameter real W_gate_db3         = sm83_param::W_gate_db3,
		parameter real L_db4              = sm83_param::L_db4,
		parameter real W_gate_db4         = sm83_param::W_gate_db4,
		parameter real L_db5              = sm83_param::L_db5,
		parameter real W_gate_db5         = sm83_param::W_gate_db5,
		parameter real L_db6              = sm83_param::L_db6,
		parameter real W_gate_db6         = sm83_param::W_gate_db6,
		parameter real L_db7              = sm83_param::L_db7,
		parameter real W_gate_db7         = sm83_param::W_gate_db7,
		parameter real L_ffxx             = sm83_param::L_ffxx,
		parameter real W_gate_ffxx        = 0,
		parameter real L_int_entry        = sm83_param::L_int_entry,
		parameter real W_gate_int_entry   = 0,
		parameter real L_inta0            = sm83_param::L_inta0,
		parameter real W_gate_inta0       = 0,
		parameter real L_inta1            = sm83_param::L_inta1,
		parameter real W_gate_inta1       = 0,
		parameter real L_inta2            = sm83_param::L_inta2,
		parameter real W_gate_inta2       = 0,
		parameter real L_inta3            = sm83_param::L_inta3,
		parameter real W_gate_inta3       = 0,
		parameter real L_inta4            = sm83_param::L_inta4,
		parameter real W_gate_inta4       = 0,
		parameter real L_inta5            = sm83_param::L_inta5,
		parameter real W_gate_inta5       = 0,
		parameter real L_inta6            = sm83_param::L_inta6,
		parameter real W_gate_inta6       = 0,
		parameter real L_inta7            = sm83_param::L_inta7,
		parameter real W_gate_inta7       = 0,
		parameter real L_mreq             = sm83_param::L_mreq,
		parameter real W_gate_mreq        = 0,
		parameter real L_rd               = sm83_param::L_rd,
		parameter real W_gate_rd          = 0
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
	tri logic ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec_n;
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
	tri logic ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec_n;
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
	tri logic ctl_op_reti_m3_n;
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
	tri logic ctl_reg_gp_we_mask_n;
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
	logic     dec1_y107_n;
	logic     dec1_y49_n;
	logic     dec1_y50_n;
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
	logic     nmi_entry_n;
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
	logic     ctl_mread_lsb;
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
	logic     ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec;
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
	logic     ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec;
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
	logic     ctl_op_reti_m3;
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
	logic     ctl_reg_gp_we_mask;
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
	logic     ctl_sel_reg_w;
	logic     ctl_sel_reg_z;
	logic     daa_hi_ge9;
	logic     daa_hi_gt9;
	logic     daa_lo_gt9;
	tri logic dec1_y107;
	tri logic dec1_y49;
	tri logic dec1_y50;
	tri logic dec3_y56;
	tri logic dec3_y58;
	logic     ffff;
	logic     flag_c;
	logic     flag_h;
	logic     flag_n;
	logic     flag_z;
	logic     gnd;
	logic     halt;
	logic     idle;
	logic     idu_at8;
	logic     idu_dec;
	logic     idu_inc;
	logic     ie_we_n;
	logic     ie_we;
	logic     ime_state;
	logic     in_intr;
	logic     int_pending;
	logic     int_take;
	logic     int_vector3;
	logic     int_vector4;
	logic     int_vector5;
	logic     int_vector6;
	logic     int_vector7;
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
	logic     nmi_entry;
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
	logic     wafr;
	logic     ween;
	logic     werf;
	logic     wudz;
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
			.L_y(90.6039 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst0 (
			.in1(prop[0]),
			.in2(alu_pggen_tap_nand[0]),
			.y(alu_and[0])
		);

	sm83_and2_alu #(
			.L_y(95.10242 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst1 (
			.in1(alu_pggen_tap_nand[1]),
			.in2(prop[1]),
			.y(alu_and[1])
		);

	sm83_and2_alu #(
			.L_y(116.4545 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst2 (
			.in1(alu_pggen_tap_nand[2]),
			.in2(prop[2]),
			.y(alu_and[2])
		);

	sm83_and2_alu #(
			.L_y(112.4629 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst3 (
			.in1(alu_pggen_tap_nand[3]),
			.in2(prop[3]),
			.y(alu_and[3])
		);

	sm83_and2_alu #(
			.L_y(98.65055 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst4 (
			.in1(prop[4]),
			.in2(alu_pggen_tap_nand[4]),
			.y(alu_and[4])
		);

	sm83_and2_alu #(
			.L_y(102.8322 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst5 (
			.in1(alu_pggen_tap_nand[5]),
			.in2(prop[5]),
			.y(alu_and[5])
		);

	sm83_and2_alu #(
			.L_y(110.3721 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst6 (
			.in1(alu_pggen_tap_nand[6]),
			.in2(prop[6]),
			.y(alu_and[6])
		);

	sm83_and2_alu #(
			.L_y(104.9865 + sm83_and2_alu_param::L_y + sm83_ao221_xor_in4_s1_param::L_in1),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in1)
		) alu_and_inst7 (
			.in1(prop[7]),
			.in2(alu_pggen_tap_nand[7]),
			.y(alu_and[7])
		);

	sm83_alu_cgen #(
			.L_cout0(94.21536 + sm83_alu_cgen_param::L_cout0 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout0(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout1(147.0571 + sm83_alu_cgen_param::L_cout1 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout1(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout2(163.9741 + sm83_alu_cgen_param::L_cout2 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout2(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout3(2732.501 + sm83_alu_cgen_param::L_cout3 + sm83_alu_decoder_param::L_in37 + sm83_not_alu_b_param::L_in + sm83_idu_ctl_param::L_in4),
			.W_gate_cout3(sm83_alu_decoder_param::W_gate_in37 + sm83_not_alu_b_param::W_gate_in + sm83_idu_ctl_param::W_gate_in4)
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
			.L_cout0(160.1725 + sm83_alu_cgen_param::L_cout0 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout0(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout1(70.01212 + sm83_alu_cgen_param::L_cout1 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout1(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout2(84.0779 + sm83_alu_cgen_param::L_cout2 + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout2(sm83_ao221_xor_in4_s1_param::W_gate_in4),
			.L_cout3(1034.117 + sm83_alu_cgen_param::L_cout3 + sm83_alu_cgen_param::L_cin + sm83_alu_decoder_param::L_in28 + sm83_not_alu_a_param::L_in + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_cout3(sm83_alu_cgen_param::W_gate_cin + sm83_alu_decoder_param::W_gate_in28 + sm83_not_alu_a_param::W_gate_in + sm83_ao221_xor_in4_s1_param::W_gate_in4)
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
			.L_y1(103.5926 + sm83_alu_decoder_param::L_y1 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y1(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y2(204.2707 + sm83_alu_decoder_param::L_y2 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_y2(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_y3(343.9147 + sm83_alu_decoder_param::L_y3 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_y3(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_y4(131.3439 + sm83_alu_decoder_param::L_y4 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y4(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y5(109.0415 + sm83_alu_decoder_param::L_y5 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y5(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y6(120.3195 + sm83_alu_decoder_param::L_y6 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y6(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y7(108.2812 + sm83_alu_decoder_param::L_y7 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y7(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y8(173.0344 + sm83_alu_decoder_param::L_y8 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_y8(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_y9(108.3445 + sm83_alu_decoder_param::L_y9 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y9(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y10(98.96736 + sm83_alu_decoder_param::L_y10 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y10(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y11(145.0929 + sm83_alu_decoder_param::L_y11 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y11(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y12(37.19193 + sm83_alu_decoder_param::L_y12 + sm83_not_pch_x1_alu_param::L_in),
			.W_gate_y12(sm83_not_pch_x1_alu_param::W_gate_in),
			.L_y13(465.8182 + sm83_alu_decoder_param::L_y13 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_y13(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_y14(142.9388 + sm83_alu_decoder_param::L_y14 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_y14(sm83_not_pch_x2_alu_param::W_gate_in)
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
			.L_q(517.2026 + sm83_dffn_ee_q_alu_sign_param::L_q + sm83_and2_and3_reg_param::L_a_in1),
			.W_gate_q(sm83_and2_and3_reg_param::W_gate_a_in1)
		) alu_dff_inst (
			.d(reg_z[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk_n(data_phase),
			.q(reg_z7_delayed)
		);

	sm83_not_pch_x2_alu #(
			.L_in(103.5926 + sm83_alu_decoder_param::L_y1 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(336.5017 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not1_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[0]),
			.y(op1dec[0])
		);

	sm83_not_pch_x2_alu #(
			.L_in(142.9388 + sm83_alu_decoder_param::L_y14 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(1063.551 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_cgen_param::L_cin + sm83_ao221_xor_in4_s1_param::L_in4),
			.W_gate_y(sm83_alu_cgen_param::W_gate_cin + sm83_ao221_xor_in4_s1_param::W_gate_in4)
		) alu_not10_inst (
			.pch_n(exec_phase),
			.in(carry_in_n),
			.y(carry_in)
		);

	sm83_not_alu_a #(
			.L_y(372.2594 + sm83_not_alu_a_param::L_y + sm83_alu_decoder_param::L_in30),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in30)
		) alu_not11_inst (
			.in(res_carry[3]),
			.y(res_hcarry_n)
		);

	sm83_not_alu_b #(
			.L_y(527.9272 + sm83_not_alu_b_param::L_y + sm83_alu_decoder_param::L_in29),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in29)
		) alu_not12_inst (
			.in(res_carry[7]),
			.y(res_carry_n)
		);

	sm83_not_pch_x2_alu #(
			.L_in(131.3439 + sm83_alu_decoder_param::L_y4 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(363.9996 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not2_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[1]),
			.y(op1dec[1])
		);

	sm83_not_pch_x2_alu #(
			.L_in(109.0415 + sm83_alu_decoder_param::L_y5 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(302.0342 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not3_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[2]),
			.y(op1dec[2])
		);

	sm83_not_pch_x2_alu #(
			.L_in(120.3195 + sm83_alu_decoder_param::L_y6 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(319.268 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not4_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[3]),
			.y(op1dec[3])
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.2812 + sm83_alu_decoder_param::L_y7 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(368.3715 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not5_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[4]),
			.y(op1dec[4])
		);

	sm83_not_pch_x2_alu #(
			.L_in(108.3445 + sm83_alu_decoder_param::L_y9 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(318.4442 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not6_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[5]),
			.y(op1dec[5])
		);

	sm83_not_pch_x2_alu #(
			.L_in(98.96736 + sm83_alu_decoder_param::L_y10 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(370.2721 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not7_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[6]),
			.y(op1dec[6])
		);

	sm83_not_pch_x2_alu #(
			.L_in(145.0929 + sm83_alu_decoder_param::L_y11 + sm83_not_pch_x2_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x2_alu_param::W_gate_in),
			.L_y(392.3214 + sm83_not_pch_x2_alu_param::L_y + sm83_alu_pggen_param::L_and_or_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_and_or_in2)
		) alu_not8_inst (
			.pch_n(exec_phase),
			.in(op1dec_n[7]),
			.y(op1dec[7])
		);

	sm83_not_pch_x1_alu #(
			.L_in(37.19193 + sm83_alu_decoder_param::L_y12 + sm83_not_pch_x1_alu_param::L_in),
			.W_gate_in(sm83_not_pch_x1_alu_param::W_gate_in),
			.L_y(1332.448 + sm83_not_pch_x1_alu_param::L_y + sm83_nor2_d_param::L_in2),
			.W_gate_y(sm83_nor2_d_param::W_gate_in2)
		) alu_not9_inst (
			.pch_n(pch_phase_n),
			.in(alu_cond_fail_n),
			.y(alu_cond_fail)
		);

	sm83_alu_pggen #(
			.L_ao221_in5_n(101.1216 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y0),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(169.3596 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in17 + sm83_alu_decoder_param::L_in21),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in17 + sm83_alu_decoder_param::W_gate_in21),
			.L_tap_nand(89.59021 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in2),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in2),
			.L_tap_and(243.2367 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g0),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g0),
			.L_tap_or(244.2504 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in1 + sm83_alu_cgen_param::L_p0),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in1 + sm83_alu_cgen_param::W_gate_p0),
			.L_y(186.1498 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(127.9859 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y1),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(131.8509 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in18),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in18),
			.L_tap_nand(77.3618 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in1),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in1),
			.L_tap_and(198.2515 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g1),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g1),
			.L_tap_or(274.1561 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in2 + sm83_alu_cgen_param::L_p1),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in2 + sm83_alu_cgen_param::W_gate_p1),
			.L_y(237.2808 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(149.9083 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y2),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(183.0452 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in19),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in19),
			.L_tap_nand(118.6721 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in1),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in1),
			.L_tap_and(163.3405 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g2),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g2),
			.L_tap_or(225.2426 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in2 + sm83_alu_cgen_param::L_p2),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in2 + sm83_alu_cgen_param::W_gate_p2),
			.L_y(296.5219 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(126.2119 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y3),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(229.4243 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in20),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in20),
			.L_tap_nand(117.9118 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in1),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in1),
			.L_tap_and(187.8606 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g3),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g3),
			.L_tap_or(246.6581 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in2 + sm83_alu_cgen_param::L_p3),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in2 + sm83_alu_cgen_param::W_gate_p3),
			.L_y(185.643 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(130.0134 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y4),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(240.6388 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in22),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in22),
			.L_tap_nand(102.3887 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in2),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in2),
			.L_tap_and(200.0255 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g0),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g0),
			.L_tap_or(249.7626 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in1 + sm83_alu_cgen_param::L_p0),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in1 + sm83_alu_cgen_param::W_gate_p0),
			.L_y(167.0153 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(140.9746 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y5),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(165.4313 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in23),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in23),
			.L_tap_nand(90.47716 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in1),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in1),
			.L_tap_and(216.0555 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g1),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g1),
			.L_tap_or(264.4621 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in2 + sm83_alu_cgen_param::L_p1),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in2 + sm83_alu_cgen_param::W_gate_p1),
			.L_y(266.8697 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(100.9315 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y6),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(219.9204 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in24),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in24),
			.L_tap_nand(104.733 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in1),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in1),
			.L_tap_and(164.1641 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g2),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g2),
			.L_tap_or(232.4655 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in2 + sm83_alu_cgen_param::L_p2),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in2 + sm83_alu_cgen_param::W_gate_p2),
			.L_y(278.0209 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_ao221_in5_n(143.3189 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y7),
			.W_gate_ao221_in5_n(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_tap_xor(419.3757 + sm83_alu_pggen_param::L_tap_xor + sm83_alu_decoder_param::L_in25),
			.W_gate_tap_xor(sm83_alu_decoder_param::W_gate_in25),
			.L_tap_nand(113.6033 + sm83_alu_pggen_param::L_tap_nand + sm83_and2_alu_param::L_in2),
			.W_gate_tap_nand(sm83_and2_alu_param::W_gate_in2),
			.L_tap_and(181.5246 + sm83_alu_pggen_param::L_tap_and + sm83_alu_cgen_param::L_g3),
			.W_gate_tap_and(sm83_alu_cgen_param::W_gate_g3),
			.L_tap_or(240.829 + sm83_alu_pggen_param::L_tap_or + sm83_and2_alu_param::L_in1 + sm83_alu_cgen_param::L_p3),
			.W_gate_tap_or(sm83_and2_alu_param::W_gate_in1 + sm83_alu_cgen_param::W_gate_p3),
			.L_y(164.4588 + sm83_alu_pggen_param::L_y + sm83_ao221_xor_in4_s1_param::L_in5),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in5)
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
			.L_y(1448.148 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in8 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in8 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst0 (
			.in1(alu_and[0]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(carry_in),
			.in5(alu_pggen_y[0]),
			.y(res[0])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1980.822 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in7 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in7 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst1 (
			.in1(alu_and[1]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[0]),
			.in5(alu_pggen_y[1]),
			.y(res[1])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1926.701 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in6 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in6 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst2 (
			.in1(alu_and[2]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[1]),
			.in5(alu_pggen_y[2]),
			.y(res[2])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1864.478 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in5 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in5 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst3 (
			.in1(alu_and[3]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[2]),
			.in5(alu_pggen_y[3]),
			.y(res[3])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1825.224 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in4 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in4 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst4 (
			.in1(alu_and[4]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[3]),
			.in5(alu_pggen_y[4]),
			.y(res[4])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1756.737 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in3 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in3 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst5 (
			.in1(alu_and[5]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[4]),
			.in5(alu_pggen_y[5]),
			.y(res[5])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1733.387 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in2 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in2 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst6 (
			.in1(alu_and[6]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[5]),
			.in5(alu_pggen_y[6]),
			.y(res[6])
		);

	sm83_ao221_xor_in4_s1 #(
			.L_y(1700.332 + sm83_ao221_xor_in4_s1_param::L_y + sm83_nor8_alu_param::L_in1 + sm83_b2b_wand_inj_a_param::L_inj_d + sm83_reg_wz_out_param::L_aoi_in1),
			.W_gate_y(sm83_nor8_alu_param::W_gate_in1 + sm83_b2b_wand_inj_a_param::W_gate_inj_d + sm83_reg_wz_out_param::W_gate_aoi_in1)
		) alu_result_inst7 (
			.in1(alu_and[7]),
			.in2(ctl_alu_xor),
			.in3(ctl_alu_add),
			.in4(res_carry[6]),
			.in5(alu_pggen_y[7]),
			.y(res[7])
		);

	sm83_alu_shifter #(
			.L_y0(101.1216 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y0),
			.W_gate_y0(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y1(127.9859 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y1),
			.W_gate_y1(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y2(149.9083 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y2),
			.W_gate_y2(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y3(126.2119 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y3),
			.W_gate_y3(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y4(130.0134 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y4),
			.W_gate_y4(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y5(140.9746 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y5),
			.W_gate_y5(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y6(100.9315 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y6),
			.W_gate_y6(sm83_alu_pggen_param::W_gate_ao221_in5_n),
			.L_y7(143.3189 + sm83_alu_pggen_param::L_ao221_in5_n + sm83_alu_shifter_param::L_y7),
			.W_gate_y7(sm83_alu_pggen_param::W_gate_ao221_in5_n)
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
			.L_y(662.8661 + sm83_nor8_alu_param::L_y + sm83_alu_decoder_param::L_in53),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in53)
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
			.W_gate_a(W_gate_db0),
			.L_b(L_d0),
			.W_gate_b(W_gate_d0)
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
			.W_gate_a(W_gate_db1),
			.L_b(L_d1),
			.W_gate_b(W_gate_d1)
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
			.W_gate_a(W_gate_db2),
			.L_b(L_d2),
			.W_gate_b(W_gate_d2)
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
			.W_gate_a(W_gate_db3),
			.L_b(L_d3),
			.W_gate_b(W_gate_d3)
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
			.W_gate_a(W_gate_db4),
			.L_b(L_d4),
			.W_gate_b(W_gate_d4)
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
			.W_gate_a(W_gate_db5),
			.L_b(L_d5),
			.W_gate_b(W_gate_d5)
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
			.W_gate_a(W_gate_db6),
			.L_b(L_d6),
			.W_gate_b(W_gate_d6)
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
			.W_gate_a(W_gate_db7),
			.L_b(L_d7),
			.W_gate_b(W_gate_d7)
		) dbus_bridge_inst7 (
			.a(db[7]),
			.b(d[7]),
			.oe_n(oe_n),
			.pch_n(exec_phase),
			.inj_d(res[7]),
			.inj_en(ctl_alu_to_db_en)
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db0),
			.W_gate_y(W_gate_db0)
		) dbus_nand_inst0 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[0]),
			.y(db[0])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db1),
			.W_gate_y(W_gate_db1)
		) dbus_nand_inst1 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[1]),
			.y(db[1])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db2),
			.W_gate_y(W_gate_db2)
		) dbus_nand_inst2 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[2]),
			.y(db[2])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db3),
			.W_gate_y(W_gate_db3)
		) dbus_nand_inst3 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[3]),
			.y(db[3])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db4),
			.W_gate_y(W_gate_db4)
		) dbus_nand_inst4 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[4]),
			.y(db[4])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db5),
			.W_gate_y(W_gate_db5)
		) dbus_nand_inst5 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[5]),
			.y(db[5])
		);

	sm83_nand2_od_a_dbus #(
			.L_y(L_db6),
			.W_gate_y(W_gate_db6)
		) dbus_nand_inst6 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[6]),
			.y(db[6])
		);

	sm83_nand2_od_b_dbus #(
			.L_y(L_db7),
			.W_gate_y(W_gate_db7)
		) dbus_nand_inst7 (
			.in1(ctl_op2_to_db_en),
			.in2(op2val_n[7]),
			.y(db[7])
		);

	sm83_not_dbus #(
			.L_y(91.74437 + sm83_not_dbus_param::L_y + sm83_nand2_od_a_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_a_dbus_param::W_gate_in2)
		) dbus_not_inst0 (
			.in(op2val[0]),
			.y(op2val_n[0])
		);

	sm83_not_dbus #(
			.L_y(88.38638 + sm83_not_dbus_param::L_y + sm83_nand2_od_b_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_b_dbus_param::W_gate_in2)
		) dbus_not_inst1 (
			.in(op2val[1]),
			.y(op2val_n[1])
		);

	sm83_not_dbus #(
			.L_y(84.58473 + sm83_not_dbus_param::L_y + sm83_nand2_od_a_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_a_dbus_param::W_gate_in2)
		) dbus_not_inst2 (
			.in(op2val[2]),
			.y(op2val_n[2])
		);

	sm83_not_dbus #(
			.L_y(80.71982 + sm83_not_dbus_param::L_y + sm83_nand2_od_b_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_b_dbus_param::W_gate_in2)
		) dbus_not_inst3 (
			.in(op2val[3]),
			.y(op2val_n[3])
		);

	sm83_not_dbus #(
			.L_y(77.36179 + sm83_not_dbus_param::L_y + sm83_nand2_od_a_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_a_dbus_param::W_gate_in2)
		) dbus_not_inst4 (
			.in(op2val[4]),
			.y(op2val_n[4])
		);

	sm83_not_dbus #(
			.L_y(74.06711 + sm83_not_dbus_param::L_y + sm83_nand2_od_b_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_b_dbus_param::W_gate_in2)
		) dbus_not_inst5 (
			.in(op2val[5]),
			.y(op2val_n[5])
		);

	sm83_not_dbus #(
			.L_y(71.08923 + sm83_not_dbus_param::L_y + sm83_nand2_od_a_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_a_dbus_param::W_gate_in2)
		) dbus_not_inst6 (
			.in(op2val[6]),
			.y(op2val_n[6])
		);

	sm83_not_dbus #(
			.L_y(66.654 + sm83_not_dbus_param::L_y + sm83_nand2_od_b_dbus_param::L_in2),
			.W_gate_y(sm83_nand2_od_b_dbus_param::W_gate_in2)
		) dbus_not_inst7 (
			.in(op2val[7]),
			.y(op2val_n[7])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(25.15366 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y1),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(133.6882 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in24),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in24),
			.L_b_in(24.01319 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y2),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(139.6459 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in25),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in25)
		) dec1_not1_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ldx_nn_a_m2_n),
			.a_y(ctl_op_ldx_nn_a_m2),
			.b_in(ctl_op_ldx_a_nn_m2_n),
			.b_y(ctl_op_ldx_a_nn_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.5201 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y20),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(143.1289 + sm83_not2_pch_dec1_param::L_a_y + sm83_buf_dec2_param::L_in + sm83_decoder2_param::L_in3),
			.W_gate_a_y(sm83_buf_dec2_param::W_gate_in + sm83_decoder2_param::W_gate_in3),
			.L_b_in(24.39338 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y19),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.9889 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in39),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in39)
		) dec1_not10_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m1_n),
			.a_y(ctl_op_jr_m1),
			.b_in(ctl_op_m7_n),
			.b_y(ctl_op_m7)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77352 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y21),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(112.9697 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in40),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in40),
			.L_b_in(24.4567 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y22),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(73.81369 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in41),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in41)
		) dec1_not11_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m0_n),
			.a_y(ctl_op_jr_m0),
			.b_in(ctl_op_add_sp_e_m2_n),
			.b_y(ctl_op_add_sp_e_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y24),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.5346 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in43),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in43),
			.L_b_in(24.64675 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y23),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(119.3057 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in42),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in42)
		) dec1_not12_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_res_b_r_m0_n),
			.a_y(ctl_op_res_b_r_m0),
			.b_in(ctl_op_ldhl_sp_e_m2_n),
			.b_y(ctl_op_ldhl_sp_e_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94989 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y25),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(100.3612 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in44),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in44),
			.L_b_in(23.82309 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y26),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(371.0325 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder3_param::L_in44),
			.W_gate_b_y(sm83_decoder3_param::W_gate_in44)
		) dec1_not13_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_res_b_hl_m1_n),
			.a_y(ctl_op_res_b_hl_m1),
			.b_in(ctl_op_rxxa_n),
			.b_y(ctl_op_rxxa)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y28),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(149.2746 + sm83_not2_pch_dec1_param::L_a_y + sm83_buf_dec2_param::L_in),
			.W_gate_a_y(sm83_buf_dec2_param::W_gate_in),
			.L_b_in(24.13991 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y27),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(281.3156 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in4),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in4)
		) dec1_not14_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_bit_n),
			.a_y(ctl_op_bit),
			.b_in(ctl_op_ld_a_xxx_m1_n),
			.b_y(ctl_op_ld_a_xxx_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y29),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(232.0854 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in45),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in45),
			.L_b_in(24.20326 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y30),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(117.3415 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in46),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in46)
		) dec1_not15_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_xxx_a_m0_n),
			.a_y(ctl_op_ld_xxx_a_m0),
			.b_in(ctl_op_ld_a_xxx_m0_n),
			.b_y(ctl_op_ld_a_xxx_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52005 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y32),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.9781 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in48),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in48),
			.L_b_in(24.45675 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y31),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(110.7522 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in47),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in47)
		) dec1_not16_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_n_a_m0_n),
			.a_y(ctl_op_ld_n_a_m0),
			.b_in(ctl_op_ld_c_a_m0_n),
			.b_y(ctl_op_ld_c_a_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71014 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y33),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(82.11371 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in49),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in49),
			.L_b_in(23.82312 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y34),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(115.3141 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in50),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in50)
		) dec1_not17_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_n_a_m1_n),
			.a_y(ctl_op_ld_n_a_m1),
			.b_in(ctl_op_ld_r_hl_m0_n),
			.b_y(ctl_op_ld_r_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88649 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y36),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(144.4594 + sm83_not2_pch_dec1_param::L_a_y + sm83_buf_dec2_param::L_in + sm83_decoder2_param::L_in6),
			.W_gate_a_y(sm83_buf_dec2_param::W_gate_in + sm83_decoder2_param::W_gate_in6),
			.L_b_in(24.01316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y35),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(409.7453 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in5 + sm83_decoder3_param::L_in45),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in5 + sm83_decoder3_param::W_gate_in45)
		) dec1_not18_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_hl_ss_m0_n),
			.a_y(ctl_op_add_hl_ss_m0),
			.b_in(ctl_op_aux_alu_m0_n),
			.b_y(ctl_op_aux_alu_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y37),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.5042 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in51),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in51),
			.L_b_in(24.07649 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y38),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.482 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in52),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in52)
		) dec1_not19_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_dec_ss_m0_n),
			.a_y(ctl_op_dec_ss_m0),
			.b_in(ctl_op_inc_ss_m0_n),
			.b_y(ctl_op_inc_ss_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45675 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y4),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(150.594 + sm83_not2_pch_dec1_param::L_a_y + sm83_buf_dec2_param::L_in),
			.W_gate_a_y(sm83_buf_dec2_param::W_gate_in),
			.L_b_in(26.16745 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y3),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(60.19141 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in26),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in26)
		) dec1_not2_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_alu_n),
			.a_y(ctl_op_alu),
			.b_in(ctl_op_ldx_a_nn_m3_n),
			.b_y(ctl_op_ldx_a_nn_m3)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13993 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y40),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.2507 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in53),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in53),
			.L_b_in(24.07658 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y39),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(783.8822 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in7 + sm83_decoder3_param::L_in49),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in7 + sm83_decoder3_param::W_gate_in49)
		) dec1_not20_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_push_qq_m0_n),
			.a_y(ctl_op_push_qq_m0),
			.b_in(ctl_op_push_qq_m1_n),
			.b_y(ctl_op_push_qq_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01321 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y41),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.5979 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in54),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in54),
			.L_b_in(24.4567 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y42),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(584.1736 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder3_param::L_in48),
			.W_gate_b_y(sm83_decoder3_param::W_gate_in48)
		) dec1_not21_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_r_r_m0_n),
			.a_y(ctl_op_ld_r_r_m0),
			.b_in(ctl_op_ld_or_halt_n),
			.b_y(ctl_op_ld_or_halt)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.2667 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y44),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(107.9644 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in55),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in55),
			.L_b_in(23.75979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y43),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(1275.108 + sm83_not2_pch_dec1_param::L_b_y + sm83_alu_decoder_param::L_in65 + sm83_decoder3_param::L_in52),
			.W_gate_b_y(sm83_alu_decoder_param::W_gate_in65 + sm83_decoder3_param::W_gate_in52)
		) dec1_not22_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_m0_n),
			.a_y(ctl_op_jp_m0),
			.b_in(ctl_op_cb_rxx_or_sxx_or_swap_n),
			.b_y(ctl_op_cb_rxx_or_sxx_or_swap)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64684 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y45),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.3445 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in56),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in56),
			.L_b_in(23.82312 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y46),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(108.9781 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in57),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in57)
		) dec1_not23_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_m1_n),
			.a_y(ctl_op_jp_m1),
			.b_in(ctl_op_jp_m2_n),
			.b_y(ctl_op_jp_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.52015 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y48),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(101.2483 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in58),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in58),
			.L_b_in(24.71022 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y47),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(156.3076 + sm83_not2_pch_dec1_param::L_b_y + sm83_buf_dec2_param::L_in + sm83_decoder2_param::L_in8),
			.W_gate_b_y(sm83_buf_dec2_param::W_gate_in + sm83_decoder2_param::W_gate_in8)
		) dec1_not24_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hl_n_m1_n),
			.a_y(ctl_op_ld_hl_n_m1),
			.b_in(ctl_op_add_hl_ss_m1_n),
			.b_y(ctl_op_add_hl_ss_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64675 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y49),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(591.2065 + sm83_not2_pch_dec1_param::L_a_y),
			.L_b_in(24.07658 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y50),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(659.9194 + sm83_not2_pch_dec1_param::L_b_y)
		) dec1_not25_inst (
			.pch_n(exec_phase),
			.a_in(dec1_y49),
			.a_y(dec1_y49_n),
			.b_in(dec1_y50),
			.b_y(dec1_y50_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39328 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y52),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.788 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in59),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in59),
			.L_b_in(24.39333 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y51),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(153.9634 + sm83_not2_pch_dec1_param::L_b_y + sm83_buf_dec2_param::L_in + sm83_decoder2_param::L_in9),
			.W_gate_b_y(sm83_buf_dec2_param::W_gate_in + sm83_decoder2_param::W_gate_in9)
		) dec1_not26_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_pop_qq_m0_n),
			.a_y(ctl_op_pop_qq_m0),
			.b_in(ctl_op_push_qq_m2_n),
			.b_y(ctl_op_push_qq_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y53),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.7247 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in60),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in60),
			.L_b_in(23.56972 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y54),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(101.5651 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in61),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in61)
		) dec1_not27_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_pop_qq_m1_n),
			.a_y(ctl_op_pop_qq_m1),
			.b_in(ctl_op_add_sp_e_m1_n),
			.b_y(ctl_op_add_sp_e_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y56),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.0911 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in63),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in63),
			.L_b_in(24.33 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y55),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(101.4383 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in62),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in62)
		) dec1_not28_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_set_b_r_m0_n),
			.a_y(ctl_op_set_b_r_m0),
			.b_in(ctl_op_ldhl_sp_e_m1_n),
			.b_y(ctl_op_ldhl_sp_e_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71022 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y57),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(106.7761 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in64),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in64),
			.L_b_in(24.45677 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y58),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(107.3308 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in65),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in65)
		) dec1_not29_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_set_b_hl_m1_n),
			.a_y(ctl_op_set_b_hl_m1),
			.b_in(ctl_op_res_or_set_b_hl_m0_n),
			.b_y(ctl_op_res_or_set_b_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.20333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y5),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(65.45065 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in27),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in27),
			.L_b_in(24.5201 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y6),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(77.36177 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in28),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in28)
		) dec1_not3_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jp_cc_nn_m1_n),
			.a_y(ctl_op_jp_cc_nn_m1),
			.b_in(ctl_op_call_cc_nn_m1_n),
			.b_y(ctl_op_call_cc_nn_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33007 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y60),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(94.78561 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in66),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in66),
			.L_b_in(24.77357 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y59),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(1735.794 + sm83_not2_pch_dec1_param::L_b_y + sm83_alu_decoder_param::L_in68 + sm83_decoder2_param::L_in10 + sm83_decoder3_param::L_in61),
			.W_gate_b_y(sm83_alu_decoder_param::W_gate_in68 + sm83_decoder2_param::W_gate_in10 + sm83_decoder3_param::W_gate_in61)
		) dec1_not30_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_m1_n),
			.a_y(ctl_op_ld_a_n_m1),
			.b_in(ctl_op_pop_qq_m2_n),
			.b_y(ctl_op_pop_qq_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.4567 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y61),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(3036.742 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in11 + sm83_decoder3_param::L_in26 + sm83_or2_tap_nor_tap_in1_n_reg_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_sp_out_param::L_in1 + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel + sm83_reg_wz_out_param::L_muxi_a_sel),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in11 + sm83_decoder3_param::W_gate_in26 + sm83_or2_tap_nor_tap_in1_n_reg_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_sp_out_param::W_gate_in1 + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel + sm83_reg_wz_out_param::W_gate_muxi_a_sel),
			.L_b_in(23.63305 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y62),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(122.2203 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in67),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in67)
		) dec1_not31_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_nn_sp_m2_n),
			.a_y(ctl_op_ld_nn_sp_m2),
			.b_in(ctl_op_ld_nn_sp_m0_n),
			.b_y(ctl_op_ld_nn_sp_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.69642 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y64),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.9782 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in68),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in68),
			.L_b_in(24.7101 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y63),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(572.7054 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in12 + sm83_decoder3_param::L_in67),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in12 + sm83_decoder3_param::W_gate_in67)
		) dec1_not32_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_sp_e_m0_n),
			.a_y(ctl_op_add_sp_e_m0),
			.b_in(ctl_op_ld_sp_hl_m0_n),
			.b_y(ctl_op_ld_sp_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.01324 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y65),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(539.9492 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in13 + sm83_decoder3_param::L_in70),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in13 + sm83_decoder3_param::W_gate_in70),
			.L_b_in(23.94979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y66),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(119.1156 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in69),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in69)
		) dec1_not33_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_add_sp_e_m3_n),
			.a_y(ctl_op_add_sp_e_m3),
			.b_in(ctl_op_ldhl_sp_e_m0_n),
			.b_y(ctl_op_ldhl_sp_e_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y68),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(112.3995 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in70),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in70),
			.L_b_in(23.6964 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y67),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(2022.321 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in14 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3 + sm83_reg_sp_out_param::L_in3),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3 + sm83_reg_sp_out_param::W_gate_in3)
		) dec1_not34_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_nn_sp_m1_n),
			.a_y(ctl_op_ld_nn_sp_m1),
			.b_in(ctl_op_ld_nn_sp_m3_n),
			.b_y(ctl_op_ld_nn_sp_m3)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.33 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y69),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(102.8956 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in71),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in71),
			.L_b_in(23.94984 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y70),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(113.2866 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in72),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in72)
		) dec1_not35_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hl_r_m0_n),
			.a_y(ctl_op_ld_hl_r_m0),
			.b_in(ctl_op_inc_or_dec_hl_m0_n),
			.b_y(ctl_op_inc_or_dec_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.82312 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y72),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(88.0062 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in74),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in74),
			.L_b_in(24.39335 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y71),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(113.7935 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in73),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in73)
		) dec1_not36_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_c_m0_n),
			.a_y(ctl_op_ld_a_c_m0),
			.b_in(ctl_op_inc_or_dec_hl_m1_n),
			.b_y(ctl_op_inc_or_dec_hl_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.64682 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y73),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(111.2591 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in75),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in75),
			.L_b_in(23.75979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y74),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(127.6691 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in76),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in76)
		) dec1_not37_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_m0_n),
			.a_y(ctl_op_ld_a_n_m0),
			.b_in(ctl_op_rst_t_m1_n),
			.b_y(ctl_op_rst_t_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63307 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y76),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.8209 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in78),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in78),
			.L_b_in(24.52012 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y75),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(125.5149 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in77),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in77)
		) dec1_not38_inst (
			.pch_n(exec_phase),
			.a_in(ctl_int_entry_m5_n),
			.a_y(ctl_int_entry_m5),
			.b_in(ctl_op_rst_t_m0_n),
			.b_y(ctl_op_rst_t_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13988 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y77),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.3141 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in79),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in79),
			.L_b_in(23.69642 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y78),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(125.4516 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in80),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in80)
		) dec1_not39_inst (
			.pch_n(exec_phase),
			.a_in(ctl_int_entry_m4_n),
			.a_y(ctl_int_entry_m4),
			.b_in(ctl_int_entry_m0_n),
			.b_y(ctl_int_entry_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.96356 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y8),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(74.58278 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in30),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in30),
			.L_b_in(24.3934 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y7),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(75.71906 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in29),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in29)
		) dec1_not4_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_cc_e_m0_n),
			.a_y(ctl_op_jr_cc_e_m0),
			.b_in(ctl_op_ret_cc_m0_n),
			.b_y(ctl_op_ret_cc_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.14001 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y80),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.4713 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in82),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in82),
			.L_b_in(24.64677 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y79),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(115.2507 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in81),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in81)
		) dec1_not40_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ret_or_reti_m0_n),
			.a_y(ctl_op_ret_or_reti_m0),
			.b_in(ctl_op_alu_a_r_n),
			.b_y(ctl_op_alu_a_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y81),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.1545 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in83),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in83),
			.L_b_in(24.2033 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y82),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(617.0791 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in15 + sm83_decoder3_param::L_in64),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in15 + sm83_decoder3_param::W_gate_in64)
		) dec1_not41_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ret_cc_m1_n),
			.a_y(ctl_op_ret_cc_m1),
			.b_in(ctl_op_jp_hl_n),
			.b_y(ctl_op_jp_hl)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.88644 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y84),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(356.7767 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in16 + sm83_decoder3_param::L_in63),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in16 + sm83_decoder3_param::W_gate_in63),
			.L_b_in(24.64684 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y83),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(119.4325 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in84),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in84)
		) dec1_not42_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_retx_m3_n),
			.a_y(ctl_op_retx_m3),
			.b_in(ctl_op_retx_m2_n),
			.b_y(ctl_op_retx_m2)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26668 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y85),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(113.4768 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in85),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in85),
			.L_b_in(23.94979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y86),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(125.8951 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in86),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in86)
		) dec1_not43_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_hli_m0_n),
			.a_y(ctl_op_ld_hli_m0),
			.b_in(ctl_op_ld_hld_m0_n),
			.b_y(ctl_op_ld_hld_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y88),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.5346 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in88),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in88),
			.L_b_in(23.94991 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y87),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(115.7575 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in87),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in87)
		) dec1_not44_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_dd_nn_m1_n),
			.a_y(ctl_op_ld_dd_nn_m1),
			.b_in(ctl_op_ld_dd_nn_m0_n),
			.b_y(ctl_op_ld_dd_nn_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.58345 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y89),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(962.1758 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in17 + sm83_decoder3_param::L_in51 + sm83_decoder3_param::L_in66),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in17 + sm83_decoder3_param::W_gate_in51 + sm83_decoder3_param::W_gate_in66),
			.L_b_in(23.94981 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y90),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(119.8126 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in89),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in89)
		) dec1_not45_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_dd_nn_m2_n),
			.a_y(ctl_op_ld_dd_nn_m2),
			.b_in(ctl_op_inc_or_dec_r_n),
			.b_y(ctl_op_inc_or_dec_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.07658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y92),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.8514 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in91),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in91),
			.L_b_in(24.26665 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y91),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(112.2095 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in90),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in90)
		) dec1_not46_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_alu_a_n_m0_n),
			.a_y(ctl_op_alu_a_n_m0),
			.b_in(ctl_op_alu_a_hl_m0_n),
			.b_y(ctl_op_alu_a_hl_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.45668 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y93),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(1867.543 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in18 + sm83_decoder3_param::L_in90 + sm83_reg_pc_out_bit345_param::L_in19 + sm83_reg_pc_out_bit345_param::L_in19 + sm83_reg_pc_out_bit345_param::L_in19),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in18 + sm83_decoder3_param::W_gate_in90 + sm83_reg_pc_out_bit345_param::W_gate_in19 + sm83_reg_pc_out_bit345_param::W_gate_in19 + sm83_reg_pc_out_bit345_param::W_gate_in19),
			.L_b_in(23.633 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y94),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(2068.43 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in19 + sm83_decoder3_param::L_in87 + sm83_irq_prio_bit0_param::L_and_in1 + sm83_irq_prio_bit1_param::L_and_in1 + sm83_irq_prio_bit2_param::L_and_in1 + sm83_irq_prio_bit3_param::L_and_in1 + sm83_irq_prio_bit4_param::L_and_in1 + sm83_irq_prio_bit5_param::L_and_in1 + sm83_irq_prio_bit6_param::L_and_in1 + sm83_irq_prio_bit7_param::L_and_in1 + sm83_aoi21_a_param::L_in2 + sm83_nor2_a_param::L_in1),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in19 + sm83_decoder3_param::W_gate_in87 + sm83_irq_prio_bit0_param::W_gate_and_in1 + sm83_irq_prio_bit1_param::W_gate_and_in1 + sm83_irq_prio_bit2_param::W_gate_and_in1 + sm83_irq_prio_bit3_param::W_gate_and_in1 + sm83_irq_prio_bit4_param::W_gate_and_in1 + sm83_irq_prio_bit5_param::W_gate_and_in1 + sm83_irq_prio_bit6_param::W_gate_and_in1 + sm83_irq_prio_bit7_param::W_gate_and_in1 + sm83_aoi21_a_param::W_gate_in2 + sm83_nor2_a_param::W_gate_in1)
		) dec1_not47_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_rst_t_m2_n),
			.a_y(ctl_op_rst_t_m2),
			.b_in(ctl_int_entry_m6_n),
			.b_y(ctl_int_entry_m6)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.63312 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y96),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(101.8819 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in93),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in93),
			.L_b_in(24.01319 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y95),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.4187 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in92),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in92)
		) dec1_not48_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_cb_hl_m0_n),
			.a_y(ctl_op_cb_hl_m0),
			.b_in(ctl_op_cb_r_n),
			.b_y(ctl_op_cb_r)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.77349 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y97),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(108.4713 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in94),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in94),
			.L_b_in(24.20335 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y98),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(112.4629 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in95),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in95)
		) dec1_not49_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_bit_b_hl_m1_n),
			.a_y(ctl_op_bit_b_hl_m1),
			.b_in(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1_n),
			.b_y(ctl_op_cb_rxx_or_sxx_or_swap_or_res_m1)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71019 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y9),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(993.0952 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder3_param::L_in37),
			.W_gate_a_y(sm83_decoder3_param::W_gate_in37),
			.L_b_in(24.07656 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y10),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.6721 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in31),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in31)
		) dec1_not5_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_a_n_n),
			.a_y(ctl_op_ld_a_n),
			.b_in(ctl_op_call_m0_n),
			.b_y(ctl_op_call_m0)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13996 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y100),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(891.7831 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in20 + sm83_ao33_s3_tap_in1_n_param::L_in2 + sm83_aoi331_s3_param::L_in2 + sm83_nand2_b_param::L_in2),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in20 + sm83_ao33_s3_tap_in1_n_param::W_gate_in2 + sm83_aoi331_s3_param::W_gate_in2 + sm83_nand2_b_param::W_gate_in2),
			.L_b_in(24.83691 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y99),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(160.5532 + sm83_not2_pch_dec1_param::L_b_y + sm83_buf_dec2_param::L_in),
			.W_gate_b_y(sm83_buf_dec2_param::W_gate_in)
		) dec1_not50_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_di_or_ei_n),
			.a_y(ctl_op_di_or_ei),
			.b_in(ctl_op_inc_or_dec_m_n),
			.b_y(ctl_op_inc_or_dec_m)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.13986 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y101),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(688.7168 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in21 + sm83_dff_cc_q_param::L_d),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in21 + sm83_dff_cc_q_param::W_gate_d),
			.L_b_in(24.01316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y102),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(582.8429 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in22 + sm83_and2_param::L_in1),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in22 + sm83_and2_param::W_gate_in1)
		) dec1_not51_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_halt_n),
			.a_y(ctl_op_halt),
			.b_in(ctl_op_nop_or_stop_n),
			.b_y(ctl_op_nop_or_stop)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(23.75977 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y104),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(844.9982 + sm83_not2_pch_dec1_param::L_a_y + sm83_buf_dec2_param::L_in + sm83_decoder2_param::L_in2),
			.W_gate_a_y(sm83_buf_dec2_param::W_gate_in + sm83_decoder2_param::W_gate_in2),
			.L_b_in(25.15368 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y103),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(L_prefix_cb),
			.W_gate_b_y(W_gate_prefix_cb + sm83_decoder2_param::W_gate_in23 + sm83_ao31_in3_n_param::W_gate_in3_n + sm83_dffre_cc_q_param::W_gate_d)
		) dec1_not52_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_jr_m2_n),
			.a_y(ctl_op_jr_m2),
			.b_in(ctl_op_cb_prefix_n),
			.b_y(ctl_op_cb_prefix)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.71021 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y105),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(106.5705 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in96),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in96),
			.L_b_in(23.94986 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y106),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(117.6584 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in97),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in97)
		) dec1_not53_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ldx_m0_n),
			.a_y(ctl_op_ldx_m0),
			.b_in(ctl_op_ldx_m1_n),
			.b_y(ctl_op_ldx_m1)
		);

	sm83_not_pch_dec1 #(
			.L_in(24.77352 + sm83_not_pch_dec1_param::L_in + sm83_decoder1_param::L_y107),
			.W_gate_in(sm83_not_pch_dec1_param::W_gate_in),
			.L_y(120.8264 + sm83_not_pch_dec1_param::L_y)
		) dec1_not54_inst (
			.pch_n(exec_phase),
			.in(dec1_y107),
			.y(dec1_y107_n)
		);

	sm83_not_dec1 #(
			.L_y(733.8287 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in26),
			.W_gate_y(sm83_decoder1_param::W_gate_in26)
		) dec1_not55_inst (
			.in(in_intr),
			.y(in_intr_buf_n)
		);

	sm83_not_dec1 #(
			.L_y(775.2661 + sm83_not_dec1_param::L_y + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in25),
			.W_gate_y(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in25)
		) dec1_not56_inst (
			.in(in_intr_n),
			.y(in_intr)
		);

	sm83_not_dec1 #(
			.L_y(733.8287 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in22),
			.W_gate_y(sm83_decoder1_param::W_gate_in22)
		) dec1_not57_inst (
			.in(opcode[7]),
			.y(opcode_n_buf1[7])
		);

	sm83_not_dec1 #(
			.L_y(735.9197 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in20),
			.W_gate_y(sm83_decoder1_param::W_gate_in20)
		) dec1_not58_inst (
			.in(opcode[6]),
			.y(opcode_n_buf1[6])
		);

	sm83_not_dec1 #(
			.L_y(733.7653 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in18),
			.W_gate_y(sm83_decoder1_param::W_gate_in18)
		) dec1_not59_inst (
			.in(opcode[5]),
			.y(opcode_n_buf1[5])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y12),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.1874 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in33),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in33),
			.L_b_in(24.83689 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y11),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.2286 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in32),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in32)
		) dec1_not6_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_call_m2_n),
			.a_y(ctl_op_call_m2),
			.b_in(ctl_op_call_m1_n),
			.b_y(ctl_op_call_m1)
		);

	sm83_not_dec1 #(
			.L_y(736.1731 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in16),
			.W_gate_y(sm83_decoder1_param::W_gate_in16)
		) dec1_not60_inst (
			.in(opcode[4]),
			.y(opcode_n_buf1[4])
		);

	sm83_not_dec1 #(
			.L_y(733.7656 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in14),
			.W_gate_y(sm83_decoder1_param::W_gate_in14)
		) dec1_not61_inst (
			.in(opcode[3]),
			.y(opcode_n_buf1[3])
		);

	sm83_not_dec1 #(
			.L_y(736.0464 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in12),
			.W_gate_y(sm83_decoder1_param::W_gate_in12)
		) dec1_not62_inst (
			.in(opcode[2]),
			.y(opcode_n_buf1[2])
		);

	sm83_not_dec1 #(
			.L_y(733.5754 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in10),
			.W_gate_y(sm83_decoder1_param::W_gate_in10)
		) dec1_not63_inst (
			.in(opcode[1]),
			.y(opcode_n_buf1[1])
		);

	sm83_not_dec1 #(
			.L_y(736.1732 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in8),
			.W_gate_y(sm83_decoder1_param::W_gate_in8)
		) dec1_not64_inst (
			.in(opcode[0]),
			.y(opcode_n_buf1[0])
		);

	sm83_not_dec1 #(
			.L_y(1682.992 + sm83_not_dec1_param::L_y + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in23 + sm83_decoder3_param::L_in53),
			.W_gate_y(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in23 + sm83_decoder3_param::W_gate_in53)
		) dec1_not65_inst (
			.in(table_cb_n),
			.y(table_cb)
		);

	sm83_not_dec1 #(
			.L_y(807.4094 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in24),
			.W_gate_y(sm83_decoder1_param::W_gate_in24)
		) dec1_not66_inst (
			.in(table_cb),
			.y(table_cb_buf_n)
		);

	sm83_not_dec1 #(
			.L_y(783.7559 + sm83_not_dec1_param::L_y + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in6),
			.W_gate_y(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in6)
		) dec1_not67_inst (
			.in(mcyc[2]),
			.y(mcyc_n[2])
		);

	sm83_not_dec1 #(
			.L_y(898.4247 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in5 + sm83_not_f_param::L_in),
			.W_gate_y(sm83_decoder1_param::W_gate_in5 + sm83_not_f_param::W_gate_in)
		) dec1_not68_inst (
			.in(mcyc_n[2]),
			.y(mcyc_buf[2])
		);

	sm83_not_dec1 #(
			.L_y(790.6622 + sm83_not_dec1_param::L_y + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in4),
			.W_gate_y(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in4)
		) dec1_not69_inst (
			.in(mcyc[1]),
			.y(mcyc_n[1])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.83689 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y13),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(115.8209 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in34),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in34),
			.L_b_in(23.82316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y14),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(122.7271 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in35),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in35)
		) dec1_not7_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_call_m3_n),
			.a_y(ctl_op_call_m3),
			.b_in(ctl_op_call_m4_n),
			.b_y(ctl_op_call_m4)
		);

	sm83_not_dec1 #(
			.L_y(760.7565 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in3),
			.W_gate_y(sm83_decoder1_param::W_gate_in3)
		) dec1_not70_inst (
			.in(mcyc_n[1]),
			.y(mcyc_buf[1])
		);

	sm83_not_dec1 #(
			.L_y(797.5051 + sm83_not_dec1_param::L_y + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in2),
			.W_gate_y(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in2)
		) dec1_not71_inst (
			.in(mcyc[0]),
			.y(mcyc_n[0])
		);

	sm83_not_dec1 #(
			.L_y(767.8528 + sm83_not_dec1_param::L_y + sm83_decoder1_param::L_in1),
			.W_gate_y(sm83_decoder1_param::W_gate_in1)
		) dec1_not72_inst (
			.in(mcyc_n[0]),
			.y(mcyc_buf[0])
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.39335 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y16),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(110.7522 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in36),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in36),
			.L_b_in(24.71017 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y15),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(910.1583 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder3_param::L_in38),
			.W_gate_b_y(sm83_decoder3_param::W_gate_in38)
		) dec1_not8_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_x_n_m0_n),
			.a_y(ctl_op_ld_x_n_m0),
			.b_in(ctl_op_ld_x_n_n),
			.b_y(ctl_op_ld_x_n)
		);

	sm83_not2_pch_dec1 #(
			.L_a_in(24.26658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y17),
			.W_gate_a_in(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_a_y(110.1186 + sm83_not2_pch_dec1_param::L_a_y + sm83_decoder2_param::L_in37),
			.W_gate_a_y(sm83_decoder2_param::W_gate_in37),
			.L_b_in(24.26668 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y18),
			.W_gate_b_in(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_b_y(118.482 + sm83_not2_pch_dec1_param::L_b_y + sm83_decoder2_param::L_in38),
			.W_gate_b_y(sm83_decoder2_param::W_gate_in38)
		) dec1_not9_inst (
			.pch_n(exec_phase),
			.a_in(ctl_op_ld_r_n_m2_n),
			.a_y(ctl_op_ld_r_n_m2),
			.b_in(ctl_op_m6_n),
			.b_y(ctl_op_m6)
		);

	sm83_buf_dec2 #(
			.L_y(2194.763 + sm83_buf_dec2_param::L_y + sm83_decoder3_param::L_in86 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1 + sm83_reg_wz_out_param::L_oai_ena1),
			.W_gate_y(sm83_decoder3_param::W_gate_in86 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1 + sm83_reg_wz_out_param::W_gate_oai_ena1)
		) dec2_buf1_inst (
			.in(ctl_op_jr_m2),
			.y(ctl_op_jr_m2_buf)
		);

	sm83_buf_dec2 #(
			.L_y(2840.086 + sm83_buf_dec2_param::L_y + sm83_alu_decoder_param::L_in62 + sm83_decoder3_param::L_in19 + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena + sm83_reg_a_out_param::L_a_ena),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in62 + sm83_decoder3_param::W_gate_in19 + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena + sm83_reg_a_out_param::W_gate_a_ena)
		) dec2_buf2_inst (
			.in(ctl_op_alu),
			.y(ctl_op_alu_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3240.817 + sm83_buf_dec2_param::L_y + sm83_decoder3_param::L_in25 + sm83_idu_ctl_param::L_in3 + sm83_or2_tap_nor_tap_in1_n_reg_param::L_in2 + sm83_reg_pc_out_bit012_param::L_in7 + sm83_reg_pc_out_bit012_param::L_in7 + sm83_reg_pc_out_bit012_param::L_in7 + sm83_reg_pc_out_bit345_param::L_in7 + sm83_reg_pc_out_bit345_param::L_in7 + sm83_reg_pc_out_bit345_param::L_in7 + sm83_reg_pc_out_bit67_param::L_in7 + sm83_reg_pc_out_bit67_param::L_in7),
			.W_gate_y(sm83_decoder3_param::W_gate_in25 + sm83_idu_ctl_param::W_gate_in3 + sm83_or2_tap_nor_tap_in1_n_reg_param::W_gate_in2 + sm83_reg_pc_out_bit012_param::W_gate_in7 + sm83_reg_pc_out_bit012_param::W_gate_in7 + sm83_reg_pc_out_bit012_param::W_gate_in7 + sm83_reg_pc_out_bit345_param::W_gate_in7 + sm83_reg_pc_out_bit345_param::W_gate_in7 + sm83_reg_pc_out_bit345_param::W_gate_in7 + sm83_reg_pc_out_bit67_param::W_gate_in7 + sm83_reg_pc_out_bit67_param::W_gate_in7)
		) dec2_buf3_inst (
			.in(ctl_op_jr_m1),
			.y(ctl_op_jr_m1_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1319.713 + sm83_buf_dec2_param::L_y + sm83_alu_decoder_param::L_in34 + sm83_decoder3_param::L_in47),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in34 + sm83_decoder3_param::W_gate_in47)
		) dec2_buf4_inst (
			.in(ctl_op_bit),
			.y(ctl_op_bit_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3914.644 + sm83_buf_dec2_param::L_y + sm83_alu_decoder_param::L_in63 + sm83_decoder3_param::L_in29 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_hl_out_param::L_l_ena3 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9 + sm83_reg_sp_out_param::L_in9),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in63 + sm83_decoder3_param::W_gate_in29 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_hl_out_param::W_gate_l_ena3 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9 + sm83_reg_sp_out_param::W_gate_in9)
		) dec2_buf5_inst (
			.in(ctl_op_add_hl_ss_m0),
			.y(ctl_op_add_hl_ss_m0_buf)
		);

	sm83_buf_dec2 #(
			.L_y(3451.25 + sm83_buf_dec2_param::L_y + sm83_alu_decoder_param::L_in54 + sm83_decoder3_param::L_in23 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_hl_out_param::L_h_ena3 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12 + sm83_reg_sp_out_param::L_in12),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in54 + sm83_decoder3_param::W_gate_in23 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_hl_out_param::W_gate_h_ena3 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in12)
		) dec2_buf6_inst (
			.in(ctl_op_add_hl_ss_m1),
			.y(ctl_op_add_hl_ss_m1_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1653.807 + sm83_buf_dec2_param::L_y + sm83_decoder3_param::L_in7 + sm83_and2_and3_reg_param::L_b_in2),
			.W_gate_y(sm83_decoder3_param::W_gate_in7 + sm83_and2_and3_reg_param::W_gate_b_in2)
		) dec2_buf7_inst (
			.in(ctl_op_push_qq_m2),
			.y(ctl_op_push_qq_m2_buf)
		);

	sm83_buf_dec2 #(
			.L_y(1441.553 + sm83_buf_dec2_param::L_y + sm83_alu_decoder_param::L_in39 + sm83_decoder3_param::L_in68),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in39 + sm83_decoder3_param::W_gate_in68)
		) dec2_buf8_inst (
			.in(ctl_op_inc_or_dec_m),
			.y(ctl_op_inc_or_dec_m_buf)
		);

	sm83_not_x1_dec2 #(
			.L_y(449.6616 + sm83_not_x1_dec2_param::L_y + sm83_alu_decoder_param::L_in41),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in41)
		) dec2_not1_inst (
			.in(ctl_op_any_cc_n),
			.y(ctl_op_any_cc)
		);

	sm83_not_x1_dec2 #(
			.L_y(724.4951 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in59),
			.W_gate_y(sm83_decoder3_param::W_gate_in59)
		) dec2_not10_inst (
			.in(ctl_op_ld_xxx_a_or_ld_a_xxx_m0_n),
			.y(ctl_op_ld_xxx_a_or_ld_a_xxx_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(422.2905 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in40),
			.W_gate_y(sm83_decoder3_param::W_gate_in40)
		) dec2_not11_inst (
			.in(ctl_op_ld_n_a_or_ld_c_a_exec_n),
			.y(ctl_op_ld_n_a_or_ld_c_a_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(790.9789 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in46),
			.W_gate_y(sm83_decoder3_param::W_gate_in46)
		) dec2_not12_inst (
			.in(ctl_op_inc_or_dec_ss_m0_n),
			.y(ctl_op_inc_or_dec_ss_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(3157.203 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in24 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_de_out_param::L_d_zero2 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3 + sm83_reg_wz_out_param::L_oai_ena3),
			.W_gate_y(sm83_decoder3_param::W_gate_in24 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_de_out_param::W_gate_d_zero2 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3 + sm83_reg_wz_out_param::W_gate_oai_ena3)
		) dec2_not13_inst (
			.in(ctl_op_ld_n_a_or_ld_a_n_m1_n),
			.y(ctl_op_ld_n_a_or_ld_a_n_m1)
		);

	sm83_not_x1_dec2 #(
			.L_y(1146.868 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in50 + sm83_and2_in1_n_tap_in1_param::L_in2 + sm83_oa21_param::L_in2),
			.W_gate_y(sm83_decoder3_param::W_gate_in50 + sm83_and2_in1_n_tap_in1_param::W_gate_in2 + sm83_oa21_param::W_gate_in2)
		) dec2_not14_inst (
			.in(ctl_mread_n),
			.y(ctl_mread)
		);

	sm83_not_x1_dec2 #(
			.L_y(737.7572 + sm83_not_x1_dec2_param::L_y + sm83_nand2_in1_n_c_param::L_in1_n),
			.W_gate_y(sm83_nand2_in1_n_c_param::W_gate_in1_n)
		) dec2_not15_inst (
			.in(next_mcyc_n[0]),
			.y(next_mcyc[0])
		);

	sm83_not_x1_dec2 #(
			.L_y(261.9276 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in54),
			.W_gate_y(sm83_decoder3_param::W_gate_in54)
		) dec2_not16_inst (
			.in(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec_n),
			.y(ctl_op_any_ind_hl_or_ld_sp_hl_or_jp_hl_exec)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(2449.284 + sm83_not_x1_p2_dec2_param::L_y + sm83_decoder3_param::L_in32 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5 + sm83_reg_sp_out_param::L_in5),
			.W_gate_y(sm83_decoder3_param::W_gate_in32 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5 + sm83_reg_sp_out_param::W_gate_in5)
		) dec2_not17_inst (
			.in(ctl_op_add_sp_e_or_ldhl_sp_e_m1_n),
			.y(ctl_op_add_sp_e_or_ldhl_sp_e_m1)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1463.207 + sm83_not_x1_p2_dec2_param::L_y + sm83_alu_decoder_param::L_in49 + sm83_decoder3_param::L_in55),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in49 + sm83_decoder3_param::W_gate_in55)
		) dec2_not18_inst (
			.in(ctl_op_set_exec_n),
			.y(ctl_op_set_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(1871.129 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in34 + sm83_reg_pc_out_bit012_param::L_in5 + sm83_reg_pc_out_bit012_param::L_in5 + sm83_reg_pc_out_bit012_param::L_in5 + sm83_reg_pc_out_bit345_param::L_in5 + sm83_reg_pc_out_bit345_param::L_in5 + sm83_reg_pc_out_bit345_param::L_in5 + sm83_reg_pc_out_bit67_param::L_in5 + sm83_reg_pc_out_bit67_param::L_in5),
			.W_gate_y(sm83_decoder3_param::W_gate_in34 + sm83_reg_pc_out_bit012_param::W_gate_in5 + sm83_reg_pc_out_bit012_param::W_gate_in5 + sm83_reg_pc_out_bit012_param::W_gate_in5 + sm83_reg_pc_out_bit345_param::W_gate_in5 + sm83_reg_pc_out_bit345_param::W_gate_in5 + sm83_reg_pc_out_bit345_param::W_gate_in5 + sm83_reg_pc_out_bit67_param::W_gate_in5 + sm83_reg_pc_out_bit67_param::W_gate_in5)
		) dec2_not19_inst (
			.in(ctl_reg_pc_to_idu_en_n),
			.y(ctl_reg_pc_to_idu_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(1286.548 + sm83_not_x1_dec2_param::L_y + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2 + sm83_reg_wz_out_param::L_oai_ena2),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2 + sm83_reg_wz_out_param::W_gate_oai_ena2)
		) dec2_not2_inst (
			.in(ctl_op_ld_nn_sp_or_ldx_exec_n),
			.y(ctl_op_ld_nn_sp_or_ldx_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(L_m1),
			.W_gate_y(W_gate_m1 + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_not_reg_we_param::W_gate_in + sm83_oa21_param::W_gate_in1 + sm83_ao31_in3_n_param::W_gate_in2 + sm83_dffre_cc_q_param::W_gate_clk_n + sm83_not_d_param::W_gate_in)
		) dec2_not20_inst (
			.in(ctl_fetch_n),
			.y(ctl_fetch)
		);

	sm83_not_x1_pch_dec2 #(
			.L_in(117.9752 + sm83_not_x1_pch_dec2_param::L_in + sm83_decoder2_param::L_y20),
			.W_gate_in(sm83_not_x1_pch_dec2_param::W_gate_in),
			.L_y(628.6649 + sm83_not_x1_pch_dec2_param::L_y + sm83_decoder2_param::L_in1),
			.W_gate_y(sm83_decoder2_param::W_gate_in1)
		) dec2_not21_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ld_nn_sp_exec_n),
			.y(ctl_op_ld_nn_sp_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(1763.355 + sm83_not_x1_dec2_param::L_y + sm83_reg_pc_out_bit012_param::L_in3 + sm83_reg_pc_out_bit012_param::L_in3 + sm83_reg_pc_out_bit012_param::L_in3 + sm83_reg_pc_out_bit345_param::L_in3 + sm83_reg_pc_out_bit345_param::L_in3 + sm83_reg_pc_out_bit345_param::L_in3 + sm83_reg_pc_out_bit67_param::L_in3 + sm83_reg_pc_out_bit67_param::L_in3),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in3 + sm83_reg_pc_out_bit012_param::W_gate_in3 + sm83_reg_pc_out_bit012_param::W_gate_in3 + sm83_reg_pc_out_bit345_param::W_gate_in3 + sm83_reg_pc_out_bit345_param::W_gate_in3 + sm83_reg_pc_out_bit345_param::W_gate_in3 + sm83_reg_pc_out_bit67_param::W_gate_in3 + sm83_reg_pc_out_bit67_param::W_gate_in3)
		) dec2_not22_inst (
			.in(ctl_reg_pch_to_db_en_n),
			.y(ctl_reg_pch_to_db_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(2388.254 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in31 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1 + sm83_reg_de_out_param::L_d_zero1),
			.W_gate_y(sm83_decoder3_param::W_gate_in31 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1 + sm83_reg_de_out_param::W_gate_d_zero1)
		) dec2_not23_inst (
			.in(ctl_op_ld_c_a_or_ld_a_c_m0_n),
			.y(ctl_op_ld_c_a_or_ld_a_c_m0)
		);

	sm83_not_x1_dec2 #(
			.L_y(399.1641 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in69),
			.W_gate_y(sm83_decoder3_param::W_gate_in69)
		) dec2_not24_inst (
			.in(ctl_push_or_pop_exec_n),
			.y(ctl_push_or_pop_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(821.8345 + sm83_not_x1_dec2_param::L_y + sm83_idu_ctl_param::L_in5),
			.W_gate_y(sm83_idu_ctl_param::W_gate_in5)
		) dec2_not25_inst (
			.in(ctl_idu_inc_n),
			.y(ctl_idu_inc)
		);

	sm83_not_x1_dec2 #(
			.L_y(410.4431 + sm83_not_x1_dec2_param::L_y + sm83_nand2_in1_n_a_param::L_in1_n),
			.W_gate_y(sm83_nand2_in1_n_a_param::W_gate_in1_n)
		) dec2_not26_inst (
			.in(next_mcyc_n[2]),
			.y(next_mcyc[2])
		);

	sm83_not_x1_dec2 #(
			.L_y(385.5424 + sm83_not_x1_dec2_param::L_y + sm83_nand2_in1_n_b_param::L_in1_n),
			.W_gate_y(sm83_nand2_in1_n_b_param::W_gate_in1_n)
		) dec2_not27_inst (
			.in(next_mcyc_n[1]),
			.y(next_mcyc[1])
		);

	sm83_not_x1_dec2 #(
			.L_y(1697.145 + sm83_not_x1_dec2_param::L_y + sm83_reg_pc_out_bit012_param::L_in1 + sm83_reg_pc_out_bit012_param::L_in1 + sm83_reg_pc_out_bit012_param::L_in1 + sm83_reg_pc_out_bit345_param::L_in1 + sm83_reg_pc_out_bit345_param::L_in1 + sm83_reg_pc_out_bit345_param::L_in1 + sm83_reg_pc_out_bit67_param::L_in1 + sm83_reg_pc_out_bit67_param::L_in1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in1 + sm83_reg_pc_out_bit012_param::W_gate_in1 + sm83_reg_pc_out_bit012_param::W_gate_in1 + sm83_reg_pc_out_bit345_param::W_gate_in1 + sm83_reg_pc_out_bit345_param::W_gate_in1 + sm83_reg_pc_out_bit345_param::W_gate_in1 + sm83_reg_pc_out_bit67_param::W_gate_in1 + sm83_reg_pc_out_bit67_param::W_gate_in1)
		) dec2_not28_inst (
			.in(ctl_reg_pcl_to_db_en_n),
			.y(ctl_reg_pcl_to_db_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(805.9323 + sm83_not_x1_dec2_param::L_y + sm83_idu_ctl_param::L_in1),
			.W_gate_y(sm83_idu_ctl_param::W_gate_in1)
		) dec2_not29_inst (
			.in(ctl_idu_dec_n),
			.y(ctl_idu_dec)
		);

	sm83_not_x1_dec2 #(
			.L_y(516.9491 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in39),
			.W_gate_y(sm83_decoder3_param::W_gate_in39)
		) dec2_not3_inst (
			.in(ctl_op_ldx_nn_a_or_ld_xxx_a_exec_n),
			.y(ctl_op_ldx_nn_a_or_ld_xxx_a_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(2425.271 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in36 + sm83_reg_pc_out_bit012_param::L_in11 + sm83_reg_pc_out_bit012_param::L_in15 + sm83_reg_pc_out_bit012_param::L_in11 + sm83_reg_pc_out_bit012_param::L_in15 + sm83_reg_pc_out_bit012_param::L_in11 + sm83_reg_pc_out_bit012_param::L_in15 + sm83_reg_pc_out_bit345_param::L_in11 + sm83_reg_pc_out_bit345_param::L_in15 + sm83_reg_pc_out_bit345_param::L_in11 + sm83_reg_pc_out_bit345_param::L_in15 + sm83_reg_pc_out_bit345_param::L_in11 + sm83_reg_pc_out_bit345_param::L_in15 + sm83_reg_pc_out_bit67_param::L_in11 + sm83_reg_pc_out_bit67_param::L_in15 + sm83_reg_pc_out_bit67_param::L_in11 + sm83_reg_pc_out_bit67_param::L_in15),
			.W_gate_y(sm83_decoder3_param::W_gate_in36 + sm83_reg_pc_out_bit012_param::W_gate_in11 + sm83_reg_pc_out_bit012_param::W_gate_in15 + sm83_reg_pc_out_bit012_param::W_gate_in11 + sm83_reg_pc_out_bit012_param::W_gate_in15 + sm83_reg_pc_out_bit012_param::W_gate_in11 + sm83_reg_pc_out_bit012_param::W_gate_in15 + sm83_reg_pc_out_bit345_param::W_gate_in11 + sm83_reg_pc_out_bit345_param::W_gate_in15 + sm83_reg_pc_out_bit345_param::W_gate_in11 + sm83_reg_pc_out_bit345_param::W_gate_in15 + sm83_reg_pc_out_bit345_param::W_gate_in11 + sm83_reg_pc_out_bit345_param::W_gate_in15 + sm83_reg_pc_out_bit67_param::W_gate_in11 + sm83_reg_pc_out_bit67_param::W_gate_in15 + sm83_reg_pc_out_bit67_param::W_gate_in11 + sm83_reg_pc_out_bit67_param::W_gate_in15)
		) dec2_not30_inst (
			.in(ctl_reg_wz_to_reg_pc_en_n),
			.y(ctl_reg_wz_to_reg_pc_en)
		);

	sm83_not_x1_dec2 #(
			.L_y(1099.159 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in60 + sm83_decoder3_param::L_in71),
			.W_gate_y(sm83_decoder3_param::W_gate_in60 + sm83_decoder3_param::W_gate_in71)
		) dec2_not31_inst (
			.in(ctl_reg_gp_we_mask_n),
			.y(ctl_reg_gp_we_mask)
		);

	sm83_not_x1_dec2 #(
			.L_y(866.6298 + sm83_not_x1_dec2_param::L_y + sm83_decoder3_param::L_in42),
			.W_gate_y(sm83_decoder3_param::W_gate_in42)
		) dec2_not4_inst (
			.in(ctl_op_ldx_a_nn_or_ld_a_xxx_exec_n),
			.y(ctl_op_ldx_a_nn_or_ld_a_xxx_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(L_wr),
			.W_gate_y(W_gate_wr + sm83_decoder3_param::W_gate_in56 + sm83_and2_irq_param::W_gate_in2)
		) dec2_not5_inst (
			.in(ctl_mwrite_n),
			.y(ctl_mwrite)
		);

	sm83_not_x2_dec2 #(
			.L_y(312.1717 + sm83_not_x2_dec2_param::L_y)
		) dec2_not6_inst (
			.in(opcode[7]),
			.y(spare_opcode7_n)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(3106.067 + sm83_not_x1_p2_dec2_param::L_y + sm83_alu_decoder_param::L_in52 + sm83_decoder3_param::L_in6 + sm83_and2_and3_reg_param::L_a_in2 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7 + sm83_reg_sp_out_param::L_in7),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in52 + sm83_decoder3_param::W_gate_in6 + sm83_and2_and3_reg_param::W_gate_a_in2 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7 + sm83_reg_sp_out_param::W_gate_in7)
		) dec2_not7_inst (
			.in(ctl_op_add_sp_e_or_ldhl_sp_e_m2_n),
			.y(ctl_op_add_sp_e_or_ldhl_sp_e_m2)
		);

	sm83_not_x1_p2_dec2 #(
			.L_y(1466.136 + sm83_not_x1_p2_dec2_param::L_y + sm83_alu_decoder_param::L_in51 + sm83_decoder3_param::L_in43),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in51 + sm83_decoder3_param::W_gate_in43)
		) dec2_not8_inst (
			.in(ctl_op_res_exec_n),
			.y(ctl_op_res_exec)
		);

	sm83_not_x1_dec2 #(
			.L_y(803.7144 + sm83_not_x1_dec2_param::L_y + sm83_oa211_in1_n_in3_n_param::L_in4),
			.W_gate_y(sm83_oa211_in1_n_in3_n_param::W_gate_in4)
		) dec2_not9_inst (
			.in(ctl_mreq_n),
			.y(ctl_mreq)
		);

	sm83_pch_dec2_a #(
			.L_y(128.7463 + sm83_pch_dec2_a_param::L_y + sm83_decoder2_param::L_y6 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y(sm83_not_x1_p2_dec2_param::W_gate_in)
		) dec2_pch1_inst (
			.pch_n(exec_phase),
			.y(ctl_op_res_exec_n)
		);

	sm83_pch_dec2_c #(
			.L_y(87.11906 + sm83_pch_dec2_c_param::L_y + sm83_decoder2_param::L_y10 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y(sm83_not_x1_dec2_param::W_gate_in)
		) dec2_pch2_inst (
			.pch_n(exec_phase),
			.y(ctl_op_ld_n_a_or_ld_c_a_exec_n)
		);

	sm83_pch_dec2_c #(
			.L_y(73.30678 + sm83_pch_dec2_c_param::L_y + sm83_decoder2_param::L_y11 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y(sm83_not_x1_dec2_param::W_gate_in)
		) dec2_pch3_inst (
			.pch_n(exec_phase),
			.y(ctl_op_inc_or_dec_ss_m0_n)
		);

	sm83_pch_dec2_b #(
			.L_y(135.9692 + sm83_pch_dec2_b_param::L_y + sm83_decoder2_param::L_y17 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y(sm83_not_x1_p2_dec2_param::W_gate_in)
		) dec2_pch4_inst (
			.pch_n(exec_phase),
			.y(ctl_op_set_exec_n)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(72.16634 + sm83_nor2_pch_in1_dec3_param::L_in1 + sm83_decoder3_param::L_y56),
			.W_gate_in1(sm83_nor2_pch_in1_dec3_param::W_gate_in1),
			.L_y(1356.144 + sm83_nor2_pch_in1_dec3_param::L_y + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3 + sm83_reg_wz_out_param::L_aoi_ena3),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3 + sm83_reg_wz_out_param::W_gate_aoi_ena3)
		) dec3_nor1_inst (
			.pch_n(exec_phase),
			.in1(dec3_y56),
			.in2(write_phase_n),
			.y(ctl_idu_to_reg_gp_en)
		);

	sm83_nor2_pch_in1_dec3 #(
			.L_in1(183.4254 + sm83_nor2_pch_in1_dec3_param::L_in1 + sm83_decoder3_param::L_y58),
			.W_gate_in1(sm83_nor2_pch_in1_dec3_param::W_gate_in1),
			.L_y(1387.824 + sm83_nor2_pch_in1_dec3_param::L_y + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1 + sm83_reg_wz_out_param::L_aoi_ena1),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1 + sm83_reg_wz_out_param::W_gate_aoi_ena1)
		) dec3_nor2_inst (
			.pch_n(exec_phase),
			.in1(dec3_y58),
			.in2(data_phase_buf_n),
			.y(ctl_alu_to_reg_gp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.93494 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y1),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1022.494 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in26 + sm83_alu_shifter_param::L_l),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in26 + sm83_alu_shifter_param::W_gate_l)
		) dec3_not1_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rlx_or_slx_n),
			.y(ctl_op_rlx_or_slx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.20518 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y10),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(568.7138 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_sra),
			.W_gate_y(sm83_alu_shifter_param::W_gate_sra)
		) dec3_not10_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sra_n),
			.y(ctl_op_sra)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.2998 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y11),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(836.1541 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in38 + sm83_decoder3_param::L_in2),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in38 + sm83_decoder3_param::W_gate_in2)
		) dec3_not11_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_or_adc_or_ldhl_exec_n),
			.y(ctl_op_add_or_adc_or_ldhl_exec)
		);

	sm83_not_pch_dec3_a #(
			.L_in(119.4324 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y12),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(641.3873 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in50 + sm83_decoder3_param::L_in3),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in50 + sm83_decoder3_param::W_gate_in3)
		) dec3_not12_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sub_or_sbc_or_cp_n),
			.y(ctl_op_sub_or_sbc_or_cp)
		);

	sm83_not_pch_dec3_a #(
			.L_in(114.8705 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y13),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(739.8479 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in56),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in56)
		) dec3_not13_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_inv_cin_n),
			.y(ctl_alu_inv_cin)
		);

	sm83_not_pch_dec3_a #(
			.L_in(198.9485 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y14),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(529.8747 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in4),
			.W_gate_y(sm83_decoder3_param::W_gate_in4)
		) dec3_not14_inst (
			.pch_n(exec_phase),
			.in(ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec_n),
			.y(ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec)
		);

	sm83_not_pch_dec3_a #(
			.L_in(177.6597 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y15),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(818.6035 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in5),
			.W_gate_y(sm83_decoder3_param::W_gate_in5)
		) dec3_not15_inst (
			.pch_n(exec_phase),
			.in(ctl_op_inc_or_dec_m_or_ld_or_halt_n),
			.y(ctl_op_inc_or_dec_m_or_ld_or_halt)
		);

	sm83_not_pch_dec3_b #(
			.L_in(185.5796 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y16),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1632.328 + sm83_not_pch_dec3_b_param::L_y + sm83_nand2_od_a_dbus_param::L_in1 + sm83_nand2_od_b_dbus_param::L_in1 + sm83_nand2_od_a_dbus_param::L_in1 + sm83_nand2_od_b_dbus_param::L_in1 + sm83_nand2_od_a_dbus_param::L_in1 + sm83_nand2_od_b_dbus_param::L_in1 + sm83_nand2_od_a_dbus_param::L_in1 + sm83_nand2_od_b_dbus_param::L_in1 + sm83_nand2_spare_param::L_in1 + sm83_nand2_spare_param::L_in2 + sm83_nor2_spare_param::L_in1 + sm83_nor2_spare_param::L_in2),
			.W_gate_y(sm83_nand2_od_a_dbus_param::W_gate_in1 + sm83_nand2_od_b_dbus_param::W_gate_in1 + sm83_nand2_od_a_dbus_param::W_gate_in1 + sm83_nand2_od_b_dbus_param::W_gate_in1 + sm83_nand2_od_a_dbus_param::W_gate_in1 + sm83_nand2_od_b_dbus_param::W_gate_in1 + sm83_nand2_od_a_dbus_param::W_gate_in1 + sm83_nand2_od_b_dbus_param::W_gate_in1 + sm83_nand2_spare_param::W_gate_in1 + sm83_nand2_spare_param::W_gate_in2 + sm83_nor2_spare_param::W_gate_in1 + sm83_nor2_spare_param::W_gate_in2)
		) dec3_not16_inst (
			.pch_n(data_phase),
			.in(ctl_op2_to_db_en_n),
			.y(ctl_op2_to_db_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(68.74487 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y17),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1024.712 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_swap),
			.W_gate_y(sm83_alu_shifter_param::W_gate_swap)
		) dec3_not17_inst (
			.pch_n(exec_phase),
			.in(ctl_op_swap_n),
			.y(ctl_op_swap)
		);

	sm83_not_pch_dec3_a #(
			.L_in(53.72878 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y18),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(352.591 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in8),
			.W_gate_y(sm83_decoder3_param::W_gate_in8)
		) dec3_not18_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sxx_or_swap_n),
			.y(ctl_op_sxx_or_swap)
		);

	sm83_not_pch_dec3_a #(
			.L_in(65.64032 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y19),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1313.319 + sm83_not_pch_dec3_a_param::L_y + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2 + sm83_ao221_xor_in4_s1_param::L_in2),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2 + sm83_ao221_xor_in4_s1_param::W_gate_in2)
		) dec3_not19_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_xor_n),
			.y(ctl_alu_xor)
		);

	sm83_not_pch_dec3_a #(
			.L_in(50.81425 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y2),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1098.715 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in27 + sm83_alu_shifter_param::L_r),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in27 + sm83_alu_shifter_param::W_gate_r)
		) dec3_not2_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rrx_or_srx_n),
			.y(ctl_op_rrx_or_srx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(171.007 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y20),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1668.44 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in69 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2 + sm83_alu_pggen_param::L_ao221_in2),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in69 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2 + sm83_alu_pggen_param::W_gate_ao221_in2)
		) dec3_not20_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_and_n),
			.y(ctl_alu_and)
		);

	sm83_not_pch_dec3_a #(
			.L_in(143.8892 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y21),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(346.0118 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in9),
			.W_gate_y(sm83_decoder3_param::W_gate_in9)
		) dec3_not21_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rxx_n),
			.y(ctl_op_rxx)
		);

	sm83_not_pch_dec3_a #(
			.L_in(52.39824 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y22),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(791.6124 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in55),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in55)
		) dec3_not22_inst (
			.pch_n(exec_phase),
			.in(ctl_op_scf_or_ccf_m0_n),
			.y(ctl_op_scf_or_ccf_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.15852 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y23),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1072.675 + sm83_not_p2_pch_dec3_param::L_y + sm83_alu_decoder_param::L_in57 + sm83_decoder3_param::L_in10),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in57 + sm83_decoder3_param::W_gate_in10)
		) dec3_not23_inst (
			.pch_n(exec_phase),
			.in(ctl_op_daa_m0_n),
			.y(ctl_op_daa_m0)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(63.35942 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y24),
			.W_gate_in(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y(507.1284 + sm83_not_pch_dec3_a2_param::L_y + sm83_alu_decoder_param::L_in61 + sm83_decoder3_param::L_in11),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in61 + sm83_decoder3_param::W_gate_in11)
		) dec3_not24_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_a_x_or_adc_a_x_n),
			.y(ctl_op_add_a_x_or_adc_a_x)
		);

	sm83_not_pch_dec3_a #(
			.L_in(75.01752 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y25),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(572.8328 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_decoder_param::L_in58 + sm83_decoder3_param::L_in12),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in58 + sm83_decoder3_param::W_gate_in12)
		) dec3_not25_inst (
			.pch_n(exec_phase),
			.in(ctl_op_sub_or_sbc_n),
			.y(ctl_op_sub_or_sbc)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.53 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y26),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1360.96 + sm83_not_p2_pch_dec3_param::L_y + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2 + sm83_alu_pggen_param::L_xor_in2),
			.W_gate_y(sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2 + sm83_alu_pggen_param::W_gate_xor_in2)
		) dec3_not26_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_inv_op2_n),
			.y(ctl_alu_inv_op2)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.71207 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y27),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(991.5748 + sm83_not_p2_pch_dec3_param::L_y + sm83_alu_decoder_param::L_in67 + sm83_decoder3_param::L_in13),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in67 + sm83_decoder3_param::W_gate_in13)
		) dec3_not27_inst (
			.pch_n(exec_phase),
			.in(ctl_op_cpl_m0_n),
			.y(ctl_op_cpl_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(61.58532 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y28),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(488.3742 + sm83_not_p2_pch_dec3_param::L_y + sm83_alu_decoder_param::L_in42 + sm83_decoder3_param::L_in14),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in42 + sm83_decoder3_param::W_gate_in14)
		) dec3_not28_inst (
			.pch_n(exec_phase),
			.in(ctl_op_cp_n),
			.y(ctl_op_cp)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(132.1676 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y29),
			.W_gate_in(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y(961.7956 + sm83_not_pch_dec3_b2_param::L_y + sm83_decoder3_param::L_in15 + sm83_dffn_ee_pch_d_alu_flag_param::L_clk_n),
			.W_gate_y(sm83_decoder3_param::W_gate_in15 + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_clk_n)
		) dec3_not29_inst (
			.pch_n(data_phase),
			.in(ctl_flags_c_we_n),
			.y(ctl_flags_c_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(74.63734 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y3),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(203.7004 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in1),
			.W_gate_y(sm83_decoder3_param::W_gate_in1)
		) dec3_not3_inst (
			.pch_n(exec_phase),
			.in(ctl_op_or_or_set_exec_n),
			.y(ctl_op_or_or_set_exec)
		);

	sm83_not_pch_dec3_b #(
			.L_in(152.8862 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y30),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1111.134 + sm83_not_pch_dec3_b_param::L_y + sm83_dffn_ee_pch_d_alu_flag_param::L_clk_n + sm83_dffn_ee_pch_d_alu_flag_param::L_clk_n + sm83_dffn_ee_pch_d_alu_flag_param::L_clk_n),
			.W_gate_y(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_clk_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_clk_n + sm83_dffn_ee_pch_d_alu_flag_param::W_gate_clk_n)
		) dec3_not30_inst (
			.pch_n(data_phase),
			.in(ctl_flags_znh_we_n),
			.y(ctl_flags_znh_we)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(90.54046 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y31),
			.W_gate_in(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y(515.8725 + sm83_not_pch_dec3_a2_param::L_y + sm83_decoder3_param::L_in16),
			.W_gate_y(sm83_decoder3_param::W_gate_in16)
		) dec3_not31_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_sp_e_m2_buf_n),
			.y(ctl_op_add_sp_e_m2_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.90703 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y32),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(511.4374 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in17),
			.W_gate_y(sm83_decoder3_param::W_gate_in17)
		) dec3_not32_inst (
			.pch_n(exec_phase),
			.in(ctl_op_add_sp_e_m1_buf_n),
			.y(ctl_op_add_sp_e_m1_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(88.06954 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y33),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(358.6774 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in18),
			.W_gate_y(sm83_decoder3_param::W_gate_in18)
		) dec3_not33_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rxxa_or_daa_or_cpl_m0_n),
			.y(ctl_op_rxxa_or_daa_or_cpl_m0)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(53.03177 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y34),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(919.2179 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_pc_out_bit012_param::L_in9 + sm83_reg_pc_out_bit012_param::L_in9 + sm83_reg_pc_out_bit012_param::L_in9 + sm83_reg_pc_out_bit345_param::L_in9 + sm83_reg_pc_out_bit345_param::L_in9 + sm83_reg_pc_out_bit345_param::L_in9 + sm83_reg_pc_out_bit67_param::L_in9 + sm83_reg_pc_out_bit67_param::L_in9),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in9 + sm83_reg_pc_out_bit012_param::W_gate_in9 + sm83_reg_pc_out_bit012_param::W_gate_in9 + sm83_reg_pc_out_bit345_param::W_gate_in9 + sm83_reg_pc_out_bit345_param::W_gate_in9 + sm83_reg_pc_out_bit345_param::W_gate_in9 + sm83_reg_pc_out_bit67_param::W_gate_in9 + sm83_reg_pc_out_bit67_param::W_gate_in9)
		) dec3_not34_inst (
			.pch_n(exec_phase),
			.in(ctl_ff_to_op1_en_n),
			.y(ctl_ff_to_op1_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(190.9019 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y35),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(480.8344 + sm83_not_p2_pch_dec3_param::L_y + sm83_decoder3_param::L_in20),
			.W_gate_y(sm83_decoder3_param::W_gate_in20)
		) dec3_not35_inst (
			.pch_n(exec_phase),
			.in(ctl_op_alu_or_alu_cb_or_ld_or_halt_n),
			.y(ctl_op_alu_or_alu_cb_or_ld_or_halt)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(184.4392 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y36),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1651.907 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena + sm83_reg_a_out_param::L_b_ena),
			.W_gate_y(sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena + sm83_reg_a_out_param::W_gate_b_ena)
		) dec3_not36_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_a_to_op2_en_n),
			.y(ctl_reg_a_to_op2_en)
		);

	sm83_not_pch_dec3_a2 #(
			.L_in(112.9697 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y37),
			.W_gate_in(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y(389.0099 + sm83_not_pch_dec3_a2_param::L_y + sm83_decoder3_param::L_in21),
			.W_gate_y(sm83_decoder3_param::W_gate_in21)
		) dec3_not37_inst (
			.pch_n(exec_phase),
			.in(ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec_n),
			.y(ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(167.2054 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y38),
			.W_gate_in(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y(1567.005 + sm83_not_pch_dec3_b2_param::L_y + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en + sm83_b2b_wand_inj_a_param::L_inj_en),
			.W_gate_y(sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en + sm83_b2b_wand_inj_a_param::W_gate_inj_en)
		) dec3_not38_inst (
			.pch_n(data_phase),
			.in(ctl_alu_to_db_en_n),
			.y(ctl_alu_to_db_en)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(279.7949 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y39),
			.W_gate_in(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y(1854.719 + sm83_not_pch_dec3_b2_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk_n + sm83_not_reg_a_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk_n + sm83_not_reg_a_we_param::W_gate_in)
		) dec3_not39_inst (
			.pch_n(data_phase),
			.in(ctl_reg_a_we_n),
			.y(ctl_reg_a_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(127.7959 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y4),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1194.895 + sm83_not_pch_dec3_a_param::L_y + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3 + sm83_ao221_xor_in4_s1_param::L_in3),
			.W_gate_y(sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3 + sm83_ao221_xor_in4_s1_param::W_gate_in3)
		) dec3_not4_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_add_n),
			.y(ctl_alu_add)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(170.6268 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y40),
			.W_gate_in(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y(1573.341 + sm83_not_pch_dec3_b2_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_h_e_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_h_e_we_param::W_gate_in)
		) dec3_not40_inst (
			.pch_n(data_phase),
			.in(ctl_reg_h_we_n),
			.y(ctl_reg_h_we)
		);

	sm83_not_pch_dec3_b2 #(
			.L_in(180.7643 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y41),
			.W_gate_in(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y(1821.899 + sm83_not_pch_dec3_b2_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_l_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_l_we_param::W_gate_in)
		) dec3_not41_inst (
			.pch_n(data_phase),
			.in(ctl_reg_l_we_n),
			.y(ctl_reg_l_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(78.37552 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y42),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1076.646 + sm83_not_pch_dec3_a_param::L_y + sm83_ao33_s3_tap_in1_n_param::L_in4 + sm83_or2_a_param::L_in2),
			.W_gate_y(sm83_ao33_s3_tap_in1_n_param::W_gate_in4 + sm83_or2_a_param::W_gate_in2)
		) dec3_not42_inst (
			.pch_n(exec_phase),
			.in(ctl_op_reti_m3_n),
			.y(ctl_op_reti_m3)
		);

	sm83_not_pch_dec3_a #(
			.L_in(137.1959 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y43),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1684.031 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1 + sm83_reg_hl_out_param::L_ena1),
			.W_gate_y(sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1 + sm83_reg_hl_out_param::W_gate_ena1)
		) dec3_not43_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_hl_to_idu_en_n),
			.y(ctl_reg_hl_to_idu_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(184.4938 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y44),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1636.573 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2 + sm83_reg_hl_out_param::L_h_ena2),
			.W_gate_y(sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2 + sm83_reg_hl_out_param::W_gate_h_ena2)
		) dec3_not44_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_h_to_op2_en_n),
			.y(ctl_reg_h_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(178.42 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y45),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1716.154 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2 + sm83_reg_hl_out_param::L_l_ena2),
			.W_gate_y(sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2 + sm83_reg_hl_out_param::W_gate_l_ena2)
		) dec3_not45_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_l_to_op2_en_n),
			.y(ctl_reg_l_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(89.7169 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y46),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1570.806 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1 + sm83_reg_de_out_param::L_ena1),
			.W_gate_y(sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1 + sm83_reg_de_out_param::W_gate_ena1)
		) dec3_not46_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_de_to_idu_en_n),
			.y(ctl_reg_de_to_idu_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(186.0237 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y47),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1573.404 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2 + sm83_reg_de_out_param::L_d_ena2),
			.W_gate_y(sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2 + sm83_reg_de_out_param::W_gate_d_ena2)
		) dec3_not47_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_d_to_op2_en_n),
			.y(ctl_reg_d_to_op2_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(182.1582 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y48),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1599.255 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2 + sm83_reg_de_out_param::L_e_ena2),
			.W_gate_y(sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2 + sm83_reg_de_out_param::W_gate_e_ena2)
		) dec3_not48_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_e_to_op2_en_n),
			.y(ctl_reg_e_to_op2_en)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.8276 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y49),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1578.536 + sm83_not_pch_dec3_b_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_we_param::W_gate_in)
		) dec3_not49_inst (
			.pch_n(data_phase),
			.in(ctl_reg_d_we_n),
			.y(ctl_reg_d_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(207.7554 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y5),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1009.76 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3 + sm83_alu_pggen_param::L_ao221_in3),
			.W_gate_y(sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3 + sm83_alu_pggen_param::W_gate_ao221_in3)
		) dec3_not5_inst (
			.pch_n(exec_phase),
			.in(ctl_alu_or_n),
			.y(ctl_alu_or)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.0811 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y50),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1512.452 + sm83_not_pch_dec3_b_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_b_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_b_we_param::W_gate_in)
		) dec3_not50_inst (
			.pch_n(data_phase),
			.in(ctl_reg_b_we_n),
			.y(ctl_reg_b_we)
		);

	sm83_not_pch_dec3_b #(
			.L_in(181.9047 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y51),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1648.549 + sm83_not_pch_dec3_b_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_h_e_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_h_e_we_param::W_gate_in)
		) dec3_not51_inst (
			.pch_n(data_phase),
			.in(ctl_reg_e_we_n),
			.y(ctl_reg_e_we)
		);

	sm83_not_pch_dec3_b #(
			.L_in(180.5109 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y52),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1555.093 + sm83_not_pch_dec3_b_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk_n + sm83_not_reg_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk_n + sm83_not_reg_we_param::W_gate_in)
		) dec3_not52_inst (
			.pch_n(data_phase),
			.in(ctl_reg_c_we_n),
			.y(ctl_reg_c_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.86031 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y53),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1531.65 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1 + sm83_reg_bc_out_param::L_ena1),
			.W_gate_y(sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1 + sm83_reg_bc_out_param::W_gate_ena1)
		) dec3_not53_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_bc_to_idu_en_n),
			.y(ctl_reg_bc_to_idu_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(181.2712 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y54),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1539.126 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2 + sm83_reg_bc_out_param::L_b_ena2),
			.W_gate_y(sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2 + sm83_reg_bc_out_param::W_gate_b_ena2)
		) dec3_not54_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_b_to_op2_en_n),
			.y(ctl_reg_b_to_op2_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(194.1331 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y55),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1562.76 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2 + sm83_reg_bc_out_param::L_c_ena2),
			.W_gate_y(sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2 + sm83_reg_bc_out_param::W_gate_c_ena2)
		) dec3_not55_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_c_to_op2_en_n),
			.y(ctl_reg_c_to_op2_en)
		);

	sm83_not_pch_dec3_b #(
			.L_in(81.16339 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y57),
			.W_gate_in(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y(1372.174 + sm83_not_pch_dec3_b_param::L_y + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2 + sm83_reg_wz_out_param::L_aoi_ena2),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2 + sm83_reg_wz_out_param::W_gate_aoi_ena2)
		) dec3_not56_inst (
			.pch_n(data_phase),
			.in(ctl_reg_wz_to_reg_gp_en_n),
			.y(ctl_reg_wz_to_reg_gp_en)
		);

	sm83_not_p2_pch_dec3 #(
			.L_in(179.4971 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y59),
			.W_gate_in(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y(1530.184 + sm83_not_p2_pch_dec3_param::L_y + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena + sm83_reg_wz_out_param::L_nand_ena),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena + sm83_reg_wz_out_param::W_gate_nand_ena)
		) dec3_not57_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_z_to_op2_en_n),
			.y(ctl_reg_z_to_op2_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(123.8042 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y60),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1390.549 + sm83_not_pch_dec3_a_param::L_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_not_reg_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_not_reg_we_param::W_gate_in)
		) dec3_not58_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_w_we_n),
			.y(ctl_reg_w_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(116.898 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y61),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1565.547 + sm83_not_pch_dec3_a_param::L_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk_n + sm83_not_reg_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk_n + sm83_not_reg_we_param::W_gate_in)
		) dec3_not59_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_z_we_n),
			.y(ctl_reg_z_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(60.50823 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y6),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(873.5993 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_rlc),
			.W_gate_y(sm83_alu_shifter_param::W_gate_rlc)
		) dec3_not6_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rlc_n),
			.y(ctl_op_rlc)
		);

	sm83_not_pch_dec3_a #(
			.L_in(56.83332 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y62),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(2053.921 + sm83_not_pch_dec3_a_param::L_y + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_not_reg_sp_we_param::L_in + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk_n + sm83_not_reg_sp_we_param::L_in),
			.W_gate_y(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_not_reg_sp_we_param::W_gate_in + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk_n + sm83_not_reg_sp_we_param::W_gate_in)
		) dec3_not60_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_sp_we_n),
			.y(ctl_reg_sp_we)
		);

	sm83_not_pch_dec3_a #(
			.L_in(100.9948 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y63),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1333.462 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in27 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17 + sm83_reg_sp_out_param::L_in17),
			.W_gate_y(sm83_decoder3_param::W_gate_in27 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in17)
		) dec3_not61_inst (
			.pch_n(exec_phase),
			.in(ctl_idu_to_reg_sp_en_n),
			.y(ctl_idu_to_reg_sp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(96.62305 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y64),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1364.381 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in28 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15 + sm83_reg_sp_out_param::L_in15),
			.W_gate_y(sm83_decoder3_param::W_gate_in28 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15 + sm83_reg_sp_out_param::W_gate_in15)
		) dec3_not62_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_wz_to_reg_sp_en_n),
			.y(ctl_reg_wz_to_reg_sp_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(48.27992 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y65),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(476.2726 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in30),
			.W_gate_y(sm83_decoder3_param::W_gate_in30)
		) dec3_not63_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ldhl_sp_e_m2_buf_n),
			.y(ctl_op_ldhl_sp_e_m2_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(110.182 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y66),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1342.015 + sm83_not_pch_dec3_a_param::L_y + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13 + sm83_reg_sp_out_param::L_in13),
			.W_gate_y(sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13 + sm83_reg_sp_out_param::W_gate_in13)
		) dec3_not64_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_sp_to_idu_en_n),
			.y(ctl_reg_sp_to_idu_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(81.73366 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y67),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(490.4019 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in33),
			.W_gate_y(sm83_decoder3_param::W_gate_in33)
		) dec3_not65_inst (
			.pch_n(exec_phase),
			.in(ctl_op_ldhl_sp_e_m1_buf_n),
			.y(ctl_op_ldhl_sp_e_m1_buf)
		);

	sm83_not_pch_dec3_a #(
			.L_in(86.48551 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y68),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(1248.307 + sm83_not_pch_dec3_a_param::L_y + sm83_decoder3_param::L_in35 + sm83_reg_pc_out_bit012_param::L_in13 + sm83_reg_pc_out_bit012_param::L_in13 + sm83_reg_pc_out_bit012_param::L_in13 + sm83_reg_pc_out_bit345_param::L_in13 + sm83_reg_pc_out_bit345_param::L_in13 + sm83_reg_pc_out_bit345_param::L_in13 + sm83_reg_pc_out_bit67_param::L_in13 + sm83_reg_pc_out_bit67_param::L_in13),
			.W_gate_y(sm83_decoder3_param::W_gate_in35 + sm83_reg_pc_out_bit012_param::W_gate_in13 + sm83_reg_pc_out_bit012_param::W_gate_in13 + sm83_reg_pc_out_bit012_param::W_gate_in13 + sm83_reg_pc_out_bit345_param::W_gate_in13 + sm83_reg_pc_out_bit345_param::W_gate_in13 + sm83_reg_pc_out_bit345_param::W_gate_in13 + sm83_reg_pc_out_bit67_param::W_gate_in13 + sm83_reg_pc_out_bit67_param::W_gate_in13)
		) dec3_not66_inst (
			.pch_n(exec_phase),
			.in(ctl_idu_to_reg_pc_en_n),
			.y(ctl_idu_to_reg_pc_en)
		);

	sm83_not_pch_dec3_a #(
			.L_in(69.25186 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y69),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(2074.956 + sm83_not_pch_dec3_a_param::L_y + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_not2_reg_pc_we_param::L_a_in + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk_n + sm83_not2_reg_pc_we_param::L_a_in),
			.W_gate_y(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_not2_reg_pc_we_param::W_gate_a_in + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk_n + sm83_not2_reg_pc_we_param::W_gate_a_in)
		) dec3_not67_inst (
			.pch_n(exec_phase),
			.in(ctl_reg_pc_we_n),
			.y(ctl_reg_pc_we)
		);

	sm83_not_dec3 #(
			.L_y(970.2233 + sm83_not_dec3_param::L_y + sm83_nor2_pch_in1_dec3_param::L_in2 + sm83_nor2_e_param::L_in1),
			.W_gate_y(sm83_nor2_pch_in1_dec3_param::W_gate_in2 + sm83_nor2_e_param::W_gate_in1)
		) dec3_not68_inst (
			.in(data_phase),
			.y(data_phase_buf_n)
		);

	sm83_not_p2_dec3_a #(
			.L_y(1495.029 + sm83_not_p2_dec3_a_param::L_y + sm83_alu_decoder_param::L_in40 + sm83_decoder3_param::L_in84),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in40 + sm83_decoder3_param::W_gate_in84)
		) dec3_not69_inst (
			.in(opcode[0]),
			.y(opcode_n_buf2[0])
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.13102 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y7),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(885.004 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_rl),
			.W_gate_y(sm83_alu_shifter_param::W_gate_rl)
		) dec3_not7_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rl_n),
			.y(ctl_op_rl)
		);

	sm83_not_p2_dec3_a #(
			.L_y(409.1119 + sm83_not_p2_dec3_a_param::L_y + sm83_decoder3_param::L_in89),
			.W_gate_y(sm83_decoder3_param::W_gate_in89)
		) dec3_not70_inst (
			.in(opcode[1]),
			.y(opcode_n_buf2[1])
		);

	sm83_not_p2_dec3_b #(
			.L_y(332.6374 + sm83_not_p2_dec3_b_param::L_y + sm83_decoder3_param::L_in88),
			.W_gate_y(sm83_decoder3_param::W_gate_in88)
		) dec3_not71_inst (
			.in(opcode[2]),
			.y(opcode_n_buf2[2])
		);

	sm83_not_p2_dec3_b #(
			.L_y(1753.847 + sm83_not_p2_dec3_b_param::L_y + sm83_alu_decoder_param::L_in44 + sm83_decoder3_param::L_in76),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in44 + sm83_decoder3_param::W_gate_in76)
		) dec3_not72_inst (
			.in(opcode[5]),
			.y(opcode_n_buf2[5])
		);

	sm83_not_p2_dec3_a #(
			.L_y(1766.083 + sm83_not_p2_dec3_a_param::L_y + sm83_alu_decoder_param::L_in46 + sm83_decoder3_param::L_in78),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in46 + sm83_decoder3_param::W_gate_in78)
		) dec3_not73_inst (
			.in(opcode[4]),
			.y(opcode_n_buf2[4])
		);

	sm83_not_p2_dec3_a #(
			.L_y(1726.066 + sm83_not_p2_dec3_a_param::L_y + sm83_alu_decoder_param::L_in48 + sm83_decoder3_param::L_in80),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in48 + sm83_decoder3_param::W_gate_in80)
		) dec3_not74_inst (
			.in(opcode[3]),
			.y(opcode_n_buf2[3])
		);

	sm83_not_pch_dec3_a #(
			.L_in(61.33183 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y8),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(556.2954 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_rrc),
			.W_gate_y(sm83_alu_shifter_param::W_gate_rrc)
		) dec3_not8_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rrc_n),
			.y(ctl_op_rrc)
		);

	sm83_not_pch_dec3_a #(
			.L_in(51.57453 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y9),
			.W_gate_in(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y(563.5817 + sm83_not_pch_dec3_a_param::L_y + sm83_alu_shifter_param::L_rr),
			.W_gate_y(sm83_alu_shifter_param::W_gate_rr)
		) dec3_not9_inst (
			.pch_n(exec_phase),
			.in(ctl_op_rr_n),
			.y(ctl_op_rr)
		);

	sm83_decoder1 #(
			.L_y1(25.15366 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y1),
			.W_gate_y1(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y2(24.01319 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y2),
			.W_gate_y2(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y3(26.16745 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y3),
			.W_gate_y3(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y4(24.45675 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y4),
			.W_gate_y4(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y5(24.20333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y5),
			.W_gate_y5(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y6(24.5201 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y6),
			.W_gate_y6(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y7(24.3934 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y7),
			.W_gate_y7(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y8(24.96356 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y8),
			.W_gate_y8(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y9(24.71019 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y9),
			.W_gate_y9(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y10(24.07656 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y10),
			.W_gate_y10(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y11(24.83689 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y11),
			.W_gate_y11(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y12(24.83689 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y12),
			.W_gate_y12(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y13(24.83689 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y13),
			.W_gate_y13(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y14(23.82316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y14),
			.W_gate_y14(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y15(24.71017 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y15),
			.W_gate_y15(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y16(24.39335 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y16),
			.W_gate_y16(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y17(24.26658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y17),
			.W_gate_y17(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y18(24.26668 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y18),
			.W_gate_y18(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y19(24.39338 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y19),
			.W_gate_y19(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y20(24.5201 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y20),
			.W_gate_y20(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y21(24.77352 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y21),
			.W_gate_y21(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y22(24.4567 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y22),
			.W_gate_y22(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y23(24.64675 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y23),
			.W_gate_y23(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y24(24.39333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y24),
			.W_gate_y24(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y25(23.94989 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y25),
			.W_gate_y25(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y26(23.82309 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y26),
			.W_gate_y26(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y27(24.13991 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y27),
			.W_gate_y27(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y28(24.39333 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y28),
			.W_gate_y28(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y29(24.07658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y29),
			.W_gate_y29(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y30(24.20326 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y30),
			.W_gate_y30(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y31(24.45675 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y31),
			.W_gate_y31(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y32(24.52005 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y32),
			.W_gate_y32(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y33(24.71014 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y33),
			.W_gate_y33(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y34(23.82312 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y34),
			.W_gate_y34(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y35(24.01316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y35),
			.W_gate_y35(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y36(23.88649 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y36),
			.W_gate_y36(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y37(24.13993 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y37),
			.W_gate_y37(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y38(24.07649 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y38),
			.W_gate_y38(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y39(24.07658 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y39),
			.W_gate_y39(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y40(24.13993 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y40),
			.W_gate_y40(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y41(24.01321 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y41),
			.W_gate_y41(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y42(24.4567 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y42),
			.W_gate_y42(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y43(23.75979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y43),
			.W_gate_y43(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y44(24.2667 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y44),
			.W_gate_y44(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y45(24.64684 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y45),
			.W_gate_y45(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y46(23.82312 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y46),
			.W_gate_y46(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y47(24.71022 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y47),
			.W_gate_y47(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y48(24.52015 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y48),
			.W_gate_y48(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y49(24.64675 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y49),
			.W_gate_y49(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y50(24.07658 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y50),
			.W_gate_y50(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y51(24.39333 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y51),
			.W_gate_y51(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y52(24.39328 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y52),
			.W_gate_y52(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y53(24.71019 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y53),
			.W_gate_y53(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y54(23.56972 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y54),
			.W_gate_y54(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y55(24.33 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y55),
			.W_gate_y55(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y56(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y56),
			.W_gate_y56(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y57(24.71022 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y57),
			.W_gate_y57(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y58(24.45677 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y58),
			.W_gate_y58(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y59(24.77357 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y59),
			.W_gate_y59(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y60(24.33007 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y60),
			.W_gate_y60(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y61(24.4567 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y61),
			.W_gate_y61(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y62(23.63305 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y62),
			.W_gate_y62(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y63(24.7101 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y63),
			.W_gate_y63(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y64(23.69642 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y64),
			.W_gate_y64(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y65(24.01324 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y65),
			.W_gate_y65(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y66(23.94979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y66),
			.W_gate_y66(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y67(23.6964 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y67),
			.W_gate_y67(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y68(24.13996 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y68),
			.W_gate_y68(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y69(24.33 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y69),
			.W_gate_y69(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y70(23.94984 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y70),
			.W_gate_y70(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y71(24.39335 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y71),
			.W_gate_y71(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y72(23.82312 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y72),
			.W_gate_y72(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y73(24.64682 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y73),
			.W_gate_y73(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y74(23.75979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y74),
			.W_gate_y74(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y75(24.52012 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y75),
			.W_gate_y75(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y76(23.63307 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y76),
			.W_gate_y76(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y77(24.13988 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y77),
			.W_gate_y77(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y78(23.69642 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y78),
			.W_gate_y78(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y79(24.64677 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y79),
			.W_gate_y79(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y80(24.14001 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y80),
			.W_gate_y80(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y81(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y81),
			.W_gate_y81(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y82(24.2033 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y82),
			.W_gate_y82(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y83(24.64684 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y83),
			.W_gate_y83(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y84(23.88644 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y84),
			.W_gate_y84(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y85(24.26668 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y85),
			.W_gate_y85(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y86(23.94979 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y86),
			.W_gate_y86(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y87(23.94991 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y87),
			.W_gate_y87(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y88(23.94984 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y88),
			.W_gate_y88(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y89(24.58345 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y89),
			.W_gate_y89(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y90(23.94981 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y90),
			.W_gate_y90(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y91(24.26665 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y91),
			.W_gate_y91(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y92(24.07658 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y92),
			.W_gate_y92(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y93(24.45668 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y93),
			.W_gate_y93(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y94(23.633 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y94),
			.W_gate_y94(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y95(24.01319 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y95),
			.W_gate_y95(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y96(23.63312 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y96),
			.W_gate_y96(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y97(24.77349 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y97),
			.W_gate_y97(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y98(24.20335 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y98),
			.W_gate_y98(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y99(24.83691 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y99),
			.W_gate_y99(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y100(24.13996 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y100),
			.W_gate_y100(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y101(24.13986 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y101),
			.W_gate_y101(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y102(24.01316 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y102),
			.W_gate_y102(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y103(25.15368 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y103),
			.W_gate_y103(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y104(23.75977 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y104),
			.W_gate_y104(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y105(24.71021 + sm83_not2_pch_dec1_param::L_a_in + sm83_decoder1_param::L_y105),
			.W_gate_y105(sm83_not2_pch_dec1_param::W_gate_a_in),
			.L_y106(23.94986 + sm83_not2_pch_dec1_param::L_b_in + sm83_decoder1_param::L_y106),
			.W_gate_y106(sm83_not2_pch_dec1_param::W_gate_b_in),
			.L_y107(24.77352 + sm83_not_pch_dec1_param::L_in + sm83_decoder1_param::L_y107),
			.W_gate_y107(sm83_not_pch_dec1_param::W_gate_in)
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
			.y49(dec1_y49),
			.y50(dec1_y50),
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
			.y107(dec1_y107)
		);

	sm83_decoder2 #(
			.L_y1(146.4446 + sm83_decoder2_param::L_y1 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y1(sm83_not_x1_dec2_param::W_gate_in),
			.L_y2(80.64444 + sm83_decoder2_param::L_y2 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y2(sm83_not_x1_dec2_param::W_gate_in),
			.L_y3(123.3607 + sm83_decoder2_param::L_y3 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y3(sm83_not_x1_dec2_param::W_gate_in),
			.L_y4(178.7919 + sm83_decoder2_param::L_y4 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y4(sm83_not_x1_dec2_param::W_gate_in),
			.L_y5(810.7727 + sm83_decoder2_param::L_y5 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y5(sm83_not_x1_dec2_param::W_gate_in),
			.L_y6(128.7463 + sm83_pch_dec2_a_param::L_y + sm83_decoder2_param::L_y6 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y6(sm83_not_x1_p2_dec2_param::W_gate_in),
			.L_y7(253.6498 + sm83_decoder2_param::L_y7 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y7(sm83_not_x1_p2_dec2_param::W_gate_in),
			.L_y8(1004.437 + sm83_decoder2_param::L_y8 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y8(sm83_not_x1_dec2_param::W_gate_in),
			.L_y9(263.6385 + sm83_decoder2_param::L_y9 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y9(sm83_not_x1_dec2_param::W_gate_in),
			.L_y10(87.11906 + sm83_pch_dec2_c_param::L_y + sm83_decoder2_param::L_y10 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y10(sm83_not_x1_dec2_param::W_gate_in),
			.L_y11(73.30678 + sm83_pch_dec2_c_param::L_y + sm83_decoder2_param::L_y11 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y11(sm83_not_x1_dec2_param::W_gate_in),
			.L_y12(487.9358 + sm83_decoder2_param::L_y12 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y12(sm83_not_x1_dec2_param::W_gate_in),
			.L_y13(735.7932 + sm83_decoder2_param::L_y13 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y13(sm83_not_x1_dec2_param::W_gate_in),
			.L_y14(787.6213 + sm83_decoder2_param::L_y14 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y14(sm83_not_x1_dec2_param::W_gate_in),
			.L_y15(821.4548 + sm83_decoder2_param::L_y15 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y15(sm83_not_x1_dec2_param::W_gate_in),
			.L_y16(501.0464 + sm83_decoder2_param::L_y16 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y16(sm83_not_x1_p2_dec2_param::W_gate_in),
			.L_y17(135.9692 + sm83_pch_dec2_b_param::L_y + sm83_decoder2_param::L_y17 + sm83_not_x1_p2_dec2_param::L_in),
			.W_gate_y17(sm83_not_x1_p2_dec2_param::W_gate_in),
			.L_y18(939.6211 + sm83_decoder2_param::L_y18 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y18(sm83_not_x1_dec2_param::W_gate_in),
			.L_y19(757.3352 + sm83_decoder2_param::L_y19 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y19(sm83_not_x1_dec2_param::W_gate_in),
			.L_y20(117.9752 + sm83_not_x1_pch_dec2_param::L_in + sm83_decoder2_param::L_y20),
			.W_gate_y20(sm83_not_x1_pch_dec2_param::W_gate_in),
			.L_y21(537.0345 + sm83_decoder2_param::L_y21 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y21(sm83_not_x1_dec2_param::W_gate_in),
			.L_y22(561.0481 + sm83_decoder2_param::L_y22 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y22(sm83_not_x1_dec2_param::W_gate_in),
			.L_y23(661.9796 + sm83_decoder2_param::L_y23 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y23(sm83_not_x1_dec2_param::W_gate_in),
			.L_y24(789.7766 + sm83_decoder2_param::L_y24 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y24(sm83_not_x1_dec2_param::W_gate_in),
			.L_y25(750.8091 + sm83_decoder2_param::L_y25 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y25(sm83_not_x1_dec2_param::W_gate_in),
			.L_y26(800.3059 + sm83_decoder2_param::L_y26 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y26(sm83_not_x1_dec2_param::W_gate_in),
			.L_y27(668.5049 + sm83_decoder2_param::L_y27 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y27(sm83_not_x1_dec2_param::W_gate_in),
			.L_y28(636.3187 + sm83_decoder2_param::L_y28 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y28(sm83_not_x1_dec2_param::W_gate_in),
			.L_y29(712.4767 + sm83_decoder2_param::L_y29 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y29(sm83_not_x1_dec2_param::W_gate_in),
			.L_y30(798.8004 + sm83_decoder2_param::L_y30 + sm83_not_x1_dec2_param::L_in),
			.W_gate_y30(sm83_not_x1_dec2_param::W_gate_in)
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
			.y30(ctl_reg_gp_we_mask_n)
		);

	sm83_decoder3 #(
			.L_y1(68.93494 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y1),
			.W_gate_y1(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y2(50.81425 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y2),
			.W_gate_y2(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y3(74.63734 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y3),
			.W_gate_y3(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y4(127.7959 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y4),
			.W_gate_y4(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y5(207.7554 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y5),
			.W_gate_y5(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y6(60.50823 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y6),
			.W_gate_y6(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y7(51.13102 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y7),
			.W_gate_y7(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y8(61.33183 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y8),
			.W_gate_y8(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y9(51.57453 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y9),
			.W_gate_y9(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y10(61.20518 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y10),
			.W_gate_y10(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y11(137.2998 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y11),
			.W_gate_y11(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y12(119.4324 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y12),
			.W_gate_y12(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y13(114.8705 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y13),
			.W_gate_y13(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y14(198.9485 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y14),
			.W_gate_y14(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y15(177.6597 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y15),
			.W_gate_y15(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y16(185.5796 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y16),
			.W_gate_y16(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y17(68.74487 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y17),
			.W_gate_y17(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y18(53.72878 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y18),
			.W_gate_y18(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y19(65.64032 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y19),
			.W_gate_y19(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y20(171.007 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y20),
			.W_gate_y20(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y21(143.8892 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y21),
			.W_gate_y21(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y22(52.39824 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y22),
			.W_gate_y22(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y23(53.15852 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y23),
			.W_gate_y23(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y24(63.35942 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y24),
			.W_gate_y24(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y25(75.01752 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y25),
			.W_gate_y25(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y26(186.53 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y26),
			.W_gate_y26(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y27(61.71207 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y27),
			.W_gate_y27(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y28(61.58532 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y28),
			.W_gate_y28(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y29(132.1676 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y29),
			.W_gate_y29(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y30(152.8862 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y30),
			.W_gate_y30(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y31(90.54046 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y31),
			.W_gate_y31(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y32(89.90703 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y32),
			.W_gate_y32(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y33(88.06954 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y33),
			.W_gate_y33(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y34(53.03177 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y34),
			.W_gate_y34(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y35(190.9019 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y35),
			.W_gate_y35(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y36(184.4392 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y36),
			.W_gate_y36(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y37(112.9697 + sm83_not_pch_dec3_a2_param::L_in + sm83_decoder3_param::L_y37),
			.W_gate_y37(sm83_not_pch_dec3_a2_param::W_gate_in),
			.L_y38(167.2054 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y38),
			.W_gate_y38(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y39(279.7949 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y39),
			.W_gate_y39(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y40(170.6268 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y40),
			.W_gate_y40(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y41(180.7643 + sm83_not_pch_dec3_b2_param::L_in + sm83_decoder3_param::L_y41),
			.W_gate_y41(sm83_not_pch_dec3_b2_param::W_gate_in),
			.L_y42(78.37552 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y42),
			.W_gate_y42(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y43(137.1959 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y43),
			.W_gate_y43(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y44(184.4938 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y44),
			.W_gate_y44(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y45(178.42 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y45),
			.W_gate_y45(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y46(89.7169 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y46),
			.W_gate_y46(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y47(186.0237 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y47),
			.W_gate_y47(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y48(182.1582 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y48),
			.W_gate_y48(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y49(180.8276 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y49),
			.W_gate_y49(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y50(181.0811 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y50),
			.W_gate_y50(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y51(181.9047 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y51),
			.W_gate_y51(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y52(180.5109 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y52),
			.W_gate_y52(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y53(81.86031 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y53),
			.W_gate_y53(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y54(181.2712 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y54),
			.W_gate_y54(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y55(194.1331 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y55),
			.W_gate_y55(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y56(72.16634 + sm83_nor2_pch_in1_dec3_param::L_in1 + sm83_decoder3_param::L_y56),
			.W_gate_y56(sm83_nor2_pch_in1_dec3_param::W_gate_in1),
			.L_y57(81.16339 + sm83_not_pch_dec3_b_param::L_in + sm83_decoder3_param::L_y57),
			.W_gate_y57(sm83_not_pch_dec3_b_param::W_gate_in),
			.L_y58(183.4254 + sm83_nor2_pch_in1_dec3_param::L_in1 + sm83_decoder3_param::L_y58),
			.W_gate_y58(sm83_nor2_pch_in1_dec3_param::W_gate_in1),
			.L_y59(179.4971 + sm83_not_p2_pch_dec3_param::L_in + sm83_decoder3_param::L_y59),
			.W_gate_y59(sm83_not_p2_pch_dec3_param::W_gate_in),
			.L_y60(123.8042 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y60),
			.W_gate_y60(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y61(116.898 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y61),
			.W_gate_y61(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y62(56.83332 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y62),
			.W_gate_y62(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y63(100.9948 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y63),
			.W_gate_y63(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y64(96.62305 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y64),
			.W_gate_y64(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y65(48.27992 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y65),
			.W_gate_y65(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y66(110.182 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y66),
			.W_gate_y66(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y67(81.73366 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y67),
			.W_gate_y67(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y68(86.48551 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y68),
			.W_gate_y68(sm83_not_pch_dec3_a_param::W_gate_in),
			.L_y69(69.25186 + sm83_not_pch_dec3_a_param::L_in + sm83_decoder3_param::L_y69),
			.W_gate_y69(sm83_not_pch_dec3_a_param::W_gate_in)
		) decoder3_inst (
			.in1(ctl_op_or_or_set_exec),
			.in2(ctl_op_add_or_adc_or_ldhl_exec),
			.in3(ctl_op_sub_or_sbc_or_cp),
			.in4(ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec),
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
			.in21(ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec),
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
			.in60(ctl_reg_gp_we_mask),
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
			.in71(ctl_reg_gp_we_mask),
			.in72(ctl_sel_reg_w),
			.in73(ctl_sel_reg_z),
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
			.y14(ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec_n),
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
			.y37(ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec_n),
			.y38(ctl_alu_to_db_en_n),
			.y39(ctl_reg_a_we_n),
			.y40(ctl_reg_h_we_n),
			.y41(ctl_reg_l_we_n),
			.y42(ctl_op_reti_m3_n),
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
			.L_d(343.9147 + sm83_alu_decoder_param::L_y3 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_d(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_q(694.989 + sm83_dffn_ee_pch_d_alu_flag_param::L_q + sm83_alu_decoder_param::L_in5),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in5),
			.L_q_n(1991.006 + sm83_dffn_ee_pch_d_alu_flag_param::L_q_n + sm83_alu_decoder_param::L_in4 + sm83_alu_shifter_param::L_c + sm83_reg_bus_pch_a_bit4_param::L_c_zero_b2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in4 + sm83_alu_shifter_param::W_gate_c + sm83_reg_bus_pch_a_bit4_param::W_gate_c_zero_b2)
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
			.L_d(204.2707 + sm83_alu_decoder_param::L_y2 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_d(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_q(344.2949 + sm83_dffn_ee_pch_d_alu_flag_param::L_q + sm83_alu_decoder_param::L_in3),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in3),
			.L_q_n(1505.42 + sm83_dffn_ee_pch_d_alu_flag_param::L_q_n + sm83_alu_decoder_param::L_in2 + sm83_reg_bus_pch_a_bit5_param::L_c_zero_b2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in2 + sm83_reg_bus_pch_a_bit5_param::W_gate_c_zero_b2)
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
			.L_d(173.0344 + sm83_alu_decoder_param::L_y8 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_d(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_q(339.036 + sm83_dffn_ee_pch_d_alu_flag_param::L_q + sm83_alu_decoder_param::L_in11),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in11),
			.L_q_n(1354.244 + sm83_dffn_ee_pch_d_alu_flag_param::L_q_n + sm83_alu_decoder_param::L_in10 + sm83_reg_bus_pch_a_bit6_param::L_c_zero_b2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in10 + sm83_reg_bus_pch_a_bit6_param::W_gate_c_zero_b2)
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
			.L_d(465.8182 + sm83_alu_decoder_param::L_y13 + sm83_dffn_ee_pch_d_alu_flag_param::L_d),
			.W_gate_d(sm83_dffn_ee_pch_d_alu_flag_param::W_gate_d),
			.L_q(111.6392 + sm83_dffn_ee_pch_d_alu_flag_param::L_q + sm83_alu_decoder_param::L_in15),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in15),
			.L_q_n(1257.494 + sm83_dffn_ee_pch_d_alu_flag_param::L_q_n + sm83_alu_decoder_param::L_in16 + sm83_reg_bus_pch_a_bit7_param::L_c_zero_b2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in16 + sm83_reg_bus_pch_a_bit7_param::W_gate_c_zero_b2)
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
			.L_aoi_buf_y(70.96249 + sm83_idu_bit0_param::L_aoi_buf_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_aoi_buf_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_aoi_y_n(87.2458 + sm83_idu_bit0_param::L_aoi_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_aoi_y_n(sm83_xor_idu_h_param::W_gate_in2),
			.L_zero_y(70.96249 + sm83_idu_bit0_param::L_zero_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_zero_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_or_y(101.9452 + sm83_idu_bit0_param::L_or_y + sm83_xor_idu_l_param::L_in2),
			.W_gate_or_y(sm83_xor_idu_l_param::W_gate_in2),
			.L_buf_a_y(L_a0),
			.W_gate_buf_a_y(W_gate_a0),
			.L_buf_b_y(L_a8),
			.W_gate_buf_b_y(W_gate_a8),
			.L_buf_ena(628.145 + sm83_idu_bit0_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit123456_param::L_buf_ena + sm83_idu_bit7_param::L_buf_ena),
			.W_gate_buf_ena(sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit123456_param::W_gate_buf_ena + sm83_idu_bit7_param::W_gate_buf_ena)
		) idu_inst0 (
			.pch_n(data_phase),
			.aoi_buf_ena(idu_chain_ena[8]),
			.aoi_buf_y(idu_chain_hi[0]),
			.aoi_in1(idu_cpl_mask[7]),
			.aoi_in2(idu_chain_ena[7]),
			.aoi_in3(idu_at8),
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
			.W_gate_buf_a_y(W_gate_a1),
			.L_buf_b_y(L_a9),
			.W_gate_buf_b_y(W_gate_a9),
			.L_chain_a_in(70.96249 + sm83_idu_bit0_param::L_zero_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(70.70909 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y_n(93.70848 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(70.96249 + sm83_idu_bit0_param::L_aoi_buf_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(70.77242 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y_n(85.59849 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a2),
			.L_buf_b_y(L_a10),
			.W_gate_buf_b_y(W_gate_a10),
			.L_chain_a_in(70.70909 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(71.08923 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y_n(93.51851 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(70.77242 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(71.15256 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y_n(85.97872 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a3),
			.L_buf_b_y(L_a11),
			.W_gate_buf_b_y(W_gate_a11),
			.L_chain_a_in(71.08923 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(73.24343 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y_n(93.58174 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(71.15256 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(73.24343 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y_n(86.10538 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a4),
			.L_buf_b_y(L_a12),
			.W_gate_buf_b_y(W_gate_a12),
			.L_chain_a_in(73.24343 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(73.24343 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y_n(94.15195 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(73.24343 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(73.49692 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y_n(86.48551 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a5),
			.L_buf_b_y(L_a13),
			.W_gate_buf_b_y(W_gate_a13),
			.L_chain_a_in(73.24343 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(73.43349 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_y(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y_n(94.53218 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(73.49692 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(73.1801 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_y(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y_n(86.73891 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a6),
			.L_buf_b_y(L_a14),
			.W_gate_buf_b_y(W_gate_a14),
			.L_chain_a_in(73.43349 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit123456_param::L_chain_a_in),
			.W_gate_chain_a_in(sm83_idu_bit123456_param::W_gate_chain_a_in),
			.L_chain_a_y(79.1359 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit7_param::L_not_a_in),
			.W_gate_chain_a_y(sm83_idu_bit7_param::W_gate_not_a_in),
			.L_chain_a_y_n(93.13827 + sm83_idu_bit123456_param::L_chain_a_y_n + sm83_xor_idu_l_param::L_in2),
			.W_gate_chain_a_y_n(sm83_xor_idu_l_param::W_gate_in2),
			.L_chain_b_in(73.1801 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit123456_param::L_chain_b_in),
			.W_gate_chain_b_in(sm83_idu_bit123456_param::W_gate_chain_b_in),
			.L_chain_b_y(45.74548 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit7_param::L_not_b_in),
			.W_gate_chain_b_y(sm83_idu_bit7_param::W_gate_not_b_in),
			.L_chain_b_y_n(86.48561 + sm83_idu_bit123456_param::L_chain_b_y_n + sm83_xor_idu_h_param::L_in2),
			.W_gate_chain_b_y_n(sm83_xor_idu_h_param::W_gate_in2)
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
			.W_gate_buf_a_y(W_gate_a7),
			.L_buf_b_y(L_a15),
			.W_gate_buf_b_y(W_gate_a15),
			.L_not_a_in(79.1359 + sm83_idu_bit123456_param::L_chain_a_y + sm83_idu_bit7_param::L_not_a_in),
			.W_gate_not_a_in(sm83_idu_bit7_param::W_gate_not_a_in),
			.L_not_a_y(665.9705 + sm83_idu_bit7_param::L_not_a_y + sm83_idu_bit0_param::L_aoi_in1 + sm83_xor_idu_l_param::L_in2),
			.W_gate_not_a_y(sm83_idu_bit0_param::W_gate_aoi_in1 + sm83_xor_idu_l_param::W_gate_in2),
			.L_not_b_in(45.74548 + sm83_idu_bit123456_param::L_chain_b_y + sm83_idu_bit7_param::L_not_b_in),
			.W_gate_not_b_in(sm83_idu_bit7_param::W_gate_not_b_in),
			.L_not_b_y(86.42229 + sm83_idu_bit7_param::L_not_b_y + sm83_xor_idu_h_param::L_in2),
			.W_gate_not_b_y(sm83_xor_idu_h_param::W_gate_in2)
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
			.L_y1(167.4589 + sm83_idu_ctl_param::L_y1 + sm83_idu_bit0_param::L_aoi_in3),
			.W_gate_y1(sm83_idu_bit0_param::W_gate_aoi_in3),
			.L_y2(859.0264 + sm83_idu_ctl_param::L_y2 + sm83_idu_bit0_param::L_or_in2 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_h_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0 + sm83_mux_idu_l_param::L_d0),
			.W_gate_y2(sm83_idu_bit0_param::W_gate_or_in2 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_h_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0 + sm83_mux_idu_l_param::W_gate_d0),
			.L_y3(892.8605 + sm83_idu_ctl_param::L_y3 + sm83_idu_bit0_param::L_or_in1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_h_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1 + sm83_mux_idu_l_param::L_d1),
			.W_gate_y3(sm83_idu_bit0_param::W_gate_or_in1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_h_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1 + sm83_mux_idu_l_param::W_gate_d1)
		) idu_ctl_inst (
			.in1(ctl_idu_dec),
			.in2(reg_z[7]),
			.in3(ctl_op_jr_m1_buf),
			.in4(res_carry[7]),
			.in5(ctl_idu_inc),
			.y1(idu_at8),
			.y2(idu_dec),
			.y3(idu_inc)
		);

	sm83_mux_idu_h #(
			.L_y(42.07062 + sm83_mux_idu_h_param::L_y + sm83_idu_bit0_param::L_aoi_buf_ena),
			.W_gate_y(sm83_idu_bit0_param::W_gate_aoi_buf_ena)
		) idu_mux_h_inst0 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[8]),
			.y(idu_chain_ena[8])
		);

	sm83_mux_idu_h #(
			.L_y(42.83091 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
		) idu_mux_h_inst1 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[9]),
			.y(idu_chain_ena[9])
		);

	sm83_mux_idu_h #(
			.L_y(42.32402 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
		) idu_mux_h_inst2 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[10]),
			.y(idu_chain_ena[10])
		);

	sm83_mux_idu_h #(
			.L_y(42.45077 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
		) idu_mux_h_inst3 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[11]),
			.y(idu_chain_ena[11])
		);

	sm83_mux_idu_h #(
			.L_y(41.75391 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
		) idu_mux_h_inst4 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[12]),
			.y(idu_chain_ena[12])
		);

	sm83_mux_idu_h #(
			.L_y(41.88065 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
		) idu_mux_h_inst5 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[13]),
			.y(idu_chain_ena[13])
		);

	sm83_mux_idu_h #(
			.L_y(41.94397 + sm83_mux_idu_h_param::L_y + sm83_idu_bit123456_param::L_chain_b_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_b_ena)
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
			.L_y(47.45621 + sm83_mux_idu_l_param::L_y + sm83_idu_bit0_param::L_zero_ena),
			.W_gate_y(sm83_idu_bit0_param::W_gate_zero_ena)
		) idu_mux_l_inst0 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[0]),
			.y(idu_chain_ena[0])
		);

	sm83_mux_idu_l #(
			.L_y(47.32937 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst1 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[1]),
			.y(idu_chain_ena[1])
		);

	sm83_mux_idu_l #(
			.L_y(47.1393 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst2 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[2]),
			.y(idu_chain_ena[2])
		);

	sm83_mux_idu_l #(
			.L_y(47.58295 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst3 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[3]),
			.y(idu_chain_ena[3])
		);

	sm83_mux_idu_l #(
			.L_y(46.94932 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst4 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[4]),
			.y(idu_chain_ena[4])
		);

	sm83_mux_idu_l #(
			.L_y(47.01265 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst5 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[5]),
			.y(idu_chain_ena[5])
		);

	sm83_mux_idu_l #(
			.L_y(47.70961 + sm83_mux_idu_l_param::L_y + sm83_idu_bit123456_param::L_chain_a_ena),
			.W_gate_y(sm83_idu_bit123456_param::W_gate_chain_a_ena)
		) idu_mux_l_inst6 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[6]),
			.y(idu_chain_ena[6])
		);

	sm83_mux_idu_l #(
			.L_y(601.5339 + sm83_mux_idu_l_param::L_y + sm83_idu_bit0_param::L_aoi_in2),
			.W_gate_y(sm83_idu_bit0_param::W_gate_aoi_in2)
		) idu_mux_l_inst7 (
			.d0(idu_dec),
			.d1(idu_inc),
			.sel(idu_in[7]),
			.y(idu_chain_ena[7])
		);

	sm83_not2_idu #(
			.L_a_y(130.2036 + sm83_not2_idu_param::L_a_y + sm83_idu_bit0_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit0_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(187.9238 + sm83_not2_idu_param::L_b_y + sm83_idu_bit0_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit0_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst0 (
			.a_in(idu_in_n[0]),
			.a_y(idu_in[0]),
			.b_in(idu_in_n[8]),
			.b_y(idu_in[8])
		);

	sm83_not2_idu #(
			.L_a_y(129.7599 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(189.1277 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst1 (
			.a_in(idu_in_n[1]),
			.a_y(idu_in[1]),
			.b_in(idu_in_n[9]),
			.b_y(idu_in[9])
		);

	sm83_not2_idu #(
			.L_a_y(129.9501 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(187.0369 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst2 (
			.a_in(idu_in_n[2]),
			.a_y(idu_in[2]),
			.b_in(idu_in_n[10]),
			.b_y(idu_in[10])
		);

	sm83_not2_idu #(
			.L_a_y(130.7739 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(187.6071 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst3 (
			.a_in(idu_in_n[3]),
			.a_y(idu_in[3]),
			.b_in(idu_in_n[11]),
			.b_y(idu_in[11])
		);

	sm83_not2_idu #(
			.L_a_y(130.3936 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(188.9376 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst4 (
			.a_in(idu_in_n[4]),
			.a_y(idu_in[4]),
			.b_in(idu_in_n[12]),
			.b_y(idu_in[12])
		);

	sm83_not2_idu #(
			.L_a_y(130.5837 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(188.2408 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst5 (
			.a_in(idu_in_n[5]),
			.a_y(idu_in[5]),
			.b_in(idu_in_n[13]),
			.b_y(idu_in[13])
		);

	sm83_not2_idu #(
			.L_a_y(130.2036 + sm83_not2_idu_param::L_a_y + sm83_idu_bit123456_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit123456_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(187.3537 + sm83_not2_idu_param::L_b_y + sm83_idu_bit123456_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit123456_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst6 (
			.a_in(idu_in_n[6]),
			.a_y(idu_in[6]),
			.b_in(idu_in_n[14]),
			.b_y(idu_in[14])
		);

	sm83_not2_idu #(
			.L_a_y(131.2174 + sm83_not2_idu_param::L_a_y + sm83_idu_bit7_param::L_buf_a_in + sm83_mux_idu_l_param::L_sel + sm83_xor_idu_l_param::L_in1),
			.W_gate_a_y(sm83_idu_bit7_param::W_gate_buf_a_in + sm83_mux_idu_l_param::W_gate_sel + sm83_xor_idu_l_param::W_gate_in1),
			.L_b_y(187.1001 + sm83_not2_idu_param::L_b_y + sm83_idu_bit7_param::L_buf_b_in + sm83_mux_idu_h_param::L_sel + sm83_xor_idu_h_param::L_in1),
			.W_gate_b_y(sm83_idu_bit7_param::W_gate_buf_b_in + sm83_mux_idu_h_param::W_gate_sel + sm83_xor_idu_h_param::W_gate_in1)
		) idu_not_inst7 (
			.a_in(idu_in_n[7]),
			.a_y(idu_in[7]),
			.b_in(idu_in_n[15]),
			.b_y(idu_in[15])
		);

	sm83_xor_idu_h #(
			.L_y(562.8847 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit012_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst0 (
			.in1(idu_in[8]),
			.in2(idu_cpl_mask[8]),
			.y(idu_out[8])
		);

	sm83_xor_idu_h #(
			.L_y(562.8846 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit012_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst1 (
			.in1(idu_in[9]),
			.in2(idu_cpl_mask[9]),
			.y(idu_out[9])
		);

	sm83_xor_idu_h #(
			.L_y(563.0115 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit012_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst2 (
			.in1(idu_in[10]),
			.in2(idu_cpl_mask[10]),
			.y(idu_out[10])
		);

	sm83_xor_idu_h #(
			.L_y(564.0886 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit345_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst3 (
			.in1(idu_in[11]),
			.in2(idu_cpl_mask[11]),
			.y(idu_out[11])
		);

	sm83_xor_idu_h #(
			.L_y(563.5818 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit345_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst4 (
			.in1(idu_in[12]),
			.in2(idu_cpl_mask[12]),
			.y(idu_out[12])
		);

	sm83_xor_idu_h #(
			.L_y(563.9619 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit345_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst5 (
			.in1(idu_in[13]),
			.in2(idu_cpl_mask[13]),
			.y(idu_out[13])
		);

	sm83_xor_idu_h #(
			.L_y(563.0748 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit67_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit67_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst6 (
			.in1(idu_in[14]),
			.in2(idu_cpl_mask[14]),
			.y(idu_out[14])
		);

	sm83_xor_idu_h #(
			.L_y(563.5184 + sm83_xor_idu_h_param::L_y + sm83_reg_pc_out_bit67_param::L_in17 + sm83_reg_sp_out_param::L_in18 + sm83_reg_wz_out_param::L_aoi_b_in3_muxi_b_d1),
			.W_gate_y(sm83_reg_pc_out_bit67_param::W_gate_in17 + sm83_reg_sp_out_param::W_gate_in18 + sm83_reg_wz_out_param::W_gate_aoi_b_in3_muxi_b_d1)
		) idu_xor_h_inst7 (
			.in1(idu_in[15]),
			.in2(idu_cpl_mask[15]),
			.y(idu_out[15])
		);

	sm83_xor_idu_l #(
			.L_y(683.1409 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit012_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst0 (
			.in1(idu_in[0]),
			.in2(idu_cpl_mask[0]),
			.y(idu_out[0])
		);

	sm83_xor_idu_l #(
			.L_y(683.0775 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit012_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst1 (
			.in1(idu_in[1]),
			.in2(idu_cpl_mask[1]),
			.y(idu_out[1])
		);

	sm83_xor_idu_l #(
			.L_y(682.7608 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit012_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit012_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst2 (
			.in1(idu_in[2]),
			.in2(idu_cpl_mask[2]),
			.y(idu_out[2])
		);

	sm83_xor_idu_l #(
			.L_y(684.6615 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit345_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst3 (
			.in1(idu_in[3]),
			.in2(idu_cpl_mask[3]),
			.y(idu_out[3])
		);

	sm83_xor_idu_l #(
			.L_y(683.3942 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit345_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst4 (
			.in1(idu_in[4]),
			.in2(idu_cpl_mask[4]),
			.y(idu_out[4])
		);

	sm83_xor_idu_l #(
			.L_y(684.6616 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit345_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit345_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst5 (
			.in1(idu_in[5]),
			.in2(idu_cpl_mask[5]),
			.y(idu_out[5])
		);

	sm83_xor_idu_l #(
			.L_y(684.2812 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit67_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit67_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst6 (
			.in1(idu_in[6]),
			.in2(idu_cpl_mask[6]),
			.y(idu_out[6])
		);

	sm83_xor_idu_l #(
			.L_y(684.218 + sm83_xor_idu_l_param::L_y + sm83_reg_pc_out_bit67_param::L_in14 + sm83_reg_sp_out_param::L_in19 + sm83_reg_wz_out_param::L_aoi_a_in3_muxi_a_d1),
			.W_gate_y(sm83_reg_pc_out_bit67_param::W_gate_in14 + sm83_reg_sp_out_param::W_gate_in19 + sm83_reg_wz_out_param::W_gate_aoi_a_in3_muxi_a_d1)
		) idu_xor_l_inst7 (
			.in1(idu_in[7]),
			.in2(idu_cpl_mask[7]),
			.y(idu_out[7])
		);

	sm83_and2_irq #(
			.L_y(863.3351 + sm83_and2_irq_param::L_y + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk_n + sm83_not_reg_ie_we_param::L_in),
			.W_gate_y(sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk_n + sm83_not_reg_ie_we_param::W_gate_in)
		) irq_and_inst (
			.in1(ffff),
			.in2(ctl_mwrite),
			.y(ie_we)
		);

	sm83_not5_irq #(
			.L_a_y(669.772 + sm83_not5_irq_param::L_a_y + sm83_nand2_c_param::L_in1),
			.W_gate_a_y(sm83_nand2_c_param::W_gate_in1),
			.L_b_y(655.7697 + sm83_not5_irq_param::L_b_y + sm83_irq_prio_bit0_param::L_nand_b_in2 + sm83_irq_prio_bit1_param::L_nand_b_in2 + sm83_irq_prio_bit2_param::L_nand_b_in2 + sm83_irq_prio_bit3_param::L_nand_b_in2 + sm83_irq_prio_bit4_param::L_nand_b_in2 + sm83_irq_prio_bit5_param::L_nand_b_in2 + sm83_irq_prio_bit6_param::L_nand_b_in2 + sm83_irq_prio_bit7_param::L_nand_b_in2),
			.W_gate_b_y(sm83_irq_prio_bit0_param::W_gate_nand_b_in2 + sm83_irq_prio_bit1_param::W_gate_nand_b_in2 + sm83_irq_prio_bit2_param::W_gate_nand_b_in2 + sm83_irq_prio_bit3_param::W_gate_nand_b_in2 + sm83_irq_prio_bit4_param::W_gate_nand_b_in2 + sm83_irq_prio_bit5_param::W_gate_nand_b_in2 + sm83_irq_prio_bit6_param::W_gate_nand_b_in2 + sm83_irq_prio_bit7_param::W_gate_nand_b_in2),
			.L_c_y(1019.579 + sm83_not5_irq_param::L_c_y + sm83_dff_cc_q_param::L_d),
			.W_gate_c_y(sm83_dff_cc_q_param::W_gate_d),
			.L_d_y(L_ffxx),
			.W_gate_d_y(W_gate_ffxx + sm83_irq_prio_bit0_param::W_gate_dist_nand_a_in1),
			.L_e_y(858.076 + sm83_not5_irq_param::L_e_y + sm83_and2_irq_param::L_in1 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2 + sm83_nand2_nand3_od_irq_param::L_b_in2),
			.W_gate_e_y(sm83_and2_irq_param::W_gate_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2 + sm83_nand2_nand3_od_irq_param::W_gate_b_in2)
		) irq_head_inst (
			.a_in(irq_prio_nand_a_y),
			.a_y(int_take),
			.b_in(nmi_entry),
			.b_y(nmi_entry_n),
			.c_in(irq_prio_dist_nor_y),
			.c_y(int_pending),
			.d_in(irq_prio_dist_nand_b_y),
			.d_y(ffxx),
			.e_in(irq_prio_dist_nand_a_y),
			.e_y(ffff)
		);

	sm83_dlatch_ee_irq #(
			.L_q(561.3008 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit1_param::L_nand_b_in3 + sm83_irq_prio_bit2_param::L_nand_b_in4 + sm83_irq_prio_bit3_param::L_nand_b_in5 + sm83_irq_prio_bit4_param::L_nand_b_in6 + sm83_irq_prio_bit5_param::L_nand_b_in7 + sm83_irq_prio_bit6_param::L_nand_b_in8 + sm83_irq_prio_bit7_param::L_nand_b_in9),
			.W_gate_q(sm83_irq_prio_bit1_param::W_gate_nand_b_in3 + sm83_irq_prio_bit2_param::W_gate_nand_b_in4 + sm83_irq_prio_bit3_param::W_gate_nand_b_in5 + sm83_irq_prio_bit4_param::W_gate_nand_b_in6 + sm83_irq_prio_bit5_param::W_gate_nand_b_in7 + sm83_irq_prio_bit6_param::W_gate_nand_b_in8 + sm83_irq_prio_bit7_param::W_gate_nand_b_in9),
			.L_q_n(160.8694 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit0_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit0_param::W_gate_dist_nor_in),
			.L_gated_q_n(111.069 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit0_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit0_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(489.1978 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit2_param::L_nand_b_in3 + sm83_irq_prio_bit3_param::L_nand_b_in4 + sm83_irq_prio_bit4_param::L_nand_b_in5 + sm83_irq_prio_bit5_param::L_nand_b_in6 + sm83_irq_prio_bit6_param::L_nand_b_in7 + sm83_irq_prio_bit7_param::L_nand_b_in8),
			.W_gate_q(sm83_irq_prio_bit2_param::W_gate_nand_b_in3 + sm83_irq_prio_bit3_param::W_gate_nand_b_in4 + sm83_irq_prio_bit4_param::W_gate_nand_b_in5 + sm83_irq_prio_bit5_param::W_gate_nand_b_in6 + sm83_irq_prio_bit6_param::W_gate_nand_b_in7 + sm83_irq_prio_bit7_param::W_gate_nand_b_in8),
			.L_q_n(161.1864 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit1_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit1_param::W_gate_dist_nor_in),
			.L_gated_q_n(110.942 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit1_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit1_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(417.1582 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit3_param::L_nand_b_in3 + sm83_irq_prio_bit4_param::L_nand_b_in4 + sm83_irq_prio_bit5_param::L_nand_b_in5 + sm83_irq_prio_bit6_param::L_nand_b_in6 + sm83_irq_prio_bit7_param::L_nand_b_in7),
			.W_gate_q(sm83_irq_prio_bit3_param::W_gate_nand_b_in3 + sm83_irq_prio_bit4_param::W_gate_nand_b_in4 + sm83_irq_prio_bit5_param::W_gate_nand_b_in5 + sm83_irq_prio_bit6_param::W_gate_nand_b_in6 + sm83_irq_prio_bit7_param::W_gate_nand_b_in7),
			.L_q_n(162.3268 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit2_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit2_param::W_gate_dist_nor_in),
			.L_gated_q_n(111.7659 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit2_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit2_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(345.3086 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit4_param::L_nand_b_in3 + sm83_irq_prio_bit5_param::L_nand_b_in4 + sm83_irq_prio_bit6_param::L_nand_b_in5 + sm83_irq_prio_bit7_param::L_nand_b_in6),
			.W_gate_q(sm83_irq_prio_bit4_param::W_gate_nand_b_in3 + sm83_irq_prio_bit5_param::W_gate_nand_b_in4 + sm83_irq_prio_bit6_param::W_gate_nand_b_in5 + sm83_irq_prio_bit7_param::W_gate_nand_b_in6),
			.L_q_n(161.0596 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit3_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit3_param::W_gate_dist_nor_in),
			.L_gated_q_n(111.2591 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit3_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit3_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(270.3546 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit5_param::L_nand_b_in3 + sm83_irq_prio_bit6_param::L_nand_b_in4 + sm83_irq_prio_bit7_param::L_nand_b_in5),
			.W_gate_q(sm83_irq_prio_bit5_param::W_gate_nand_b_in3 + sm83_irq_prio_bit6_param::W_gate_nand_b_in4 + sm83_irq_prio_bit7_param::W_gate_nand_b_in5),
			.L_q_n(161.8834 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit4_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit4_param::W_gate_dist_nor_in),
			.L_gated_q_n(111.1957 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit4_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit4_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(196.9843 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit6_param::L_nand_b_in3 + sm83_irq_prio_bit7_param::L_nand_b_in4),
			.W_gate_q(sm83_irq_prio_bit6_param::W_gate_nand_b_in3 + sm83_irq_prio_bit7_param::W_gate_nand_b_in4),
			.L_q_n(161.2496 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit5_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit5_param::W_gate_dist_nor_in),
			.L_gated_q_n(112.1461 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit5_param::L_and_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit5_param::W_gate_and_in2_nand_a_in2)
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
			.L_q(122.2202 + sm83_dlatch_ee_irq_param::L_q + sm83_irq_prio_bit7_param::L_nand_b_in3),
			.W_gate_q(sm83_irq_prio_bit7_param::W_gate_nand_b_in3),
			.L_q_n(161.9467 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit6_param::L_dist_nor_in),
			.W_gate_q_n(sm83_irq_prio_bit6_param::W_gate_dist_nor_in),
			.L_gated_q_n(117.8484 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit6_param::L_and_a_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit6_param::W_gate_and_a_in2_nand_a_in2)
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
			.L_q_n(161.7565 + sm83_dlatch_ee_irq_param::L_q_n + sm83_irq_prio_bit7_param::L_dist_nor_in2),
			.W_gate_q_n(sm83_irq_prio_bit7_param::W_gate_dist_nor_in2),
			.L_gated_q_n(114.7438 + sm83_dlatch_ee_irq_param::L_gated_q_n + sm83_irq_prio_bit7_param::L_and_a_in2_nand_a_in2),
			.W_gate_gated_q_n(sm83_irq_prio_bit7_param::W_gate_and_a_in2_nand_a_in2)
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
			.L_a_y(74.19398 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db0),
			.W_gate_b_y(W_gate_db0)
		) irq_nand2_nand3_inst0 (
			.a_in1(reg_ie[0]),
			.a_in2(\int [0]),
			.a_y(irq_nand2_nand3[0]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[0]),
			.b_y(db[0])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.76408 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db1),
			.W_gate_b_y(W_gate_db1)
		) irq_nand2_nand3_inst1 (
			.a_in1(reg_ie[1]),
			.a_in2(\int [1]),
			.a_y(irq_nand2_nand3[1]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[1]),
			.b_y(db[1])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.44727 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db2),
			.W_gate_b_y(W_gate_db2)
		) irq_nand2_nand3_inst2 (
			.a_in1(reg_ie[2]),
			.a_in2(\int [2]),
			.a_y(irq_nand2_nand3[2]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[2]),
			.b_y(db[2])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.89084 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db3),
			.W_gate_b_y(W_gate_db3)
		) irq_nand2_nand3_inst3 (
			.a_in1(reg_ie[3]),
			.a_in2(\int [3]),
			.a_y(irq_nand2_nand3[3]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[3]),
			.b_y(db[3])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.13046 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db4),
			.W_gate_b_y(W_gate_db4)
		) irq_nand2_nand3_inst4 (
			.a_in1(reg_ie[4]),
			.a_in2(\int [4]),
			.a_y(irq_nand2_nand3[4]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[4]),
			.b_y(db[4])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.19378 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db5),
			.W_gate_b_y(W_gate_db5)
		) irq_nand2_nand3_inst5 (
			.a_in1(reg_ie[5]),
			.a_in2(\int [5]),
			.a_y(irq_nand2_nand3[5]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[5]),
			.b_y(db[5])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.5106 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db6),
			.W_gate_b_y(W_gate_db6)
		) irq_nand2_nand3_inst6 (
			.a_in1(reg_ie[6]),
			.a_in2(\int [6]),
			.a_y(irq_nand2_nand3[6]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[6]),
			.b_y(db[6])
		);

	sm83_nand2_nand3_od_irq #(
			.L_a_y(74.63734 + sm83_nand2_nand3_od_irq_param::L_a_y + sm83_dlatch_ee_irq_param::L_d),
			.W_gate_a_y(sm83_dlatch_ee_irq_param::W_gate_d),
			.L_b_y(L_db7),
			.W_gate_b_y(W_gate_db7)
		) irq_nand2_nand3_inst7 (
			.a_in1(reg_ie[7]),
			.a_in2(\int [7]),
			.a_y(irq_nand2_nand3[7]),
			.b_in1(rd),
			.b_in2(ffff),
			.b_in3(reg_ie_n[7]),
			.b_y(db[7])
		);

	sm83_irq_prio_bit0 #(
			.L_and_y(L_inta0),
			.W_gate_and_y(W_gate_inta0),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(28.00484 + sm83_irq_prio_bit0_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_dist_nand_a_y_n(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_n(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_n(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_p(sm83_not5_irq_param::W_gate_c_in)
		) irq_prio_inst0 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[0]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[0]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_y(W_gate_inta1),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.597758 + sm83_irq_prio_bit1_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(502.3766 + sm83_irq_prio_bit1_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_d_y + sm83_irq_prio_bit5_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_e_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit3_param::W_gate_nand_d_y),
			.L_dist_nand_a_y_n(25.15368 + sm83_irq_prio_bit1_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit0_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(68.30141 + sm83_irq_prio_bit1_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit0_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(70.70909 + sm83_irq_prio_bit1_param::L_dist_nor_y_p + sm83_irq_prio_bit0_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit0_param::W_gate_dist_nor_in_p)
		) irq_prio_inst1 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[1]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[1]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_y(W_gate_inta2),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.407687 + sm83_irq_prio_bit2_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(417.3482 + sm83_irq_prio_bit2_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_c_y + sm83_irq_prio_bit4_param::L_not_in + sm83_irq_prio_bit6_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_d_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit4_param::W_gate_not_in),
			.L_dist_nand_a_y_n(71.08923 + sm83_irq_prio_bit2_param::L_dist_nand_a_y_n + sm83_irq_prio_bit1_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit1_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(68.11134 + sm83_irq_prio_bit2_param::L_dist_nand_b_y_n + sm83_irq_prio_bit1_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit1_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(70.58234 + sm83_irq_prio_bit2_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit1_param::W_gate_dist_nor_in_p)
		) irq_prio_inst2 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[2]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[2]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_y(W_gate_inta3),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.090871 + sm83_irq_prio_bit3_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(417.3482 + sm83_irq_prio_bit2_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_c_y + sm83_irq_prio_bit4_param::L_not_in + sm83_irq_prio_bit6_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_d_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit4_param::W_gate_not_in),
			.L_nand_d_y(502.3766 + sm83_irq_prio_bit1_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_d_y + sm83_irq_prio_bit5_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_e_y),
			.W_gate_nand_d_y(sm83_irq_prio_bit3_param::W_gate_nand_d_y),
			.L_nand_d_y_n(404.4863 + sm83_irq_prio_bit3_param::L_nand_d_y_n + sm83_reg_pc_out_bit345_param::L_in18),
			.W_gate_nand_d_y_n(sm83_reg_pc_out_bit345_param::W_gate_in18),
			.L_dist_nand_a_y_n(70.58234 + sm83_irq_prio_bit3_param::L_dist_nand_a_y_n + sm83_irq_prio_bit2_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit2_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(68.30141 + sm83_irq_prio_bit3_param::L_dist_nand_b_y_n + sm83_irq_prio_bit2_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit2_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(70.83584 + sm83_irq_prio_bit3_param::L_dist_nor_y_p + sm83_irq_prio_bit2_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit2_param::W_gate_dist_nor_in_p)
		) irq_prio_inst3 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[3]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[3]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_y(W_gate_inta4),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.661082 + sm83_irq_prio_bit4_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(254.7048 + sm83_irq_prio_bit4_param::L_nand_c_y + sm83_irq_prio_bit5_param::L_nand_c_y + sm83_irq_prio_bit6_param::L_nand_c_y + sm83_irq_prio_bit7_param::L_nand_c_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit5_param::W_gate_nand_c_y),
			.L_not_in(417.3482 + sm83_irq_prio_bit2_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_c_y + sm83_irq_prio_bit4_param::L_not_in + sm83_irq_prio_bit6_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_d_y),
			.W_gate_not_in(sm83_irq_prio_bit4_param::W_gate_not_in),
			.L_not_y(404.4228 + sm83_irq_prio_bit4_param::L_not_y + sm83_reg_pc_out_bit345_param::L_in18),
			.W_gate_not_y(sm83_reg_pc_out_bit345_param::W_gate_in18),
			.L_dist_nand_a_y_n(72.73654 + sm83_irq_prio_bit4_param::L_dist_nand_a_y_n + sm83_irq_prio_bit3_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit3_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(70.58234 + sm83_irq_prio_bit4_param::L_dist_nand_b_y_n + sm83_irq_prio_bit3_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit3_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(72.99004 + sm83_irq_prio_bit4_param::L_dist_nor_y_p + sm83_irq_prio_bit3_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit3_param::W_gate_dist_nor_in_p)
		) irq_prio_inst4 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[4]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[4]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_y(W_gate_inta5),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.471012 + sm83_irq_prio_bit5_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(254.7048 + sm83_irq_prio_bit4_param::L_nand_c_y + sm83_irq_prio_bit5_param::L_nand_c_y + sm83_irq_prio_bit6_param::L_nand_c_y + sm83_irq_prio_bit7_param::L_nand_c_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit5_param::W_gate_nand_c_y),
			.L_nand_c_y_n(404.5497 + sm83_irq_prio_bit5_param::L_nand_c_y_n + sm83_reg_pc_out_bit345_param::L_in18),
			.W_gate_nand_c_y_n(sm83_reg_pc_out_bit345_param::W_gate_in18),
			.L_nand_d_y(502.3766 + sm83_irq_prio_bit1_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_d_y + sm83_irq_prio_bit5_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_e_y),
			.W_gate_nand_d_y(sm83_irq_prio_bit3_param::W_gate_nand_d_y),
			.L_dist_nand_a_y_n(72.86329 + sm83_irq_prio_bit5_param::L_dist_nand_a_y_n + sm83_irq_prio_bit4_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit4_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(70.77242 + sm83_irq_prio_bit5_param::L_dist_nand_b_y_n + sm83_irq_prio_bit4_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit4_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(72.79996 + sm83_irq_prio_bit5_param::L_dist_nor_y_p + sm83_irq_prio_bit4_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit4_param::W_gate_dist_nor_in_p)
		) irq_prio_inst5 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_y(inta[5]),
			.and_in2_nand_a_in2(irq_latch_gated_q_n[5]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_a_y(W_gate_inta6),
			.L_and_b_y(394.919 + sm83_irq_prio_bit6_param::L_and_b_y + sm83_reg_pc_out_bit67_param::L_in18),
			.W_gate_and_b_y(sm83_reg_pc_out_bit67_param::W_gate_in18),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(2.851153 + sm83_irq_prio_bit6_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(254.7048 + sm83_irq_prio_bit4_param::L_nand_c_y + sm83_irq_prio_bit5_param::L_nand_c_y + sm83_irq_prio_bit6_param::L_nand_c_y + sm83_irq_prio_bit7_param::L_nand_c_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit5_param::W_gate_nand_c_y),
			.L_nand_d_y(417.3482 + sm83_irq_prio_bit2_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_c_y + sm83_irq_prio_bit4_param::L_not_in + sm83_irq_prio_bit6_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_d_y),
			.W_gate_nand_d_y(sm83_irq_prio_bit4_param::W_gate_not_in),
			.L_dist_nand_a_y_n(72.99004 + sm83_irq_prio_bit6_param::L_dist_nand_a_y_n + sm83_irq_prio_bit5_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit5_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(70.51902 + sm83_irq_prio_bit6_param::L_dist_nand_b_y_n + sm83_irq_prio_bit5_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit5_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(73.43349 + sm83_irq_prio_bit6_param::L_dist_nor_y_p + sm83_irq_prio_bit5_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit5_param::W_gate_dist_nor_in_p)
		) irq_prio_inst6 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_a_y(inta[6]),
			.and_b_y(int_vector6),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n[6]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.W_gate_and_a_y(W_gate_inta7),
			.L_and_b_y(394.7289 + sm83_irq_prio_bit7_param::L_and_b_y + sm83_reg_pc_out_bit67_param::L_in18),
			.W_gate_and_b_y(sm83_reg_pc_out_bit67_param::W_gate_in18),
			.L_nand_a_y(607.9968 + sm83_irq_prio_bit0_param::L_nand_a_y + sm83_irq_prio_bit1_param::L_nand_a_y + sm83_irq_prio_bit2_param::L_nand_a_y + sm83_irq_prio_bit3_param::L_nand_a_y + sm83_irq_prio_bit4_param::L_nand_a_y + sm83_irq_prio_bit5_param::L_nand_a_y + sm83_irq_prio_bit6_param::L_nand_a_y + sm83_irq_prio_bit7_param::L_nand_a_y + sm83_not5_irq_param::L_a_in),
			.W_gate_nand_a_y(sm83_irq_prio_bit6_param::W_gate_nand_a_y + sm83_not5_irq_param::W_gate_a_in),
			.L_nand_b_y(3.041223 + sm83_irq_prio_bit7_param::L_nand_b_y + sm83_dlatch_ee_irq_param::L_ena_q_n),
			.W_gate_nand_b_y(sm83_dlatch_ee_irq_param::W_gate_ena_q_n),
			.L_nand_c_y(254.7048 + sm83_irq_prio_bit4_param::L_nand_c_y + sm83_irq_prio_bit5_param::L_nand_c_y + sm83_irq_prio_bit6_param::L_nand_c_y + sm83_irq_prio_bit7_param::L_nand_c_y),
			.W_gate_nand_c_y(sm83_irq_prio_bit5_param::W_gate_nand_c_y),
			.L_nand_d_y(417.3482 + sm83_irq_prio_bit2_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_c_y + sm83_irq_prio_bit4_param::L_not_in + sm83_irq_prio_bit6_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_d_y),
			.W_gate_nand_d_y(sm83_irq_prio_bit4_param::W_gate_not_in),
			.L_nand_e_y(502.3766 + sm83_irq_prio_bit1_param::L_nand_c_y + sm83_irq_prio_bit3_param::L_nand_d_y + sm83_irq_prio_bit5_param::L_nand_d_y + sm83_irq_prio_bit7_param::L_nand_e_y),
			.W_gate_nand_e_y(sm83_irq_prio_bit3_param::W_gate_nand_d_y),
			.L_dist_nand_a_y_n(72.73654 + sm83_irq_prio_bit7_param::L_dist_nand_a_y_n + sm83_irq_prio_bit6_param::L_dist_nand_a_in_n),
			.W_gate_dist_nand_a_y_n(sm83_irq_prio_bit6_param::W_gate_dist_nand_a_in_n),
			.L_dist_nand_a_y_p(638.7894 + sm83_irq_prio_bit0_param::L_dist_nand_a_y_n + sm83_irq_prio_bit0_param::L_dist_nand_a_y_p + sm83_irq_prio_bit1_param::L_dist_nand_a_y_p + sm83_irq_prio_bit2_param::L_dist_nand_a_y_p + sm83_irq_prio_bit3_param::L_dist_nand_a_y_p + sm83_irq_prio_bit4_param::L_dist_nand_a_y_p + sm83_irq_prio_bit5_param::L_dist_nand_a_y_p + sm83_irq_prio_bit6_param::L_dist_nand_a_y_p + sm83_irq_prio_bit7_param::L_dist_nand_a_y_p + sm83_not5_irq_param::L_e_in),
			.W_gate_dist_nand_a_y_p(sm83_not5_irq_param::W_gate_e_in),
			.L_dist_nand_b_y_n(73.1801 + sm83_irq_prio_bit7_param::L_dist_nand_b_y_n + sm83_irq_prio_bit6_param::L_dist_nand_b_in_n),
			.W_gate_dist_nand_b_y_n(sm83_irq_prio_bit6_param::W_gate_dist_nand_b_in_n),
			.L_dist_nand_b_y_p(711.0825 + sm83_irq_prio_bit0_param::L_dist_nand_b_y_n + sm83_irq_prio_bit0_param::L_dist_nand_b_y_p + sm83_irq_prio_bit1_param::L_dist_nand_b_y_p + sm83_irq_prio_bit2_param::L_dist_nand_b_y_p + sm83_irq_prio_bit3_param::L_dist_nand_b_y_p + sm83_irq_prio_bit4_param::L_dist_nand_b_y_p + sm83_irq_prio_bit5_param::L_dist_nand_b_y_p + sm83_irq_prio_bit6_param::L_dist_nand_b_y_p + sm83_irq_prio_bit7_param::L_dist_nand_b_y_p + sm83_not5_irq_param::L_d_in),
			.W_gate_dist_nand_b_y_p(sm83_not5_irq_param::W_gate_d_in),
			.L_dist_nor_y_n(764.9379 + sm83_irq_prio_bit0_param::L_dist_nor_y_n + sm83_irq_prio_bit0_param::L_dist_nor_y_p + sm83_irq_prio_bit1_param::L_dist_nor_y_n + sm83_irq_prio_bit2_param::L_dist_nor_y_n + sm83_irq_prio_bit3_param::L_dist_nor_y_n + sm83_irq_prio_bit4_param::L_dist_nor_y_n + sm83_irq_prio_bit5_param::L_dist_nor_y_n + sm83_irq_prio_bit6_param::L_dist_nor_y_n + sm83_irq_prio_bit7_param::L_dist_nor_y_n + sm83_not5_irq_param::L_c_in),
			.W_gate_dist_nor_y_n(sm83_not5_irq_param::W_gate_c_in),
			.L_dist_nor_y_p(73.49692 + sm83_irq_prio_bit7_param::L_dist_nor_y_p + sm83_irq_prio_bit6_param::L_dist_nor_in_p),
			.W_gate_dist_nor_y_p(sm83_irq_prio_bit6_param::W_gate_dist_nor_in_p)
		) irq_prio_inst7 (
			.pch_n(write_phase),
			.and_in1(ctl_int_entry_m6),
			.and_a_y(inta[7]),
			.and_b_y(int_vector7),
			.and_a_in2_nand_a_in2(irq_latch_gated_q_n[7]),
			.nand_a_y(irq_prio_nand_a_y),
			.nand_b_in2(nmi_entry_n),
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
			.L_q(184.6292 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in)
		) reg_a_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[0])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(539.1253 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_oa21_reg_param::L_in1),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_oa21_reg_param::W_gate_in1)
		) reg_a_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[1])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(460.8139 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_oa21_reg_param::L_in2),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_oa21_reg_param::W_gate_in2)
		) reg_a_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[2])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(387.5061 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_oa21_reg_param::L_in3),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_oa21_reg_param::W_gate_in3)
		) reg_a_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[3])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(538.6149 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_and2_reg_param::L_in2),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_and2_reg_param::W_gate_in2)
		) reg_a_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[4])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(201.2294 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_oa21_reg_param::L_in1),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_oa21_reg_param::W_gate_in1)
		) reg_a_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[5])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(390.6741 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_oa21_reg_param::L_in2),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_oa21_reg_param::W_gate_in2)
		) reg_a_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[6])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(486.4894 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_reg_a_out_param::L_in + sm83_and2_reg_param::L_in1 + sm83_oa21_reg_param::L_in3),
			.W_gate_q(sm83_reg_a_out_param::W_gate_in + sm83_and2_reg_param::W_gate_in1 + sm83_oa21_reg_param::W_gate_in3)
		) reg_a_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_a_we_buf_n),
			.clk_n(ctl_reg_a_we),
			.q(reg_a[7])
		);

	sm83_not_reg_a_we #(
			.L_y(638.3466 + sm83_not_reg_a_we_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk)
		) reg_a_not_we_inst (
			.in(ctl_reg_a_we),
			.y(ctl_reg_a_we_buf_n)
		);

	sm83_reg_a_out #(
			.L_a_y(1165.813 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
		) reg_a_out_inst0 (
			.in(reg_a[0]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[0]),
			.b_y(op2bus_n[0])
		);

	sm83_reg_a_out #(
			.L_a_y(1165.75 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
		) reg_a_out_inst1 (
			.in(reg_a[1]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[1]),
			.b_y(op2bus_n[1])
		);

	sm83_reg_a_out #(
			.L_a_y(1166.447 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
		) reg_a_out_inst2 (
			.in(reg_a[2]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[2]),
			.b_y(op2bus_n[2])
		);

	sm83_reg_a_out #(
			.L_a_y(1164.292 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
		) reg_a_out_inst3 (
			.in(reg_a[3]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[3]),
			.b_y(op2bus_n[3])
		);

	sm83_reg_a_out #(
			.L_a_y(1163.722 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit4_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit4_param::W_gate_b_y),
			.L_b_y(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y)
		) reg_a_out_inst4 (
			.in(reg_a[4]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[4]),
			.b_y(op2bus_n[4])
		);

	sm83_reg_a_out #(
			.L_a_y(1163.785 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit5_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit5_param::W_gate_b_y),
			.L_b_y(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y)
		) reg_a_out_inst5 (
			.in(reg_a[5]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[5]),
			.b_y(op2bus_n[5])
		);

	sm83_reg_a_out #(
			.L_a_y(1165.876 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit6_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit6_param::W_gate_b_y),
			.L_b_y(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y)
		) reg_a_out_inst6 (
			.in(reg_a[6]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[6]),
			.b_y(op2bus_n[6])
		);

	sm83_reg_a_out #(
			.L_a_y(1164.609 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit7_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit7_param::W_gate_b_y),
			.L_b_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y)
		) reg_a_out_inst7 (
			.in(reg_a[7]),
			.a_ena(ctl_op_alu_buf),
			.b_ena(ctl_reg_a_to_op2_en),
			.a_y(op1bus_n[7]),
			.b_y(op2bus_n[7])
		);

	sm83_and2_reg #(
			.L_y(1850.822 + sm83_and2_reg_param::L_y + sm83_alu_decoder_param::L_in66),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in66)
		) reg_and_inst (
			.in1(reg_a[7]),
			.in2(reg_a[4]),
			.y(daa_hi_ge9)
		);

	sm83_and2_and3_reg #(
			.L_a_y(652.0952 + sm83_and2_and3_reg_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_c_zero + sm83_reg_bus_pch_a_bit0123_param::L_c_zero + sm83_reg_bus_pch_a_bit0123_param::L_c_zero + sm83_reg_bus_pch_a_bit0123_param::L_c_zero + sm83_reg_bus_pch_a_bit4_param::L_c_zero_a + sm83_reg_bus_pch_a_bit5_param::L_c_zero_a + sm83_reg_bus_pch_a_bit6_param::L_c_zero_a + sm83_reg_bus_pch_a_bit7_param::L_c_zero_a),
			.W_gate_a_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_zero + sm83_reg_bus_pch_a_bit0123_param::W_gate_c_zero + sm83_reg_bus_pch_a_bit0123_param::W_gate_c_zero + sm83_reg_bus_pch_a_bit0123_param::W_gate_c_zero + sm83_reg_bus_pch_a_bit4_param::W_gate_c_zero_a + sm83_reg_bus_pch_a_bit5_param::W_gate_c_zero_a + sm83_reg_bus_pch_a_bit6_param::W_gate_c_zero_a + sm83_reg_bus_pch_a_bit7_param::W_gate_c_zero_a),
			.L_b_y(644.8724 + sm83_and2_and3_reg_param::L_b_y + sm83_reg_bus_pch_a_bit4_param::L_c_zero_b1 + sm83_reg_bus_pch_a_bit5_param::L_c_zero_b1 + sm83_reg_bus_pch_a_bit6_param::L_c_zero_b1 + sm83_reg_bus_pch_a_bit7_param::L_c_zero_b1),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit4_param::W_gate_c_zero_b1 + sm83_reg_bus_pch_a_bit5_param::W_gate_c_zero_b1 + sm83_reg_bus_pch_a_bit6_param::W_gate_c_zero_b1 + sm83_reg_bus_pch_a_bit7_param::W_gate_c_zero_b1)
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
			.L_q(79.45262 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(81.03665 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.27632 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.38934 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.02293 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.76939 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(79.26254 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(80.46649 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_b_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_b_in)
		) reg_b_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_b_we_buf_n),
			.clk_n(ctl_reg_b_we),
			.q(reg_b[7])
		);

	sm83_not_reg_b_we #(
			.L_y(638.8528 + sm83_not_reg_b_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_b_not_we_inst (
			.in(ctl_reg_b_we),
			.y(ctl_reg_b_we_buf_n)
		);

	sm83_reg_bc_out #(
			.L_c_y1(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_c_y1(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_c_y1(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_c_y1(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_c_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y)
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
			.L_c_y1(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y)
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
			.L_c_y1(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y)
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
			.L_c_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_c_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y1(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y)
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
			.W_gate_a_y(W_gate_db0),
			.L_b_y(1165.813 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y_n(516.7595 + sm83_reg_bus_pch_a_bit0123_param::L_b_y_n + sm83_alu_decoder_param::L_in1),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in1),
			.L_c_y(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_c_y_n(1218.077 + sm83_reg_bus_pch_a_bit0123_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d0 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d0 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db1),
			.L_b_y(1165.75 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y_n(699.2974 + sm83_reg_bus_pch_a_bit0123_param::L_b_y_n + sm83_alu_decoder_param::L_in6),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in6),
			.L_c_y(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_c_y_n(1207.127 + sm83_reg_bus_pch_a_bit0123_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d1 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d1 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db2),
			.L_b_y(1166.447 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y_n(772.8579 + sm83_reg_bus_pch_a_bit0123_param::L_b_y_n + sm83_alu_decoder_param::L_in7),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in7),
			.L_c_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_c_y_n(1314.233 + sm83_reg_bus_pch_a_bit0123_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d2 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d2 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db3),
			.L_b_y(1164.292 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_b_y_n(845.4044 + sm83_reg_bus_pch_a_bit0123_param::L_b_y_n + sm83_alu_decoder_param::L_in8),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in8),
			.L_c_y(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_c_y_n(1438.06 + sm83_reg_bus_pch_a_bit0123_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d3 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d3 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db4),
			.L_b_y(1163.722 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit4_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit4_param::W_gate_b_y),
			.L_b_y_n(953.5588 + sm83_reg_bus_pch_a_bit4_param::L_b_y_n + sm83_alu_decoder_param::L_in9),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in9),
			.L_c_y(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y),
			.L_c_y_n(1383.86 + sm83_reg_bus_pch_a_bit4_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d4 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d4 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db5),
			.L_b_y(1163.785 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit5_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit5_param::W_gate_b_y),
			.L_b_y_n(1066.973 + sm83_reg_bus_pch_a_bit5_param::L_b_y_n + sm83_alu_decoder_param::L_in12),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in12),
			.L_c_y(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y),
			.L_c_y_n(1500.013 + sm83_reg_bus_pch_a_bit5_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d5 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d5 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db6),
			.L_b_y(1165.876 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit6_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit6_param::W_gate_b_y),
			.L_b_y_n(1160.681 + sm83_reg_bus_pch_a_bit6_param::L_b_y_n + sm83_alu_decoder_param::L_in13),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in13),
			.L_c_y(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y),
			.L_c_y_n(1694.116 + sm83_reg_bus_pch_a_bit6_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d6 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d6 + sm83_not_dbus_param::W_gate_in)
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
			.W_gate_a_y(W_gate_db7),
			.L_b_y(1164.609 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit7_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_b_y(sm83_reg_bus_pch_a_bit7_param::W_gate_b_y),
			.L_b_y_n(1232.847 + sm83_reg_bus_pch_a_bit7_param::L_b_y_n + sm83_alu_decoder_param::L_in14),
			.W_gate_b_y_n(sm83_alu_decoder_param::W_gate_in14),
			.L_c_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_c_y(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y),
			.L_c_y_n(1698.424 + sm83_reg_bus_pch_a_bit7_param::L_c_y_n + sm83_alu_pggen_param::L_xor_in1 + sm83_alu_shifter_param::L_d7 + sm83_not_dbus_param::L_in),
			.W_gate_c_y_n(sm83_alu_pggen_param::W_gate_xor_in1 + sm83_alu_shifter_param::W_gate_d7 + sm83_not_dbus_param::W_gate_in)
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
			.L_a_y(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst0 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[0]),
			.b_y(idu_in_n[8])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst1 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[1]),
			.b_y(idu_in_n[9])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst2 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[2]),
			.b_y(idu_in_n[10])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst3 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[3]),
			.b_y(idu_in_n[11])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst4 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[4]),
			.b_y(idu_in_n[12])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst5 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[5]),
			.b_y(idu_in_n[13])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst6 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[6]),
			.b_y(idu_in_n[14])
		);

	sm83_reg_bus_pch_b #(
			.L_a_y(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_a_y(sm83_not2_idu_param::W_gate_a_in),
			.L_b_y(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_b_y(sm83_not2_idu_param::W_gate_b_in)
		) reg_bus_pch_b_inst7 (
			.pch_n(exec_phase),
			.a_y(idu_in_n[7]),
			.b_y(idu_in_n[15])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.07314 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.31286 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(56.13641 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.56615 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.50278 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.80587 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.7425 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(55.62962 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_bc_out_param::L_c_in),
			.W_gate_q(sm83_reg_bc_out_param::W_gate_c_in)
		) reg_c_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_c_we_buf_n),
			.clk_n(ctl_reg_c_we),
			.q(reg_c[7])
		);

	sm83_not_reg_we #(
			.L_y(638.7894 + sm83_not_reg_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_c_not_we_inst (
			.in(ctl_reg_c_we),
			.y(ctl_reg_c_we_buf_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.46407 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.2243 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.84406 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(66.78088 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.41447 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.09766 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.54112 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(67.22421 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_d_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_d_in)
		) reg_d_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_d_we_buf_n),
			.clk_n(ctl_reg_d_we),
			.q(reg_d[7])
		);

	sm83_not_reg_we #(
			.L_y(639.1063 + sm83_not_reg_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_d_not_we_inst (
			.in(ctl_reg_d_we),
			.y(ctl_reg_d_we_buf_n)
		);

	sm83_reg_de_out #(
			.L_e_y1(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_e_y1(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_e_y1(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_e_y1(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y)
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
			.L_e_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y)
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
			.L_e_y1(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y)
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
			.L_e_y1(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y)
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
			.L_e_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_e_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_d_y1(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_d_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y)
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
			.L_q(76.41145 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.8054 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.04498 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.48849 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.42517 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(77.55182 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(76.34798 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(75.65112 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_de_out_param::L_e_in),
			.W_gate_q(sm83_reg_de_out_param::W_gate_e_in)
		) reg_e_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_e_we_buf_n),
			.clk_n(ctl_reg_e_we),
			.q(reg_e[7])
		);

	sm83_not_reg_h_e_we #(
			.L_y(638.7262 + sm83_not_reg_h_e_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_e_not_we_inst (
			.in(ctl_reg_e_we),
			.y(ctl_reg_e_we_buf_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.00626 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst0 (
			.d(new_reg_hi[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.56268 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst1 (
			.d(new_reg_hi[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.06957 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst2 (
			.d(new_reg_hi[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.13294 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst3 (
			.d(new_reg_hi[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.32302 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst4 (
			.d(new_reg_hi[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(88.57643 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst5 (
			.d(new_reg_hi[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.87952 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst6 (
			.d(new_reg_hi[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(87.43596 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_h_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_h_in)
		) reg_h_inst7 (
			.d(new_reg_hi[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_h_we_buf_n),
			.clk_n(ctl_reg_h_we),
			.q(reg_h[7])
		);

	sm83_not_reg_h_e_we #(
			.L_y(638.9165 + sm83_not_reg_h_e_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_h_not_we_inst (
			.in(ctl_reg_h_we),
			.y(ctl_reg_h_we_buf_n)
		);

	sm83_reg_hl_out #(
			.L_l_y1(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y3(1165.813 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y)
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
			.L_l_y1(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y3(1165.75 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y)
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
			.L_l_y1(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y3(1166.447 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y)
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
			.L_l_y1(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y3(1164.292 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y)
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
			.L_l_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y),
			.L_y3(1163.722 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit4_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit4_param::W_gate_b_y)
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
			.L_l_y1(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y),
			.L_y3(1163.785 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit5_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit5_param::W_gate_b_y)
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
			.L_l_y1(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y),
			.L_y3(1165.876 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit6_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit6_param::W_gate_b_y)
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
			.L_l_y1(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_l_y1(sm83_not2_idu_param::W_gate_a_in),
			.L_h_y1(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_h_y1(sm83_not2_idu_param::W_gate_b_in),
			.L_y2(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y2(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y),
			.L_y3(1164.609 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit7_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y3(sm83_reg_bus_pch_a_bit7_param::W_gate_b_y)
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
			.L_q(148.6413 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.8873 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(148.9579 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.6971 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(149.0212 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(107.3308 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(150.7319 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.8872 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(150.8588 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.6339 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(149.9082 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.3804 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(150.7953 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(107.3941 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_q(150.0984 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q + sm83_nand2_nand3_od_irq_param::L_a_in1),
			.W_gate_q(sm83_nand2_nand3_od_irq_param::W_gate_a_in1),
			.L_q_n(106.7606 + sm83_dffr_cc_ee_reg_ie_bit_param::L_q_n + sm83_nand2_nand3_od_irq_param::L_b_in3),
			.W_gate_q_n(sm83_nand2_nand3_od_irq_param::W_gate_b_in3)
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
			.L_y(636.6985 + sm83_not_reg_ie_we_param::L_y + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk + sm83_dffr_cc_ee_reg_ie_bit_param::L_clk),
			.W_gate_y(sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk + sm83_dffr_cc_ee_reg_ie_bit_param::W_gate_clk)
		) reg_ie_not_we_inst (
			.in(ie_we),
			.y(ie_we_n)
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2979.35 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_a_param::L_in + sm83_decoder1_param::L_in7 + sm83_decoder3_param::L_in83),
			.W_gate_q(sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_a_param::W_gate_in + sm83_decoder1_param::W_gate_in7 + sm83_decoder3_param::W_gate_in83)
		) reg_ir_inst0 (
			.d(db[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[0])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3077.304 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_a_param::L_in + sm83_decoder1_param::L_in9 + sm83_decoder3_param::L_in82),
			.W_gate_q(sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_a_param::W_gate_in + sm83_decoder1_param::W_gate_in9 + sm83_decoder3_param::W_gate_in82)
		) reg_ir_inst1 (
			.d(db[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[1])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3186.978 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_b_param::L_in + sm83_decoder1_param::L_in11 + sm83_decoder3_param::L_in81),
			.W_gate_q(sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_b_param::W_gate_in + sm83_decoder1_param::W_gate_in11 + sm83_decoder3_param::W_gate_in81)
		) reg_ir_inst2 (
			.d(db[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[2])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(5311.949 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_alu_decoder_param::L_in47 + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_a_param::L_in + sm83_decoder1_param::L_in13 + sm83_decoder3_param::L_in79 + sm83_reg_pc_out_bit345_param::L_in20 + sm83_ao33_s3_tap_in1_n_param::L_in1),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in47 + sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_a_param::W_gate_in + sm83_decoder1_param::W_gate_in13 + sm83_decoder3_param::W_gate_in79 + sm83_reg_pc_out_bit345_param::W_gate_in20 + sm83_ao33_s3_tap_in1_n_param::W_gate_in1)
		) reg_ir_inst3 (
			.d(db[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[3])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6853.198 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_alu_decoder_param::L_in45 + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_a_param::L_in + sm83_decoder1_param::L_in15 + sm83_decoder3_param::L_in77 + sm83_and2_and3_reg_param::L_b_in1 + sm83_reg_pc_out_bit345_param::L_in20 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_reg_sp_out_param::L_in10 + sm83_and2_param::L_in2),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in45 + sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_a_param::W_gate_in + sm83_decoder1_param::W_gate_in15 + sm83_decoder3_param::W_gate_in77 + sm83_and2_and3_reg_param::W_gate_b_in1 + sm83_reg_pc_out_bit345_param::W_gate_in20 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_reg_sp_out_param::W_gate_in10 + sm83_and2_param::W_gate_in2)
		) reg_ir_inst4 (
			.d(db[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[4])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(6244.999 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_alu_decoder_param::L_in43 + sm83_not_dec1_param::L_in + sm83_not_p2_dec3_b_param::L_in + sm83_decoder1_param::L_in17 + sm83_decoder3_param::L_in75 + sm83_and2_and3_reg_param::L_b_in3 + sm83_reg_pc_out_bit345_param::L_in20 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11 + sm83_reg_sp_out_param::L_in11),
			.W_gate_q(sm83_alu_decoder_param::W_gate_in43 + sm83_not_dec1_param::W_gate_in + sm83_not_p2_dec3_b_param::W_gate_in + sm83_decoder1_param::W_gate_in17 + sm83_decoder3_param::W_gate_in75 + sm83_and2_and3_reg_param::W_gate_b_in3 + sm83_reg_pc_out_bit345_param::W_gate_in20 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11 + sm83_reg_sp_out_param::W_gate_in11)
		) reg_ir_inst5 (
			.d(db[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[5])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(2623.017 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_not_dec1_param::L_in + sm83_decoder1_param::L_in19),
			.W_gate_q(sm83_not_dec1_param::W_gate_in + sm83_decoder1_param::W_gate_in19)
		) reg_ir_inst6 (
			.d(db[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[6])
		);

	sm83_dff_cc_ee_q_x2_reg_bit #(
			.L_q(3435.917 + sm83_dff_cc_ee_q_x2_reg_bit_param::L_q + sm83_not_dec1_param::L_in + sm83_not_x2_dec2_param::L_in + sm83_decoder1_param::L_in21),
			.W_gate_q(sm83_not_dec1_param::W_gate_in + sm83_not_x2_dec2_param::W_gate_in + sm83_decoder1_param::W_gate_in21)
		) reg_ir_inst7 (
			.d(db[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_fetch_buf1_n),
			.clk_n(ctl_fetch),
			.q(opcode[7])
		);

	sm83_not_reg_we #(
			.L_y(639.4232 + sm83_not_reg_we_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_clk)
		) reg_ir_not_we_inst (
			.in(ctl_fetch),
			.y(ctl_fetch_buf1_n)
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.8555 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst0 (
			.d(new_reg_lo[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[0])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.42571 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst1 (
			.d(new_reg_lo[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[1])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.17229 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst2 (
			.d(new_reg_lo[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[2])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.7287 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst3 (
			.d(new_reg_lo[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[3])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.36231 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst4 (
			.d(new_reg_lo[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[4])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(53.91887 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst5 (
			.d(new_reg_lo[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[5])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.23564 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst6 (
			.d(new_reg_lo[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[6])
		);

	sm83_dff_cc_ee_q_x1_reg_bit #(
			.L_q(54.10892 + sm83_dff_cc_ee_q_x1_reg_bit_param::L_q + sm83_reg_hl_out_param::L_l_in),
			.W_gate_q(sm83_reg_hl_out_param::W_gate_l_in)
		) reg_l_inst7 (
			.d(new_reg_lo[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_l_we_buf_n),
			.clk_n(ctl_reg_l_we),
			.q(reg_l[7])
		);

	sm83_not_reg_l_we #(
			.L_y(639.55 + sm83_not_reg_l_we_param::L_y + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_clk)
		) reg_l_not_we_inst (
			.in(ctl_reg_l_we),
			.y(ctl_reg_l_we_buf_n)
		);

	sm83_not_reg #(
			.L_y(653.6786 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst0 (
			.in(new_reg_hi_n[0]),
			.y(new_reg_hi[0])
		);

	sm83_not_reg #(
			.L_y(654.6292 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst1 (
			.in(new_reg_hi_n[1]),
			.y(new_reg_hi[1])
		);

	sm83_not_reg #(
			.L_y(652.855 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst2 (
			.in(new_reg_hi_n[2]),
			.y(new_reg_hi[2])
		);

	sm83_not_reg #(
			.L_y(653.1085 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst3 (
			.in(new_reg_hi_n[3]),
			.y(new_reg_hi[3])
		);

	sm83_not_reg #(
			.L_y(653.6788 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst4 (
			.in(new_reg_hi_n[4]),
			.y(new_reg_hi[4])
		);

	sm83_not_reg #(
			.L_y(652.7283 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst5 (
			.in(new_reg_hi_n[5]),
			.y(new_reg_hi[5])
		);

	sm83_not_reg #(
			.L_y(652.7283 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst6 (
			.in(new_reg_hi_n[6]),
			.y(new_reg_hi[6])
		);

	sm83_not_reg #(
			.L_y(654.6926 + sm83_not_reg_param::L_y + sm83_dff_cc_ee_q_x2_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_y(sm83_dff_cc_ee_q_x2_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d)
		) reg_not_inst7 (
			.in(new_reg_hi_n[7]),
			.y(new_reg_hi[7])
		);

	sm83_oa21_reg #(
			.L_y(1688.212 + sm83_oa21_reg_param::L_y + sm83_alu_decoder_param::L_in60),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in60)
		) reg_oa1_inst (
			.in1(reg_a[1]),
			.in2(reg_a[2]),
			.in3(reg_a[3]),
			.y(daa_lo_gt9)
		);

	sm83_oa21_reg #(
			.L_y(1712.478 + sm83_oa21_reg_param::L_y + sm83_alu_decoder_param::L_in64),
			.W_gate_y(sm83_alu_decoder_param::W_gate_in64)
		) reg_oa2_inst (
			.in1(reg_a[5]),
			.in2(reg_a[6]),
			.in3(reg_a[7]),
			.y(daa_hi_gt9)
		);

	sm83_or2_tap_nor_tap_in1_n_reg #(
			.L_y(618.3875 + sm83_or2_tap_nor_tap_in1_n_reg_param::L_y + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel + sm83_reg_wz_out_param::L_muxi_b_sel),
			.W_gate_y(sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel + sm83_reg_wz_out_param::W_gate_muxi_b_sel),
			.L_tap_nor(617.9441 + sm83_or2_tap_nor_tap_in1_n_reg_param::L_tap_nor + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n + sm83_reg_wz_out_param::L_muxi_b_sel_n),
			.W_gate_tap_nor(sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n + sm83_reg_wz_out_param::W_gate_muxi_b_sel_n),
			.L_tap_in1_n(638.0291 + sm83_or2_tap_nor_tap_in1_n_reg_param::L_tap_in1_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n + sm83_reg_wz_out_param::L_muxi_a_sel_n),
			.W_gate_tap_in1_n(sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n + sm83_reg_wz_out_param::W_gate_muxi_a_sel_n)
		) reg_or_inst (
			.in1(ctl_op_ld_nn_sp_m2),
			.in2(ctl_op_jr_m1_buf),
			.y(ctl_op_ld_nn_sp_or_jr_exec),
			.tap_nor(ctl_op_ld_nn_sp_or_jr_exec_n),
			.tap_in1_n(ctl_op_ld_nn_sp_m2_buf_n)
		);

	sm83_reg_pc_out_bit012 #(
			.L_y1(L_db0),
			.W_gate_y1(W_gate_db0),
			.L_y2(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1165.813 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y5(67.1629 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(69.50525 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db1),
			.L_y2(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1165.75 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y5(66.4006 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(69.12511 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db2),
			.L_y2(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1166.447 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y5(66.14721 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(69.75874 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db3),
			.L_y2(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1164.292 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y5(66.1473 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(70.13888 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db4),
			.L_y2(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1163.722 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit4_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit4_param::W_gate_b_y),
			.L_y5(66.97082 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(69.31517 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db5),
			.L_y2(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1163.785 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit5_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit5_param::W_gate_b_y),
			.L_y5(67.35095 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(70.01213 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db6),
			.L_y2(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1165.876 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit6_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit6_param::W_gate_b_y),
			.L_y5(67.41438 + sm83_reg_pc_out_bit67_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(69.50516 + sm83_reg_pc_out_bit67_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db7),
			.L_y2(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y2(sm83_not2_idu_param::W_gate_b_in),
			.L_y3(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y3(sm83_not2_idu_param::W_gate_a_in),
			.L_y4(1164.609 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit7_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y4(sm83_reg_bus_pch_a_bit7_param::W_gate_b_y),
			.L_y5(66.97091 + sm83_reg_pc_out_bit67_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y5(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_y6(70.01213 + sm83_reg_pc_out_bit67_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_y6(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d)
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
			.L_d(69.50525 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(69.82197 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in4),
			.L_q_n(85.78866 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in6)
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
			.L_d(69.12511 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(68.93504 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in4),
			.L_q_n(86.54903 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in6)
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
			.L_d(69.75874 + sm83_reg_pc_out_bit012_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(69.63199 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in4),
			.L_q_n(84.77469 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in6)
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
			.L_d(70.13888 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(69.69522 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in4),
			.L_q_n(84.71146 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in6)
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
			.L_d(69.31517 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.01213 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in4),
			.L_q_n(84.90154 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in6)
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
			.L_d(70.01213 + sm83_reg_pc_out_bit345_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(69.69531 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in4),
			.L_q_n(85.66171 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in6)
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
			.L_d(69.50516 + sm83_reg_pc_out_bit67_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.01213 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit67_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit67_param::W_gate_in4),
			.L_q_n(85.53516 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in6)
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
			.L_d(70.01213 + sm83_reg_pc_out_bit67_param::L_y6 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.64567 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit67_param::L_in4),
			.W_gate_q(sm83_reg_pc_out_bit67_param::W_gate_in4),
			.L_q_n(85.21835 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in6),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in6)
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
			.L_a_y(636.3182 + sm83_not2_reg_pc_we_param::L_a_y + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk),
			.W_gate_a_y(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk),
			.L_b_y(1277.642 + sm83_not2_reg_pc_we_param::L_b_y + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n),
			.W_gate_b_y(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n)
		) reg_pch_not_we_inst (
			.a_in(ctl_reg_pc_we),
			.a_y(ctl_reg_pc_we_buf_hi_n),
			.b_in(sys_reset),
			.b_y(pch_reset_n)
		);

	sm83_dffs_cc_ee_pch_d_reg_pc_bit #(
			.L_d(67.1629 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(69.63209 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in2),
			.L_q_n(84.33142 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in8)
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
			.L_d(66.4006 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.01203 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in2),
			.L_q_n(84.58472 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in8)
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
			.L_d(66.14721 + sm83_reg_pc_out_bit012_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.13878 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit012_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit012_param::W_gate_in2),
			.L_q_n(84.33132 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in8)
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
			.L_d(66.1473 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.01213 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in2),
			.L_q_n(85.15493 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in8)
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
			.L_d(66.97082 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.26543 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in2),
			.L_q_n(84.0146 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in8)
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
			.L_d(67.35095 + sm83_reg_pc_out_bit345_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.51892 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit345_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit345_param::W_gate_in2),
			.L_q_n(84.52139 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in8)
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
			.L_d(67.41438 + sm83_reg_pc_out_bit67_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.26563 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit67_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit67_param::W_gate_in2),
			.L_q_n(84.52139 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in8)
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
			.L_d(66.97091 + sm83_reg_pc_out_bit67_param::L_y5 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_d),
			.W_gate_d(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_d),
			.L_q(70.64577 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q + sm83_reg_pc_out_bit67_param::L_in2),
			.W_gate_q(sm83_reg_pc_out_bit67_param::W_gate_in2),
			.L_q_n(83.69778 + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in8),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in8)
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
			.L_a_y(636.1281 + sm83_not2_reg_pc_we_param::L_a_y + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_clk),
			.W_gate_a_y(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_clk),
			.L_b_y(1276.882 + sm83_not2_reg_pc_we_param::L_b_y + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::L_s_n),
			.W_gate_b_y(sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n + sm83_dffs_cc_ee_pch_d_reg_pc_bit_param::W_gate_s_n)
		) reg_pcl_not_we_inst (
			.a_in(ctl_reg_pc_we),
			.a_y(ctl_reg_pc_we_buf_lo_n),
			.b_in(sys_reset),
			.b_y(pcl_reset_n)
		);

	sm83_reg_sp_out #(
			.L_y1(L_db0),
			.W_gate_y1(W_gate_db0),
			.L_y2(1165.813 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y3(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y4(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(74.32063 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.28228 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db1),
			.L_y2(1165.75 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y3(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y4(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(73.94048 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.85249 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db2),
			.L_y2(1166.447 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit012_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y3(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y4(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(74.63744 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.66252 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db3),
			.L_y2(1164.292 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit0123_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit0123_param::W_gate_b_y),
			.L_y3(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_y4(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(73.94029 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.97924 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db4),
			.L_y2(1163.722 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit4_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit4_param::W_gate_b_y),
			.L_y3(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y),
			.L_y4(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(73.75022 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.47235 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db5),
			.L_y2(1163.785 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit5_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit345_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit5_param::W_gate_b_y),
			.L_y3(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y),
			.L_y4(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(74.44727 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(62.85259 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db6),
			.L_y2(1165.876 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit6_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit6_param::W_gate_b_y),
			.L_y3(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y),
			.L_y4(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(75.65102 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(63.42271 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.W_gate_y1(W_gate_db7),
			.L_y2(1164.609 + sm83_reg_a_out_param::L_a_y + sm83_reg_bus_pch_a_bit7_param::L_b_y + sm83_reg_hl_out_param::L_y3 + sm83_reg_pc_out_bit67_param::L_y4 + sm83_reg_sp_out_param::L_y2),
			.W_gate_y2(sm83_reg_bus_pch_a_bit7_param::W_gate_b_y),
			.L_y3(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_y3(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y),
			.L_y4(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_y4(sm83_not2_idu_param::W_gate_a_in),
			.L_y5(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_y5(sm83_not2_idu_param::W_gate_b_in),
			.L_y6(74.57391 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y6(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_y7(63.16931 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_y7(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d)
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
			.L_d(74.32063 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(61.96537 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.15502 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(73.94048 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.53578 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.15502 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(74.63744 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(61.90205 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.02818 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(73.94029 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.34561 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.66181 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(73.75022 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.97924 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.28176 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(74.44727 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.91592 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.85197 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(75.65102 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.47235 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.59859 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_d(74.57391 + sm83_reg_sp_out_param::L_y6 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.15544 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in4),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in4),
			.L_q_n(85.85198 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in8),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in8)
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
			.L_y(639.423 + sm83_not_reg_sp_we_param::L_y + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk)
		) reg_sph_not_we_inst (
			.in(ctl_reg_sp_we),
			.y(ctl_reg_sp_we_buf_hi_n)
		);

	sm83_dff_cc_ee_pch_d_reg_sp_bit #(
			.L_d(62.28228 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(61.7753 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(91.3008 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(62.85249 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.02889 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(90.98407 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(62.66252 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.97924 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(89.59016 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(62.97924 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.91582 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(90.41386 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(62.47235 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.97924 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(89.78033 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(62.85259 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.85249 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(90.09705 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(63.42271 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(62.91592 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(90.60403 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_d(63.16931 + sm83_reg_sp_out_param::L_y7 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_d),
			.W_gate_d(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_d),
			.L_q(63.23264 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q + sm83_reg_sp_out_param::L_in2),
			.W_gate_q(sm83_reg_sp_out_param::W_gate_in2),
			.L_q_n(89.65349 + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_q_n + sm83_reg_sp_out_param::L_in6),
			.W_gate_q_n(sm83_reg_sp_out_param::W_gate_in6)
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
			.L_y(638.7259 + sm83_not_reg_sp_we_param::L_y + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk + sm83_dff_cc_ee_pch_d_reg_sp_bit_param::W_gate_clk)
		) reg_spl_not_we_inst (
			.in(ctl_reg_sp_we),
			.y(ctl_reg_sp_we_buf_lo_n)
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9099 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst0 (
			.d(new_reg_w_n[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[0])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.4306 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst1 (
			.d(new_reg_w_n[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[1])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.3538 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst2 (
			.d(new_reg_w_n[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[2])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.2269 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst3 (
			.d(new_reg_w_n[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[3])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(656.9101 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst4 (
			.d(new_reg_w_n[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[4])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(658.8109 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst5 (
			.d(new_reg_w_n[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[5])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.7336 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst6 (
			.d(new_reg_w_n[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[6])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(657.0367 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit67_param::L_in16 + sm83_reg_sp_out_param::L_in16 + sm83_reg_wz_out_param::L_oai21_in_aoi_b_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit67_param::W_gate_in16 + sm83_reg_sp_out_param::W_gate_in16 + sm83_reg_wz_out_param::W_gate_oai21_in_aoi_b_in2)
		) reg_w_inst7 (
			.d(new_reg_w_n[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_w_we_buf_n),
			.clk_n(ctl_reg_w_we),
			.q_n(reg_w[7])
		);

	sm83_not_reg_we #(
			.L_y(638.6625 + sm83_not_reg_we_param::L_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk)
		) reg_w_not_we_inst (
			.in(ctl_reg_w_we),
			.y(ctl_reg_w_we_buf_n)
		);

	sm83_reg_wz_out #(
			.L_aoi_a_y_n(507.5721 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(76.15791 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(127.4158 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(167.1421 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1133.182 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_oai21_y(991.511 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1104.417 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(508.2055 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(75.84119 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(127.6058 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(167.3954 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1134.133 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_oai21_y(992.5247 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1102.96 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(507.3184 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(75.96793 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(126.7188 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(167.6491 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_oai21_y(993.0314 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit012_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1102.453 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit012_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(506.5582 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(75.84109 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(127.3523 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(166.5718 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1133.879 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit0123_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit0123_param::W_gate_c_y),
			.L_oai21_y(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1102.643 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(506.6852 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(76.22133 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(126.6554 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(166.5718 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1133.373 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit4_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit4_param::W_gate_c_y),
			.L_oai21_y(991.3843 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(506.3047 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(76.53815 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(128.0493 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(167.0788 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1131.472 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit5_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit5_param::W_gate_c_y),
			.L_oai21_y(990.9408 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit345_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1100.806 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit345_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(506.6848 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(76.53804 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(126.9089 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(167.3322 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1134.83 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit6_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit6_param::W_gate_c_y),
			.L_oai21_y(1005.577 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1102.39 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_aoi_a_y_n(507.2552 + sm83_reg_wz_out_param::L_aoi_a_y_n + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d + sm83_dff_cc_ee_q_x1_reg_bit_param::L_d),
			.W_gate_aoi_a_y_n(sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d + sm83_dff_cc_ee_q_x1_reg_bit_param::W_gate_d),
			.L_aoi_b_y(75.90461 + sm83_reg_wz_out_param::L_aoi_b_y + sm83_not_reg_param::L_in),
			.W_gate_aoi_b_y(sm83_not_reg_param::W_gate_in),
			.L_muxi_a_y(127.7325 + sm83_reg_wz_out_param::L_muxi_a_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_a_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_muxi_b_y(166.9519 + sm83_reg_wz_out_param::L_muxi_b_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_d),
			.W_gate_muxi_b_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_d),
			.L_nand_y(1134.64 + sm83_reg_a_out_param::L_b_y + sm83_reg_bc_out_param::L_y2 + sm83_reg_bus_pch_a_bit7_param::L_c_y + sm83_reg_de_out_param::L_y2 + sm83_reg_hl_out_param::L_y2 + sm83_reg_sp_out_param::L_y3 + sm83_reg_wz_out_param::L_nand_y),
			.W_gate_nand_y(sm83_reg_bus_pch_a_bit7_param::W_gate_c_y),
			.L_oai21_y(992.0176 + sm83_reg_bc_out_param::L_b_y1 + sm83_reg_bus_pch_b_param::L_b_y + sm83_reg_de_out_param::L_d_y1 + sm83_reg_hl_out_param::L_h_y1 + sm83_reg_pc_out_bit67_param::L_y2 + sm83_reg_sp_out_param::L_y5 + sm83_reg_wz_out_param::L_oai21_y + sm83_not2_idu_param::L_b_in),
			.W_gate_oai21_y(sm83_not2_idu_param::W_gate_b_in),
			.L_oai31_y(1100.489 + sm83_reg_bc_out_param::L_c_y1 + sm83_reg_bus_pch_b_param::L_a_y + sm83_reg_de_out_param::L_e_y1 + sm83_reg_hl_out_param::L_l_y1 + sm83_reg_pc_out_bit67_param::L_y3 + sm83_reg_sp_out_param::L_y4 + sm83_reg_wz_out_param::L_oai31_y + sm83_not2_idu_param::L_a_in),
			.W_gate_oai31_y(sm83_not2_idu_param::W_gate_a_in)
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
			.L_q_n(608.3767 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst0 (
			.d(new_reg_z_n[0]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[0])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(607.6166 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst1 (
			.d(new_reg_z_n[1]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[1])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.6303 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit012_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit012_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst2 (
			.d(new_reg_z_n[2]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[2])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(608.5669 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_reg_pc_out_bit345_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_reg_pc_out_bit345_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst3 (
			.d(new_reg_z_n[3]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[3])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2305.746 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_alu_decoder_param::L_in32 + sm83_reg_pc_out_bit345_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in32 + sm83_reg_pc_out_bit345_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst4 (
			.d(new_reg_z_n[4]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[4])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2264.402 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_alu_decoder_param::L_in33 + sm83_reg_pc_out_bit345_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in33 + sm83_reg_pc_out_bit345_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst5 (
			.d(new_reg_z_n[5]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[5])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(2417.375 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_alu_decoder_param::L_in31 + sm83_reg_pc_out_bit67_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in31 + sm83_reg_pc_out_bit67_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst6 (
			.d(new_reg_z_n[6]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[6])
		);

	sm83_dff_cc_ee_q_n_reg_wz_bit #(
			.L_q_n(3175.844 + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_q_n + sm83_alu_decoder_param::L_in59 + sm83_dffn_ee_q_alu_sign_param::L_d + sm83_idu_ctl_param::L_in2 + sm83_reg_pc_out_bit67_param::L_in12 + sm83_reg_sp_out_param::L_in20 + sm83_reg_wz_out_param::L_oai31_in_nand_in_aoi_a_in2),
			.W_gate_q_n(sm83_alu_decoder_param::W_gate_in59 + sm83_dffn_ee_q_alu_sign_param::W_gate_d + sm83_idu_ctl_param::W_gate_in2 + sm83_reg_pc_out_bit67_param::W_gate_in12 + sm83_reg_sp_out_param::W_gate_in20 + sm83_reg_wz_out_param::W_gate_oai31_in_nand_in_aoi_a_in2)
		) reg_z_inst7 (
			.d(new_reg_z_n[7]),
			.ena(write_phase),
			.ena_n(write_phase_n),
			.clk(ctl_reg_z_we_buf_n),
			.clk_n(ctl_reg_z_we),
			.q_n(reg_z[7])
		);

	sm83_not_reg_we #(
			.L_y(638.8528 + sm83_not_reg_we_param::L_y + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::L_clk),
			.W_gate_y(sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk + sm83_dff_cc_ee_q_n_reg_wz_bit_param::W_gate_clk)
		) reg_z_not_we_inst (
			.in(ctl_reg_z_we),
			.y(ctl_reg_z_we_buf_n)
		);

	sm83_nand2_spare #(
			.L_y(43.08442 + sm83_nand2_spare_param::L_y + sm83_nor2_spare_param::L_y)
		) spare_nand_inst (
			.in1(ctl_op2_to_db_en),
			.in2(ctl_op2_to_db_en),
			.y(spare_y)
		);

	sm83_nor2_spare #(
			.L_y(43.08442 + sm83_nand2_spare_param::L_y + sm83_nor2_spare_param::L_y)
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
			.L_y(196.7943 + sm83_and2_in1_n_tap_in1_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d),
			.L_tap_in1(367.421 + sm83_and2_in1_n_tap_in1_param::L_tap_in1 + sm83_decoder3_param::L_in73),
			.W_gate_tap_in1(sm83_decoder3_param::W_gate_in73)
		) vequ_inst (
			.in1_n(ctl_sel_reg_w),
			.in2(ctl_mread),
			.y(ctl_mread_lsb),
			.tap_in1(ctl_sel_reg_z)
		);

	sm83_nor2_e #(
			.L_y(27.24453 + sm83_nor2_e_param::L_y + sm83_oa21_param::L_in3),
			.W_gate_y(sm83_oa21_param::W_gate_in3)
		) wafr_inst (
			.in1(data_phase_buf_n),
			.in2(oe_n),
			.y(wafr)
		);

	sm83_nor2_d #(
			.L_y(157.0681 + sm83_nor2_d_param::L_y + sm83_nand2_in1_n_b_param::L_in2 + sm83_nand2_in1_n_a_param::L_in2 + sm83_nand2_in1_n_c_param::L_in2),
			.W_gate_y(sm83_nand2_in1_n_b_param::W_gate_in2 + sm83_nand2_in1_n_a_param::W_gate_in2 + sm83_nand2_in1_n_c_param::W_gate_in2)
		) wagr_inst (
			.in1(idle),
			.in2(alu_cond_fail),
			.y(set_mcyc7_n)
		);

	sm83_oa21 #(
			.L_y(L_rd),
			.W_gate_y(W_gate_rd + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1 + sm83_nand2_nand3_od_irq_param::W_gate_b_in1)
		) wdin_inst (
			.in1(ctl_fetch),
			.in2(ctl_mread),
			.in3(wafr),
			.y(rd)
		);

	sm83_nand2_in1_n_b #(
			.L_y(54.61588 + sm83_nand2_in1_n_b_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) ween_inst (
			.in1_n(next_mcyc[1]),
			.in2(set_mcyc7_n),
			.y(ween)
		);

	sm83_nand2_in1_n_a #(
			.L_y(67.28761 + sm83_nand2_in1_n_a_param::L_y + sm83_dff_cc_q_alt_param::L_d),
			.W_gate_y(sm83_dff_cc_q_alt_param::W_gate_d)
		) werf_inst (
			.in1_n(next_mcyc[2]),
			.in2(set_mcyc7_n),
			.y(werf)
		);

	sm83_nand2_in1_n_c #(
			.L_y(73.1167 + sm83_nand2_in1_n_c_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) wudz_inst (
			.in1_n(next_mcyc[0]),
			.in2(set_mcyc7_n),
			.y(wudz)
		);

	sm83_dff_cc_q #(
			.L_q(167.5223 + sm83_dff_cc_q_param::L_q + sm83_not_dec1_param::L_in),
			.W_gate_q(sm83_not_dec1_param::W_gate_in)
		) xaym_inst (
			.d(wudz),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[0])
		);

	sm83_dff_cc_q #(
			.L_q(461.0666 + sm83_dff_cc_q_param::L_q + sm83_decoder3_param::L_in72 + sm83_and2_in1_n_tap_in1_param::L_in1_n),
			.W_gate_q(sm83_decoder3_param::W_gate_in72 + sm83_and2_in1_n_tap_in1_param::W_gate_in1_n)
		) xdqf_inst (
			.d(ctl_mread_lsb),
			.clk(clk),
			.clk_n(clk_n),
			.q(ctl_sel_reg_w)
		);

	sm83_dff_cc_q #(
			.L_q(184.3758 + sm83_dff_cc_q_param::L_q + sm83_not_dec1_param::L_in),
			.W_gate_q(sm83_not_dec1_param::W_gate_in)
		) xirf_inst (
			.d(ween),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[1])
		);

	sm83_ao31_in3_n #(
			.L_y(377.3053 + sm83_ao31_in3_n_param::L_y + sm83_nand2_c_param::L_in2 + sm83_and3_param::L_in1),
			.W_gate_y(sm83_nand2_c_param::W_gate_in2 + sm83_and3_param::W_gate_in1)
		) xogs_inst (
			.in1(data_phase),
			.in2(ctl_fetch),
			.in3_n(ctl_op_cb_prefix),
			.in4(idle),
			.y(xogs)
		);

	sm83_aoi21_b #(
			.L_y(167.6778 + sm83_aoi21_b_param::L_y + sm83_not_dec1_param::L_in),
			.W_gate_y(sm83_not_dec1_param::W_gate_in)
		) xtip_inst (
			.in1(xurg),
			.in2(xudo),
			.in3(test_freeze),
			.y(table_cb_n)
		);

	sm83_not_f #(
			.L_y(29.90562 + sm83_not_f_param::L_y + sm83_aoi21_b_param::L_in2),
			.W_gate_y(sm83_aoi21_b_param::W_gate_in2)
		) xudo_inst (
			.in(mcyc_buf[2]),
			.y(xudo)
		);

	sm83_dff_cc_q_alt #(
			.L_q(164.3542 + sm83_dff_cc_q_alt_param::L_q + sm83_not_dec1_param::L_in),
			.W_gate_q(sm83_not_dec1_param::W_gate_in)
		) xufu_inst (
			.d(werf),
			.clk(clk),
			.clk_n(clk_n),
			.q(mcyc[2])
		);

	sm83_dffre_cc_q #(
			.L_q(122.6638 + sm83_dffre_cc_q_param::L_q + sm83_aoi21_b_param::L_in1),
			.W_gate_q(sm83_aoi21_b_param::W_gate_in1)
		) xurg_inst (
			.d(ctl_op_cb_prefix),
			.clk(ctl_fetch_buf2_n),
			.clk_n(ctl_fetch),
			.ena(write_phase),
			.r(halt),
			.q(xurg)
		);

	sm83_not_d #(
			.L_y(71.27934 + sm83_not_d_param::L_y + sm83_dffre_cc_q_param::L_clk),
			.W_gate_y(sm83_dffre_cc_q_param::W_gate_clk)
		) xuri_inst (
			.in(ctl_fetch),
			.y(ctl_fetch_buf2_n)
		);

	sm83_not_e #(
			.L_y(L_halt_n),
			.W_gate_y(W_gate_halt_n)
		) xwee_inst (
			.in(halt),
			.y(halt_n)
		);

	sm83_nor3 #(
			.L_y(58.1639 + sm83_nor3_param::L_y + sm83_not_dec1_param::L_in),
			.W_gate_y(sm83_not_dec1_param::W_gate_in)
		) xygb_inst (
			.in1(test_freeze),
			.in2(idle),
			.in3(int_entry),
			.y(in_intr_n)
		);

	sm83_or3_b #(
			.L_y(445.7336 + sm83_or3_b_param::L_y + sm83_nor2_d_param::L_in1 + sm83_ao31_in3_n_param::L_in4 + sm83_nor3_param::L_in2),
			.W_gate_y(sm83_nor2_d_param::W_gate_in1 + sm83_ao31_in3_n_param::W_gate_in4 + sm83_nor3_param::W_gate_in2)
		) ycnf_inst (
			.in1(halt),
			.in2(sys_reset),
			.in3(test_freeze),
			.y(idle)
		);

	sm83_dff_cc_q #(
			.L_q(47.13942 + sm83_dff_cc_q_param::L_q + sm83_dlatch_ee_q_n_param::L_d),
			.W_gate_q(sm83_dlatch_ee_q_n_param::W_gate_d)
		) ydxa_inst (
			.d(nmi_n),
			.clk(clk),
			.clk_n(clk_n),
			.q(ydxa)
		);

	sm83_not_c #(
			.L_y(163.0235 + sm83_not_c_param::L_y + sm83_dff_cc_q_param::L_d + sm83_nor2_c_param::L_in2),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d + sm83_nor2_c_param::W_gate_in2)
		) yepj_inst (
			.in(nmi),
			.y(nmi_n)
		);

	sm83_oai21 #(
			.L_y(163.5307 + sm83_oai21_param::L_y + sm83_srlatch_r_n_alt_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_alt_param::W_gate_r_n)
		) ykua_inst (
			.in1(yolu),
			.in2(yoii),
			.in3(reset_n),
			.y(ykua)
		);

	sm83_aoi21_a #(
			.L_y(209.8464 + sm83_aoi21_a_param::L_y + sm83_srlatch_r_n_param::L_r_n + sm83_srlatch_r_n_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_r_n + sm83_srlatch_r_n_param::W_gate_r_n)
		) yneu_inst (
			.in1(nmi_entry),
			.in2(ctl_int_entry_m6),
			.in3(sys_reset),
			.y(yneu)
		);

	sm83_nor2_c #(
			.L_y(77.86861 + sm83_nor2_c_param::L_y + sm83_srlatch_r_n_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_s)
		) yniu_inst (
			.in1(yodp),
			.in2(nmi_n),
			.y(yniu)
		);

	sm83_srlatch_r_n_alt #(
			.L_q(247.9886 + sm83_srlatch_r_n_alt_param::L_q + sm83_dffre_cc_q_param::L_r + sm83_not_e_param::L_in + sm83_or3_b_param::L_in1),
			.W_gate_q(sm83_dffre_cc_q_param::W_gate_r + sm83_not_e_param::W_gate_in + sm83_or3_b_param::W_gate_in1)
		) ynkw_inst (
			.s(ynoz),
			.r_n(ykua),
			.q(halt)
		);

	sm83_or3_a #(
			.L_y(29.3987 + sm83_or3_a_param::L_y + sm83_srlatch_r_n_alt_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_alt_param::W_gate_s)
		) ynoz_inst (
			.in1(pwron_reset),
			.in2(ctl_op_stop_delayed),
			.in3(ctl_op_halt_delayed),
			.y(ynoz)
		);

	sm83_dlatch_ee_q_n #(
			.L_q_n(60.76164 + sm83_dlatch_ee_q_n_param::L_q_n + sm83_nor2_c_param::L_in1),
			.W_gate_q_n(sm83_nor2_c_param::W_gate_in1)
		) yodp_inst (
			.d(ydxa),
			.ena(clk_n),
			.ena_n(clk),
			.q_n(yodp)
		);

	sm83_dff_cc_q #(
			.L_q(35.98814 + sm83_dff_cc_q_param::L_q + sm83_oai21_param::L_in2),
			.W_gate_q(sm83_oai21_param::W_gate_in2)
		) yoii_inst (
			.d(int_pending),
			.clk(clk),
			.clk_n(clk_n),
			.q(yoii)
		);

	sm83_nor2_in2_n #(
			.L_y(26.42095 + sm83_nor2_in2_n_param::L_y + sm83_oai21_param::L_in1),
			.W_gate_y(sm83_oai21_param::W_gate_in1)
		) yolu_inst (
			.in1(zorp),
			.in2_n(zaza),
			.y(yolu)
		);

	sm83_dff_cc_q #(
			.L_q(40.99353 + sm83_dff_cc_q_param::L_q + sm83_or3_a_param::L_in3),
			.W_gate_q(sm83_or3_a_param::W_gate_in3)
		) ysbt_inst (
			.d(ctl_op_halt),
			.clk(clk),
			.clk_n(clk_n),
			.q(ctl_op_halt_delayed)
		);

	sm83_dff_cc_q #(
			.L_q(L_int_entry),
			.W_gate_q(W_gate_int_entry + sm83_nor3_param::W_gate_in3 + sm83_aoi331_s3_param::W_gate_in5)
		) zacw_inst (
			.d(zfex),
			.clk(clk),
			.clk_n(clk_n),
			.q(int_entry)
		);

	sm83_nor4_in2_n_in4_n #(
			.L_y(91.36417 + sm83_nor4_in2_n_in4_n_param::L_y + sm83_srlatch_r_n_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_s)
		) zaij_inst (
			.in1(ime_n),
			.in2_n(data_phase),
			.in3(zaoc),
			.in4_n(zzom),
			.y(zaij)
		);

	sm83_nand2_c #(
			.L_y(87.43592 + sm83_nand2_c_param::L_y + sm83_nor4_in2_n_in4_n_param::L_in3),
			.W_gate_y(sm83_nor4_in2_n_in4_n_param::W_gate_in3)
		) zaoc_inst (
			.in1(int_take),
			.in2(xogs),
			.y(zaoc)
		);

	sm83_dff_cc_q #(
			.L_q(145.093 + sm83_dff_cc_q_param::L_q + sm83_nor2_in2_n_param::L_in2_n),
			.W_gate_q(sm83_nor2_in2_n_param::W_gate_in2_n)
		) zaza_inst (
			.d(zorp),
			.clk(clk),
			.clk_n(clk_n),
			.q(zaza)
		);

	sm83_ao33_s3_tap_in1_n #(
			.L_y(4.308392 + sm83_ao33_s3_tap_in1_n_param::L_y + sm83_srlatch_r_n_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_s),
			.L_tap_in1_n(414.3069 + sm83_ao33_s3_tap_in1_n_param::L_tap_in1_n + sm83_aoi331_s3_param::L_in1 + sm83_nand2_b_param::L_in1),
			.W_gate_tap_in1_n(sm83_aoi331_s3_param::W_gate_in1 + sm83_nand2_b_param::W_gate_in1)
		) zbpp_inst (
			.in1(opcode[3]),
			.in2(ctl_op_di_or_ei),
			.in3(data_phase),
			.in4(ctl_op_reti_m3),
			.in5(zkdu),
			.y(zbpp),
			.tap_in1_n(opcode3_n_buf3)
		);

	sm83_or2_b #(
			.L_y(88.63976 + sm83_or2_b_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) zfex_inst (
			.in1(zkog),
			.in2(zloz),
			.y(zfex)
		);

	sm83_not_a #(
			.L_y(79.00925 + sm83_not_a_param::L_y + sm83_srlatch_r_n_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_r_n)
		) zgna_inst (
			.in(zloz),
			.y(zgna)
		);

	sm83_nor2_f #(
			.L_y(360.515 + sm83_nor2_f_param::L_y + sm83_oai21_param::L_in3 + sm83_not_g_param::L_in),
			.W_gate_y(sm83_oai21_param::W_gate_in3 + sm83_not_g_param::W_gate_in)
		) zhzo_inst (
			.in1(sys_reset),
			.in2(pwron_reset),
			.y(reset_n)
		);

	sm83_nand2_d #(
			.L_y(81.92373 + sm83_nand2_d_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) ziks_inst (
			.in1(clk_ready),
			.in2(zudn),
			.y(ziks)
		);

	sm83_and2 #(
			.L_y(113.6035 + sm83_and2_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) ziul_inst (
			.in1(ctl_op_nop_or_stop),
			.in2(opcode[4]),
			.y(ctl_op_stop)
		);

	sm83_dff_cc_q #(
			.L_q(5.575608 + sm83_dff_cc_q_param::L_q + sm83_nor4_in2_n_in4_n_param::L_in1),
			.W_gate_q(sm83_nor4_in2_n_in4_n_param::W_gate_in1)
		) zivv_inst (
			.d(zoxc),
			.clk(exec_phase_n),
			.clk_n(exec_phase),
			.q(ime_n)
		);

	sm83_not_x3_p2 #(
			.L_y(L_stop_n),
			.W_gate_y(W_gate_stop_n)
		) zjbf_inst (
			.in(stop),
			.y(stop_n)
		);

	sm83_srlatch_r_n #(
			.L_q(42.89428 + sm83_srlatch_r_n_param::L_q + sm83_nand2_a_param::L_in2),
			.W_gate_q(sm83_nand2_a_param::W_gate_in2)
		) zjje_inst (
			.s(zbpp),
			.r_n(zwuu),
			.q(ime_state)
		);

	sm83_dff_cc_q #(
			.L_q(102.0087 + sm83_dff_cc_q_param::L_q + sm83_or3_a_param::L_in2 + sm83_srlatch_r_n_param::L_s),
			.W_gate_q(sm83_or3_a_param::W_gate_in2 + sm83_srlatch_r_n_param::W_gate_s)
		) zkai_inst (
			.d(ctl_op_stop),
			.clk(clk),
			.clk_n(clk_n),
			.q(ctl_op_stop_delayed)
		);

	sm83_dff_cc_q #(
			.L_q(531.8436 + sm83_dff_cc_q_param::L_q + sm83_ao33_s3_tap_in1_n_param::L_in5 + sm83_aoi331_s3_param::L_in4 + sm83_and3_param::L_in2),
			.W_gate_q(sm83_ao33_s3_tap_in1_n_param::W_gate_in5 + sm83_aoi331_s3_param::W_gate_in4 + sm83_and3_param::W_gate_in2)
		) zkdu_inst (
			.d(zrsy),
			.clk(clk),
			.clk_n(clk_n),
			.q(zkdu)
		);

	sm83_srlatch_r_n #(
			.L_q(13.87572 + sm83_srlatch_r_n_param::L_q + sm83_or2_b_param::L_in1),
			.W_gate_q(sm83_or2_b_param::W_gate_in1)
		) zkog_inst (
			.s(zaij),
			.r_n(zowa),
			.q(zkog)
		);

	sm83_not_g #(
			.L_y(95.16583 + sm83_not_g_param::L_y + sm83_nor2_b_param::L_in2),
			.W_gate_y(sm83_nor2_b_param::W_gate_in2)
		) zkon_inst (
			.in(reset_n),
			.y(reset)
		);

	sm83_srlatch_r_n #(
			.L_q(520.434 + sm83_srlatch_r_n_param::L_q + sm83_or2_b_param::L_in2 + sm83_not_a_param::L_in + sm83_dff_cc_q_param::L_d),
			.W_gate_q(sm83_or2_b_param::W_gate_in2 + sm83_not_a_param::W_gate_in + sm83_dff_cc_q_param::W_gate_d)
		) zloz_inst (
			.s(zyoc),
			.r_n(yneu),
			.q(zloz)
		);

	sm83_oa211_in1_n_in3_n #(
			.L_y(L_mreq),
			.W_gate_y(W_gate_mreq)
		) zlyz_inst (
			.in1_n(shadow_access),
			.in2(shadow_override),
			.in3_n(internal_access),
			.in4(ctl_mreq),
			.y(mreq)
		);

	sm83_or2_a #(
			.L_y(11.59473 + sm83_or2_a_param::L_y + sm83_srlatch_r_n_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_s)
		) znda_inst (
			.in1(sys_reset),
			.in2(ctl_op_reti_m3),
			.y(znda)
		);

	sm83_srlatch_r_n #(
			.L_q(19.70688 + sm83_srlatch_r_n_param::L_q + sm83_and3_param::L_in3),
			.W_gate_q(sm83_and3_param::W_gate_in3)
		) zojz_inst (
			.s(yniu),
			.r_n(yneu),
			.q(zojz)
		);

	sm83_dff_cc_q #(
			.L_q(154.9137 + sm83_dff_cc_q_param::L_q + sm83_nor2_in2_n_param::L_in1 + sm83_dff_cc_q_param::L_d),
			.W_gate_q(sm83_nor2_in2_n_param::W_gate_in1 + sm83_dff_cc_q_param::W_gate_d)
		) zorp_inst (
			.d(ziks),
			.clk(clk),
			.clk_n(clk_n),
			.q(zorp)
		);

	sm83_nor2_a #(
			.L_y(60.31816 + sm83_nor2_a_param::L_y + sm83_srlatch_r_n_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_r_n)
		) zowa_inst (
			.in1(ctl_int_entry_m6),
			.in2(sys_reset),
			.y(zowa)
		);

	sm83_nand2_a #(
			.L_y(168.9161 + sm83_nand2_a_param::L_y + sm83_dff_cc_q_param::L_d),
			.W_gate_y(sm83_dff_cc_q_param::W_gate_d)
		) zoxc_inst (
			.in1(zrsy),
			.in2(ime_state),
			.y(zoxc)
		);

	sm83_dff_cc_q #(
			.L_q(1017.489 + sm83_dff_cc_q_param::L_q + sm83_not5_irq_param::L_b_in + sm83_aoi21_a_param::L_in1),
			.W_gate_q(sm83_not5_irq_param::W_gate_b_in + sm83_aoi21_a_param::W_gate_in1)
		) zrby_inst (
			.d(zloz),
			.clk(clk),
			.clk_n(clk_n),
			.q(nmi_entry)
		);

	sm83_srlatch_r_n #(
			.L_q(168.9162 + sm83_srlatch_r_n_param::L_q + sm83_dff_cc_q_param::L_d + sm83_nand2_a_param::L_in1),
			.W_gate_q(sm83_dff_cc_q_param::W_gate_d + sm83_nand2_a_param::W_gate_in1)
		) zrsy_inst (
			.s(znda),
			.r_n(zgna),
			.q(zrsy)
		);

	sm83_not_b #(
			.L_y(160.8068 + sm83_not_b_param::L_y + sm83_nand2_d_param::L_in2),
			.W_gate_y(sm83_nand2_d_param::W_gate_in2)
		) zudn_inst (
			.in(sys_reset),
			.y(zudn)
		);

	sm83_srlatch_r_n #(
			.L_q(16.22001 + sm83_srlatch_r_n_param::L_q + sm83_not_x3_p2_param::L_in),
			.W_gate_q(sm83_not_x3_p2_param::W_gate_in)
		) zumn_inst (
			.s(ctl_op_stop_delayed),
			.r_n(zwlm),
			.q(stop)
		);

	sm83_nor2_b #(
			.L_y(108.4078 + sm83_nor2_b_param::L_y + sm83_srlatch_r_n_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_r_n)
		) zwlm_inst (
			.in1(wake),
			.in2(reset),
			.y(zwlm)
		);

	sm83_aoi331_s3 #(
			.L_y(113.0965 + sm83_aoi331_s3_param::L_y + sm83_srlatch_r_n_param::L_r_n),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_r_n)
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
			.L_y(40.42339 + sm83_and3_param::L_y + sm83_srlatch_r_n_param::L_s),
			.W_gate_y(sm83_srlatch_r_n_param::W_gate_s)
		) zyoc_inst (
			.in1(xogs),
			.in2(zkdu),
			.in3(zojz),
			.y(zyoc)
		);

	sm83_nand2_b #(
			.L_y(47.20277 + sm83_nand2_b_param::L_y + sm83_nor4_in2_n_in4_n_param::L_in4_n),
			.W_gate_y(sm83_nor4_in2_n_in4_n_param::W_gate_in4_n)
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
	keeper ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec_n_keeper(.n(ctl_op_cb_rxx_or_sxx_or_swap_or_set_or_res_exec_n));
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
	keeper ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec_n_keeper(.n(ctl_op_inc_or_dec_ss_or_ld_dd_nn_or_pop_qq_exec_n));
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
	keeper ctl_op_reti_m3_n_keeper(.n(ctl_op_reti_m3_n));
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
	keeper ctl_reg_gp_we_mask_n_keeper(.n(ctl_reg_gp_we_mask_n));
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
	keeper int_vector_n_keeper3(.n(int_vector_n3));
	keeper int_vector_n_keeper4(.n(int_vector_n4));
	keeper int_vector_n_keeper5(.n(int_vector_n5));
	keeper new_flag_c_n_keeper(.n(new_flag_c_n));
	keeper new_flag_h_n_keeper(.n(new_flag_h_n));
	keeper new_flag_n_n_keeper(.n(new_flag_n_n));
	keeper new_flag_z_n_keeper(.n(new_flag_z_n));
	keeper alu_cond_fail_n_keeper(.n(alu_cond_fail_n));
	keeper dec1_y107_keeper(.n(dec1_y107));
	keeper dec1_y49_keeper(.n(dec1_y49));
	keeper dec1_y50_keeper(.n(dec1_y50));
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
