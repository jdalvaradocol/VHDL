library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_hdl2 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end mux4x1_hdl2;

architecture Behavioral of mux4x1_hdl2 is

-- entrada_i -> entrada_i(3) entrada_i(2) entrada_i(1) entrada_i(0) 
--								  A	         B	          C            D	
begin

	process(entrada_i, S_i)
	
	begin
	
		if S_i = "00" then
			X_o <= entrada_i(3);
		elsif S_i = "01" then
			X_o <= entrada_i(2);
		elsif S_i = "10" then
			X_o <= entrada_i(1);
		elsif S_i = "11" then
			X_o <= entrada_i(0);
		else
			X_o <= '0';
		end if;
		
	end process;	

end Behavioral;