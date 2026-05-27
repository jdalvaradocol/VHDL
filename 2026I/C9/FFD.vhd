-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFD is
	port 
	(
		D_i, C_i : in  std_logic;
		Q_o		: out std_logic
	);
end FFD;


architecture Behavioral of FFD is

signal Q	: std_logic:= '0';

-- Flanco de subida.
-- rising_edge(C_i)
-- Flanco de bajada.
-- falling_edge(C_i)


begin

	process(D_i, C_i)
	
	begin
		
		if rising_edge(C_i) then
			
			Q <= D_i;
		
		else
		
			Q <= Q;
			
		end if;
			
			
	end process;

	Q_o <=  Q;
	
end Behavioral;