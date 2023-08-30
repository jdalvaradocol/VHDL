-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFD is
	port 
	(
		clk_i, x_i 	: in std_logic;
	   y_o 			: out std_logic;
		Salida_o   	: out std_logic_vector(1 downto 0)
	);
end MEF_FFD;

architecture Behavioral of MEF_FFD is

signal FA, FB, A, B : std_logic:= '0';

begin

	FFD_FA: entity work.FFD port map
	(
		clk_i => clk_i,
		D_i   => FA,
		Q_o	=> A
	);

	FFD_FB: entity work.FFD port map
	(
		clk_i => clk_i,
		D_i   => FB,
		Q_o	=> B
	);
	
FA <= (A and x_i) or (B and x_i); 
FB <= (A and x_i) or (not(B) and x_i); 
y_o <= not B;

salida_o <= A & B;

end Behavioral;

