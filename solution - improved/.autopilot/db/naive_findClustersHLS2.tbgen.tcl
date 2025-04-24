set moduleName naive_findClustersHLS2
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
set C_modelName {naive_findClustersHLS2}
set C_modelType { void 0 }
set C_modelArgList {
	{ grid int 1 regular {array 144 { 1 3 } 1 1 }  }
	{ pointsGrid int 96 regular {array 144 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "grid", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "pointsGrid", "interface" : "memory", "bitwidth" : 96, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
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
	{ pointsGrid_address0 sc_out sc_lv 8 signal 1 } 
	{ pointsGrid_ce0 sc_out sc_logic 1 signal 1 } 
	{ pointsGrid_we0 sc_out sc_logic 1 signal 1 } 
	{ pointsGrid_d0 sc_out sc_lv 96 signal 1 } 
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
 	{ "name": "pointsGrid_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pointsGrid", "role": "address0" }} , 
 	{ "name": "pointsGrid_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pointsGrid", "role": "ce0" }} , 
 	{ "name": "pointsGrid_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pointsGrid", "role": "we0" }} , 
 	{ "name": "pointsGrid_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "pointsGrid", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "5", "7"],
		"CDFG" : "naive_findClustersHLS2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1656", "EstimateLatencyMax" : "1656",
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
					{"ID" : "7", "SubInstance" : "grp_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner_fu_100", "Port" : "grid", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "3", "SubInstance" : "grp_naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner_fu_85", "Port" : "grid", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "5", "SubInstance" : "grp_naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner_fu_92", "Port" : "grid", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "pointsGrid", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner_fu_100", "Port" : "pointsGrid", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterGrid1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.clusterGrid2_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner_fu_85", "Parent" : "0", "Child" : ["4"],
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner_fu_85.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner_fu_92", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1102", "EstimateLatencyMax" : "1102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "grid", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "SecondPass_SecondPassInner", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state11", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state11_blk", "QuitState" : "ap_ST_fsm_state11", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state11_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner_fu_100", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "146", "EstimateLatencyMax" : "146",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "grid", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pointsGrid", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "clusterGrid1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "clusterGrid2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CreateResult_CreateResultInner", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"}]}


set ArgLastReadFirstWriteLatency {
	naive_findClustersHLS2 {
		grid {Type I LastRead 0 FirstWrite -1}
		pointsGrid {Type O LastRead -1 FirstWrite 1}}
	naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner {
		grid {Type I LastRead 0 FirstWrite -1}
		clusterGrid1 {Type IO LastRead 3 FirstWrite 3}}
	naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner {
		grid {Type I LastRead 0 FirstWrite -1}
		clusterGrid1 {Type I LastRead 6 FirstWrite -1}
		clusterGrid2 {Type O LastRead -1 FirstWrite 6}}
	naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner {
		grid {Type I LastRead 0 FirstWrite -1}
		pointsGrid {Type O LastRead -1 FirstWrite 1}
		clusterGrid1 {Type I LastRead 0 FirstWrite -1}
		clusterGrid2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1656", "Max" : "1656"}
	, {"Name" : "Interval", "Min" : "1657", "Max" : "1657"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	grid { ap_memory {  { grid_address0 mem_address 1 8 }  { grid_ce0 mem_ce 1 1 }  { grid_q0 mem_dout 0 1 } } }
	pointsGrid { ap_memory {  { pointsGrid_address0 mem_address 1 8 }  { pointsGrid_ce0 mem_ce 1 1 }  { pointsGrid_we0 mem_we 1 1 }  { pointsGrid_d0 mem_din 1 96 } } }
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
