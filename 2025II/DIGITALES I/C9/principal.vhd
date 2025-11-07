-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		x_i, clk_i : in std_logic;
		A_o, B_o, C_o : out std_logic

	);
end principal;


architecture Behavioral of principal is

component FFJK is
	port 
	(
		clk_i, J_i, K_i : in  std_logic;
		Q_o				 :	out std_logic	
	);
end component;

signal A : std_logic:= '0';
signal B : std_logic:= '1';
signal C : std_logic:= '0';


signal JA, JB, JC : std_logic:= '0';
signal KA, KB, KC : std_logic:= '0';

signal entrada : std_logic_vector(3 downto 0):= "0000";


begin

	FFJKA: FFJK port map
	(
		clk_i => clk_i, 
		  J_i => JA, 
		  K_i => KA,
		  Q_o => A
	);

	FFJKB: FFJK port map
	(
		clk_i => clk_i, 
		  J_i => JB, 
		  K_i => KB,
		  Q_o => B
	);
	
	FFJKC: FFJK port map
	(
		clk_i => clk_i, 
		  J_i => JC, 
		  K_i => KC,
		  Q_o => C
	);
	
	entrada <= A & B & C & x_i;
	
	JA <= '1' when entrada = "0101" else
			'1' when entrada = "0110" else
			'0';
	
   KA <= '1' when entrada = "1011" else
			'1' when entrada = "1110" else
			'0';
	
	JB <= '1' when entrada = "1010" else
			'1' when entrada = "1011" else
			'0';
	
   KB <= '1' when entrada = "0110" else
			'1' when entrada = "1111" else
			'0';	
			
	JC <= '1' when entrada = "0100" else
			'1' when entrada = "0101" else
			'0';
	
   KC <= '1' when entrada = "0111" else
			'1' when entrada = "1110" else
			'0';	
	
	A_o <= A;
	B_o <= B;
	C_o <= C;	
			
end Behavioral;




