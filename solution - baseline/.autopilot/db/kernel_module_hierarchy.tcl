set ModuleHierarchy {[{
"Name" : "naive_findClustersHLS1","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_naive_findClustersHLS1_Pipeline_1_fu_2520","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Loop 1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_naive_findClustersHLS1_Pipeline_2_fu_2530","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Loop 1","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_naive_findClustersHLS1_Pipeline_4_fu_2538","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Loop 1","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6_fu_2559","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_199_5_VITIS_LOOP_200_6","ID" : "8","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_151_1_VITIS_LOOP_152_2","ID" : "9","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3_fu_2545","ID" : "10","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_168_3","ID" : "11","Type" : "pipeline"},]},]},]
}]}