-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
	generic
	(
		DIV_TICKS : integer := 50e6
	);
	port 
	(
		clk_i :  in std_logic;
		clk_o : out std_logic
	);
end clk_div;

architecture Behavioral of clk_div is

signal tiempo : integer range 0 to DIV_TICKS := 0; 

signal clk : std_logic:= '0'; 

begin

	process(clk_i)
	begin
		
		if rising_edge(clk_i) then
				
			if tiempo = (DIV_TICKS - 1) then
				clk <= not clk;
			end if;
				
			tiempo <= tiempo + 1;
		
		end if;
		

	end process;

	clk_o <= clk;
	
end Behavioral;