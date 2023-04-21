-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port 
	(
		A_i, B_i, S_i :  in std_logic;
		x_o			  : out std_logic
		
	);
end mux2x1;

architecture Behavioral of mux2x1 is

begin
	
	x_o <= (B_i and S_i) or (A_i and not(S_i));  	

end Behavioral;







