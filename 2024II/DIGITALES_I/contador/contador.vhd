-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port 
	(
		R_i, clk_i 	:  in std_logic;
		R_o			: out	std_logic;
		X_o         : out std_logic_vector(3 downto 0)
	);
end contador;

architecture Behavioral of contador is

component FFTTR is
	port 
	(
		T_i, R_i, clk_i 	:  in std_logic;
		Q_o					: out	std_logic
	);
end component;

signal R1 : std_logic:='0';
signal R2 : std_logic:='0';

signal X : std_logic_vector(3 downto 0):="0000";

begin

	B0: FFTTR port map
	(
		  T_i =>   '1', 
		  R_i =>    R2, 
		clk_i => clk_i,
		  Q_o =>  X(0)
	);  

	B1: FFTTR port map
	(
		  T_i =>  '1', 
		  R_i =>   R2, 
		clk_i => X(0),
		  Q_o => X(1)
	); 
	
	B2: FFTTR port map
	(
		  T_i => '1', 
		  R_i =>  R2, 
		clk_i => X(1),
		  Q_o => X(2)
	); 
	
	B3: FFTTR port map
	(
		  T_i => '1', 
		  R_i =>  R2, 
		clk_i => X(2),
		  Q_o => X(3)
	); 

-- 1010	

R1 <= (X(3) and not(X(2)) and X(1) and not(X(0)));
	
R2 <= R1 or R_i;

R_o <= R1;
X_o <= X;
	
end Behavioral;
