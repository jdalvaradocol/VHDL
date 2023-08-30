-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_B is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end mux4x1_B;

architecture Behavioral of mux4x1_B is

begin
	
	x_o <= 	A_i when S_i = "00"	else
				B_i when S_i = "01"	else
				C_i when S_i = "10"	else
				D_i when S_i = "11"  else '0'; 

end Behavioral;







