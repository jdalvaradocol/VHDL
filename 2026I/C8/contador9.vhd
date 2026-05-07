-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador9 is
	port 
	(
		clk_i : in std_logic;
		R_o	: out std_logic;
		contador_o : out std_logic_vector(3 downto 0) 
	);
end contador9;

architecture Behavioral of contador9 is

component FFT is
	port 
	(
		clk_i, T_i, R_i : in std_logic;
		Q_o				 : out std_logic
	);
end component;

signal reset : std_logic:= '0';
signal contador : std_logic_vector(3 downto 0):= "0000"; 

begin
	
	FFD: FFT port map
	(
		clk_i =>	clk_i, 
		T_i	=>	  '1', 
		R_i   =>	 reset,	
		Q_o   =>	contador(0)	
	);
	
	FFC: FFT port map
	(
		clk_i =>	contador(0), 
		T_i	=>	  		  '1', 
		R_i   =>	      reset,	
		Q_o   =>	contador(1)	
	);
	
	FFB: FFT port map
	(
		clk_i =>	contador(1), 
		T_i	=>	  		  '1', 
		R_i   =>	      reset,	
		Q_o   =>	contador(2)	
	);

	FFA: FFT port map
	(
		clk_i =>	contador(2), 
		T_i	=>	  		  '1', 
		R_i   =>	      reset,	
		Q_o   =>	contador(3)	
	);

	reset <= '1' when contador = "1010" else '0';
	
	contador_o <= contador;
	R_o <= reset;
	
end Behavioral;
