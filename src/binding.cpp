#include "cudaHandler.h"
#include "binding.h"
class binding{
	private:
		int pez;	
};
extern "C" {
//funcion para crear el objeto handler
void * create_Handler() { return new CudaHandler; };
//funion para destruir el objeto handler
void free_Handler(void * p) { delete p; };
//funcion de ejemplo
void callCuda(void * p){((CudaHandler*)p)->callHelloCuda();};
}
