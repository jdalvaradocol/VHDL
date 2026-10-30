-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity semi_sumador is
	port 
	(
		A_i, B_i : in std_logic;
		s_o, c_o	: out std_logic
	);
end semi_sumador;

architecture Behavioral of semi_sumador is

begin

	s_o <=  '0' when A_i = '0' and B_i = '0' else
			  '1' when A_i = '0' and B_i = '1' else 
			  '1' when A_i = '1' and B_i = '0' else
			  '0' when A_i = '1' and B_i = '1' else	
			  '0';

	c_o <=  '0' when A_i = '0' and B_i = '0' else
			  '0' when A_i = '0' and B_i = '1' else 
			  '0' when A_i = '1' and B_i = '0' else
			  '1' when A_i = '1' and B_i = '1' else	
			  '0';				
	
end Behavioral;







