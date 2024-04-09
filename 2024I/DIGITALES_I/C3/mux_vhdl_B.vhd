-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_vhdl_B is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		      S_i : in std_logic_vector(1 downto 0);
		      X_o : out std_logic	
	);
end mux_vhdl_B;

architecture Behavioral of mux_vhdl_B is

begin

	process(entrada_i, S_i)
	begin
	
		if 	S_i = "00" then   -- Sel A
			X_o <= entrada_i(3);
		elsif S_i = "01" then 	-- Sel B
			X_o <= entrada_i(2);
		elsif S_i = "10" then 	-- Sel C
			X_o <= entrada_i(1);		
		elsif S_i = "11" then 	-- Sel D
			X_o <= entrada_i(0);
		end if;
	
	end process;

end Behavioral;