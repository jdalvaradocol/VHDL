-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal A_tb, B_tb : std_logic_vector(2 downto 0)  := "000";
signal S_tb 		: std_logic_vector(2 downto 0) :=  "000";

begin

	-- A_tb <= not clk_tb after 1ns;
	
--	A_tb <= 	"000" after 0ns,
--				"001" after 1ns,
--				"010" after 2ns,
--				"011" after 3ns,
--				"100" after 4ns,
--				"101" after 5ns,
--				"110" after 6ns,
--				"111" after 7ns;
				
--	b_tb <=  "000" after 8ns,
--				"001" after 16ns,
--				"010" after 24ns,
--				"011" after 32ns,
--				"100" after 40ns,
--				"101" after 48ns,
--				"110" after 56ns,
--				"111" after 64ns;
	
	A_tb <= A_tb + "001" after 1ns;  
	B_tb <= B_tb + "001" after 8ns;
	
	sumador: entity work.principal port map
	(
		A_i => A_tb,  
		B_i => B_tb,			
		S_o => S_tb
	);

end Behavioral;









