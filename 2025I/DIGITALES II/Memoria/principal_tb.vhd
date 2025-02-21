-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal  clk_tb : std_logic := '0';
signal   WR_tb : std_logic := '0';
signal  add_tb : std_logic_vector(4 downto 0) := "00000";
signal data_tb : std_logic_vector(7 downto 0) := "00000000";
signal data_ram_tb : std_logic_vector(7 downto 0) := "00000000";
signal data_rom_tb : std_logic_vector(7 downto 0) := "00000000";		

begin

	clk_tb <= not clk_tb after  1ns;
	 WR_tb <= not  WR_tb after 64ns;

	add_tb <= std_logic_vector(unsigned(add_tb) + 1) after 2ns;

	data_tb <= std_logic_vector(unsigned(data_tb) + 1) after 2ns;
	
	ROM_tb: entity work.principal port map
	(
		clk_i 		=>      clk_tb,
		WR_i			=>       WR_tb,
		add_i 		=>      add_tb,
		data_i		=>     data_tb,
		data_ram_o 	=> data_ram_tb,
		data_rom_o	=> data_rom_tb
	);
	

end Behavioral;


