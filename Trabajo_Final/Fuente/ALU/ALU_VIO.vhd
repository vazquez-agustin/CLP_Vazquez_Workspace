-- Arithmetic Logic Unit (ALU)
-- Archivo VIO (Virtual Input/Output)

-- Sección de librerías
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaración de la entidad
entity ALU_VIO is
  port (
    clk_i : in std_logic;  -- Reloj de sincronismo
  );
end ALU_VIO;

-- Descripción de la arquitectura
architecture ALU_VIO_arch of ALU_VIO is

  -- Sección declarativa

  -- Componente ALU 
  component ALU is
  port (
    clk_i : in std_logic;                     -- Reloj de sincronismo
    A_i   : in std_logic_vector(3 downto 0);  -- Operando A (4 bits)
    B_i   : in std_logic_vector(3 downto 0);  -- Operando B (4 bits)
    SEL_i : in std_logic_vector(2 downto 0);  -- Selector de operaciÃ³n (3 bits)
    r_o   : out std_logic_vector(7 downto 0); -- Resultado extendido a 8 bits
    co_o  : out std_logic                     -- Flag de carry/overflow o indicador genÃ©rico
  );
  end component;

  COMPONENT vio_0
    PORT (
      clk : IN STD_LOGIC;
      probe_in0  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      probe_in1  : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
  END COMPONENT;

  -- Señales para conectar el VIO y la ALU
  signal vio_A   : std_logic_vector(3 downto 0);
  signal vio_B   : std_logic_vector(3 downto 0);
  signal vio_SEL : std_logic_vector(2 downto 0);

  -- Señales internas para conectar los resultados de cada operación de la ALU
  signal int_r   : std_logic_vector(7 downto 0);
  signal int_co  : std_logic(0 downto 0);

begin

  -- Sección descriptiva

  -- Instancia de la ALU
  ALU_inst : ALU
    port map(
      clk_i => clk_i,
      A_i   => vio_A,
      B_i   => vio_B,
      SEL_i => vio_SEL,
      r_o   => int_r,
      co_o  => int_co(0)
  );

  -- Instancia del VIO para controlar y monitorear señales
  vio_inst: vio_0
    PORT MAP (
      clk => clk_i,
      probe_in0 => int_r,
      probe_in1 => int_co,
      probe_out0 => vio_A,
      probe_out1 => vio_B,
      probe_out2 => vio_SEL
    );
    
end ALU_VIO_arch;