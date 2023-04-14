-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity compuertas is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end compuertas;

architecture Behavioral of compuertas is

-- A SW_i(3)
-- B SW_i(2)
-- C SW_i(1)
-- D SW_i(0)

-- X LEDS_o(1)
-- Y LEDS_o(0)

begin

	-- y = CD' + AD' + A'B'C'	
	
	LEDS_o(1) <= 	(    (SW_i(1)) and not (SW_i(0))) or
						(    (SW_i(3)) and not (SW_i(0))) or
						(not (SW_i(3)) and not (SW_i(2)) and not (SW_i(1))) ;	
	
	-- y = B + A'C'D'

	LEDS_o(0) <= 	(                                        (SW_i(2))) or
						(not (SW_i(3)) and not (SW_i(1)) and not (SW_i(0))) ;	
	
	
	
		

end Behavioral;






