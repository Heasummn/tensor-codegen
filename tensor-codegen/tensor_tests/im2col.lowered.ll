; ModuleID = 'im2col.mem2reg.ll'
source_filename = "im2col.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"output: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <9 x i32> @foo(<36 x i32>* byval(<36 x i32>) align 256 %0, <4 x i32> %tensor2) #0 {
entry:
  %malloccall = tail call i8* @malloc(i32 144)
  %1 = bitcast i8* %malloccall to i32*
  %malloccall2 = tail call i8* @malloc(i32 36)
  %2 = bitcast i8* %malloccall2 to i32*
  %tensor1 = load <36 x i32>, <36 x i32>* %0, align 256
  %load.cast = bitcast <36 x i32>* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %malloccall, i8* %load.cast, i32 144, i1 false)
  %malloccall1 = tail call i8* @malloc(i32 16)
  %3 = bitcast i8* %malloccall1 to i32*
  %malloc.cast = bitcast i32* %3 to <4 x i32>*
  store <4 x i32> %tensor2, <4 x i32>* %malloc.cast, align 1
  br label %loop.header

loop.header:                                      ; preds = %entry, %loop.latch
  %loop.iv = phi i32 [ 0, %entry ], [ %loop.step, %loop.latch ]
  %input.stride26 = mul i32 %loop.iv, 36
  %input.stride34 = mul i32 %loop.iv, 4
  %input.stride58 = mul i32 %loop.iv, 9
  br label %loop.header4

loop.header4:                                     ; preds = %loop.header, %loop.latch5
  %loop.iv6 = phi i32 [ 0, %loop.header ], [ %loop.step7, %loop.latch5 ]
  %input.stride24 = mul i32 %loop.iv6, 36
  %input.stride32 = mul i32 %loop.iv6, 4
  %input.stride56 = mul i32 %loop.iv6, 9
  br label %loop.header9

loop.header9:                                     ; preds = %loop.header4, %loop.latch10
  %loop.iv11 = phi i32 [ 0, %loop.header4 ], [ %loop.step12, %loop.latch10 ]
  %input.stride = mul i32 %loop.iv11, 4
  %input.stride54 = mul i32 %loop.iv11, 1
  br label %loop.header14

loop.header14:                                    ; preds = %loop.header9, %loop.latch15
  %loop.iv16 = phi i32 [ 0, %loop.header9 ], [ %loop.step17, %loop.latch15 ]
  br label %loop.header19

loop.header19:                                    ; preds = %loop.header14, %loop.latch20
  %loop.iv21 = phi i32 [ 0, %loop.header14 ], [ %loop.step22, %loop.latch20 ]
  %result.vec.0 = phi <2 x i32> [ zeroinitializer, %loop.header14 ], [ %acc.vector, %loop.latch20 ]
  %result.vec.1 = phi <2 x i32> [ zeroinitializer, %loop.header14 ], [ %acc.vector53, %loop.latch20 ]
  br label %loop.body

loop.body:                                        ; preds = %loop.header19
  %input.offset = add i32 %input.stride, %loop.iv21
  %input.offset25 = add i32 %input.stride24, %input.offset
  %input.offset27 = add i32 %input.stride26, %input.offset25
  %tile.start = getelementptr i32, i32* %1, i32 %input.offset27
  %vec.cast = bitcast i32* %tile.start to <2 x i32>*
  %row.load = load <2 x i32>, <2 x i32>* %vec.cast, align 4
  %vec.gep = getelementptr i32, i32* %tile.start, i32 4
  %vec.cast28 = bitcast i32* %vec.gep to <2 x i32>*
  %row.load29 = load <2 x i32>, <2 x i32>* %vec.cast28, align 4
  %input.stride30 = mul i32 %loop.iv21, 1
  %input.offset31 = add i32 %input.stride30, %loop.iv16
  %input.offset33 = add i32 %input.stride32, %input.offset31
  %input.offset35 = add i32 %input.stride34, %input.offset33
  %tile.start36 = getelementptr i32, i32* %3, i32 %input.offset35
  %vec.cast37 = bitcast i32* %tile.start36 to <2 x i32>*
  %row.load38 = load <2 x i32>, <2 x i32>* %vec.cast37, align 4
  %vec.gep40 = getelementptr i32, i32* %tile.start36, i32 1
  %vec.cast41 = bitcast i32* %vec.gep40 to <2 x i32>*
  %row.load42 = load <2 x i32>, <2 x i32>* %vec.cast41, align 4
  %block = shufflevector <2 x i32> %row.load38, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %4 = extractelement <2 x i32> %row.load, i32 0
  %broadcast.insert = insertelement <2 x i32> poison, i32 %4, i32 0
  %broadcast = shufflevector <2 x i32> %broadcast.insert, <2 x i32> poison, <2 x i32> zeroinitializer
  %5 = mul <2 x i32> %broadcast, %block
  %block43 = shufflevector <2 x i32> %row.load42, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %6 = extractelement <2 x i32> %row.load, i32 1
  %broadcast.insert44 = insertelement <2 x i32> poison, i32 %6, i32 0
  %broadcast45 = shufflevector <2 x i32> %broadcast.insert44, <2 x i32> poison, <2 x i32> zeroinitializer
  %7 = mul <2 x i32> %broadcast45, %block43
  %8 = add <2 x i32> %5, %7
  %9 = shufflevector <2 x i32> %8, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %tile.vect = shufflevector <2 x i32> %result.vec.0, <2 x i32> %9, <2 x i32> <i32 2, i32 3>
  %acc.vector = add <2 x i32> %result.vec.0, %tile.vect
  %block46 = shufflevector <2 x i32> %row.load38, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %10 = extractelement <2 x i32> %row.load29, i32 0
  %broadcast.insert47 = insertelement <2 x i32> poison, i32 %10, i32 0
  %broadcast48 = shufflevector <2 x i32> %broadcast.insert47, <2 x i32> poison, <2 x i32> zeroinitializer
  %11 = mul <2 x i32> %broadcast48, %block46
  %block49 = shufflevector <2 x i32> %row.load42, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %12 = extractelement <2 x i32> %row.load29, i32 1
  %broadcast.insert50 = insertelement <2 x i32> poison, i32 %12, i32 0
  %broadcast51 = shufflevector <2 x i32> %broadcast.insert50, <2 x i32> poison, <2 x i32> zeroinitializer
  %13 = mul <2 x i32> %broadcast51, %block49
  %14 = add <2 x i32> %11, %13
  %15 = shufflevector <2 x i32> %14, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %tile.vect52 = shufflevector <2 x i32> %result.vec.1, <2 x i32> %15, <2 x i32> <i32 2, i32 3>
  %acc.vector53 = add <2 x i32> %result.vec.1, %tile.vect52
  br label %loop.latch20

