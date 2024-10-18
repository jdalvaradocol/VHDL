-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux16x1 is
	port 
	(
			selector_i 	: in  std_logic_vector(3 downto 0);
			entrada_i	: in  std_logic_vector(15 downto 0);
			salida_o		: out	std_logic 
	);
end mux16x1;

architecture Behavioral of mux16x1 is

begin

	salida_o <= entrada_i(0)  when selector_i = "0000" else
					entrada_i(1)  when selector_i = "0001" else
					entrada_i(2)  when selector_i = "0010" else
					entrada_i(3)  when selector_i = "0011" else
					entrada_i(4)  when selector_i = "0100" else
					entrada_i(5)  when selector_i = "0101" else
					entrada_i(6)  when selector_i = "0110" else
					entrada_i(7)  when selector_i = "0111" else
					entrada_i(8)  when selector_i = "1000" else
					entrada_i(9)  when selector_i = "1001" else
					entrada_i(10) when selector_i = "1010" else
					entrada_i(11) when selector_i = "1011" else
					entrada_i(12) when selector_i = "1100" else
					entrada_i(13) when selector_i = "1101" else
					entrada_i(14) when selector_i = "1110" else
					entrada_i(15) when selector_i = "1111" else '0';
	
end Behavioral;
