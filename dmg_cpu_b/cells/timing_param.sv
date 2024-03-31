`timescale 1ns/1ns
`default_nettype none

parameter time T_INV     = 2ns;
parameter time T_NAND    = T_INV;
parameter time T_NOR     = T_INV;
parameter time T_AND     = 2 * T_INV;
parameter time T_OR      = 2 * T_INV;
parameter time T_XNOR    = 3 * T_INV;
parameter time T_XOR     = 3 * T_INV;
parameter time T_OAI     = T_INV;
parameter time T_AO      = 2 * T_INV;
parameter time T_OA      = 2 * T_INV;
parameter time T_MUXI    = T_INV;
parameter time T_MUX     = 2 * T_INV;
parameter time T_HADD    = T_XOR;
parameter time T_ADD     = T_XOR;
parameter time T_TRI     = T_INV;
parameter time T_TRIB    = 2 * T_INV;
parameter time T_SRL     = 2 * T_INV;
parameter time T_DL_A    = 3 * T_INV;
parameter time T_DL_B    = T_DL_A;
parameter time T_DRL     = T_DL_A;
parameter time T_DFFR_A  = T_DRL;
parameter time T_DFFR_B  = T_DRL;
parameter time T_DFFR_BP = T_DRL;
parameter time T_DFFSR   = T_DRL;
parameter time T_TFFD    = T_DRL;
