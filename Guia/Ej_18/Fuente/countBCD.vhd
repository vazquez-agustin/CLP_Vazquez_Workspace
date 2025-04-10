-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity countBCD is
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
architecture countBCD_behaviour_arq of countBCD is
  -- Parte declarativa
  signal sum : std_logic_vector(N-1 downto 0);

begin
  -- Parte descriptiva
  count_o <= sum;
  process (clk_i) begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        sum <= (others => '0');
      elsif ena_i = '1' then
        sum <= std_logic_vector( unsigned(sum) + to_unsigned(1,N) );
        if sum = "1001" then
          sum <= (others => '0');
        end if;
      end if;
    end if;
  end process;

end;