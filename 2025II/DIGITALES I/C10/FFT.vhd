-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFT is
	port 
	(
		clk_i, T_i 	: in 	std_logic;
		Q_o			: out	std_logic
	);
end FFT;

architecture Behavioral of FFT is

signal Q : std_logic:='1';

begin
	
	process(clk_i, T_i)
	begin
		if rising_edge(clk_i) then
			if T_i = '0' then
				Q <= Q;						
			elsif T_i = '1' then
				Q <= not(Q);
			end if;
		end if;	
	end process;
			
Q_o <= Q;		
	
end Behavioral;



