-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity Contador_tb is
	-- port (		);
end Contador_tb;

architecture Behavioral of Contador_tb is

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal unidad : std_logic_vector (3 downto 0);
signal decena : std_logic_vector (3 downto 0);

begin

		clk <= not clk after 1 ns;

	Contador_sim: entity work.contador	port map
	(
		clk_i 	=> clk,
		reset_o	=> reset,
		Contador_unidad_o	=> unidad,
		Contador_decena_o	=> decena

	);
	
end Behavioral;

