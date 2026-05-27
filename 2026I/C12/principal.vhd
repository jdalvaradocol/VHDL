-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i,  X_i :  in std_logic;
		salida_o		: out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

component FFT is
	port 
	(
		clk_i, T_i : in std_logic;
		Q_o		  : out std_logic
	);
end component;

signal TA, TB, TC : std_logic:= '0';
signal  A,  B,  C : std_logic:= '0';
signal estado 		: std_logic_vector(3 downto 0);

begin

	FFA: FFT port map 
	(
		clk_i	=>	clk_i, 
		T_i	=>    TA, 
		Q_o	=>     A
	);
	

	FFB: FFT port map 
	(
		clk_i	=>	clk_i, 
		T_i	=>    TB, 
		Q_o	=>     B
	);

	FFC: FFT port map 
	(
		clk_i	=>	clk_i, 
		T_i	=>    TC, 
		Q_o	=>     C
	);
	
	estado <= A & B & C & X_i;
	
	-- 5 6 8 9 11 12 13 14
	
	TA <=  '1' when estado = "0101" else 
			 '1' when estado = "0110" else
			 '1' when estado = "1000" else
			 '1' when estado = "1001" else
			 '1' when estado = "1011" else
			 '1' when estado = "1100" else
			 '1' when estado = "1101" else
			 '1' when estado = "1110" else '0';
	
	-- 0 1 2 3 6 10 11 15
		 
	TB <=  '1' when estado = "0000" else 
			 '1' when estado = "0001" else
			 '1' when estado = "0010" else
			 '1' when estado = "0011" else
			 '1' when estado = "0110" else
			 '1' when estado = "1010" else
			 '1' when estado = "1011" else
			 '1' when estado = "1111" else '0';		 
	
	-- 2 3 4 5 7 14
		 
	TC <=  '1' when estado = "0010" else 
			 '1' when estado = "0011" else
			 '1' when estado = "0100" else
			 '1' when estado = "0101" else
			 '1' when estado = "0111" else
			 '1' when estado = "1110" else '0';
		
	salida_o <= A & B & C;
		
end Behavioral;






