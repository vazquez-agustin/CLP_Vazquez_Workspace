library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad
entity cont4b_tb is
end;

-- Declaracion cuerpo de arquitectura
architecture cont4b_tb_arq of cont4b_tb is
  -- Parte declarativa

  component cont4b is
    port(
      ena_i    : in std_logic;
      rst_i    : in std_logic;
      clk_i    : in std_logic;
	    cuenta_o : out std_logic_vector(3 downto 0)
    );
	end component;

	-- Senales de prueba
	signal ena_tb    : std_logic := '1';
  signal rst_tb    : std_logic := '1';
	signal clk_tb    : std_logic := '0';
	signal cuenta_tb : std_logic_vector(3 downto 0);

begin
  -- Senales de excitacion
  ena_tb <= '0' after 220 ns, '1' after 300 ns;
  rst_tb <= '0' after 40 ns;
  clk_tb <= not clk_tb after 10 ns;

  -- Instaciacion del componente a probar
  DUT : cont4b
    port map(
      ena_i    => ena_tb,
      rst_i    => rst_tb,
      clk_i    => clk_tb,
      cuenta_o => cuenta_tb
    );

end;