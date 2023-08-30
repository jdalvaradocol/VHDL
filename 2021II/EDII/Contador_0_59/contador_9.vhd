
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_9 is
		Port (	clk_i 	: in 	std_logic;
					salida_o	: out std_logic_vector(3 downto 0);
					Reset_o  : out	std_logic
				);
end contador_9;


architecture rtl	of contador_9 is

component FFTR is
		Port (	T_i, clk_i, Rs_i 	: 	in 	std_logic;
					Q_o 					:	out	std_logic
				);
end component;

signal reset 	: std_logic := '0';
signal datos 	: std_logic_vector(3 downto 0) := "0000";

begin

bit0: FFTR port map
				(
					T_i   => '1'     	, 
					clk_i => clk_i    , 
					Rs_i  => reset   	,  
					Q_o   => datos(0)
				);

				
bit1: FFTR port map
				(
					T_i   => '1'      , 
					clk_i => datos(0) , 
					Rs_i  => reset    ,
					Q_o   => datos(1)
				);				

bit2: FFTR port map
				(
					T_i   => '1'      , 
					clk_i => datos(1) ,	 
					Rs_i  => reset   	,
					Q_o   => datos(2)
				);						
	
bit3: FFTR port map
				(
					T_i   => '1'      , 
					clk_i => datos(2) ,	 
					Rs_i  => reset    ,
					Q_o   => datos(3)
				);		

-- El reset se reliza en 10 (1010) para reiniciar el conteo en 9.				

reset <= (datos(3)) and (not (datos(2))) and (datos(1)) and (not (datos(0)));
	
Reset_o <= reset;
salida_o <= datos;
				
end rtl;