-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFJK is
	port 
	(
		clk_i, x_i	: in std_logic ;
		clk_o, y_o	: out std_logic ;
		salida_o 	: out std_logic_vector(1 downto 0)
	);
end MEF_FFJK;

architecture Behavioral of MEF_FFJK is

signal JA, KA, JB, KB, A, B, clk_div_m : std_logic:= '0';

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

	FFJKA: entity work.FFJK port map
	(
		J_i    => JA,
		K_i    => KA,
		clk_i  => clk_div_m,
      Q_o    => A
	);

	FFJKB: entity work.FFJK port map
	(
		J_i    => JB,
		K_i    => KB,
		clk_i  => clk_div_m,
      Q_o    => B
	);

JA <= B and X_i;
KA <= not X_i;

JB <= X_i;
KB <= (not(A)) or (not(X_i));

y_o <= not B;
salida_o <= B & A;
clk_o <= clk_div_m;


end Behavioral;

