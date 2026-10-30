-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_C is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end mux4x1_C;


architecture Behavioral of mux4x1_C is

begin

-- if

	process(EN_i, S_i)
	
	begin
	
		if S_i = "00" then
			x_o <=  EN_i(3);
		elsif	S_i = "01" then
			x_o <=  EN_i(2);
		elsif	S_i = "10" then
			x_o <=  EN_i(1);
		elsif	S_i = "11" then
			x_o <=  EN_i(0);
		else
			x_o <= '0';
		end if;
	
	end process;
	
end Behavioral;