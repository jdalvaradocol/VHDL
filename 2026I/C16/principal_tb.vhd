-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal    clk_tb : std_logic := '0';
signal enable_tb : std_logic := '0';
signal     WR_tb : std_logic := '0';

signal      add_tb : std_logic_vector( 3 downto 0) :=  "0000";
signal     data_tb : std_logic_vector(15 downto 0) := x"0000";
signal data_rom_tb : std_logic_vector(15 downto 0) := x"0000";
signal data_ram_tb : std_logic_vector(15 downto 0) := x"0000";
		
begin

	   clk_tb <= not    clk_tb after 1ns;
	enable_tb <= not enable_tb after 10ns;
	    WR_tb <= not     WR_tb after 64ns;

	   add_tb <= std_logic_vector(unsigned(add_tb) + unsigned'("0001")) after 2ns;
	  data_tb <= std_logic_vector(unsigned(data_tb) + unsigned'(x"0001")) after 4ns;

		
	MEM_tb: entity work.principal port map
	(
		       clk_i =>      clk_tb,   
		    enable_i =>   enable_tb,
			     WR_i =>       WR_tb,
		       add_i =>      add_tb,
				data_i =>     data_tb,
		  data_rom_o => data_rom_tb,
		  data_ram_o => data_ram_tb
	);

end Behavioral;





