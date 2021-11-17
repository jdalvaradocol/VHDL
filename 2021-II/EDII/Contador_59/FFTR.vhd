

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FFTR is
		Port (	T_i, clk_i, Rs_i 	: 	in 	std_logic;
					Q_o 					:	out	std_logic
				);
end FFTR;



architecture rtl	of FFTR is

signal Q : std_logic := '0'; 

begin

	process(T_i, clk_i, Rs_i) 
	
	begin
	
		if Rs_i = '1' then
			
			Q <= '0';
			
		elsif falling_edge (clk_i) and T_i = '1' then 
					
			Q <= not Q;
			
		elsif falling_edge (clk_i) and T_i = '0' then 
							
			Q <= Q;
			
		end if;	
	
	end process;
	
	Q_o <= Q;
	
end rtl;