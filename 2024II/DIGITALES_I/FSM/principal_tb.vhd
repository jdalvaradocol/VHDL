-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb : std_logic := '0';
signal   x_tb : std_logic_vector(1 downto 0) := "00";
signal   s_tb : std_logic_vector(1 downto 0) := "00";
signal   y_tb : std_logic := '0';


begin

	clk_tb <= not clk_tb after 1ns;
	x_tb   <= x_tb + "01" after 64ns;

	TB: entity work.principal port map
	(
		clk_i  	=> clk_tb,
		x_i  		=> x_tb,
		A_o		=> s_tb(1),
		B_o		=> s_tb(0),
		Y_o		=> y_tb
	);

end Behavioral;









