-- Arithmetic Logic Unit (ALU)

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity ALU is
  port (
    clk_i : in std_logic               -- Reloj de la ALU
    A_i   : in std_logic(3 downto 0);  -- Operando A (4 bits)
    B_i   : in std_logic(3 downto 0);  -- Operando B (4 bits)
    SEL_i : in std_logic(1 downto 0);  -- Selector de operación (3 bits para 5 operaciones)
    r_o   : out std_logic(7 downto 0); -- Resultado final (8 bits)
    co_o  : out std_logic              -- Señal de Carry/Flag según operación
  );
end ALU;

-- Descripción de la arquitectura
architecture ALU_arch of ALU is

  -- Sección declarativa
  -- Señales internas para las operaciones de la ALU
  signal addition   : std_logic_vector(3 downto 0); -- Resultado de la suma
  signal subraction : std_logic_vector(3 downto 0); -- Resultado de la resta
  signal product    : std_logic_vector(7 downto 0); -- Resultado del producto
  signal quotient   : std_logic_vector(3 downto 0); -- Cociente de la división
  signal remainder  : std_logic_vector(3 downto 0); -- Resto de la división
  signal shift      : std_logic_vector(3 downto 0); -- Resultado del desplazamiento
  signal carry      : std_logic;                    -- Acarreo generado en la suma
  signal borrow     : std_logic;                    -- Préstamo generado en la resta

begin

  -- Sección descriptiva

  -----------------------------------------------------------------
  -- Instanciación del Sumador de 4 bits (addNb)
  -- Se utiliza para realizar la operación de suma.
  -----------------------------------------------------------------
  adder_inst: entity work.addNb
    generic map(
      N => 4
    )
    port map(
      a_i  => A_i,
      b_i  => B_i,
      ci_i => '0',   -- Sin carry inicial
      s_o  => S_o,   -- Resultado de la suma (4 bits)
      co_o => carry  -- Acarreo resultante
    );

  -----------------------------------------------------------------
  -- Instanciación del Restador de 4 bits (sub4b)
  -- Se utiliza para calcular A_i - B_i.
  -----------------------------------------------------------------
  subtractor_inst: entity work.sub4b
    port map(
      a_i => A_i,
      b_i => B_i,
      d_o => subtraction, -- Resultado de la resta (4 bits)
      p_o => borrow       -- Préstamo: '1' indica que NO hubo préstamo
    );

  -----------------------------------------------------------------
  -- Instanciación del Multiplicador de 4 bits (mult4b)
  -- Realiza la multiplicación de A_i por B_i. El resultado es de 8 bits.
  -----------------------------------------------------------------
  multiplier_inst: entity work.multiplier4b
    port map(
      a_i => A_i,
      b_i => B_i,
      p_o => product -- Producto de 8 bits
    );

  -----------------------------------------------------------------
  -- Instanciación del Divisor de 4 bits (div4b)
  -- Realiza la división de A_i entre B_i. Se presenta el cociente.
  -----------------------------------------------------------------
  divider_inst: entity work.divider4b
    port map(
      clk_i => clk_i,
      dvd_i => A_i,
      dvr_i => B_i,
      c_o   => quotient, -- Cociente (4 bits)
      r_o   => remainder -- Resto (4 bits)
    );

  -----------------------------------------------------------------
  -- Instanciación del Módulo de Desplazamiento (bShifterNb)
  -- Se desplaza lógicamente A_i a la derecha por el valor indicado en B_i(1 downto 0).
  -- Se configuran los parámetros para que el ancho de datos sea 4 bits y se
  -- utilicen 2 bits para el desplazamiento (posibles valores 0 a 3).
  ----------------------------------------------------------------- 
  shifter_inst: entity work.
    generic map(
      M => 4, -- Ancho de la entrada A_i
      N => 2  -- Número de bits para el valor de desplazamiento
    )
    port map(
      ent_i => A_i,
      des_i => B_i(1 downto 0), -- Se extraen los 2 bits menos significativos de B_i
      sal_o => shift
    )

  -----------------------------------------------------------------
  -- Lógica de Selección de Operación
  -- Se utiliza un proceso sincrónico que en cada flanco de subida del reloj
  -- selecciona y envía a la salida el resultado correspondiente según SEL_i.
  -- Para operaciones de 4 bits, se extiende el resultado a 8 bits concatenando 4 ceros a la izquierda.
  -----------------------------------------------------------------
  process(clk_i)
  begin
    if rising_edge(clk_i) then
      case SEL_i is
        when "000"   =>
          -- Operación: Suma
          r_o  <= "0000" & addition;    -- Extiende a 8 bits
          co_o <= carry;
        when "001"   =>
          -- Operación: Resta
          r_o  <= "0000" & subtraction; -- Extiende a 8 bits
          co_o <= borrow;
        when "010"   =>
          -- Operación: Multiplicación
          r_o  <= product;              -- Resultado ya es de 8 bits
          co_o <= '0';
        when "011"   =>
          -- Operación: División
          r_o  <= "0000" & quotient;
          co_o <= '0';
        when "100"   =>
          -- Operación: Desplazamiento (Shifteo)
          r_o  <= "0000" & shift;
          co_o <= '0';
        when others =>
          -- Caso por defecto: salida en cero
          r_o  <= (others => '0');
          co_o <= '0';
      end case;
    end if;
  end process;
    
end ALU_arch;