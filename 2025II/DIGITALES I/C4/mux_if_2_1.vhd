-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_if_2_1 is
	port 
	(
		A_i, B_i, S_i 	: in 	std_logic;
		X_o			: out	std_logic
	);
end mux_if_2_1;

architecture Behavioral of mux_if_2_1 is

begin

	process(A_i, B_i, S_i) -- lista de sensibilidad
	
	begin
	
		if S_i = '0' then
			
			X_o <= A_i;
			
		elsif	S_i = '1' then
			
			X_o <= B_i;
			
		else
			
			X_o <= '0';
	
		end if;
	
	end process;
	
end Behavioral;