-- Arithmetic Logic Unit (ALU)

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity ALU is
  port (
    clk_i : in std_logic;                     -- Reloj de sincronismo
    A_i   : in std_logic_vector(3 downto 0);  -- Operando A (4 bits)
    B_i   : in std_logic_vector(3 downto 0);  -- Operando B (4 bits)
    SEL_i : in std_logic_vector(2 downto 0);  -- Selector de operación (3 bits)
    r_o   : out std_logic_vector(7 downto 0); -- Resultado extendido a 8 bits
    co_o  : out std_logic                     -- Flag de carry/overflow o indicador genérico
  );
end ALU;

-- Descripción de la arquitectura
architecture ALU_arch of ALU is

  -- Sección declarativa
  -- Señales internas para las operaciones de la ALU
  signal addition    : std_logic_vector(3 downto 0); -- Resultado de la suma
  signal subtraction : std_logic_vector(3 downto 0); -- Resultado de la resta
  signal product     : std_logic_vector(7 downto 0); -- Resultado del producto
  signal quotient    : std_logic_vector(3 downto 0); -- Cociente de la división
  signal remainder   : std_logic_vector(3 downto 0); -- Resto de la división
  signal shift_out   : std_logic_vector(3 downto 0); -- Resultado del desplazamiento

  -- Flags internos
  signal carry  : std_logic; -- Acarreo generado en la suma
  signal borrow : std_logic; -- Préstamo generado en la resta

begin

  -- Sección descriptiva

  -----------------------------------------------------------------
  -- 1) Sumador de 4 bits (addNb)
  -----------------------------------------------------------------
  adder_inst: entity work.addNb
    generic map(
      N => 4
    )
    port map(
      a_i  => A_i,
      b_i  => B_i,
      ci_i => '0',      -- Sin carry inicial
      s_o  => addition, -- Resultado de 4 bits
      co_o => carry     -- Acarreo de salida
    );

  -----------------------------------------------------------------
  -- 2) Restador de 4 bits (sub4b)
  -----------------------------------------------------------------
  subtractor_inst: entity work.sub4b
    port map(
      a_i => A_i,
      b_i => B_i,
      d_o => subtraction, -- Diferencia de 4 bits
      p_o => borrow       -- '1' = sin préstamo, '0' = préstamo
    );

  -----------------------------------------------------------------
  -- 3) Multiplicador de 4 bits (mult4b)
  -----------------------------------------------------------------
  multiplier_inst: entity work.mult4b
    port map(
      a_i => A_i,
      b_i => B_i,
      p_o => product -- Producto de 8 bits
    );

  -----------------------------------------------------------------
  -- 4) Divisor de 4 bits (div4b)
  -----------------------------------------------------------------
  divider_inst: entity work.div4b
    port map(
      dvd_i => A_i,
      dvr_i => B_i,
      c_o   => quotient, -- Cociente de 4 bits
      r_o   => remainder -- Resto (4 bits)
    );

 -----------------------------------------------------------------
  -- 5) Desplazador lógico a la derecha (bShifterNb)
  -----------------------------------------------------------------
  shifter_inst: entity work.bShifterNb
    generic map(
      N => 4, -- Ancho de datos
      M => 2  -- Número de bits para el valor de desplazamiento
    )
    port map(
      ent_i => A_i,
      des_i => B_i(1 downto 0), -- Se extraen los 2 bits menos significativos de B_i
      sal_o => shift_out
    );

 -----------------------------------------------------------------
  -- Lógica de selección de operación
  -----------------------------------------------------------------
  process(clk_i)
  begin
    if rising_edge(clk_i) then
      case SEL_i is
        when "000"   =>
          -- Suma
          r_o  <= "0000" & addition;
          co_o <= carry;

        when "001"   =>
          -- Resta
          r_o  <= "0000" & subtraction;
          co_o <= borrow;

        when "010"   =>
          -- Multiplicación
          r_o  <= product;
          co_o <= '0';

        when "011"   =>
          -- División (solo cociente)
          r_o  <= "0000" & quotient;
          co_o <= '0';

        when "100"   =>
          -- Módulo (solo resto)
          r_o  <= "0000" & remainder;
          co_o <= '0';

        when "101"   =>
          -- Shifteo
          r_o  <= "0000" & shift_out;
          co_o <= '0';

        when others  =>
          -- Caso por defecto: salida en cero
          r_o  <= (others => '0');
          co_o <= '0';

      end case;
    end if;
  end process;
    
end ALU_arch;