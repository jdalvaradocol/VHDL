-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity decodificador_C is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end decodificador_C;

architecture Behavioral of decodificador_C is

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

	process(entrada_i)
	begin
	
		if 	entrada_i = "0000" then
			decodificador_o <= "1000000";
		elsif entrada_i = "0001" then
			decodificador_o <= "1000001";
		elsif entrada_i = "0010" then
			decodificador_o <= "1001100";
		elsif entrada_i = "0011" then
			decodificador_o <= "1001100";		
		elsif entrada_i = "0100" then
			decodificador_o <= "1011000";
		elsif entrada_i = "0101" then
			decodificador_o <= "1000011";
		elsif entrada_i = "0110" then
			decodificador_o <= "1100000";			
		elsif entrada_i = "0111" then
			decodificador_o <= "0011000";			
		elsif entrada_i = "1000" then
			decodificador_o <= "1000110";
		elsif entrada_i = "1001" then
			decodificador_o <= "1010010";
		elsif entrada_i = "1010" then
			decodificador_o <= "1010001";
		elsif entrada_i = "1011" then
			decodificador_o <= "1000100";
		elsif entrada_i = "1100" then
			decodificador_o <= "1001000";
		elsif entrada_i = "1101" then
			decodificador_o <= "1001001";
		elsif entrada_i = "1110" then
			decodificador_o <= "1000001";
		elsif entrada_i = "1111" then
			decodificador_o <= "1000001";	
		end if;
		
	end process;
	
	
							 
end Behavioral;
