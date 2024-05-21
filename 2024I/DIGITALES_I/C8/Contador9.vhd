-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity Contador9 is
	port 
	(
		clk_i			:  in std_logic;
		contador_o	: out std_logic_vector(3 downto 0);
		R_o			: out std_logic
	);
end Contador9;

architecture Behavioral of Contador9 is

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

-- 1010	
	
	R <= contador(3) and not(contador(2)) and contador(1) and not(contador(0));

	contador_o <= contador;
	       R_o <= R;
	
end Behavioral;
