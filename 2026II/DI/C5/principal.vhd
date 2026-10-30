-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

-- Contador 0 a 69
-- reset en 68

entity principal is
	port 
	(
		     clk_i	:	in	std_logic;
		contador6_o	:	out	std_logic_vector(2 downto 0);
		contador9_o	:	out	std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component contador_6 is
	port 
	(
		clk_i, R_i	:	in	std_logic;
		contador_o	:	out	std_logic_vector(2 downto 0);
				 R_o	:	out	std_logic
	);
end component;

component contador_9 is
	port 
	(
		clk_i, R_i	:	in	std_logic;
		contador_o	:	out	std_logic_vector(3 downto 0);
				 R_o	:	out	std_logic
	);
end component;

signal clk_div	:	std_logic := '0'; 	

signal	    R	:	std_logic := '0'; 	
signal	R_aux	:	std_logic := '0'; 	
signal	R_fin	:	std_logic := '0'; 	

signal	contador6	:	std_logic_vector(2 downto 0):="000";
signal	contador9	:	std_logic_vector(3 downto 0):="0000"; 	

begin

	clock_div: clk port map
	(
		clk_i			=> clk_i,  	
		clk_div_o   => clk_div
	);


	C9: contador_9 port map
	(
		clk_i			=>  	clk_div,
		R_i			=> 	  		R,
		contador_o	=>	 contador9,		
		R_o			=>  	  R_aux	
	);
		
	C6: contador_6 port map
	(
		clk_i			=>  	  R_aux,
		R_i			=> 	  	   R,
		contador_o	=>	 contador6,		
		R_o			=>  	  R_fin	
	);	

	-- Contador de 0 a 68 reset 69
	R <= '1' when (contador6 = "110" and contador9 = "1001") else '0';
	
	contador9_o <= contador9;
	contador6_o <= contador6;
	
end Behavioral;







