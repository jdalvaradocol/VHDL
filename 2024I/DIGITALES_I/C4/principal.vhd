-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		 A_i,  B_i,  S_i : in 	std_logic;
		XA_o, XB_o, XC_o : out	std_logic
	);
end principal;

architecture Behavioral of principal is

component mux_logic is
	port 
	(
		A_i, B_i, S_i : in  	std_logic;
		          X_o : out 	std_logic	
	);
end component;

component mux_vhdl_A is
	port 
	(
		A_i, B_i, S_i : in  	std_logic;
		          X_o : out 	std_logic	
	);
end component;

component mux_vhdl_B is
	port 
	(
		entrada_i : in  std_logic_vector(1 downto 0);
				S_i : in  std_logic;
		      X_o : out std_logic	
	);
end component;

begin

	MUX_A: mux_logic port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i,
		X_o => XA_o
	); 

	MUX_B: mux_vhdl_A port map
	(
		A_i => A_i, 
		B_i => B_i, 
		S_i => S_i,
		X_o => XB_o
	); 

	MUX_C: mux_vhdl_B port map
	(
		entrada_i => A_i & B_i, 
		S_i => S_i,
		X_o => XC_o
	); 
	
end Behavioral;









