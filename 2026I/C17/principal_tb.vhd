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

signal data_rom_tb : std_logic_vector(7 downto 0) := x"00";
signal data_ram_tb : std_logic_vector(7 downto 0) := x"00";
signal add_tb : std_logic_vector(3 downto 0) := x"0";
		
begin

	   clk_tb <= not    clk_tb after 1ns;
	enable_tb <= '1';
		
	MEM_tb: entity work.principal port map
	(
		       clk_i =>      clk_tb,   
		    enable_i =>   enable_tb,
			    add_o =>   	add_tb,
		  data_rom_o => data_rom_tb, 
		  data_ram_o => data_ram_tb
	);

end Behavioral;





