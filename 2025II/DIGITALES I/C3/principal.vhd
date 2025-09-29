-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		salida_A_o : out std_logic_vector(6 downto 0);  
		salida_B_o : out std_logic_vector(6 downto 0);  
		salida_C_o : out std_logic_vector(6 downto 0)  		
	);
end principal;

architecture Behavioral of principal is

component deco_logico is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end component;

component deco_condicional is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end component;

component deco_when is
	port 
	(
		entrada_i :  in std_logic_vector (3 downto 0);
		 salida_i : out std_logic_vector (6 downto 0)
	);
end component;

begin

	decoA : deco_logico port map
	(
		entrada_i => entrada_i,
		salida_i  => salida_A_o
	);

	decoB : deco_when port map
	(
		entrada_i => entrada_i,
		salida_i  => salida_B_o
	);

	decoC : deco_condicional port map
	(
		entrada_i => entrada_i,
		salida_i  => salida_C_o
	);	

	
end Behavioral;




