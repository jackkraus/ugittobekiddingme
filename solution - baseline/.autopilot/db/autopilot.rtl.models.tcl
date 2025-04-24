set SynModuleInfo {
  {SRCNAME naive_findClustersHLS1_Pipeline_1 MODELNAME naive_findClustersHLS1_Pipeline_1 RTLNAME naive_findClustersHLS1_naive_findClustersHLS1_Pipeline_1
    SUBMODULES {
      {MODELNAME naive_findClustersHLS1_flow_control_loop_pipe_sequential_init RTLNAME naive_findClustersHLS1_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME naive_findClustersHLS1_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME naive_findClustersHLS1_Pipeline_2 MODELNAME naive_findClustersHLS1_Pipeline_2 RTLNAME naive_findClustersHLS1_naive_findClustersHLS1_Pipeline_2}
  {SRCNAME naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3 MODELNAME naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3 RTLNAME naive_findClustersHLS1_naive_findClustersHLS1_Pipeline_VITIS_LOOP_168_3}
  {SRCNAME naive_findClustersHLS1_Pipeline_4 MODELNAME naive_findClustersHLS1_Pipeline_4 RTLNAME naive_findClustersHLS1_naive_findClustersHLS1_Pipeline_4}
  {SRCNAME naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6 MODELNAME naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6 RTLNAME naive_findClustersHLS1_naive_findClustersHLS1_Pipeline_VITIS_LOOP_199_5_VITIS_LOOP_200_6}
  {SRCNAME naive_findClustersHLS1 MODELNAME naive_findClustersHLS1 RTLNAME naive_findClustersHLS1 IS_TOP 1
    SUBMODULES {
      {MODELNAME naive_findClustersHLS1_clusterArray_x_RAM_AUTO_1R1W RTLNAME naive_findClustersHLS1_clusterArray_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME naive_findClustersHLS1_clusterGrid_x_RAM_AUTO_1R1W RTLNAME naive_findClustersHLS1_clusterGrid_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME naive_findClustersHLS1_stack_x_RAM_AUTO_1R1W RTLNAME naive_findClustersHLS1_stack_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
