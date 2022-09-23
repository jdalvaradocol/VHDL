-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic; 
							x_o : out std_logic
	);
end circuito;

architecture Behavioral of circuito is

begin

	x_o <= 	( not(A_i) and not(B_i) and    (C_i) and    (D_i) ) or
				( not(A_i) and    (B_i) and not(C_i) and    (D_i) ) or
				(    (A_i) and    (B_i) and not(C_i) and not(D_i) ) or
				(    (A_i) and    (B_i) and    (C_i) and    (D_i) ) ;

end Behavioral;




