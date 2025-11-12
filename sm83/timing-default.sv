`default_nettype none

package sm83_timing;

	// Wire parasitics
	parameter real Rprime_wire = 0.05;    // ohm/µm
	parameter real Cprime_wire = 0.2e-15; // F/µm

	// Transistor drive constants
	parameter real Lref_um     = 1.0;     // reference channel length for kR
	parameter real Leff_um     = 1.2;     // guessed for DMG technology
	parameter real kR_nmos_ref = 1.0e4;   // ohm*µm for Lref
	parameter real gamma_pn    = 2.0;     // PMOS = gamma * NMOS resistance

	parameter real Cint_stage_F = 0.5e-15; // F intrinsic capacitance added after each stage

	// Scale for converting Electric VLSI layout units to µm
	parameter real L_unit      = 0.432;

	parameter realtime T_Z_min = 5ps;

	localparam real kR_nmos = kR_nmos_ref * (Leff_um / Lref_um);

	function automatic real R_nmos_ohm(real W_um);
		return kR_nmos / W_um;
	endfunction

	function automatic real R_pmos_ohm(real Wp_um);
		return gamma_pn * kR_nmos / Wp_um;
	endfunction

	function automatic real C_wire_F(real L_um);
		return Cprime_wire * L_um;
	endfunction

	function automatic real R_wire_ohm(real L_um);
		return Rprime_wire * L_um;
	endfunction

	function automatic real tpd_elmore_s(real L_um, real R_drv_ohm, real C_extra_F = 0.0);
		const real Cw = C_wire_F(L_um);
		const real Rw = R_wire_ohm(L_um);
		return 0.69 * R_drv_ohm * (Cw + Cint_stage_F + C_extra_F) + 0.38 * Rw * Cw; // seconds
	endfunction

	function automatic realtime tpd_elmore(real L_um, real R_drv_ohm, real C_extra_F = 0.0);
		return tpd_elmore_s(L_um, R_drv_ohm, C_extra_F) * 1s; // scaled to timeunit
	endfunction

	function automatic realtime tpd_z(realtime T_plh = 0.0s, realtime T_phl = 0.0s, realtime T_min = T_Z_min);
		const realtime T_pd = (T_plh >= T_phl) ? T_plh : T_phl;
		return (0.2 * T_pd) > T_min ? (0.2 * T_pd) : T_min;
	endfunction

endpackage

`default_nettype wire
