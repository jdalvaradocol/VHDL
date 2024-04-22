-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		salida_A_o : out std_logic_vector(6 downto 0);
		salida_B_o : out std_logic_vector(6 downto 0);
 		salida_C_o : out std_logic_vector(6 downto 0)

	);
end principal;

architecture Behavioral of principal is

component deco_logic is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end component;

component deco_exp1 is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end component;

component deco_exp2 is
	port 
	(
		entrada_i :  in std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(6 downto 0)
	);
end component;

begin

	D1: deco_logic port map
	(
		entrada_i => entrada_i,
		salida_o  => salida_A_o
	);

	D2: deco_exp1 port map
	(
		entrada_i => entrada_i,
		salida_o  => salida_B_o
	);

	D3: deco_exp2 port map
	(
		entrada_i => entrada_i,
		salida_o  => salida_C_o
	);
	
end Behavioral;









