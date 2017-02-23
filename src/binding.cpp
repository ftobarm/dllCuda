#include "cudaHandler.h"
#include "binding.h"

extern "C" {
//function to create the cudaHandler
void * create_Handler() { return new CudaHandler; };
//funtion to destroy the Hander
void free_Handler(void * p) {((CudaHandler*)p)->clear_vector() ; delete p; };
//example funtion who call cuda's function
float * cudaTest(void * p){return ((CudaHandler*)p)->McudaTest();};
//funtion who return the lenght of vector returned by cuda test
int get_len(void * p){return ((CudaHandler*)p)->get_len();};
}
