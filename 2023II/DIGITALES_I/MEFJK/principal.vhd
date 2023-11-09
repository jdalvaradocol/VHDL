-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i : in std_logic;
		Q_o			: out std_logic_vector(1 downto 0)
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
		J_i, K_i, clk_i : in std_logic;
						Q_o : out std_logic
	);
end component;

signal  A : std_logic := '0';
signal JA : std_logic := '0';
signal KA : std_logic := '0';

signal  B : std_logic := '0';
signal JB : std_logic := '0';
signal KB : std_logic := '0';

signal clk_div : std_logic := '0';

begin

	clock:	clk port map
	(
		clk_i 		=> clk_i, 
		clk_div_o  	=>	clk_div 
	);

	FFA: FFJK port map 
	(
		clk_i => clk_div, 	
		J_i   => JA, 
		K_i   => KA,
		Q_o   =>  A
	);

	FFB: FFJK port map 
	(
		clk_i => clk_div, 	
		J_i   => JB, 
		K_i   => KB,
		Q_o   =>  B
	);
	
JA <= B and X_i;	
KA <= not(X_i);	

JB <= X_i;	
KB <= (not(A)) or (not(X_i));	

Q_o <= A & B;

end Behavioral;









