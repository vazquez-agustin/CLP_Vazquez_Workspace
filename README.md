# Repositorio de Circuitos Lógicos Programables

- Profesor: Nicolás Alvarez

- Autor: Agustín Jesús Vazquez

## Descripción del repositorio

1. [Guia](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Guia): contiene la guía de ejercicios opcionales resueltos.

2. [Trabajo_Final](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final): contiene los archivos del proyecto final de la catedra y se divide en las siguientes subcarpetas:

* Fuente: contiene los archivos *.vhd* de la ALU. Se divide en las siguientes carpetas:
    * Operaciones: carpeta que contiene los archivos *.vhd* de las operaciones de la ALU. Se enumeran a continuación
    1. Suma
    2. Resta
    3. Multiplicación
    4. División
    5. Desplazamiento
    6. Operaciones lógicas (AND, OR, XOR)
    * ALU.vhd: archivo de la *Arithmetic Logic Unit (ALU)* que reune los componentes de la carpeta [Operaciones](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Fuente/Operaciones)
* Simulacion: contiene los archivos de banco de pruebas del proyecto. Se divide en las siguientes carpetas:
    * Testbench_ALU: contiene los archivos *.vhd* test bench para la simulacion del proyecto principal con la herramienta modelsim.
    * Testbench_componentes: contiene los archivos *.vhd* test bench para la simulacion de los componentes del proyecto.
* Sintesis: se encuentra el archivo de configuracion del proyecto **ALU_VIO.bit**, que fue generado en el software Vivado.

3. Documentacion_TPFinal: carpeta que contiene la domumentación que describe brevemente el trabajo realizado en la ALU. Incluye los siguientes documentos:
