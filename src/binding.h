#ifdef __cplusplus
extern "C" {
#endif
	//function to create the cudaHandler
	__declspec(dllexport) void * create_Handler();
	//funtion to destroy the Hander
	__declspec(dllexport) void free_Handler(void * p);
	//example funtion who call cuda's function
	__declspec(dllexport) float * cudaTest(void * p);
	//funtion who return the lenght of vector returned by cuda test
	__declspec(dllexport)int get_len(void * p);
#ifdef __cplusplus
}
#endif