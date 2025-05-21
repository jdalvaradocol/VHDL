-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, x_i 	: in  std_logic;
		salida_o		: out	std_logic_vector(2 downto 0)
	);
end principal;


architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component FFT is
	port 
	(
		clk_i, T_i 	: in 	std_logic;
		Q_o			: out	std_logic
	);
end component;

signal Tsa : std_logic:='0';
signal Tsb : std_logic:='0';
signal Tsc : std_logic:='0';

signal A : std_logic:='0';
signal B : std_logic:='0';
signal C : std_logic:='0';

signal clk_dv : std_logic:='0';

begin
	
	clk_div : clk port map
	(
		    clk_i =>  clk_i,
		clk_div_o => clk_dv
	);

	FF1: FFT port map
	(
		clk_i => clk_dv,
		  T_i =>    Tsa,
		  Q_o =>      A
	); 

	FF2: FFT port map
	(
		clk_i => clk_dv,
		  T_i =>    Tsb,
		  Q_o =>      B
	); 
	
	FF3: FFT port map
	(
		clk_i => clk_dv,
		  T_i =>    Tsc,
		  Q_o =>      C
	); 

Tsa <= (not(B) and not(C) and not(X_i)) or
		 (   (B) and    (C) and    (X_i));
		
Tsb <= (not(C) and not(X_i)) or
		 (   (C) and    (X_i));
	
Tsc <= '1';	

salida_o <= A & B & C;	
	
end Behavioral;



