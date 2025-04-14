-- Testbench de desplazamiento de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity bShifterNb_tb is
end bShifterNb_tb;

architecture bShifterNb_tb_arch of bShifterNb_tb is

  component bShifterNb is
    generic( 
      N : natural := 8;
      M : natural := 3
    );
    port(
      ent_i : in  std_logic_vector(N-1 downto 0);
      des_i : in  std_logic_vector(M-1 downto 0);
      sal_o : out std_logic_vector(N-1 downto 0)                      
    );
  end component;

  -- Declaración de constantes
  constant N_tb: natural := 8;
  constant M_tb: natural := 3;

  -- Declaración de señales internas para conectar la DUT
  signal ent_i_tb: std_logic_vector (N_tb-1 downto 0) := "00110000";
  signal des_i_tb: std_logic_vector (M_tb-1 downto 0) := "000";
  signal sal_o_tb: std_logic_vector (N_tb-1 downto 0);

begin

  des_i_tb <= "010" after 50 ns;

  DUT: bShifterNb
    generic map(
      N => N_tb,
      M => M_tb
    )
    port map(
      ent_i => ent_i_tb,
      des_i => des_i_tb,
      sal_o => sal_o_tb
    );
end bShifterNb_tb_arch;