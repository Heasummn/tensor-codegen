; ModuleID = 'conv.mem2reg.ll'
source_filename = "conv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"output: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <9 x i32> @foo(<16 x i32>* byval(<16 x i32>) align 64 %0, <4 x i32> %tensor2) #0 {
entry:
  %malloccall = tail call i8* @malloc(i32 64)
  %1 = bitcast i8* %malloccall to i32*
  %malloccall2 = tail call i8* @malloc(i32 36)
  %2 = bitcast i8* %malloccall2 to i32*
  %tensor1 = load <16 x i32>, <16 x i32>* %0, align 64
  %load.cast = bitcast <16 x i32>* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %malloccall, i8* %load.cast, i32 64, i1 false)
  %malloccall1 = tail call i8* @malloc(i32 16)
  %3 = bitcast i8* %malloccall1 to i32*
  %malloc.cast = bitcast i32* %3 to <4 x i32>*
  store <4 x i32> %tensor2, <4 x i32>* %malloc.cast, align 1
  %vec.cast = bitcast i32* %1 to <16 x i32>*
  %input.load = load <16 x i32>, <16 x i32>* %vec.cast, align 1
  %convs.sub = sub i32 4, 2
  %convs.single = add i32 %convs.sub, 1
  %convs.number = mul i32 %convs.single, %convs.single
  %im2col.size = mul i32 4, %convs.number
  %malloccall5 = tail call i8* @malloc(i32 %im2col.size)
  %4 = bitcast i8* %malloccall5 to i32*
  %im2col.extract = extractelement <16 x i32> %input.load, i32 0
  %im2col.elem = getelementptr i32, i32* %4, i32 0
  store i32 %im2col.extract, i32* %im2col.elem, align 4
  %im2col.extract6 = extractelement <16 x i32> %input.load, i32 1
  %im2col.elem7 = getelementptr i32, i32* %4, i32 1
  store i32 %im2col.extract6, i32* %im2col.elem7, align 4
  %im2col.extract8 = extractelement <16 x i32> %input.load, i32 2
  %im2col.elem9 = getelementptr i32, i32* %4, i32 2
  store i32 %im2col.extract8, i32* %im2col.elem9, align 4
  %im2col.extract10 = extractelement <16 x i32> %input.load, i32 4
  %im2col.elem11 = getelementptr i32, i32* %4, i32 3
  store i32 %im2col.extract10, i32* %im2col.elem11, align 4
  %im2col.extract12 = extractelement <16 x i32> %input.load, i32 5
  %im2col.elem13 = getelementptr i32, i32* %4, i32 4
  store i32 %im2col.extract12, i32* %im2col.elem13, align 4
  %im2col.extract14 = extractelement <16 x i32> %input.load, i32 6
  %im2col.elem15 = getelementptr i32, i32* %4, i32 5
  store i32 %im2col.extract14, i32* %im2col.elem15, align 4
  %im2col.extract16 = extractelement <16 x i32> %input.load, i32 8
  %im2col.elem17 = getelementptr i32, i32* %4, i32 6
  store i32 %im2col.extract16, i32* %im2col.elem17, align 4
  %im2col.extract18 = extractelement <16 x i32> %input.load, i32 9
  %im2col.elem19 = getelementptr i32, i32* %4, i32 7
  store i32 %im2col.extract18, i32* %im2col.elem19, align 4
  %im2col.extract20 = extractelement <16 x i32> %input.load, i32 10
  %im2col.elem21 = getelementptr i32, i32* %4, i32 8
  store i32 %im2col.extract20, i32* %im2col.elem21, align 4
  %im2col.extract22 = extractelement <16 x i32> %input.load, i32 1
  %im2col.elem23 = getelementptr i32, i32* %4, i32 9
  store i32 %im2col.extract22, i32* %im2col.elem23, align 4
  %im2col.extract24 = extractelement <16 x i32> %input.load, i32 2
  %im2col.elem25 = getelementptr i32, i32* %4, i32 10
  store i32 %im2col.extract24, i32* %im2col.elem25, align 4
  %im2col.extract26 = extractelement <16 x i32> %input.load, i32 3
  %im2col.elem27 = getelementptr i32, i32* %4, i32 11
  store i32 %im2col.extract26, i32* %im2col.elem27, align 4
  %im2col.extract28 = extractelement <16 x i32> %input.load, i32 5
  %im2col.elem29 = getelementptr i32, i32* %4, i32 12
  store i32 %im2col.extract28, i32* %im2col.elem29, align 4
  %im2col.extract30 = extractelement <16 x i32> %input.load, i32 6
  %im2col.elem31 = getelementptr i32, i32* %4, i32 13
  store i32 %im2col.extract30, i32* %im2col.elem31, align 4
  %im2col.extract32 = extractelement <16 x i32> %input.load, i32 7
  %im2col.elem33 = getelementptr i32, i32* %4, i32 14
  store i32 %im2col.extract32, i32* %im2col.elem33, align 4
  %im2col.extract34 = extractelement <16 x i32> %input.load, i32 9
  %im2col.elem35 = getelementptr i32, i32* %4, i32 15
  store i32 %im2col.extract34, i32* %im2col.elem35, align 4
  %im2col.extract36 = extractelement <16 x i32> %input.load, i32 10
  %im2col.elem37 = getelementptr i32, i32* %4, i32 16
  store i32 %im2col.extract36, i32* %im2col.elem37, align 4
  %im2col.extract38 = extractelement <16 x i32> %input.load, i32 11
  %im2col.elem39 = getelementptr i32, i32* %4, i32 17
  store i32 %im2col.extract38, i32* %im2col.elem39, align 4
  %im2col.extract40 = extractelement <16 x i32> %input.load, i32 4
  %im2col.elem41 = getelementptr i32, i32* %4, i32 18
  store i32 %im2col.extract40, i32* %im2col.elem41, align 4
  %im2col.extract42 = extractelement <16 x i32> %input.load, i32 5
  %im2col.elem43 = getelementptr i32, i32* %4, i32 19
  store i32 %im2col.extract42, i32* %im2col.elem43, align 4
  %im2col.extract44 = extractelement <16 x i32> %input.load, i32 6
  %im2col.elem45 = getelementptr i32, i32* %4, i32 20
  store i32 %im2col.extract44, i32* %im2col.elem45, align 4
  %im2col.extract46 = extractelement <16 x i32> %input.load, i32 8
  %im2col.elem47 = getelementptr i32, i32* %4, i32 21
  store i32 %im2col.extract46, i32* %im2col.elem47, align 4
  %im2col.extract48 = extractelement <16 x i32> %input.load, i32 9
  %im2col.elem49 = getelementptr i32, i32* %4, i32 22
  store i32 %im2col.extract48, i32* %im2col.elem49, align 4
  %im2col.extract50 = extractelement <16 x i32> %input.load, i32 10
  %im2col.elem51 = getelementptr i32, i32* %4, i32 23
  store i32 %im2col.extract50, i32* %im2col.elem51, align 4
  %im2col.extract52 = extractelement <16 x i32> %input.load, i32 12
  %im2col.elem53 = getelementptr i32, i32* %4, i32 24
  store i32 %im2col.extract52, i32* %im2col.elem53, align 4
  %im2col.extract54 = extractelement <16 x i32> %input.load, i32 13
  %im2col.elem55 = getelementptr i32, i32* %4, i32 25
  store i32 %im2col.extract54, i32* %im2col.elem55, align 4
  %im2col.extract56 = extractelement <16 x i32> %input.load, i32 14
  %im2col.elem57 = getelementptr i32, i32* %4, i32 26
  store i32 %im2col.extract56, i32* %im2col.elem57, align 4
  %im2col.extract58 = extractelement <16 x i32> %input.load, i32 5
  %im2col.elem59 = getelementptr i32, i32* %4, i32 27
  store i32 %im2col.extract58, i32* %im2col.elem59, align 4
  %im2col.extract60 = extractelement <16 x i32> %input.load, i32 6
  %im2col.elem61 = getelementptr i32, i32* %4, i32 28
  store i32 %im2col.extract60, i32* %im2col.elem61, align 4
  %im2col.extract62 = extractelement <16 x i32> %input.load, i32 7
  %im2col.elem63 = getelementptr i32, i32* %4, i32 29
  store i32 %im2col.extract62, i32* %im2col.elem63, align 4
  %im2col.extract64 = extractelement <16 x i32> %input.load, i32 9
  %im2col.elem65 = getelementptr i32, i32* %4, i32 30
  store i32 %im2col.extract64, i32* %im2col.elem65, align 4
  %im2col.extract66 = extractelement <16 x i32> %input.load, i32 10
  %im2col.elem67 = getelementptr i32, i32* %4, i32 31
  store i32 %im2col.extract66, i32* %im2col.elem67, align 4
  %im2col.extract68 = extractelement <16 x i32> %input.load, i32 11
  %im2col.elem69 = getelementptr i32, i32* %4, i32 32
  store i32 %im2col.extract68, i32* %im2col.elem69, align 4
  %im2col.extract70 = extractelement <16 x i32> %input.load, i32 13
  %im2col.elem71 = getelementptr i32, i32* %4, i32 33
  store i32 %im2col.extract70, i32* %im2col.elem71, align 4
  %im2col.extract72 = extractelement <16 x i32> %input.load, i32 14
  %im2col.elem73 = getelementptr i32, i32* %4, i32 34
  store i32 %im2col.extract72, i32* %im2col.elem73, align 4
  %im2col.extract74 = extractelement <16 x i32> %input.load, i32 15
  %im2col.elem75 = getelementptr i32, i32* %4, i32 35
  store i32 %im2col.extract74, i32* %im2col.elem75, align 4
  br label %loop.header

