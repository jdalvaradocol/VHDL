-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i  	: in 	std_logic;
		x_i  		: in 	std_logic_vector(1 downto 0);
		A_o		: out std_logic;
		B_o		: out std_logic;
		Y_o		: out std_logic
	);
end principal;

architecture Behavioral of principal is

component FFD is
	port 
	(
		D_i, clk_i  : in 	std_logic;
		Q_o			: out std_logic
	);
end component;

signal  A : std_logic:='0';
signal FA : std_logic:='0';
signal  B : std_logic:='0';
signal FB : std_logic:='0';

signal dato : 	std_logic_vector(3 downto 0):="0000";

begin

	F1: FFD port map
	(
		clk_i => clk_i,
		D_i	=>    FA,	
		Q_o	=>     A
	);

	F2: FFD port map
	(
		clk_i => clk_i,
		D_i	=>    FB,	
		Q_o	=>     B
	);

dato <= A & B & x_i;	
	
FA <= 	'1' when dato = x"0" else
			'0' when dato = x"1" else
			'1' when dato = x"2" else
			'0' when dato = x"3" else
			'0' when dato = x"4" else
			'1' when dato = x"5" else
			'1' when dato = x"6" else
			'0' when dato = x"7" else
			'1' when dato = x"8" else
			'0' when dato = x"9" else
			'1' when dato = x"A" else
			'0' when dato = x"B" else
			'0' when dato = x"C" else
			'1' when dato = x"D" else
			'1' when dato = x"E" else
			'0' when dato = x"F" else
			'0';

FB <= 	'0' when dato = x"0" else
			'1' when dato = x"1" else
			'0' when dato = x"2" else
			'1' when dato = x"3" else
			'0' when dato = x"4" else
			'1' when dato = x"5" else
			'0' when dato = x"6" else
			'1' when dato = x"7" else
			'1' when dato = x"8" else
			'0' when dato = x"9" else
			'0' when dato = x"A" else
			'1' when dato = x"B" else
			'1' when dato = x"C" else
			'0' when dato = x"D" else
			'0' when dato = x"E" else
			'1' when dato = x"F" else
			'0';			
			
Y_o <= not(B);
A_o <= A;
B_o <= B;
			
end Behavioral;
