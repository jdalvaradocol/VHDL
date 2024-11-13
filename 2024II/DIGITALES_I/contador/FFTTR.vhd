-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFTTR is
	port 
	(
		T_i, R_i, clk_i 	:  in std_logic;
		Q_o					: out	std_logic
	);
end FFTTR;

architecture Behavioral of FFTTR is

signal Q : std_logic:='0';

begin

	process(T_i, R_i, clk_i)
	
	begin
	
		if R_i = '1' then
			Q <= '0';
		elsif falling_edge(clk_i) then
			if T_i = '1' then
				Q <= not(Q);
			else
				Q <= Q;
			end if;
		end if;	
				
	end process;

	Q_o <= Q;
	
end Behavioral;











