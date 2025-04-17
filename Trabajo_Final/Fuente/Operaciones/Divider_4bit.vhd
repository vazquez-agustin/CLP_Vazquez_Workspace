-- Divisor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity div4b is
  port (
    dvd_i : in std_logic_vector(3 downto 0);   -- Dividendo
    dvr_i : in std_logic_vector(3 downto 0);   -- Dividor
    c_o   : out std_logic_vector(3 downto 0);  -- Cociente
    r_o   : out std_logic_vector(3 downto 0)   -- Resto
  );
end div4b;

-- Descripción de la arquitectura
architecture div4b_arch of div4b is
  
  -- Sección declarativa

begin

  -- Sección descriptiva
  
  -- Cociente: si dvr_i="0000" marcamos error, si no dividimos
  c_o <= (others => '1')  
  when dvr_i = "0000" else
    std_logic_vector( unsigned(dvd_i) / unsigned(dvr_i) );

  -- Resto: si dvr_i="0000" devolvemos cero, si no calculamos rem
  r_o <= (others => '0')
  when dvr_i = "0000" else
    std_logic_vector( unsigned(dvd_i) rem unsigned(dvr_i) );

end div4b_arch;
