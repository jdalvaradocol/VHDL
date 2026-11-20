-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFT is
	port 
	(
		clk_i, T_i 	: in	std_logic;
			    Q_o  : out std_logic
	);
end FFT;

architecture Behavioral of FFT is

--  rising_edge(clk_i) 	Flanco de subida. 
-- falling_edge(clk_i)	Flanco de bajada.

signal Q :	std_logic:='0';
 
begin

 	process(T_i, clk_i)
	
	begin
				
		if falling_edge(clk_i) then
		
			if T_i = '1' then
				Q <= not(Q);
			elsif T_i = '0' then
				Q <= Q;				
			end if;
		
		end if;
	end process;

	Q_o <= Q;	
	
end Behavioral;

