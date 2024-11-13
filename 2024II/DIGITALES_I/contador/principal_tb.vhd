-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb : std_logic := '0';
signal XA_tb  : std_logic_vector(3 downto 0):="0000";
signal XB_tb  : std_logic_vector(3 downto 0):="0000";
signal XC_tb  : std_logic_vector(3 downto 0):="0000";

begin

	clk_tb <= not clk_tb after 1ns;
	
	contador_tb: entity work.principal port map
	(
		clk_i => clk_tb,
		XA_o  =>  XA_tb,
		XB_o  =>  XB_tb,
		XC_o  =>  XC_tb
	);

end Behavioral;









