-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		R_o   : out std_logic;
		contador9_o 	: out std_logic_vector(3 downto 0);
		contador5_o 	: out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

component C9 is
	port 
	(
		clk_i 		: in std_logic;
		contador_o 	: out std_logic_vector(3 downto 0);
		R_o			: out std_logic
	);
end component;

component C5 is
	port 
	(
		clk_i 		: in std_logic;
		contador_o 	: out std_logic_vector(3 downto 0);
		R_o			: out std_logic
	);
end component;

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

signal RA : std_logic:= '0';
signal RB : std_logic:= '0';
signal clk_dv : std_logic:= '0';

begin

	clk_div: clk port map
	(
		clk_i 		=>		 clk_i,
		clk_div_o	=> 	clk_dv
	);

	CONT_9: C9 port map 
	(
		     clk_i  =>      clk_dv,  		
		contador_o  => contador9_o,	 
		       R_o 	=>			   RA		
	);

	CONT_5: C5 port map 
	(
		     clk_i  =>          RA,  		
		contador_o  => contador5_o,	 
		       R_o 	=>			   RB		
	);

R_o <= RA;
	
end Behavioral;



