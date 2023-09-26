library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_logic is
	port 
	(
		A_i, B_i, C_i, D_i, S0_i, S1_i : in std_logic;
		                 X_o : out std_logic
	);
end mux4x1_logic;

architecture Behavioral of mux4x1_logic is

begin

	X_o <= (not(S1_i) and not (S0_i) and A_i) or 
	     (not(S1_i) and     (S0_i) and B_i) or
	     (   (S1_i) and not (S0_i) and C_i) or 
		  (   (S1_i) and     (S0_i) and D_i);		

end Behavioral;


