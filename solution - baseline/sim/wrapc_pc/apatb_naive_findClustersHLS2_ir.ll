; ModuleID = 'C:/Users/abelo/vitis_workspace/clustering/clustering/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<1>" = type { %"struct.ap_int_base<1, true>" }
%"struct.ap_int_base<1, true>" = type { %"struct.ssdm_int<1, true>" }
%"struct.ssdm_int<1, true>" = type { i1 }
%struct.Point = type { i32, i32, i32 }

; Function Attrs: noinline
define void @apatb_naive_findClustersHLS2_ir([12 x %"struct.ap_int<1>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="12" %grid, [12 x %struct.Point]* noalias nocapture nonnull "fpga.decayed.dim.hint"="12" %pointsGrid) local_unnamed_addr #0 {
entry:
  %grid_copy = alloca [12 x [12 x i1]], align 512
  %pointsGrid_copy = alloca [12 x [12 x i96]], align 512
  %0 = bitcast [12 x %"struct.ap_int<1>"]* %grid to [12 x [12 x %"struct.ap_int<1>"]]*
  %1 = bitcast [12 x %struct.Point]* %pointsGrid to [12 x [12 x %struct.Point]]*
  call fastcc void @copy_in([12 x [12 x %"struct.ap_int<1>"]]* nonnull %0, [12 x [12 x i1]]* nonnull align 512 %grid_copy, [12 x [12 x %struct.Point]]* nonnull %1, [12 x [12 x i96]]* nonnull align 512 %pointsGrid_copy)
  call void @apatb_naive_findClustersHLS2_hw([12 x [12 x i1]]* %grid_copy, [12 x [12 x i96]]* %pointsGrid_copy)
  call void @copy_back([12 x [12 x %"struct.ap_int<1>"]]* %0, [12 x [12 x i1]]* %grid_copy, [12 x [12 x %struct.Point]]* %1, [12 x [12 x i96]]* %pointsGrid_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([12 x [12 x %"struct.ap_int<1>"]]* noalias readonly, [12 x [12 x i1]]* noalias align 512, [12 x [12 x %struct.Point]]* noalias readonly, [12 x [12 x i96]]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a12a12struct.ap_int<1>.21"([12 x [12 x i1]]* align 512 %1, [12 x [12 x %"struct.ap_int<1>"]]* %0)
  call fastcc void @onebyonecpy_hls.p0a12a12struct.Point([12 x [12 x i96]]* align 512 %3, [12 x [12 x %struct.Point]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a12a12struct.ap_int<1>"([12 x [12 x %"struct.ap_int<1>"]]* noalias %dst, [12 x [12 x i1]]* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [12 x [12 x %"struct.ap_int<1>"]]* %dst, null
  %1 = icmp eq [12 x [12 x i1]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a12a12struct.ap_int<1>"([12 x [12 x %"struct.ap_int<1>"]]* nonnull %dst, [12 x [12 x i1]]* nonnull %src, i64 12)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a12a12struct.ap_int<1>"([12 x [12 x %"struct.ap_int<1>"]]* %dst, [12 x [12 x i1]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x [12 x i1]]* %src, null
  %1 = icmp eq [12 x [12 x %"struct.ap_int<1>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [12 x [12 x %"struct.ap_int<1>"]], [12 x [12 x %"struct.ap_int<1>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [12 x [12 x i1]], [12 x [12 x i1]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a12struct.ap_int<1>"([12 x %"struct.ap_int<1>"]* %dst.addr, [12 x i1]* %3, i64 12)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a12struct.ap_int<1>"([12 x %"struct.ap_int<1>"]* %dst, [12 x i1]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x i1]* %src, null
  %1 = icmp eq [12 x %"struct.ap_int<1>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [12 x i1], [12 x i1]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [12 x %"struct.ap_int<1>"], [12 x %"struct.ap_int<1>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = bitcast i1* %3 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  store i1 %6, i1* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a12a12struct.Point([12 x [12 x i96]]* noalias align 512 %dst, [12 x [12 x %struct.Point]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [12 x [12 x i96]]* %dst, null
  %1 = icmp eq [12 x [12 x %struct.Point]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a12a12struct.Point([12 x [12 x i96]]* nonnull %dst, [12 x [12 x %struct.Point]]* nonnull %src, i64 12)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a12a12struct.Point([12 x [12 x i96]]* %dst, [12 x [12 x %struct.Point]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x [12 x %struct.Point]]* %src, null
  %1 = icmp eq [12 x [12 x i96]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [12 x [12 x i96]], [12 x [12 x i96]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [12 x [12 x %struct.Point]], [12 x [12 x %struct.Point]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a12struct.Point([12 x i96]* %3, [12 x %struct.Point]* %src.addr, i64 12)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a12struct.Point([12 x i96]* %dst, [12 x %struct.Point]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x %struct.Point]* %src, null
  %1 = icmp eq [12 x i96]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.01 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %src, i64 0, i64 %for.loop.idx8, i32 0
  %3 = getelementptr [12 x i96], [12 x i96]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i32, i32* %src.addr.01, align 4
  %5 = load i96, i96* %3, align 4
  %6 = zext i32 %4 to i96
  %7 = and i96 %5, -4294967296
  %.partset2 = or i96 %7, %6
  store i96 %.partset2, i96* %3, align 4
  %src.addr.13 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %src, i64 0, i64 %for.loop.idx8, i32 1
  %8 = load i32, i32* %src.addr.13, align 4
  %9 = zext i32 %8 to i96
  %10 = shl i96 %9, 32
  %11 = and i96 %.partset2, -18446744069414584321
  %.partset1 = or i96 %11, %10
  store i96 %.partset1, i96* %3, align 4
  %src.addr.25 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %src, i64 0, i64 %for.loop.idx8, i32 2
  %12 = load i32, i32* %src.addr.25, align 4
  %13 = zext i32 %12 to i96
  %14 = shl i96 %13, 64
  %15 = and i96 %.partset1, 18446744073709551615
  %.partset = or i96 %15, %14
  store i96 %.partset, i96* %3, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([12 x [12 x %"struct.ap_int<1>"]]* noalias, [12 x [12 x i1]]* noalias readonly align 512, [12 x [12 x %struct.Point]]* noalias, [12 x [12 x i96]]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a12a12struct.ap_int<1>"([12 x [12 x %"struct.ap_int<1>"]]* %0, [12 x [12 x i1]]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a12a12struct.Point.7([12 x [12 x %struct.Point]]* %2, [12 x [12 x i96]]* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a12a12struct.Point.7([12 x [12 x %struct.Point]]* noalias %dst, [12 x [12 x i96]]* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [12 x [12 x %struct.Point]]* %dst, null
  %1 = icmp eq [12 x [12 x i96]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a12a12struct.Point.10([12 x [12 x %struct.Point]]* nonnull %dst, [12 x [12 x i96]]* nonnull %src, i64 12)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a12a12struct.Point.10([12 x [12 x %struct.Point]]* %dst, [12 x [12 x i96]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x [12 x i96]]* %src, null
  %1 = icmp eq [12 x [12 x %struct.Point]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [12 x [12 x %struct.Point]], [12 x [12 x %struct.Point]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [12 x [12 x i96]], [12 x [12 x i96]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a12struct.Point.13([12 x %struct.Point]* %dst.addr, [12 x i96]* %3, i64 12)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a12struct.Point.13([12 x %struct.Point]* %dst, [12 x i96]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x i96]* %src, null
  %1 = icmp eq [12 x %struct.Point]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [12 x i96], [12 x i96]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.02 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %dst, i64 0, i64 %for.loop.idx8, i32 0
  %4 = load i96, i96* %3, align 4
  %.partselect2 = trunc i96 %4 to i32
  store i32 %.partselect2, i32* %dst.addr.02, align 4
  %dst.addr.14 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %dst, i64 0, i64 %for.loop.idx8, i32 1
  %5 = load i96, i96* %3, align 4
  %6 = lshr i96 %5, 32
  %.partselect1 = trunc i96 %6 to i32
  store i32 %.partselect1, i32* %dst.addr.14, align 4
  %dst.addr.26 = getelementptr [12 x %struct.Point], [12 x %struct.Point]* %dst, i64 0, i64 %for.loop.idx8, i32 2
  %7 = load i96, i96* %3, align 4
  %8 = lshr i96 %7, 64
  %.partselect = trunc i96 %8 to i32
  store i32 %.partselect, i32* %dst.addr.26, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a12a12struct.ap_int<1>.21"([12 x [12 x i1]]* noalias align 512 %dst, [12 x [12 x %"struct.ap_int<1>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [12 x [12 x i1]]* %dst, null
  %1 = icmp eq [12 x [12 x %"struct.ap_int<1>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a12a12struct.ap_int<1>.24"([12 x [12 x i1]]* nonnull %dst, [12 x [12 x %"struct.ap_int<1>"]]* nonnull %src, i64 12)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a12a12struct.ap_int<1>.24"([12 x [12 x i1]]* %dst, [12 x [12 x %"struct.ap_int<1>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x [12 x %"struct.ap_int<1>"]]* %src, null
  %1 = icmp eq [12 x [12 x i1]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [12 x [12 x i1]], [12 x [12 x i1]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [12 x [12 x %"struct.ap_int<1>"]], [12 x [12 x %"struct.ap_int<1>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a12struct.ap_int<1>.27"([12 x i1]* %3, [12 x %"struct.ap_int<1>"]* %src.addr, i64 12)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a12struct.ap_int<1>.27"([12 x i1]* %dst, [12 x %"struct.ap_int<1>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12 x %"struct.ap_int<1>"]* %src, null
  %1 = icmp eq [12 x i1]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [12 x %"struct.ap_int<1>"], [12 x %"struct.ap_int<1>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [12 x i1], [12 x i1]* %dst, i64 0, i64 %for.loop.idx8
  %4 = bitcast i1* %src.addr.0.0.05 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  store i1 %6, i1* %3, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_naive_findClustersHLS2_hw([12 x [12 x i1]]*, [12 x [12 x i96]]*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([12 x [12 x %"struct.ap_int<1>"]]* noalias, [12 x [12 x i1]]* noalias readonly align 512, [12 x [12 x %struct.Point]]* noalias, [12 x [12 x i96]]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a12a12struct.Point.7([12 x [12 x %struct.Point]]* %2, [12 x [12 x i96]]* align 512 %3)
  ret void
}

define void @naive_findClustersHLS2_hw_stub_wrapper([12 x [12 x i1]]*, [12 x [12 x i96]]*) #5 {
entry:
  %2 = alloca [12 x [12 x %"struct.ap_int<1>"]]
  %3 = alloca [12 x [12 x %struct.Point]]
  call void @copy_out([12 x [12 x %"struct.ap_int<1>"]]* %2, [12 x [12 x i1]]* %0, [12 x [12 x %struct.Point]]* %3, [12 x [12 x i96]]* %1)
  %4 = bitcast [12 x [12 x %"struct.ap_int<1>"]]* %2 to [12 x %"struct.ap_int<1>"]*
  %5 = bitcast [12 x [12 x %struct.Point]]* %3 to [12 x %struct.Point]*
  call void @naive_findClustersHLS2_hw_stub([12 x %"struct.ap_int<1>"]* %4, [12 x %struct.Point]* %5)
  call void @copy_in([12 x [12 x %"struct.ap_int<1>"]]* %2, [12 x [12 x i1]]* %0, [12 x [12 x %struct.Point]]* %3, [12 x [12 x i96]]* %1)
  ret void
}

declare void @naive_findClustersHLS2_hw_stub([12 x %"struct.ap_int<1>"]*, [12 x %struct.Point]*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
