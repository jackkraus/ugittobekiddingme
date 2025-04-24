set ModuleHierarchy {[{
"Name" : "naive_findClustersHLS2","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner_fu_85","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "FirstPass_FirstPassInner","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner_fu_92","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "SecondPass_SecondPassInner","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner_fu_100","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "CreateResult_CreateResultInner","ID" : "6","Type" : "pipeline"},]},]
}]}