library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end mux4x1;

architecture Behavioral of mux4x1 is

-- entrada_i -> entrada_i(3) entrada_i(2) entrada_i(1) entrada_i(0) 
--								  A	         B	          C            D	

component mux2x1 is
	port 
	(
		A_i, B_i, S_i : in std_logic;
		      X_o : out std_logic
	);
end component;

signal cableA : std_logic := '0';
signal cableB : std_logic := '0';

begin

	M1: mux2x1 port map
	(
		A_i => entrada_i(3), 
		B_i => entrada_i(2), 
		S_i => S_i(0), 
		X_o => cableA
	);

	M2: mux2x1 port map
	(
		A_i => entrada_i(1), 
		B_i => entrada_i(0), 
		S_i => S_i(0), 
		X_o => cableB
	);

	M3: mux2x1 port map
	(
		A_i => cableA, 
		B_i => cableB, 
		S_i => S_i(1), 
		X_o => X_o
	);
	
end Behavioral;