-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFD_tb is
	-- port (	);
end MEF_FFD_tb;

architecture Behavioral of MEF_FFD_tb is

signal clk_tb, x_tb, y_tb : std_logic := '0';
signal salida_tb : std_logic_vector(1 downto 0) := "00";

begin

	clk_tb <= not clk_tb after 1ns;
	  x_tb <= not   x_tb after 20ns;
	
	MEF: entity work.MEF_FFD port map
	(
		clk_i		=>    clk_tb, 
		x_i		=>      x_tb, 	
	   y_o 		=>      y_tb,
		Salida_o => salida_tb 
	);

end Behavioral;

