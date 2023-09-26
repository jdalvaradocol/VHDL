library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_hdl1 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end mux4x1_hdl1;

architecture Behavioral of mux4x1_hdl1 is


-- entrada_i -> entrada_i(3) entrada_i(2) entrada_i(1) entrada_i(0) 
--								  A	         B	          C            D	
begin

	x_o <= 	entrada_i(3) when S_i = "00" else
				entrada_i(2) when S_i = "01" else
				entrada_i(1) when S_i = "10" else
				entrada_i(0) when S_i = "11" else
				'0'	;		

end Behavioral;

