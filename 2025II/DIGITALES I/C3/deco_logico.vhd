-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_logico is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end deco_logico;


architecture Behavioral of deco_logico is

begin

	-- entrada_i(3) -> A
	-- entrada_i(2) -> B
	-- entrada_i(1) -> C
	-- entrada_i(0) -> D	

	-- segmento a
	salida_i(0) <=   entrada_i(3) or entrada_i(1) or 
						(entrada_i(2) and entrada_i(0) ) or
						(not(entrada_i(2)) and not(entrada_i(0)));
						
	-- segmento b
	salida_i(1) <=   entrada_i(3) or entrada_i(1);	

	-- segmento c
	salida_i(2) <=   entrada_i(3) or entrada_i(1);	

	-- segmento d
	salida_i(3) <=   entrada_i(3) or entrada_i(1);	

	-- segmento e
	salida_i(4) <=   entrada_i(3) or entrada_i(1);	

	-- segmento f
	salida_i(5) <=   entrada_i(3) or entrada_i(1);	

	-- segmento g
	salida_i(6) <=   entrada_i(3) or entrada_i(1);	
	
end Behavioral;




