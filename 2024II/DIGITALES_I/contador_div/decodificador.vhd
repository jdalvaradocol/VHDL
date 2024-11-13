-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
	port 
	(
		BCD_i	:  in std_logic_vector(3 downto 0);
		X_o	: out	std_logic_vector(7 downto 0)
	);
end decodificador;

architecture Behavioral of decodificador is

-- a b c d e f g
-- 40
-- 79
-- 24
-- 30
-- 19
-- 12
-- 02
-- 78
-- 00
-- 10

begin

	X_o <= 	x"40" when bcd_i = "0000" else
				x"79" when bcd_i = "0001" else
				x"24" when bcd_i = "0010" else
				x"30" when bcd_i = "0011" else
				x"19" when bcd_i = "0100" else
				x"12" when bcd_i = "0101" else
				x"02" when bcd_i = "0110" else
				x"78" when bcd_i = "0111" else
				x"00" when bcd_i = "1000" else
				x"10" when bcd_i = "1001" else
				x"01" when bcd_i = "1010" else
				x"02" when bcd_i = "1011" else
				x"03" when bcd_i = "1100" else
				x"04" when bcd_i = "1101" else
				x"05" when bcd_i = "1110" else
				x"06" when bcd_i = "1111" else
				x"00";
				
end Behavioral;
