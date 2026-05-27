-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i : in std_logic;
		salida_o   : out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

component FFJK is
	port 
	(
		clk_i, J_i, K_i :  in std_logic;
		Q_o				 : out std_logic
	); 
end component;

signal JA, KA : std_logic:= '0';
signal JB, KB : std_logic:= '0';
signal JC, KC : std_logic:= '0';

signal A, B, C : std_logic:= '0';

signal estado : std_logic_vector(3 downto 0):= "0000";

begin

	FFA: FFJK port map
	(
		clk_i	=> clk_i, 
		J_i	=>    JA, 
		K_i   =>    KA,
		Q_o	=> 	 A	
	);

	FFB: FFJK port map
	(
		clk_i	=> clk_i, 
		J_i	=>    JB, 
		K_i   =>    KB,
		Q_o	=> 	 B	
	);	

	FFC: FFJK port map
	(
		clk_i	=> clk_i, 
		J_i	=>    JC, 
		K_i   =>    KC,
		Q_o	=> 	 C	
	);
	
	estado <= A & B & C & X_i;
	
	JA <=	'1' when estado = "0101" else
			'1' when estado = "0110" else '0';	

	KA <=	'0' when estado = "1010" else
			'0' when estado = "1111" else '1';

	JB <=	'1';	

	KB <=	'1' when estado = "0110" else
			'1' when estado = "1111" else '0';

	JC <=	'1' when estado = "0100" else
			'1' when estado = "0101" else '0';	

	KC <=	'1' when estado = "0010" else
			'1' when estado = "0011" else
			'1' when estado = "0111" else
			'1' when estado = "1110" else '0';
	
	salida_o <= A & B & C;	
	
end Behavioral;






