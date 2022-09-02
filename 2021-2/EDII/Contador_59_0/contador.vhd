
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity contador is
		Port (	clk_i 		: in 	std_logic;
					Reset_o  	: out	std_logic;
					salidaA_o	: out std_logic_vector(3 downto 0);
					salidaB_o	: out std_logic_vector(3 downto 0)
				);
end contador;


architecture rtl	of contador is

component contador_9 is
		Port (	clk_i 	: in 	std_logic;
					salida_o	: out std_logic_vector(3 downto 0);
					Reset_o  : out	std_logic
				);
end component;

component contador_5 is
		Port (	clk_i 	: in 	std_logic;
					salida_o	: out std_logic_vector(3 downto 0);
					Reset_o  : out	std_logic
				);
end component;

signal reset 	: std_logic := '1';

signal datos 	: std_logic_vector(3 downto 0) := "1111";

begin

contador9: contador_9 port map
				(
					clk_i 	=> clk_i , 
					salida_o	=> datos,
					Reset_o  => reset
				);

contador5: contador_5 port map
				(
					clk_i 	=> reset 	, 
					salida_o	=> salidaB_o,
					Reset_o  => Reset_o
				);
				
salidaA_o <= datos;
				
end rtl;