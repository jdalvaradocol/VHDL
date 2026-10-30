-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_A is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end mux4x1_A;


architecture Behavioral of mux4x1_A is

begin

	x_o <= (EN_i(3) and not(S_i(1)) and not(S_i(0))) or
			 (EN_i(2) and not(S_i(1)) and    (S_i(0))) or
			 (EN_i(1) and    (S_i(1)) and not(S_i(0))) or
			 (EN_i(0) and    (S_i(1)) and    (S_i(0))) ;
	
end Behavioral;






