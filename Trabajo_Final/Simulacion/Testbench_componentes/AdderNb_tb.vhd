-- Testbench para el sumador de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity addNb_tb is
end addNb_tb;

-- Descripción de la arquitectura
architecture addNb_tb_arch of addNb_tb is
  
  constant N_tb : natural := 4;

  -- Señales de prueba
  signal A_tb  : std_logic_vector(N_tb-1 downto 0) := (others => '0');
  signal B_tb  : std_logic_vector(N_tb-1 downto 0) := (others => '0');
  signal CI_tb : std_logic := '0';
  signal S_tb  : std_logic_vector(N_tb-1 downto 0);
  signal CO_tb : std_logic;

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.addNb
    generic map (
      N => N_tb
    )
    port map (
      A_i  => A_tb,
      B_i  => B_tb,
      CI_i => CI_tb,
      S_o  => S_tb,
      CO_o => CO_tb
    );
  
  -- Proceso de estimulación
  stim_proc : process
  begin
    -- Caso 1: 3 + 4, sin carry inicial
    A_tb  <= std_logic_vector(to_unsigned(3, N_tb));
    B_tb  <= std_logic_vector(to_unsigned(4, N_tb));
    CI_tb <= '0';
    wait for 50 ns;

    -- Caso 2: Actualizar B a 12 para observar el acarreo
    B_tb  <= std_logic_vector(to_unsigned(12, N_tb));
    wait for 50 ns;

    -- Caso 3: Activar el carry de entrada '1'
    CI_tb <= '1';
    wait for 50 ns;

    -- Fin de la simulación
    wait for 100 ns;
  end process;   

end addNb_tb_arch;
