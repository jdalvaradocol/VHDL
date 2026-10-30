-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x1_o	: out std_logic;
		x2_o	: out std_logic;
		x3_o	: out std_logic;
		x4_o	: out std_logic
	);
end principal;

architecture Behavioral of principal is

component mux4x1_A is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end component;

component mux4x1_B is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end component;

component mux4x1_C is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end component;

component mux4x1_D is
	port 
	(
		EN_i	: in	std_logic_vector(3 downto 0);
		S_i	: in	std_logic_vector(1 downto 0);
		x_o	: out std_logic
	);
end component;

begin

	mux1: mux4x1_A port map
	(
		EN_i => EN_i,
		S_i  => S_i,
 		x_o  => x1_o
	);
	
	mux2: mux4x1_B port map
	(
		EN_i => EN_i,
		S_i  => S_i,
 		x_o  => x2_o
	);
	
	mux3: mux4x1_C port map
	(
		EN_i => EN_i,
		S_i  => S_i,
 		x_o  => x3_o
	);
	
	mux4: mux4x1_D port map
	(
		EN_i => EN_i,
		S_i  => S_i,
 		x_o  => x4_o
	);
	
	
	

	
end Behavioral;