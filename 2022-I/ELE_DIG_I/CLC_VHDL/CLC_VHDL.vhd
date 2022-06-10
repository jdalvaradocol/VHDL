-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity CLC_VHDL is
	port 
	(
		A :	in 	std_logic;
		B :	in 	std_logic;
		C :	in 	std_logic;
		X :	out 	std_logic
	);
end CLC_VHDL;


-- Three possible architectures
architecture rtl of CLC_VHDL is
begin
		
	X <= 	(not (A) and not(B) and not(C)) or
			(not (A) and (B) and (C)) or
			( (A) and not(B) and not(C)) or
			( (A) and (B) and (C)) ;

end rtl;
