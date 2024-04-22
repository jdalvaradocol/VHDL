-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity deco_logic is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end deco_logic;

architecture Behavioral of deco_logic is

begin

	salida_o(6) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(5) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(4) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(3) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(2) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(1) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);
	salida_o(0) <= entrada_i(3) or entrada_i(2) or entrada_i(1) or entrada_i(0);

end Behavioral;









