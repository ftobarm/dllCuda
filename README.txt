Autor: Francisco Tobar

##Las tildes fueron omitidas para evitar problemas de compatibildad##
Intrucciones de instalcion:

Se debe tener previamente instalado cmake, algun compilador de c++, nodeJs y cudaSDK .
Este fue probado con Visual Studio 14.

El archivo cuenta con cmake para ser compilado se debe:

1.- Primero generar los archivos para compilar a traves de comand cmake build, se recomienda hacer esto dentro una carpeta
build para mantener el orden.
 Se debe ejecutar cmake build $ruta al directorio raiz$ si lo hará en otra carpeta. Por ejemplo, al hacerlo en un carpeta build dentro del directorio raiz*
se debe ejecutar ** , cmake build ..

* El directorio raiz es la carpeta cudaDll que contiene el CmakeList.txt
** Al momento de ejecutar el cmake se debe comprobar que se escoga la misma arquitectura que la del node instalado, cmake escoge 32bits por defecto, esto se puede hacer mediante la flag -G "visual Studio XX XXXX win 64" para 64 bits.
2.- Dentro del direcotrio donde se ejecuto el comando anterior se debe ejucutar el comando cmake --build . --config Release
3.- De salir todo bien se deberia haber generado un carpeta release el directorio raiz el cual contiene la libreria

Una vez compilado todo es necesario instalar las dependencias de node a traves del comando en la carpeta raiz:

npm install

Ademas se deben recompilar las liberias ffi y ref para ser compatibles con electron a traves de :
	
    //desde la carpeta que contiene el main.js
    cd node_modules\ffi
    //se deben asegurar que se tiene asignado el path de node_gyp en el sistema
    node-gyp rebuild --target=1.4.1 --dist-url=https://atom.io/download/atom-shell
    cd ..\ref
    node-gyp rebuild --target=1.4.1 --dist-url=https://atom.io/download/atom-shell
    cd ..\..
    
El programa debe ejecutarse mediante el comando:

npm start

deberia mostrar un serie de numeros que representa la suma de 2 vectores-

Es un programa simple de ejemplo, para probrar la integracion de cuda a traves de c++ y ffi.
Se recomienda revisar los archivos:
   
    -src/binding.cpp
    -src/binding.h
    -src/cudaHandler.cpp
    -src/cudaHandler.h
    -src/vectorSum.cu

para entender el funcionamiento de la libreria.
