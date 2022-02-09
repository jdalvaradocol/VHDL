
library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
	port 
	(
			entrada_i : in		std_logic_vector(3 downto 0);
			 salida_o : out	std_logic_vector(6 downto 0)
	);
end decodificador;

architecture modo_vhdl of decodificador is

-- Entradas
-- A            B            C 				D
-- entrada_i(3) entrada_i(2) entrada_i(1) entrada_i(0)

-- Salidas
-- a 				b 				c 				d 				
-- salida_o(6) salida_o(5) salida_o(4) salida_o(3)
-- e 				f 				g 
-- salida_o(2) salida_o(1) salida_o(0) 

begin

--		abcdefg 		
--	0	0000001
-- 1  1001111
-- 2	0010010
-- 3	0000110
-- 4	1001100
-- 5	0100100
-- 6  0100000
-- 7  0001111
-- 8  0000000
-- 9  0000100

	salida_o <= "0000001" when entrada_i = "0000" else
					"1001111" when entrada_i = "0001" else													
					"0010010" when entrada_i = "0010" else	
					"0000110" when entrada_i = "0011" else				
					"1001100" when entrada_i = "0100" else			
					"0100100" when entrada_i = "0101" else	
					"0100000" when entrada_i = "0110" else	
					"0001111" when entrada_i = "0111" else	
					"0000000" when entrada_i = "1000" else	
					"0000100" when entrada_i = "1001" else
					"1111111";	
	
end modo_vhdl;



