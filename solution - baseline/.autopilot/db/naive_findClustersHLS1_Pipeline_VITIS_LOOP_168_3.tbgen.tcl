set moduleName naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3
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
set C_modelName {naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ stackIndex_3 int 32 regular  }
	{ stack_x int 32 regular {array 100 { 2 3 } 1 1 }  }
	{ stack_y int 32 regular {array 100 { 2 3 } 1 1 }  }
	{ grid int 32 regular {array 100 { 1 1 } 1 1 }  }
	{ clusterGrid_x int 32 regular {array 100 { 0 0 } 0 1 }  }
	{ clusterGrid_y int 32 regular {array 100 { 0 0 } 0 1 }  }
	{ clusterGrid_clusterID int 32 regular {array 100 { 2 2 } 1 1 }  }
	{ clusterID_3 int 32 regular  }
	{ stackIndex_2_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "stackIndex_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stack_x", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "stack_y", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "grid", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "clusterGrid_x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterGrid_y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "clusterGrid_clusterID", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "clusterID_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stackIndex_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stackIndex_3 sc_in sc_lv 32 signal 0 } 
	{ stack_x_address0 sc_out sc_lv 7 signal 1 } 
	{ stack_x_ce0 sc_out sc_logic 1 signal 1 } 
	{ stack_x_we0 sc_out sc_logic 1 signal 1 } 
	{ stack_x_d0 sc_out sc_lv 32 signal 1 } 
	{ stack_x_q0 sc_in sc_lv 32 signal 1 } 
	{ stack_y_address0 sc_out sc_lv 7 signal 2 } 
	{ stack_y_ce0 sc_out sc_logic 1 signal 2 } 
	{ stack_y_we0 sc_out sc_logic 1 signal 2 } 
	{ stack_y_d0 sc_out sc_lv 32 signal 2 } 
	{ stack_y_q0 sc_in sc_lv 32 signal 2 } 
	{ grid_address0 sc_out sc_lv 7 signal 3 } 
	{ grid_ce0 sc_out sc_logic 1 signal 3 } 
	{ grid_q0 sc_in sc_lv 32 signal 3 } 
	{ grid_address1 sc_out sc_lv 7 signal 3 } 
	{ grid_ce1 sc_out sc_logic 1 signal 3 } 
	{ grid_q1 sc_in sc_lv 32 signal 3 } 
	{ clusterGrid_x_address0 sc_out sc_lv 7 signal 4 } 
	{ clusterGrid_x_ce0 sc_out sc_logic 1 signal 4 } 
	{ clusterGrid_x_we0 sc_out sc_logic 1 signal 4 } 
	{ clusterGrid_x_d0 sc_out sc_lv 32 signal 4 } 
	{ clusterGrid_x_address1 sc_out sc_lv 7 signal 4 } 
	{ clusterGrid_x_ce1 sc_out sc_logic 1 signal 4 } 
	{ clusterGrid_x_we1 sc_out sc_logic 1 signal 4 } 
	{ clusterGrid_x_d1 sc_out sc_lv 32 signal 4 } 
	{ clusterGrid_y_address0 sc_out sc_lv 7 signal 5 } 
	{ clusterGrid_y_ce0 sc_out sc_logic 1 signal 5 } 
	{ clusterGrid_y_we0 sc_out sc_logic 1 signal 5 } 
	{ clusterGrid_y_d0 sc_out sc_lv 32 signal 5 } 
	{ clusterGrid_y_address1 sc_out sc_lv 7 signal 5 } 
	{ clusterGrid_y_ce1 sc_out sc_logic 1 signal 5 } 
	{ clusterGrid_y_we1 sc_out sc_logic 1 signal 5 } 
	{ clusterGrid_y_d1 sc_out sc_lv 32 signal 5 } 
	{ clusterGrid_clusterID_address0 sc_out sc_lv 7 signal 6 } 
	{ clusterGrid_clusterID_ce0 sc_out sc_logic 1 signal 6 } 
	{ clusterGrid_clusterID_we0 sc_out sc_logic 1 signal 6 } 
	{ clusterGrid_clusterID_d0 sc_out sc_lv 32 signal 6 } 
	{ clusterGrid_clusterID_q0 sc_in sc_lv 32 signal 6 } 
	{ clusterGrid_clusterID_address1 sc_out sc_lv 7 signal 6 } 
	{ clusterGrid_clusterID_ce1 sc_out sc_logic 1 signal 6 } 
	{ clusterGrid_clusterID_we1 sc_out sc_logic 1 signal 6 } 
	{ clusterGrid_clusterID_d1 sc_out sc_lv 32 signal 6 } 
	{ clusterGrid_clusterID_q1 sc_in sc_lv 32 signal 6 } 
	{ clusterID_3 sc_in sc_lv 32 signal 7 } 
	{ stackIndex_2_out sc_out sc_lv 32 signal 8 } 
	{ stackIndex_2_out_ap_vld sc_out sc_logic 1 outvld 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stackIndex_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stackIndex_3", "role": "default" }} , 
 	{ "name": "stack_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "stack_x", "role": "address0" }} , 
 	{ "name": "stack_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stack_x", "role": "ce0" }} , 
 	{ "name": "stack_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stack_x", "role": "we0" }} , 
 	{ "name": "stack_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stack_x", "role": "d0" }} , 
 	{ "name": "stack_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stack_x", "role": "q0" }} , 
 	{ "name": "stack_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "stack_y", "role": "address0" }} , 
 	{ "name": "stack_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stack_y", "role": "ce0" }} , 
 	{ "name": "stack_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stack_y", "role": "we0" }} , 
 	{ "name": "stack_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stack_y", "role": "d0" }} , 
 	{ "name": "stack_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stack_y", "role": "q0" }} , 
 	{ "name": "grid_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "grid", "role": "address0" }} , 
 	{ "name": "grid_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "ce0" }} , 
 	{ "name": "grid_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grid", "role": "q0" }} , 
 	{ "name": "grid_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "grid", "role": "address1" }} , 
 	{ "name": "grid_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "ce1" }} , 
 	{ "name": "grid_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grid", "role": "q1" }} , 
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
 	{ "name": "clusterGrid_clusterID_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "q0" }} , 
 	{ "name": "clusterGrid_clusterID_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "address1" }} , 
 	{ "name": "clusterGrid_clusterID_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "ce1" }} , 
 	{ "name": "clusterGrid_clusterID_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "we1" }} , 
 	{ "name": "clusterGrid_clusterID_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "d1" }} , 
 	{ "name": "clusterGrid_clusterID_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterGrid_clusterID", "role": "q1" }} , 
 	{ "name": "clusterID_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "clusterID_3", "role": "default" }} , 
 	{ "name": "stackIndex_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stackIndex_2_out", "role": "default" }} , 
 	{ "name": "stackIndex_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stackIndex_2_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "stackIndex_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "stack_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "stack_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "grid", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid_clusterID", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clusterID_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "stackIndex_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state11", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state11_blk", "QuitState" : "ap_ST_fsm_state11", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state11_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3 {
		stackIndex_3 {Type I LastRead 0 FirstWrite -1}
		stack_x {Type IO LastRead 0 FirstWrite 3}
		stack_y {Type IO LastRead 0 FirstWrite 3}
		grid {Type I LastRead 5 FirstWrite -1}
		clusterGrid_x {Type O LastRead -1 FirstWrite 3}
		clusterGrid_y {Type O LastRead -1 FirstWrite 3}
		clusterGrid_clusterID {Type IO LastRead 6 FirstWrite 6}
		clusterID_3 {Type I LastRead 0 FirstWrite -1}
		stackIndex_2_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	stackIndex_3 { ap_none {  { stackIndex_3 in_data 0 32 } } }
	stack_x { ap_memory {  { stack_x_address0 mem_address 1 7 }  { stack_x_ce0 mem_ce 1 1 }  { stack_x_we0 mem_we 1 1 }  { stack_x_d0 mem_din 1 32 }  { stack_x_q0 in_data 0 32 } } }
	stack_y { ap_memory {  { stack_y_address0 mem_address 1 7 }  { stack_y_ce0 mem_ce 1 1 }  { stack_y_we0 mem_we 1 1 }  { stack_y_d0 mem_din 1 32 }  { stack_y_q0 in_data 0 32 } } }
	grid { ap_memory {  { grid_address0 mem_address 1 7 }  { grid_ce0 mem_ce 1 1 }  { grid_q0 in_data 0 32 }  { grid_address1 MemPortADDR2 1 7 }  { grid_ce1 MemPortCE2 1 1 }  { grid_q1 in_data 0 32 } } }
	clusterGrid_x { ap_memory {  { clusterGrid_x_address0 mem_address 1 7 }  { clusterGrid_x_ce0 mem_ce 1 1 }  { clusterGrid_x_we0 mem_we 1 1 }  { clusterGrid_x_d0 mem_din 1 32 }  { clusterGrid_x_address1 MemPortADDR2 1 7 }  { clusterGrid_x_ce1 MemPortCE2 1 1 }  { clusterGrid_x_we1 MemPortWE2 1 1 }  { clusterGrid_x_d1 MemPortDIN2 1 32 } } }
	clusterGrid_y { ap_memory {  { clusterGrid_y_address0 mem_address 1 7 }  { clusterGrid_y_ce0 mem_ce 1 1 }  { clusterGrid_y_we0 mem_we 1 1 }  { clusterGrid_y_d0 mem_din 1 32 }  { clusterGrid_y_address1 MemPortADDR2 1 7 }  { clusterGrid_y_ce1 MemPortCE2 1 1 }  { clusterGrid_y_we1 MemPortWE2 1 1 }  { clusterGrid_y_d1 MemPortDIN2 1 32 } } }
	clusterGrid_clusterID { ap_memory {  { clusterGrid_clusterID_address0 mem_address 1 7 }  { clusterGrid_clusterID_ce0 mem_ce 1 1 }  { clusterGrid_clusterID_we0 mem_we 1 1 }  { clusterGrid_clusterID_d0 mem_din 1 32 }  { clusterGrid_clusterID_q0 in_data 0 32 }  { clusterGrid_clusterID_address1 MemPortADDR2 1 7 }  { clusterGrid_clusterID_ce1 MemPortCE2 1 1 }  { clusterGrid_clusterID_we1 MemPortWE2 1 1 }  { clusterGrid_clusterID_d1 MemPortDIN2 1 32 }  { clusterGrid_clusterID_q1 in_data 0 32 } } }
	clusterID_3 { ap_none {  { clusterID_3 in_data 0 32 } } }
	stackIndex_2_out { ap_vld {  { stackIndex_2_out out_data 1 32 }  { stackIndex_2_out_ap_vld out_vld 1 1 } } }
}
