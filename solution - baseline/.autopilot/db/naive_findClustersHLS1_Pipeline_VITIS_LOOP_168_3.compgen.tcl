# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 7 \
    name stack_x \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename stack_x \
    op interface \
    ports { stack_x_address0 { O 7 vector } stack_x_ce0 { O 1 bit } stack_x_we0 { O 1 bit } stack_x_d0 { O 32 vector } stack_x_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'stack_x'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 8 \
    name stack_y \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename stack_y \
    op interface \
    ports { stack_y_address0 { O 7 vector } stack_y_ce0 { O 1 bit } stack_y_we0 { O 1 bit } stack_y_d0 { O 32 vector } stack_y_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'stack_y'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 9 \
    name grid \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename grid \
    op interface \
    ports { grid_address0 { O 7 vector } grid_ce0 { O 1 bit } grid_q0 { I 32 vector } grid_address1 { O 7 vector } grid_ce1 { O 1 bit } grid_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'grid'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 10 \
    name clusterGrid_x \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename clusterGrid_x \
    op interface \
    ports { clusterGrid_x_address0 { O 7 vector } clusterGrid_x_ce0 { O 1 bit } clusterGrid_x_we0 { O 1 bit } clusterGrid_x_d0 { O 32 vector } clusterGrid_x_address1 { O 7 vector } clusterGrid_x_ce1 { O 1 bit } clusterGrid_x_we1 { O 1 bit } clusterGrid_x_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'clusterGrid_x'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 11 \
    name clusterGrid_y \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename clusterGrid_y \
    op interface \
    ports { clusterGrid_y_address0 { O 7 vector } clusterGrid_y_ce0 { O 1 bit } clusterGrid_y_we0 { O 1 bit } clusterGrid_y_d0 { O 32 vector } clusterGrid_y_address1 { O 7 vector } clusterGrid_y_ce1 { O 1 bit } clusterGrid_y_we1 { O 1 bit } clusterGrid_y_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'clusterGrid_y'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 12 \
    name clusterGrid_clusterID \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename clusterGrid_clusterID \
    op interface \
    ports { clusterGrid_clusterID_address0 { O 7 vector } clusterGrid_clusterID_ce0 { O 1 bit } clusterGrid_clusterID_we0 { O 1 bit } clusterGrid_clusterID_d0 { O 32 vector } clusterGrid_clusterID_q0 { I 32 vector } clusterGrid_clusterID_address1 { O 7 vector } clusterGrid_clusterID_ce1 { O 1 bit } clusterGrid_clusterID_we1 { O 1 bit } clusterGrid_clusterID_d1 { O 32 vector } clusterGrid_clusterID_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'clusterGrid_clusterID'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name stackIndex_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stackIndex_3 \
    op interface \
    ports { stackIndex_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name clusterID_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_clusterID_3 \
    op interface \
    ports { clusterID_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name stackIndex_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_stackIndex_2_out \
    op interface \
    ports { stackIndex_2_out { O 32 vector } stackIndex_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName naive_findClustersHLS1_flow_control_loop_pipe_sequential_init_U
set CompName naive_findClustersHLS1_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix naive_findClustersHLS1_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


