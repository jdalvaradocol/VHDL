-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i  					: in std_logic_vector(3 downto 0);
		S_i  					: in std_logic_vector(1 downto 0);
		xA_o, xB_o, xC_o  : out std_logic
	);
end principal;

architecture Behavioral of principal is

component mux4x1_A is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end component;

component mux4x1_B is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end component;

component mux4x1_C is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end component;

begin

	Mux4A : mux4x1_A port map
	(
		A_i => A_i(0), 
		B_i => A_i(1), 
		C_i => A_i(2), 
		D_i => A_i(3), 
		S_i => S_i,
		x_o => xA_o
	);

	Mux4B : mux4x1_B port map
	(
		A_i => A_i(0), 
		B_i => A_i(1), 
		C_i => A_i(2), 
		D_i => A_i(3), 
		S_i => S_i,
		x_o => xB_o
	);

	Mux4C : mux4x1_C port map
	(
		A_i => A_i(0), 
		B_i => A_i(1), 
		C_i => A_i(2), 
		D_i => A_i(3), 
		S_i => S_i,
		x_o => xC_o
	);	
	
	
end Behavioral;







