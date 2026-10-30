-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_D is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end mux4x1_D;


architecture Behavioral of mux4x1_D is

component mux2x1 is
	port 
	(
		EN_i	: in	std_logic_vector(1 downto 0);
		S_i	: in	std_logic;
		x_o	: out std_logic
	);
end component;

signal cable1 : std_logic:='0';
signal cable2 : std_logic:='0';

begin

	m1: mux2x1 port map
	(
		EN_i => EN_i(3 downto 2),
		S_i  => S_i(0),
 		x_o  => cable1	
	);
	
	m2: mux2x1 port map
	(
		EN_i => EN_i(1 downto 0),
		S_i  => S_i(0),
 		x_o  => cable2	
	);
	
	m3: mux2x1 port map
	(
		EN_i => cable1 & cable2,
		S_i  => S_i(1),
 		x_o  => x_o	
	);
	

	
end Behavioral;