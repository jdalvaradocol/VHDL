-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity decodificador_B is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end decodificador_B;

architecture Behavioral of decodificador_B is

-- entrada_i(3) = A 
-- entrada_i(2) = B 
-- entrada_i(1) = C 
-- entrada_i(0) = D

-- decodificador_o(6) = g
-- decodificador_o(5) = f
-- decodificador_o(4) = e
-- decodificador_o(3) = d
-- decodificador_o(2) = c
-- decodificador_o(1) = b
-- decodificador_o(0) = a

begin
	
	decodificador_o <= "1000000" when entrada_i = "0000" else
							 "1111001" when entrada_i = "0001" else
							 "0100100" when entrada_i = "0010" else
							 "0110000" when entrada_i = "0011" else
							 "1000000" when entrada_i = "0100" else
							 "1111001" when entrada_i = "0101" else
							 "1000000" when entrada_i = "0110" else
							 "1111001" when entrada_i = "0111" else
							 "1000000" when entrada_i = "1000" else
							 "1111001" when entrada_i = "1001" else
							 "1000000" when entrada_i = "1010" else
							 "1111001" when entrada_i = "1011" else
							 "1000000" when entrada_i = "1100" else
							 "1111001" when entrada_i = "1101" else
							 "1000000" when entrada_i = "1110" else
							 "1111001" when entrada_i = "1111" else
							 "1111111";
						
							 
end Behavioral;
