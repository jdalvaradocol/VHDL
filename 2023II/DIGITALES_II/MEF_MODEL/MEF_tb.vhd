-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF_tb is
	-- port (	);
end MEF_tb;

architecture Behavioral of MEF_tb is

signal clk_tb : std_logic := '0';
signal   X_tb : std_logic_vector(1 downto 0):="00"; 
signal MEF_tb : std_logic_vector(1 downto 0):="00";
signal   Y_tb : std_logic_vector(3 downto 0):="0000";

begin

	clk_tb <= not clk_tb after 1ns;
	  X_tb <= std_logic_vector(unsigned(X_tb) + 1) after 32ns;
	
	MEF_M: entity work.MEF port map
	(
		clk_i => clk_tb,
		  X_i =>   X_tb,
		MEF_o => MEF_tb,
		  Y_o =>   Y_tb
	);

end Behavioral;






