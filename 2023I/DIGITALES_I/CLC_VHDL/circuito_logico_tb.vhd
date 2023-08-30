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
signal D_tb : std_logic := '0';

signal x_tb : std_logic := '0';
signal y_tb : std_logic := '0';
signal w_tb : std_logic := '0';
signal z_tb : std_logic := '0';


begin

	A_tb <= not A_tb after 8ns;
	B_tb <= not B_tb after 4ns;
	C_tb <= not C_tb after 2ns;
	D_tb <= not D_tb after 1ns;
	
	clc_tb: entity work.circuito_logico port map
	(
			A_i => A_tb,
			B_i => B_tb,
			C_i => C_tb,
			D_i => D_tb,
			x_o => x_tb,
			w_o => w_tb,
			y_o => y_tb,
			z_o => z_tb
	);

end Behavioral;




