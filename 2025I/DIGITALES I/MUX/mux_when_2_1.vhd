-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_when_2_1 is
	port 
	(
		A_i, B_i, S_i 	: in 	std_logic;
		X_o			: out	std_logic
	);
end mux_when_2_1;

architecture Behavioral of mux_when_2_1 is

begin

X_o <= 	A_i when S_i = '0' else
			B_i when S_i = '1' else 
			'0';  
			
end Behavioral;


