-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_tb is
	-- port (	);
end ROM_tb;

architecture Behavioral of ROM_tb is

signal  clk_tb : std_logic := '0';
signal  add_tb : std_logic_vector(4 downto 0) := "00000";
signal data_tb : std_logic_vector(7 downto 0) := "00000000";
		
begin

	clk_tb <= not clk_tb after 1ns;
	add_tb <= std_logic_vector(unsigned(add_tb) + 1) after 2ns;
	
	R_tb: entity work.ROM port map
	(
		 clk_i => clk_tb,
		 add_i => add_tb,
		data_o => data_tb
	);

end Behavioral;







