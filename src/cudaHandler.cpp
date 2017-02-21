#include "hello.h"//header del objeto de cuda a utilizar
#include <iostream>
#include "cudaHandler.h"

//Metodo que implementa una funcion de cuda y cout de C++
int CudaHandler::callHelloCuda(){
	std::cout<<"from C++:\n";
	return export_hello();
};