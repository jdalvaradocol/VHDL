-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_when is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end deco_when;


architecture Behavioral of deco_when is

begin

	salida_i <= "0111111" when entrada_i = "0000" else -- 0
					"0000110" when entrada_i = "0001" else -- 1
					"1011011" when entrada_i = "0010" else -- 2
					"1001111" when entrada_i = "0011" else -- 3
					"1100110" when entrada_i = "0100" else -- 4
					"1101101" when entrada_i = "0101" else -- 5
					"1111101" when entrada_i = "0110" else -- 6
					"0000111" when entrada_i = "0111" else -- 7
					"1111111" when entrada_i = "1000" else -- 8
					"1101111" when entrada_i = "1001" else -- 9
					"1110111" when entrada_i = "1010" else -- 10
					"1111100" when entrada_i = "1011" else -- 11
					"0111001" when entrada_i = "1100" else -- 12
					"1011110" when entrada_i = "1101" else -- 13
					"1111001" when entrada_i = "1110" else -- 14
					"1110001" when entrada_i = "1111" else -- 15
					"0000000";                             -- XX
					
	
end Behavioral;