-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;


entity sumador_completo is
	port 
	(
		A_i, B_i, C_i :  in  std_logic;
		C_o, S_o 	  : out  std_logic
	);
end sumador_completo;

architecture rtl of sumador_completo is

begin

	-- S = 'A'BC + 'AB'C + A'B'C + ABC 

	S_o <= 	(not (A_i) and not(B_i) and     (C_i)) or 
				(not (A_i) and    (B_i) and not (C_i)) or
				(    (A_i) and not(B_i) and not (C_i)) or
				(    (A_i) and    (B_i) and     (C_i)) ;
	
	-- C = BC + AC + AB 

	C_o <= (B_i and C_i) or (A_i and C_i) or (A_i and B_i);

end rtl;