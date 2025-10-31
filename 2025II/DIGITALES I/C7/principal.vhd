	-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		contador4_o, contador9_o : out std_logic_vector(3 downto 0);
		reset_o : out std_logic_vector(1 downto 0)
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
			    R_i : in std_logic;
		contador_o : out std_logic_vector(3 downto 0);
		       R_o : out std_logic 
	);
end component;

component contador4 is
	port 
	(
		     clk_i : in std_logic;
		contador_o : out std_logic_vector(3 downto 0);
		       R_o : out std_logic 
	);

end component;

signal clk_div : std_logic:= '0';
signal reset : std_logic_vector(1 downto 0):= "00";
signal reset43 : std_logic:= '0';
signal contador4s : std_logic_vector(3 downto 0):= "0000";
signal contador9s : std_logic_vector(3 downto 0):= "0000";

begin
	
	clkdiv: clk port map
	(
		clk_i 		=> clk_i, 	
		clk_div_o 	=> clk_div	
	);
	
	
	CONT9 : contador9 port map 
	(
		clk_i			=> clk_div,
		R_i         => reset43, 
		contador_o  => contador9s, 
		R_o         => reset(0)
	);

	CONT4 : contador4 port map 
	(
		clk_i			=> reset(0),
		contador_o  => contador4s, 
		R_o         => reset(1)
	);
	
	reset43 <= '1' when contador9s = "0100" and contador4s = "0100"
					else '0';

	reset_o <= reset;
	
	contador9_o <= contador9s;	
	contador4_o <= contador4s;	
		
end Behavioral;




