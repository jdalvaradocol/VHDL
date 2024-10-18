-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_logic is
	port 
	(
		A_i, B_i, S_i : in std_logic ;
		X_o : out std_logic

	);
end mux_logic;

architecture Behavioral of mux_logic is

begin
	
	X_o <= (A_i and not(S_i) ) or (B_i and S_i) ;

end Behavioral;
