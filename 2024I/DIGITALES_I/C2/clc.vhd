-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity clc is
	port 
	(
		A_i :in std_logic ;
		B_i :in std_logic ;
		C_i :in std_logic ;	
		
		x_o :out std_logic 		
	);
end clc;

architecture Behavioral of clc is

-- x = A'B'C' + A'BC + AB'C' + ABC 

begin

	x_o <= 	(not(A_i) and not(B_i) and not(C_i)) or -- A'B'C'
				(not(A_i) and    (B_i) and    (C_i)) or -- A'B C
				(   (A_i) and not(B_i) and not(C_i)) or -- A B'C'
				(   (A_i) and    (B_i) and    (C_i)) ;  -- A B C
				
end Behavioral;


