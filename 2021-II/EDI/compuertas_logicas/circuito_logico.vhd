
-- Quartus Prime VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity circuito_logico is
	port 
	(
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : in std_logic;
		x : out std_logic
	);
end circuito_logico;

-- Three possible architectures
architecture rtl of circuito_logico is

begin
	
	x <= (B and not(C)) or (not(A) and B) or (not(A) and C and D);
	
end rtl;




