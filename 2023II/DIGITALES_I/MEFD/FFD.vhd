-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFD is
	port 
	(
		clk_i, D_i :  in std_logic;
		       Q_o : out std_logic	
	);
end FFD;

architecture Behavioral of FFD is

Signal Q : std_logic := '0';

begin

	process(clk_i, D_i)
	
	begin

	if rising_edge(clk_i) then
		
		Q <= D_i;

	end if;

	end process;	

Q_o <= Q; 	
	
end Behavioral;









