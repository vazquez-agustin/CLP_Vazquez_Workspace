-- Sumador de N bit

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaración de la entidad
entity sumNb is 
  generic(
    N : natural := 4
  );
  port (
    A_i  : in std_logic_vector(N-1 downto 0);  -- Operando A
    B_i  : in std_logic_vector(N-1 downto 0);  -- Operando B
    CI_i : in std_logic;                       -- Carry de entrada
    S_o  : out std_logic_vector(N-1 downto 0); -- Suma de operandos
    CO_o : out std_logic                       -- Carry de salida
  );
end sumNb;

-- Descripción de la arquitectura
architecture sumNb_arch of sum4b is
  
  -- Sección declarativa

  -- Componente sum1b
  component sum1b is
    port (
      a_i  : in std_logic;
      b_i  : in std_logic;
      ci_i : in std_logic;
      s_o  : out std_logic;
      co_o : out std_logic
    );
  end component;

  -- Señal auxiliar para interconectar los carrys de cada bit
  signal aux : std_logic_vector(N downto 0);

begin

  -- Sección descriptiva

  -- Carry inicial (LSB)
  aux(0) <= ci_i;

  -- Lógica de procesamiento
  sumNb_gen : for i in 0 to N-1 generate
    sum1b_inst : entity work.sum1b
      port map(
        a_i  => A_i(i);
        b_i  => B_i(i);
        ci_i => aux(i);
        s_i  => S_i(i);
        co_o => aux(i+1);
      );
  end generate;

  -- Carry de salida global
  co_o   <= aux(N);

end sumNb_arch;
