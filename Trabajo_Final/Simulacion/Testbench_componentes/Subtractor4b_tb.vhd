-- Testbench para el restador de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- Declaración de la entidad
entity sub4b_tb is
end sub4b_tb;

-- Descripción de la arquitectura
architecture sub4b_tb_arch of sub4b_tb is

  -- Señales de prueba
  signal a_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal b_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal d_tb : std_logic_vector(3 downto 0);
  signal p_tb : std_logic;

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.sub4b
    port map (
      a_i => a_tb,
      b_i => b_tb,
      d_o => d_tb,
      p_o => p_tb
    );
  
  -- Proceso de estimulación
  stim_proc: process
    begin
      -- Caso 1: 5 - 3
    a_tb <= "0101";  -- 5 en binario
    b_tb <= "0011";  -- 3 en binario
    wait for 50 ns;

    -- Caso 2: 0 - 1 (para generar préstamo)
    a_tb <= "0000";  -- 0 en binario
    b_tb <= "0001";  -- 1 en binario
    wait for 50 ns;

    -- Caso 3: 7 - 7 (resultado cero sin préstamo)
    a_tb <= "0111";
    b_tb <= "0111";
    wait for 50 ns;

    -- Fin de la simulación
    wait;
  end process;

end sub4b_tb_arch;
