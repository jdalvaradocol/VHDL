-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity diagrama_logico is
	port 
	(
		A_i : in std_logic;
		B_i : in std_logic;
		C_i : in std_logic;	
		x_o : out std_logic
	);
end diagrama_logico;

-- a_i A_i a_I

-- x = A'B'C' + A'BC + AB'C' + ABC

architecture Behavioral of diagrama_logico is

begin

	x_o <= 	( not(A_i) and not(B_i) and not(C_i)) or
				( not(A_i) and    (B_i) and    (C_i)) or
				(    (A_i) and not(B_i) and not(C_i)) or
				(    (A_i) and    (B_i) and    (C_i)) ;
	
end Behavioral;

