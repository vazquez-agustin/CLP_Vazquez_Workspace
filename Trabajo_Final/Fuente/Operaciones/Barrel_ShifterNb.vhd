-- Desplazamiento de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaración de la entidad
entity bShifterNb is
  generic( 
    N : natural := 4; -- Ancho de datos
    M : natural := 2  -- Bits necesarios para representar el desplazamiento
  );
  port(
    ent_i : in  std_logic_vector(N-1 downto 0); -- Entrada de datos
    des_i : in  std_logic_vector(M-1 downto 0); -- Cantidad de desplazamiento
    sal_o : out std_logic_vector(N-1 downto 0)  -- Resultado desplazado
  );
end bShifterNb;

-- Descripción de la arquitectura
architecture bShifterNb_arch of bShifterNb is

  -- Sección declarativa

  signal aux : unsigned(N-1 downto 0);

begin

  -- Sección descriptiva
  
  -- Convierte entrada a unsigned, realiza el shift y convierte a std_logic_vector
  aux   <= shift_right(unsigned(ent_i), to_integer(unsigned(des_i)));
  sal_o <= std_logic_vector(aux);
    
end architecture bShifterNb_arch;