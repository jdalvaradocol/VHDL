-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_exp1 is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end deco_exp1;

architecture Behavioral of deco_exp1 is

begin

	salida_o <= "0111111" when entrada_i = "0000" else
					"0000110" when entrada_i = "0001" else
					"1011011" when entrada_i = "0010" else
					"1001111" when entrada_i = "0011" else
					"1100110" when entrada_i = "0100" else
					"1101101" when entrada_i = "0101" else
					"1111101" when entrada_i = "0110" else
					"0000111" when entrada_i = "0111" else
					"1111111" when entrada_i = "1000" else
					"1110111" when entrada_i = "1001" else 
					"0000000";
					
end Behavioral;
