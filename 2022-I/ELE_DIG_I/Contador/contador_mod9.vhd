-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador_mod9 is
	port 
	(
		clk_i, reset_i : in std_logic;
		       reset_o : out std_logic;
		Contador_o     : out std_logic_vector (3 downto 0)
	);
end contador_mod9;

architecture Behavioral of contador_mod9 is

signal Contador : std_logic_vector (3 downto 0);
signal reset : std_logic := '0';

begin
	
	BIT0: entity work.FFTR	port map
	(
		clk_i 	=> clk_i,
		reset_i	=> reset,
		T_i 		=> '1',
		Q_o		=> Contador(0)	
	);

	BIT1: entity work.FFTR	port map
	(
		clk_i 	=> Contador(0),
		reset_i	=> reset,
		T_i 		=> '1',
		Q_o		=> Contador(1)	
	);
	
		BIT2: entity work.FFTR	port map
	(
		clk_i 	=> Contador(1),
		reset_i	=> reset,
		T_i 		=> '1',
		Q_o		=> Contador(2)	
	);

	BIT3: entity work.FFTR	port map
	(
		clk_i 	=> Contador(2),
		reset_i	=> reset,
		T_i 		=> '1',
		Q_o		=> Contador(3)	
	);
	--	1010
	reset <=  ( Contador(3) and not Contador(2) and 
			      Contador(1) and not Contador(0)) or reset_i; 
	
	reset_o <= not reset;

	Contador_o <= Contador;
	
end Behavioral;

