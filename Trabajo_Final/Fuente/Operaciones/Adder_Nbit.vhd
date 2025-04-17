-- Sumador de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaración de la entidad
entity addNb is 
  generic(
    N : natural := 4 -- Cantidad de bits
  );
  port (
    A_i  : in std_logic_vector(N-1 downto 0);  -- Operando A
    B_i  : in std_logic_vector(N-1 downto 0);  -- Operando B
    CI_i : in std_logic;                       -- Carry-in: acarreo de entrada
    S_o  : out std_logic_vector(N-1 downto 0); -- Resultado de la suma
    CO_o : out std_logic                       -- Carry-out: acarreo de salida
  );
end addNb;

-- Descripción de la arquitectura
architecture addNb_arch of addNb is
  
  -- Sección declarativa

  -- Componente de 1 bit
  component add1b is
    port (
      a_i  : in std_logic;
      b_i  : in std_logic;
      ci_i : in std_logic;
      s_o  : out std_logic;
      co_o : out std_logic
    );
  end component;

  -- Señal auxiliar para los carrys intermedios
  signal aux : std_logic_vector(N downto 0);

begin

  -- Sección descriptiva

  aux(0) <= ci_i; -- Inicializa el primer carry (LSB)

  -- Instancia N sumadores de 1 bit
  addNb_gen : for i in 0 to N-1 generate
    add1b_inst : add1b
      port map(
        a_i  => A_i(i),
        b_i  => B_i(i),
        ci_i => aux(i),
        s_o  => S_o(i),
        co_o => aux(i+1)
      );
  end generate;

  -- El último carry es la salida global (MSB)
  co_o <= aux(N);

end addNb_arch;