loop.header:                                      ; preds = %entry, %loop.latch
  %loop.iv = phi i32 [ 0, %entry ], [ %loop.step, %loop.latch ]
  %input.stride117 = mul i32 %loop.iv, 9
  br label %loop.header78

loop.header78:                                    ; preds = %loop.header, %loop.latch79
  %loop.iv80 = phi i32 [ 0, %loop.header ], [ %loop.step81, %loop.latch79 ]
  %input.stride91 = mul i32 %loop.iv80, 4
  br label %loop.header83

loop.header83:                                    ; preds = %loop.header78, %loop.latch84
  %loop.iv85 = phi i32 [ 0, %loop.header78 ], [ %loop.step86, %loop.latch84 ]
  %result.vec.0 = phi <2 x i32> [ zeroinitializer, %loop.header78 ], [ %acc.vector, %loop.latch84 ]
  %result.vec.1 = phi <2 x i32> [ zeroinitializer, %loop.header78 ], [ %acc.vector116, %loop.latch84 ]
  br label %loop.body

loop.body:                                        ; preds = %loop.header83
  %input.stride = mul i32 %loop.iv85, 1
  %input.offset = add i32 %input.stride, %loop.iv
  %tile.start = getelementptr i32, i32* %3, i32 %input.offset
  %vec.cast88 = bitcast i32* %tile.start to <2 x i32>*
  %row.load = load <2 x i32>, <2 x i32>* %vec.cast88, align 4
  %vec.gep = getelementptr i32, i32* %tile.start, i32 1
  %vec.cast89 = bitcast i32* %vec.gep to <2 x i32>*
  %row.load90 = load <2 x i32>, <2 x i32>* %vec.cast89, align 4
  %input.offset92 = add i32 %input.stride91, %loop.iv85
  %tile.start93 = getelementptr i32, i32* %4, i32 %input.offset92
  %vec.cast94 = bitcast i32* %tile.start93 to <2 x i32>*
  %row.load95 = load <2 x i32>, <2 x i32>* %vec.cast94, align 4
  %vec.gep97 = getelementptr i32, i32* %tile.start93, i32 4
  %vec.cast98 = bitcast i32* %vec.gep97 to <2 x i32>*
  %row.load99 = load <2 x i32>, <2 x i32>* %vec.cast98, align 4
  %block = shufflevector <2 x i32> %row.load, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %5 = extractelement <2 x i32> %row.load95, i32 0
  %broadcast.insert = insertelement <2 x i32> poison, i32 %5, i32 0
  %broadcast = shufflevector <2 x i32> %broadcast.insert, <2 x i32> poison, <2 x i32> zeroinitializer
  %6 = mul <2 x i32> %block, %broadcast
  %block100 = shufflevector <2 x i32> %row.load90, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %7 = extractelement <2 x i32> %row.load95, i32 1
  %broadcast.insert101 = insertelement <2 x i32> poison, i32 %7, i32 0
  %broadcast102 = shufflevector <2 x i32> %broadcast.insert101, <2 x i32> poison, <2 x i32> zeroinitializer
  %8 = mul <2 x i32> %block100, %broadcast102
  %9 = add <2 x i32> %6, %8
  %vect.split = extractelement <2 x i32> %9, i32 0
  %insert.elem = insertelement <2 x i32> undef, i32 %vect.split, i32 0
  %vect.split103 = extractelement <2 x i32> %9, i32 1
  %insert.elem104 = insertelement <2 x i32> undef, i32 %vect.split103, i32 0
  %block105 = shufflevector <2 x i32> %row.load, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %10 = extractelement <2 x i32> %row.load99, i32 0
  %broadcast.insert106 = insertelement <2 x i32> poison, i32 %10, i32 0
  %broadcast107 = shufflevector <2 x i32> %broadcast.insert106, <2 x i32> poison, <2 x i32> zeroinitializer
  %11 = mul <2 x i32> %block105, %broadcast107
  %block108 = shufflevector <2 x i32> %row.load90, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %12 = extractelement <2 x i32> %row.load99, i32 1
  %broadcast.insert109 = insertelement <2 x i32> poison, i32 %12, i32 0
  %broadcast110 = shufflevector <2 x i32> %broadcast.insert109, <2 x i32> poison, <2 x i32> zeroinitializer
  %13 = mul <2 x i32> %block108, %broadcast110
  %14 = add <2 x i32> %11, %13
  %vect.split111 = extractelement <2 x i32> %14, i32 0
  %insert.elem112 = insertelement <2 x i32> %insert.elem, i32 %vect.split111, i32 1
  %vect.split113 = extractelement <2 x i32> %14, i32 1
  %insert.elem114 = insertelement <2 x i32> %insert.elem104, i32 %vect.split113, i32 1
  %15 = shufflevector <2 x i32> %insert.elem112, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %tile.vect = shufflevector <2 x i32> %result.vec.0, <2 x i32> %15, <2 x i32> <i32 2, i32 3>
  %acc.vector = add <2 x i32> %result.vec.0, %tile.vect
  %16 = shufflevector <2 x i32> %insert.elem114, <2 x i32> poison, <2 x i32> <i32 0, i32 1>
  %tile.vect115 = shufflevector <2 x i32> %result.vec.1, <2 x i32> %16, <2 x i32> <i32 2, i32 3>
  %acc.vector116 = add <2 x i32> %result.vec.1, %tile.vect115
  br label %loop.latch84

