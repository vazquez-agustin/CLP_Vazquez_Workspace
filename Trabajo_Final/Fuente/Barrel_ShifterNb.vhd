-- Desplazamiento de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity bShifterNb is
  generic( 
    N : natural := 8;
    M : natural := 3
  );
  port(
    ent_i : in  std_logic_vector(N-1 downto 0);
    des_i : in  std_logic_vector(M-1 downto 0);
    sal_o : out std_logic_vector(N-1 downto 0)                      
  );
end bShifterNb;

-- Descripción de la arquitectura
architecture bShifterNb_arch of bShifterNb is

  -- Sección declarativa
  signal aux: unsigned(N-1 downto 0);
begin

  -- Sección descriptiva

  aux <= shift_right(unsigned(ent_i), to_integer(unsigned(des_i)));
  sal_o <= std_logic_vector(aux);
    
end architecture bShifterNb_arch;