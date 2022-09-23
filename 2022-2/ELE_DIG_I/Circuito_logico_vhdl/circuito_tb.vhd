-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_tb is
	-- port (	);
end circuito_tb;

architecture Behavioral of circuito_tb is

-- Señales de entrada

signal A_tb : std_logic := '0';
signal B_tb : std_logic := '0';
signal C_tb : std_logic := '0';
signal D_tb : std_logic := '0';

-- Señal de salida

signal x_tb : std_logic := '0';


begin

	A_tb <= not A_tb after 8ns;
	B_tb <= not B_tb after 4ns;
	C_tb <= not C_tb after 2ns;
	D_tb <= not D_tb after 1ns;
	
	CL: entity work.circuito port map
	(
		A_i => A_tb,
		B_i => B_tb,
		C_i => C_tb,
		D_i => D_tb,
		x_o => x_tb
	);

end Behavioral;


