-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		salida_A_o, salida_B_o, salida_C_o : out std_logic_vector(6 downto 0)
	);
end principal;


architecture Behavioral of principal is

component decodificador_A is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end component;

component decodificador_B is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end component;

component decodificador_C is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		decodificador_o : out std_logic_vector(6 downto 0)
	);
end component;


begin

	D0: decodificador_A port map 
			(
						entrada_i => entrada_i,
				decodificador_o => salida_A_o
			); 

	D1: decodificador_B port map 
			(
						entrada_i => entrada_i,
				decodificador_o => salida_B_o
			); 
	
	D2: decodificador_C port map 
			(
						entrada_i => entrada_i,
				decodificador_o => salida_C_o
			); 	
end Behavioral;






