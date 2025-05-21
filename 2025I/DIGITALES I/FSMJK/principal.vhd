-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, x_i : in  std_logic;
		A_o, B_o   : out std_logic 		

	);
end principal;

architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component FFJK is
	port 
	(
		clk_i, J_i, K_i : in  std_logic;
		Q_o				 :	out std_logic	
	);
end component;

signal clk_div : std_logic:='0';

signal  A : std_logic:='0';
signal  B : std_logic:='0';
signal JA : std_logic:='0';
signal KA : std_logic:='0';
signal JB : std_logic:='0';
signal KB : std_logic:='0';

begin

	clk_dv: clk port map
	(
			 clk_i => clk_i, 
		clk_div_o => clk_div
	);

	FFA: FFJK port map
	(
		clk_i => clk_div, 
		  J_i =>      JA, 
		  K_i =>      KB, 
		  Q_o =>			A	
	);
	
	FFB: FFJK port map
	(
		clk_i => clk_div, 
		  J_i =>      JB, 
		  K_i =>      KB, 
		  Q_o =>			B	
	);

JA <= B and x_i;
KA <=  not(x_i);
JB <=       x_i;
KB	<= (not(x_i)) or (not(A));

A_o <= A;
B_o <= B;
	
end Behavioral;



