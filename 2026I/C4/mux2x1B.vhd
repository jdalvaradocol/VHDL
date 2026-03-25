-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux2x1B is
	port 
	(
		A_i, B_i, S_i 	: in  std_logic ;
		x_o				: out std_logic

	);
end mux2x1B;


architecture Behavioral of mux2x1B is

begin

x_o <= 	A_i when S_i = '0' else
			B_i when S_i = '1' else
			'0';
 

end Behavioral;
