-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity semisumador is
	port 
	(
		A_i, B_i	:  in std_logic;
		C_o, S_o	: out std_logic 
	);
end semisumador;

architecture Behavioral of semisumador is

begin

	C_o <= A_i xor B_i;
	S_o <= A_i and B_i;

end Behavioral;









