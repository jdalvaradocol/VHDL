-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RTL_tb is
	-- port (	);
end RTL_tb;

architecture Behavioral of RTL_tb is

signal  clk_tb : std_logic := '0';
signal  data_ROM_A_tb : std_logic_vector(7 downto 0) := "00000000";
signal  data_ROM_B_tb : std_logic_vector(7 downto 0) := "00000000";
signal  resultado_tb : std_logic_vector(7 downto 0) := "00000000";
signal  res_tb : std_logic_vector(7 downto 0) := "00000000";
		
begin

	clk_tb <= not clk_tb after 1ns;
	
	R_tb: entity work.RTL_REG port map
	(
		clk_i 			=> clk_tb,
		data_ROM_A_o 	=> data_ROM_A_tb,
		data_ROM_B_o 	=> data_ROM_B_tb,
		resultado_o 	=> resultado_tb,
		res_o 			=> res_tb	
	);

end Behavioral;







