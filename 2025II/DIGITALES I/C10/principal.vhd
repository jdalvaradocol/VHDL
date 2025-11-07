-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, x_i : in std_logic;
		  estado_o : out std_logic_vector(2 downto 0)	
	);
end principal;

architecture Behavioral of principal is

component FFT is
	port 
	(
		clk_i, T_i 	: in 	std_logic;
		Q_o			: out	std_logic
	);
end component;

signal TA, TB, TC : std_logic := '0';
signal  A,  B,  C : std_logic := '0';

signal estado : std_logic_vector(3 downto 0) := "1111";

begin

	FFA : FFT port map
	(
		clk_i => clk_i, 
		  T_i => TA,	
		  Q_o => A
	);

	FFB : FFT port map
	(
		clk_i => clk_i, 
		  T_i => TB,	
		  Q_o => B
	);

	FFC : FFT port map
	(
		clk_i => clk_i, 
		  T_i => TC,	
		  Q_o => C
	);

	estado <= A & B & C & x_i;
	
	TA <= '0' when	estado = "0100" else
			'1' when	estado = "0101" else
			'1' when	estado = "0110" else
			'0' when	estado = "0111" else
			'0' when	estado = "1010" else
			'1' when	estado = "1011" else
			'1' when	estado = "1110" else
			'0' when	estado = "1111" else
			'0';
 
	TB <= '0' when	estado = "0100" else
			'0' when	estado = "0101" else
			'1' when	estado = "0110" else
			'0' when	estado = "0111" else
			'1' when	estado = "1010" else
			'1' when	estado = "1011" else
			'0' when	estado = "1110" else
			'1' when	estado = "1111" else
			'0';
 
 	TC <= '1' when	estado = "0100" else
			'1' when	estado = "0101" else
			'0' when	estado = "0110" else
			'1' when	estado = "0111" else
			'0' when	estado = "1010" else
			'0' when	estado = "1011" else
			'1' when	estado = "1110" else
			'0' when	estado = "1111" else
			'0';

	estado_o <= A & B & C;				
			
 end Behavioral;




