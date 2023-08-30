-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity circuito_logico is
	port 
	(
		A_i :  in std_logic ;
		B_i :  in std_logic ;
		C_i :  in std_logic ;
		D_i :  in std_logic ;
		x_o : out std_logic ;
		w_o :	out std_logic ;
		y_o : out std_logic ;
		z_o : out std_logic 
	);
end circuito_logico;

architecture Behavioral of circuito_logico is

begin

		x_o <= A_i      and     B_i  and     C_i  and     D_i ;
		w_o <= A_i      and not(B_i) and not(C_i) and     D_i ;
		y_o <= not(A_i) and not(B_i) and     C_i  and     D_i ;
		z_o <= A_i      and     B_i  and not(C_i) and not(D_i);
		
end Behavioral;

