-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_vhdl_A is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		      S_i : in std_logic_vector(1 downto 0);
		      X_o : out std_logic	
	);
end mux_vhdl_A;

architecture Behavioral of mux_vhdl_A is

begin

X_o <= 	entrada_i(3) when S_i = "00" else
			entrada_i(2) when S_i = "01" else
			entrada_i(1) when S_i = "10" else
			entrada_i(0) when S_i = "11" else '0';
 
end Behavioral;