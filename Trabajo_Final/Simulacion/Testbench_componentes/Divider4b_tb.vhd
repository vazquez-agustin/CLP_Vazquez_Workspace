-- Testbench de divisor de 4 bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- Declaración de la entidad
entity div4b_tb is
end div4b_tb;

-- Descripción de la arquitectura
architecture div4b_tb_arch of div4b_tb is
  
  -- Declaración de señales internas para conectar la DUT
  signal dvd_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal dvr_tb : std_logic_vector(3 downto 0) := (others => '0');
  signal c_tb   : std_logic_vector(3 downto 0);
  signal r_tb   : std_logic_vector(3 downto 0);

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.div4b
    port map (
      dvd_i => dvd_tb,
      dvr_i => dvr_tb,
      c_o   => c_tb,
      r_o   => r_tb
    );

  -- Proceso de estimulación
  stim_proc: process
  begin
    -- Caso 1: 8 / 2  => Cociente: 4, Resto: 0
    dvd_tb <= "1000";  -- 8 en binario
    dvr_tb <= "0010";  -- 2 en binario
    wait for 50 ns;

    -- Caso 2: 7 / 3  => Resultados según la división entera
    dvd_tb <= "0111";  -- 7 en binario
    dvr_tb <= "0011";  -- 3 en binario
    wait for 50 ns;

    -- Caso 3: División por cero, divisor = 0
    dvd_tb <= "0101";  -- 5 en binario
    dvr_tb <= "0000";  -- 0 en binario (caso de división por cero)
    wait for 50 ns;

    -- Fin del proceso de estimulación
    wait;
  end process;

end div4b_tb_arch;