loop.latch84:                                     ; preds = %loop.body
  %loop.step86 = add i32 %loop.iv85, 2
  %loop.step87 = icmp ult i32 %loop.step86, 4
  br i1 %loop.step87, label %loop.header83, label %loop.latch79

loop.latch79:                                     ; preds = %loop.latch84
  %acc.vector.lcssa = phi <2 x i32> [ %acc.vector, %loop.latch84 ]
  %acc.vector116.lcssa = phi <2 x i32> [ %acc.vector116, %loop.latch84 ]
  %loop.step81 = add i32 %loop.iv80, 2
  %loop.step82 = icmp ult i32 %loop.step81, 9
  %input.offset118 = add i32 %input.stride117, %loop.iv80
  %tile.start119 = getelementptr i32, i32* %2, i32 %input.offset118
  %vec.cast120 = bitcast i32* %tile.start119 to <2 x i32>*
  store <2 x i32> %acc.vector.lcssa, <2 x i32>* %vec.cast120, align 4
  %vec.gep122 = getelementptr i32, i32* %tile.start119, i32 9
  %vec.cast123 = bitcast i32* %vec.gep122 to <2 x i32>*
  store <2 x i32> %acc.vector116.lcssa, <2 x i32>* %vec.cast123, align 4
  br i1 %loop.step82, label %loop.header78, label %loop.latch

