-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i :	in std_logic; 
		X_i	:	in	std_logic_vector(1 downto 0);
		salida_o	:	out std_logic_vector(1 downto 0)
	);
end principal;

architecture Behavioral of principal is

component FFJK is
	port 
	(
		clk_i, J_i, K_i : in 	std_logic;
						Q_o : out 	std_logic
	);
end component;

signal  A : std_logic:= '0';
signal  B : std_logic:= '0';
signal JA : std_logic:= '0';
signal JB : std_logic:= '0';
signal KA : std_logic:= '0';
signal KB : std_logic:= '0';

signal estado : std_logic_vector(3 downto 0):= "0000";

begin

	FFA: FFJK port map
	(
		clk_i	=> clk_i, 
		J_i   =>    JA, 
		K_i   => 	KA,
		Q_o   => 	 A 
	);

	FFB: FFJK port map
	(
		clk_i	=> clk_i, 
		J_i   =>    JB, 
		K_i   => 	KB,
		Q_o   => 	 B 
	);
	
	estado <= A & B & X_i;
	
	JA <= '1' when estado = "0001" else
			'1' when estado = "0010" else
			'1' when estado = "0101" else
			'1' when estado = "0110" else
			'0';
			
	KA <= '1' when estado = "1001" else
			'1' when estado = "1010" else
			'1' when estado = "1101" else
			'1' when estado = "1110" else
			'0';
			
	JB <= '1' when estado = "0010" else
			'1' when estado = "1001" else
			'0';
			
	KB <= '1' when estado = "0110" else
			'1' when estado = "1101" else
			'0';
			
	salida_o <= A & B;		
			
end Behavioral;







