-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF_FFD is
	port 
	(
		X_i, clk_i  : in  std_logic;
		Y_o		   : out std_logic_vector(2 downto 0);
		E_o		   : out std_logic_vector(1 downto 0)
	);
end MEF_FFD;

architecture Behavioral of MEF_FFD is

signal FB, FA, A, B : std_logic:= '0';	

begin

	FFD_A: entity work.FFD port map
	(
		clk_i 	=> clk_i,
		D_i		=>	FA,	
		Q_o		=>	A
	);

	FFD_B: entity work.FFD port map
		(
			clk_i 	=> clk_i,
			D_i		=>	FB,	
			Q_o		=>	B
		);

FA <= (not(A) and not(B) and     (X_i)) or 
	   (not(A) and    (B) and not (X_i)) or
	   (   (A) and    (B) and     (X_i)) or
	   (   (A) and not(B) and not (X_i)) ;

FB <= not B;

E_o(0) <= B;
E_o(1) <= A;

Y_o(0) <= not(A) and not(B); 
Y_o(1) <= B;
Y_o(2) <= A;

end Behavioral;




