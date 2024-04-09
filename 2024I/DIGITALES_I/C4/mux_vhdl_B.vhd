-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_vhdl_B is
	port 
	(
		entrada_i : in  std_logic_vector(1 downto 0);
			   S_i : in  std_logic;
		   	X_o : out std_logic	
	);
end mux_vhdl_B;

architecture Behavioral of mux_vhdl_B is

----------------------------------
-- | entrada_i(1) | entrada_i(0) |
----------------------------------
--	|	   A			|		B        |
----------------------------------

begin

	X_o <= 	entrada_i(1) when S_i = '0' else
				entrada_i(0) when S_i = '1' else
				'0';
	
end Behavioral;
