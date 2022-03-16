-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port 
	(
		clk_i 						: in  std_logic;
		ContadorA_o, ContadorB_o : out std_logic_vector(3 downto 0)
	);
end Contador;

-- Three possible architectures
architecture rtl of contador is

component Contador_9 is
	port 
	(
		clk_i 		: in  std_logic;
		R_o 			: out  std_logic;
		Contador_o  : out std_logic_vector(3 downto 0)
	);
end component;

component Contador_5 is
	port 
	(
		clk_i 		: in  std_logic;
		R_o 			: out  std_logic;
		Contador_o  : out std_logic_vector(3 downto 0)
	);
end component;

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

signal R	 : std_logic := '0';
signal Rx : std_logic := '0';

signal clk_div : std_logic := '0';


begin

	clk_div_modulo: clk port map
							(
								clk_i 		=> clk_i,
								clk_div_o  	=> clk_div			
							);	

	 contadorA:  Contador_9 port map 
							(
								clk_i 		=> 		clk_div,
								R_o 			=> 			 R,
								Contador_o  =>  ContadorA_o
							);

	 contadorB:  Contador_5 port map 
							(
								clk_i 		=> 			R,
								R_o 			=> 			Rx,
								Contador_o  =>  ContadorB_o
							);
									
end rtl;


