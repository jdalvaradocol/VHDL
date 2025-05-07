-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		salida_o	 : out std_logic_vector(6 downto 0)
	);
end decodificador;

architecture Behavioral of decodificador is

begin

salida_o <= "1000000" when entrada_i = "0000" else -- x"0"
				"1111001" when entrada_i = "0001" else -- x"1"
				"0100100" when entrada_i = "0010" else -- x"2"
				"0110000" when entrada_i = "0011" else -- x"3"
				"0011001" when entrada_i = "0100" else -- x"4"
				"0010010" when entrada_i = "0101" else -- x"5"
				"0000011" when entrada_i = "0110" else -- x"6"
				"1111000" when entrada_i = "0111" else -- x"7"
				"0000000" when entrada_i = "1000" else -- x"8"
				"0011000" when entrada_i = "1001" else -- x"9"
				"0001000" when entrada_i = "1010" else -- x"A"
				"0000011" when entrada_i = "1011" else -- x"B"
				"1000110" when entrada_i = "1100" else -- x"C"
				"0100001" when entrada_i = "1101" else -- x"D"
				"0000110" when entrada_i = "1110" else -- x"E"
				"0001110" when entrada_i = "1111" else -- x"F"
				"1111111";

end Behavioral;


