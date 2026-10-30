-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL; 
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal  clk_tb : std_logic := '0';
signal    X_tb : std_logic_vector(1 downto 0) := "00";
signal    A_tb : std_logic := '0';
signal    B_tb : std_logic := '0';
		
begin

	clk_tb <= not clk_tb after 1ns;
	X_tb <= X_tb + '1' after 32ns;
	
	principal_tb: entity work.principal port map
	(
		clk_i => clk_tb,		
		X_i	=>	  X_tb,
		A_o   =>   A_tb, 
		B_o   =>	  B_tb
	);

end Behavioral;






