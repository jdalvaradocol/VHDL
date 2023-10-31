-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i :  in 	std_logic_vector(2 downto 0);
		S_o		: out 	std_logic_vector(3 downto 0)
		
	);
end principal;

architecture Behavioral of principal is

component sumador is
	port 
	(
		A_i, B_i, C_i	:  in std_logic;
		C_o, S_o			: out std_logic 
	);
end component;

component semisumador is
	port 
	(
		A_i, B_i	:  in std_logic;
		C_o, S_o	: out std_logic 
	);
end component;

signal cable : std_logic_vector(1 downto 0):= "00";

begin

	S0: semisumador port map
	(
		A_i	=> A_i(0), 
		B_i	=> B_i(0),
		C_o  => cable(0),
		S_o	=> S_o(0)
	);
	
	S1: sumador port map
	(
		A_i	=> A_i(1), 
		B_i	=> B_i(1),
		C_i	=> cable(0),
		C_o  => cable(1),
		S_o	=> S_o(1)
	);

	S2: sumador port map
	(
		A_i	=> A_i(2), 
		B_i	=> B_i(2),
		C_i	=> cable(1),
		C_o  => S_o(3),
		S_o	=> S_o(2)
	);

end Behavioral;









