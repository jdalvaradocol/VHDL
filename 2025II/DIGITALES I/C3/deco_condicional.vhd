-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_condicional is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end deco_condicional;


architecture Behavioral of deco_condicional is

begin

	process(entrada_i)-- Lista de sensibilidad

	begin
	
		if entrada_i = x"0" then
			salida_i <= "0111111";
		elsif entrada_i = x"1" then 
			salida_i <= "0000110";
		elsif entrada_i = x"2" then 
			salida_i <= "1011011";
		elsif entrada_i = x"3" then 
			salida_i <= "1001111";	
		elsif entrada_i = x"4" then 
			salida_i <= "1100110";
		elsif entrada_i = x"5" then 
			salida_i <= "1101101";	
		elsif entrada_i = x"6" then 
			salida_i <= "1111101";
		elsif entrada_i = x"7" then 
			salida_i <= "0000111";
		elsif entrada_i = x"8" then 
			salida_i <= "1111111";
		elsif entrada_i = x"9" then 
			salida_i <= "1101111";	
		elsif entrada_i = x"A" then 
			salida_i <= "1110111";
		elsif entrada_i = x"B" then 
			salida_i <= "1111100";
		elsif entrada_i = x"C" then 
			salida_i <= "0111001";
		elsif entrada_i = x"D" then 
			salida_i <= "1011110";
		elsif entrada_i = x"E" then 
			salida_i <= "1111001";
		elsif entrada_i = x"F" then 
			salida_i <= "1110001";	
		else
			salida_i <= "0000000";
		end if ;

	end process;		
	
				
end Behavioral;