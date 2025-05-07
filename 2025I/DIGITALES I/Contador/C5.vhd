-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity C5 is
	port 
	(
		clk_i 		: in std_logic;
		contador_o 	: out std_logic_vector(3 downto 0);
		R_o			: out std_logic

	);
end C5;


architecture Behavioral of C5 is

component FFTR is 
	port 
	(
		clk_i, T_i, R_i 	:  in std_logic;
		Q_o					: out std_logic 
	);
end component;

signal contador : std_logic_vector(3 downto 0):= "0000";
signal        R : std_logic:= '0';


begin

	B0:  FFTR port map 
	(
		clk_i =>       clk_i, 
		  T_i =>         '1',
		  R_i =>           R,
		  Q_o => contador(0)
	);

	B1:  FFTR port map 
	(
		clk_i => contador(0), 
		  T_i =>         '1',
		  R_i =>           R,
		  Q_o => contador(1)
	);

	B2:  FFTR port map 
	(
		clk_i => contador(1), 
		  T_i =>         '1',
		  R_i =>           R,
		  Q_o => contador(2)
	);	
	
	B3:  FFTR port map 
	(
		clk_i => contador(2), 
		  T_i =>         '1',
		  R_i =>           R,
		  Q_o => contador(3)
	);

-- 0110	
		
R <= 	not (contador(0)) and
		    (contador(1)) and
			 (contador(2)) and
		not (contador(3)) ;

R_o <= R;			
contador_o <= contador;
		
end Behavioral;