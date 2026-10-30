-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_B is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end mux4x1_B;


architecture Behavioral of mux4x1_B is

begin

-- when else

	x_o <= EN_i(3) when S_i = "00" else   
			 EN_i(2) when S_i = "01" else
			 EN_i(1) when S_i = "10" else
			 EN_i(0) when S_i = "11" else 
			 '0';
	
end Behavioral;






