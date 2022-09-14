-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFD is
	port 
	(
		clk_i, x_i 	: in std_logic;
	   y_o 			: out std_logic;
		clk_o 		: out std_logic;
		Salida_o   	: out std_logic_vector(1 downto 0)
	);
end MEF_FFD;

architecture Behavioral of MEF_FFD is

signal FA, FB, A, B, clk_div_m : std_logic:= '0';

begin

	clk: entity work.clk_div generic map
	(
		DIV_TICKS => 50e6
	)	
	port map
	(
		clk_i => clk_i,
		clk_o => clk_div_m
	);

	FFD_FA: entity work.FFD port map
	(
		clk_i => clk_div_m,
		D_i   => FA,
		Q_o	=> A
	);

	FFD_FB: entity work.FFD port map
	(
		clk_i => clk_div_m,
		D_i   => FB,
		Q_o	=> B
	);
	
FA <= (A and x_i) or (B and x_i); 
FB <= (A and x_i) or (not(B) and x_i); 

clk_o    <= clk_div_m;
y_o      <= not B;
salida_o <= B & A;


end Behavioral;

