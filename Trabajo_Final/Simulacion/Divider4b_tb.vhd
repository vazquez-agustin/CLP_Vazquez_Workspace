-- Testbench de divisor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity div4b_tb is
end div4b_tb;

architecture div4b_tb_arch of div4b_tb is
  
  component div4b is
    port (
      clk_i : in std_logic;
      dvd_i : in std_logic_vector(3 downto 0);
      dvr_i : in std_logic_vector(3 downto 0);
      c_o   : out std_logic_vector(3 downto 0);
      r_o   : out std_logic_vector(3 downto 0)
    );
  end component;
  
  -- Declaración de constantes
  constant clk_period : time := 50 ns;

  -- Declaración de señales internas para conectar la DUT
  signal clk_tb : std_logic := '0';
  signal dvd_tb : std_logic_vector(3 downto 0) := "0000";
  signal dvr_tb : std_logic_vector(3 downto 0) := "0000";
  signal c_tb   : std_logic_vector(3 downto 0);
  signal r_tb   : std_logic_vector(3 downto 0);

  

begin

  -- Instanciación del DUT
  DUT: entity work.div4b
    port map (
      clk_i => clk_tb,
      dvd_i => dvd_tb,
      dvr_i => dvr_tb,
      c_o   => c_tb,
      r_o   => r_tb
    );

  -- Reloj
  clk_process : process
  begin
    clk_tb <= '0';
    wait for clk_period / 2;

    clk_tb <= '1';
    wait for clk_period / 2;
  end process;

  -- Test de operación
  process
  begin
    -- Caso 1 
    dvd_tb <= "1000";  -- 8 en binario
    dvr_tb <= "0010";  -- 2 en binario
    wait for clk_period;

    wait;
  end process;

end div4b_tb_arch;
