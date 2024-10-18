-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
			entrada_i 	: in  std_logic_vector(3 downto 0);
			salida_o		: out	std_logic_vector(6 downto 0) 
	);
end principal;

architecture Behavioral of principal is

begin

	salida_o <= "1000000" when entrada_i = "0000" else
					"1111001" when entrada_i = "0001" else
					"0100100" when entrada_i = "0010" else
					"0110000" when entrada_i = "0011" else
					"0011001" when entrada_i = "0100" else
					"0010010" when entrada_i = "0101" else
					"0000011" when entrada_i = "0110" else
					"1111000" when entrada_i = "0111" else
					"0000000" when entrada_i = "1000" else
					"0011000" when entrada_i = "1001" else
					"0001000" when entrada_i = "1010" else
					"0000011" when entrada_i = "1011" else
					"1000110" when entrada_i = "1100" else
					"0100001" when entrada_i = "1101" else
					"0000110" when entrada_i = "1110" else
					"0001110" when entrada_i = "1111" else "0000000";
	
end Behavioral;











