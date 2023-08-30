-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity contador_tb is
	--port (	);
end contador_tb;

-- Three possible architectures
architecture rtl of contador_tb is

signal clk	: std_logic := '0';
signal salidaA : std_logic_vector(3 downto 0) := "0000";
signal salidaB : std_logic_vector(3 downto 0) := "0000";

begin

	clk <= not clk after 1 ns;

	contador_sim : entity work.contador port map
		(
			clk_i 	 => clk,
			contadorA_o => salidaA,
			contadorB_o => salidaB	
		);
		
end rtl;
