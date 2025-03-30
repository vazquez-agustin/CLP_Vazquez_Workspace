-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad
entity cont4b is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		cuenta_o: out std_logic_vector(3 downto 0)		
	);
end entity cont4b;

-- Declaracion cuerpo de arquitectura
architecture cont4b_arq of cont4b is
	-- Parte declarativa
	signal d      : std_logic_vector(3 downto 0);
    signal q      : std_logic_vector(3 downto 0);
    signal andOut : std_logic_vector(2 downto 0);

	component reg is
	  generic(
	    N: natural := 4
	  );
	  port(
	    clk_i : in std_logic; 	                -- clock
		rst_i : in std_logic;		            -- reset sincronico
		ena_i : in std_logic;		            -- habilitador
		d_i   : in std_logic_vector(N-1 downto 0); -- dato de entrada
		q_o   : out std_logic_vector(N-1 downto 0)	-- dato de salida
	  );
	  end component reg;

	begin
	  
	  d(0)      <= ena_i xor q(0);
	  andOut(0) <= ena_i and q(0);

	  d(1)      <= andOut(0) xor q(1);
	  andOut(1) <= andOut(0) and q(1);

	  d(2)      <= andOut(1) xor q(2);
	  andOut(2) <= andOut(1) and q(2);

	  d(3)      <= andOut(2) xor q(3);

	  reg_inst : reg
	    generic map(
	      N => 4
	    )

	    port map(
	      clk_i => clk_i,
		  rst_i => rst_i,
		  ena_i => ena_i,
		  d_i   => d,
		  q_o   => q
	    );

	    cuenta_o <= q;

	end;