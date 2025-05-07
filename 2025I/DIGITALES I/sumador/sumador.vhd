-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity sumador is
	port 
	(
		A_i, B_i :  in std_logic_vector(2 downto 0);
		S_o      : out std_logic_vector(3 downto 0)
	);
end sumador;

architecture Behavioral of sumador is

component semi_sumador is
	port 
	(
		A_i, B_i : in std_logic;
		C_o, S_o : out std_logic
	);
end component;

component sumador_completo is
	port 
	(
		A_i, B_i, C_i : in std_logic;
		C_o, S_o : out std_logic
	);
end component;

signal C : std_logic_vector(1 downto 0);

begin

	B0 : semi_sumador port map 
	(
		A_i => A_i(0), 
		B_i => B_i(0),
		C_o =>   C(0), 
		S_o => S_o(0)		
	);
	
	B1 : sumador_completo port map 
	(
		A_i => A_i(1), 
		B_i => B_i(1),
		C_i =>   C(0),
		C_o =>   C(1), 
		S_o => S_o(1)		
	);

	B2 : sumador_completo port map 
	(
		A_i => A_i(2), 
		B_i => B_i(2),
		C_i =>   C(1),
		C_o => S_o(3), 
		S_o => S_o(2)		
	);	
	
end Behavioral;



