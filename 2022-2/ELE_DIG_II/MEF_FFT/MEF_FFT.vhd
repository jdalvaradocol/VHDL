-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFT is
	port 
	(
		clk_i, x_i : in std_logic;
		       y_o : out std_logic;
		  salida_o : out std_logic_vector(1 downto 0)
	);
end MEF_FFT;

architecture Behavioral of MEF_FFT is

signal A, B, TA, TB : std_logic:='0';
signal dato : std_logic_vector(2 downto 0):= "000";

begin

	FFA: entity work.FFT port map
	(
		clk_i => clk_i, 
		  T_i =>    TA,  
		  Q_o =>     A
	);

	FFB: entity work.FFT port map
	(
		clk_i => clk_i, 
		  T_i =>    TB,  
		  Q_o =>     B
	);

dato <= A & B & x_i;	
	
TA <= '1' when dato = "011" else  
		'1' when	dato = "100" else  
		'1' when	dato = "110" else '0'; 

TB <= '0' when ( dato = "000"  or 
					  dato = "100"  or 
					  dato = "111" ) else '1'; 					

y_o <= not B;					  
salida_o <= A & B;			
			
end Behavioral;


