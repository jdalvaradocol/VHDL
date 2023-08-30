-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_vhdl_B is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end circuito_vhdl_B;

architecture Behavioral of circuito_vhdl_B is

-- A SW_i(3)
-- B SW_i(2)
-- C SW_i(1)
-- D SW_i(0)

-- X LEDS_o(1)
-- Y LEDS_o(0)

begin

	process(SW_i)
	
	begin
	
	if SW_i = "0000" then
		LEDS_o <= "11";
	elsif SW_i = "0001" then
		LEDS_o <= "10";	
	elsif SW_i = "0010" then
		LEDS_o <= "10";	
	elsif SW_i = "0011" then
		LEDS_o <= "00";	
	elsif SW_i = "0100" then
		LEDS_o <= "01";	
	elsif SW_i = "0101" then
		LEDS_o <= "01";	
	elsif SW_i = "0110" then
		LEDS_o <= "11";	
	elsif SW_i = "0111" then
		LEDS_o <= "01";	
	elsif SW_i = "1000" then
		LEDS_o <= "10";	
	elsif SW_i = "1001" then
		LEDS_o <= "00";	
	elsif SW_i = "1010" then
		LEDS_o <= "10";	
	elsif SW_i = "1011" then
		LEDS_o <= "00";	
	elsif SW_i = "1100" then
		LEDS_o <= "11";	
	elsif SW_i = "1101" then
		LEDS_o <= "01";	
	elsif SW_i = "1110" then
		LEDS_o <= "11";	
	elsif SW_i = "1111" then
		LEDS_o <= "01";	
	end if;	
	
	end process;
	
end Behavioral;