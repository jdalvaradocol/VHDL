-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFD is
	port 
	(
		D_i, clk_i  : in 	std_logic;
		Q_o			: out std_logic
	);
end FFD;

architecture Behavioral of FFD is

begin
	process(D_i, clk_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			Q_o <= D_i;
		
		end if;
	
	end process;	

end Behavioral;











