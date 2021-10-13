; ModuleID = 'im2col.c'
source_filename = "im2col.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"output: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <9 x i32> @foo(<36 x i32>* byval(<36 x i32>) align 256 %0, <4 x i32> %tensor2) #0 {
entry:
  %tensor1.addr = alloca <36 x i32>, align 256
  %tensor2.addr = alloca <4 x i32>, align 16
  %shape1 = alloca <4 x i32>, align 4
  %shape2 = alloca <4 x i32>, align 4
  %shape3 = alloca <4 x i32>, align 4
  %layout = alloca <4 x i32>, align 4
  %padding = alloca <4 x i32>, align 4
  %tensor1_token = alloca i32, align 4
  %indirect-arg-temp = alloca <36 x i32>, align 256
  %tensor2_token = alloca i32, align 4
  %tensor4 = alloca <9 x i32>, align 64
  %tensor4_token = alloca i32, align 4
  %indirect-arg-temp3 = alloca <9 x i32>, align 64
  %tensor1 = load <36 x i32>, <36 x i32>* %0, align 256
  store <36 x i32> %tensor1, <36 x i32>* %tensor1.addr, align 256
  store <4 x i32> %tensor2, <4 x i32>* %tensor2.addr, align 16
  store <4 x i32> <i32 1, i32 1, i32 9, i32 4>, <4 x i32>* %shape1, align 4
  store <4 x i32> <i32 1, i32 1, i32 4, i32 1>, <4 x i32>* %shape2, align 4
  store <4 x i32> <i32 1, i32 1, i32 1, i32 9>, <4 x i32>* %shape3, align 4
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* %layout, align 4
  store <4 x i32> zeroinitializer, <4 x i32>* %padding, align 4
  %1 = load <36 x i32>, <36 x i32>* %tensor1.addr, align 256
  %2 = load <4 x i32>, <4 x i32>* %shape1, align 4
  %3 = load <4 x i32>, <4 x i32>* %layout, align 4
  %4 = load <4 x i32>, <4 x i32>* %padding, align 4
  store <36 x i32> %1, <36 x i32>* %indirect-arg-temp, align 256
  %call = call i32 @tensor_typeinfo36(<36 x i32>* byval(<36 x i32>) align 256 %indirect-arg-temp, <4 x i32> %2, <4 x i32> %3, <4 x i32> %4)
  store i32 %call, i32* %tensor1_token, align 4
  %5 = load <4 x i32>, <4 x i32>* %tensor2.addr, align 16
  %6 = load <4 x i32>, <4 x i32>* %shape2, align 4
  %7 = load <4 x i32>, <4 x i32>* %layout, align 4
  %8 = load <4 x i32>, <4 x i32>* %padding, align 4
  %call1 = call i32 @tensor_typeinfo(<4 x i32> %5, <4 x i32> %6, <4 x i32> %7, <4 x i32> %8)
  store i32 %call1, i32* %tensor2_token, align 4
  %9 = load i32, i32* %tensor1_token, align 4
  %10 = load i32, i32* %tensor2_token, align 4
  %call2 = call <9 x i32> @tensor_matmul9(i32 %9, i32 %10)
  store <9 x i32> %call2, <9 x i32>* %tensor4, align 64
  %11 = load <9 x i32>, <9 x i32>* %tensor4, align 64
  %12 = load <4 x i32>, <4 x i32>* %shape3, align 4
  %13 = load <4 x i32>, <4 x i32>* %layout, align 4
  %14 = load <4 x i32>, <4 x i32>* %padding, align 4
  store <9 x i32> %11, <9 x i32>* %indirect-arg-temp3, align 64
  %call4 = call i32 @tensor_typeinfo9(<9 x i32>* byval(<9 x i32>) align 64 %indirect-arg-temp3, <4 x i32> %12, <4 x i32> %13, <4 x i32> %14)
  store i32 %call4, i32* %tensor4_token, align 4
  %15 = load <9 x i32>, <9 x i32>* %tensor4, align 64
  ret <9 x i32> %15
}

declare dso_local i32 @tensor_typeinfo36(<36 x i32>* byval(<36 x i32>) align 256, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local i32 @tensor_typeinfo(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>) #1

declare dso_local <9 x i32> @tensor_matmul9(i32, i32) #1

declare dso_local i32 @tensor_typeinfo9(<9 x i32>* byval(<9 x i32>) align 64, <4 x i32>, <4 x i32>, <4 x i32>) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %tensor1 = alloca <36 x i32>, align 256
  %tensor2 = alloca <4 x i32>, align 16
  %tensor3 = alloca <9 x i32>, align 64
  %indirect-arg-temp = alloca <36 x i32>, align 256
  %output_size = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store <36 x i32> <i32 1, i32 2, i32 3, i32 5, i32 6, i32 7, i32 9, i32 10, i32 11, i32 2, i32 3, i32 4, i32 6, i32 7, i32 8, i32 10, i32 11, i32 12, i32 5, i32 6, i32 7, i32 9, i32 10, i32 11, i32 13, i32 14, i32 15, i32 6, i32 7, i32 8, i32 10, i32 11, i32 12, i32 14, i32 15, i32 16>, <36 x i32>* %tensor1, align 256
  store <4 x i32> <i32 1, i32 2, i32 3, i32 4>, <4 x i32>* %tensor2, align 16
  %0 = load <36 x i32>, <36 x i32>* %tensor1, align 256
  %1 = load <4 x i32>, <4 x i32>* %tensor2, align 16
  store <36 x i32> %0, <36 x i32>* %indirect-arg-temp, align 256
  %call = call <9 x i32> @foo(<36 x i32>* byval(<36 x i32>) align 256 %indirect-arg-temp, <4 x i32> %1)
  store <9 x i32> %call, <9 x i32>* %tensor3, align 64
  store i32 9, i32* %output_size, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %output_size, align 4
  %cmp = icmp ult i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load <9 x i32>, <9 x i32>* %tensor3, align 64
  %5 = load i32, i32* %i, align 4
  %vecext = extractelement <9 x i32> %4, i32 %5
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %vecext)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !2

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="288" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (git@github.com:Heasummn/tensor-codegen.git ae91b57db81660723e6d9eea5e958500276551b6)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
