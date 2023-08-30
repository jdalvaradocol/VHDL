-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity Contador_9 is
	port 
	(
		clk_i 		: in  std_logic;
		R_o 			: out  std_logic;
		Contador_o  : out std_logic_vector(3 downto 0)
	);
end Contador_9;


-- Three possible architectures
architecture rtl of Contador_9 is

component FFTR is
	port 
	(
		clk_i, T_i, R_i 	: in  std_logic;
		Q_o 					: out std_logic
	);
end component;

signal Reset 		: std_logic := '0';
signal Contador  	: std_logic_vector(3 downto 0);

begin

		Bit0: FFTR port map
				(
					clk_i	=> 	   clk_i, 
					T_i	=> 	     '1', 
					R_i	=>		   Reset, 	
					Q_o 	=>	Contador(0)
				);

		Bit1: FFTR port map
				(
					clk_i	=> Contador(0), 
					T_i	=> 	     '1', 
					R_i	=>	   	Reset, 	
					Q_o 	=>	Contador(1)
				);
		
		Bit2: FFTR port map
				(
					clk_i	=> Contador(1), 
					T_i	=> 	     '1', 
					R_i	=>	   	Reset, 	
					Q_o 	=>	Contador(2)
				);
		
		Bit3: FFTR port map
				(
					clk_i	=> Contador(2), 
					T_i	=> 	     '1', 
					R_i	=>	   	Reset, 	
					Q_o 	=>	Contador(3)
				);
	
		Reset <= Contador(3) and not(Contador(2)) and Contador(1) and not(Contador(0));
		
		Contador_o <= 	Contador;
		R_o <= Reset;
		
end rtl;
