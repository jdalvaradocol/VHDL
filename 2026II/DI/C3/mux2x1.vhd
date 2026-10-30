-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port 
	(
		EN_i	: in	std_logic_vector(1 downto 0);
		S_i	: in	std_logic;
		x_o	: out std_logic
	);
end mux2x1;


architecture Behavioral of mux2x1 is

begin

-- when else

	x_o <= EN_i(1) when S_i = '0' else   
			 EN_i(0) when S_i = '1' else
			 '0';
	
end Behavioral;






