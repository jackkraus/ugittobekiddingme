set moduleName naive_findClustersHLS1
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {naive_findClustersHLS1}
set C_modelType { int 9600 }
set C_modelArgList {
	{ grid int 32 regular {array 100 { 1 1 } 1 1 }  }
	{ debug uint 1 unused  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "grid", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "debug", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 9600} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ grid_address0 sc_out sc_lv 7 signal 0 } 
	{ grid_ce0 sc_out sc_logic 1 signal 0 } 
	{ grid_q0 sc_in sc_lv 32 signal 0 } 
	{ grid_address1 sc_out sc_lv 7 signal 0 } 
	{ grid_ce1 sc_out sc_logic 1 signal 0 } 
	{ grid_q1 sc_in sc_lv 32 signal 0 } 
	{ debug sc_in sc_lv 1 signal 1 } 
	{ ap_return sc_out sc_lv 9600 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "grid_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "grid", "role": "address0" }} , 
 	{ "name": "grid_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "ce0" }} , 
 	{ "name": "grid_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grid", "role": "q0" }} , 
 	{ "name": "grid_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "grid", "role": "address1" }} , 
 	{ "name": "grid_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grid", "role": "ce1" }} , 
 	{ "name": "grid_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grid", "role": "q1" }} , 
 	{ "name": "debug", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "debug", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":9600, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "13", "15", "17"],
		"CDFG" : "naive_findClustersHLS1",
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
			{"Name" : "grid", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3_fu_2545", "Port" : "grid", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "debug", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_151_1_VITIS_LOOP_152_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterArray_x_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterArray_y_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterArray_clusterID_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterGrid_x_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterGrid_y_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterGrid_clusterID_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.stack_x_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.stack_y_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_1_fu_2520", "Parent" : "0", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_1_fu_2520.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_2_fu_2530", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "naive_findClustersHLS1_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "101", "EstimateLatencyMax" : "101",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "stack_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "stack_y", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_2_fu_2530.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_4_fu_2538", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "naive_findClustersHLS1_Pipeline_4",
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
			{"Name" : "clusterArray_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterArray_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterArray_clusterID", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state5", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state5_blk", "QuitState" : "ap_ST_fsm_state5", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state5_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_4_fu_2538.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3_fu_2545", "Parent" : "0", "Child" : ["16"],
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
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3_fu_2545.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6_fu_2559", "Parent" : "0", "Child" : ["18"],
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6_fu_2559.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS1 {
		grid {Type I LastRead 5 FirstWrite -1}
		debug {Type I LastRead -1 FirstWrite -1}}
	naive_findClustersHLS1_Pipeline_1 {
		clusterGrid_x {Type O LastRead -1 FirstWrite 0}
		clusterGrid_y {Type O LastRead -1 FirstWrite 0}
		clusterGrid_clusterID {Type O LastRead -1 FirstWrite 0}}
	naive_findClustersHLS1_Pipeline_2 {
		stack_x {Type O LastRead -1 FirstWrite 0}
		stack_y {Type O LastRead -1 FirstWrite 0}}
	naive_findClustersHLS1_Pipeline_4 {
		clusterArray_x {Type O LastRead -1 FirstWrite 0}
		clusterArray_y {Type O LastRead -1 FirstWrite 0}
		clusterArray_clusterID {Type O LastRead -1 FirstWrite 0}}
	naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3 {
		stackIndex_3 {Type I LastRead 0 FirstWrite -1}
		stack_x {Type IO LastRead 0 FirstWrite 3}
		stack_y {Type IO LastRead 0 FirstWrite 3}
		grid {Type I LastRead 5 FirstWrite -1}
		clusterGrid_x {Type O LastRead -1 FirstWrite 3}
		clusterGrid_y {Type O LastRead -1 FirstWrite 3}
		clusterGrid_clusterID {Type IO LastRead 6 FirstWrite 6}
		clusterID_3 {Type I LastRead 0 FirstWrite -1}
		stackIndex_2_out {Type O LastRead -1 FirstWrite 0}}
	naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6 {
		clusterArray_x {Type O LastRead -1 FirstWrite 1}
		clusterArray_y {Type O LastRead -1 FirstWrite 1}
		clusterArray_clusterID {Type O LastRead -1 FirstWrite 1}
		clusterGrid_x {Type I LastRead 0 FirstWrite -1}
		clusterGrid_y {Type I LastRead 0 FirstWrite -1}
		clusterGrid_clusterID {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	grid { ap_memory {  { grid_address0 mem_address 1 7 }  { grid_ce0 mem_ce 1 1 }  { grid_q0 in_data 0 32 }  { grid_address1 MemPortADDR2 1 7 }  { grid_ce1 MemPortCE2 1 1 }  { grid_q1 MemPortDOUT2 0 32 } } }
	debug { ap_none {  { debug in_data 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
