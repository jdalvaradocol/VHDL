-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_vhdl_A is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end circuito_vhdl_A;

architecture Behavioral of circuito_vhdl_A is

-- A SW_i(3)
-- B SW_i(2)
-- C SW_i(1)
-- D SW_i(0)

-- X LEDS_o(1)
-- Y LEDS_o(0)

begin

	LEDS_o <= 	"11" when SW_i = "0000" else
					"10" when SW_i = "0001" else
					"10" when SW_i = "0010" else
					"00" when SW_i = "0011" else
					"01" when SW_i = "0100" else
					"01" when SW_i = "0101" else
					"11" when SW_i = "0110" else
					"01" when SW_i = "0111" else
					"10" when SW_i = "1000" else
					"00" when SW_i = "1001" else
					"10" when SW_i = "1010" else
					"00" when SW_i = "1011" else
					"11" when SW_i = "1100" else
					"01" when SW_i = "1101" else
					"11" when SW_i = "1110" else
					"01" when SW_i = "1111" ;
		
end Behavioral;
