-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity countNb is
  generic(
    N : natural := 4
  );
  port (
    clk_i   : in std_logic;
    rst_i   : in std_logic;
    ena_i   : in std_logic;
    count_o : out std_logic_vector(N-1 downto 0)
  );
end;

-- Declaracion cuerpo de arquitectura
architecture countNb_behaviour_arq of countNb is
  -- Parte declarativa
  signal sum : std_logic_vector(N-1 downto 0);

begin
  -- Parte descriptiva

  process (clk_i) begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        sum <= (others => '0');
      elsif ena_i = '1' then
        sum <= std_logic_vector( unsigned(sum) + to_unsigned(1,N) );
        count_o <= sum;
      end if;
    end if;
  end process;
end;