-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador5 is
	port 
	(
		clk_i :  in std_logic;
	    RS_o	: out std_logic;
		  Q_o	: out	std_logic_vector(3 downto 0)
	);
end contador5;

architecture Behavioral of contador5 is

component FFTR is
	port 
	(
		T_i, R_i, clk_i	:  in std_logic;
						Q_o	: out std_logic 		
	);
end component;

signal R	: std_logic := '0';
signal Q	: std_logic_vector(3 downto 0):= "0000";

begin

	FFA :  FFTR port map
	(
		  T_i =>   '1', 
		  R_i =>     R, 
		clk_i	=> clk_i,
		  Q_o	=>  Q(0)		
	);


	FFB :  FFTR port map
	(
		  T_i =>  '1', 
		  R_i =>    R, 
		clk_i	=> Q(0),
		  Q_o	=> Q(1)		
	);	
	
	FFC :  FFTR port map
	(
		  T_i =>  '1', 
		  R_i =>    R, 
		clk_i	=> Q(1),
		  Q_o	=> Q(2)		
	);	
	
	FFD :  FFTR port map
	(
		  T_i =>  '1', 
		  R_i =>    R, 
		clk_i	=> Q(2),
		  Q_o	=> Q(3)		
	);	

-- 0110	
R <= 	not(Q(3)) and Q(2) and Q(1) and not(Q(0));

Q_o <= Q;
RS_o <= R;
	
end Behavioral;
