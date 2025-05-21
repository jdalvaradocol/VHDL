-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		  x_i	: in std_logic;
		  y_o : out std_logic;
		  A_o : out std_logic;
		  B_o : out std_logic
	);
end principal;


architecture Behavioral of principal is

component FFD is
	port 
	(	
		clk_i :  in std_logic;
		  D_i :  in std_logic;
		  Q_o : out std_logic
	);
end component;

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

signal     A : std_logic:= '0';
signal     B : std_logic:= '0';
signal     SA : std_logic:= '0';
signal     SB : std_logic:= '0';
signal clk_dv : std_logic:= '0';

begin

	clk_div: clk port map
	(
		clk_i 	 =>  clk_i,
		clk_div_o => clk_dv	
	);

	FA: FFD port map
	(
		clk_i => clk_dv,
		  D_i => SA,
		  Q_o => A
		
	);

	FB: FFD port map
	(
		clk_i => clk_dv,
		  D_i => SB,
		  Q_o => B
	);

SA <= (A and x_i) or (   (B) and x_i);
SB <= (A and x_i) or (not(B) and x_i);

y_o <= A and B;
A_o <= A;	
B_o <= B;	

end Behavioral;



