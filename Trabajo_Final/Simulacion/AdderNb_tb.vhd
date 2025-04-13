-- Testbench de sumador de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addNb_tb is
end addNb_tb;

architecture addNb_tb_arch of addNb_tb is

  constant N_tb : natural := 4;

  -- Declaración de señales internas para conectar la DUT
  signal A_tb  : std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(3, N_tb));
  signal B_tb  : std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(4, N_tb));
  signal CI_tb : std_logic := '0';
  signal S_tb  : std_logic_vector(N_tb-1 downto 0);
  signal CO_tb : std_logic;

begin

  B_tb  <= std_logic_vector(to_unsigned(12, N_tb)) after 100 ns; 
  CI_tb <= '1' after 200 ns; 

  -- Instanciación del DUT
  DUT: entity work.addNb

    generic map (
      N => N_tb
    )

    port map (
      A_i  => A_tb,
      B_i  => B_tb,
      CI_i => CI_tb,
      S_o  => S_tb,
      CO_o => CO_tb
    );

end addNb_tb_arch;
