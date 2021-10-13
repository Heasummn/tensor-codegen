
#include "tensor.h"
#include <stdio.h>
_tensor_t9  foo(_tensor_t36 tensor1, _tensor_t tensor2) {
  _shape_t shape1 = {1, 1, 9, 4};
  _shape_t shape2 = {1, 1, 4, 1};
 _shape_t shape3 = {1, 1, 1, 9};
  //_shape_t shape3 = {1, 1, 2, 2};
  _layout_t layout =  {0, 1, 2, 3};
  _padding_t padding =  {0, 0, 0, 0};

  _token_t tensor1_token =  tensor_typeinfo36(tensor1, shape1, layout, padding);
  _token_t tensor2_token =  tensor_typeinfo(tensor2, shape2, layout, padding);

  _tensor_t9 tensor4 = tensor_matmul9(tensor1_token, tensor2_token);
  _token_t tensor4_token = tensor_typeinfo9(tensor4, shape3, layout, padding);

  return tensor4;
}


int main(void) {
  _tensor_t36 tensor1 = {1, 2, 3, 5, 6, 7, 9, 10, 11,
                         2, 3, 4, 6, 7, 8, 10, 11, 12,
                         5, 6, 7, 9, 10, 11, 13, 14, 15,
                         6, 7, 8, 10, 11, 12, 14, 15, 16};// = {5, 7, 8, 9};
  _tensor_t tensor2 = {1, 2, 3, 4};// = {1, 2, 3, 4,};
  _tensor_t9 tensor3 = foo(tensor1, tensor2);

  unsigned output_size = 9;
  for(unsigned i = 0; i < output_size; i++) {
   printf("output: %d\n", tensor3[i]);
 }

  return 0;
}
