	-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		contador5_o, contador9_o : out std_logic_vector(3 downto 0);
		reset_o : out std_logic_vector(1 downto 0)
	);
end principal;

architecture Behavioral of principal is

component contador9 is
	port 
	(
		     clk_i : in std_logic;
		contador_o : out std_logic_vector(3 downto 0);
		       R_o : out std_logic 
	);
end component;

component contador5 is
	port 
	(
		     clk_i : in std_logic;
		contador_o : out std_logic_vector(3 downto 0);
		       R_o : out std_logic 
	);
end component;

signal reset : std_logic_vector(1 downto 0):= "00";

begin
	
	CONT9 : contador9 port map 
	(
		clk_i			=>  clk_i,
		contador_o  => contador9_o, 
		R_o         => reset(0)
	);

	CONT5 : contador5 port map 
	(
		clk_i			=> reset(0),
		contador_o  => contador5_o, 
		R_o         => reset(1)
	);

	reset_o <= reset;
	
end Behavioral;




