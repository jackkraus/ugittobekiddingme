set SynModuleInfo {
  {SRCNAME naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner MODELNAME naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner RTLNAME naive_findClustersHLS2_naive_findClustersHLS2_Pipeline_FirstPass_FirstPassInner
    SUBMODULES {
      {MODELNAME naive_findClustersHLS2_flow_control_loop_pipe_sequential_init RTLNAME naive_findClustersHLS2_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME naive_findClustersHLS2_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner MODELNAME naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner RTLNAME naive_findClustersHLS2_naive_findClustersHLS2_Pipeline_SecondPass_SecondPassInner}
  {SRCNAME naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner MODELNAME naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner RTLNAME naive_findClustersHLS2_naive_findClustersHLS2_Pipeline_CreateResult_CreateResultInner}
  {SRCNAME naive_findClustersHLS2 MODELNAME naive_findClustersHLS2 RTLNAME naive_findClustersHLS2 IS_TOP 1
    SUBMODULES {
      {MODELNAME naive_findClustersHLS2_clusterGrid1_RAM_2P_BRAM_1R1W RTLNAME naive_findClustersHLS2_clusterGrid1_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME naive_findClustersHLS2_clusterGrid2_RAM_2P_BRAM_1R1W RTLNAME naive_findClustersHLS2_clusterGrid2_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
