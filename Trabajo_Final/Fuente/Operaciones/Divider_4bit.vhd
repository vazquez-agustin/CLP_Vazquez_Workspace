-- Divisor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity div4b is
  port (
    clk_i : in std_logic;                      -- Señal de reloj
    dvd_i : in std_logic_vector(3 downto 0);   -- Dividendo
    dvr_i : in std_logic_vector(3 downto 0);   -- Dividor
    c_o   : out std_logic_vector(3 downto 0);  -- Cociente
    r_o   : out std_logic_vector(3 downto 0)   -- Resto
  );
end div4b;

-- Descripción de la arquitectura
architecture div4b_arch of div4b is
  
  -- Sección declarativa
  signal dvd_reg, dvr_reg : unsigned(3 downto 0);
  signal c_reg, r_reg : unsigned(3 downto 0);

begin

  -- Sección descriptiva

  process(clk_i)
  begin
    if rising_edge(clk_i) then
      dvd_reg <= unsigned(dvd_i);
      dvr_reg <= unsigned(dvr_i);
      
      -- Manejo del caso de división por cero
      if dvr_reg /= 0 then
        c_reg <= dvd_reg / dvr_reg;
        r_reg <= dvd_reg rem dvr_reg;
      else
        c_reg <= (others => '1'); -- Marca error: cociente máximo
        r_reg <= dvd_reg;         -- Se devuelve el dividendo como resto
      end if;
    end if;
  end process;
  
  -- Salidas convertidas a std_logic_vector
  c_o <= std_logic_vector(c_reg);
  r_o <= std_logic_vector(r_reg);

end div4b_arch;
