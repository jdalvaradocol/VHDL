-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i		: in std_logic;
		X_i		: in std_logic_vector(1 downto 0);
		A_o, B_o	: out std_logic

	);
end principal;


architecture Behavioral of principal is

component FFD is
	port 
	(	
		clk_i, D_i :	in 	std_logic;
		       Q_o :	out	std_logic		
	);
end component;

signal A, B : std_logic:= '0';
signal FA, FB : std_logic:= '0';
signal entrada : std_logic_vector(3 downto 0):= "0000";


begin

	FFDA: FFD port map
	(
		clk_i => clk_i, 
		D_i   =>    FA,
		Q_o 	=>     A
	);

	FFDB: FFD port map
	(
		clk_i => clk_i, 
		D_i   =>    FB,
		Q_o 	=>     B
	);
	
	entrada <= A & B & X_i;
	
	FA <= '0' when entrada = "0000" else -- E3
			'1' when entrada = "0001" else -- E3
			'1' when entrada = "0010" else -- E3	
			'0' when entrada = "0011" else -- E3	
			'0' when entrada = "0100" else -- E1
			'1' when entrada = "0101" else -- E1
			'1' when entrada = "0110" else -- E1
			'0' when entrada = "0111" else -- E1
			'1' when entrada = "1000" else -- E0
			'0' when entrada = "1001" else -- E0
			'0' when entrada = "1010" else -- E0
			'1' when entrada = "1011" else -- E0
			'1' when entrada = "1100" else -- E2
			'0' when entrada = "1101" else -- E2  
			'0' when entrada = "1110" else -- E2
			'1' when entrada = "1111" else -- E2
			'0';

	FB <= '0' when entrada = "0000" else -- E3
			'0' when entrada = "0001" else -- E3
			'1' when entrada = "0010" else -- E3	
			'0' when entrada = "0011" else -- E3	
			'1' when entrada = "0100" else -- E1
			'1' when entrada = "0101" else -- E1
			'0' when entrada = "0110" else -- E1
			'1' when entrada = "0111" else -- E1
			'0' when entrada = "1000" else -- E0
			'1' when entrada = "1001" else -- E0
			'0' when entrada = "1010" else -- E0
			'0' when entrada = "1011" else -- E0
			'1' when entrada = "1100" else -- E2
			'0' when entrada = "1101" else -- E2  
			'1' when entrada = "1110" else -- E2
			'1' when entrada = "1111" else -- E2
			'0';
	
		A_o <= A;
		B_o <= B;
		
end Behavioral;







