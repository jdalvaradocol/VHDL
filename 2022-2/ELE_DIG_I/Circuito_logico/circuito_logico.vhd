-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_logico is
	port 
	(
		A_i :  in  std_logic;
		B_i :  in  std_logic;
		C_i :  in  std_logic;
		x_o : out  std_logic
	);
end circuito_logico;

architecture Behavioral of circuito_logico is

begin

	x_o <= A_i or B_i;

end Behavioral;

