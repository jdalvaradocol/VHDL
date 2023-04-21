-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_A is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end mux4x1_A;

architecture Behavioral of mux4x1_A is

component mux2x1 is
	port 
	(
		A_i, B_i, S_i :  in std_logic;
		x_o			  : out std_logic
		
	);
end component;

signal x1, x2 : std_logic := '0';

begin

	muxA: mux2x1 port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i(0), 
		x_o => x1
	);

	muxB: mux2x1 port map
	(
		A_i => C_i, 
		B_i => D_i, 
		S_i => S_i(0), 
		x_o => x2
	);

	muxC: mux2x1 port map
	(
		A_i => x1, 
		B_i => x2, 
		S_i => S_i(1), 
		x_o => x_o
	);	

end Behavioral;







