-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity Contador5 is
	port 
	(
		clk_i			:  in std_logic;
		contador_o	: out std_logic_vector(3 downto 0);
		R_o			: out std_logic
	);
end Contador5;

architecture Behavioral of Contador5 is

signal R 		 : std_logic := '0'; 
signal contador : std_logic_vector(3 downto 0):= "0000";

begin

	FA: entity work.FFTR port map
	(
		T_i	=>         '1', 
		clk_i => 		clk_i, 
		R_i   =>     		 R,	
		Q_o	=> contador(0)				
	);

	FB: entity work.FFTR port map
	(
		T_i	=>         '1', 
		clk_i => contador(0), 
		R_i   =>           R,	
		Q_o	=> contador(1)				
	);

	FC: entity work.FFTR port map
	(
		T_i	=>         '1', 
		clk_i => contador(1), 
		R_i   =>           R,	
		Q_o	=> contador(2)			
	);

	FD: entity work.FFTR port map
	(
		T_i	=>         '1', 
		clk_i => contador(2), 
		R_i   =>           R,	
		Q_o	=> contador(3)			
	);	

-- 0110	
	
	R <= not(contador(3)) and contador(2) and contador(1) and not(contador(0));

	contador_o <= contador;
	       R_o <= R;
	
end Behavioral;