-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_VHDL_tb is
	-- port (	);
end MEF_VHDL_tb;

architecture Behavioral of MEF_VHDL_tb is

signal clk_tb : std_logic := '0';
signal   X_tb : std_logic := '0';
signal	E_tb : std_logic_vector(7 downto 0);

begin

	clk_tb <= not clk_tb after  1ns;
	X_tb   <= not X_tb   after 32ns;

	MEFFFD: entity work.MEF_VHDL port map
	(
			X_i 	=> X_tb, 
			clk_i	=> clk_tb, 
			E_o	=> E_tb		
	);

end Behavioral;


