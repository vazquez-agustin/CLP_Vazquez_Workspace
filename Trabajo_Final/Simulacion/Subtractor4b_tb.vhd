-- Testbench de sumador de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity sub4b_tb is
end sub4b_tb;

architecture sub4b_tb_arch of sub4b_tb is
  
  component sub4b is
    port (
      a_i : in std_logic_vector(3 downto 0);
      b_i : in std_logic_vector(3 downto 0);
      d_o : out std_logic_vector(3 downto 0);
      p_o : out std_logic                     
    );
  end component;

  -- Declaración de señales internas para conectar la DUT
  signal a_tb : std_logic_vector(3 downto 0) := "0000";
  signal b_tb : std_logic_vector(3 downto 0) := "0000";
  signal d_tb : std_logic_vector(3 downto 0);
  signal p_tb : std_logic;

begin

  -- Instanciación del DUT
  DUT: entity work.sub4b
    port map (
      a_i => a_tb,
      b_i => b_tb,
      d_o => d_tb,
      p_o => p_tb
    );

  -- Test de operación
  process
    begin
      -- Caso 1
      a_tb <= "0101"; -- 5 en binario 
      b_tb <= "0011"; -- 3 en binario
      wait for 10 ns;

      -- Caso 2
      a_tb <= "0000"; -- 5 en binario
      b_tb <= "0001"; -- 1 en binario
      wait for 10 ns;

      wait;
  end process;

end sub4b_tb_arch;
