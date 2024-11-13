-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i 				:  in std_logic;
		XA_o, XB_o, XC_o  : out std_logic_vector(3 downto 0);
		DA_o, DB_o, DC_o	: out std_logic_vector(7 downto 0)
	);
end principal;

architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component decodificador is
	port 
	(
		BCD_i	:  in std_logic_vector(3 downto 0);
		X_o	: out	std_logic_vector(7 downto 0)
	);
end component;

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

signal clk_dv : std_logic:='0';


begin

	clk_div: clk port map
	(
		clk_i 		=> clk_i,
		clk_div_o   => clk_dv		
	);
	
	C1: contador port map
	(
		R_i	=> R, 
		clk_i => clk_dv,	
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
	
	D0: decodificador port map
	(
		BCD_i	=> XA, 
		  X_o => DA_o
	);
	
	D1: decodificador port map
	(
		BCD_i	=> XB, 
		  X_o => DB_o
	);
	
	D2: decodificador port map
	(
		BCD_i	=> XC, 
		  X_o => DC_o
	);

R <= '1' when XA = "0001" and XB = "1000" and XC = "0011" else '0';  	

XA_o <= XA; 
XB_o <= XB;
XC_o <= XC;	

end Behavioral;
