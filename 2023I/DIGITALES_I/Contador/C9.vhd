-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity C9 is
	port 
	(
		clk_i       :  in std_logic;
		T_i         :  in std_logic;
		reset_o 		: out std_logic;
		contador_o  : out std_logic_vector(3 downto 0)
	);
end C9;

architecture Behavioral of C9 is

component FFTR is
	port 
	(
		clk_i, T_i, R_i	: in 		std_logic;
		Q_o					: out		std_logic
	);
end component;

signal wire  : std_logic_vector(3 downto 0) := "0000";
signal reset : std_logic := '0' ;

begin

	FFA: FFTR port map
		(
			clk_i => clk_i, 
			T_i   =>   T_i, 
			R_i   => reset,	
			Q_o   => wire(0)					
		);

	FFB: FFTR port map
		(
			clk_i => wire(0), 
			T_i   =>   T_i, 
			R_i   => reset,	
			Q_o   => wire(1)					
		);	
	FFC: FFTR port map
		(
			clk_i => wire(1), 
			T_i   =>   T_i, 
			R_i   => reset,	
			Q_o   => wire(2)					
		);
	FFD: FFTR port map
		(
			clk_i => wire(2), 
			T_i   =>   T_i, 
			R_i   => reset,	
			Q_o   => wire(3)					
		);	

-- 10 : 1010
		
Reset <= wire(3) and (not(wire(2))) and wire(1) and (not(wire(0)));

Reset_o 		<= Reset;
Contador_o 	<= wire;
		
end Behavioral;








