library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port 
	(
		A_i, B_i, S_i : in std_logic;
		   		 X_o : out std_logic
	);
end mux2x1;

architecture Behavioral of mux2x1 is

begin

	X_o <= (not(S_i) and A_i) or ( S_i and B_i);
	
end Behavioral;