-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i : in std_logic;
				 Q_o : out std_logic_vector(2 downto 0)	
	);
end principal;

architecture Behavioral of principal is

component FFT is
	port 
	(
		T_i, clk_i	:  in std_logic;
				 Q_o	: out std_logic 		
	);
end component;

signal TSA : std_logic := '0';
signal TSB : std_logic := '0';
signal TSC : std_logic := '0';

signal A : std_logic := '0';
signal B : std_logic := '0';
signal C : std_logic := '0';



begin

	FFTA : FFT port map
	(
		clk_i => clk_i, 
		T_i   => TSA, 
		Q_o	=> A
	);

	FFTB : FFT port map
	(
		clk_i => clk_i, 
		T_i   => TSB, 
		Q_o	=> B
	);

	FFTC : FFT port map
	(
		clk_i => clk_i, 
		T_i   => TSC, 
		Q_o	=> C
	);

TSA <= (not(B) and not(C) and not(X_i)) or (B and C and X_i);	
TSB <= (           not(C) and not(X_i)) or (      C and X_i);	
TSC <= '1';	

Q_o <= A & B & C;
	
end Behavioral;









