-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		   clk_i, x_i :  in std_logic;
		A_o, B_o, Y_o : out std_logic
	);
end principal;


architecture Behavioral of principal is

component FFD is
	port 
	(
		clk_i, D_i : in  std_logic;
		       Q_o : out std_logic
 	);
end component;

signal A, B, SA, SB : std_logic:= '0';

signal ABX : std_logic_vector(2 downto 0):= "000";


begin

	FFDA : FFD port map
	(
		clk_i => clk_i, 
		  D_i => SA,
		  Q_o => A
	);

	FFDB : FFD port map
	(
		clk_i => clk_i, 
		  D_i => SB,
		  Q_o => B
	);	

	ABX <= A & B & X_i;
	
	SA <= '0' when ABX = "000" else
			'0' when ABX = "001" else
			'0' when ABX = "010" else
			'1' when ABX = "011" else
			'0' when ABX = "100" else
			'1' when ABX = "101" else
			'0' when ABX = "110" else
			'1' when ABX = "111" else 
			'0';

	SB <= '0' when ABX = "000" else
			'1' when ABX = "001" else
			'0' when ABX = "010" else
			'0' when ABX = "011" else
			'0' when ABX = "100" else
			'1' when ABX = "101" else
			'0' when ABX = "110" else
			'1' when ABX = "111" else 
			'0';		
		
	A_o <= A; 
	B_o <= B;
	Y_o <= A and B;
		
end Behavioral;




