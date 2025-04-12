-- Sumador de 1 bit

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaración de la entidad
entity add1b is
  port (
    a_i  : in std_logic;  -- Operando A
    b_i  : in std_logic;  -- Operando B
    ci_i : in std_logic;  -- Carry de entrada
    s_o  : out std_logic; -- Suma de operandos
    co_o : out std_logic  -- Carry de salida
  );
end add1b;

-- Descripción de la arquitectura
architecture add1b_arch of add1b is

  -- Sección declarativa

begin

  -- Sección descriptiva

  -- Lógica de procesamiento

  s_o  <= a_i xor b_i ci_i;

  co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i);
    
end add1b_arch;