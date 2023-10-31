-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb : std_logic := '0';
signal     QU : std_logic_vector(3 downto 0):= "0000";
signal     QD : std_logic_vector(3 downto 0):= "0000";

begin

	clk_tb <= not clk_tb after 1ns;
	
	FF: entity work.principal port map
	(
		clk_i =>  clk_tb,
		QU_o  =>     QU, 
		QD_o	=>     QD
	);
		
end Behavioral;







