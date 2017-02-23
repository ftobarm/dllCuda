#include <math.h>
#include "cuda_runtime.h"
#include "vectorSum.h"

static const int n_el = 512;
static const size_t size = n_el * sizeof(float);
// declare the kernel function
__global__ void kernel_sum(const float* A, const float* B, float* C, int n_el)
{
  // calculate the unique thread index
  int tid = blockDim.x * blockIdx.x + threadIdx.x;
  // perform tid-th elements addition 
  if (tid < n_el) C[tid] = A[tid] + B[tid];
}


// function which invokes the kernel
void sum(const float* A, const float* B, float* C, int n_el) {

  // declare the number of blocks per grid and the number of threads per block
  int threadsPerBlock,blocksPerGrid;

  // use 1 to 512 threads per block
  if (n_el<512){
    threadsPerBlock = n_el;
    blocksPerGrid   = 1;
  } else {
    threadsPerBlock = 512;
    blocksPerGrid   = ceil(double(n_el)/double(threadsPerBlock));
  }

  // invoke the kernel
  kernel_sum<<<blocksPerGrid,threadsPerBlock>>>(A, B, C, n_el);
}

// kernel

float* myCudaTest(int *n){
	*n=n_el;
// declare and allocate input vectors h_A and h_B in the host (CPU) memory
  float* h_A = (float*)malloc(size);
  float* h_B = (float*)malloc(size);
  float* h_C = (float*)malloc(size);

  // declare device vectors in the device (GPU) memory
  float *d_A,*d_B,*d_C;

  // initialize input vectors
  for (int i=0; i<n_el; i++){
    h_A[i]=sin(i);
    h_B[i]=cos(i);
  }

  // allocate device vectors in the device (GPU) memory
  cudaMalloc(&d_A, size);
  cudaMalloc(&d_B, size);
  cudaMalloc(&d_C, size);

  // copy input vectors from the host (CPU) memory to the device (GPU) memory
  cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);

  // call kernel function
  sum(d_A, d_B, d_C, n_el);

  // copy the output (results) vector from the device (GPU) memory to the host (CPU) memory
  cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
  // free device memory
  cudaFree(d_A);
  cudaFree(d_B);
  cudaFree(d_C);
  delete[] h_A;
  delete[] h_B;
  return h_C;
}