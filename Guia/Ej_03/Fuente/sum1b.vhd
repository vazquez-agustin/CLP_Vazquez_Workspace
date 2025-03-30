-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de Entidad
entity sum1b is
  port(
    a_i:  in  std_logic; -- 1 bit
    b_i:  in  std_logic;
    ci_i: in  std_logic;
    s_o:  out std_logic;
    co_o: out std_logic
  );
end;

-- Declaracion Cuerpo de Arquitectura
architecture sum1b_arq of sum1b is
  -- Parte Declarativa
begin
  -- Parte Descriptiva
  s_o <= a_i xor b_i xor ci_i;
  co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i);	
end;

-- Tabla de verdad del XOR
-- a_i xor b_i
-- 0 xor 0 = 0
-- 0 xor 1 = 1
-- 1 xor 0 = 1
-- 1 xor 1 = 0