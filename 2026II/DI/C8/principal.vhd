-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		   clk_i :	 in	std_logic;
		     X_i :	 in	std_logic_vector(1 downto 0);
		salida_o :  out	std_logic_vector(1 downto 0)   
	);
end principal;

architecture Behavioral of principal is

component FFT is
	port 
	(
		clk_i, T_i : in	std_logic;
			    Q_o : out std_logic
	);
end component;

signal  A : std_logic:= '0';
signal  B : std_logic:= '0';
signal TA : std_logic:= '0';
signal TB : std_logic:= '0';

signal estado : std_logic_vector(3 downto 0):= "0000";

begin

	FFA: FFT port map
	(
		clk_i => clk_i,
		  T_i =>    TA,
		  Q_o =>     A
	);

	FFB: FFT port map
	(
		clk_i => clk_i,
		  T_i =>    TB,
		  Q_o =>     B
	);

	estado <= A & B & X_i;
	
	TA <= '1' when estado = "0001" else
			'1' when estado = "0010" else
			'1' when estado = "0101" else
			'1' when estado = "0110" else
			'1' when estado = "1001" else
			'1' when estado = "1010" else
			'1' when estado = "1101" else
			'1' when estado = "1110" else
			'0';

	TB <= '1' when estado = "0010" else
			'1' when estado = "0110" else
			'1' when estado = "1001" else
			'1' when estado = "1101" else
			'0';		

	salida_o <= A & B;			
		
end Behavioral;







