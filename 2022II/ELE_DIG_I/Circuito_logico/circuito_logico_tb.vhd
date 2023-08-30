-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_logico_tb is
	-- port (	);
end circuito_logico_tb;

architecture Behavioral of circuito_logico_tb is

signal A_tb : std_logic := '0';
signal B_tb : std_logic := '0';
signal C_tb : std_logic := '0';
signal x_tb : std_logic := '0';

begin

	A_tb <= not A_tb after 4ns;
	B_tb <= not B_tb after 2ns;
	C_tb <= not C_tb after 1ns;
	
	clc: entity work.circuito_logico port map
	(
		A_i => A_tb,
		B_i => B_tb,
		C_i => C_tb,
		x_o => x_tb
	);

end Behavioral;

