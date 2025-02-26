-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i	: in std_logic;
		PWM_o	:	out std_logic
	);
end principal;


architecture Behavioral of principal is

signal TN : integer range 0 to 5e6 := 0;
signal TF : integer range 0 to 5e6 := 0;

begin

	process(clk_i)
	
	begin

		if rising_edge(clk_i) then	

				if TN < 4000e3 then 
				
					TN <= TN + 1;
					PWM_o <= '1';
				
				elsif	TF < 1000e3 then
					
					TF <= TF + 1;
					PWM_o <= '0';
				
				else
					
					TN <= 0;
					TF <= 0;	
					
				end if;
				
			end if;

	end process;			
				
end Behavioral;

