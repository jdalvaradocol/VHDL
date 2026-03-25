-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i, S_i 			: in  std_logic ;
		C_i, D_i, S0_i, S1_i : in  std_logic ;
		xa_o, xb_o, xc_o		: out std_logic
	);
end principal;

architecture Behavioral of principal is

component mux2x1A is
	port 
	(
		A_i, B_i, S_i 	: in  std_logic ;
		x_o				: out std_logic

	);
end component;

component mux2x1B is
	port 
	(
		A_i, B_i, S_i 	: in  std_logic ;
		x_o				: out std_logic

	);
end component;

signal cableA : std_logic:='0';
signal cableB : std_logic:='0';

begin

	M1: mux2x1A port map 
		(
			A_i	=> A_i, 
			B_i   => B_i, 
			S_i   => S_i,
			x_o   => xa_o
		);

	M2: mux2x1B port map 
		(
			A_i	=> A_i, 
			B_i   => B_i, 
			S_i   => S_i,
			x_o   => xb_o
		);		


	M4A: mux2x1A port map 
		(
			A_i	=> A_i, 
			B_i   => B_i, 
			S_i   => S0_i,
			x_o   => cableA
		);

	M4B: mux2x1A port map 
		(
			A_i	=> C_i, 
			B_i   => D_i, 
			S_i   => S0_i,
			x_o   => cableB
		);

	M4C: mux2x1A port map 
		(
			A_i	=> cableA, 
			B_i   => cableB, 
			S_i   => S1_i,
			x_o   => xc_o
		);
		
end Behavioral;






