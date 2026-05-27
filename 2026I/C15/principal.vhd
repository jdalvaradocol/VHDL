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

signal FA, FB : std_logic:='0';
signal  A,  B : std_logic:='0';
signal estado : std_logic_vector(2 downto 0):="000";	 

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
	
	
	estado <= A & B & x_i;
	
	-- 1 2 4 7
	FA <= '1' when ( estado = "001" or
						  estado = "010" or
						  estado = "100" or
						  estado = "111" ) 
			else '0';			

	-- 2 3 6 7
	FB <= '0' when ( estado = "010" or
						  estado = "011" or
						  estado = "110" or
						  estado = "111" ) 
			else '1';					
	
	
	salida_o <=    "010" when estado = "000" else
						"010" when estado = "001" else
						"011" when estado = "010" else
						"011" when estado = "011" else
						"101" when estado = "100" else
						"101" when estado = "101" else
						"111" when estado = "110" else
						"111" when estado = "111" else "010";
						
end Behavioral;






