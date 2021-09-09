#include "tensor.h"
#include <stdio.h>

_tensor_t  foo(_tensor_t tensor1, _tensor_t tensor2) {
  _shape_t shape1 = {1, 1, 2, 2};
  _shape_t shape2 = {1, 1, 2, 2};
  _shape_t shape3 = {1, 1, 2, 2};

  _layout_t layout1 =  {0, 1, 2, 3};
  _layout_t layout2 =  {0, 1, 2, 3};

  _padding_t padding1 =  {0, 0, 0, 0};
  _padding_t padding2 =  {0, 0, 0, 0};

  _token_t tensor1_token =  tensor_typeinfo(tensor1, shape1, layout1, padding1);
  _token_t tensor2_token =  tensor_typeinfo(tensor2, shape2, layout2, padding2);


  _tensor_t tensor3 = tensor_convolution(tensor1_token, tensor2_token);
  _token_t tensor3_token = tensor_typeinfo(tensor3, shape3, layout1, padding1);

  return tensor3;
}

int main(void) {

  _tensor_t tensor1 = {5, 7, 8, 9};
  _tensor_t tensor2 = {1, 2, 3, 4,};
  _tensor_t tensor3 = foo(tensor1, tensor2);

  unsigned output_size = 4;
  for(unsigned i = 0; i < output_size; i++) {
    printf("output: %d\n", tensor3[i]);
  }

  return 0;
}