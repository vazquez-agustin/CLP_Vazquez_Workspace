-- Testbench para el multiplicador de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- Declaración de la entidad
entity mult4b_tb is
end mult4b_tb;

-- Descripción de la arquitectura
architecture mult4b_tb_arch of mult4b_tb is

  -- Señales de prueba
  signal a_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal b_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal p_tb : std_logic_vector(7 downto 0);

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.mult4b
    port map (
      a_i => a_tb,
      b_i => b_tb,
      p_o => p_tb
    );

  -- Proceso de estimulación
  stim_proc: process
    begin
      -- Caso 1: 7 * 3
    a_tb <= "0111";  -- 7 en binario
    b_tb <= "0011";  -- 3 en binario
    wait for 50 ns;

    -- Caso 2: 7 * 8
    a_tb <= "0111";  -- 7 en binario
    b_tb <= "1000";  -- 8 en binario
    wait for 50 ns;

    -- Caso 3: 0 * 3
    a_tb <= "0000";  -- 0 en binario
    b_tb <= "0011";  -- 3 en binario
    wait for 50 ns;

    -- Fin de la simulación
    wait;
  end process;

end mult4b_tb_arch;
