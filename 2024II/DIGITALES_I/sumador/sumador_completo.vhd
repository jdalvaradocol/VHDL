-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity sumador_completo is
	port 
	(
		A_i, B_i, C_i 	: in 	std_logic;
		C_o, S_o 		: out std_logic
	);
end sumador_completo;

architecture Behavioral of sumador_completo is

signal entrada : std_logic_vector(2 downto 0):= "000";

begin

	entrada <= A_i & B_i & C_i;

	S_o <= 	'0' when entrada = "000" else
				'1' when entrada = "001" else
				'1' when entrada = "010" else
				'0' when entrada = "011" else
				'1' when entrada = "100" else
				'0' when entrada = "101" else
				'0' when entrada = "110" else
				'1' when entrada = "111" else
				'0';

	C_o <= 	'0' when entrada = "000" else
				'0' when entrada = "001" else
				'0' when entrada = "010" else
				'1' when entrada = "011" else
				'0' when entrada = "100" else
				'1' when entrada = "101" else
				'1' when entrada = "110" else
				'1' when entrada = "111" else
				'0';				

end Behavioral;
