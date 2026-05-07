-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity LD is
	port 
	(
		D_i, C_i : in  std_logic;
		Q_o		: out std_logic
	);
end LD;

architecture Behavioral of LD is

signal Q	: std_logic:= '0';

begin

	process(D_i, C_i)
	
	begin
		
		if C_i = '0' then
			
			Q <= Q;
			
		elsif C_i = '1' then 
		
			Q <= D_i;
			
		end if;
			
	end process;

	Q_o <=  Q;

end Behavioral;