loop.latch20:                                     ; preds = %loop.body
  %loop.step22 = add i32 %loop.iv21, 2
  %loop.step23 = icmp ult i32 %loop.step22, 4
  br i1 %loop.step23, label %loop.header19, label %loop.latch15

loop.latch15:                                     ; preds = %loop.latch20
  %acc.vector.lcssa = phi <2 x i32> [ %acc.vector, %loop.latch20 ]
  %acc.vector53.lcssa = phi <2 x i32> [ %acc.vector53, %loop.latch20 ]
  %loop.step17 = add i32 %loop.iv16, 2
  %loop.step18 = icmp ult i32 %loop.step17, 1
  %input.offset55 = add i32 %input.stride54, %loop.iv16
  %input.offset57 = add i32 %input.stride56, %input.offset55
  %input.offset59 = add i32 %input.stride58, %input.offset57
  %tile.start60 = getelementptr i32, i32* %2, i32 %input.offset59
  %vec.cast61 = bitcast i32* %tile.start60 to <2 x i32>*
  store <2 x i32> %acc.vector.lcssa, <2 x i32>* %vec.cast61, align 4
  %vec.gep63 = getelementptr i32, i32* %tile.start60, i32 1
  %vec.cast64 = bitcast i32* %vec.gep63 to <2 x i32>*
  store <2 x i32> %acc.vector53.lcssa, <2 x i32>* %vec.cast64, align 4
  br i1 %loop.step18, label %loop.header14, label %loop.latch10

loop.latch10:                                     ; preds = %loop.latch15
  %loop.step12 = add i32 %loop.iv11, 2
  %loop.step13 = icmp ult i32 %loop.step12, 9
  br i1 %loop.step13, label %loop.header9, label %loop.latch5

loop.latch5:                                      ; preds = %loop.latch10
  %loop.step7 = add i32 %loop.iv6, 1
  %loop.step8 = icmp ult i32 %loop.step7, 1
  br i1 %loop.step8, label %loop.header4, label %loop.latch

loop.latch:                                       ; preds = %loop.latch5
  %loop.step = add i32 %loop.iv, 1
  %loop.step3 = icmp ult i32 %loop.step, 1
  br i1 %loop.step3, label %loop.header, label %continue

continue:                                         ; preds = %loop.latch
  %malloc.cast65 = bitcast i32* %2 to <9 x i32>*
  %final.load = load <9 x i32>, <9 x i32>* %malloc.cast65, align 1
  ret <9 x i32> %final.load
}

declare dso_local i32 @tensor_typeinfo36(<36 x i32>* byval(<36 x i32>) align 256, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local i32 @tensor_typeinfo(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local <9 x i32> @tensor_matmul9(i32, i32) #1

declare dso_local i32 @tensor_typeinfo9(<9 x i32>* byval(<9 x i32>) align 64, <4 x i32>, <4 x i32>, <4 x i32>) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %indirect-arg-temp = alloca <36 x i32>, align 256
  store <36 x i32> <i32 1, i32 2, i32 3, i32 5, i32 6, i32 7, i32 9, i32 10, i32 11, i32 2, i32 3, i32 4, i32 6, i32 7, i32 8, i32 10, i32 11, i32 12, i32 5, i32 6, i32 7, i32 9, i32 10, i32 11, i32 13, i32 14, i32 15, i32 6, i32 7, i32 8, i32 10, i32 11, i32 12, i32 14, i32 15, i32 16>, <36 x i32>* %indirect-arg-temp, align 256
  %call = call <9 x i32> @foo(<36 x i32>* byval(<36 x i32>) align 256 %indirect-arg-temp, <4 x i32> <i32 1, i32 2, i32 3, i32 4>)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %vecext = extractelement <9 x i32> %call, i32 %i.0
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %vecext)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !2

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.p0v36i32.v4i32.v4i32.v4i32(<36 x i32>*, <4 x i32>, <4 x i32>, <4 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.v4i32.v4i32.v4i32.v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare <9 x i32> @llvm.tensor.matmul.v9i32(token, token) #2

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.p0v9i32.v4i32.v4i32.v4i32(<9 x i32>*, <4 x i32>, <4 x i32>, <4 x i32>) #2

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="288" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (git@github.com:Heasummn/tensor-codegen.git ae91b57db81660723e6d9eea5e958500276551b6)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
