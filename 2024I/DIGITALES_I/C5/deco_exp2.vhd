-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_exp2 is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end deco_exp2;

architecture Behavioral of deco_exp2 is

begin

	process(entrada_i)
	
	begin
	
		if 	entrada_i = "0000" then
			salida_o <= "0111111";
		elsif entrada_i = "0001" then 
			salida_o <= "0000110";
		elsif entrada_i = "0010" then 
			salida_o <= "1011011";
		elsif entrada_i = "0011" then 
			salida_o <= "1001111";
		elsif entrada_i = "0100" then 
			salida_o <= "1100110";
		elsif entrada_i = "0101" then 
			salida_o <= "1101101";
		elsif entrada_i = "0110" then 
			salida_o <= "1111101";
		elsif entrada_i = "0111" then 
			salida_o <= "0000111";
		elsif entrada_i = "1000" then 
			salida_o <= "1111111";
		elsif entrada_i = "1001" then 
			salida_o <= "1110111";
		else 
			salida_o <= "0000000";		
		end if;
		
	end process;
			
end Behavioral;