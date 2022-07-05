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

		display:process(entrada_i)
		
		begin
		
			if entrada_i = "0000" then  			-- 0
			
				salida_o <= "1000000";
				
			elsif entrada_i = "0001" then 	-- 1
			
				salida_o <= "1111001";
				
			elsif entrada_i = "0010" then		-- 2
			
				salida_o <= "0100100";	
			
			elsif entrada_i = "0011" then 	-- 3
			
				salida_o <= "0110000";	
				
			elsif entrada_i = "0100" then		-- 4
			
				salida_o <= "0011001";	
			
			elsif entrada_i = "0101" then		-- 5
			
				salida_o <= "0010010";	
			
			elsif entrada_i = "0110" then		--	6
			
				salida_o <= "0000010";	
				
			elsif entrada_i = "0111" then		--	7
			
				salida_o <= "1111000";	
				
			elsif entrada_i = "1000" then		-- 8
			
				salida_o <= "0000000";	
				
			elsif entrada_i = "1001" then
			
				salida_o <= "0010000";	
				
			else 
			
				salida_o <= "1111111";		
			
			end if;
		
		end process display;
	
end rtl;