loop.latch:                                       ; preds = %loop.latch79
  %loop.step = add i32 %loop.iv, 2
  %loop.step77 = icmp ult i32 %loop.step, 1
  br i1 %loop.step77, label %loop.header, label %continue

continue:                                         ; preds = %loop.latch
  %malloc.cast124 = bitcast i32* %2 to <9 x i32>*
  %final.load = load <9 x i32>, <9 x i32>* %malloc.cast124, align 1
  ret <9 x i32> %final.load
}

declare dso_local i32 @tensor_typeinfo16(<16 x i32>* byval(<16 x i32>) align 64, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local i32 @tensor_typeinfo(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local <9 x i32> @tensor_convolution(i32, i32) #1

declare dso_local i32 @tensor_typeinfo9(<9 x i32>* byval(<9 x i32>) align 64, <4 x i32>, <4 x i32>, <4 x i32>) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %indirect-arg-temp = alloca <16 x i32>, align 64
  store <16 x i32> <i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16>, <16 x i32>* %indirect-arg-temp, align 64
  %call = call <9 x i32> @foo(<16 x i32>* byval(<16 x i32>) align 64 %indirect-arg-temp, <4 x i32> <i32 1, i32 2, i32 3, i32 4>)
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
declare token @llvm.tensor.typeinfo.p0v16i32.v4i32.v4i32.v4i32(<16 x i32>*, <4 x i32>, <4 x i32>, <4 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.v4i32.v4i32.v4i32.v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare <9 x i32> @llvm.tensor.convolution.v9i32(token, token) #2

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.p0v9i32.v4i32.v4i32.v4i32(<9 x i32>*, <4 x i32>, <4 x i32>, <4 x i32>) #2

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.v36i32.v2i32.v2i32.v2i32(<36 x i32>, <2 x i32>, <2 x i32>, <2 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare token @llvm.tensor.typeinfo.v4i32.v2i32.v2i32.v2i32(<4 x i32>, <2 x i32>, <2 x i32>, <2 x i32>) #2

; Function Attrs: nounwind readnone speculatable
declare <9 x i32> @llvm.tensor.matmul.v9i32(token, token) #2

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
