-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux_vhdl_C is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		      S_i : in std_logic_vector(1 downto 0);
		      X_o : out std_logic	
	);
end mux_vhdl_C;

architecture Behavioral of mux_vhdl_C is

component mux_logic is
	port 
	(
		A_i, B_i, S_i : in  	std_logic;
		          X_o : out  std_logic	
	);
end component;

signal cableA : std_logic:= '0';
signal cableB : std_logic:= '0';

begin

	MUXA : mux_logic port map
	(
		A_i => entrada_i(3), 
		B_i => entrada_i(2), 
		S_i => S_i(0),
		X_o => cableA	
	);

	MUXB : mux_logic port map
	(
		A_i => entrada_i(3), 
		B_i => entrada_i(2), 
		S_i => S_i(0),
		X_o => cableB
	);
	
	MUXC : mux_logic port map
	(
		A_i => cableA, 
		B_i => cableB, 
		S_i => S_i(1),
		X_o => X_o
	);


end Behavioral;