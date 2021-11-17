library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_tb is
		--Port ();
end contador_tb;

architecture rtl of contador_tb is

signal clk 		: std_logic := '0';
signal reset 	: std_logic := '0';

signal salidaA : std_logic_vector(3 downto 0) := "0000";
signal salidaB : std_logic_vector(3 downto 0) := "0000";

begin

clk <= not clk after 1 ns;
	
contador_sim : entity work.contador port map
		(
			clk_i 	 => clk,
			Reset_o   => reset,
			salidaA_o => salidaA,
			salidaB_o => salidaB	
		);

end rtl;