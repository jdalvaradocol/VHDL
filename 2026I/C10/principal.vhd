-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(	
		clk_i, X_i : in std_logic;
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

signal FA, FB, FC : std_logic:='0';
signal  A,  B,  C : std_logic:='0';
signal salida : std_logic_vector(3 downto 0):="0000";	 

begin

	FFA: FFD port map 
	(
		D_i =>    FA, 
		C_i => clk_i,
		Q_o =>	  A	
	);
	
	FFB: FFD port map 
	(
		D_i =>    FB, 
		C_i => clk_i,
		Q_o =>	  B	
	);
	
	FFC: FFD port map 
	(
		D_i =>    FC, 
		C_i => clk_i,
		Q_o =>	  C	
	);

	salida <= A & B & C & x_i;
	
	-- 2 7 8 13
	FA <= '1' when ( salida = "0010" or
						  salida = "0111" or
						  salida = "1000" or
						  salida = "1101" ) 
			else '0';			

	-- 3 7 8 12
	FB <= '1' when ( salida = "0011" or
						  salida = "0111" or
						  salida = "1000" or
						  salida = "1100" ) 
			else '0';		

	-- 2 7 8 13
	FC <= '0' when ( salida = "0010" or
						  salida = "0111" or
						  salida = "1000" or
						  salida = "1101" ) 
			else '1';				
	
	salida_o <= A & B & C;
	
end Behavioral;






