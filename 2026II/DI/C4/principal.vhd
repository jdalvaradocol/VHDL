-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i :  in std_logic_vector(3 downto 0);
			  S_o : out std_logic_vector(4 downto 0)	
	);
end principal;


architecture Behavioral of principal is

component semi_sumador is
	port 
	(
		A_i, B_i : in std_logic;
		s_o, c_o	: out std_logic
	);
end component;

component completo_sumador is
	port 
	(
		A_i, B_i, C_i : in std_logic;
		s_o, c_o	: out std_logic
	);
end component;

signal Carry : std_logic_vector(2 downto 0):= "000";

begin

	X0: semi_sumador port map 
	(
		A_i => A_i(0), 
		B_i => B_i(0),
		s_o => S_o(0), 
		c_o => Carry(0)	
	);

	X1: completo_sumador port map 
	(
		A_i => A_i(1), 
		B_i => B_i(1),
		C_i => Carry(0),
		s_o => S_o(1), 
		c_o => Carry(1)	
	);
	
	X2: completo_sumador port map 
	(
		A_i => A_i(2), 
		B_i => B_i(2),
		C_i => Carry(1),
		s_o => S_o(2), 
		c_o => Carry(2)	
	);	
	
	X3: completo_sumador port map 
	(
		A_i => A_i(3), 
		B_i => B_i(3),
		C_i => Carry(2),
		s_o => S_o(3), 
		c_o => S_o(4)	
	);
	
	
end Behavioral;







