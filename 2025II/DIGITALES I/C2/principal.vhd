-- Quartus II VHDL Template

-- Librerias.

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i  : in std_logic;
		B_i  : in std_logic;
		C_i  : in std_logic;
		D_i  : in std_logic;
		x1_o : out std_logic;
		x2_o : out std_logic;
		x3_o : out std_logic;
		x4_o : out std_logic
);
end principal;


architecture Behavioral of principal is

begin
	
	x1_o <= A_i and B_i and C_i and D_i;

	x2_o <= not(A_i) and not(B_i) and not(C_i) and not(D_i);
				
	x3_o <= (not(A_i) and not(B_i) and     C_i and      D_i) or
			  (    A_i  and     B_i  and not(C_i) and not(D_i));
	
	x4_o <= A_i and B_i;
	
end Behavioral;



