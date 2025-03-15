-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de Entidad
entity reg_tb is
end;

-- Declaracion Cuerpo de Arquitectura
architecture reg_tb_arq of reg_tb is
  
  -- Parte Declarativa
  -- Declaracion de Componentes
  component reg is 
    generic(
      N: natural := 4
    ); 
    port( 
      ck_i   : in std_logic; 
      rset_i : in std_logic := '0'; 
      ent_i  : in std_logic := '1'; 
      sal_o  : out std_logic 
    );
  end component;

  constant N_tb: natural := 4;

  -- Declaracion de señales de prueba
  signal clk_tb : std_logic := '0';
  signal rst_tb : std_logic := '0';
  signal ent_tb : std_logic := '0';
  signal sal_tb : std_logic;
  
begin
  -- Señales de excitacion
  clk_tb  <= not clk_tb after 10 ns;
  ent_tb  <= '1' after 20 ns;


  -- Componente a probar
  DUT: reg
    generic map(
      N => N_tb
    )
    port map(
      ck_i   => clk_tb,
      rset_i => rst_tb,
      ent_i  => ent_tb,
      sal_o  => sal_tb
    );

end;