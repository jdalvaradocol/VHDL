-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div is

	port
	(
		clk_i		 	: in	std_logic;
		clk_div_o	: out	std_logic
	);

end entity;

architecture rtl of clk_div is


signal clk_div : std_logic := '0';
signal div_fre : integer range 0 to 10000000 := 0;


begin

	div : process (clk_i)
	
	begin
	
		if (rising_edge(clk_i)) then
				
				div_fre <= div_fre + 1;
				
				if div_fre = 10000000 then
				
					clk_div <= not clk_div;

				end if;
						
		end if;

	end process div;
	
	clk_div_o <= clk_div;
	
end rtl;