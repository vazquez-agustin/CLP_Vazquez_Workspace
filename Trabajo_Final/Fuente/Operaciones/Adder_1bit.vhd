-- Sumador de 1 bit

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaración de la entidad
entity add1b is
  port (
    a_i  : in std_logic;  -- Bit del operando A
    b_i  : in std_logic;  -- Bit del operando B
    ci_i : in std_logic;  -- Carry-in: acarreo de entrada
    s_o  : out std_logic; -- Resultado del bit de suma
    co_o : out std_logic  -- Carry-out: acarreo de salida
  );
end add1b;

-- Descripción de la arquitectura
architecture add1b_arch of add1b is

  -- Sección declarativa

begin

  -- Sección descriptiva

  -- Lógica de procesamiento

  -- XOR de los tres bits para obtener el resultado del bit actual
  s_o  <= a_i xor b_i xor ci_i;
  

  -- Lógica del carry-out (acarreo): se genera si al menos dos bits son '1'
  co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i);
    
end add1b_arch;