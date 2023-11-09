-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb : std_logic := '0';
signal   X_tb : std_logic := '0';
signal   Q_tb : std_logic_vector(1 downto 0) := "00";

begin

	X_tb <= not X_tb after 10ns;
	clk_tb <= not clk_tb after 1ns;
	
	FF_tb: entity work.principal port map
	(
		clk_i	=> clk_tb, 
		X_i 	=>	  X_tb, 
		Q_o	=>	  Q_tb	
	);

end Behavioral;





