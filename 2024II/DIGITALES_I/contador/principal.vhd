-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i 	:  in std_logic;
		XA_o         : out std_logic_vector(3 downto 0);
		XB_o         : out std_logic_vector(3 downto 0);
		XC_o         : out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

component contador is
	port 
	(
		R_i, clk_i 	:  in std_logic;
		R_o			: out	std_logic;
		X_o         : out std_logic_vector(3 downto 0)
	);
end component;


signal R : std_logic:='0';
signal R1 : std_logic:='0';
signal R2 : std_logic:='0';
signal R3 : std_logic:='0';

signal X : std_logic_vector(3 downto 0):="0000";

signal XA : std_logic_vector(3 downto 0):="0000";
signal XB : std_logic_vector(3 downto 0):="0000";
signal XC : std_logic_vector(3 downto 0):="0000";

begin

	C1: contador port map
	(
		R_i	=> R, 
		clk_i => clk_i,	
		R_o	=> R1,		
		X_o   => XA        
	);

	C2: contador port map
	(
		R_i	=> R, 
		clk_i => R1,	
		R_o	=> R2,		
		X_o   => XB        
	);
	
	C3: contador port map
	(
		R_i	=> R, 
		clk_i => R2,	
		R_o	=> R3,		
		X_o   => XC        
	);

R <= '1' when XA = "0001" and XB = "1000" and XC = "0011" else '0';  	

XA_o <= XA; 
XB_o <= XB;
XC_o <= XC;	
end Behavioral;
