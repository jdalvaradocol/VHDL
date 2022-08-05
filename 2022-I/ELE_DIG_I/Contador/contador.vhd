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

signal reset : std_logic := '0';
signal clk_reset : std_logic := '0';
signal   clk_div : std_logic := '0';

signal unidad : std_logic_vector(3 downto 0);
signal decena : std_logic_vector(3 downto 0);


begin

	clock_div : entity work.clk_div generic map
	(
		DIV_TICKS => 5e6
	)	
	port map
	(
		 clk_i 	=> clk_i,
		 clk_o	=> clk_div
	);


	CONT9: entity work.contador_mod9	port map
	(
		     clk_i 	=> clk_div,
		   reset_i	=> reset,
			reset_o	=> clk_reset,
		Contador_o	=> unidad
	);
	
	CONT5: entity work.contador_mod5	port map
	(
		     clk_i 	=> clk_reset,
		   reset_i	=> reset,
		Contador_o	=> decena
	);
	
	Contador_unidad_o <= unidad; -- 6 0111
	Contador_decena_o <= decena; -- 4 0100
	reset_o <= clk_reset; 
	reset <= not unidad(3) and unidad(2) and unidad(1) and unidad(0) and
				not decena(3) and decena(2) and not decena(1) and not decena(0);
	
end Behavioral;

