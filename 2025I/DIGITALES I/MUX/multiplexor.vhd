-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity multiplexor is
	port 
	(
		 A_i, B_i,   S_i 			:  in std_logic;
		A1_i, B1_i, C1_i 			:  in std_logic;
		D1_i, S1_i, S0_i 			:  in std_logic;
		XA_o, XB_o, XC_o, XD_o  : out	std_logic
	);
end multiplexor;

architecture Behavioral of multiplexor is

component mux_logic_2_1 is
	port 
	(
		A_i, B_i, S_i 	: in 	std_logic;
		X_o				: out	std_logic
	);
end component;

component mux_when_2_1 is
	port 
	(
		A_i, B_i, S_i 	: in 	std_logic;
		X_o			: out	std_logic
	);
end component;

component mux_if_2_1 is
	port 
	(
		A_i, B_i, S_i 	: in 	std_logic;
		X_o			: out	std_logic
	);
end component;

signal cable0 : std_logic:= '0';
signal cable1 : std_logic:= '0';

begin

	muxA: mux_logic_2_1 port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i, 	
		X_o => XA_o
	);

	muxB: mux_when_2_1 port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i, 	
		X_o => XB_o
	);
	
	muxC: mux_if_2_1 port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i, 	
		X_o => XC_o
	);

	mux1: mux_if_2_1 port map
	(
		A_i => A1_i, 
		B_i => B1_i, 
		S_i => S0_i, 	
		X_o => cable0
	);
	
	mux2: mux_if_2_1 port map
	(
		A_i => C1_i, 
		B_i => D1_i, 
		S_i => S0_i, 	
		X_o => cable1
	);
	
	mux3: mux_if_2_1 port map
	(
		A_i => cable0, 
		B_i => cable1, 
		S_i => S1_i, 	
		X_o => XD_o
	);
		
end Behavioral;