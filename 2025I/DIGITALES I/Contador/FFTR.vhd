-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFTR is
	port 
	(
		clk_i, T_i, R_i 	:  in std_logic;
		Q_o					: out std_logic 
	);
end FFTR;


architecture Behavioral of FFTR is

-- Flanco de subida  rising_edge(clk_i)
-- Flanco de bajada falling_edge(clk_i)

signal Q : std_logic:= '0';

begin

	process(clk_i, T_i, R_i)
	
	begin
	
		if R_i = '1' then
			Q <='0';
		else
		
			if falling_edge(clk_i) then
				if T_i = '0' then
					Q <= Q;
				elsif T_i = '1' then
					Q <= not Q;
				end if;
			end if;
	
		end if;
	end process;
	
Q_o <= Q;	
	
end Behavioral;



