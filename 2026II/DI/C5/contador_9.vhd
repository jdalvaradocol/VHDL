-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

-- Contador 0 a 69
-- reset en 68

entity contador_9 is
	port 
	(
		clk_i, R_i	:	in	std_logic;
		contador_o	:	out	std_logic_vector(3 downto 0);
				 R_o	:	out	std_logic
	);
end contador_9;

architecture Behavioral of contador_9 is

component FFT is
	port 
	(
		T_i, R_i, clk_i	: in	std_logic;
						Q_o   : out std_logic
	);
end component;

signal	R_aux	:	std_logic := '0';
signal	    R	:	std_logic := '0'; 	
 	
signal	contador	:	std_logic_vector(3 downto 0) := "0000"; 	

begin

	FFA: FFT port map
	(
		clk_i	=>  		 clk_i,
		T_i	=> 			'1',  
		R_i	=> 	  		  R, 		
		Q_o	=>  contador(0)	
	);
		
	FFB: FFT port map
	(
		clk_i	=>  contador(0),
		T_i	=> 	      '1',  
		R_i	=> 	        R, 		
		Q_o	=>  contador(1)	
	);		

	FFC: FFT port map
	(
		clk_i	=>  contador(1),
		T_i	=> 	      '1',  
		R_i	=> 	        R, 		
		Q_o	=>  contador(2)	
	);

	FFD: FFT port map
	(
		clk_i	=>  contador(2),
		T_i	=> 	      '1',  
		R_i	=> 	        R, 		
		Q_o	=>  contador(3)	
	);
	
	-- Contador de 0 a 9 reset 10
	R_aux <= '1' when contador = "1010" else '0';
	
	R <= R_aux or R_i;
	
	R_o <= R_aux;
	
	contador_o <= contador;
	
end Behavioral;







