-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

-- Contador 0 a 69
-- reset en 68

entity contador_6 is
	port 
	(
		clk_i, R_i	:	in	std_logic;
		contador_o	:	out	std_logic_vector(2 downto 0);
				 R_o	:	out	std_logic
	);
end contador_6;

architecture Behavioral of contador_6 is

component FFT is
	port 
	(
		T_i, R_i, clk_i	: in	std_logic;
						Q_o   : out std_logic
	);
end component;

signal	R_aux	:	std_logic := '0';
signal	    R	:	std_logic := '0'; 	
 	
signal	contador	:	std_logic_vector(2 downto 0) := "000"; 	

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
	
	-- Contador de 0 a 6 reset 7
	R_aux <= '1' when contador = "111" else '0';
	
	R <= R_aux or R_i;
	
   R_o <= R_aux;
	
	contador_o <= contador;
	
end Behavioral;







