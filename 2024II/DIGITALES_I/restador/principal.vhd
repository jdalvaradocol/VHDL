-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i			:	in std_logic_vector(2 downto 0);
		S_o 				: out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

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
		A_i, B_i, C_i 	: in 	std_logic;
		C_o, S_o 		: out std_logic
	);
end component;

signal carryA : std_logic_vector(1 downto 0):= "00";
signal carryB : std_logic_vector(1 downto 0):= "00";

signal B : std_logic_vector(2 downto 0):= "000";


signal  n : std_logic:= '0';
signal  x : std_logic_vector(2 downto 0):= "000";
signal xn : std_logic_vector(2 downto 0):= "000";
signal  y : std_logic_vector(2 downto 0):= "000";


begin

	B <= not(B_i);

	SUMA0: sumador_completo port map 
	(
		A_i =>    A_i(0), 
		B_i =>    (B(0)),
		C_i =>       '1',
		C_o => carryA(0), 
		S_o =>      x(0)
	);
	
	SUMA1: sumador_completo port map 
	(
		A_i =>     A_i(1), 
		B_i =>     (B(1)),
		C_i =>  carryA(0),
		C_o =>  carryA(1), 
		S_o =>       x(1)
	);
	
	SUMA2: sumador_completo port map 
	(
		A_i =>    A_i(2), 
		B_i =>    (B(2)),
		C_i => carryA(1),
		C_o =>         n, 
		S_o =>      x(2)
	);

	xn <= not(x);
	
	SUMB0: sumador_completo port map 
	(
		A_i =>       '0', 
		B_i =>     xn(0),
		C_i =>       '1',
		C_o => carryB(0), 
		S_o =>      y(0)
	);
	

	SUMB1: sumador_completo port map 
	(
		A_i =>       '0', 
		B_i =>     xn(1),
		C_i => carryB(0),
		C_o => carryB(1), 
		S_o =>      y(1)
	);

	SUMB2: sumador_completo port map 
	(
		A_i =>       '0', 
		B_i =>     xn(2),
		C_i => carryB(1),
    --C_o =>          , 
		S_o =>      y(2)
	);	

S_o <= 	x when n = '1' else
			y when n = '0' else
			"000";
	
end Behavioral;