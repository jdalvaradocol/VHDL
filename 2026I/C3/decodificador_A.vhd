-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity decodificador_A is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end decodificador_A;

architecture Behavioral of decodificador_A is

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

	-- g = ABCD
	decodificador_o(6) <= entrada_i(3) and entrada_i(2) and
								 entrada_i(1) and entrada_i(0);	
	-- f = AB
	decodificador_o(5) <= entrada_i(3) and entrada_i(2);	
	-- e = CD
	decodificador_o(4) <= entrada_i(1) and entrada_i(0);		
	-- d = ABCD
	decodificador_o(3) <= entrada_i(3) and entrada_i(2) and
								 entrada_i(1) and entrada_i(0);		
	-- c = ABCD
	decodificador_o(2) <= entrada_i(3) and entrada_i(2) and
								 entrada_i(1) and entrada_i(0);		
	-- b = ABCD
	decodificador_o(1) <= entrada_i(3) and entrada_i(2) and
								 entrada_i(1) and entrada_i(0);		
	-- a = ABCD
	decodificador_o(0) <= entrada_i(3) and entrada_i(2) and
								 entrada_i(1) and entrada_i(0);	
								 
end Behavioral;






