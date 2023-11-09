-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i		: in std_logic;
		A_o, B_o, Y_o	: out std_logic
	);
end principal;

architecture Behavioral of principal is

component FFD is
	port 
	(
		clk_i, D_i :  in std_logic;
		       Q_o : out std_logic	
	);
end component;

signal  A : std_logic := '0';
signal  B : std_logic := '0';
signal FA : std_logic := '0';
signal FB : std_logic := '0';

begin

	FFA: FFD port map
	(
		clk_i => clk_i,
		D_i   => FA,
		Q_o   => A
	);

	FFB: FFD port map
	(
		clk_i => clk_i,
		D_i   => FB,
		Q_o   => B
	);

FA <= (not(A) and not(X_i)) or (not(A) and B) or (B and not(X_i)) ; 	
FB <= not(A) or not(B); 	

Y_o <= A and B; 	
A_o <= A; 	
B_o <= B; 	

	
end Behavioral;









