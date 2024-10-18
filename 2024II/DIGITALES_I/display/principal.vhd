-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		in_i  : in  std_logic_vector(3 downto 0);
		out_o : out std_logic_vector(6 downto 0)
	);
end principal;

architecture Behavioral of principal is

-- in_i(3) in_i(2) in_i(1) in_i(0);
-- A       B       C       D    
begin

	out_o(6) <=   not(in_i(3)) and     in_i(2)  and     in_i(1)  and      in_i(0);
	out_o(5) <=       in_i(3)  and not(in_i(2)) and     in_i(1)  and      in_i(0);
	out_o(4) <=  		in_i(3)  and 	  in_i(2)  and not(in_i(1)) and      in_i(0);
	out_o(3) <=  		in_i(3)  and 	  in_i(2)  and     in_i(1)  and not (in_i(0));
	out_o(2) <=  		in_i(3)  and 	  in_i(2)  and not(in_i(1)) and not (in_i(0));
	out_o(1) <=  		in_i(3)  and not(in_i(2)) and not(in_i(1)) and      in_i(0);
	out_o(0) <=  not (in_i(3)) and not(in_i(2)) and     in_i(1)  and      in_i(0);

end Behavioral;











