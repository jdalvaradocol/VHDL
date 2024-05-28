-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i :  in std_logic;
		X_i	:  in std_logic_vector(1 downto 0);
		Y_o   : out std_logic_vector(3 downto 0);
		S_o   : out std_logic_vector(1 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal  A : std_logic:='0';
signal SA : std_logic:='0';
signal  B : std_logic:='0';
signal SB : std_logic:='0';

signal clk_div : std_logic:='0';

begin

	clk_dv: entity work.clk port map
	(
		clk_i 	 => clk_i,
		clk_div_o => clk_div
	);


	FFA: entity work.FFD port map 
	(
		D_i    =>    SA, 
		clk_i  => clk_div,
		Q_o    =>     A   
	);

	FFB: entity work.FFD port map 
	(
		D_i    =>    SB, 
		clk_i  => clk_div,
		Q_o    =>     B   
	);

	
SA <= (not(A) and not(B) and not(X_i(1)) and      X_i(0)) or	
		(not(A) and    (B) and    (X_i(1)) and not  X_i(0)) or
		(  (A) and             not(X_i(1)) and not  X_i(0)) or
		(   (A) and    (B) and                      X_i(0)) or
		(   (A) and not(B) and    (X_i(1))); 	

SB <= (   (B) and not(X_i(1)) and not X_i(0)) or	
		(not(B) and not(X_i(1)) and     X_i(0)) or	
		(   (B) and    (X_i(1)) and     X_i(0)) or	
		(not(B) and    (X_i(1)) and not X_i(0));
	
Y_o(3) <=    (A) and    (B);
Y_o(2) <=    (A) and not(B);
Y_o(1) <= not(A) and    (B);
Y_o(0) <= not(A) and not(B);

S_o <= A & B;	
			
end Behavioral;