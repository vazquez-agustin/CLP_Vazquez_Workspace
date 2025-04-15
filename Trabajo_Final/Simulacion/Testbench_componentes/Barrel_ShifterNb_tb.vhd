-- Testbench para el desplazador de N bits

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaración de la entidad
entity bShifterNb_tb is
end bShifterNb_tb;

-- Descripción de la arquitectura
architecture bShifterNb_tb_arch of bShifterNb_tb is

  -- Declaración de constantes
  constant N_tb: natural := 8; -- Ancho de la entrada/salida
  constant M_tb: natural := 3; -- Cantidad de bits para el desplazamiento

  -- Señales de prueba
  signal ent_i_tb: std_logic_vector (N_tb-1 downto 0) := "00110000"; -- Valor de entrada
  signal des_i_tb: std_logic_vector (M_tb-1 downto 0) := "000";      -- Cantidad de desplazamiento
  signal sal_o_tb: std_logic_vector (N_tb-1 downto 0);

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.bShifterNb
    generic map (
      N => N_tb,
      M => M_tb
    )
    port map(
      ent_i => ent_i_tb,
      des_i => des_i_tb,
      sal_o => sal_o_tb
    );

  -- Proceso de estimulación
  stim_proc: process
  begin
    -- Caso 1: Sin desplazamiento (valor "000")
    des_i_tb <= "000";
    wait for 50 ns;
    
    -- Caso 2: Desplazar a la derecha 2 posiciones ("010")
    des_i_tb <= "010";
    wait for 50 ns;
    
    -- Caso 3: Desplazar a la derecha 7 posiciones ("111")
    des_i_tb <= "111";
    wait for 50 ns;
    
    -- Caso 4: Regresar a sin desplazamiento
    des_i_tb <= "000";
    wait for 50 ns;
    
    -- Fin de la simulación
    wait;
  end process;
  
end bShifterNb_tb_arch;