-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity semisumador is
	port 
	(
		A_i	   : in std_logic;
		B_i	   : in std_logic;
		Ac_o	   : out std_logic;
		S_o	   : out std_logic
	);

end entity;

architecture rtl of semisumador is
begin

	Ac_o <= A_i and B_i;
	S_o <= A_i xor B_i;

end rtl;
