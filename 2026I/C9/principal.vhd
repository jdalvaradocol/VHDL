-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, x_i : in std_logic;
		salida_o   : out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

component FFD is
	port 
	(
		D_i, C_i : in  std_logic;
		Q_o		: out std_logic
	);
end component;

signal FA, FB, FC : std_logic:= '0';
signal  A,  B,  C : std_logic:= '0';

signal estado : std_logic_vector(3 downto 0):= "0000";

begin
	
	FFD_A: FFD port map
	(
		D_i => FA, 
		C_i => clk_i,
		Q_o => A 
	);

	FFD_B: FFD port map
	(
		D_i => FB, 
		C_i => clk_i,
		Q_o => B 
	);
	
	FFD_C: FFD port map
	(
		D_i => FC, 
		C_i => clk_i,
		Q_o => C 
	);

	estado <= A & B & C & x_i;
	
	FA <= '1' when (estado = "0101" or estado = "0110" or
						 estado = "1010" or estado = "1111") 
			 else '0';

	FB <= '0' when (estado = "0110" or estado = "1111") 
			 else '1';		 
			 
	FC <= '1' when (estado = "0100" or estado = "0101" or
						 estado = "0110" or estado = "1010" or
						 estado = "1011" or estado = "1111") 
			 else '0';

	salida_o <= A & B & C;			
	
end Behavioral;






