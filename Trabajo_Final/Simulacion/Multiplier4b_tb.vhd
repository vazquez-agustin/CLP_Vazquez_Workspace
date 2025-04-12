-- Testbench de multiplicador de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity mult4b_tb is
end mult4b_tb;

architecture mult4b_tb_arch of mult4b_tb is
  
  component mult4b is
    port (
      a_i : in std_logic_vector(3 downto 0);
      b_i : in std_logic_vector(3 downto 0);
      p_o : out std_logic_vector(7 downto 0);                    
    );
  end component;

  -- Declaración de señales internas para conectar la DUT
  signal a_tb : std_logic_vector(3 downto 0) := "0000";
  signal b_tb : std_logic_vector(3 downto 0) := "0000";
  signal p_tb : std_logic_vector(7 downto 0);

begin

  -- Instanciación del DUT
  DUT: entity work.mult4b
    port map (
      a_i => a_tb,
      b_i => b_tb,
      p_o => p_tb
    );

  -- Test de operación
  process
    begin
      -- Caso 1
      a_tb <= "0111"; -- 7 en binario 
      b_tb <= "0011"; -- 3 en binario
      wait for 10 ns;

      wait;
  end process;

end mult4b_tb_arch;
