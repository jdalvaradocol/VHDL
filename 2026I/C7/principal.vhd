-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		contador5_o : out std_logic_vector(3 downto 0); 
		contador9_o	: out std_logic_vector(3 downto 0)
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
		clk_i	     : in std_logic;
		R_o	     : out std_logic;
		contador_o : out std_logic_vector(3 downto 0)
	);
end component;

component contador5 is
	port 
	(
		clk_i	     : in std_logic;
		R_o	     : out std_logic;
		contador_o : out std_logic_vector(3 downto 0)
	);
end component;

signal      R9 : std_logic:='0';
signal      R5 : std_logic:='0';
signal clk_div : std_logic:='0';


begin

	reloj: clk port map
	(
		clk_i 	 => clk_i,
		clk_div_o => clk_div
	);

	UNIDAD: contador9 port map
	(
		clk_i	     =>       clk_div,
		R_o	     =>	        R9,
		contador_o => contador9_o
	);

	DECENA: contador5 port map
	(
		clk_i	     =>          R9,
		R_o	     =>	        R5,
		contador_o => contador5_o
	);
	
end Behavioral;






