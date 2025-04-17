-- Testbench para la ALU

-- Arithmetic Logic Unit parametrizable para 5 operaciones:
-- 000 : Suma      (4 bits   → 8 bits)
-- 001 : Resta     (4 bits   → 8 bits)
-- 010 : Multip.   (4×4 bits → 8 bits)
-- 011 : División  (4 bits   → 8 bits, quotient)
-- 100 : Shifteo   (desplazamiento lógico a la derecha)

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity ALU_tb is
end ALU_tb;

-- Descripción de la arquitectura
architecture ALU_tb_arch of ALU_tb is

  -- Período de reloj de 50 ns
  constant clk_period : time := 50 ns;
  
  -- Señales de prueba
  signal clk_tb : std_logic := '0';             -- Reloj de sincronismo
  signal A_tb   : std_logic_vector(3 downto 0); -- Operando A (4 bits)
  signal B_tb   : std_logic_vector(3 downto 0); -- Operando B (4 bits)
  signal SEL_tb : std_logic_vector(2 downto 0); -- Selector de operación (3 bits)
  signal r_tb   : std_logic_vector(7 downto 0); -- Resultado extendido a 8 bits
  signal co_tb  : std_logic;                    -- Flag de carry/overflow o indicador genérico

begin

  -- Instanciación del DUT (Device Under Test)
  DUT: entity work.ALU
    port map (
      clk_i => clk_tb,
      A_i   => A_tb,
      B_i   => B_tb,
      SEL_i => SEL_tb,
      r_o   => r_tb,
      co_o  => co_tb
  );
  
  -- Proceso para generar el reloj
  clk_process: process
  begin
    clk_tb <= '0';
    wait for clk_period / 2;
    clk_tb <= '1';
    wait for clk_period / 2;
  end process;

  -- Proceso de estimulación
  stim_proc : process
  begin
    -- Inicializacion
        A_tb   <= (others => '0');
        B_tb   <= (others => '0');
        SEL_tb <= "000";
        wait for 20 ns;

        -- Operación 1
        -- Suma: 2 + 3 = 5 
        A_tb   <= "0010"; 
        B_tb   <= "0011"; 
        SEL_tb <= "000";
        wait for clk_period;
        report "SUMA: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);

        -- Operación 2
        -- Resta: 4 - 2 = 2
        A_tb <= "0100"; 
        B_tb <= "0010"; 
        SEL_tb <= "001";
        wait for clk_period;
        report "RESTA: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);

        -- Operación 3 
        -- Multiplicación: 3 * 3 = 9
        A_tb <= "0011"; 
        B_tb <= "0011"; 
        SEL_tb <= "010";
        wait for clk_period;
        report "MULT: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);

        -- Operación 4
        -- División: 4 / 2 = 2
        A_tb <= "0100"; 
        B_tb <= "0010"; 
        SEL_tb <= "011";
        wait for clk_period;
        report "DIV: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);

        -- División por cero: 5 / 0
         A_tb   <= "0101";
         B_tb   <= "0000";
         SEL_tb <= "011";
         wait for clk_period;
         report "DIV0: " & integer'image(to_integer(unsigned(r_tb))) &
           "  Carry=" & std_logic'image(co_tb);

        -- Operación 5
        -- Módulo: 5 % 2
        A_tb <= "0101"; 
        B_tb <= "0010"; 
        SEL_tb <= "100";
        wait for clk_period;
        report "SHIFT: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);

        -- Operación 6
        -- Shifteo: 4 >> 2 = 1
        A_tb <= "0100"; 
        B_tb <= "0010"; 
        SEL_tb <= "101";
        wait for clk_period;
        report "SHIFT: " & integer'image(to_integer(unsigned(r_tb))) & 
          " Carry: " & std_logic'image(co_tb);
        
        wait;
    end process;   

end ALU_tb_arch;
