-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFD is
	port 
	(
		D_i, clk_i 	:in 	std_logic;
		Q_o			:out 	std_logic		
	);
end FFD;

architecture Behavioral of FFD is

signal Q : std_logic:= '0';	

begin

	FF_D: process(clk_i, D_i)
	begin	
		if rising_edge(clk_i) then
			Q <= D_i;
		end if;
	end process FF_D;

Q_o <= Q;
	
end Behavioral;




