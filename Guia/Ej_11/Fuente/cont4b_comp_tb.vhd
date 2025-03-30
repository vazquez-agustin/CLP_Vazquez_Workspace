library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity cont4b_comp_tb is
end;

-- Declaracion cuerpo de arquitectura
architecture cont4b_comp_tb_arq of cont4b_comp_tb is

  component cont4b_comp is
    generic( 
      N : natural := 4 
    );
	  port(
		  clk_i	: in  std_logic;						
		  rst_i	: in  std_logic;
      hab_i   : in  std_logic;
      sal_o   : out std_logic_vector(N-1 downto 0)
	  );
  end component;

  constant N_tb : natural := 4;

  -- Senales de prueba
	signal clk_i_tb: std_logic := '0';
	signal rst_i_tb: std_logic := '0';
  signal hab_i_tb: std_logic := '1';
	signal sal_o_tb: std_logic_vector(N_tb-1 downto 0) := "0000";

begin
  -- Senales de excitacion
  clk_i_tb <= not clk_i_tb after 10 ns;
  hab_i_tb <= '0' after 100 ns, '1' after 130 ns;
  rst_i_tb <= '1' after 200 ns, '0' after 205 ns;
  
  -- Instaciacion del componente a probar
  DUT: cont4b_comp
    generic map (N => N_tb)
      port map (
        clk_i => clk_i_tb,
        rst_i => rst_i_tb,
        hab_i => hab_i_tb,
        sal_o => sal_o_tb
      );

end architecture cont4b_comp_tb_arq;