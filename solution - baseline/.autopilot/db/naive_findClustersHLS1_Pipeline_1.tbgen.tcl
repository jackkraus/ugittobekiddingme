set moduleName naive_findClustersHLS1_Pipeline_1
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
set C_modelName {naive_findClustersHLS1_Pipeline_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ clusterGrid_x int 32 regular {array 100 { 0 0 } 0 1 }  }
	{ clusterGrid_y int 32 regular {array 100 { 0 0 } 0 1 }  }
	{ clusterGrid_clusterID int 32 regular {array 100 { 0 0 } 0 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "clusterGrid_x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterGrid_y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterGrid_clusterID", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ clusterGrid_x_address0 sc_out sc_lv 7 signal 0 } 
	{ clusterGrid_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ clusterGrid_x_we0 sc_out sc_logic 1 signal 0 } 
	{ clusterGrid_x_d0 sc_out sc_lv 32 signal 0 } 
	{ clusterGrid_x_address1 sc_out sc_lv 7 signal 0 } 
	{ clusterGrid_x_ce1 sc_out sc_logic 1 signal 0 } 
	{ clusterGrid_x_we1 sc_out sc_logic 1 signal 0 } 
	{ clusterGrid_x_d1 sc_out sc_lv 32 signal 0 } 
	{ clusterGrid_y_address0 sc_out sc_lv 7 signal 1 } 
	{ clusterGrid_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid_y_we0 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid_y_d0 sc_out sc_lv 32 signal 1 } 
	{ clusterGrid_y_address1 sc_out sc_lv 7 signal 1 } 
	{ clusterGrid_y_ce1 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid_y_we1 sc_out sc_logic 1 signal 1 } 
	{ clusterGrid_y_d1 sc_out sc_lv 32 signal 1 } 
	{ clusterGrid_clusterID_address0 sc_out sc_lv 7 signal 2 } 
	{ clusterGrid_clusterID_ce0 sc_out sc_logic 1 signal 2 } 
	{ clusterGrid_clusterID_we0 sc_out sc_logic 1 signal 2 } 
	{ clusterGrid_clusterID_d0 sc_out sc_lv 32 signal 2 } 
	{ clusterGrid_clusterID_address1 sc_out sc_lv 7 signal 2 } 
	{ clusterGrid_clusterID_ce1 sc_out sc_logic 1 signal 2 } 
	{ clusterGrid_clusterID_we1 sc_out sc_logic 1 signal 2 } 
	{ clusterGrid_clusterID_d1 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "clusterGrid_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "address0" }} , 
 	{ "name": "clusterGrid_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "ce0" }} , 
 	{ "name": "clusterGrid_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "we0" }} , 
 	{ "name": "clusterGrid_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "d0" }} , 
 	{ "name": "clusterGrid_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "address1" }} , 
 	{ "name": "clusterGrid_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "ce1" }} , 
 	{ "name": "clusterGrid_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "we1" }} , 
 	{ "name": "clusterGrid_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_x", "role": "d1" }} , 
 	{ "name": "clusterGrid_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "address0" }} , 
 	{ "name": "clusterGrid_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "ce0" }} , 
 	{ "name": "clusterGrid_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "we0" }} , 
 	{ "name": "clusterGrid_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "d0" }} , 
 	{ "name": "clusterGrid_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "address1" }} , 
 	{ "name": "clusterGrid_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "ce1" }} , 
 	{ "name": "clusterGrid_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "we1" }} , 
 	{ "name": "clusterGrid_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_y", "role": "d1" }} , 
 	{ "name": "clusterGrid_clusterID_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "address0" }} , 
 	{ "name": "clusterGrid_clusterID_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "ce0" }} , 
 	{ "name": "clusterGrid_clusterID_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "we0" }} , 
 	{ "name": "clusterGrid_clusterID_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "d0" }} , 
 	{ "name": "clusterGrid_clusterID_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "address1" }} , 
 	{ "name": "clusterGrid_clusterID_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "ce1" }} , 
 	{ "name": "clusterGrid_clusterID_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "we1" }} , 
 	{ "name": "clusterGrid_clusterID_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "naive_findClustersHLS1_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "51",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "clusterGrid_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid_clusterID", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state5", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state5_blk", "QuitState" : "ap_ST_fsm_state5", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state5_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS1_Pipeline_1 {
		clusterGrid_x {Type O LastRead -1 FirstWrite 0}
		clusterGrid_y {Type O LastRead -1 FirstWrite 0}
		clusterGrid_clusterID {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "51", "Max" : "51"}
	, {"Name" : "Interval", "Min" : "51", "Max" : "51"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	clusterGrid_x { ap_memory {  { clusterGrid_x_address0 mem_address 1 7 }  { clusterGrid_x_ce0 mem_ce 1 1 }  { clusterGrid_x_we0 mem_we 1 1 }  { clusterGrid_x_d0 mem_din 1 32 }  { clusterGrid_x_address1 MemPortADDR2 1 7 }  { clusterGrid_x_ce1 MemPortCE2 1 1 }  { clusterGrid_x_we1 MemPortWE2 1 1 }  { clusterGrid_x_d1 MemPortDIN2 1 32 } } }
	clusterGrid_y { ap_memory {  { clusterGrid_y_address0 mem_address 1 7 }  { clusterGrid_y_ce0 mem_ce 1 1 }  { clusterGrid_y_we0 mem_we 1 1 }  { clusterGrid_y_d0 mem_din 1 32 }  { clusterGrid_y_address1 MemPortADDR2 1 7 }  { clusterGrid_y_ce1 MemPortCE2 1 1 }  { clusterGrid_y_we1 MemPortWE2 1 1 }  { clusterGrid_y_d1 MemPortDIN2 1 32 } } }
	clusterGrid_clusterID { ap_memory {  { clusterGrid_clusterID_address0 mem_address 1 7 }  { clusterGrid_clusterID_ce0 mem_ce 1 1 }  { clusterGrid_clusterID_we0 mem_we 1 1 }  { clusterGrid_clusterID_d0 mem_din 1 32 }  { clusterGrid_clusterID_address1 MemPortADDR2 1 7 }  { clusterGrid_clusterID_ce1 MemPortCE2 1 1 }  { clusterGrid_clusterID_we1 MemPortWE2 1 1 }  { clusterGrid_clusterID_d1 MemPortDIN2 1 32 } } }
}
