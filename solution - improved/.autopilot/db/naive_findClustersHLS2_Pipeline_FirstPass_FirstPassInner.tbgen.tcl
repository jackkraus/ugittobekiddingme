set moduleName naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner
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
set C_modelName {naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner}
set C_modelType { void 0 }
set C_modelArgList {
	{ grid int 1 regular {array 144 { 1 3 } 1 1 }  }
	{ clusterGrid1 int 16 regular {array 144 { 1 2 } 1 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "grid", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "clusterGrid1", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ grid_address0 sc_out sc_lv 8 signal 0 } 
	{ grid_ce0 sc_out sc_logic 1 signal 0 } 
	{ grid_q0 sc_in sc_lv 1 signal 0 } 
	{ clusterGrid1_address0 sc_out sc_lv 8 signal 1 } 
	{ clusterGrid1_ce0 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid1_q0 sc_in sc_lv 16 signal 1 } 
	{ clusterGrid1_address1 sc_out sc_lv 8 signal 1 } 
	{ clusterGrid1_ce1 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid1_we1 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid1_d1 sc_out sc_lv 16 signal 1 } 
	{ clusterGrid1_q1 sc_in sc_lv 16 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "grid_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "grid", "role": "address0" }} , 
 	{ "name": "grid_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "ce0" }} , 
 	{ "name": "grid_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "q0" }} , 
 	{ "name": "clusterGrid1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "address0" }} , 
 	{ "name": "clusterGrid1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "ce0" }} , 
 	{ "name": "clusterGrid1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "q0" }} , 
 	{ "name": "clusterGrid1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "address1" }} , 
 	{ "name": "clusterGrid1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "ce1" }} , 
 	{ "name": "clusterGrid1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "we1" }} , 
 	{ "name": "clusterGrid1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "d1" }} , 
 	{ "name": "clusterGrid1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "clusterGrid1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "402", "EstimateLatencyMax" : "402",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "grid", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "FirstPass_FirstPassInner", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state4", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state4_blk", "QuitState" : "ap_ST_fsm_state4", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state4_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner {
		grid {Type I LastRead 0 FirstWrite -1}
		clusterGrid1 {Type IO LastRead 3 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "402", "Max" : "402"}
	, {"Name" : "Interval", "Min" : "402", "Max" : "402"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	grid { ap_memory {  { grid_address0 mem_address 1 8 }  { grid_ce0 mem_ce 1 1 }  { grid_q0 in_data 0 1 } } }
	clusterGrid1 { ap_memory {  { clusterGrid1_address0 mem_address 1 8 }  { clusterGrid1_ce0 mem_ce 1 1 }  { clusterGrid1_q0 in_data 0 16 }  { clusterGrid1_address1 MemPortADDR2 1 8 }  { clusterGrid1_ce1 MemPortCE2 1 1 }  { clusterGrid1_we1 MemPortWE2 1 1 }  { clusterGrid1_d1 MemPortDIN2 1 16 }  { clusterGrid1_q1 in_data 0 16 } } }
}
