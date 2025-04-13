-- Subtractor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity sub4b is
  port (
    a_i : in std_logic_vector(3 downto 0);  -- Minuendo A de 4 bits
    b_i : in std_logic_vector(3 downto 0);  -- Sustraendo B de 4 bits
    d_o : out std_logic_vector(3 downto 0); -- Diferencia o resultado de la resta
    p_o : out std_logic                     -- Préstamo de la resta (sin préstamo: '1')
  );
end sub4b;

-- Descripción de la arquitectura
architecture sub4b_arch of sub4b is
  
  -- Sección declarativa
  signal a_unsigned : unsigned(3 downto 0);
  signal b_unsigned : unsigned(3 downto 0);
  signal div_result : unsigned(4 downto 0); -- 1 bit extra para indicar si hubo acarreo (cociente)

begin

  -- Sección descriptiva

  -- Conversión de dividendo (a) y divisor (b) a "unsigned"
  a_unsigned <= unsigned(a_i);
  b_unsigned <= unsigned(b_i);

  -- Concatenación de un 0 a la izquierda de cada operando para capturar el bit extra
  div_result <= ("0" & a_unsigned) - ("0" & b_unsigned);
  
  -- Extracción de los 4 bits menos significativos para el resultado de la resta
  d_o <= std_logic_vector(div_result(3 downto 0));

  -- El bit MSB de div_result indica si hubo préstamo
  -- Si sub_result(4) = '0' no hubo préstamo, ya que c_o = not '0' = '1'.
  p_o <= not div_result(4);
    
end sub4b_arch;
