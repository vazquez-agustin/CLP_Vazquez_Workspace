-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity countBCDLento is
  generic(
    ciclos : natural := 4
  );
  port (
    clk_i   : in std_logic;
    rst_i   : in std_logic;
    ena_i   : in std_logic;
    count_o : out std_logic_vector(3 downto 0)
  );
end;

-- Declaracion cuerpo de arquitectura
architecture countBCDLento_arq of countBCDLento is
  -- Parte declarativa
  component countBCD is
    generic(
      N : natural := 4
    );
    port (
      clk_i   : in std_logic;
      rst_i   : in std_logic;
      ena_i   : in std_logic;
      count_o : out std_logic_vector(N-1 downto 0)
    );
  end component;

  component genEna is
    generic(
      N: natural := 4
    );
    port (
      rst_i : in std_logic;
      clk_i : in std_logic;
      s_o   : out std_logic
    );
  end component;

  signal lowEna, auxEna : std_logic;

  begin
    
    auxEna <= lowEna and ena_i;

    countBDC_inst : countBCD
    generic map(
      N => 4
    )
    port map(
      clk_i   => clk_i,
      rst_i   => rst_i,
      ena_i   => auxEna,
      count_o => count_o
    );
    genEna_inst : genEna
    generic map(
      N => ciclos  
    )
    port map(
      rst_i => rst_i,
      clk_i => clk_i,
      s_o   => lowEna
    );
  end;