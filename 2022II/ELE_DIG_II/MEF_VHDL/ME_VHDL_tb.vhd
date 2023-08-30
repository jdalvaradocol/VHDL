-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity ME_VHDL_tb is
	-- port (	);
end ME_VHDL_tb;

architecture Behavioral of ME_VHDL_tb is

signal clk_tb, x_tb, y_tb : std_logic := '0';
signal salida_o : std_logic_vector(1 downto 0) := "00";

begin

	clk_tb <= not clk_tb after  1ns;
	  x_tb <= not   x_tb after 20ns;
	
	FFT_tb: entity work.ME_VHDL port map
	(
		     clk_i =>   clk_tb, 
		       x_i =>     x_tb, 
		       y_o =>     y_tb, 
		  salida_o => salida_o
	);

end Behavioral;