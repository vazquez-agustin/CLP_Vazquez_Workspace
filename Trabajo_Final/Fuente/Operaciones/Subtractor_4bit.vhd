-- Subtractor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity sub4b is
  port (
    a_i : in std_logic_vector(3 downto 0);  -- Minuendo A
    b_i : in std_logic_vector(3 downto 0);  -- Sustraendo B
    d_o : out std_logic_vector(3 downto 0); -- Resultado (Diferencia)
    p_o : out std_logic                     -- Préstamo ('1' si no hay préstamo)
  );
end sub4b;

-- Descripción de la arquitectura
architecture sub4b_arch of sub4b is
  
  -- Sección declarativa

  signal a_unsigned : unsigned(3 downto 0);
  signal b_unsigned : unsigned(3 downto 0);
  signal div_result : unsigned(4 downto 0); -- Bit extra para capturar el signo

begin

  -- Sección descriptiva

  a_unsigned <= unsigned(a_i);
  b_unsigned <= unsigned(b_i);

  -- Se usa un bit adicional para detectar préstamo (si el resultado es negativo)
  div_result <= ("0" & a_unsigned) - ("0" & b_unsigned);
  
  -- Resultado de la resta (4 LSBs)
  d_o <= std_logic_vector(div_result(3 downto 0));

  -- Bit más significativo (MSB) indica si hubo préstamo
  p_o <= not div_result(4); -- '1' si no hay préstamo, '0' si lo hubo
    
end sub4b_arch;
