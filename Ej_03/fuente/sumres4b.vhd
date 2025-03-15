-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de Entidad
entity sumres4b is
  port(
    a_i:  in  std_logic_vector(3 downto 0);
    b_i:  in  std_logic_vector(3 downto 0);
    sr_i: in  std_logic;
    s_o:  out std_logic_vector(3 downto 0);
    co_o: out std_logic
  );
end;

-- Declaracion Cuerpo de Arquitectura
architecture sumrestador4b_arq of sumres4b is
  -- Parte Declarativa
  component sum4b is
  port(
    a_i:  in  std_logic_vector(3 downto 0);
    b_i:  in  std_logic_vector(3 downto 0);
    ci_i: in  std_logic;
    s_o:  out std_logic_vector(3 downto 0);
    co_o: out std_logic
  );
  end component;

  signal b_mod: std_logic_vector(3 downto 0);

begin

  -- Parte Descriptiva
  b_mod <= b_i xor std_logic_vector'(3 downto 0 => sr_i);

  sumres4b_ins: sum4b
  port map (
      a_i  => a_i,
      b_i  => b_mod,
      ci_i => sr_i,
      s_o  => s_o,
      co_o => co_o
  );

end;
