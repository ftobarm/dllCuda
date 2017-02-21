#ifdef __cplusplus
extern "C" {
#endif
	//funcion para crear el objeto handler
	__declspec(dllexport) void * create_Handler();
	//funion para destruir el objeto handler
	__declspec(dllexport) void free_Handler(void * p);
	//funcion de ejemplo
	__declspec(dllexport) void callCuda(void * p);

#ifdef __cplusplus
}
#endif