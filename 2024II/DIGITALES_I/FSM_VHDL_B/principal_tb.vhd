-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb 	: std_logic := '0';
signal x_tb 	: std_logic_vector(1 downto 0):= "00";
signal s_tb 	: std_logic_vector(1 downto 0):= "00";
signal T_tb 	: std_logic := '0';

begin

	clk_tb <= not clk_tb after 1ns;
	 x_tb <= x_tb + "01" after 32ns;
	
	fsm: entity work.principal port map
	(
		clk_i => clk_tb,
		x_i 	=> x_tb,
		s_o 	=> s_tb,
		T_o 	=> T_tb
	);

end Behavioral;









