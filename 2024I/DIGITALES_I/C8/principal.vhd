-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i			:  in std_logic;
		contadorA_o	: out std_logic_vector(3 downto 0);
		contadorB_o	: out std_logic_vector(3 downto 0);
		contadorC_o	: out std_logic_vector(3 downto 0);
		contadorD_o	: out std_logic_vector(3 downto 0);
		contadorE_o	: out std_logic_vector(3 downto 0);
		contadorF_o	: out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal clk_dv	 : std_logic := '0'; 
signal RA 		 : std_logic := '0'; 
signal RB 		 : std_logic := '0'; 

begin

	clk_div: entity work.clk port map
	(
		clk_i 	 =>  clk_i,
		clk_div_o => clk_dv
	);

	C9: entity work.Contador9 port map
	(
		clk_i			=>      clk_dv,
		contador_o	=> contadorA_o,
		R_o			=>          RA			
	);

	
	C5: entity work.Contador5 port map
	(
		clk_i			=>       	RA,
		contador_o	=> contadorB_o,
		R_o			=>          RB			
	);
	
end Behavioral;
