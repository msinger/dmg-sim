`default_nettype none

package sm83_timing;

	// Scale for converting Electric VLSI layout units to µm
	parameter real L_unit = 1.0;

	function automatic real R_nmos_ohm(real W_um);
		return 1.0;
	endfunction

	function automatic real R_pmos_ohm(real Wp_um);
		return 1.0;
	endfunction

	function automatic real tpd_elmore_s(real L_um, real R_drv_ohm, real C_extra_F = 0.0);
		return 0.0;
	endfunction

	function automatic realtime tpd_elmore(real L_um, real R_drv_ohm, real C_extra_F = 0.0);
		return 0.0s;
	endfunction

	function automatic realtime tpd_z(realtime T_plh = 0.0s, realtime T_phl = 0.0s, realtime T_min = 0.0s);
		return 0.0s;
	endfunction

endpackage

`default_nettype wire
