-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i        :  in std_logic;
		T_i          :  in std_logic;
		contadorA_o  : out std_logic_vector(3 downto 0);
		contadorB_o  : out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

component C9 is
	port 
	(
		clk_i       :  in std_logic;
		T_i         :  in std_logic;
		reset_o 		: out std_logic;
		contador_o  : out std_logic_vector(3 downto 0)
	);
end component;

component C5 is
	port 
	(
		clk_i       :  in std_logic;
		T_i         :  in std_logic;
		reset_o 		: out std_logic;
		contador_o  : out std_logic_vector(3 downto 0)
	);
end component;

signal clk_wire : std_logic := '0' ;
signal resetB   : std_logic := '0' ;
signal resetA   : std_logic := '0' ;

begin

	clk_div: clk port map
		(
			clk_i 	 =>	clk_i,
			clk_div_o =>	clk_wire	
		);
	
	CONTADOR9: C9 port map
		(
			clk_i       => clk_wire,
			T_i         =>   T_i,
			reset_o 		=> resetB,
			contador_o  => contadorB_o
		);

	CONTADOR5: C5 port map
		(
			clk_i       => resetB,
			T_i         =>   T_i,
			reset_o 		=> resetA,
			contador_o  => contadorA_o
		);		

end Behavioral;








