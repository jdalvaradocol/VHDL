-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity CLC is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(3 downto 0)
	);
end CLC;

architecture Behavioral of CLC is

begin

	salida_o(3) <= entrada_i(3) and entrada_i(2);
	salida_o(2) <= entrada_i(2) and entrada_i(1);
	salida_o(1) <= entrada_i(1) and entrada_i(0);
	salida_o(0) <= entrada_i(3) and entrada_i(0);
		
end Behavioral;






