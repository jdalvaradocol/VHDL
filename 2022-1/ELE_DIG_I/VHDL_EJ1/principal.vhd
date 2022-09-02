-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(

		-- A = 2^3 B = 2^2 C = 2^1 D = 2^0
		-- 0       1       0       1         = 5

		entrada_i : in std_logic_vector (3 downto 0);
		
		-- D = 2^0 C = 2^1 B = 2^2 A = 2^3
		-- 1       0       1       0  		= 5
		
		-- entrada : in std_logic_vector (3 to 0);
		
		salida_o : out std_logic_vector (6 downto 0)

);
end principal;


architecture rtl of principal is

	
begin
	
	-- salida(0) <= entrada_i(3) and entrada_i(2) and entrada_i(1) and entrada_i(0);
	
	salida_o <= "100 0000" when entrada_i = "0000" else -- 0 
				   "111 1001" when entrada_i = "0001" else -- 1	
				   "010 0100" when entrada_i = "0010" else -- 2
				   "011 0000" when entrada_i = "0011" else -- 3	 
				   "001 1001" when entrada_i = "0100" else -- 4	
				   "001 0010" when entrada_i = "0101" else -- 5	
				   "000 0010" when entrada_i = "0110" else -- 6	
				   "111 1000" when entrada_i = "0111" else -- 7	
				   "000 0000" when entrada_i = "1000" else -- 8	
				   "001 0000" when entrada_i = "1001" else -- 9	
				   "111 1111";								     -- Para todos los demas casos (others);	 
			
end rtl;
