-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de Entidad
entity mux1b_tb is
end;

-- Declaracion Cuerpo de Arquitectura
architecture mux1b_tb_arq of mux1b_tb is
  -- Parte Declarativa
  -- Declaracion de Componentes
  component mux1b is
  port(
    a_i, b_i: in std_logic; 
    sel_i:    in std_logic;
    o_o:      out std_logic
  );
  end component;

  -- Declaracion de señales de prueba
  signal a_tb:    std_logic := '1';
  signal b_tb:    std_logic := '1';
  signal sel_tb:  std_logic := '1';
  signal o_tb:    std_logic := '1';
  
begin
  -- Señales de excitacion
  a_tb   <= not a_tb after 50 ns;
  b_tb   <= not b_tb after 100 ns;
  sel_tb <= not sel_tb after 200 ns;

  -- Componente a probar
  DUT: mux1b
    port map(
      a_i   => a_tb,
      b_i   => b_tb,
      sel_i => sel_tb,
      o_o   => o_tb
    );
end;