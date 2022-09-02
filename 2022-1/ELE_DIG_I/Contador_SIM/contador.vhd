-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity Contador is
	port 
	(
						clk_i : in	std_logic;
					 reset_o : out	std_logic;
		Contador_unidad_o : out	std_logic_vector(3 downto 0);
		Contador_decena_o : out	std_logic_vector(3 downto 0)
		);
end Contador;

architecture Behavioral of Contador is

signal clk_reset : std_logic := '0';

begin

	CONT9: entity work.contador_mod9	port map
	(
		     clk_i 	=> clk_i,
		   reset_i	=> '0',
			reset_o	=> clk_reset,
		Contador_o	=> Contador_unidad_o
	);
	
	CONT5: entity work.contador_mod5	port map
	(
		     clk_i 	=> clk_reset,
		   reset_i	=> '0',
		Contador_o	=> Contador_decena_o
	);
	
	reset_o <= clk_reset;
	
end Behavioral;

