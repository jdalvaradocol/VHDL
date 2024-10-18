-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i, S_i : in std_logic ;
		XA_o : out std_logic
	
	);
end principal;

architecture Behavioral of principal is

component mux_logic is
	port 
	(
		A_i, B_i, S_i : in std_logic ;
		X_o : out std_logic

	);
end component;


begin

	MUXA : mux_logic port map 
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i,
		X_o => XA_o	
	);

end Behavioral;











