library ieee;
use ieee.std_logic_1164.all;

entity multiplexor is
	port 
	(
			A_i 	: in	std_logic;
			B_i 	: in	std_logic;
			C_i 	: in	std_logic;
			D_i 	: in	std_logic;
			Sel_i	: in	std_logic_vector(1 downto 0);	
			X_o 	: out	std_logic
	);
end multiplexor;

architecture modo_vhdl of multiplexor is

begin

	X_o <=  	A_i when Sel_i = "00" else 
				B_i when Sel_i = "01" else
				C_i when Sel_i = "10" else
				D_i when Sel_i = "11" else
				'0';	

end modo_vhdl;