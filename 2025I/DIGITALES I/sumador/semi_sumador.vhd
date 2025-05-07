-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity semi_sumador is
	port 
	(
		A_i, B_i : in std_logic;
		C_o, S_o : out std_logic
	);
end semi_sumador;

architecture Behavioral of semi_sumador is

begin

	S_o <= A_i xor B_i;
	C_o <= A_i and B_i;
	
end Behavioral;



