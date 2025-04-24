set moduleName naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6}
set C_modelType { void 0 }
set C_modelArgList {
	{ clusterArray_x int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ clusterArray_y int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ clusterArray_clusterID int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ clusterGrid_x int 32 regular {array 100 { 1 3 } 1 1 }  }
	{ clusterGrid_y int 32 regular {array 100 { 1 3 } 1 1 }  }
	{ clusterGrid_clusterID int 32 regular {array 100 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "clusterArray_x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterArray_y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterArray_clusterID", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterGrid_x", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "clusterGrid_y", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "clusterGrid_clusterID", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ clusterArray_x_address0 sc_out sc_lv 7 signal 0 } 
	{ clusterArray_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ clusterArray_x_we0 sc_out sc_logic 1 signal 0 } 
	{ clusterArray_x_d0 sc_out sc_lv 32 signal 0 } 
	{ clusterArray_y_address0 sc_out sc_lv 7 signal 1 } 
	{ clusterArray_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ clusterArray_y_we0 sc_out sc_logic 1 signal 1 } 
	{ clusterArray_y_d0 sc_out sc_lv 32 signal 1 } 
	{ clusterArray_clusterID_address0 sc_out sc_lv 7 signal 2 } 
	{ clusterArray_clusterID_ce0 sc_out sc_logic 1 signal 2 } 
	{ clusterArray_clusterID_we0 sc_out sc_logic 1 signal 2 } 
	{ clusterArray_clusterID_d0 sc_out sc_lv 32 signal 2 } 
	{ clusterGrid_x_address0 sc_out sc_lv 7 signal 3 } 
	{ clusterGrid_x_ce0 sc_out sc_logic 1 signal 3 } 
	{ clusterGrid_x_q0 sc_in sc_lv 32 signal 3 } 
	{ clusterGrid_y_address0 sc_out sc_lv 7 signal 4 } 
	{ clusterGrid_y_ce0 sc_out sc_logic 1 signal 4 } 
	{ clusterGrid_y_q0 sc_in sc_lv 32 signal 4 } 
	{ clusterGrid_clusterID_address0 sc_out sc_lv 7 signal 5 } 
	{ clusterGrid_clusterID_ce0 sc_out sc_logic 1 signal 5 } 
	{ clusterGrid_clusterID_q0 sc_in sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "clusterArray_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterArray_x", "role": "address0" }} , 
 	{ "name": "clusterArray_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_x", "role": "ce0" }} , 
 	{ "name": "clusterArray_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_x", "role": "we0" }} , 
 	{ "name": "clusterArray_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterArray_x", "role": "d0" }} , 
 	{ "name": "clusterArray_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterArray_y", "role": "address0" }} , 
 	{ "name": "clusterArray_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_y", "role": "ce0" }} , 
 	{ "name": "clusterArray_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_y", "role": "we0" }} , 
 	{ "name": "clusterArray_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterArray_y", "role": "d0" }} , 
 	{ "name": "clusterArray_clusterID_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterArray_clusterID", "role": "address0" }} , 
 	{ "name": "clusterArray_clusterID_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_clusterID", "role": "ce0" }} , 
 	{ "name": "clusterArray_clusterID_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterArray_clusterID", "role": "we0" }} , 
 	{ "name": "clusterArray_clusterID_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterArray_clusterID", "role": "d0" }} , 
 	{ "name": "clusterGrid_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "address0" }} , 
 	{ "name": "clusterGrid_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "ce0" }} , 
 	{ "name": "clusterGrid_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "q0" }} , 
 	{ "name": "clusterGrid_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "address0" }} , 
 	{ "name": "clusterGrid_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "ce0" }} , 
 	{ "name": "clusterGrid_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "q0" }} , 
 	{ "name": "clusterGrid_clusterID_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "address0" }} , 
 	{ "name": "clusterGrid_clusterID_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "ce0" }} , 
 	{ "name": "clusterGrid_clusterID_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "clusterArray_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterArray_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterArray_clusterID", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid_clusterID", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_199_5_VITIS_LOOP_200_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6 {
		clusterArray_x {Type O LastRead -1 FirstWrite 1}
		clusterArray_y {Type O LastRead -1 FirstWrite 1}
		clusterArray_clusterID {Type O LastRead -1 FirstWrite 1}
		clusterGrid_x {Type I LastRead 0 FirstWrite -1}
		clusterGrid_y {Type I LastRead 0 FirstWrite -1}
		clusterGrid_clusterID {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "102", "Max" : "102"}
	, {"Name" : "Interval", "Min" : "102", "Max" : "102"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	clusterArray_x { ap_memory {  { clusterArray_x_address0 mem_address 1 7 }  { clusterArray_x_ce0 mem_ce 1 1 }  { clusterArray_x_we0 mem_we 1 1 }  { clusterArray_x_d0 mem_din 1 32 } } }
	clusterArray_y { ap_memory {  { clusterArray_y_address0 mem_address 1 7 }  { clusterArray_y_ce0 mem_ce 1 1 }  { clusterArray_y_we0 mem_we 1 1 }  { clusterArray_y_d0 mem_din 1 32 } } }
	clusterArray_clusterID { ap_memory {  { clusterArray_clusterID_address0 mem_address 1 7 }  { clusterArray_clusterID_ce0 mem_ce 1 1 }  { clusterArray_clusterID_we0 mem_we 1 1 }  { clusterArray_clusterID_d0 mem_din 1 32 } } }
	clusterGrid_x { ap_memory {  { clusterGrid_x_address0 mem_address 1 7 }  { clusterGrid_x_ce0 mem_ce 1 1 }  { clusterGrid_x_q0 in_data 0 32 } } }
	clusterGrid_y { ap_memory {  { clusterGrid_y_address0 mem_address 1 7 }  { clusterGrid_y_ce0 mem_ce 1 1 }  { clusterGrid_y_q0 in_data 0 32 } } }
	clusterGrid_clusterID { ap_memory {  { clusterGrid_clusterID_address0 mem_address 1 7 }  { clusterGrid_clusterID_ce0 mem_ce 1 1 }  { clusterGrid_clusterID_q0 in_data 0 32 } } }
}
