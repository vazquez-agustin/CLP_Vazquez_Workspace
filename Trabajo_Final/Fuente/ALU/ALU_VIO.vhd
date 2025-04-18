-- Arithmetic Logic Unit (ALU)
-- Archivo VIO (Virtual Input/Output)

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity ALU_VIO is
  port (
    clk_i : in std_logic;                     -- Reloj de sincronismo
    A_i   : in std_logic_vector(3 downto 0);  -- Operando A (4 bits)
    B_i   : in std_logic_vector(3 downto 0);  -- Operando B (4 bits)
    SEL_i : in std_logic_vector(2 downto 0);  -- Selector de operación (3 bits)
    r_o   : out std_logic_vector(7 downto 0); -- Resultado extendido a 8 bits
    co_o  : out std_logic                     -- Flag de carry/overflow o indicador genérico
  );
end ALU_VIO;

-- Descripción de la arquitectura
architecture ALU_VIO_arch of ALU_VIO is

  -- Sección declarativa
  -- Señales internas para las operaciones de la ALU
  signal addition    : std_logic_vector(3 downto 0); -- Resultado de la suma
  signal subtraction : std_logic_vector(3 downto 0); -- Resultado de la resta
  signal product     : std_logic_vector(7 downto 0); -- Resultado del producto
  signal quotient    : std_logic_vector(3 downto 0); -- Cociente de la división
  signal remainder   : std_logic_vector(3 downto 0); -- Resto de la división
  signal shift_out   : std_logic_vector(3 downto 0); -- Resultado del desplazamiento

  -- Flags internos
  signal carry  : std_logic;  -- Acarreo generado en la suma
  signal borrow : std_logic;  -- Préstamo generado en la resta

  component vio_0
    port (
      clk        : in std_logic;                     -- Reloj de sincronismo
      probe_in0  : in std_logic_vector(7 downto 0);  -- Monitorea r_o
      probe_in1  : in std_logic;                     -- Monitorea co_o
      probe_out0 : out std_logic_vector(3 downto 0); -- Monitorea A_i
      probe_out1 : out std_logic_vector(3 downto 0); -- Monitorea B_i
      probe_out2 : out std_logic_vector(2 downto 0); -- Monitorea SEL_i
    );
  end component;

  -- Señales para conectar el VIO y la ALU
  signal vio_A   : std_logic_vector(3 downto 0); 
  signal vio_B   : std_logic_vector(3 downto 0); 
  signal vio_SEL : std_logic_vector(2 downto 0);

  -- Señales internas para conectar los resultados de cada operación de la ALU
  signal int_r   : std_logic_vector(7 downto 0); 
  signal int_co  : std_logic; 

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
      a_i  => vio_A,
      b_i  => vio_B,
      ci_i => '0',      -- Sin carry inicial
      s_o  => addition, -- Resultado de 4 bits
      co_o => carry     -- Acarreo de salida
    );

  -----------------------------------------------------------------
  -- 2) Restador de 4 bits (sub4b)
  -----------------------------------------------------------------
  subtractor_inst: entity work.sub4b
    port map(
      a_i => vio_A,
      b_i => vio_B,
      d_o => subtraction, -- Diferencia de 4 bits
      p_o => borrow       -- '1' = sin préstamo, '0' = préstamo
    );

  -----------------------------------------------------------------
  -- 3) Multiplicador de 4 bits (mult4b)
  -----------------------------------------------------------------
  multiplier_inst: entity work.mult4b
    port map(
      a_i => vio_A,
      b_i => vio_B,
      p_o => product -- Producto de 8 bits
    );

  -----------------------------------------------------------------
  -- 4) Divisor de 4 bits (div4b)
  -----------------------------------------------------------------
  divider_inst: entity work.div4b
    port map(
      dvd_i => vio_A,
      dvr_i => vio_B,
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
      ent_i => vio_A,
      des_i => vio_B(1 downto 0), -- Se extraen los 2 bits menos significativos de B_i
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
          int_r  <= "0000" & addition;
          int_co <= carry;

        when "001"   =>
          -- Resta
          int_r  <= "0000" & subtraction;
          int_co <= borrow;

        when "010"   =>
          -- Multiplicación
          int_r  <= product;
          int_co <= '0';

        when "011"   =>
          -- División (solo cociente)
          int_r  <= "0000" & quotient;
          int_co <= '0';

        when "100"   =>
          -- Módulo (solo resto)
          int_r  <= "0000" & remainder;
          int_co <= '0';

        when "101"   =>
          -- Shifteo
          int_r  <= "0000" & shift_out;
          int_co <= '0';

        when others =>
          -- Caso por defecto: salida en cero
          int_r  <= (others => '0');
          int_co <= '0';

      end case;
    end if;
  end process;

  -- Instancia del VIO para controlar y monitorear señales
  vio_inst: vio_0
    port map (
      clk_i      => clk,
      probe_in0  => int_r,
      probe_in1  => int_co,
      probe_out0 => vio_A,
      probe_out1 => vio_B,
      probe_out2 => vio_SEL
    );
    
end ALU_VIO_arch;