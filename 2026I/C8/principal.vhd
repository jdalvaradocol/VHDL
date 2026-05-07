-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		contador9_o : out std_logic_vector(3 downto 0);
		contador5_o : out std_logic_vector(3 downto 0)	
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
		clk_i : in std_logic;
		R_o	: out std_logic;
		contador_o : out std_logic_vector(3 downto 0) 
	);
end component;

component contador5 is
	port 
	(
		clk_i : in std_logic;
		R_o	: out std_logic;
		contador_o : out std_logic_vector(3 downto 0) 
	);
end component;

signal Reset9 : std_logic:= '0';  
signal Reset5 : std_logic:= '0';  
signal clk_div : std_logic:= '0';  

begin
	
	reloj: clk port map
	(
		clk_i			=> clk_i,
		clk_div_o   => clk_div
	);

	UNIDAD: contador9 port map 
	(
		clk_i			=> clk_div,
		R_o			=> Reset9,
		contador_o  => contador9_o
	);

	DECENA: contador5 port map 
	(
		clk_i			=>      Reset9,
		R_o			=>      Reset5,
		contador_o  => contador5_o
	);
	
end Behavioral;






