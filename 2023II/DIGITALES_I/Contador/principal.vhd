-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i 		: in 	std_logic;
		QU_o, QD_o	: out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component contador9 is
	port 
	(
		clk_i :  in std_logic;
	    RS_o	: out std_logic;
		  Q_o	: out	std_logic_vector(3 downto 0)
	);
end component;

component contador5 is
	port 
	(
		clk_i :  in std_logic;
	    RS_o	: out std_logic;
		  Q_o	: out	std_logic_vector(3 downto 0)
	);
end component;

signal R1 : std_logic := '0';
signal R2 : std_logic := '0';

signal clk_div : std_logic := '0';

begin

	div: clk port map
	( 
		clk_i 	 => clk_i,
		clk_div_o =>   clk_div
	);

	C9: contador9 port map 
	(
		clk_i =>  clk_div,
	    RS_o	=>	  R1,
		 Q_o	=>	QU_o
	);

	C5: contador5 port map 
	(
		clk_i => R1,
	    RS_o	=>	R2,
		 Q_o	=>	QD_o
	);

end Behavioral;


