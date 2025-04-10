-- Testbench de sumador de N bit

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb_tb is
end sumNb_tb;

architecture sumNb_tb_arch of sumNb_tb is

  constant N_tb : natural := 4;

  -- Declaración de señales internas para conectar la DUT
  signal A_tb  : std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(3, N_tb));
  signal B_tb  : std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(4, N_tb));
  signal CI_tb : std_logic := '0';
  signal S_tb  : std_logic_vector(N_tb-1 downto 0);
  signal CO_tb : std_logic;

begin

  -- Instanciación del DUT
  DUT: entity work.sumNb

    generic map (
      N => N_tb
    );

    port map (
      A_i  => A_tb,
      B_i  => B_tb,
      CI_i => CI_tb,
      S_o  => S_tb,
      CO_o => CO_tb
    );

end sumNb_tb_arch;
