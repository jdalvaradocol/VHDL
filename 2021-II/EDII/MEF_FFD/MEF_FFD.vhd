
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEF_FFD is
    Port ( X_i 			: in STD_LOGIC;
           clk_i 			: in STD_LOGIC;
           A_o,B_o,Y_o 	: out STD_LOGIC);
end MEF_FFD;

architecture Behavioral of MEF_FFD is

component FFD is
    Port ( D 	: in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q 	: out STD_LOGIC);
end component;

signal SA : std_logic := '0';
signal SB : std_logic := '0';

signal A : std_logic := '0';
signal B : std_logic := '0';

begin

SA <= (A and X_i) or (B and X_i);
SB <= (A and X_i) or (not (B) and X_i);

FFD0: FFD port map
			(
				D 		=>	SA,	
				CLK 	=> clk_i,
				Q 		=>	A
			);

FFD1: FFD port map
			(
				D 		=>	SB,	
				CLK 	=> clk_i,
				Q 		=>	B
			);			
           
A_o  <= A ; 
B_o  <= B ;
Y_o  <= A and B;
	  			  
end Behavioral;