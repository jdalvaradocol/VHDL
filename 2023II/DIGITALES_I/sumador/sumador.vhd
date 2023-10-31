-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity sumador is
	port 
	(
		A_i, B_i, C_i	:  in std_logic;
		C_o, S_o			: out std_logic 
	);
end sumador;

architecture Behavioral of sumador is

begin

	C_o <= 	(A_i and B_i) or 
				(C_i and A_i) or
				(C_i and B_i);
	
	S_o <= 	(A_i and B_i) or 
				(C_i and (A_i xor B_i));

end Behavioral;