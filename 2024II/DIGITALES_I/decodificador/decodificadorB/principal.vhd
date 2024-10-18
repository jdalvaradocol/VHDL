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

	process(entrada_i)
	
	begin
	
		if    entrada_i = x"0" then	salida_o <= "1000000";
		elsif entrada_i = x"1" then	salida_o <= "1111001";
		elsif entrada_i = x"2" then	salida_o <= "0100100";
		elsif entrada_i = x"3" then	salida_o <= "0110000";
		elsif entrada_i = x"4" then	salida_o <= "0011001";
		elsif entrada_i = x"5" then	salida_o <= "0010010";
		elsif entrada_i = x"6" then	salida_o <= "0000011";
		elsif entrada_i = x"7" then	salida_o <= "1111000";
		elsif entrada_i = x"8" then	salida_o <= "0000000";
		elsif entrada_i = x"9" then	salida_o <= "0011000";
		elsif entrada_i = x"A" then	salida_o <= "0001000";
		elsif entrada_i = x"B" then	salida_o <= "0000011";
		elsif entrada_i = x"C" then	salida_o <= "1000110";
		elsif entrada_i = x"D" then	salida_o <= "0100001";
		elsif entrada_i = x"E" then	salida_o <= "0000110";
		elsif entrada_i = x"F" then	salida_o <= "0001110";
		else 									salida_o <= "0000000";
		end if;
	
	end process;
	
end Behavioral;











