-- Multiplicador de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity mult4b is
  port (
    a_i : in std_logic_vector(3 downto 0);  -- Multiplicando A de 4 bits
    b_i : in std_logic_vector(3 downto 0);  -- Multiplicador B de 4 bits
    p_o : out std_logic_vector(7 downto 0)  -- Producto de 8 bits
  );
end mult4b;

-- Descripción de la arquitectura
architecture mult4b_arch of mult4b is
  
  -- Sección declarativa

begin

  -- Sección descriptiva

  process(a_i, b_i)
    variable temp_prod : unsigned(7 downto 0) := (others => '0');
    variable midd_prod : unsigned(7 downto 0);
  begin
    temp_prod := (others => '0');
    
    -- Bucle para multiplicación binaria
    for i in 0 to 3 loop
      if b_i(i) = '1' then
        -- Desplaza A según el bit de B en análisis
        midd_prod := unsigned("0000" & a_i) sll i;
        temp_prod := temp_prod + midd_prod;
      end if;
    end loop;
 
    -- Conversión final a std_logic_vector
    p_o <= std_logic_vector(temp_prod);

  end process;
end mult4b_arch;
