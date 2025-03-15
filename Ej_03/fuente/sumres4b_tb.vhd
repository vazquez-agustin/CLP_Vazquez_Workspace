-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de Entidad
entity sumres4b_tb is
end;

-- Declaracion Cuerpo de Arquitectura
architecture sumres4b_tb_arq of sumres4b_tb is
  -- Parte Declarativa
  -- Declaracion de Componentes
  component sumres4b is
  port(
    a_i:  in  std_logic_vector(3 downto 0);
    b_i:  in  std_logic_vector(3 downto 0);
    sr_i: in  std_logic;
    s_o:  out std_logic_vector(3 downto 0);
    co_o: out std_logic
  );
  end component;

  -- Declaracion de señales de prueba
  signal a_tb:  std_logic_vector(3 downto 0) := "0010";
  signal b_tb:  std_logic_vector(3 downto 0) := "0110";
  signal sr_tb: std_logic := '0';
  signal s_tb:  std_logic_vector(3 downto 0);
  signal co_tb: std_logic;
  
begin
  -- Señales de excitacion
  sr_tb <= '1' after 100 ns;

  -- Componente a probar
  DUT: sumres4b
    port map(
      a_i  => a_tb,
      b_i  => b_tb,
      sr_i => sr_tb,
      s_o  => s_tb,
      co_o => co_tb
    );
end;