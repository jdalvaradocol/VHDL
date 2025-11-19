-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_tb is
	-- port (	);
end RAM_tb;

architecture Behavioral of RAM_tb is

signal  clk_tb : std_logic := '0';
signal  WR_tb : std_logic := '0';
signal  add_tb : std_logic_vector(3 downto 0) := "0000";
signal data_i_tb : std_logic_vector(7 downto 0) := "00000000";
signal data_o_tb : std_logic_vector(7 downto 0) := "00000000";
		
begin

	clk_tb <= not clk_tb after 1ns;
	 WR_tb <= not WR_tb after 64ns;	
	add_tb <= std_logic_vector(unsigned(add_tb) + 1) after 2ns;
	data_i_tb <= std_logic_vector(unsigned(data_i_tb) + 1) after 2ns;
	
	R_tb: entity work.MEM_RAM port map
	(
		  clk_i =>     clk_tb,
		   WR_i =>      WR_tb,
 		  add_i =>     add_tb,
		 data_i =>  data_i_tb,
		 data_o =>  data_o_tb
	);
	
end Behavioral;
