-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal  clk_tb : std_logic := '0';
signal    x_tb : std_logic := '0';
signal    A_tb : std_logic := '0';
signal    B_tb : std_logic := '0';
signal    Y_tb : std_logic := '0';
		
begin

	clk_tb <= not clk_tb after 1ns;
	  x_tb <= not   x_tb after 16ns;

	MEF_tb: entity work.principal port map
	(
	  clk_i => clk_tb, 
	    x_i => x_tb,  
		 A_o => A_tb, 
		 B_o => B_tb, 
		 Y_o => Y_tb
	);

end Behavioral;



