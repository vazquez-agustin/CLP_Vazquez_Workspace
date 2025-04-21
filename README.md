# Repositorio de Circuitos Lógicos Programables

- Profesor: Nicolás Alvarez

- Autor: Agustín Jesús Vazquez

## Descripción del repositorio

1. [Guia](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Guia): contiene la guía de ejercicios opcionales resueltos.

2. [Trabajo_Final](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final): contiene los archivos del proyecto final de la catedra y se divide en las siguientes subcarpetas:

* [Fuente](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Fuente): contiene los archivos *.vhd* de la ALU. Se divide en las siguientes carpetas:
    * [Operaciones](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Fuente/Operaciones): carpeta que contiene los archivos *.vhd* de las operaciones de la ALU. Se enumeran a continuación:
    1. Suma
    2. Resta
    3. Multiplicación
    4. División
    5. Desplazamiento
    6. Operaciones lógicas (AND, OR, XOR)
    * [ALU](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Fuente/ALU): contiene el archivo *Arithmetic Logic Unit (ALU)* que reune los componentes de la carpeta Operaciones y el *ALU_VIO* para realizar la sintesis en Vivado.
    * ArtyZ7_10.xdc: archivo de configuración de FPGA ArtyZ7-10 la placa utilizada para realizar la sintesis.
* [Simulacion](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Simulacion): contiene los archivos de banco de pruebas del proyecto. Se divide en las siguientes carpetas:
    * [Testbench_ALU](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Simulacion/Testbench_ALU): contiene los archivos *.vhd* test bench para la simulacion del proyecto principal con la herramienta modelsim.
    * [Testbench_componentes](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Simulacion/Testbench_componentes): contiene los archivos *.vhd* test bench para la simulacion de los componentes del proyecto.
    * [Modelsim](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Trabajo_Final/Simulacion/Modelsim): contiene las simulaciones de la ALU y sus componentes realizadas en el software Modelsim.
* Sintesis: se encuentra el archivo de configuración del proyecto **ALU_VIO.bit**, que fue generado en el software Vivado.

3. [Documentacion_TPFinal](https://github.com/vazquez-agustin/CLP_Vazquez_Workspace/tree/main/Documentacion_TPFinal): carpeta que contiene la domumentación que describe brevemente el trabajo realizado en la ALU. Incluye los siguientes documentos:
    * UtilizationReport.txt
    * Presentacion\_Final\_(ALU)\_4\_bits.pdf
    * Arithmetic\_logic\_unit_(ALU)\_4\_bits.pdf
