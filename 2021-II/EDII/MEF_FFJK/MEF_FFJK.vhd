library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEF_FFJK is
    Port ( X_i 		 : in STD_LOGIC;
           clk_i 	 : in STD_LOGIC;
           A_o,B_o : out STD_LOGIC);
end MEF_FFJK;

architecture Behavioral of MEF_FFJK is

component FFJK is
    Port ( J,K : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q_o : out STD_LOGIC);
end component;

signal JsA : std_logic :='0';
signal KsA : std_logic :='0';
signal JsB : std_logic :='0';
signal KsB : std_logic :='0';

signal A : std_logic :='0';
signal B : std_logic :='0';

begin

JsA <= B and x_i;
KsA <= not x_i;

JsB <= x_i;
KsB <= (not (A)) or (not (x_i));

FFJK0: FFJK port map
		(
			J  	=> JsA	,
			K    	=>	KsA	,
         clk  	=>	clk_i	,
         Q_o	=>	A
		);

FFJK1: FFJK port map
		(
			J  	=> JsB	,
			K    	=>	KsB	,
         clk  	=>	clk_i	,
         Q_o	=>	B
		);		

A_o <= A;
B_o <= B;	

end Behavioral;