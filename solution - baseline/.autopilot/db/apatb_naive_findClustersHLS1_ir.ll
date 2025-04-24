; ModuleID = 'C:/Users/abelo/vitis_workspace/clustering/clustering/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.std::array<std::array<Point, 10>, 10>" = type { [10 x %"struct.std::array<Point, 10>"] }
%"struct.std::array<Point, 10>" = type { [10 x %struct.Point] }
%struct.Point = type { i32, i32, i32 }

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([10 x [10 x i32]]* noalias readonly, [10 x [10 x i32]]* noalias align 512) unnamed_addr #0 {
entry:
  call fastcc void @onebyonecpy_hls.p0a10a10i32([10 x [10 x i32]]* align 512 %1, [10 x [10 x i32]]* %0)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a10a10i32([10 x [10 x i32]]* noalias align 512 %dst, [10 x [10 x i32]]* noalias readonly %src) unnamed_addr #1 {
entry:
  %0 = icmp eq [10 x [10 x i32]]* %dst, null
  %1 = icmp eq [10 x [10 x i32]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a10a10i32([10 x [10 x i32]]* nonnull %dst, [10 x [10 x i32]]* nonnull %src, i64 10)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a10a10i32([10 x [10 x i32]]* %dst, [10 x [10 x i32]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [10 x [10 x i32]]* %src, null
  %1 = icmp eq [10 x [10 x i32]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a10i32([10 x i32]* %dst.addr, [10 x i32]* %src.addr, i64 10)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a10i32([10 x i32]* %dst, [10 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [10 x i32]* %src, null
  %1 = icmp eq [10 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [10 x i32], [10 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [10 x i32], [10 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([10 x [10 x i32]]* noalias, [10 x [10 x i32]]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a10a10i32([10 x [10 x i32]]* %0, [10 x [10 x i32]]* align 512 %1)
  ret void
}

declare void @apatb_naive_findClustersHLS1_hw(%"struct.std::array<std::array<Point, 10>, 10>"*, [10 x [10 x i32]]*, i1)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([10 x [10 x i32]]* noalias, [10 x [10 x i32]]* noalias readonly align 512) unnamed_addr #3 {
entry:
  ret void
}

define void @naive_findClustersHLS1_hw_stub_wrapper(%"struct.std::array<std::array<Point, 10>, 10>"*, [10 x [10 x i32]]*, i1) #4 {
entry:
  call void @copy_out([10 x [10 x i32]]* null, [10 x [10 x i32]]* %1)
  %3 = bitcast [10 x [10 x i32]]* %1 to [10 x i32]*
  call void @naive_findClustersHLS1_hw_stub(%"struct.std::array<std::array<Point, 10>, 10>"* %0, [10 x i32]* %3, i1 %2)
  call void @copy_in([10 x [10 x i32]]* null, [10 x [10 x i32]]* %1)
  ret void
}

declare void @naive_findClustersHLS1_hw_stub(%"struct.std::array<std::array<Point, 10>, 10>"*, [10 x i32]*, i1)

; Function Attrs: noinline
define void @apatb_naive_findClustersHLS1_ir(%"struct.std::array<std::array<Point, 10>, 10>"* %ret, [10 x i32]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="10" %grid, i1 zeroext %debug) #5 {
entry:
  %grid_copy = alloca [10 x [10 x i32]], align 512
  %0 = bitcast [10 x i32]* %grid to [10 x [10 x i32]]*
  call fastcc void @copy_in([10 x [10 x i32]]* nonnull %0, [10 x [10 x i32]]* nonnull align 512 %grid_copy)
  %1 = alloca %"struct.std::array<std::array<Point, 10>, 10>"
  call void @apatb_naive_findClustersHLS1_hw(%"struct.std::array<std::array<Point, 10>, 10>"* %1, [10 x [10 x i32]]* %grid_copy, i1 %debug)
  %2 = load volatile %"struct.std::array<std::array<Point, 10>, 10>", %"struct.std::array<std::array<Point, 10>, 10>"* %1
  call void @copy_back([10 x [10 x i32]]* %0, [10 x [10 x i32]]* %grid_copy)
  %3 = load volatile %"struct.std::array<std::array<Point, 10>, 10>", %"struct.std::array<std::array<Point, 10>, 10>"* %1
  store %"struct.std::array<std::array<Point, 10>, 10>" %3, %"struct.std::array<std::array<Point, 10>, 10>"* %ret
  ret void
}

attributes #0 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }
attributes #5 = { noinline "fpga.wrapper.func"="wrapper" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
